Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBF9D213CE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 21:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203846.1518831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg7ul-0003y0-Vm; Wed, 14 Jan 2026 20:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203846.1518831; Wed, 14 Jan 2026 20:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg7ul-0003v7-Se; Wed, 14 Jan 2026 20:56:27 +0000
Received: by outflank-mailman (input) for mailman id 1203846;
 Wed, 14 Jan 2026 20:56:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9Xr=7T=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vg7ul-0003v1-1A
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 20:56:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cbbc244-f18b-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 21:56:24 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 42CCB4EE3C1D;
 Wed, 14 Jan 2026 21:56:23 +0100 (CET)
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
X-Inumbo-ID: 7cbbc244-f18b-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768424183;
	b=TUN+L978NZJ09OBLpYrsWLLLXf9lpcLlLrkwiKdVK1BGgCAjTmQ27GlCuyqJ3t3oBEI8
	 IeHhviwhm6C2E40BrzDw1z72fF+fEMfZu9Y4AueQZvye2Z0CvEk6Os1CTJ08GEyLre2l4
	 xBSOBSiS7P/RsFpOHFPtISMUztAaq303ACBjE8oC9j/XPmhH1u4bkWgPX3qMiaYB5J9a6
	 NZ/lk2vUJu7Tzxr4NjV9UcGZS7+05gzdxCrrwf0pGf3OYcitYKfvfC3UCuLIpMKnRgvaT
	 MvrCRbssSgcrJeSbDhBHq+sRO/wD4OxxV+0bpfXEzF5Xg7hi/w8U2TRAI4V8YvFI/Fq5G
	 nqXXaL1VP/o9vxqEAdlHSBhRHQulyjh1IG7J9TfquXDDA+noqfKl32vNtuXVD7Xo4nt77
	 ubC/rHOdPFw2VRrrZEhUGXNrsAZApIOCSKnJDU8FE1DpGLrhMy5MPcHRlKSeTG69baVsd
	 5RpLzJb71m/3TSUCg/Ld0xUYjfhUUXmTT8hizjFk+bnKE/BVk3EuIZDJOX65QeKEtRAtK
	 RidqsUV4A/tX12h4GfAhE9dA1Bf2y8waRsdhRtQNyiEqNiJ3pfaz3YhocVYPf6+7GAg/d
	 O4iJdT5rmOJbvfHn/hdwuS0Acjqts5Vda//xC8km8nfi3k/PrsvcdkX+aDU4koU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768424183;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ntQkDCkn5ceckBt3E0faKoXB378Nkvml9jXdJFgGqf0=;
	b=o9oDRVk11tM0XLhGUtVnE6iSjV7dCdCzpiQRIx23aJS3g3wK3n+le+zNYjEA4ntWew7I
	 1v+OODyRFDhl1IrsqCqY7tL7Pd9H0yV0QVwpnoa75GpYPLCGc/u0dv1k+9f1S3PRD4mbh
	 jfUAEWWa3ivDx1pA3r+eEDivKnzAO5zIJFBupF4mZS/QemFAcATHCQoAcXswp4LvkIETt
	 f4+MDb6S1Q14IL5f11LsrA+i5VQvQq3m5gY1djB54PJ/5EsiujuGZoVvWw1kjM3TQ8sTj
	 zOf6w38MZeJuAOKFBouT3rRIwj5Jj3hK+6bV71WXM4LjsbCe0DmR69Wij4wCBkSAgeo+6
	 2g+D0wEMzZW+aRHba+97yH6Bxr3wb+PVZU2MVBfr4fcQlflqNNvIm4DbcTkIjw6MVYkqC
	 iyaIFRRGIx6nZCFgZIgV96wt+JLlI7iUa0d6fVlP63ujoYSWJ/jCVseyQGFVdWmXPsux8
	 A1GKHPjzNYURzTFSAIrH3a/9CHc/3wjMiNkz4sMeQ+SI9NEMDkBsVejSwcYtVf8RLnbq6
	 qUCAR/A2sHRbsZ1zD2IzuP4CFfACBCvZlKOiTSegw1e0dTUlpE+3bAGQCLiLqVc49kzTb
	 SzL9Ysd3Fqh211aNhyroWkNU5A2Ad5QJuu8vyK1mAsj8La+n3Ua2xUlOQuucDAc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:56:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] x86/mce: use offsetof to determine section offset
In-Reply-To: <87de17df-0aed-4ce1-b556-f93a381b66d3@amd.com>
References: <350bd19ec4b0b190911d748df6ec92c626e7151a.1768415160.git.nicola.vetrini@bugseng.com>
 <87de17df-0aed-4ce1-b556-f93a381b66d3@amd.com>
Message-ID: <a351802f6e1dff22f79cc7dbfd848aac@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-14 21:40, Jason Andryuk wrote:
> On 2026-01-14 13:27, Nicola Vetrini wrote:
>> There is no reason to use pointer difference.
>> A violation of MISRA C Rule 18.2 ("Subtraction between pointers
>> shall only be applied to pointers that address elements of the
>> same array") is also resolved because the object to the subtraction
>> is applied is not an array.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Found while randomly browsing violations of the rule on the 
>> allcode-x86_64 scan.
>> ---
>>   xen/arch/x86/cpu/mcheck/mce-apei.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/xen/arch/x86/cpu/mcheck/mce-apei.c 
>> b/xen/arch/x86/cpu/mcheck/mce-apei.c
>> index b89502088243..21aabe2027d0 100644
>> --- a/xen/arch/x86/cpu/mcheck/mce-apei.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
>> @@ -74,7 +74,8 @@ int apei_write_mce(struct mce *m)
>>   	rcd.hdr.record_id = cper_next_record_id();
>>   	rcd.hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
>>   -	rcd.sec_hdr.section_offset = (void *)&rcd.mce - (void *)&rcd;
>> +	rcd.sec_hdr.section_offset = offsetof(struct cper_mce_record, mce) -
>> +		                     offsetof(struct cper_mce_record, hdr);
> 
> "= offsetof(struct cper_mce_record, mce);" should be sufficient since 
> the offset of hdr is 0?

Yeah, makes sense. Given that the struct layout is coming from the UEFI 
spec it's not likely to change either.

> 
> Regards,
> Jason
> 
>>   	rcd.sec_hdr.section_length = sizeof(rcd.mce);
>>   	rcd.sec_hdr.revision = CPER_SEC_REV;
>>   	/* fru_id and fru_text is invalid */

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

