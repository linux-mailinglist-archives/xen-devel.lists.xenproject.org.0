Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B0A49DE7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 16:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898904.1307353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Zv-0003zd-5R; Fri, 28 Feb 2025 15:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898904.1307353; Fri, 28 Feb 2025 15:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to2Zv-0003xZ-1c; Fri, 28 Feb 2025 15:47:07 +0000
Received: by outflank-mailman (input) for mailman id 898904;
 Fri, 28 Feb 2025 15:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTn8=VT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1to2Zs-0003xS-On
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 15:47:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 416926b2-f5eb-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 16:47:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so21528495e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 07:47:03 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52b7ecsm91861185e9.3.2025.02.28.07.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 07:47:02 -0800 (PST)
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
X-Inumbo-ID: 416926b2-f5eb-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740757623; x=1741362423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X68VZKnG1P/h0RC62jOS+lr/FI9k4Dz32/ZrSjJiYiM=;
        b=S4wBXm8GQtVzDgNEWErkhiN+L2QgFsZ9LRIgehVxBDQONbv51I6x8DXKWXp7VmLYdt
         uRkht6gBbWUh6rzRaobH8I7aoh+3ii2bnzWIdK9C0BOh3PcnivZPbDfE70c0+ZyZhfq3
         SG4sSOKQBwmWsJykEZSe+TyCSOE0xRQ/QWJyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740757623; x=1741362423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X68VZKnG1P/h0RC62jOS+lr/FI9k4Dz32/ZrSjJiYiM=;
        b=hk1x/rkcXDBJWkWdAUWBGZv/JwQHqbuB0lhMx+nZQI77kVd26Uubgm0b9H3/PNWjle
         J6SnYJTwi0eeXuSD/u5aHkaWpkapi7CtwSmOAvGsQAt5/I12TMhoKxjkykZHnx1fCTqX
         mUkcJAOhLHRwZchVN3XYImIEZd6oD18fhWu7PUkWsOQ/BUCqzclAAwEoCifVmiwbIm6F
         NcrBbxuDQl5rlr3xzRxQajAvZMLYRrsi1k4cJP8pzXczDMuGueJ78yoa8swy5C1KgV1k
         IWt47S4+PhGjliggzuJwhTKEdQmI+rhCQkOKW4011ax/1Kz+EfvGa/MjHnJj7YX01KsZ
         nz2g==
X-Forwarded-Encrypted: i=1; AJvYcCXNt3O7g+CSRSqk2vAipUNC6xxTgxBEUUGNbVoMruxRFNuHmAZctelltguHGpbLrTJ2evi+rNdKbXc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdsNQJ6XIKC8FhS6aOGTTcM0H/ZGiKMhQ/g71S/EkHHXbTmfx6
	HYWmiA1P9Z05FSrXFOqAAoSFwQZ0rnnXea1eyLtRArXc2vTP5ZDhW/d7YHLP67Q=
X-Gm-Gg: ASbGncu+mY3yM7p8nTfunDtLdNQ9Ys71nhWQ3/cwdnT90skgwAhGpKapoRSLiEGASOm
	P+indL7jz9Le5fiohQ7/giCFMqkVPRlGtzp1+ioRgQ2GgrtgpwiRPuSyUHZEWb+5MYyiDue+rWr
	vjnBXu/2XGWTTD4TN0rze09eq7nuwQoNN/0pBPwWYdd1vrOCA7FDR41276u2XuXsttE0oX1ogN6
	BTD7kJMag1fz+6VBw9g7eUUQg+lNHHmGgwcsogYcDUTwYCoxdkA2AwFNoHgJZRbHdI00Qzs0RRN
	WEM2OkCroeiT64Z0pHubkyOkE9w/Uj6sXkIs
X-Google-Smtp-Source: AGHT+IG3BTai9VI+k6kigPdDBQE452Yia59fckVr3iI/3wPqk7K6kVDWjRjz4QT6Lq6BkU5zk3Ldrw==
X-Received: by 2002:a7b:c7d2:0:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-43afdd937camr72577345e9.3.1740757623064;
        Fri, 28 Feb 2025 07:47:03 -0800 (PST)
Message-ID: <ffdc90de-1407-4b9c-aaae-78d41dc79c86@citrix.com>
Date: Fri, 28 Feb 2025 15:47:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: copy_to_guest/copy_from_guest functionality.
To: Milan Djokic <milandjokic1995@gmail.com>, xen-devel@lists.xenproject.org
Cc: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Milan Djokic <Milan.Djokic@rt-rk.com>
References: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2025 2:59 pm, Milan Djokic wrote:
> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
>
> This patch implements copy_to_guest/copy_from_guest functions for RISC-V.
> These functions are designed to facilitate data exchange between guest and hypervisor.
>
> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> ---
> Tested on qemu with xcp-ng latest branch https://gitlab.com/xen-project/people/olkur/xen/-/merge_requests/6
> Full description on how to setup test environment can be found in attached PR link (Linux kernel patching to support copy_from_guest/copy_to_guest for RISC-V).
> Linux kernel patch shall be upstreamed after these changes are merged.

Several things.  First, it's probably worth setting you up with Gitlab
access, seeing as that's the first step of RISC-V CI.

Second, where can I read about the semantics of h{l,s}v?  That looks
alarmingly like a virtual address, and there's a world supply of corner
cases that can come with it, including incorrect translations.

Also, I very desperately want RISC-V (and PPC) not to inherit
2-decade-old x86-ISMs which we're currently trying to remove, because
starting without them is 10x easier than to fix them after the fact.

> diff --git a/xen/arch/riscv/addr_translation.S b/xen/arch/riscv/addr_translation.S
> new file mode 100644
> index 0000000000..7e94774b47
> --- /dev/null
> +++ b/xen/arch/riscv/addr_translation.S
> @@ -0,0 +1,63 @@
> +#include <asm/riscv_encoding.h>
> +#include <asm/asm.h>
> +
> +.macro add_extable lbl
> +.pushsection .extable, "a"     /* Start .extable section */
> +.balign      8                 /* Align to 8 bytes */
> +.quad        \lbl              /* Add label address to extable */
> +.popsection                    /* End section */
> +.endm
> +
> +.section .text
> +
> +/*
> + * size_t _copy_to(uint64_t dest, const void *src, size_t len)
> + *
> + * a0 - dest
> + * a1 - src
> + * a2 - len
> + *
> + */
> +
> +.global _copy_to
> +_copy_to:

For assembly code, please use the linkage macros.  See 7015f337a217 as
an example.

However, as far as I can tell, the only interesting thing h{s,l}v.b, at
which point a simple piece of inline asm is surely easier, and would
simplify guestcopy.c too.

Exception table entries are perfectly easy to do in inline asm.  See
_ASM_EXTABLE() in x86 for an example.

~Andrew

