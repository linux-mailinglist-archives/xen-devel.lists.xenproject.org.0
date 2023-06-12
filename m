Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F318472B731
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 07:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546832.853884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ZpN-0008Gk-08; Mon, 12 Jun 2023 05:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546832.853884; Mon, 12 Jun 2023 05:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8ZpM-0008Dn-Tc; Mon, 12 Jun 2023 05:10:52 +0000
Received: by outflank-mailman (input) for mailman id 546832;
 Mon, 12 Jun 2023 05:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lerX=CA=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1q8ZpK-0008Dd-PS
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 05:10:50 +0000
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [2607:f8b0:4864:20::e35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e1913ee-08df-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 07:10:48 +0200 (CEST)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-43b3e2cce3eso3114780137.0
 for <xen-devel@lists.xenproject.org>; Sun, 11 Jun 2023 22:10:48 -0700 (PDT)
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
X-Inumbo-ID: 7e1913ee-08df-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686546647; x=1689138647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYh4Fg2ZU4P8SV/qYIvkTQqxQewmN3W+UuY7wF4U/6k=;
        b=oMAHrDn92enW2Zp3fnTg5G3/pC9wxBZqcvNl/ZYEm8rpUai/whkKqlXMFJX4SipzkM
         cwf3aMIKZUWagoTEarlsX8zU6Sh70BZj8WkuXvrYBdC3mpKzXzGKtwJca/Edt+az9auQ
         5OqORIie3lvpIeotvEsrABDVfnIbi7PKFsAOPalwTRMVEoo3ZDH/j7iSpmLY98qLYIED
         PvabPQOjrRYNTmKIp45DGlrEtBTGc4LAjdS3Vq6n6CE3/2HgBhlT24QgsCcSbI1gpOqo
         ZS2AWsRnnW2R8HDCCoh25f+8D8tHis5RWAHKMxgFCnhyhl7MPvUCUfqFpr2fwjLSJhYk
         shZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686546647; x=1689138647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYh4Fg2ZU4P8SV/qYIvkTQqxQewmN3W+UuY7wF4U/6k=;
        b=lg5+K6idgFpFUsE6T35cXQcnTBod912Uu17b1jornKUWN1n+CMH9ihTUSydwPv9cwj
         kM7Oq7SSyYMIOoPjxmMUlGFQqHqFmyVV1t174yWXULOmg+vhxNps2qKJpdmEnrw98pkW
         tcM/BdzlUrjDTN4zx3j1IrKEN5YB5Ue2kOQQNvuNX4TtvYlyPXDuDW8/gOZC3j1nTbh/
         vPHvH9oXpiw0nlizZ+PXPO+TrdwWjQqwhgxVOiYTQDwgywhwjRR1AfbeSJRzSFiFaZx9
         wCzQgN2fWcVf1BLkwwGx8RYTFATEM4gh2fwY1ZBHDt/Kv81D2UTJzK2ZKuNe0xgogqtJ
         H5DQ==
X-Gm-Message-State: AC+VfDwXh52KBXgjKRaWiX/Sa6O9gGbQ953wXsQurWnYy4t6Zhjr6ABn
	NuuCzoFKGO2y7aUhDlZRfeQRF0beBufGkXUa8C2BFDIppPU=
X-Google-Smtp-Source: ACHHUZ7VlEr67R5DAE7qe3BK+BB9fhq3ASoVjprbcLLB0CVnz5Rg6f0lwkFvW5WiJlQiNJ21Z+oV59itRtWT+mWRE4Q=
X-Received: by 2002:a05:6102:158b:b0:43b:4965:d03e with SMTP id
 g11-20020a056102158b00b0043b4965d03emr4143631vsv.10.1686546647545; Sun, 11
 Jun 2023 22:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1686080337.git.oleksii.kurochko@gmail.com> <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
In-Reply-To: <c01a0c54edcf5ca46a7b2069740d7a81eb6f2330.1686080337.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 15:10:21 +1000
Message-ID: <CAKmqyKP9KVywbBEyL1AjSwcdswsjV7V41DyOKzgUHZvPOjNqdg@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce reset_stack() function
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 5:55=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/riscv64/head.S | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.=
S
> index 8887f0cbd4..6fb7dd80fd 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -27,8 +27,14 @@ ENTRY(start)
>          add     t3, t3, __SIZEOF_POINTER__
>          bltu    t3, t4, .L_clear_bss
>
> +        jal     reset_stack
> +
> +        tail    start_xen
> +
> +ENTRY(reset_stack)
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>
> -        tail    start_xen
> +        ret
> +
> --
> 2.40.1
>
>

