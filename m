Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ACA68D735
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491116.760100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNQD-0005W2-KN; Tue, 07 Feb 2023 12:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491116.760100; Tue, 07 Feb 2023 12:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNQD-0005S7-Fd; Tue, 07 Feb 2023 12:50:05 +0000
Received: by outflank-mailman (input) for mailman id 491116;
 Tue, 07 Feb 2023 12:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNQC-00046W-1P
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:50:04 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef389819-a6e5-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 13:50:01 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso13110085wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:50:01 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c364a00b003daf7721bb3sm18367359wmq.12.2023.02.07.04.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:50:00 -0800 (PST)
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
X-Inumbo-ID: ef389819-a6e5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wwDH5rKguNe4LYAQep0fZVMYwtjqvHKEEtn5XlpSSj8=;
        b=DsSvCocG7COvE2P5JTV0ctSHEdAEyITF7TtKXGAApaxJOofKSCP+5AIuoGdRYorffZ
         dwNW3LwFqqPA62MYQCcY6Dm/Fg1d+arO4IHDGo6i3uPXUydD82yBxuz9ngr+7+ht3K1N
         1c9rxf3QViisvEFg+3aeSIBztam8iextzvNmOcjhhDmD+YOMnDV25eq9JvQj4hLpAMsQ
         EKA7MCTpk1zxXU9spFCfBQ2TbNeSBXaPKqc6MmvCQfvo0s7NRLz012YqR51nf+U9Gzix
         lN6dGYfqYVQ+XRW6bc44tvtBqHvLqs/2J7fgbKZI/lwrq6gIIiz20XeMGtWpLpvfc43H
         cZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwDH5rKguNe4LYAQep0fZVMYwtjqvHKEEtn5XlpSSj8=;
        b=bU5CYmDSBzostB1Z4lL1GL1FYa2Gt2YNaYDVnhaHV9k8VZ/LKUxWoCxsUq0ezWEXlT
         47OkCsYKrJLZRD3I2W4GBtGZptHVCZdKkjanDEwURFgahHN8Wo1SqVsry3SIGpZ/tsu6
         D3RNqtOsl6jAO4Mq9Q85dnBhlZ5Q1bZA+Sto5KJ9TvIB16IeU0dzHwKL7nOiW1Et0gIa
         qBgQ6JO/XoYBdoyDnmKLAjwVDww4EwcmIeJIzkoIBbAwhcIq5THZ+TXEsSkAbed8o7fe
         izl64Gyov6UNdM1BEwC4E8QaNtfaKASmhB4QS437FFCzl4lUkOtOpq6O7Ry9dUpH9FIV
         MT7A==
X-Gm-Message-State: AO0yUKVvnkxe3hmz86PYVhIfCMEnNMWkmE35vlGcB1/+yL93Tt4YTstP
	hBRkRZr65HvpNPy29X6Ksr/k7UGtVLY=
X-Google-Smtp-Source: AK7set9lQAY/uJBLEp+GIMMCFGSzZrR0ZzVWFQdBn0add57cTVetW8WuazsnasSuICR2LFfYaKxB+Q==
X-Received: by 2002:a05:600c:2e83:b0:3dc:5e16:37ea with SMTP id p3-20020a05600c2e8300b003dc5e1637eamr2911501wmn.30.1675774200494;
        Tue, 07 Feb 2023 04:50:00 -0800 (PST)
Message-ID: <4a76a3910cbb53d271536a223c71d7a4ca3e73f8.camel@gmail.com>
Subject: Re: [PATCH v9 0/2] Basic early_printk and smoke test implementation
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Tue, 07 Feb 2023 14:49:58 +0200
In-Reply-To: <cover.1675772422.git.oleksii.kurochko@gmail.com>
References: <cover.1675772422.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi all,

Please look at V10 and skip V9 as I missed to add the check with
medany.

Sorry.

~ Oleksii
On Tue, 2023-02-07 at 14:41 +0200, Oleksii Kurochko wrote:
> The patch series introduces the following:
> - the minimal set of headers and changes inside them.
> - SBI (RISC-V Supervisor Binary Interface) things necessary for basic
> =C2=A0 early_printk implementation.
> - things needed to set up the stack.
> - early_printk() function to print only strings.
> - RISC-V smoke test which checks if=C2=A0 "Hello from C env" message is
> =C2=A0 present in serial.tmp
>=20
> The patch series is rebased on top of the patch "include/types: move
> stddef.h-kind types to common header" [1]
>=20
> [1]
> https://lore.kernel.org/xen-devel/5a0a9e2a-c116-21b5-8081-db75fe4178d7@su=
se.com/
>=20
> ---
> Changes in V9:
> =C2=A0- Bring "cmodel=3Dmedany" check back to be sure that C function is
> safe to be called
> =C2=A0=C2=A0 in early boot when MMU is off as=20
> ---
> Changes in V8:
> =C2=A0- Set "needs: archlinux-current-gcc-riscv64-debug" in test.yaml
> =C2=A0=C2=A0 for RISCV job as CONFIG_EARLY_PRINTK is available only when
> =C2=A0=C2=A0 CONFIG_DEBUG is available.
> ---
> Changes in V7:
> =C2=A0- Fix dependecy for qemu-smoke-riscv64-gcc job
> ---
> Changes in V6:
> =C2=A0- Rename container name in test.yaml for .qemu-riscv64.
> ---
> Changes in V5:
> =C2=A0 - Nothing changed
> ---
> Changes in V4:
> =C2=A0 - Nothing changed
> ---
> Changes in V3:
> =C2=A0 - Nothing changed
> =C2=A0 - All mentioned comments by Stefano in Xen mailing list will be
> =C2=A0=C2=A0=C2=A0 fixed as a separate patch out of this patch series.
> ---
>=20
> Oleksii Kurochko (2):
> =C2=A0 xen/riscv: introduce early_printk basic stuff
> =C2=A0 automation: add RISC-V smoke test
>=20
> =C2=A0automation/gitlab-ci/test.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++++
> =C2=A0automation/scripts/qemu-smoke-riscv64.sh=C2=A0 | 20 ++++++++++++++
> =C2=A0xen/arch/riscv/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> =C2=A0xen/arch/riscv/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 33
> +++++++++++++++++++++++
> =C2=A0xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 +++
> =C2=A07 files changed, 95 insertions(+)
> =C2=A0create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> =C2=A0create mode 100644 xen/arch/riscv/early_printk.c
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/early_printk.h
>=20


