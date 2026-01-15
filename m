Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E46D23E79
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204707.1519311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKSl-0000dC-Aj; Thu, 15 Jan 2026 10:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204707.1519311; Thu, 15 Jan 2026 10:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKSl-0000aq-7c; Thu, 15 Jan 2026 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1204707;
 Thu, 15 Jan 2026 10:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpf+=7U=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vgKSj-0007b3-Fn
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:20:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb5764ca-f1fb-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:20:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 0437E4EE75B7;
 Thu, 15 Jan 2026 11:20:19 +0100 (CET)
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
X-Inumbo-ID: cb5764ca-f1fb-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1768472419;
	b=0mGEsviCTbWlTn4WtRtz6ZUjfkjA+M06fgi2UMLfSsRyoAZbKmwRQdCdV1SMtPx8X9Ak
	 XRS0fUjdimDjPcKnJx5nymP/Tuu9DopmzSlXeP25JdmlELYysLqInz36KC+ArK0f0abzw
	 0+vJEw4rtaudrEoHtsmyYt8UzIYQedg0jp7Zrqhx3vGUshCrD7CFfIi6wTs7uSspQSZh0
	 BVcCz1hKLS5tbUJo/K9wYy8B6RaQJpgZeeODEwfD62SJIN4w9ZH1eTeLWj0+Z8HA8ljLc
	 gf6V7qVzlZEbMluko2mmIjcXPuBHHLgovTzTl5s91d3HQ9O1wjO7xUZim1arSvhGjt+hp
	 yK4ko9NC74SXEZOBIpHT5o1OP/hSaf7w3+NmUK1+M5GA4qxl9+XjrlRl/vHqOtdBiDoLw
	 8QT/8rRF7Z5EWTYpsUXPoV+pN6QKlxsj6B9GWslFbWhZNCG8qGB+TMH3JJL6JyXQNyr/t
	 FGLpQ3i7SVRsaFiCsrjIdAqnsF60Ylp3xH6ugnS4XZ0ux/wLJWZUTdaOTopC67kgdb+HH
	 4RO1ConPDKL8WGDcYulNccst/tzrd6FKl405R6eX49/uiXi7WIpbgY1iV1rFND2cWDtQl
	 wFxiqSYSi5hOBQ77xc9FYVdtm9eIJ3pUXhCSYD/NZREb59L3SincOzpk0Nbv9TQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1768472419;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=KnZWE/vN7WeQU73j9OaHH+BojkCuakSF/uLVTudYhn0=;
	b=3bgOhu7Ph01dRdQxpdMgUNqORM0609FxToNqmyN5ixQuhBUartQXy5g3isPf1ghxyXwE
	 OFlURCEBalwvtIIhQS2z9doa5BvvtEB0ZYAsK97GZ3LU3xWsda+6G3zsBdN7Z8vL4aA04
	 qy1AxAs67xow5c10QDPZKP77pwIwF8Aw6i0dpylSk22G/Py75skVHUmjAHwgM1FDsnsXG
	 2ke2mClh2wYowB8FJCoQnXDMMKVqf4Iv8H3A+8DUMAE/TgZzIDkoW4Gf68dCmZx6g/J6/
	 aOzV69T1E4UTw28vLAd42FoGP5mfotw3WwXJrHAeJQNLpkqdepAtOZpnkKC+atFMYy2K6
	 H8Qln3ZUU3GadKjgyadb2+j3T2eNPyDiyZRysZLyxOorISn0VJOy3ManomgOJhDferR57
	 MVYyJDqqEB4Hho1CXjhHCc3A4Xes7TSnvxtxy7QVzLTEK71FA8yS1yJuArv3gU/R8GQV4
	 1qPl0l5YzhYvbXhI4EDFUX5vhRKnVpIdnNPk/GrFOCWJhngmmnsq1sEDP2SyoY60N7Oq7
	 VCBLskBNQKa46sKANTp6ytUJiLbxAYR54ap6p19bXA1Dy+un8Vl1pWwipXtrHPQHyUTt+
	 Xt3KC6+KLSW5XC3s/KgUNKe/81nR/2TcAFy4vSlBSinwwqlhnm/bVGxT8p70wNg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 11:20:19 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [XEN PATCH] x86/mce: use offsetof to determine section offset
In-Reply-To: <2012453e-d09f-4da0-bdfc-8487cef278ef@suse.com>
References: <350bd19ec4b0b190911d748df6ec92c626e7151a.1768415160.git.nicola.vetrini@bugseng.com>
 <87de17df-0aed-4ce1-b556-f93a381b66d3@amd.com>
 <a351802f6e1dff22f79cc7dbfd848aac@bugseng.com>
 <2012453e-d09f-4da0-bdfc-8487cef278ef@suse.com>
Message-ID: <1d15798d2e416764aa81d6120bbaf7a0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-15 11:17, Jan Beulich wrote:
> On 14.01.2026 21:56, Nicola Vetrini wrote:
>> On 2026-01-14 21:40, Jason Andryuk wrote:
>>> On 2026-01-14 13:27, Nicola Vetrini wrote:
>>>> --- a/xen/arch/x86/cpu/mcheck/mce-apei.c
>>>> +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
>>>> @@ -74,7 +74,8 @@ int apei_write_mce(struct mce *m)
>>>>   	rcd.hdr.record_id = cper_next_record_id();
>>>>   	rcd.hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
>>>>   -	rcd.sec_hdr.section_offset = (void *)&rcd.mce - (void *)&rcd;
>>>> +	rcd.sec_hdr.section_offset = offsetof(struct cper_mce_record, mce) 
>>>> -
>>>> +		                     offsetof(struct cper_mce_record, hdr);
>>> 
>>> "= offsetof(struct cper_mce_record, mce);" should be sufficient since
>>> the offset of hdr is 0?
>> 
>> Yeah, makes sense. Given that the struct layout is coming from the 
>> UEFI
>> spec it's not likely to change either.
> 
> It's okay either way, but I'm happy to adjust to the simpler form while
> committing (I'd slightly prefer that, precisely for being simpler, and 
> it
> being close to what was there originally):
> Acked-by: Jan Beulich <jbeulich@suse.com>
> (ftaod: either way).
> 
> Jan

Thanks

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

