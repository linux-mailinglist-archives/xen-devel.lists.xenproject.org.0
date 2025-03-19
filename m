Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A43A68C83
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920479.1324639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusHb-0003LH-UW; Wed, 19 Mar 2025 12:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920479.1324639; Wed, 19 Mar 2025 12:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusHb-0003IW-RC; Wed, 19 Mar 2025 12:12:27 +0000
Received: by outflank-mailman (input) for mailman id 920479;
 Wed, 19 Mar 2025 12:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tusHa-0002uH-PB
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:12:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad21ba4-04bb-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:12:24 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4373555e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:12:24 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f8679bsm17513295e9.40.2025.03.19.05.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:12:23 -0700 (PDT)
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
X-Inumbo-ID: 6ad21ba4-04bb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742386344; x=1742991144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PYmYQ+6yJCJzf7IfSWBQl9dLR5kwDAiOSFcV3EDLZxc=;
        b=sBKYxNCR9fGrkTXqcOgKIUi1ibEktrIr9+k/1UdYbLqz0zDZ7GSKtVFDo6uessAEhK
         iSrWnKsjMiAB+dNRUxPXH01lYFxUMQDSkaaSv2ODwefTuTWhRX43LSs5RnzBXHWi3swE
         1LvnFk1xnDNh78QDHvt6Furl+VOvnFD8k4few=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386344; x=1742991144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYmYQ+6yJCJzf7IfSWBQl9dLR5kwDAiOSFcV3EDLZxc=;
        b=c4uAZk4uJHUGX1SNsftogXY5qjfysBbw27MqCWwsALJ+mzK+rbJwqliltYBeIRu3gL
         I7Vni8K7UGiX9WgxFUIdA8Y3WAaJtnifEKKpXFlnJ63/QSxNxyCQcfG6hIYPqE8JwNG3
         GecMJkWQEWenC3GNgItvOaAhi+c26x+NKHdI7FuqcZ/bz/si1e766/Gd6Q6wJ8LMY4Dy
         4Nq1z3nLDs0L+8z0p3k0+E9db/y5LxZ7Em1SKyVapBFvPQRdDt7s52dYF+7vCq26/v1V
         HoRT6E3qRvKfLvz/d2jaW3LWLTN4mLgIk2V3WbvM+hBRSAH72/4ZCt67CYQhnpgQS23R
         yRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRuhr2U5MzSmInnOLAEcZX1aLb4Qcx2BDDmacpovB+/SkcgKWSEtN8Etl4N4SVcg9tBrVyPC1RK6o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxBopGA8s5ZeOXIfEqG5whi0pG9+N7umHvi/v/1cWE6gfsS3Oj
	Y5YL4pjjkkrnkmnR53Jl8VvHYIQNP1dYM/cUZW3EYy0WPkyk7a7lVhUaoAZPq9E=
X-Gm-Gg: ASbGncvUUiinc8rKqBJVD9tEftQ/uxXmakfDGl/4yphgqyv5tGhRCg0XfeAi97CUrVQ
	O3SyLCaCVM9aIn4KhVA0azjLxbW11hw2zOQDkI18qZKqhZZCUaLI7tcIOaKNw+yOklf9c5gDpcE
	Aj5bcbkxkWh2GUFr8MrF3QYKpxl4WsN0NscoJvvJ73GBxYm7DI2smAa+TtthqhtNF4lpeW0ErDR
	iR9dWIXWG10sY15bL2wkWd7buLE5E/bLULwoPVRC4S4DTO+0ZodAPipJTcgSdPSj9g6xbP5rvRO
	OXMGICBhyPgDVsbqlOU1DZwPSgKM6Kqr3h/UdSXzwVAwfkb+Yr+qmtYVIdcgHPInItQYrGr2QVP
	7XkYKUx8M
X-Google-Smtp-Source: AGHT+IFNA2i+p4SnHPxP7Yfu/uEXmvRvZQmnWDJKHQ9PDu9IedmFdiOmqHddd3VBsLUmDDb/opcQgg==
X-Received: by 2002:a05:600c:6b11:b0:43b:c305:3954 with SMTP id 5b1f17b1804b1-43d3b99b942mr49345695e9.8.1742386344046;
        Wed, 19 Mar 2025 05:12:24 -0700 (PDT)
Message-ID: <5b959741-2e51-4576-9219-df495d0e30be@citrix.com>
Date: Wed, 19 Mar 2025 12:12:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: account for module command line length
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 11:18 am, Jan Beulich wrote:
> As per observation in practice, initrd->cmdline_pa is not normally zero.
> Hence so far we always appended at least one byte. That alone may
> already render insufficient the "allocation" made by find_memory().
> Things would be worse when there's actually a (perhaps long) command
> line.
>
> Skip setup when the command line is empty. Amend the "allocation" size
> by padding and actual size of module command line.
>
> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -712,7 +712,15 @@ static int __init pvh_load_kernel(
>       * simplify it.
>       */
>      last_addr = find_memory(d, &elf, sizeof(start_info) +
> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
> +                            (initrd ? ROUNDUP(ROUNDUP(initrd_len,
> +                                                      elf_64bit(&elf) ? 8 : 4) +
> +                                              (initrd->cmdline_pa &&
> +                                               strlen(__va(initrd->
> +                                                           cmdline_pa))
> +                                               ? strlen(__va(initrd->
> +                                                             cmdline_pa)) + 1
> +                                               : 0),
> +                                              PAGE_SIZE) +
>                                        sizeof(mod)
>                                      : 0) +
>                              (cmdline ? ROUNDUP(strlen(cmdline) + 1,

This piece of logic was already bad, but this is rather worse.

One patch I made while doing the boot module work is:

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 6a4453103a9a..7292ddd07276 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
     const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) :
NULL;
     struct elf_binary elf;
     struct elf_dom_parms parms;
+    size_t metadata_len;
     paddr_t last_addr;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
@@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
      * split into smaller allocations, done as a single region in order to
      * simplify it.
      */
-    last_addr = find_memory(d, &elf, sizeof(start_info) +
-                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
-                                      sizeof(mod)
-                                    : 0) +
-                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
-                                               elf_64bit(&elf) ? 8 : 4)
-                                     : 0));
+    metadata_len = sizeof(start_info);
+
+    if ( initrd )
+        metadata_len += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
+
+    if ( cmdline )
+        metadata_len += ROUNDUP(strlen(cmdline) + 1,
+                                elf_64bit(&elf) ? 8 : 4);
+
+    last_addr = find_memory(d, &elf, metadata_len);
     if ( last_addr == INVALID_PADDR )
     {
         printk("Unable to find a memory region to load initrd and
metadata\n");


which I think I ought to submit as a prerequisite to this, after which
your logic squashed on the RHS now becomes an expansion of the `if (
initrd )`.

Thoughts?

~Andrew

