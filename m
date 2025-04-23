Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6237A999FB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965415.1355982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hM1-0000P3-MZ; Wed, 23 Apr 2025 21:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965415.1355982; Wed, 23 Apr 2025 21:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hM1-0000N0-Jg; Wed, 23 Apr 2025 21:10:01 +0000
Received: by outflank-mailman (input) for mailman id 965415;
 Wed, 23 Apr 2025 21:09:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iEkW=XJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u7hLz-0000Mu-L1
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:09:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f805ca5-2087-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 23:09:57 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9BADC4EE3CA1;
 Wed, 23 Apr 2025 23:09:56 +0200 (CEST)
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
X-Inumbo-ID: 4f805ca5-2087-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745442596;
	b=ySIsKPhQda3RSyWGlp+1orZn74T/YVn8TT2rgty7bsTbcFniQKRnY7RUTSA+Q8ywaPFP
	 5/KXdSgSooyAv8sTKxb1jD+Ee6xokDcaYRhTcU8ELv8hZoJMQVGMQjkIyeR6OHjVKc3CC
	 +JJrd655v7CjwGd8FRDkl+jRYAQ/mpOc+HTb31YlpM8Armpukd3G9Fe19FTvl+y0nPToE
	 rldNpS0scivmlvul1g+cwb6saqcRwkNH/D5g2rGt71Y5Xd2JTdGHvL02ZO0dvWfHNxq3P
	 ezk5W7sjGn1Z0dZSgzJTuo2GgLkiffXMs2oT1w+Jgv5ttoT/2LZ4NjJrYiNO3WPIc6IBa
	 9V0+Dd6+0d7PYizPjUpmw8+z2kdpF4qxn7m6JZdmWRVVFyG//cBuwOfK6tgH+7BtXx6Kz
	 /C+g07mOB8vKEmqpbRbEq6mRrkSOKBoTn0oufd/9JY6orCcvqNjdslfv+Y1A66UILXBX3
	 0zCQ7b4Znz9AnJ7k+a3SCofqxMxALTj780YzoNGPATwFr0p2ocpJbYD6UlFKOpta9JsYA
	 vDGq56TvoA9zGntcJDUIA8h+pJtXW4jdHd27OliPcqb7AyPiliPNqn5G96DZlzGeDvZUB
	 ShASPxMY8Dy2hJBHoNeeoWaKDkepMgQ2ZFqaCwWx7bqpwdMyMHV5LkCZGtJNjcs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745442596;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=obOWsfDCMqWc6RyXHL2DTYFra3Oay8yuQNaJUgktNVQ=;
	b=bKH92BNxQeoL57gLprA//Q7Atdglg/fTvHAXd5TpySKDByIN9txD+OgwKeUli5+6hZzE
	 0ILf4WpAoQJtFrIjAJrG5gqjnYJlgDuS1tLKUSHjfqcz9KlR0ApjxkzrN8xSWPV3JAkUn
	 nEK41abosVH4ehm0XbQujSmvrako9EVo5uY92YKS9/qCBGUb41JroW27kCdJ3/qOvc6VA
	 6JtMpzSRW15W+iUqIfSnOlty+eCVBpijF1FcAFcc6NlHtZzct2uNMsStxkP/S6+WG8cG+
	 AXf6JkE1oMtfm9yeUBmtRZEwVFen5L8t3I5bb9LQ5kYof5j3i4E8r+goLNWBHQT1PeK+g
	 Kb/z8ro7BS49pF8HaJPyMly9J9RHYvbRSJRh0XYOdcKamjcTsqAjh+Ek22tR5hndsH9ML
	 o09EMi3m3yRa9YkJ2NhvJYe4cjKtULXL2S2EwU0T1wQG+8nonlZzyA5cYP4jR1rWTFxSg
	 L0qe1y8IwkaRzWrOONX/tjk3BF+OgNsP3YLb6gBUKulqEt4zlTYp8Gig4BgBYMmEsUS6z
	 chrEW3dM/KPU/Gitg7aOiPJF1cieL/j6vvW0XW32k/SJEs/WleWFAIY3nUrPnxHMxNc97
	 MJGxgXdTLFwqH1DhOb5qhcqXPnJRrnWiJaGolXSjr334AZMb3TPZKTCTPyeVuzE=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745442596; bh=ZFo5dTLDeAhWWkffKozfybr78bGqLfdJbdzg/4XSs68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VMxHnbRRHra+TlzSi4z+D+WUkCT3E022I4/FUtm1HDAh1OyOLgKw+t85uwd437X/X
	 kS39U+bVRj0Xni8XAKuhTzj1YDfr/fj/WGDV0X2pCzz680o0Bdpv7uD8jFtD37XTvz
	 jJ+IQhcNm7D7uFNfr/Xa0P7LrSYROWYubf6PyKrQiEmQ4QckD40lJxYVd59U0BM1oo
	 1IAAeTbeCTKDZQfQ+RW1KIkfBq7ykTnsMUT3wxrNp77Nqd14gOPcPRaSAHXu6RO+2u
	 DYtJajl+S6icCzxf7IeKHVeWHq5V5ntoNcTx6QU0OfqBrerAvY3xznT6WScevPDeZk
	 YTw+C1LyzAemw==
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 23:09:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org, Federico Serafini
 <federico.serafini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
 <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Rog?=
 =?UTF-8?Q?er_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation of Rule 10.1 for unary minus
In-Reply-To: <afdb0197-6f0f-47a7-88cb-83e014f09914@xen.org>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com>
 <afdb0197-6f0f-47a7-88cb-83e014f09914@xen.org>
Message-ID: <fa196b8dc5edd5cb76d49a38a6cf129c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-23 22:48, Julien Grall wrote:
> Hi Victor,
> 
> On 23/04/2025 18:54, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> MISRA C Rule 10.1 states:
>> "Operands shall not be of an inappropriate essential type"
>> 
>> The unary minus operator applied to an unsigned quantity has
>> a semantics (wrap around) that is well-known to all Xen developers.
>> Thus, this operation is deemed safe.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>> ---
>> Changes v1:
>> - add rule title to commit message
>> ---
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>> Cc: Michal Orzel <michal.orzel@amd.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Roger Pau Monné <roger.pau@citrix.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Cc: Federico Serafini <federico.serafini@bugseng.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>>   docs/misra/deviations.rst                        | 6 ++++++
>>   2 files changed, 12 insertions(+)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 303b06203a..2cfce850bd 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -347,6 +347,12 @@ constant expressions are required.\""
>>     "any()"}
>>   -doc_end
>> 
>> +-doc_begin="Unary minus operations on non-negative integers have a 
>> semantics (wrap around) that is well-known to all Xen developers."
>> +-config=MC3A2.R10.1,etypes+={safe,
>> +  "stmt(node(unary_operator)&&operator(minus))",
>> +  "src_expr(definitely_in(0..))"}
>> +-doc_end
>> +
>>   #
>>   # Series 11
>>   #
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index cfdd1a9838..c5897e31c5 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -321,6 +321,12 @@ Deviations related to MISRA C:2012 Rules:
>>          If no bits are set, 0 is returned.
>>        - Tagged as `safe` for ECLAIR.
>> 
>> +   * - R10.1
>> +     - Applying the unary minus operator to an unsigned quantity has 
>> a
>> +       semantics (wrap around) that is well-known to all Xen 
>> developers.
>> +       For this reason, the operation is safe.
> 
> I have realized we use similar wording in the rest of the deviations, 
> but this is rather fragile argument. "well-known" is very subjective 
> and could change over time.
> 
> How many violations do we have? Could we deviate them one by one?
> 

Hi Julien,

around 10 on ARM, but more than 100 on x86 scattered around multiple 
constructs (e.g. not only inside a handful of macros), so I don't think 
it's feasible to deviate them one by one. I do agree that the wording is 
subjective, but it is rather well-defined which toolchains and 
architectures are used (C-language-toolchain.rst). Perhaps a wording 
mentioning the specific assumptions implied here can address your 
concerns?

Thanks,
  Nicola

> Cheers,

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

