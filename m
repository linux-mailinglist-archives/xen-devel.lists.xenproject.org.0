Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BABA727DC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 01:45:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928365.1331092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbML-0004Rp-05; Thu, 27 Mar 2025 00:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928365.1331092; Thu, 27 Mar 2025 00:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txbMK-0004QF-TR; Thu, 27 Mar 2025 00:44:36 +0000
Received: by outflank-mailman (input) for mailman id 928365;
 Thu, 27 Mar 2025 00:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4IZU=WO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txbMI-0004Q9-Qz
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 00:44:34 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a41ff42b-0aa4-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 01:44:29 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so290652f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 17:44:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efc90sm18535387f8f.98.2025.03.26.17.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 17:44:28 -0700 (PDT)
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
X-Inumbo-ID: a41ff42b-0aa4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743036269; x=1743641069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2zRnudDsm1YPUDsp/rGq/8rJn9zgkb4N3lQSmhYhgqA=;
        b=oaR4hrxurNEpGPyWE4HPcrPKxpb3recZi92lQYTHYx3S6IkeUKekSvOgnJWdzyMKg0
         s3NdmWvEonxh2Chcb0zdCHrfjFcGmzZvYhh/GcRJ1VvoL0BZRcU3aKEoLKemb82ERwY+
         oO5BT2Azskttl0kWFk164j4vwno/qlfvJInow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743036269; x=1743641069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zRnudDsm1YPUDsp/rGq/8rJn9zgkb4N3lQSmhYhgqA=;
        b=C5ZuKrlmd/I3Hf4tIgNBFXGMrt82X/0/epfXNSvHm/kjUqeQ0m8O8Pu8fqQ2qx6SPs
         2kcgjPDid44kpwFcB7ajJbF000JEPzvorNN/Az1TddQiTKU2YBLQh6M3t73AsVtYOKyr
         EK4ESJdy4Q7LrSnkMK0oGsvuHkgSK4Pu8VG/Re+WXj28z5lBtLiU/brzn1UG4xu2aWeA
         DP6pJ2A5fNmEfeoxYA94OozNFSs2TwpvGiuvuHsmCy0IUbMT2rzvhN/zWvEnGu2uDrNS
         ++l8fvl7PkZzOrCeKc5GkKZ4jnJq5pxMi2lfVwkGbby6mFr+UUerei26r5H4D+f9uqyG
         VrpA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Dt2AAK26emAhDzB9hQld1uoQf9G4fH7f9VmMCS0SQrt4iMMlz2TmfaYXgekEIgjamBT4AywyWUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUHH6U4GZIaOswFJwbManM9qRAixU26uQ5x8YNxyptNvVrnaVP
	2J4vYq91IUQQoKJfR87rKe/JCkzHXRhpF+kS0lMmBCTPIjonfEZ3mIJmvVydmEA=
X-Gm-Gg: ASbGncvdn252nMuzH6kavK7PQnKCpNC5Ts3EtWX5iieeXnKhJb/Fef5dPndjGJcEgDv
	yqIHh5+dKeqyKV96DkHdVsJGRBACiPPqxR+wo/uVi07RbIb03RkU8yr46If7eLFYzxa7YlcGOHb
	5ny6e+3MOrTpYhy7PPyEE6Nx1o7ct36+RPvTt4jH3uRWkCQyMxibiok8NeRyRvQfUEAFd2FMkqI
	Czp7QLYRiNG19bS9Z6PfktMRkv+ay7HProuhCP0SCV7YUcP5xZUiNME70BTBJbiQs7t9TnRPpex
	QiwP25xWnVNGZAuRZA7PVeGfOBME0Bm2Znog9UxUnEHpNTz/dniZtoKeCqOcp0th3AZezE44ND8
	xmrIfZwKB+w==
X-Google-Smtp-Source: AGHT+IFeB7ZzTeiSPN34z+pMTNTEtjhOVE2XodLXycae+Kk9EyvSk8JSWWRoVI6EnZvpsDBX1Umxyw==
X-Received: by 2002:a05:6000:1786:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-39ad174916emr1246170f8f.27.1743036268771;
        Wed, 26 Mar 2025 17:44:28 -0700 (PDT)
Message-ID: <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
Date: Thu, 27 Mar 2025 00:44:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
> index d888b2314d..dbbf2fce62 100644
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -98,4 +98,13 @@
>  #define ZERO_BLOCK_PTR ((void *)-1L)
>  #endif
>  
> +#define BYTES_PER_LONG  __SIZEOF_LONG__
> +
> +#define BITS_PER_BYTE   __CHAR_BIT__
> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
> +
> +#define POINTER_ALIGN   __SIZEOF_POINTER__

See how much nicer this is.  This patch possibly wants to wait until
I've fixed the compiler checks to update to the new baseline, or we can
just say that staging is staging and corner case error messages are fine.

One thing, you have to replace the "<< 3" as you're hard-coding 8 here
and ignoring __CHAR_BIT__.

I'd suggest keeping the BITS_PER_BYTE on the LHS, e.g:

#define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)

which tabulates better.

I suggest keeping BITS_PER_XEN_ULONG to be arch-local.  ARM is the
odd-one-out having a non-64bit arch use a 64bit XEN_ULONG.

~Andrew

