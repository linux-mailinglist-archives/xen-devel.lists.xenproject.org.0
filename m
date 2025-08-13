Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19629B24305
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 09:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079516.1440344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um6Bk-00029D-1S; Wed, 13 Aug 2025 07:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079516.1440344; Wed, 13 Aug 2025 07:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um6Bj-00027m-V7; Wed, 13 Aug 2025 07:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1079516;
 Wed, 13 Aug 2025 07:46:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjcv=2Z=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1um6Bi-00027g-2O
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 07:46:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c14bd7-7819-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 09:46:16 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 13B474EE0744;
 Wed, 13 Aug 2025 09:46:15 +0200 (CEST)
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
X-Inumbo-ID: 97c14bd7-7819-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755071175;
	b=PB4FjyL2BvctdUBAi5Fs7hMp5gyw+vehuK2OFaKjWjp6oDGjBgoIFRsc/uCT7W2+3/YQ
	 ynN7v7pr+9CUJMKb2SqU/tpnHvDK4LA+7iSPbCgSWsYOwjahxYHpNAtFAhhaEKDIqiisM
	 9baqPcDIlV3vS9ursxGEJCcSnD0z4rDYxTESlV2z9Vd+odtgLO6xCOj4eD9inHOVtkvCt
	 7qE7QI3EDOqI2ttulloQifnb9ZsIcd1olsL1sq8MVaHdJ3Q4CF+X7CKpR7swn+UwY0YIj
	 79p7Eq5bMmfcBoz41wMqU6FsNRHSiKg/xMFxYc7hQ4WDAdu5dJ2CRnUSZXCfyN2IJUtCW
	 k5V5SZUkKvdqXjc6aPUV+tj07vx4biFidIOd9Tc4sux/IxTXKm92i3SVrn4+jDYSVD+u7
	 C46Cfa1cc75/xntixrVKG96P5RuJcw8hlA7+JELczVK19GROsXDvWrTUHO4757cMCRIRb
	 wyivRe7GxUb7hWTVfQo6hl+znHTDTPcam/BcPQT7WoFo7fZcJSPDOY3JCeRcHD4SnPBcN
	 O8IDgfIKKE+dCBf0cvtD6cEfXST0lBMeIBXJd8LtJkxBHfUlatHgzFcQCd3e3eK49tUBS
	 GIxqv425j9xM8cmQcacvjhShv0u5eS1HHJ+PlkHE58w1O0pImEfF9fmwzhcZ2x0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755071175;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=IceH9jgvg1rkJ87zGn2cVPQEpoJupWnjhBOLrNTzKqw=;
	b=G5j0naUYSpwRcqwGDz23NhlCGbUe5d9be1+GnKVfkF2N3K15jm+NJ9V85YZRcRf+ZInd
	 +QY4KEaW4Ou2lETo3s8D+hAjJGvYt1FpPBJikwdvwct+Y9inRiSAM5CUltWhIPRKv23cN
	 frCRPSm+oUYt4DjzAnwj7H7NCJy5mLqjhsu+S/B6LKUB5ivOVAQLFSGxbADx8zNF2ZdK+
	 /TjXec7KPJxIYcmv8Mzy6rlmLmdcn9kcAWX+SrC2FnytxXlrKvgtJsSLhWSgqLC79dNK3
	 8lkJ0rqhDEO1YESQFGCspgCUp5iV2G/RWZvRDkpDqO6DpXCcSE2tidbiM7k4wDPV3PPz/
	 uFA5lDzXA3TX8zIfRa8a35gnpKtwtn9FSN5c0bZZccpLc8Q5iHGgOXK90uc9LJujMuZx2
	 xck7mUwnwtYyqgUjXlk2yXC8dm5hLma8DPxkuUEs97laugVdvxGXBk1PYKSsSC/L9pR5P
	 hEd6lFTuxynkWgpLZF9/vQZLRNYPU+am0d9OdRyfjWBCRY9/ym73t3D2Aum0+weum3DoD
	 Y793Y3QZdfasMnjwSGLPnbAjmrDeWexXIhCi/DviehmUtmuAvSDHYxhBio6Hf1pkHiSOI
	 MLEBJk4l4rCCBtOtfDq6psbzXdv/vKT6ppSGCZGd6UMczL4oRydVDBSCZ1VxW38=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755071175; bh=H0QQ2jdFitqrTWXhDvTUohsAVGxwwk0VpCL5L7mrAgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eSRGEegw6Ed0JenfJq/rDs4z10JM36ZwBksIS+OhA1UWLnCMmRid304CILoYCRdUx
	 yXbe99X3BAlohtxXOMtnNbzlP/0rhmMgpVukPjxvoa0H7WGLtJYHPIpQ1B0x8ucrh9
	 lxF9lFUYvJd/7lQdS2mfhTfDNy84GJZKMxP2vTVLr/GoR+3eKqeYCpd9NQb5SGiDWc
	 smXBrQ0oZLxKNMwRVtJYVJ/UCmi1KzVOFAWHyBqkQHXSqSNu+h5Ag1SaXl2RfI1rTu
	 WI1s/W7AJTYdr1eQKQvWXHLkFoDysq4DFQFxlMJVxYwUNUUkyXnH5TVNOQx7o5U2r1
	 6u5cqzgsyAY9w==
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 09:46:15 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 consulting@bugseng.com, andrew.cooper3@citrix.com, jbeulich@suse.com, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 2/2] Address violation of MISRA C Rule 13.1 involving
 asm side effects.
In-Reply-To: <175d7b47-32bb-4b5d-a16b-7402bd823b15@epam.com>
References: <1283be3b76d76814af244bbca544f6a3b74a04de.1754689062.git.nicola.vetrini@bugseng.com>
 <c4da2554d94c3f7bd4b1e460dcaa27db382ece2f.1754689062.git.nicola.vetrini@bugseng.com>
 <175d7b47-32bb-4b5d-a16b-7402bd823b15@epam.com>
Message-ID: <c03ea3bcf950d6fb0d04d0f67790d03f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-13 09:41, Dmytro Prokopchuk1 wrote:
> On 8/9/25 00:40, Nicola Vetrini wrote:
>> The rule states: "Initializer lists shall not contain persistent side 
>> effects".
>> The specific way in which the 'mrs' instruction is used does not lead 
>> to
>> visible side effects for the surrounding code.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Not yet tested on the Xen ECLAIR runner, as the syntax used in the 
>> deviation
>> is only supported after updating the runner.
>> 
>> What the tool is reporting is that due to the '=r' constraint and the
>> semantics of the instruction, there is the side effect of writing to 
>> '_r',
>> but this is not observable outside the stmt expr. The deviation ends 
>> up being
>> a bit too general for my taste, but the restriction on the actual 
>> istruction
>> should be enough to limit applicability to cases that are arguably 
>> safe in
>> practice.
>> 
>> An alternative approach would be represented by stating that side 
>> effects in
>> 'READ_SYSREG64' are safe, but this is not true in general.
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index ec0cac797e5f..6b492e38505d 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -437,6 +437,10 @@ write or not"
>>   # Series 13
>>   #
>> 
>> +-doc_begin="Consider the asm instruction to read an Arm system 
>> register to have no side effects."
>> +-asm_properties+={"asm(any())&&child(text, 
>> ast_field(value,^mrs\\s+%0.*$))", {no_side_effect}}
>> +-doc_end
>> +
>>   -doc_begin="All developers and reviewers can be safely assumed to be 
>> well aware
>>   of the short-circuit evaluation strategy of such logical operators."
>>   -config=MC3A2.R13.5,reports+={disapplied,"any()"}
> 
> I think it's worth to add example of macro expansion in the commit
> description or asm_properties doc:
> 
> uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r" (_r));
> 
> This uses the 'mrs' instruction to read from the TPIDR_EL2 register.
> While this read operation accesses a system register, reading itself
> doesn't cause any persistent side effects, as no program state is 
> modified.
> 

Definitely not in the -doc_begin, perhaps in deviations.rst, though in 
reality it is a single case this currently applies to. Reading the 
register is not the reason why this deviation was requested, but the 
write with the "=r" constraint on "_r", as that is the side effect the 
tool is pointing at.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

