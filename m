Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25049AD6EAD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012868.1391365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfph-0002dO-7O; Thu, 12 Jun 2025 11:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012868.1391365; Thu, 12 Jun 2025 11:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPfph-0002aj-4V; Thu, 12 Jun 2025 11:10:57 +0000
Received: by outflank-mailman (input) for mailman id 1012868;
 Thu, 12 Jun 2025 11:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbtP=Y3=gmail.com=andy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1uPfpf-0002ad-F9
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:10:55 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7452c4d-477d-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:10:53 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so132280066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 04:10:52 -0700 (PDT)
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
X-Inumbo-ID: e7452c4d-477d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749726652; x=1750331452; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nBrpMK9zZeZHFNOhk7Yg3FOCL/mJbGGTtA0TEp4ISs=;
        b=kRCeEXcxL7MBg+hY/9JszHsWJUfWhRVQQdjPh3hgdn1eViGPuvLqq8lJeaKqIKLQA5
         ASkPQnKNtF1V7XOKQK4izHqyiKC0ka191/uq9iYSgk3ox58r4mG3ttcSEOXvYY1XNL09
         wVvXD/OjF4laUDlB88k2OZQ4Fa49pd08Zfa9ODqn/G75REnMx7SYyL/VSSe9mJZMNrU0
         d8gJ0fD7Kj2NhXgJQs3LqeIadnp9sgEwd+rxOAwbx82XeUmQOa6GD06U7QQc6ZxrQHQO
         fZtzaOxngVlKOmYlgoNCGFqzHE111n/DJowM1mfiSHMSq8qsqRmsDzva2hzgpKvOWoY2
         UraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749726652; x=1750331452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nBrpMK9zZeZHFNOhk7Yg3FOCL/mJbGGTtA0TEp4ISs=;
        b=Ybm5wQfmB7c82A4G9AjlcKoTtBwgVbPjHQtWRAneAc68Yo+nl6JAHMw1NamFaeOSzy
         g0QUb3Hk4fFr1daC5Xz9su6lcd6/joDrXVmGnR2I2I8znG6i4tQ6AYevGuuNQUjoxYi0
         c2i5T71BvvCXhwMdGvWGwnUlZjD56mM9aSXFPTv4fE0iBexT6d8YknJK53RUlA8qpKQm
         eoHv5L2JPjKfreP3LKkBvwl3hn18p608TrmhpQKKJT7xpM+l+HErG0DN4A5xk7jkzsHu
         lZ/oRyRD8GMTevdzJMPu7xbm7l9/1lCRZciyaH2OCRvEwgPjBP8e3XPMwvHjvY7xf0gI
         qs5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKs4uaj3G2LIN1JSwsry3TApBIs8JlhyNPXQye5DoQ/Qp5VwFoR558GLTgWlzGAa8alSrhTrFZHQ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfKZmEjml+vwVpbbDgALmEb19+JGzqsNXl16IMrIa4cLDj3fWM
	iK5oO5aYMcjMKuKKFByOvL1erx5q8bs2qlPGGmQKWHT+zzpiuW5JXCsCqwqhuVDG9M7nRHH5Dtp
	Y8kEM19+paFc3DVMcH96USJpLBGrgUvU=
X-Gm-Gg: ASbGncuQP1CbohDbeYhzAMFq0UmUxLIdo+rMoX7+GpzlnzqxlDluLqU2Hiko7xb9Ims
	Bu6hyB3MRb2WlPrlNuffBcCigbenr6hJEosggukLOJd4/17ICiLr46ZOYWQuBAzRufV9hpsL4wf
	Hse0yyrJXeTRhvuMN0TkduF8rnoZiGh1xcxCJREST6Xe8=
X-Google-Smtp-Source: AGHT+IFrX17XfYVkjVnepz8BihCrbdN9elHb1a1FwyoMbX0yLjH2EltV5lWsECJ7oLshTrIE21PMDORFUypei4zXNLs=
X-Received: by 2002:a17:907:980f:b0:ad8:a515:767f with SMTP id
 a640c23a62f3a-adea9464061mr258576566b.51.1749726651742; Thu, 12 Jun 2025
 04:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250612093228.7655-1-chengzhenghan@uniontech.com> <84b14425-03e4-42be-8bd5-9bc010ebecda@suse.com>
In-Reply-To: <84b14425-03e4-42be-8bd5-9bc010ebecda@suse.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Jun 2025 14:10:15 +0300
X-Gm-Features: AX0GCFubP_i495cQIkoSGfjK4G9pwjz7TYfQyvgZfj4JA8pwuaopIL7tecp4u7I
Message-ID: <CAHp75Vc7AO_sRgB1Nj6CevbseMFyv5ku8ZS3PwzAuAgysKVxNg@mail.gmail.com>
Subject: Re: [PATCH] x86: Fix build warnings about export.h
To: Juergen Gross <jgross@suse.com>
Cc: Zhenghan Cheng <chengzhenghan@uniontech.com>, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	mario.limonciello@amd.com, yazen.ghannam@amd.com, jpoimboe@kernel.org, 
	tony.luck@intel.com, jarkko@kernel.org, bhelgaas@google.com, 
	pbonzini@redhat.com, oleg@redhat.com, jbaron@akamai.com, ning.sun@intel.com, 
	seanjc@google.com, luto@kernel.org, andy@kernel.org, jim.cromie@gmail.com, 
	kirill.shutemov@linux.intel.com, hpa@zytor.com, 
	pawan.kumar.gupta@linux.intel.com, vkuznets@redhat.com, rostedt@goodmis.org, 
	ardb@kernel.org, thomas.lendacky@amd.com, nikunj@amd.com, 
	ashish.kalra@amd.com, kees@kernel.org, alexandre.chartre@oracle.com, 
	rppt@kernel.org, steve.wahl@hpe.com, jirislaby@kernel.org, 
	apatel@ventanamicro.com, bvanassche@acm.org, ptsm@linux.microsoft.com, 
	Jonathan.Cameron@huawei.com, beata.michalska@arm.com, xin@zytor.com, 
	davydov-max@yandex-team.ru, ravi.bangoria@amd.com, joel.granados@kernel.org, 
	ffmancera@riseup.net, kprateek.nayak@amd.com, akpm@linux-foundation.org, 
	bhe@redhat.com, brgerst@gmail.com, coxu@redhat.com, dmaluka@chromium.org, 
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, 
	linux-sgx@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, tboot-devel@lists.sourceforge.net, 
	nouveau@lists.freedesktop.org, linux-coco@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Huacai Chen <chenhuacai@loongson.cn>, 
	Zhenghan Cheng <your_email@example.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 1:19=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 12.06.25 11:32, Zhenghan Cheng wrote:
> > After commit a934a57a42f64a4 ("scripts/misc-check:
> > check missing #include <linux/export.h> when W=3D1")
> > and commit 7d95680d64ac8e836c ("scripts/misc-check:
> > check unnecessary #include <linux/export.h> when W=3D1"),
> > we get some build warnings with W=3D1,such as:
> >
> > arch/x86/coco/sev/core.c: warning: EXPORT_SYMBOL() is used, but #includ=
e <linux/export.h> is missing
> > arch/x86/crypto/aria_aesni_avx2_glue.c: warning: EXPORT_SYMBOL() is use=
d, but #include <linux/export.h> is missing
> > arch/x86/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #in=
clude <linux/export.h> is missing
> > arch/x86/kvm/hyperv.c: warning: EXPORT_SYMBOL() is used, but #include <=
linux/export.h> is missing
> > arch/x86/events/intel/core.c: warning: EXPORT_SYMBOL() is not used, but=
 #include <linux/export.h> is present
> > arch/x86/events/zhaoxin/core.c: warning: EXPORT_SYMBOL() is not used, b=
ut #include <linux/export.h> is present
> > arch/x86/kernel/crash.c: warning: EXPORT_SYMBOL() is not used, but #inc=
lude <linux/export.h> is present
> > arch/x86/kernel/devicetree.c: warning: EXPORT_SYMBOL() is not used, but=
 #include <linux/export.h> is present
> >
> > so fix these build warnings for x86.
> >
> > Signed-off-by: "Zhenghan Cheng" <chengzhenghan@uniontech.com>
> > Suggested-by: "Huacai Chen" <chenhuacai@loongson.cn>
>
> For Xen and paravirt:
>
> Acked-by: Juergen Gross <jgross@suse.com>
>
> Your patch is looking a little bit strange, as the list of modified files
> is located between the patch hunks, followed by another "Signed-off-by:".

Indeed.
And at bare minimum please split at least to two:
1) adding export.h;
2) removing export.h.


--=20
With Best Regards,
Andy Shevchenko

