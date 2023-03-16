Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD786BC2DA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 01:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510274.787639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbaQ-0003Zl-GW; Thu, 16 Mar 2023 00:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510274.787639; Thu, 16 Mar 2023 00:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcbaQ-0003Y3-DJ; Thu, 16 Mar 2023 00:35:18 +0000
Received: by outflank-mailman (input) for mailman id 510274;
 Thu, 16 Mar 2023 00:35:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7gr=7I=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pcbaO-0003Xx-Uq
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 00:35:17 +0000
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aa1ff88-c392-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 01:35:14 +0100 (CET)
Received: by mail-vs1-xe32.google.com with SMTP id t4so137532vsq.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 17:35:14 -0700 (PDT)
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
X-Inumbo-ID: 6aa1ff88-c392-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678926913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaZKm1ITKbU0wA0oElwkn4BzzZNLe1itiUvf9UX6QiQ=;
        b=JDce7IGMzJEcC/h91n1LX+Eq273aWGboAioeC3WLlI4HxJNqv/QGCww98ompWxiOTF
         ChzEFpRykqeLTFNoNysE4IT9lDU/+B1Kd2hA0hjxggKmKj6O6BWsk2CwYCBvYs910Ao9
         O+RRf5epbVDADXtd/6f/g0PL3vQ90K8Rb97uWNyGuQ5+q3idv9wAZ5jHh/ZyRnHuEcHD
         81f9mdpVtRkaSWsMjDcxzj/rdxbCCUXF1fgKFQKkDMdgP79RGi7OfJyWfl2nlqD835s8
         4aN0ZE7jSd4mBYdCd4bPwrDgwQTrclXwPhdc1fLewnBUWlikhTm2tX9HObGjvrnTlSq8
         fCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678926913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaZKm1ITKbU0wA0oElwkn4BzzZNLe1itiUvf9UX6QiQ=;
        b=5zqeRrovVulpSQ7ricRlQGzdZWOGMUyHrDR0GKO8/RRPI10jCkB9DGcXfUFj7HwOWn
         yJRtthXC2gVWwFcqEzu74jZmr5MOGNzqWihxsdxVkO8Ox8XDuwuHOoLl46T40OwJRHJD
         Bp37iBtbqUjycIfYg76wxkCA0pfZBk2Ioxw9O2nGWz/8ibHBNSprhHPRPKp98Tvgyiva
         ievmRfvKm/7bOq0ha6lCtWNKkpsp44+7Uz4aJnjwRHUjWKqpRbfgct56AITlPK8dQmeO
         yaz0iI4duUvolYab1tYamvp5YWgRYJ4+8OfJw5qNDAARSuYA4TAtMJe9B+RDZ7cg3r8A
         aGOw==
X-Gm-Message-State: AO0yUKUA+/EpevtY7eGguIQ8oIqqc1zEUIyAGkz5hDGnEl87BFPRsU2w
	6zc/M2KHRMEgEpZGj+5JrcTm5hyD0ZzDPpnZQpk=
X-Google-Smtp-Source: AK7set+RLtxLe1erygxVE2B4RLWx61aLusiOORHuY9TH5Ai9MZM/9tXLiBG3el276Kb3YI7CjACm2pdZOu16lbYoTDg=
X-Received: by 2002:a67:eb86:0:b0:422:1654:7737 with SMTP id
 e6-20020a67eb86000000b0042216547737mr16307831vso.3.1678926913489; Wed, 15 Mar
 2023 17:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230315190325.668853-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230315190325.668853-1-andrew.cooper3@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Mar 2023 10:34:47 +1000
Message-ID: <CAKmqyKOSCn6=R3Tdj=FPoKZ-RcE3CGFKFDJC4vyx_2GqLmtAww@mail.gmail.com>
Subject: Re: [PATCH] xen/riscv: Fix early_puts() newline handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 5:03=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> OpenSBI already expands \n to \r\n.  Don't repeat the expansion, as it do=
ubles
> the size of the resulting log with every other line being blank.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> ---
>  xen/arch/riscv/early_printk.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.=
c
> index b66a11f1bc1a..97a94885773b 100644
> --- a/xen/arch/riscv/early_printk.c
> +++ b/xen/arch/riscv/early_printk.c
> @@ -16,8 +16,6 @@ void early_puts(const char *s, size_t nr)
>  {
>      while ( nr-- > 0 )
>      {
> -        if ( *s =3D=3D '\n' )
> -            sbi_console_putchar('\r');
>          sbi_console_putchar(*s);
>          s++;
>      }
> --
> 2.30.2
>
>

