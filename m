Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283B67ECB9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 18:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485824.753229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLSpD-000315-Qx; Fri, 27 Jan 2023 17:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485824.753229; Fri, 27 Jan 2023 17:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLSpD-0002y8-OG; Fri, 27 Jan 2023 17:47:43 +0000
Received: by outflank-mailman (input) for mailman id 485824;
 Fri, 27 Jan 2023 17:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gttX=5Y=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pLSpC-0002y2-K1
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 17:47:42 +0000
Received: from ppsw-32.srv.uis.cam.ac.uk (ppsw-32.srv.uis.cam.ac.uk
 [131.111.8.132]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b03d4ddf-9e6a-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 18:47:39 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:45906)
 by ppsw-32.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pLSp7-000cJ7-Ay (Exim 4.96) (return-path <amc96@srcf.net>);
 Fri, 27 Jan 2023 17:47:37 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3DF701FB65;
 Fri, 27 Jan 2023 17:47:37 +0000 (GMT)
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
X-Inumbo-ID: b03d4ddf-9e6a-11ed-b8d1-410ff93cb8f0
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ef52740c-7352-84d3-248a-5aed6f076d6d@srcf.net>
Date: Fri, 27 Jan 2023 17:47:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
 <c39faba2-1ab6-71da-f748-1545aac8290b@suse.com>
 <d0a0960a-f110-c065-753d-9f000ca379a9@srcf.net>
 <0acfa717-8711-599f-4d29-d92a1466a1db@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 3/4] x86: limit issuing of IBPB during context switch
In-Reply-To: <0acfa717-8711-599f-4d29-d92a1466a1db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/01/2023 7:51 am, Jan Beulich wrote:
> On 26.01.2023 21:49, Andrew Cooper wrote:
>> On 25/01/2023 3:26 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -2015,7 +2015,8 @@ void context_switch(struct vcpu *prev, s
>>>  
>>>          ctxt_switch_levelling(next);
>>>  
>>> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
>>> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
>>> +             !(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) )
>>>          {
>>>              static DEFINE_PER_CPU(unsigned int, last);
>>>              unsigned int *last_id = &this_cpu(last);
>>>
>>>
>> The aforementioned naming change makes the (marginal) security hole here
>> more obvious.
>>
>> When we use entry-IBPB to protect Xen, we only care about the branch
>> types in the BTB.  We don't flush the RSB when using the SMEP optimisation.
>>
>> Therefore, entry-IBPB is not something which lets us safely skip
>> exit-new-pred-context.
> Yet what's to be my takeaway? You may be suggesting to drop the patch,
> or you may be suggesting to tighten the condition. (My guess would be
> the former.)

Well - the patch can't be committed in this form.

I haven't figured out if there is a nice way to solve this, so I'm
afraid I don't have a helpful answer to your question.  I think it is
reasonable to wait a bit and see if a solution comes to mind.

I'm not aversed in principle to having this optimisation (well - a
working version of it), but honestly, its marginal right now and it has
to be weighed against whatever extra complexity is required to not open
the security hole.


And FYI, this (general issue) was precisely why ended up not trying to
do this rearranging in XSA-407/422.  I almost missed this security hole
and acked the patch.

~Andrew

