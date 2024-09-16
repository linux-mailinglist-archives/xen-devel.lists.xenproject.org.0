Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8CE979B1E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799124.1208956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5B9-0006JG-9i; Mon, 16 Sep 2024 06:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799124.1208956; Mon, 16 Sep 2024 06:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5B9-0006Hl-6G; Mon, 16 Sep 2024 06:25:43 +0000
Received: by outflank-mailman (input) for mailman id 799124;
 Mon, 16 Sep 2024 06:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5B7-0006HR-Lz
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:25:41 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dfa7ad3-73f4-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 08:25:39 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so5446961a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:25:39 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e4b87sm272395266b.179.2024.09.15.23.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:25:38 -0700 (PDT)
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
X-Inumbo-ID: 7dfa7ad3-73f4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726467939; x=1727072739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqVaUY7ktoCHFVyQqPcE6gtwOL0sft9wlTHMy8uT5RU=;
        b=LViCQ90hAwJPxdOvpU/AcUdq9Hyciux0uGfPdWZuCtY6xggBSH1YZXP2hEFjzbXllv
         db3rcvgzah8MnRxJowMtCktmIY07mQtsfnZ+EhFadfMjyX7Eu01YvPBNw849vv2+LZzY
         E84cB0hkD3lxVvCihi5avn74LP4WRG/TR4/diuWfifsMs6LXuKOGFRt0X+G07jfBeKGS
         LMzVpj3klLFlFCadECokJEwru9+cPTNtKDEGOqxSmzSwtWEKr8+sfdRh/TMISXu0h4+K
         HMIKCdWQN5icDhtRsFJ20RmYijqSk+HQRp6ccYTIkopHk0vbQqW58pOVQknmibn5ApIT
         sPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726467939; x=1727072739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqVaUY7ktoCHFVyQqPcE6gtwOL0sft9wlTHMy8uT5RU=;
        b=TAlVhK3poX8K8USe+cDDoIWgJQdxG3IjNRwUPlRZIzJbPeMnuX5SxXAUTmPmbhYRxG
         vO+cMwCn0YptAFMwJm+Qx2P5DJw+eR/ryWKP4yNi/ZX3eZZQyeS0dlq1e5WXGVqrnvrX
         Bi7rCpxP8SMZSCQI8VfSvJz00J9CECQnD4zD18mBobl4CEYS4U/P7bEwAhtsoGyTGul0
         94hJQ7SNSrfp/uZdoEMfjj9EOgdVFwfsGInhCzlHm/9lPlkxUkg7WQ1F1LPIF93pQQIV
         dKzihvatjd3AnTZqcXNy5SFN8gQAgxYsT+90lc6BmwIJWZznMxK8rQQ7S9D9JIaxnuI5
         B18A==
X-Forwarded-Encrypted: i=1; AJvYcCUS9oRuVIIhyGUIQ0r5s/3qS6pNQs8RDaNp0IvFpcGGJBMhJrqpTH23krj27y8feVQ+1NAp0DBIayg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqvul4W9jfi7Tb4kox6DUFy4PKAuK6VoRVU+DW3biDyusMiu5s
	pgx6hkvfd3Xedc27W0jK+Mb9wt90Z/JVFFidFH6D0muWgBqzt4AdIkfmy7WdSw==
X-Google-Smtp-Source: AGHT+IFKq1L1K+YX4dhrq5uRfKGhCLoBl8vILt2Dy92s65PgcR2trdUg7rDhipABDIn2f0QQC1V84A==
X-Received: by 2002:a17:907:f148:b0:a86:7c5d:1856 with SMTP id a640c23a62f3a-a902961df7dmr1450722866b.46.1726467938801;
        Sun, 15 Sep 2024 23:25:38 -0700 (PDT)
Message-ID: <441d53b7-71ee-483c-8d46-b3f7efeda023@suse.com>
Date: Mon, 16 Sep 2024 08:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] xen/riscv: allow write_atomic() to work with
 non-scalar types
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <bf5c566bd4c2adf0518a9785627bdc5f12a7187b.1726242605.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bf5c566bd4c2adf0518a9785627bdc5f12a7187b.1726242605.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 17:57, Oleksii Kurochko wrote:
> Update the defintion of write_atomic() to support non-scalar types,
> aligning it with the behavior of read_atomic().

"Aligning" would imo imply yet more similarity. Types are different,
names are different. How about "bringing it closer to"?

> --- a/xen/arch/riscv/include/asm/atomic.h
> +++ b/xen/arch/riscv/include/asm/atomic.h
> @@ -69,10 +69,11 @@ static always_inline void _write_atomic(volatile void *p,
>      }
>  }
>  
> -#define write_atomic(p, x)                              \
> -({                                                      \
> -    typeof(*(p)) x_ = (x);                              \
> -    _write_atomic(p, x_, sizeof(*(p)));                 \
> +#define write_atomic(p, x)                                              \
> +({                                                                      \
> +    union { typeof(*(p)) v; unsigned long v_ul; } x_ = { .v_ul = 0UL }; \
> +    x_.v = (x);                                                         \
> +    _write_atomic(p, x_.v_ul, sizeof(*(p)));                            \

v_ul is an odd name for my taste. Why not just ul, which is closer to
read_atomic()'s c? Preferably with the adjustments (which I guess could
be done while committing, so long as you agree)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

