Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53FB04137
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 16:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042888.1412960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJyj-0007YF-Q4; Mon, 14 Jul 2025 14:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042888.1412960; Mon, 14 Jul 2025 14:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJyj-0007V9-Mx; Mon, 14 Jul 2025 14:16:25 +0000
Received: by outflank-mailman (input) for mailman id 1042888;
 Mon, 14 Jul 2025 14:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOou=Z3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ubJyh-0007V3-Tw
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 14:16:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e4bbea5-60bd-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 16:16:22 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6CD584EE0748;
 Mon, 14 Jul 2025 16:16:21 +0200 (CEST)
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
X-Inumbo-ID: 1e4bbea5-60bd-11f0-a319-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752502581;
	b=NhG3ZMiA2BTRm9Zzh+8JlgLpGxaBptpVhOijry0DMHvgwcQAqv7F0vvhMhTvw/YFbsbX
	 +Jfjp1IGnKPLuTstGttEtHO20SFQV46LGSGKZ8qWk6oFL26eh6ycOIG+UCc3PfkVNJrQt
	 6jXzS6UjZ7IMgwWCjLh+av2GMsBuu+zDmI3wCqXMEdUISsbKKBGnq5tPvkKfjXgLtehcw
	 Z7O00RRZAmb/IxwsE1eS3vyPHDVT6bgkPO4S49OUe8z9fIYMnBe13xCMEFMnjtw1TAEFT
	 9TbuqRa+sUudKp8mCHtzKni4wicNCySiQu7i0G/Qb+6wWcsfofZI/5BAkC47/5EJ96sjZ
	 Ps/QPItchOQB/CydrtnnTUP2LM3rbzmTNtFjXWb2tqYMqD25EGEM8tsIXjKDG3P2P2nCV
	 g0Qfc2jEir6qX+BnJN4VRtVgYDEnH+CJE0Cqsb0PdtsJ39gr7C/V3GNLWxkIiwfmsXpX/
	 OfYC3l4agYauMABOkIq//CUKu49bAyDc3bMsDIPBkuKgciW0Y9OupbErDg88CmmT53JXb
	 jHDUGG3Fa4b1wTYHrAioDe95LFDdAWCslli25b2M0ss+aGXaGvQJ5XrDLmZQZcd4XMmTl
	 S5Axc9IySfJ+Kpg+vXCbSWek/IvwWFBTNTwhWOsaxRNp1TyFkOiFwaibDO9O0fE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752502581;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=KSEr0kEn4L1Z6vVsgrxqh+2ZJnXJpzMLXqD6hanV4ck=;
	b=HjACJwqkulJ+J6WnYaQYPizRc0JN3Mv6STw+bQ6w9nQ/Gq8k/3sUqDjum9H3pesMx+Q8
	 mOJ6/R7tAdfk4rCz7gDLpcHIFYzIpK7hm673KMYq61NKlnT1ViT3ywJtDnq8+HpuLizSw
	 CgiB9dNALawzvNoTozogwXSOcXyPVK1JYetIpIWB0W7FoN/PIB7Iv27CAT62IEkUnriZe
	 RR0D868YX5t2HJ96q41KPm97Cb1wXpq2g/RhNQWn+tRvvIDMPq5O4PY0cWwcxQWqfzX9i
	 rmhaqEk3PjYymaY8ZT5SxDWi+sYIt+8xLgU9so83kb/Jx98oO1njlT8hlSR8JuWaVw2pR
	 RE28RWT3sYghgEBuFMqQSMOfiZaqsEjVrEDUL6/Y6Z96lCSTMeq7USaLPFrbTcrDuaN72
	 b/7bE/xS/ER/ezdzlLzUr3lpusU1OTcLhwOl+OAeS9knDRkZ2TfW6WnLkdLqM8qVV2Xq0
	 zfEndJYrsBsYIumx1OjCl1YhXdfbaVqOCcmXv9oayimbakrDmvIPOKh2YeoWyGKKo58AT
	 1DRp1+aeLzVNbT1zbmC0UecK76K+rlGAKYYKp4p6TSQ6jPIJKGIbiSnBYys5GVQe8E3fW
	 uIsxx+lTa++cGEXULWvg6vgkNZ1dni8A2H6ohfRgpz9+kd2jly1cWkTNh+7NvkI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752502581; bh=CWRXYgkF/Vje3i9q2n1PeC30vPG2rBomXD5yewM7Xf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vT4j4ZMjQDTSK25CgX+SRC+GlXlKIPiE4oeknpX/WYc85WlkyGvMU/+/zHo+97fyN
	 Yoylth2956C7PjarTnztfcfTqnnscjOstaL3HbQUu6dFGn+wAV/cgMov1uklkwT30Z
	 xpMt3tdif3XShK4PIrM2l4G5LFT4c/8WEoI2YpI2xTn9jq/LewpVEsmtVAbDEV+MSd
	 GxtK+JQ/DmiDw4f8db2tR17sYltNx0txLqRghdUKy0oHgv+7XP/OWclGmdE/IgTv8j
	 Gz+XhmX9IEnMkRb8fY2sAd32JIZmIdsQX7e8st4veoPAYg8L6ypI0UT2j2l4WhE/rp
	 mEJlOdg8sfwGg==
MIME-Version: 1.0
Date: Mon, 14 Jul 2025 16:16:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul
 Singh <rahul.singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] misra: address violation of MISRA C Rule 10.1
In-Reply-To: <87ab0914-4a90-4dc2-ba33-188c7eb4cdca@suse.com>
References: <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
 <87ab0914-4a90-4dc2-ba33-188c7eb4cdca@suse.com>
Message-ID: <33004fe59be3ddc9c0e1589ef1b60f21@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-14 15:49, Jan Beulich wrote:
> On 14.07.2025 15:26, Dmytro Prokopchuk1 wrote:
>> Rule 10.1: Operands shall not be of an
>> inappropriate essential type
>> 
>> The following are non-compliant:
>> - boolean used as a numeric value.
>> 
>> The result of the '__isleap' macro is a boolean.
>> Use a ternary operator to replace it with a numeric value.
>> 
>> The result of 'NOW() > timeout' is a boolean,
>> which is compared to a numeric value. Fix this.
>> Regression was introdiced by commit:
>> be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen 
>> functions.)
>> 
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Changes since v2:
>> - improve the wording
>> Link to v2: 
>> https://patchew.org/Xen/41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro._5Fprokopchuk1@epam.com/
>> Link to the deviation of an unary minus: 
>> https://patchew.org/Xen/7e6263a15c71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro._5Fprokopchuk1@epam.com/
>> 
>> Jan, regarding that:
>> If an expression is needed here, I'd suggest to use !!, as we have in
>> (luckily decreasing) number of places elsewhere. Personally I don't
>> understand though why a boolean cannot be used as an array index.
>> 
>> The '!!' isn't a solution here, we'll have other violation:
>> `!' logical negation operator has essential type boolean and standard 
>> type `int'
>> (https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/10674114852/PROJECT.ecd;/by_service/MC3A2.R10.1.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}})
> 
> And that doesn't fall under any other of the deviations we already 
> have?
> __isleap() is used in another boolean context after all, and apparently
> there's no issue there.
> 

Hi Jan,

I double-checked: there is no specific deviation for using a boolean as 
an array subscript.

This is the only problematic use of a macro that returns an essentially 
boolean expr used as an operand to an operator that expects an integer, 
which is the reason of the violation:
xen/common/time.c:#define __isleap(year) \
xen/common/time.c:    while ( days >= (rem = __isleap(y) ? 366 : 365) )
xen/common/time.c:        days += __isleap(y) ? 366 : 365;
xen/common/time.c:    ip = (const unsigned short int 
*)__mon_lengths[__isleap(y)];

Thanks,
  Nicola

>> Well, in our case boolean can be used as an array index.
>> But index value is limited: 0 or 1.
>> I guess MISRA wants to predict such errors related to index 
>> limitations.
>> And I think fixing the code is easier here, instead of writing a 
>> deviation.
> 
> It may be easier indeed, but ...
> 
>> --- a/xen/common/time.c
>> +++ b/xen/common/time.c
>> @@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
>>      }
>>      tbuf.tm_year = y - 1900;
>>      tbuf.tm_yday = days;
>> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
>> +    ip = (const unsigned short int *)__mon_lengths[__isleap(y) ? 1 : 
>> 0];
> 
> ... especially as long as it's un-annotated, I'd be very likely to 
> submit
> a patch to undo this again, should I ever run across this after having
> forgotten about the change here. At least to me, _this_ is the 
> confusing
> way to write things.
> 
> Once you add a comment though, you can as well leave the code unchanged
> and use a SAF comment.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

