Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BAA3BC5F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892657.1301616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhsZ-0004TF-JQ; Wed, 19 Feb 2025 11:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892657.1301616; Wed, 19 Feb 2025 11:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhsZ-0004RM-Gx; Wed, 19 Feb 2025 11:04:35 +0000
Received: by outflank-mailman (input) for mailman id 892657;
 Wed, 19 Feb 2025 11:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbWK=VK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tkhsX-0004RE-KV
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:04:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47697971-eeb1-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 12:04:25 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id C63004EF40C8;
 Wed, 19 Feb 2025 12:04:23 +0100 (CET)
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
X-Inumbo-ID: 47697971-eeb1-11ef-9896-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739963063;
	b=VjN77YJ121ptfMuifkpgmDw2lzZEN19D2/vL2+tg4dwfpryWF82PpeIyh2Vr7Btdhsiu
	 EoIE2fg2jQP35sSqyKMMJdBmjRoVjWZI6g9WWvAOBCo1WgjGPi58i1sW8QQKyRFUx68fg
	 8W+RohGbyMcjHAmZURrhKcexSeCPfDuoO5RtFqPWVJEgPQqVoaQxtYa6CyDpTReKAGJna
	 WD/P+brDSSxnmtBBo6bo/eE9QC6egTmtkiOlwac71Uzeu4d14ki6otZ+BEU/AbqcBYVvV
	 F/O1RNMxkSMa/WJto90amfSsjfyneSU1LJZXLyFulGUfgSW5dNGT9UWgbDB6nLDCyKwrt
	 KQ6I9e86co52NvGF6eugw2YaHDvd6ecH1AlsrzDXzRee/Crjx4e7HBvFV3ldbNhKr0Zy7
	 L+KLPvswuJ8UlOtPGG2bSwiiIjzvpxZYo05/Gw308mu1WC4P7Eu4GWZs0moEcNbJx8N82
	 Mpm+FIWY7WgINDbA7D7trqVnCUVFrqZ93dvn4W9bg2eL5v4GOvXggawePouS96HPvOuRR
	 IL9YI0HLkLQExG2fU9JEcwgXKmNjpj1ic/2Y1EN00Mz8ToCgy62aPoPcym2KGaOSSMrJd
	 1/H4Np1QKpn1Lf+gDpLV4f5/DyuTj0uUskFsncOk5P6fwsCl5Idg0zZ9lF92WwU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739963063;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=oRZPL/o4+YSCKebokHyGIh/wEdUND57l0X2XUl83GFA=;
	b=K4lNJYGPbxMqrD3CGcMyDHtAoxRXTfMVAdxkyveiJqrVrrnne0DScOAvu1/qXhbJ8o0a
	 J+v/Kc4YBerEDkBf8O4NStZkjD/pGsMA6cUx+AOj5WNtl5El6aYSkANf6tofS6Mt7t9GK
	 9+/BnSjoBEdbL8qSs2TlSZURTSlG1pYrpRql1xnWIup4V+bfhGIfSt71zGG678GgajSne
	 fBStDNOuSG6GgiqEMHsroXr0VHv8C3kWC0JQk+dpIo/tEoHq4MmI4DXmVTF5TGs7qFJJi
	 /LbzJZn+rMAodiZzIfIHTfNIj93rGHTRKNNl39zNTfLNaGsg8v90p/f4NfSYHAo41mQ+7
	 ZsmDY/BUEBibpNOxuP0HPOuqwB1PCy6SAXLLaoKauE/46QfBqxREeLxtQL2lfqALknFPv
	 dmRNAt1wKDpMi2bOiZuDW8CMS3yM58SCSqVNcCQhDTGo6mUBqxXCJT/uud+q9s0W5C56u
	 NYqf29T4kWIARCZhnvWjQEEHq+tBj2zPckv0vcr8zve4SjS8LEygkDxxWfXcyyxUPOZ75
	 wgbx4NqE4A/6R2KPOqL7JOOYiygXfIX96OUpkoyCULs66eDi/upmnGNdebS9xsECS+yH3
	 Mwlf4jCSE14+waL4xiI6IcimQwXGo0esAIDvxpOpmd8xQBmQn6u7dJGA55J2KN4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739963063; bh=/352vQv7sScOPQ4vaNkt7CK/yeAXAg7vDFx6qT1NdrA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y5osHHm1ta7+UKFIDDqeuMBil/7D7/NESIlEX7Sqamc+i+HYtv587Mbf5BTU6BAyH
	 AWUvy6IM3OA6fHpMREpVx/WJrsDH6rOrLkj6DBrdwxp09Q7IqYfRl+WbBU+yd39Cqo
	 M5ZTaWZE+cYk7sZSYO1qnUJtW3MdLe9bTO8KC+SonUpVHMfbzVOXUTtrPrXydIPg91
	 O2sXJXEXNALCaKhIOzJnBA3LeajdHHAi4Kqr/Tui1V9RYEwG5ImG9nIk56pKxyH3HL
	 6wVpaiwl0H46uJKCGvwiYn4xxYJT5wiaSTWKJQOaZzfxHNcA2nvSPkyYWTh8/z5PVy
	 o9gBJlHNGypgA==
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 12:04:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <stefano@stabellini.net>
Subject: Re: [PATCH] x86/MCE-telem: adjust cookie definition
In-Reply-To: <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
References: <bd74b357-b254-4c43-a417-f26434361340@suse.com>
 <84298eb0-42cb-4967-b382-71cb309a7359@citrix.com>
Message-ID: <27bcc28f5ac46d43473a9bf860944433@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-19 11:44, Andrew Cooper wrote:
> On 19/02/2025 10:00 am, Jan Beulich wrote:
>> struct mctelem_ent is opaque outside of mcetelem.c; the cookie
>> abstraction exists - afaict - just to achieve this opaqueness. Then it
>> is irrelevant though which kind of pointer mctelem_cookie_t resolves 
>> to.
>> IOW we can as well use struct mctelem_ent there, allowing to remove 
>> the
>> casts from COOKIE2MCTE() and MCTE2COOKIE(). Their removal addresses
>> Misra C:2012 rule 11.2 ("Conversions shall not be performed between a
>> pointer to an incomplete type and any other type") violations.
>> 
>> No functional change intended.
>> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/9181587757
> 
> Eclair does appear to be happy with this approach (assuming I stripped
> down to only checking R11.2 correctly, and making it fatal).
> 

The analysis settings are correct.

> For the change itself, it's an almost identical binary, differing only
> in the string section which I expect means some embedded line numbers.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

