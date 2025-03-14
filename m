Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8A3A61B1D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 20:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915356.1320892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttB6O-0002dZ-7O; Fri, 14 Mar 2025 19:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915356.1320892; Fri, 14 Mar 2025 19:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttB6O-0002a4-3s; Fri, 14 Mar 2025 19:53:52 +0000
Received: by outflank-mailman (input) for mailman id 915356;
 Fri, 14 Mar 2025 19:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ttB6M-0002Zx-2k
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 19:53:50 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09845876-010e-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 20:53:45 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ac27cb35309so390373066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 12:53:45 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f0e4esm264417566b.72.2025.03.14.12.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 12:53:44 -0700 (PDT)
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
X-Inumbo-ID: 09845876-010e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741982024; x=1742586824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OlCdn30LuLx3jkLNkZf5pQ4aorBumVllxG/LbpbOxaU=;
        b=YMuYJe2lX/YIxomEsk4PSmhiIw+Un4RiGKWa5xhW5eKjdG4EwIzNsoNRYod/lnPUpP
         +eKOsE7d6GYp3U0k+xy/uy/CISj9uYtj8O2PpceOZ9C8uHCD+RxVudhC4bYjPBBxUDvO
         ksVGcC3NVjPNMdaTdoUQKoelkA+qMQUZfrYNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741982024; x=1742586824;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlCdn30LuLx3jkLNkZf5pQ4aorBumVllxG/LbpbOxaU=;
        b=iNN++//ew0OhK9LCfbiHkNEEzS+hbEWts4VS2uzozmj87PoQYhRruEs1yWGfDVMocG
         tCePgL1SsijHrh55ZOBgqzZCgTgJNFWPZWiXS522FxNX3ptgw3e9aTf0SiHMsMWP3nWX
         QFJT/7pK08aQ8NzWSfJoA/nUA+wK9QlBC4Q9tqKbX8DUFSG8AuLdnEuoTUssR4483lB7
         CKf8awS7VLmTm8W/XUhzHsToPihpC5kBP3J1CiygPk/pBJteXI7d2cnT3k3SBJEcxsms
         HXkhNikVgCTZ1lRLXtg3DIYbkHdvhIDFG6J6GjhT/nfFkRHAq60+bpthw0ISHUaIFiOQ
         pMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrqjkHoHV9fAlr1yx3FRY2igDsAyuZXQXrqRPSlliIE15FIDDXMuuOolDOLrct8i2SlVICFDf66mM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2OoLnVUkIjycg1yu+3P5Rz+Q9ruK1qGFpdzlCDuYFHKK1s3yh
	jo4fO8tbOiTutHAk2EywxrV3dy5SjhWplEqFnTNk//7XWjENgQ+W/66F995h9Gdehj0jzYdvDsg
	G
X-Gm-Gg: ASbGnctfOmBcDYLiATH8X3lP0lV2eeLVNIX4KagdDLddW54OeCj1eNWiojr3z3yM5Jz
	xZksmq6bv1WSUABbeUS/JfwJm5GzcVOF1B4bSh5dKv5xWyuP/vY0HN0LFatG5kHrgGezfF8vnm1
	bnYDV2tq/erZNAioiN3m7T0FxDSeFiAKvzdOml8AcLsmX5SeTBs0YdFT/kBzoPqsVqES1c28iOK
	KvuPuKOVY8MU9d1c4XOmP4rYDDuvkLJATforzz1YNDUfZrJWhM6Q8LlpZuglV8t5QcnM+AG/92w
	QEYZmjY1e9tuG0h1T+RCWd/zsuTFcZiCbZ/opsAwST0ksPy8GiZtPYZPiULZ2DZrlm/H/sD3sF8
	gvIPGmK7L
X-Google-Smtp-Source: AGHT+IFmoDGu/19XzP4LypzCLyqsP2keYT1aY78OnGJIYaMVXmiqcSfo2hrhc/kJ8az5h+fVnjiz0Q==
X-Received: by 2002:a17:907:7296:b0:ac2:92df:fab3 with SMTP id a640c23a62f3a-ac330181aaamr468296766b.16.1741982024469;
        Fri, 14 Mar 2025 12:53:44 -0700 (PDT)
Message-ID: <1a5ed8ad-0cc7-4e05-9b9c-cd6930d9b9ea@citrix.com>
Date: Fri, 14 Mar 2025 19:53:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/console: make console buffer size configurable
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250311070912.730334-1-dmkhn@proton.me>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250311070912.730334-1-dmkhn@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/03/2025 7:09 am, dmkhn@proton.me wrote:
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 89db6e83be..a471a9f7ce 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -425,10 +425,11 @@ The following are examples of correct specifications:
>  ### conring_size
>  > `= <size>`
>  
> -> Default: `conring_size=16k`
> -
>  Specify the size of the console ring buffer.
>  
> +The default console ring buffer size is selected at build time via
> +CONFIG_CONRING_SHIFT setting.

I am firmly in support of this option.  I've been carrying:

-#define _CONRING_SIZE 16384
+#define _CONRING_SIZE KB(64)

in the XenServer patchqueue for more than a decade now, seeing as the
default simply isn't big enough.


However, there's a subtlety which probably needs expanding on, now it's
being discussed in documentation.

The new CONFIG_CONRING_SHIFT controls the size of of the buffer in
.init.data.  We don't have .init.bss, so this affects the compiled size
of Xen.

The command line controls the size of the dynamic allocation.  This is
effectively a realloc() of the .init buffer, and happens unconditionally
whether the numbers are the same or not.

opt_conring_size is guestimated in console_init_postirq() if the user
hasn't chosen a value.  When allocating the runtime buffer, the larger
of conring_size and opt_conring_size is taken, and then the buffer is
progressively rounded by order until a successful allocation can be made.

i.e. there's no sane relationship between the options given, and the
eventual size of the buffer.

In order to not drop boot messages, the .init.data needs to be large
enough to contain the messages until console_init_ring() is run.  The
situation could be improved by moving this as early as possible.


Anyway, we obviously don't want to go into that detail, but it's also a
little more complicated than currently given.


Not for this patch, but if anyone is feeling at a loose end, `conring`
and `conring_size` should become __ro_after_init, and
console_init_ring() can become much more efficient by using 1 or 2
memcpy()'s, rather than copying the ring a byte at a time.

Also, "opt_conring_size = PAGE_SIZE << order" is UB when the user
selects 2G size, as PAGE_SIZE is signed, and will overflow to 0 if the
user selects 4G-or-more, and then all the masking logic breaks.

Given that the size is rounded down without the users consent anyway,
it's probably better to to just clamp a maximum.

Finally, the buffer doesn't need to be aligned on it's size; it just
needs to be contiguous (and even then, only for kexec).  Combined with
the rounding-down, this might result in the buffer being unnecessarily
smaller than requested.

IIRC, ARM has another case which wants contiguous but not page aligned,
and it would be nice to make this an available allocation option.

~Andrew

