Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEA9C8808
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836266.1252151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXPH-0002B4-Vr; Thu, 14 Nov 2024 10:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836266.1252151; Thu, 14 Nov 2024 10:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBXPH-00029I-Ss; Thu, 14 Nov 2024 10:48:59 +0000
Received: by outflank-mailman (input) for mailman id 836266;
 Thu, 14 Nov 2024 10:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQH=SJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBXPG-00029C-H4
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:48:58 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7da574-a276-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 11:48:53 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9e8522c10bso60089266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 02:48:53 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dfffc9fsm48812566b.130.2024.11.14.02.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:48:52 -0800 (PST)
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
X-Inumbo-ID: 0a7da574-a276-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBhN2RhNTc0LWEyNzYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTgxMzMzLjkyOTg5LCJzZW5kZXIiOiJhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731581333; x=1732186133; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxeuXMin9fRBYhlmMqAoXCnTcwOMVe8DzeeVa5Qh8x4=;
        b=TSlgp6l97CG9iG2nQ1jqJ7jOCJuDXN6UzCuj63LXKDnj3HzUsxMHOeMGxCJH8PtFpm
         yIdCJVshiMNnRtih33vlSWLAaObQIO8UBs9e+cNdIYz4/S2FYi0WJ6UBGufM18IvxGKx
         9HmQ5ANfe5R+Oq4lZfkIRU9auJhFHn0FO74uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731581333; x=1732186133;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxeuXMin9fRBYhlmMqAoXCnTcwOMVe8DzeeVa5Qh8x4=;
        b=ZgyAlPSiaMgug1t7gb5G2SoqBOthkaX0jLxUDsA/5g4csTQ08UcBLgZx3wUC6iysZl
         VBEt6d39bdHT5L77C/3vo8lLFx8DpLmDb6V/JB4oiiO5z/6i091hLNvCxCr5FXrG7m1C
         38gKFFnWK5GuEZqIj9W8upKospqcXFI+ANfvcsPZAcC8xSGA79s+VtA+gopRG1vi/fRz
         tUvpL1Cfm36qXv+6YbkrtFxOl2wiHaC+sKQds20Lxj7VrhJwS/+uOLp0+B8FeMG9a++y
         QwprHzOekd8Nb5vRlFUO3K4TJJfMZ/TQxL59XQM/uj839wnNRd98V1RnGjzTUX6rPYio
         OhjA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Al1zh6eDoyl7r2EqRSJlCJPL7ir0eu1KT0Vw/mVrkySnJMtkg1T7wYiw0cagvNatRY1svUz5nYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2iSuKnQDSp4zFwtA9lRsqBU8WM6makFls11SfPNvTGzYxhPQN
	IHaIeNsAinYP/hsJaygoRGGEGsNjbqmBDH2aSkPzBwdhv6kzHkZ7MpRz3YAYJfU=
X-Google-Smtp-Source: AGHT+IECHSJCUekqZwIhlbIq/6PKX+T7MbDra6HTbgOhAupc1dEWEjceQ0jA5jI7EhGYNUrgA7MIng==
X-Received: by 2002:a17:906:730f:b0:aa3:a79d:49cc with SMTP id a640c23a62f3a-aa3a79d4ed9mr120948166b.13.1731581333250;
        Thu, 14 Nov 2024 02:48:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Nov 2024 10:48:52 +0000
Message-Id: <D5LUCQ9MH2C2.1L6CFH028NYPS@cloud.com>
Cc: "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Jan Beulich"
 <JBeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 3/4] x86/trampoline: Document how the trampoline is
 laid out
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241114090810.1961175-1-andrew.cooper3@citrix.com>
 <20241114090810.1961175-4-andrew.cooper3@citrix.com>
In-Reply-To: <20241114090810.1961175-4-andrew.cooper3@citrix.com>

On Thu Nov 14, 2024 at 9:08 AM GMT, Andrew Cooper wrote:
> This is, to the best of my knowledge, accurate.  I am providing no commen=
t on
> how sane I believe it to be.
>
> At the time of writing, the sizes of the regions are:
>
>           offset  size
>   AP:     0x0000  0x00b0
>   S3:     0x00b0  0x0229
>   Boot:   0x02d9  0x1697
>   Heap:   0x1970  0xe690
>   Stack:  0xf000  0x1000
>
> and wakeup_stack overlays boot_edd_info.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> v2:
>  * Rebase over the introduction of trampoline_perm_end
>  * Fix the description of the boot stack position
> ---
>  xen/arch/x86/include/asm/trampoline.h | 57 ++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include=
/asm/trampoline.h
> index 8c1e0b48c2c9..559111d2ccfc 100644
> --- a/xen/arch/x86/include/asm/trampoline.h
> +++ b/xen/arch/x86/include/asm/trampoline.h
> @@ -37,12 +37,65 @@
>   * manually as part of placement.
>   */
> =20
> +/*
> + * Layout of the trampoline.  Logical areas, in ascending order:
> + *
> + * 1) AP boot:
> + *
> + *    The INIT-SIPI-SIPI entrypoint.  This logic is stack-less so the id=
entity
> + *    mapping (which must be executable) can at least be Read Only.
> + *
> + * 2) S3 resume:
> + *
> + *    The S3 wakeup logic may need to interact with the BIOS, so needs a
> + *    stack.  The stack pointer is set to trampoline_phys + 4k and clobb=
ers an
> + *    arbitrary part of the the boot trampoline.  The stack is only used=
 with
> + *    paging disabled.
> + *
> + * 3) Boot trampoline:
> + *
> + *    The boot trampoline collects data from the BIOS (E820/EDD/EDID/etc=
), so
> + *    needs a stack.  The stack pointer is set to trampoline_phys + 64k,=
 is 4k
> + *    in size, and only used with paging disabled.
> + *
> + * 4) Heap space:
> + *
> + *    The first 1k of heap space is statically allocated scratch space f=
or
> + *    VESA information.
> + *
> + *    The remainder of the heap is used by reloc(), logic which is other=
wise
> + *    outside of the trampoline, to collect the bootloader metadata (cmd=
line,
Wh> + *    module list, etc).  It does so with a bump allocator starting fr=
om the
> + *    end of the heap and allocating backwards.
> + *
> + * 5) Boot stack:
> + *
> + *    The boot stack is 4k in size at the end of the trampoline, taking =
the
> + *    total trampoline size to 64k.
> + *
> + * Therefore, when placed, it looks somewhat like this:
> + *
> + *    +--- trampoline_phys
> + *    v
> + *    |<-------------------------------64K------------------------------=
->|
> + *    |<-----4K----->|                                         |<---4K--=
->|
> + *    +-------+------+-+---------------------------------------+--------=
--+
> + *    | AP+S3 |  Boot  | Heap                                  |    Stac=
k |
> + *    +-------+------+-+---------------------------------------+--------=
--+
> + *    ^       ^   <~~^ ^                                    <~~^       <=
~~^
> + *    |       |      | +- trampoline_end[]                     |        =
  |
> + *    |       |      +--- wakeup_stack      reloc() allocator -+        =
  |
> + *    |       +---------- trampoline_perm_end      Boot Stack ----------=
--+
> + *    +------------------ trampoline_start[]
> + */

Neat. Nothing like a pretty picture to properly explain things.

> +
>  #include <xen/compiler.h>
>  #include <xen/types.h>
> =20
>  /*
> - * Start and end of the trampoline section, as linked into Xen.  It is w=
ithin
> - * the .init section and reclaimed after boot.
> + * Start and end of the trampoline section, as linked into Xen.  This co=
vers
> + * the AP, S3 and Boot regions, but not the heap or stack.  It is within=
 the
> + * .init section and reclaimed after boot.

How can it be reclaimed after boot if it's used for S3 wakeups? I assume yo=
u
meant that the heap and stack are reclaimed after boot, but from that wordi=
ng
it sounds like the other way around.

>   */
>  /* SAF-0-safe */
>  extern char trampoline_start[], trampoline_end[];

Cheers,
Alejandro

