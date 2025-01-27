Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC59A1DAF8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878122.1288295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSWd-0000bU-QM; Mon, 27 Jan 2025 17:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878122.1288295; Mon, 27 Jan 2025 17:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSWd-0000ZE-Nm; Mon, 27 Jan 2025 17:03:51 +0000
Received: by outflank-mailman (input) for mailman id 878122;
 Mon, 27 Jan 2025 17:03:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFPb=UT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcSWc-0000Z4-88
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:03:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc5dd68-dcd0-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:03:48 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so30799255e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 09:03:48 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c066sm136564885e9.29.2025.01.27.09.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:03:47 -0800 (PST)
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
X-Inumbo-ID: acc5dd68-dcd0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1737997428; x=1738602228; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StvOyVbjRO81DkbSfus+846CYLHL3edbVEiFZ8lYhz4=;
        b=e9ewXUTVCQmB8SnK7zYwoyM4o+NaHO0BCOfzxFYrLL7pJgzvfy6+zqf5mugPG9j8wp
         9HRESm4wsevInQByhIOwTD6ETawUMEAowF24t19JZGcjUctdHrFOhc9f/xU+w/GewISq
         ZSk/Qde/MI2/PjD3+WpyUD0B7QU2byPT7CUVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737997428; x=1738602228;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=StvOyVbjRO81DkbSfus+846CYLHL3edbVEiFZ8lYhz4=;
        b=IalC3rnJoVe3fwMR3Xr83oAda3/+ECSlUDTucUGt6J4kirkwthMTdRpRvzWyg8dTbR
         3kSOm0Aao52xaBSK5v1Z17NXwyqhZ3vOSZH44SkRqV4Irw9Dp3lDmHIv4KGPd/YSXvXJ
         zkNBnO5yKMeCMwZlTmmHCyaLMQJFg0zLx+qbmxq2lK9M62ndMs8oyuGG6smpRvFVafuN
         sC3zkjPdqHGHdW2vAIMgrJU6Bp7p0kNPpgm+Gs95Cre0UudRXkQYGZhk5xM7vxuaX6Yx
         Rb7cl6HwhUInnC5UnCk1KoUerINMqpB9IbIRwkbjUcqwZHmDvsM68lM+XBZLcdzX05vf
         Dbpg==
X-Forwarded-Encrypted: i=1; AJvYcCU3sTHoxVZFjCDZ4kh78e0lo+BlbALkK2xnR45byfgyxLr0Eg2TQ0l6gnW+3rCYOXtbnw9IzQ3GXso=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOb0/KTuEbhIElPzpmXdW8LOthlp6/Ke0gJYSW2q4DxL/zcsHh
	ShITJkKeriMiRNn+KIXVSxpJH2YlZ1I+eoXPOcpuTO8a9qrThkChVCzgxNrTcls=
X-Gm-Gg: ASbGncsjs+JO2oDrQifLg8lnQnkImxUBdKPjzyG9QnO4OzxK5ewWpn9HNTX+aBA3Ygq
	jdJE71s1ZhxwXI6n5GKBLL9JCL/MywfKbrOlIOZ/wNxe68HHNt42QP9j/mcJqMTfcdVibL251WR
	wDKu0qtuzKcMj1F7G6Xcgu4SG9GESxkBZfWvDHhKlTOGxNlnPYeymCYRQWAXMRP0EyP6jQBlKSm
	6iTyRSluSoewg1sJA5OZ7dr/avvMTcSTQOnZ5pPK7gVE15F3m3ChoGcKF40iGI6e4+CCUN8a4og
	pZtJuc7wmgYPcNSDmyWt7isOV5miRxujce0=
X-Google-Smtp-Source: AGHT+IGbWzBUP8ZLk5HFQXpkF7Yhiafl/ggA6sq2RKsfUZSC/36YgfxcCpNNMdObO+QgKr8SryDQ2w==
X-Received: by 2002:a05:600c:3b27:b0:434:a29d:6c71 with SMTP id 5b1f17b1804b1-43891438b58mr341548555e9.27.1737997427683;
        Mon, 27 Jan 2025 09:03:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 17:03:43 +0000
Message-Id: <D7D0O214VJBT.18EFVF7AJACYQ@cloud.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Michal Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-3-michal.orzel@amd.com>
In-Reply-To: <20250127104556.175641-3-michal.orzel@amd.com>

Hi,

On Mon Jan 27, 2025 at 10:45 AM GMT, Michal Orzel wrote:
> On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
> arch/arm/platforms/vexpress.c: In function 'vexpress_smp_init':
> arch/arm/platforms/vexpress.c:102:12: error: format '%lx' expects argumen=
t of type 'long unsigned int', but argument 2 has type 'long long unsigned =
int' [-Werror=3Dformat=3D]
>   102 |     printk("Set SYS_FLAGS to %"PRIpaddr" (%p)\n",
>
> When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long.
> Commit 96f35de69e59 dropped __virt_to_maddr() which used paddr_t as a
> return type. Without a cast, the expression type is unsigned long long
> which causes the issue. Fix it.
>
> Fixes: 96f35de69e59 ("x86+Arm: drop (rename) __virt_to_maddr() / __maddr_=
to_virt()")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/include/asm/mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index f91ff088f6b1..a0d8e5afe977 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -263,7 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t start,=
 size_t len)
> =20
>  #define virt_to_maddr(va) ({                                        \
>      vaddr_t va_ =3D (vaddr_t)(va);                                    \
> -    (va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK); \
> +    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_M=
ASK)); \
>  })
> =20
>  #ifdef CONFIG_ARM_32

Out of curiosity, why not make va_to_par() and __va_to_par() return paddr_t
rather than uint64_t? Then this cast would be unnecessary and the expressio=
n
end up as unsigned long.

That would also cover any other uses outside this macro.

Unless I'm missing something else...

Cheers,
Alejandro

