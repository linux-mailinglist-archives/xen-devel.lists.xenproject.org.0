Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378DB07B92
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045511.1415634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5Mo-0005ba-NB; Wed, 16 Jul 2025 16:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045511.1415634; Wed, 16 Jul 2025 16:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5Mo-0005Zv-KY; Wed, 16 Jul 2025 16:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1045511;
 Wed, 16 Jul 2025 16:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMtv=Z5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uc5Mm-0005Zp-S2
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:52:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e76a10b-6265-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 18:52:23 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 011B64EE3BFE;
 Wed, 16 Jul 2025 18:52:21 +0200 (CEST)
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
X-Inumbo-ID: 3e76a10b-6265-11f0-a319-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1752684742;
	b=TBtKzvQaELGpvIZSXkv5dTBiG/9eox32DHeY22vghsqqq0O34gwiNXXnNajR/vkW6C50
	 LTQyQOslKxkHjjn/QEyiymyQcZDr2baElhn7pDWXeo12LStgaCwXil2nbJAMUDyCNnpU6
	 5X09JprjY3qC9IgZQMRY3cwrRKaPzQi7tK/SqbVhuA1L7Ryx7KSCeYm5A9M+4rEemix20
	 zfTBbdKhzFyTTwfLFNVckSrpKLeZl3AfERCrqqS/Yv1n5n4P19X9VgTz2xbTSFhidE2v7
	 X3MFUoSiijBeZ6GjxflCl972pd5hmjol3qDvVuG+xINIaHFytbJ7OFBjqZLaTYxYsdxb5
	 YlxcwyNDP2glrhTERQNDwGlDvRDb52WKdPVUY9VtRXVPhFvMRM8TKbbwz4dAGY3NZ4nNK
	 ww85Yo1H6CJW4eAIOhvEdgUmBebxiTffP400SCI1E/rtuNmExjv7iBeMJJw+C89JNSwD9
	 S0Fk753eIXaAxtVD8baSyqCpTBGYkOaydfbkvf/7oN7G+gJx6qmNwQbK59jrc1KCl1awQ
	 CDZt06f9+q7eu1tNq2Z56toCEzQ/gwfWRVrgflG4P2RDiuwTIsZBLc5xI+wJjEE1rNFqr
	 8nv5ydrh7m1QQQjbOqFK6l+Jlf631iFk0pqpP8ZGCchKtnITz4+0au3KZO6GI28=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1752684742;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Evm4gF/voYX5VqlcTUlPiM72VsnaNQIdxaQgT3kgE3I=;
	b=u2zzDZ8ySlj7mDXQzx/dHuhnzyOi6DCNslJJ28TJ+lvPKW3fI0yHQxmXEC67TV6Y48v3
	 1V8rkP9Kcv8ApyqILi+wKj5fqbFU9YKEoTuD+nglishDVUiJZxc5CKgcoV+i6puN2qAwV
	 d/9tenp/u2arH8T5n7TOR2QVes6kabwbD+Pj87qTVfHsRe0+p1tRw67n2nUII755UIaCg
	 s04tWH2rDSOp3X17L6TrenbhTllnejQYgjXjovDyinWvTBOWfPwFiGqagwBBW77xHmL4J
	 PaQnvh1jUSrSE7eEoCfz1pvHvDTKPbSi4Xv1pBkBTwLnbP2XK2QgeChryta67AXtsvKpo
	 R4BsUgR3gsCa0jnzLgbkNBtFd2jOM1W304GPGrNxj4r8KZ4Llk+fqjEMyTYxUrkyHi49z
	 nWtLvre8Ck6413yfsQHL2VrQQAmnkLr6yf47Wx5HxauN+7nYkScRK5e0AidYok+obcUhM
	 xHrnm5uMMlMbA4KCZM6Bkb9XtHb+tywkBQfKTFvK3azj8H8cdX4Qe6vQNnL2M8n7rn57n
	 EL6cvuBtzkAHDHue/bZjafaHrGqr51pLKej7vW8YMF9Y/2TmzOi8FxjFoYAQMr/N2Ju+C
	 fxs72KYZKcVzlIBnqinxf24J9aaJp3ql+pZ9g+osmGv/qTTRBixEwy+DSuoBQ6Y=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1752684742; bh=Vj21QZtf9WP0M4Jg7ewZt8/6cKd4FHj02DmpdVxzMXs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q0yMctnoUWVktgNjfDSAP99Fk0utFre3r/aPz7L67cprrN97L3U7PdwDmGUoHR9KG
	 oP6PNeCKYCvN+J9AvmU1lfJFLlM2SAHUNdfJ49wxEqnoM4YOludZ0+XYtMJa0XA6+w
	 X5ovj5la5Orba1F1otVaS8IHL/T5rui+0Z+Y/V2Y1bd8adxyYTR4jOJjaGSLDc8ZO5
	 g7NBwCDAr6xQ7cnQnjV9U9HVwxfaCqoCUNIf/Y8RT6YXNNZKUmCk9ZBWtEzaT0rKYx
	 nNOyr1hdSHYn3Re419T/pfYgjYft+m3r3ZsnC4areKHdHeAbb5m+RWsU2IXI0TsRED
	 j+rlIMEIBu1nw==
MIME-Version: 1.0
Date: Wed, 16 Jul 2025 18:52:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
In-Reply-To: <312509c2-fb06-4fef-b632-c4719264efb8@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
 <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
 <a8fe1fc0-8dba-4a58-ba1f-0851dcc21e9d@suse.com>
 <ef86b7e7-1d3b-46fe-9d75-f55077c9f32a@epam.com>
 <e47fafa1-e02c-432b-84bc-44c48af66859@suse.com>
 <312509c2-fb06-4fef-b632-c4719264efb8@epam.com>
Message-ID: <80937f707e07a9b0d248b5e1e67b5b52@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-16 18:04, Dmytro Prokopchuk1 wrote:
> On 7/15/25 13:50, Jan Beulich wrote:
>> On 15.07.2025 12:07, Dmytro Prokopchuk1 wrote:
>>> ARM only are:
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "any_area(all_loc(file(^xen/include/xen/bitops\\.h$)))"}
>> 
>> This one's probably fine.
>> 
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "all_area(decl(name(parse_gnttab_limit))||macro(name(parse_gnttab_limit)))"}
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "all_area(decl(name(update_gnttab_par))||macro(name(update_gnttab_par)))"}
>> 
>> These two look too broad: They're affecting common/grant_table.c only, 
>> aren't
>> they?
>> 
>>> -config=MC3A2.R5.5,reports+={deliberate,
>>> "all_area(decl(name(pirq_cleanup_check))||macro(name(pirq_cleanup_check)))"}
>> 
>> This one also looks overly broad, but it's perhaps unavoidable to be 
>> that way.
>> 
>> Jan
> 
> Hi Jan.
> 
> Those deviations can be narrowed (specifying file name):
> 
> -config=MC3A2.R5.5,reports+={deliberate,
> "any_area(any_loc(file(^xen/include/xen/bitops\\.h$)) &&
> macro(name(__test_and_set_bit||__test_and_clear_bit||__test_and_change_bit||test_bit)))"}
> -config=MC3A2.R5.5,reports+={deliberate,
> "any_area(any_loc(file(^xen/common/grant_table\\.c$))&&macro(name(update_gnttab_par||parse_gnttab_limit)))"}
> -config=MC3A2.R5.5,reports+={deliberate,
> "any_area(any_loc(file(^xen/include/xen/irq\\.h$))&&macro(name(pirq_cleanup_check)))"}
> 
> Are you OK with it?
> 

s/any_loc/all_loc/ ? I don't expect these reports to have locations 
outside those header files, so this should have the same effect but with 
a narrower deviation.

> Dmytro.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

