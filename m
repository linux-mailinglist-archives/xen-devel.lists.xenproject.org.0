Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C16F805781
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647972.1011803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWZ2-00013Z-2e; Tue, 05 Dec 2023 14:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647972.1011803; Tue, 05 Dec 2023 14:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWZ1-00011M-V4; Tue, 05 Dec 2023 14:38:19 +0000
Received: by outflank-mailman (input) for mailman id 647972;
 Tue, 05 Dec 2023 14:38:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UsGn=HQ=arndb.de=arnd@srs-se1.protection.inumbo.net>)
 id 1rAWZ1-000110-6o
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:38:19 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed504641-937b-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:38:17 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D8DE5C0209;
 Tue,  5 Dec 2023 09:38:16 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 09:38:16 -0500
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C846FB60089; Tue,  5 Dec 2023 09:38:15 -0500 (EST)
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
X-Inumbo-ID: ed504641-937b-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701787096; x=1701873496; bh=Jz
	SQDIO6qim20VuN8EwfbXBLlFnW70R5EUY7HAWzpiM=; b=qawVeVS6xrHMp2gZSM
	RJL7RWYr7Jfwjhzp7770sWfPpRMcK+oA4jU0GmeFcG/5k4nPUQ1sInde09tLS4S8
	ZNn639ozsQBUw4rlMnoeoBkzt7utAb4QnF1od+CyLgrt7vXLi8ahzphsGJ1FxAK1
	L0/Qjgxjl4DxtL7SOZWE23EuQ9R8y5Q6QcZTsjj/osgIRjfLDZFh+RJ6SDczGYYe
	1tjxiaTT6t2VHUcMNF/VdCSorqHu6Nr0gW+QwFfUW4YAhTZ8TiZ22h6NoqStc+8h
	anrTEJ3OsqspNU5lXL46DPDW6+Sxby6zvcB0r+qgXkMS26935sLr5BsEAl+H8AMm
	nHqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701787096; x=1701873496; bh=JzSQDIO6qim20
	VuN8EwfbXBLlFnW70R5EUY7HAWzpiM=; b=JJT2uJMYPxypTbmIoX4H1xdC0VTA+
	uI0trRIkPzrd7uFKCqSCPFjATHrpKph+UuEMmUYFSapbOspNe4mQzir08FCyFaSy
	LPqxgDc+T4C+7mTGBFgniUtKxfiyTGeaCFbecePSfXX7UolbGqMp8pXyCdzuqI0a
	ql8LuU8jseYg0dG7jDyj4LINzTnKU3m1vbCSEjzmClmn8xGfdEhde5E67Y6V5Gqo
	A+iKbhGxlhQY12BxBG8Zc/JXn+nfhucRvUlcKQz+uBjm5Gu05kPEDI2XXWNjH8+c
	Zm/3ROfz8/288qkolU6wHTXlyKLXk1vXW8ihudniI7l44pp3I3hUHHCDg==
X-ME-Sender: <xms:1zVvZbL_0OZ_UXFhXj83wFVrIOkzlYfXKlYP7rWfefffmViEXeUf4g>
    <xme:1zVvZfLmxGhgOYShtSrWa3R8fzfMNlLLs7B5W-RETWQlDPm40goSlNI1yQMiA4uTa
    zJzw_Zokl-2_oO2OPU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:1zVvZTsZzD00lF9uPwQgejXWLcMeMOJHxyfvkuWmyxjxjxVen5SFJg>
    <xmx:1zVvZUYs2V85sbuGIK79txnUMhyf8eRkAMKJHCZfZ6bWBpKJldNKog>
    <xmx:1zVvZSaCCq6Zq-3qgHdh_ktHFNzb6Z1ctPlvdBzmp_m8bAYW8M5p3Q>
    <xmx:2DVvZZzKccXQ7PfTE51p8P7Lz_t0e9652_J5wbmgAiZbQX1s-8v2Hg>
Feedback-ID: i56a14606:Fastmail
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <ab8c9daa-9543-4aed-85f7-69febd85aeb9@app.fastmail.com>
In-Reply-To: <fcdab8c1-b0ea-4d7a-943e-2180b13234fd@xen.org>
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
 <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
 <5a05e194-28d1-409d-9f45-ca4de0fc78c8@app.fastmail.com>
 <fcdab8c1-b0ea-4d7a-943e-2180b13234fd@xen.org>
Date: Tue, 05 Dec 2023 15:37:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julien Grall" <julien@xen.org>, "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "George Dunlap" <george.dunlap@citrix.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>,
 "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all architectures
Content-Type: text/plain

On Tue, Dec 5, 2023, at 15:19, Julien Grall wrote:
> On 05/12/2023 14:10, Arnd Bergmann wrote:
>> On Tue, Dec 5, 2023, at 15:01, Julien Grall wrote:
>>> On 05/12/2023 13:59, Jan Beulich wrote:
>>>> On 05.12.2023 14:46, Julien Grall wrote:
>> This would repeat the mistake that we had in Linux in the
>> past (and still do in some drivers): Simply dereferencing
>> a misaligned pointer is always a bug, even on architectures
>> that have efficient unaligned load/store instructions,
>> because C makes this undefined behavior and gcc has
>> optimizations that assume e.g. 'int *' to never have
>> the lower two bits set [1].
>
> Just to clarify, I haven't suggested to use 'int *'. My point was more 
> that I don't think that the helpers would work as-is on arm32 because
> even if the ISA allows a direct access, we are setting the bit in SCTLR 
> to disable unaligned access.
>
> As Juergen is proposing a common header, then I could ask him to do the 
> work to confirm that the helpers properly work on arm32. But I think 
> this is unfair.

When I introduced the helpers in Linux, I showed that these
produce the best output on all modern compilers (at least gcc-5,
probably earlier) for both architectures that allow unaligned
access and for those that don't. We used to have architecture
specific helpers depending on what each architecture could
do, but all the other variants we had were either wrong or
less efficient.

If for some reason an Arm system is configured to trap
all unaligned access, then you must already pass
-mno-unaligned-access to the compiler to prevent certain
optimizations, and then the helpers will still behave
correctly (the same way they do on armv5, which never has
unaligned access). On armv7 with -munaligned-access, the
same functions only prevent the use of stm/ldm and strd/ldrd
but still use ldr/str.

     Arnd

