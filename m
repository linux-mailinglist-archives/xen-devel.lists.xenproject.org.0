Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF619DFC74
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 09:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846363.1261531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2CD-0006As-9R; Mon, 02 Dec 2024 08:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846363.1261531; Mon, 02 Dec 2024 08:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI2CD-00068a-6Q; Mon, 02 Dec 2024 08:54:21 +0000
Received: by outflank-mailman (input) for mailman id 846363;
 Mon, 02 Dec 2024 08:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZV9f=S3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tI2CC-00068L-5L
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 08:54:20 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029d491b-b08b-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 09:54:16 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso591487666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 00:54:16 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a7bsm488238766b.104.2024.12.02.00.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 00:54:15 -0800 (PST)
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
X-Inumbo-ID: 029d491b-b08b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyOWQ0OTFiLWIwOGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTI5NjU2LjQyMTM1Niwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733129656; x=1733734456; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dZUijcyDzNV98iY9ZbR4bomJkysKQdUxcq1edYarO/8=;
        b=neks+QJT5U1jm7vaRHeZqDlFZ3ZRGeMV0bcS2i9wUTpU/b5EB1Y9pM34NcpmcEVSKG
         Pp2rO9/qjurxYt1iaSm9J8KTTzOcshi3j/rjmb/o0hVaVA4fQUWqJ5KCQMCA2i/PrVbE
         b1s9Efn727BBazCWpnHu1ExHrBWlabAp+hm3IYYqEz7fIrAnUdsAU409IBdG4Kcc6MXl
         hnCxfje5ooy0Ebf6DJ8FdIXD0iMzkO9krLbPtLQNgzNGEEDIQlLnZP9kcq2yeFQUQcD+
         YDtzTLg/ew0FBEsM71a3DxAc9xL3Qti6GXs1UAG8yVdshKC6ebvdSZyVdMkxqt/elQ6F
         FkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733129656; x=1733734456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZUijcyDzNV98iY9ZbR4bomJkysKQdUxcq1edYarO/8=;
        b=LhMzJZjfPULo94L7ZPG7QkW1hdSkfsl6I3RN36nvsrG1I4X6P+TcIx4M5Vm/Z9jUiB
         MykIKm6kRaErsvezPaRvTNUjJz+E2zpQOj8eS+52KIsJh7ALg7P1F1A8yGfK3kcokH0L
         1ueEHAtYYNeA0IWPZv10ObwpJZl6DH+/cv4AJcojWQYV3wJzOkbwu2+I/w8RzG3yEggO
         erdMV+puN7YMI7LhvLvcwDSiSwwMxja7chb1sgEGr2IQcXPuIaW0dZhLihat8AgNnyrI
         2OTlnt+ovHuL7Bq1jJJCx9I0uOtxJtD7MZdKK6ZJXx1kBlrUFFr00Ku3GrCEYv91y3F3
         DR9w==
X-Forwarded-Encrypted: i=1; AJvYcCUqvhuTouZdNN/senxCfVOgkIYBpu9a5HescNhKyTLHYEyH4EIVxe+BwFiXzUyDBfAGhTlpSVa8/g8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMs2MaKa6b8WbNlRN6FR2p4vpaAYtDITUbhtzMsEBcxX9S+eAx
	85BhCH5Hr8FNukn+4wCgdmHEMjbyMd7ijrEHzXUSqZGcI7W08HCn
X-Gm-Gg: ASbGncvoJI0/NA9mWugXs6Jy5cwvE+UnoyCi83YuCRNHx//x1cxy3TnO66O8hVlwHOs
	ao/ulCmEFjafx04IlWS/yn0Tmvf1KINjztUjs9ohKUjloc14M4Lt+CtSfAuToJpmDiFFWZ5/jg+
	itpb6gUpguHa71GQPcEnAkKGBkW3wYitRRUUKVYjO7urxh02InAYsUMDh5HMqwUja+U1YFPFTZf
	L5mWTRaOmQtYfDx9BUsW+arh40dghJikzT6YTWbFjktyghOZHDK1DZMgJa+yYU=
X-Google-Smtp-Source: AGHT+IHhQUM71YH2xe8wwkyNg4QGHUT24oGw+VzvMsf3VwEiL36j1tLIvMGgYHfjG5FmeBgd55xVXw==
X-Received: by 2002:a17:906:1baa:b0:aa5:470d:c95d with SMTP id a640c23a62f3a-aa58102833fmr1510949466b.37.1733129655646;
        Mon, 02 Dec 2024 00:54:15 -0800 (PST)
Message-ID: <567b703b80d13bf6412f48e5f06e1f5d9733e0ac.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] xen: riscv: enable stack protector feature
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	 <Volodymyr_Babchuk@epam.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"	
 <xen-devel@lists.xenproject.org>
Date: Mon, 02 Dec 2024 09:54:14 +0100
In-Reply-To: <2f92aeb0-bb1f-49d0-9655-8ff93fee8837@suse.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
	 <20241130010954.36057-5-volodymyr_babchuk@epam.com>
	 <2f92aeb0-bb1f-49d0-9655-8ff93fee8837@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Mon, 2024-12-02 at 09:12 +0100, Jan Beulich wrote:
> On 30.11.2024 02:10, Volodymyr Babchuk wrote:
> > Enable previously added CONFIG_STACK_PROTECTOR feature for RISC-V
> > platform. Here we can call boot_stack_chk_guard_setup() in
> > start_xen()
> > function, because it never returns, so stack protector code will
> > not
> > be triggered because of changed canary.
> >=20
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Isn't this premature? For ...
>=20
> > @@ -57,6 +58,8 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( !boot_fdt_info(device_tree_flattened, dtb=
_addr) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG();
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 boot_stack_chk_guard_setup();
>=20
> ... this function's use of get_random(), either arch_get_random()
> needs
> to be implemented, or (as Julien also pointed out for Arm64) NOW()
> needs
> to work. Yet get_s_time() presently expands to just BUG_ON(). Given
> this
> it's not even clear to me how Oleksii managed to actually test this.
I will double check that but it worked for me ( I didn't face BUG_ON()
).

~ Oleksii

