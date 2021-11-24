Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85B45CCAF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 20:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230539.398532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxYe-0004Zp-U1; Wed, 24 Nov 2021 19:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230539.398532; Wed, 24 Nov 2021 19:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxYe-0004Xm-QO; Wed, 24 Nov 2021 19:03:52 +0000
Received: by outflank-mailman (input) for mailman id 230539;
 Wed, 24 Nov 2021 19:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jHA0=QL=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mpxYd-0004XJ-Di
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 19:03:51 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4205b5fb-4d59-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 20:03:50 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:38880)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mpxYb-000aj2-nh (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 24 Nov 2021 19:03:49 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2FA4E1FDB0;
 Wed, 24 Nov 2021 19:03:49 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4205b5fb-4d59-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c22b2d35-7b72-3e44-ce92-2a3fab20af5e@srcf.net>
Date: Wed, 24 Nov 2021 19:03:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max
 policies
Content-Language: en-GB
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20211124161649.83189-1-roger.pau@citrix.com>
 <24990.26451.287618.213116@mariner.uk.xensource.com>
 <9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
 <24990.32581.766301.992950@mariner.uk.xensource.com>
 <471892da-6e64-2faa-3198-3859531c4d11@srcf.net>
 <24990.35845.537742.58478@mariner.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <24990.35845.537742.58478@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/11/2021 19:01, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies"):
>> It may revert cleanly, but it won't build because of the first hunk in
>> 81da2b544cbb00.  That hunk needs reverting too, because it too breaks
>> some cpuid= settings in VM config files.
> Would you be able to prepare the two-patch series (?) that does the
> necessary reverts ?

I'd do it as a single patch, but I can try to prepare one.

>> In principle, the *final* thing the toolstack should do, *for brand new
>> VMs only*, is a shrink of that form, but this depends on whole load more
>> toolstack work before it can be done safely.  There is a plan to fix
>> CPUID handling, in a safe way, and it is ongoing (subject to all the
>> security interruptions), but has a long way to go yet.
> For clarity: I think you are discussing future aspirations, which do
> not concern us for 4.16.

Correct.

~Andrew

