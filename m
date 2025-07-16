Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7EB07902
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045320.1415414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3gG-00030i-Pp; Wed, 16 Jul 2025 15:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045320.1415414; Wed, 16 Jul 2025 15:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc3gG-0002yP-ND; Wed, 16 Jul 2025 15:04:24 +0000
Received: by outflank-mailman (input) for mailman id 1045320;
 Wed, 16 Jul 2025 15:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc3gF-0002wj-32
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:04:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252aad80-6256-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:04:18 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso51130715e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:04:18 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e820e4asm24174095e9.23.2025.07.16.08.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:04:16 -0700 (PDT)
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
X-Inumbo-ID: 252aad80-6256-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752678257; x=1753283057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WzTK4erucAYm9mNJqDTBUm2D8M2EoBM/KHYBWP7z+M4=;
        b=qrUWU2QYYTYKTm5A7cUvbWx1moosG2Ne7e0i6Qy+ROD5CVfQGDJhb5EL5UpiISEwaM
         bBqZLJ2el+LaCRm7yCuBbDD1BPXmhwoGGWuGiy03OEZrqFenYIkCqjMYttRMNU46pdJM
         QlrjuNOGJ4GzGu3FBCFOqBmucWie6iCStksf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678257; x=1753283057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzTK4erucAYm9mNJqDTBUm2D8M2EoBM/KHYBWP7z+M4=;
        b=Xy2JFEkG2mV/I3V2Df3hCb+/OF3JXFwrWQ17TANzfNL2E4XbcVQ5EOM5zTqc2ZLaEl
         gVcgfxQMqMUgMBCcYGstUS29LeDBTfaSzRUgBHA0VHtxmgyCKnpYyygxC+QFoF6gQYT3
         SXW0MTFujxld6iiZimt3HA6Q6kqUjqDozwtWdMtQnil8ccOrnqSEFdLnYd3GjRM0+Ld2
         ogoLMRXgvx2F7bQx2qD3p2e0w4GkeCX1UPdFFFIhTp8Si90ZS3jBW2nbnkyfcGweM/HU
         SwYS7zlArPYef2QnK+2Uedkm85xDm3wfVdjuwz0+BKvwnLeFpg/tBTXiO+F78M5IcRiM
         qqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUSzgYlV1UljtnGT1wfP23ijxVOk5HKsUufy/HGvzCf7jc/ZagJkLtjcSxi4EdjruA7sUz++67aNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfmzYlI6um/gb00gLtMamJ2JRfaYBmzw/PL9479dRJIAyqYuR7
	A9us+iICR7OSpMAmZsNt+dZoUH6YT7I33o9ef8CFW4LipHWHngO16UXDkk3jLSSzIaE=
X-Gm-Gg: ASbGncsH5z+grsEwEsiSENeClJIxQKIG29TTMmupePLP9UbKNSPZuHkMMlgi52ilGZi
	Mz0PS4G/fbGRkTaqZK4yu947HgPuDHhNyYcRG4h8HjLlayon7UycoowUtM00roBF0MEfPCdmRwD
	1ZT7bV9n0WYw2lkQHcWbEkpa6B0YYeD+jhCgJ4xtnLqr1On6Nw44s/uuRgvkeHwJBPAX4rz/uEK
	oS6YbxEYYBCnj6ZlOO7ooKtkuU2V6kewSPY+8+0KGDWxjK6GsjMjoJmVBZVew/w8LmlEt90D3/B
	qTlhtOwPSiF3KBHFM8TcZJMbjMw8umOOMay4XQGYp7wlehdJxCruJsPVlbAYttoy74B8gZ0/HTe
	FRC1oJdMJGWt2AAZiCb2nPsDX2xagqP4lUP79NuxiG1wg7D8IHgNBK6T0X2b6H+XZBUhT
X-Google-Smtp-Source: AGHT+IE49zspH6Vx+3bkIRR5B5x5pu+lPqEq28EgU6XNPRQdYMrYMEuj0j2fjghmZirwsTl5HIpsaw==
X-Received: by 2002:a05:600c:450f:b0:455:f380:32e2 with SMTP id 5b1f17b1804b1-4562e27650bmr37731895e9.18.1752678256957;
        Wed, 16 Jul 2025 08:04:16 -0700 (PDT)
Message-ID: <5f47ede0-aff0-4666-9910-45d3da6c20fd@citrix.com>
Date: Wed, 16 Jul 2025 16:04:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/CPU: re-work populating of cpu_data[]
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <4c4ff91e-ce66-428f-a360-6ffc55659e79@suse.com>
 <f89d1c20-1967-451e-a6dc-510421604427@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f89d1c20-1967-451e-a6dc-510421604427@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2024 12:53 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -413,6 +413,19 @@ void __init early_cpu_init(bool verbose)
>  	initialize_cpu_data(0);
>  }
>  
> +void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
> +{
> +	if (!keep_basic) {
> +		c->x86 = c->x86_vendor = 0;	/* So far unknown... */
> +		c->x86_model = c->x86_mask = 0;	/* So far unknown... */

You're going to need to turn these into 4 separate assignments for MISRA
reasons.

I'm not sure of the value of keeping the "So far unknown" comment.

Also, can we please switch to Xen style as we're doing elsewhere in
these not-really-Linux-any-more files.

With that, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

