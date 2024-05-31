Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BF8D56C0
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 02:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733143.1139248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCprT-0004yV-SV; Fri, 31 May 2024 00:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733143.1139248; Fri, 31 May 2024 00:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCprT-0004wH-OQ; Fri, 31 May 2024 00:11:11 +0000
Received: by outflank-mailman (input) for mailman id 733143;
 Fri, 31 May 2024 00:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcd8=NC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCprS-0004vF-Ro
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 00:11:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4824f835-1ee2-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 02:11:09 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4210aa012e5so16181745e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 17:11:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212e4b1ba4sm927335e9.39.2024.05.30.17.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 17:11:08 -0700 (PDT)
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
X-Inumbo-ID: 4824f835-1ee2-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717114269; x=1717719069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i2pAKhjleKNGk/T56K69zZ4GNIwwq9AiC1D8esE9Tfw=;
        b=GJI1oYZa71LVB/x8GioSRHpngdxjqa2nm7ALgQ+mAqJIyZatlUJV/ySgpKuQ29BNpE
         dB0E7zALTqRKVLg+yKqkl3X8lsHlqwcAo5ySRhj1Xzdu5jq8PZD+guehwRIiQZt1gzAm
         AtA/0lTLqtK5E/KA1Ub518TqQPrSMzRYFEJsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717114269; x=1717719069;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2pAKhjleKNGk/T56K69zZ4GNIwwq9AiC1D8esE9Tfw=;
        b=mC2CEiT48y8Xlhzd/fT2GCjgTLINRjRdP/i5gqsyB27FH4oyK3ppZ+fnwIJ5CiW9WW
         x9m8lQyDI3bcOkpLJHC3PXYKqRH49+TtXdYc9DrCyPc/aHiuYn2ErhBwIlFC+e3qLFtn
         XfwFAxcdOkjRfCGUzbLzQSdTfiTQbg2EBW4Wl5QaGg6COkve4x2YM9eInFJuSNhCz5g/
         hjW8lowHc6MQGgoHdqdCXM5Xc4UIYDgiO8UrTvtc9Oy6TCLjcfZw+Jt+p7g4zN71uPUH
         RAOl41wnnAgSIolTvXz6fOacB1sg526E6dIeD3aYlaH0XvfB60pUcg7zUviav0R4AcDN
         +INg==
X-Forwarded-Encrypted: i=1; AJvYcCXJuQoAIvNYANnR+xX6zXJ5VrRU3Liat357dF/GwyDMqcaza82dDwR7/4unQf19Pl0TY9vUJQ9EVK6E1tBsRtuw+RfmmLFHXl9so+RjD9k=
X-Gm-Message-State: AOJu0YyvBLVJF5NX5vUgEZBJy/CZYl3QTaoDYlwYy52eyBQ9cYHyki5y
	/51gDNuj/X35bCyT70tJKoeUgwpDcyuGnbw0g/Ffh2ZgaEgvYPdmE/29HpkurRM=
X-Google-Smtp-Source: AGHT+IGnKMLnG9o6dLTi5nBVaDAPo1tRuPcVXjAz9/xrvlHs9JX1MWr1k6FDf7weCaxTnhsqG5qMMA==
X-Received: by 2002:a05:600c:8a8:b0:418:df5a:3fba with SMTP id 5b1f17b1804b1-4212e09cca8mr2290385e9.32.1717114268900;
        Thu, 30 May 2024 17:11:08 -0700 (PDT)
Message-ID: <40f9e04b-1238-477b-81b4-7c880b363797@citrix.com>
Date: Fri, 31 May 2024 01:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/8] xen/riscv: disable unnecessary configs
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <35cf9d52e538aab964a3ecc050260abb3f27c60d.1717008161.git.oleksii.kurochko@gmail.com>
 <0f12ce69-b139-4d97-8e36-23dd7c6bea41@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0f12ce69-b139-4d97-8e36-23dd7c6bea41@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2024 5:44 pm, Andrew Cooper wrote:
> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>> To allow CONFIG_ARGO build happy it was included <asm/p2m.h> to <asm/domain.h>
>> as ARGO requires p2m_type_t ( p2m_ram_rw ) and declaration of
>> check_get_page_from_gfn() from xen/p2m-common.h.

Actually, this is an ARGO bug not a RISC-V bug.

It only builds in other architectures because of transitive dependencies
through asm/domain.h

I've fixed up argo.c to include the right header, which also prevents
(for now at least) adding to general tangle which is asm/domain.h

~Andrew

