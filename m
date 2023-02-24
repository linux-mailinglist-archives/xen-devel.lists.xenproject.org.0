Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D46A1FF8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501307.773000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbE3-00011N-Fw; Fri, 24 Feb 2023 16:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501307.773000; Fri, 24 Feb 2023 16:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbE3-0000yK-B5; Fri, 24 Feb 2023 16:47:15 +0000
Received: by outflank-mailman (input) for mailman id 501307;
 Fri, 24 Feb 2023 16:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVbE2-0000yE-IN
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:47:14 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a9f3c3-b462-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 17:47:13 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id b13so15766684ljf.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 08:47:13 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 x3-20020a2e9c83000000b002934ea0def9sm1331545lji.140.2023.02.24.08.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 08:47:13 -0800 (PST)
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
X-Inumbo-ID: e3a9f3c3-b462-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DM0/WnFvjALj6ZDgRgjy0kvjYwl8UHomuj6mz28wim8=;
        b=YW3/17EEEQGu/sbdecsO0SeS1w2s5giIyxJmo/GPavfUgvjV56JB0j1mCCgOHR9Rfc
         BcS7Xal+ood06HlfhCviv9krTXQSAih+Y65mOl8VWibz2q4GF8g9JgCR9YqPqXYCd5c4
         PFBTaDNT8A+4HvSRignvw1XyPaa099vThFr7yK77oEPzUr8uT1bmPtQ2olCzu1mSmDWg
         Lg1ekVTOq9+xKt9Z2gz5l+kYzGTwB1jA63Z5HLk/QbZeZXXX2za9RGOYkgBhCNuiCpg4
         Rdo1JBdVE7w6P39mnKHYsW9v08loTpyiPziimU/SnvKJ3b+8XP0PUlkCc4/aujlx5XaG
         WZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DM0/WnFvjALj6ZDgRgjy0kvjYwl8UHomuj6mz28wim8=;
        b=jPU4MY4sVajLTIrn/NcVD3dOMMr2oYDZurzeZ0Gp7o2ojzWZGygHgrNu7cgOlfVDVq
         aKKe3BuszwHKVpfBcqEdqz3eWk/J42QrY8m1TCkuHo37s67uBr4WICpnaOhYsaIfKOwK
         QzeN/bt9ls07GxEXM+KysOSfOyAUmuLvhEGsmqcFwBCo/GTGi7CVUlPjXgHGc4RpLGRt
         D3P98QJFXLvd/wQra8N9NGZbkm3lsFKezUII3VhUJbBRHmZX5WHRvfU6v8/mfzSjSiEJ
         16O2U8maUUPzRmweNlvCBzmog0l+y6tUcROjVJ3yn/hXRO3/RShfpkoS9y7Ip1QggEHs
         e+3g==
X-Gm-Message-State: AO0yUKWVYKHNPOOfgDpK6FAuE5c8ywEbwhEWf4Ie+0wFD+TMYawC/0d9
	a91dtHXt2r6KTISrDGw6rO4=
X-Google-Smtp-Source: AK7set+sc9mMOfep8n9Tr7Py/NkNnqbJdkNmJF9F9XOcn7wvUB83miz5WA9foWlkpM8aBjjpwlOz4A==
X-Received: by 2002:a2e:b805:0:b0:293:1ab0:27d9 with SMTP id u5-20020a2eb805000000b002931ab027d9mr5574190ljo.24.1677257233451;
        Fri, 24 Feb 2023 08:47:13 -0800 (PST)
Message-ID: <b6463de1900b514a9eccb203669dcb3c2decb133.camel@gmail.com>
Subject: Re: [PATCH] CI: Simplify RISCV smoke testing
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Anthony
 PERARD <anthony.perard@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Fri, 24 Feb 2023 18:47:11 +0200
In-Reply-To: <20230224153721.2623760-1-andrew.cooper3@citrix.com>
References: <20230224153721.2623760-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Looks good to me.

Thanks.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

On Fri, 2023-02-24 at 15:37 +0000, Andrew Cooper wrote:
> Use a single fairly generic string as the "all done" message to look
> for,
> which avoids the need to patch qemu-smoke-riscv64.sh each time a new
> feature
> is added.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
>=20
> I considered "All set up and nowhere to go" but it's probably a
> little niche.
> ---
> =C2=A0automation/scripts/qemu-smoke-riscv64.sh | 2 +-
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/automation/scripts/qemu-smoke-riscv64.sh
> b/automation/scripts/qemu-smoke-riscv64.sh
> index e0f06360bc43..4008191302f9 100755
> --- a/automation/scripts/qemu-smoke-riscv64.sh
> +++ b/automation/scripts/qemu-smoke-riscv64.sh
> @@ -16,5 +16,5 @@ qemu-system-riscv64 \
> =C2=A0=C2=A0=C2=A0=C2=A0 |& tee smoke.serial
> =C2=A0
> =C2=A0set -e
> -(grep -q "Hello from C env" smoke.serial) || exit 1
> +(grep -q "All set up" smoke.serial) || exit 1
> =C2=A0exit 0
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index d09ffe1454a4..1c87899e8e90 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -11,6 +11,7 @@ void __init noreturn start_xen(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 early_printk("Hello from C env\n");
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 early_printk("All set up\n");
> =C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile ("wfi");
> =C2=A0


