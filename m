Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A11DEC7F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 17:54:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc9zP-0003cu-Aq; Fri, 22 May 2020 15:53:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXvX=7E=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jc9zO-0003cj-6J
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 15:53:38 +0000
X-Inumbo-ID: 65a34e68-9c44-11ea-b07b-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65a34e68-9c44-11ea-b07b-bc764e2007e4;
 Fri, 22 May 2020 15:53:37 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:48624
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jc9zL-000TZn-Le (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 22 May 2020 16:53:35 +0100
Subject: Re: [PATCH] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1590097438-28829-1-git-send-email-igor.druzhinin@citrix.com>
 <20200522100846.GV54375@Air-de-Roger>
 <04ec4ab4-a121-c5be-0a65-316e237dd793@citrix.com>
 <20200522102339.GX54375@Air-de-Roger>
 <fe6e5c7f-df0f-5436-a7cd-2949464ab9a7@citrix.com>
 <20200522111146.GZ54375@Air-de-Roger>
 <4831dc51-cea1-2870-422b-2af7d6d1f2d6@suse.com>
 <ef3411ac-9e7c-0ef7-ad9f-c24f8ebf32a6@citrix.com>
 <20200522133259.GC54375@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <15036c44-640e-de1c-985b-b9c68592963f@citrix.com>
Date: Fri, 22 May 2020 16:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522133259.GC54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/05/2020 14:32, Roger Pau Monné wrote:
> On Fri, May 22, 2020 at 02:11:15PM +0100, Andrew Cooper wrote:
>> On 22/05/2020 14:04, Jan Beulich wrote:
>>> On 22.05.2020 13:11, Roger Pau Monné wrote:
>>>> That being said, I also don't like the fact that logdity is handled
>>>> differently between EPT and NPT, as on EPT it's handled as a
>>>> misconfig while on NPT it's handled as a violation.
>>> Because, well, there is no concept of misconfig in NPT.
>> Indeed.  Intel chose to split EPT errors into two - MISCONFIG for
>> structural errors (not present, or reserved bits set) and VIOLATION for
>> permissions errors.
>>
>> AMD reused the same silicon pagewalker design, so have a single
>> NPT_FAULT vmexit which behaves much more like a regular pagefault,
>> encoding structural vs permission errors in the error code.
> Maybe I should clarify, I understand that NPT doesn't have such
> differentiation regarding nested page table faults vs EPT, but I feel
> like it would be clearer if part of the code could be shared, ie:
> unify EPT resolve_misconfig and NPT do_recalc into a single function
> for example that uses the necessary p2m-> helpers for the differing
> implementations. I think we should be able to tell apart when a NPT
> page fault is a recalc one by looking at the bits in the EXITINFO1
> error field?

But they use fundamentally different mechanisms.

EPT uses an invalid caching type, while NPT sets the User bit (and even
this is going to have to change when we want to support GMET for Windows
VBS in the long term).

You could abstract a few things out into common logic, but none of the
bit positions match (not even the recalc software bit), and the result
would be more complicated than its current form.

~Andrew

