Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A09DFDDC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846493.1261661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3A2-0003rL-Bd; Mon, 02 Dec 2024 09:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846493.1261661; Mon, 02 Dec 2024 09:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3A2-0003pZ-8A; Mon, 02 Dec 2024 09:56:10 +0000
Received: by outflank-mailman (input) for mailman id 846493;
 Mon, 02 Dec 2024 09:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZV9f=S3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tI3A1-0003pF-3Y
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:56:09 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ecf1a2-b093-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 10:56:06 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53de035ea13so4048231e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:56:06 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df643117fsm1406013e87.24.2024.12.02.01.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 01:56:04 -0800 (PST)
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
X-Inumbo-ID: a5ecf1a2-b093-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE1ZWNmMWEyLWIwOTMtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTMzMzY2LjM1NzExMSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733133366; x=1733738166; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jfgslfg5iTPo990WOheGYmdRdC6SYQqGZeK6vQ3ydwo=;
        b=Al6l0Uo04ecfk7wqW9ycUbxBVwNKUqXa5Rs3HgVXa9EjqnhP+eLBZYWexfZrXBkpea
         wuxsX7AEpkErFPfKHRtR6Hsl6KtI/p6ChKN9gaXne1OX4uzpmyDY3jTOwy4Ly0Exe2f1
         nnNV1Xdhl4powPo++NJPY0vNFvlD6EcqM3JB9ptTKViYXNz1cY0h5NxodGY655lFfhYs
         22oaNNbro82cNdS5ORgFNFPmlzvh6OfQgimJXb7k6Y+mqBZYNMoyIeviJHPHY5+35C4S
         Ihv9RDGxUw51kxsn2xQsQSA2ot9PaOkRFVblZIglyNAtyRzeBCjKJQ7iMRZ31yeMTmQW
         QoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733133366; x=1733738166;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfgslfg5iTPo990WOheGYmdRdC6SYQqGZeK6vQ3ydwo=;
        b=YXqGfrFQt/bLXGjU07XI0w/YcgZyHz2zagYxHPVG54FsPhNqmXIiunGf/jc0e+ebMZ
         PtUpECr/snmSIGUR25OhyDAgN7bT7P+7vAtJKW4/ACebgikV6YRAX5mArDfsU7+3VhIF
         xnG8251l74aDGNpPKNN2nBIJmWvmUs3XQ5+nOdUOP2rPEed13ZdPOHpAPxR6CTXIsXKw
         l+cPktp8lBT4uR8H96+mvqYPHCJgq7GYg6huuv/iXKFIAy/uWNl82hnDYVPBWDvrDaxF
         ogcBcXmsXYOg3WCE+IrE/FiITp3iMM525xYSaCI0Y5zLb6aNXod8jM4TSL5t+xka6O/e
         0Z8w==
X-Forwarded-Encrypted: i=1; AJvYcCWyo/5ep2Wa3fFQV2ttbmNjZPPvGnPqWg667Kp38mawFHsu+V88kv+svOeU3gLPJk7LVAcSSlRfv38=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmjimBHp+NTqaVH54ATmMS1MxTmO56IgKZexDZsEvAdGDYcbyB
	TcWLHbl9D5iRpy9opFj3UfCzCT6uqZbgrfHuSVjo8Dw/JzFQnA4W
X-Gm-Gg: ASbGncv+AunY/S7YvkYvAOhri9sC98L5QllLsUZb9109AFhSTwEdW++uuHYvuhyeNYl
	LIJHbizLtyPYysokn5BtaNvO4RT9QMkhdDKVOBHK+7f9nS106UtgclxO0Bp/TmXJsUNk5pddxFT
	n+AFBukngfL4f2GS3LGUeg/J8OdeK+ut3O1OXjnpkbvNEW56ahEi5L9mE02fidKqv+9R9t19hKO
	f5RJcN0aO1yzGEdSTuzc4WQWJvICPqQFfYrT4KwE1tzuGlW055sNNNsIoQMQxA=
X-Google-Smtp-Source: AGHT+IGIF264bOjdVGsJejtpU2uhQT4s97Y9QPUGSQIMo9shCVmVBzsxDjWzOli1cpbXL8BBzs4O1w==
X-Received: by 2002:a05:6512:400f:b0:53d:ed75:6f0 with SMTP id 2adb3069b0e04-53df0106bdcmr12963476e87.35.1733133365367;
        Mon, 02 Dec 2024 01:56:05 -0800 (PST)
Message-ID: <f6bcf4dac683b1ebd89cdbfa33777c64c2df4637.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] xen: riscv: enable stack protector feature
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk
	 <Volodymyr_Babchuk@epam.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"	
 <xen-devel@lists.xenproject.org>
Date: Mon, 02 Dec 2024 10:56:04 +0100
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
Okay, I think I found what is the problem and why my testing on staging
wasn't really correct.

In xen/include/xen/stack_protector.h (
https://patchew.org/Xen/20241130010954.36057-1-volodymyr._5Fbabchuk@epam.co=
m/20241130010954.36057-3-volodymyr._5Fbabchuk@epam.com/
) CONFIG_STACKPROTECTOR is used for ifdef-ing so the stub version of=20
boot_stack_chk_guard_setup() is used and there is no need for
get_random() implementation:
1. Shouldn't it be /s/CONFIG_STACKPROTECTOR/CONFIG_STACK_PROTECTOR ?
2. CONFIG_STACK_PROTECTOR isn't set in case of RISC-V, at least:
      grep -Rni "STACK_PROTECTOR" xen/.config=20
      38:CONFIG_HAS_STACK_PROTECTOR=3Dy
      76:# CONFIG_STACK_PROTECTOR is not set
  =20
   Shouldn't it be default HAS_STACK_PROTECTOR ( or something similar )
   for 'config STACK_PROTECTOR':
      diff --git a/xen/common/Kconfig b/xen/common/Kconfig
      index 0ffd825510..f3156dbb9a 100644
      --- a/xen/common/Kconfig
      +++ b/xen/common/Kconfig
      @@ -521,6 +521,7 @@ config TRACEBUFFER
      =20
       config STACK_PROTECTOR
              bool "Stack protection"
      +       default HAS_STACK_PROTECTOR
              depends on HAS_STACK_PROTECTOR
              help
                Use compiler's option -fstack-protector (supported both by
      GCC
     =20
With these changes, I can confirm Jan's statement that the BUG_ON()
occurs due to the absence of the get_random()/NOW() implementation.

My second test (on my downstream branch) wasn't relevant because
get_s_time() and NOW() are implemented there.


Aside from the changes I mentioned above, I can re-send this patch when
I submit the patch enabling get_s_time() and NOW() for RISC-V. If you,
Volodymyr, are okay with that, we can proceed in this way.

Best regards,
 Oleksii

