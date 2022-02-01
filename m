Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E460D4A5C89
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 13:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263588.456341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsYR-0007OZ-AY; Tue, 01 Feb 2022 12:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263588.456341; Tue, 01 Feb 2022 12:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsYR-0007M3-7a; Tue, 01 Feb 2022 12:46:39 +0000
Received: by outflank-mailman (input) for mailman id 263588;
 Tue, 01 Feb 2022 12:46:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+T3c=SQ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nEsYQ-0006oT-OF
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 12:46:38 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdf73758-835c-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 13:46:37 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:55342)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nEsYO-000rPq-mX (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 01 Feb 2022 12:46:36 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C7F731FA79;
 Tue,  1 Feb 2022 12:46:35 +0000 (GMT)
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
X-Inumbo-ID: fdf73758-835c-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <012e4f44-aa1a-6bce-3d4c-21f234bc3fee@srcf.net>
Date: Tue, 1 Feb 2022 12:46:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-8-andrew.cooper3@citrix.com>
 <20220131153621.8863-1-andrew.cooper3@citrix.com>
 <00aa1f8a-9f2a-96f1-b088-e34c9ec76f3c@suse.com>
 <e48536c0-14c1-1d41-0a9e-4fc0f0aa9c36@citrix.com>
 <52587ee4-56a3-3824-75cd-667c35e3109f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <52587ee4-56a3-3824-75cd-667c35e3109f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/02/2022 12:40, Jan Beulich wrote:
> On 01.02.2022 13:28, Andrew Cooper wrote:
>> On 01/02/2022 11:47, Jan Beulich wrote:
>>> On 31.01.2022 16:36, Andrew Cooper wrote:
>>>> Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but guests
>>>> run with the logical OR of both values.  Therefore, in principle we want to
>>>> clear Xen's value before entering the guest.  However, for migration
>>>> compatibility,
>>> I think you've explained this to me before, but I can't seem to put
>>> all of it together already now. Could expand on how a non-zero value
>>> behind a guest's back can help with migration compatibility? At the
>>> first glance I would be inclined to say only what the guest actually
>>> gets to see and use can affect its migration.
>> For VMs which see VIRT_SPEC_CTRL (compatibility with Fam15 thru Zen1),
>> writes of VIRT_SPEC_CTRL.SSBD (probably) need to use
>> SSBD-behind-the-guest's back.  I say probably, because I think this is
>> the least bad implementation option, but until we have working support,
>> it's still a guess.
> So this is future work (and mentioning just this in the description
> would be enough to address my comment)

Near future, but yes.

> , but ...
>
>> For the ultra paranoid, a VM migrating in which can't see PSFD (e.g. for
>> compatibility with Zen2) should have PSFD set behind it's back.
> ... this is something we should be doing right away then?

Except for the second half of this paragraph which was an argument as to
why not.

What OSes expose to userspace for "I need speculative safety" works
whether the kernel can see PSFD or not.

~Andrew

