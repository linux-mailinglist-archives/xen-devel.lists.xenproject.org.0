Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF52879286
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:54:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691763.1078079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzmJ-00053P-7E; Tue, 12 Mar 2024 10:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691763.1078079; Tue, 12 Mar 2024 10:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzmJ-00050r-46; Tue, 12 Mar 2024 10:54:39 +0000
Received: by outflank-mailman (input) for mailman id 691763;
 Tue, 12 Mar 2024 10:54:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ck+k=KS=bounce.vates.tech=bounce-md_30504962.65f0346a.v1-961122f0e583439a882819f01af904d9@srs-se1.protection.inumbo.net>)
 id 1rjzmH-0004oA-8q
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:54:37 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea2a80a0-e05e-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 11:54:36 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Tv9WZ2MMWz1XLHZ5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 10:54:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 961122f0e583439a882819f01af904d9; Tue, 12 Mar 2024 10:54:34 +0000
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
X-Inumbo-ID: ea2a80a0-e05e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710240874; x=1710501374;
	bh=GPUGNz2EdLG3eEvQvpjnh9pHYV61KnZ992OYDytpauk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yp01VWKAmEUohjmWXnJYbq19Lng5USxZBShvvFm7oy64lOk4/m7uLiFo12IQUrmwZ
	 I0WKy4BMx9PfHHD2cwHYjWHCt80nBhRlc4tB2z5YWbtC2u+NuchOH5fHa0ALrhOEoN
	 vHHv5zIyuBvrYD7NAMJaTMhxFcmvjm/ylBaRKHUayEdqc/mUXGPuPxIUrR0cDdieos
	 UuMoxzHXDWT80Itf6Zy3F86DvA0VFcwuBbkKvUl2GgrKdzLaBpURrIzoIYnLt5vY6k
	 WhldQVckKQawLDUUB8VdPI/rItSvzbOYRa6/CS2JUJ+ESQUfvDAgnXsX/nDvC2mKRb
	 HGTHY7VgVbC/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710240874; x=1710501374; i=vaishali.thakkar@vates.tech;
	bh=GPUGNz2EdLG3eEvQvpjnh9pHYV61KnZ992OYDytpauk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aY166ExxRJ1OdLD44rCMbVz7rWrv85o80JUiSefn2tFavdggDatS4NUqvznQ0apAV
	 Sej1NaFSJK4/r2Efy5MPyXVAF8VawXPJ86afrmON2gsuDrNeSI0l3NWo7780YkglYM
	 80jnAceQnhMCc57YRRmvaS3jt6r4tc1xxM6Q2SEKh+SEu1rRRFTczjEPfucOz7w3zG
	 ip7rqZfZltEZuTq6Ax0RovLmi6H5nQQGRkPs9zFMzNRhU3E6OkDJmTXeleo0dAYbKO
	 zuueQCdpG2kC4E3IG/5tsZDnCTNbErOQF8dgMoDeORLVA0dl2bvGnugM1oPjPHSzSS
	 kur/AIWOKoEaQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=201/3]=20x86/svm:=20Drop=20the=20=5Fenabled=20suffix=20from=20vmcb=20bits?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710240873145
Message-Id: <eb559e71-ceaa-4adf-96e5-d9901852de32@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech> <8e6d8cac54ca05f1202580b574c548e08988d8f6.1710149462.git.vaishali.thakkar@vates.tech> <1c67a337-e9d5-4e4a-91d5-3c935c410cda@suse.com> <5dd4007d-f273-4e43-add6-a77f0459fc33@vates.tech> <117de48d-0193-4b59-961b-33c80354726c@suse.com>
In-Reply-To: <117de48d-0193-4b59-961b-33c80354726c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.961122f0e583439a882819f01af904d9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240312:md
Date: Tue, 12 Mar 2024 10:54:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/24 11:49, Jan Beulich wrote:
> On 12.03.2024 11:00, Vaishali Thakkar wrote:
>> On 3/12/24 08:54, Jan Beulich wrote:
>>> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>>> @@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        if ( nestedhvm_paging_mode_hap(v) )
>>>>        {
>>>>            /* host nested paging + guest nested paging. */
>>>> -        n2vmcb->_np_enable = 1;
>>>> +        n2vmcb->_np = true;
>>>>    
>>>>            nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
>>>>    
>>>> @@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        else if ( paging_mode_hap(v->domain) )
>>>>        {
>>>>            /* host nested paging + guest shadow paging. */
>>>> -        n2vmcb->_np_enable = 1;
>>>> +        n2vmcb->_np = true;
>>>>            /* Keep h_cr3 as it is. */
>>>>            n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
>>>>            /* When l1 guest does shadow paging
>>>> @@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        else
>>>>        {
>>>>            /* host shadow paging + guest shadow paging. */
>>>> -        n2vmcb->_np_enable = 0;
>>>> +        n2vmcb->_np = false;
>>>>            n2vmcb->_h_cr3 = 0x0;
>>>>    
>>>>            /* TODO: Once shadow-shadow paging is in place come back to here
>>>> @@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>>>        }
>>>>    
>>>>        /* nested paging for the guest */
>>>> -    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
>>>> +    svm->ns_hap_enabled = ns_vmcb->_np;
>>>>    
>>>>        /* Remember the V_INTR_MASK in hostflags */
>>>>        svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
>>>> @@ -1084,7 +1084,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        if ( nestedhvm_paging_mode_hap(v) )
>>>>        {
>>>>            /* host nested paging + guest nested paging. */
>>>> -        ns_vmcb->_np_enable = n2vmcb->_np_enable;
>>>> +        ns_vmcb->_np = n2vmcb->_np;
>>>>            ns_vmcb->_cr3 = n2vmcb->_cr3;
>>>>            /* The vmcb->h_cr3 is the shadowed h_cr3. The original
>>>>             * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
>>>> @@ -1093,7 +1093,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        else if ( paging_mode_hap(v->domain) )
>>>>        {
>>>>            /* host nested paging + guest shadow paging. */
>>>> -        ns_vmcb->_np_enable = 0;
>>>> +        ns_vmcb->_np = false;
>>>>            /* Throw h_cr3 away. Guest is not allowed to set it or
>>>>             * it can break out, otherwise (security hole!) */
>>>>            ns_vmcb->_h_cr3 = 0x0;
>>>> @@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>>        else
>>>>        {
>>>>            /* host shadow paging + guest shadow paging. */
>>>> -        ns_vmcb->_np_enable = 0;
>>>> +        ns_vmcb->_np = false;
>>>>            ns_vmcb->_h_cr3 = 0x0;
>>>>            /* The vmcb->_cr3 is the shadowed cr3. The original
>>>>             * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
>>>
>>> While spotting the small issue below it occurred to me: Why is it that
>>> vmcb_set_...() is open-coded everywhere here? I think this would be
>>> pretty nice to avoid at the same time (for lines touched anyway, or in
>>> a separate prereq patch, or alternatively [and only ideally] for all
>>> other instances in a follow-on patch). Thoughts?
>>
>> Yes, I noticed this too. My plan was to send a followup patch for
>> fixing all the instances where vmcb_set/get_...() can be used.
>> There are bunch of other vmcb bits (apart from the ones being
>> handled in this patchset) in this file and in svm.c which can
>> benefit from using VMCB accessors.
> 
> To keep churn as well as effort to find commits touching individual lines
> low, doing the conversion when touching lines anyway is imo preferable. A
> follow-on patch can then convert what's left.

Alright, I'll replace open coding with VMCB accessors for the lines which 
are touched by this patchset. And others in a followup patchset.

> Jan

