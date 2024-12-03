Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F28D9E2FB3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 00:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848296.1263223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIc85-0007Kv-5D; Tue, 03 Dec 2024 23:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848296.1263223; Tue, 03 Dec 2024 23:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIc85-0007IC-1l; Tue, 03 Dec 2024 23:16:29 +0000
Received: by outflank-mailman (input) for mailman id 848296;
 Tue, 03 Dec 2024 23:16:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7Zp=S4=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tIc83-0007I6-VR
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 23:16:28 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9da273dc-b1cc-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 00:16:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so75128985e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 15:16:25 -0800 (PST)
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
X-Inumbo-ID: 9da273dc-b1cc-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733267784; x=1733872584; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4rWZKbxVjhvo+myeo7DxMHip09ZQtePB47fxAQ2IzlE=;
        b=lsjqbPKd6vx66GYNL+6nGvz4c2zaEER2aI+3ouEjUoOeZP97O0H2MuM/1hjphOAvTT
         p8waek2ERWYWLdNF/pJOuT8T17XbZIEkgIIq4xTT3dLRioQUFqNVDpPAz3tJkYo/hSsK
         Cd6pKMyBEei432cj+RWRHeH10A46vOu12aKO7SnGevX5Rs5FFbnb20G5wVypqh7+uubP
         KCsHFtwwP4jPfXZ6HdL0VxUq0bzgnXOfIGcEugPc/Clx2binkiBsaCSxjZSQ2J5qyi3j
         7P7uNXI8Sbuikgio7pzBXELLBWAD15w125lfg0LNmvB7Cp1yfThrcCfxCKqWPwjscnkm
         L3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733267784; x=1733872584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rWZKbxVjhvo+myeo7DxMHip09ZQtePB47fxAQ2IzlE=;
        b=LDDhyPQOzUlBGDQlGIPu95BT3o/BtusVhy/YNivPsxfPq+Gz2mL27qoPtC+I+CA5r6
         0TM82C/IfoM77Q1d8eP8SoruRXd2yMJdiwZJnZ0XcvWgB7fa2Kiw81GtPhpf+50cqyDB
         L3TlH+1Zs1E7lmkyM80rDEIQGZGvzD2wPxCZojQBArTjZj3DLs+UTJBJiL9pPAmq1/kL
         ikUnbmprJvI4YPvMHy3YFGoc+SJuN8zSc59tHfXJojM0TGuq4Tv+RswmDRYXjuo+l+rx
         LOxwCRBxKEkzk+N0/Dj71PRh0rFvuytXQv7ZK+A16T/fYkDsC63h1CoXO8fQItQ6pUCZ
         hnow==
X-Forwarded-Encrypted: i=1; AJvYcCUkPLm2zw7OeJUee/CVIT+Q+rloT57kkWn/++iPOxs/kFP1us3WHZNDpvKJ50mYXSGniE5DN1GA+GE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx90e6ywasqArTZOMZxpSHAH/YTgXzupNLcKgk0DW/3tZb4BESX
	xnTvIjOgTcK+DSqmaltl2eDOT1h7u+X1+C3RQRwe1RikWBn4KcvjQum66l+6wL2jBNZ/53fvs25
	FeluTJEBwzpteSMWMQ+ewIPXX0xQ=
X-Gm-Gg: ASbGncsZajYIuI3lR0z/AubLi2As3L/pjYJnqHjH9TG0/kSkNwKTaSn8WKDqXfra+PL
	0weBJyBte7zQ+peoxc9h0MTzadjMrkQy0d4SgsVML2d7kcf/USpsHoXoHh24q
X-Google-Smtp-Source: AGHT+IHcZJQzQnAoFfiNQpJke12pTp46ia7jXjPEKPE75lbULp7MPNkvCwOFydrVyNaFEb8YrQQ2PdFVUUZGFjSlmGo=
X-Received: by 2002:a5d:6f15:0:b0:382:4ab4:b3e5 with SMTP id
 ffacd0b85a97d-385fd378fc9mr4568941f8f.0.1733267784017; Tue, 03 Dec 2024
 15:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-4-volodymyr_babchuk@epam.com> <d6f17723-8503-4e6e-bd5e-0a42a7149ac3@citrix.com>
In-Reply-To: <d6f17723-8503-4e6e-bd5e-0a42a7149ac3@citrix.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 3 Dec 2024 23:16:12 +0000
Message-ID: <CAJ=z9a2v-96CSjpRSfn2s+BydcC=boFt7RGhU+BRXpaVphG8MQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] xen: arm: enable stack protector feature
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 22:00, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 30/11/2024 1:10 am, Volodymyr Babchuk wrote:
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 2e27af4560..f855e97e25 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -341,6 +342,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
> >       */
> >      system_state = SYS_STATE_boot;
> >
> > +    boot_stack_chk_guard_setup();
> > +
> >      if ( acpi_disabled )
> >      {
> >          printk("Booting using Device Tree\n");
>
> I still think that __stack_chk_guard wants setting up in ASM before
> entering C.
>
> The only reason this call is so late is because Xen's get_random()
> sequence is less than helpful.  That wants rewriting somewhat, but maybe
> now isn't the best time.
>
> Even if you initialise __stack_chk_guard it to -1 rather than 0, it's
> still got a better chance of catching errors during very early boot; the
> instrumentation is present, but is using 0 as the canary value.
>
> On x86, dumping the current TSC value into __stack_chk_guard would be
> far better than using -1.  Even if it skewed to a lower number, it's
> unpredictable and not going to reoccur by accident during a stack overrun.
>
> Surely ARM has something similar it could use?

There is a optional system register to read a random number.

>
> [edit] Yes, get_cycles(), which every architecture seems to have.  In
> fact, swapping get_random() from NOW() to get_cycles() would be good
> enough to get it usable from early assembly.

Not quite. Technically we can't rely on the timer counter until
platform_init_time() is called.
This was to cater an issue on the exynos we used in OssTest. But
arguably this is the exception
rather than the norm because the firmware ought to properly initialize
the timer...

I haven't checked recent firmware. But I could be convinced to access
the counter before
hand if we really think that setting __stack_chk_guard from ASM is much better.

Cheers,

