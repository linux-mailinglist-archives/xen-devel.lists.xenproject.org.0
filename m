Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DED85179F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679628.1057166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXu8-0001bZ-GX; Mon, 12 Feb 2024 15:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679628.1057166; Mon, 12 Feb 2024 15:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZXu8-0001ZI-Dx; Mon, 12 Feb 2024 15:07:32 +0000
Received: by outflank-mailman (input) for mailman id 679628;
 Mon, 12 Feb 2024 15:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZXu7-0001ZA-5K
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:07:31 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70fc8082-c9b8-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:07:30 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b2fba3176so2011088f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:07:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c14-20020adfe70e000000b0033afe6968bfsm7010255wrm.64.2024.02.12.07.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:07:29 -0800 (PST)
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
X-Inumbo-ID: 70fc8082-c9b8-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707750450; x=1708355250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xx6RQITngQNSwNElmlNiSCVTEr0o1+m656emyig+vpk=;
        b=RVKksXhGOyJ2HgPO7OY5a0StgQRBuVqbk414bszVE61ZOabJIyfyyXm8Fiakh3ssrq
         DGJgMZoMK3MSUdWe+N84QcOtKR+yPfWXqKQb8YqTI85rGttqYxWDI6l25ZXRMpOX/FjK
         Dxf2sIQzEL2vsjWvOzbOZGSdvZ4xSOMMEh+UXnYckQOeJcqi6XF/eW0bsoIt1h9IokiN
         ttnTvfJSDpOL7MugP7j1zU3N+TIABVcjSC04mgJenDVGItWt1Gi4wqzoEt3g9eGNKqKg
         5BJxE0CigNJiMJt+vMbRhoc6OGJ9s5iBgsucAHQYc1cp0IMaNBtRp0KQUCc3Z05w6i98
         0zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707750450; x=1708355250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx6RQITngQNSwNElmlNiSCVTEr0o1+m656emyig+vpk=;
        b=WC3wvIcHLEL+fu6+8G7X/Ab9cB4V/0vxe/kZsr0S1pN7gHLxhvuCRBlbrfu0W09BZm
         ztwFY62D948M0AOnE9FmxADqL6POZ6hCQj5hErre6gP+mjzdI/2SeHtfE1seXuo5g5v1
         HQWV1+gVMF00zsl6zCafDWsntN6tHLqUkAsqCxh1pCh8ZASte57EIYnCO9LMFWtn5VzH
         nh/6B5SIrH+Arpa9GrsTBr4ajr/28Fs6R684oup2yk3gntZc9Eb5UFHO2pwm3nJy8FjR
         Yw7uEi4E25sH2WAWbsahMgvfnFvgfwbr1/6FAoIvesMxh3gcs8mitHQL+A7tZN6kJg+M
         RtOw==
X-Gm-Message-State: AOJu0YzNkGCLLqsJctUDgRINDAO/wGhtLiwj7EmV9NaUcZWdmNa6lp9f
	MkUU1W+k1YhPo7bgLnQz2PNm3YaTzTsRl91b44xlm3J/n13CxL9+Dzpx2BvW2Q==
X-Google-Smtp-Source: AGHT+IGDUu38GjGFZAmi+ROQD3XMA31L4ICUeYy/rFtr6wkGL+UgxYpFyX5zKu34mt6H7kbQTYy8VQ==
X-Received: by 2002:adf:f84c:0:b0:33b:87fb:7106 with SMTP id d12-20020adff84c000000b0033b87fb7106mr1080013wrq.55.1707750449791;
        Mon, 12 Feb 2024 07:07:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfkaL3V42iqGsWTiCtvzEICpcWqDLN22JNi+m45yDPedPcufz9jza3B9QCfjfzyMNn9j1jUbdguWCQP3PoDeo0g0KiutceyG/3U5EuKVrbRymM3wKjfPY1GTOC4OJwIEAwh9VVCxSfht7j41fr4t8VkAu0JKUPvx/qVrSH8fnYatH30gatjq4Dmx57fGesASmpFJOUgUP/9/XXTWGnO1wsSOhqq3s3Z+szm2m0Vva2tFd4QFCA8BD9Q5p+fkoecsNrx7sH71oq6U5/HiT4JjKjUWE5/HpMpKJF0MDEiWfyoaHvbuVcl7w=
Message-ID: <ec76c372-8c17-4550-9896-eab3e0ab0c66@suse.com>
Date: Mon, 12 Feb 2024 16:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/30] xen/riscv: introduce guest_atomics.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <542c61229e1056c3fdec3a5c086136e3b5909b07.1707146506.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <542c61229e1056c3fdec3a5c086136e3b5909b07.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



