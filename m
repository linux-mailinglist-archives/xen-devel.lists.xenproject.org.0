Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779288D50F0
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 19:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732900.1138948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjUZ-00064V-2d; Thu, 30 May 2024 17:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732900.1138948; Thu, 30 May 2024 17:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjUY-00061J-WB; Thu, 30 May 2024 17:23:07 +0000
Received: by outflank-mailman (input) for mailman id 732900;
 Thu, 30 May 2024 17:23:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCjUX-000615-8f
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 17:23:05 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45de0072-1ea9-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 19:23:04 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57a196134d1so1179822a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 10:23:04 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a653a15a60dsm170248166b.132.2024.05.30.10.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 10:23:03 -0700 (PDT)
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
X-Inumbo-ID: 45de0072-1ea9-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717089784; x=1717694584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gxtv7RcWMMnRJ6POixtScnnqoGKFMSUUVO44xQ2i5/0=;
        b=ldNKa4x0puWBwkybF7X4scE9jlkjuspCMZBkZFfigIdibaaIb79DKamIMeU02viWh4
         SjzmdytBlynZ7NTvmV+mPeeG/dz0uNcWCjzUZS/tuFDRI13ICY++RxPxxB24F9ERGWni
         9Q/SFUPqEk7mWcmT2dNEwmeathSM08dpQL5xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717089784; x=1717694584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gxtv7RcWMMnRJ6POixtScnnqoGKFMSUUVO44xQ2i5/0=;
        b=D29rxYiXqts5paLQbpXoVuNjoK8I60VgxGEMldX4+8fQbwtFKutWJwMGz8OPpdA4/s
         IrzLTE0EZzoBwjBEpHwWVc7ucth9v3uSrAxLXGC3MJK2xQvjamc13lo9AA4D8hzbySRP
         t7LInMvW1wDOhdqUqhTjqQzWhA+Q6ZzxwYIF5d5zckrgXREBy30O6Y1IsDZ29N7CAs9F
         lJU8AMwUu/ao3eMFf1ZEgt4sbkyRoXbZy65HkvdS2DEulKhy4qQREBTqBplBaVnmJMeL
         Buo4PPn07UdLxHt/Isg0rfgkDNrBKsQ/9cl1ze6+lTfqcYs1s+TXFkEV1OO13dOf/9yy
         8/iA==
X-Forwarded-Encrypted: i=1; AJvYcCWhWP1ut4cKDMtXK3Y/qtqTN8xbUSH0xCR9UGtTVeLlyQbo6nkVwtX6+dcBfEJWofZRGpskxWadbS0sn6OnN1xRajwtaIWKx9oRSyhyvA4=
X-Gm-Message-State: AOJu0YxBv3psbHSOOsziMXR5VZ7wBkthgfwVTKlYSH9YLmXlscNprqB1
	wd2AqQCBFUCObdEyuEo8gWNkDNfFI+61ZsX1P/WIH1qLPR/z5tABKXuOks2MKG8=
X-Google-Smtp-Source: AGHT+IFTpQItYLTPlIE3ApLJWAcfaNC/piKgXc05qVsSYxeVj7bWM/R/LiF8mD4a+hxVZxu+JXXkfw==
X-Received: by 2002:a17:906:d195:b0:a59:aa68:99a0 with SMTP id a640c23a62f3a-a65e8e5472emr153925966b.18.1717089783756;
        Thu, 30 May 2024 10:23:03 -0700 (PDT)
Message-ID: <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
Date: Thu, 30 May 2024 18:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This patch looks like it can go in independently?  Or does it depend on
having bitops.h working in practice?

However, one very strong suggestion...


> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 07c7a0abba..cc4a07a71c 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,11 +3,246 @@
> <snip>
> +/* PDX of the first page in the frame table. */
> +extern unsigned long frametable_base_pdx;
> +
> +/* Convert between machine frame numbers and page-info structures. */
> +#define mfn_to_page(mfn)                                            \
> +    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
> +#define page_to_mfn(pg)                                             \
> +    pdx_to_mfn((unsigned long)((pg) - frame_table) + frametable_base_pdx)

Do yourself a favour and not introduce frametable_base_pdx to begin with.

Every RISC-V board I can find has things starting from 0 in physical
address space, with RAM starting immediately after.

Taking the microchip board as an example, RAM actually starts at
0x8000000, which means that having frametable_base_pdx and assuming it
does get set to 0x8000 (which isn't even a certainty, given that I think
you'll need struct pages covering the PLICs), then what you are trading
off is:

* Saving 32k of virtual address space only (no need to even allocate
memory for this range of the framtable), by
* Having an extra memory load and add/sub in every page <-> mfn
conversion, which is a screaming hotpath all over Xen.

It's a terribly short-sighted tradeoff.

32k of VA space might be worth saving in a 32bit build (I personally
wouldn't - especially as there's no need to share Xen's VA space with
guests, given no PV guests on ARM/RISC-V), but it's absolutely not at
all in an a 64bit build with TB of VA space available.

Even if we do find a board with the first interesting thing in the
frametable starting sufficiently away from 0 that it might be worth
considering this slide, then it should still be Kconfig-able in a
similar way to PDX_COMPRESSION.

You don't want to be penalising everyone because of a theoretical/weird
corner case.

~Andrew

