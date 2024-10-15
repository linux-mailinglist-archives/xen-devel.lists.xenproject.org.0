Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C96399DEA6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 08:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818998.1232295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bI7-0005dT-1c; Tue, 15 Oct 2024 06:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818998.1232295; Tue, 15 Oct 2024 06:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bI6-0005by-V0; Tue, 15 Oct 2024 06:44:22 +0000
Received: by outflank-mailman (input) for mailman id 818998;
 Tue, 15 Oct 2024 06:44:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0bI5-0005bs-VF
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 06:44:21 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7bf62d8-8ac0-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 08:44:20 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43117917eb9so44086415e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 23:44:20 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8b5:94fc:ce22:8335:8123?
 (p200300cab721c8b594fcce2283358123.dip0.t-ipconnect.de.
 [2003:ca:b721:c8b5:94fc:ce22:8335:8123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa87bd7sm736605f8f.35.2024.10.14.23.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 23:44:18 -0700 (PDT)
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
X-Inumbo-ID: e7bf62d8-8ac0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728974659; x=1729579459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Sr2I1RaZiZjliKmQVjZfJeuYKBmVSJVCPnttvu8Jw=;
        b=E4Z1iikIO0hmlj40tqGf+axboOT3ytwHkuI5VzGW7qPEbftBFafPYmLP9Imzyt1bqq
         c+NCSPFmUWsibyCteFPRo6WIRoeXxodQPutZ3KP4mgvRxjghd3rZbGja5SfXSExVcR2q
         pQFPZRodgpzVqOLtZMBHbxcodhz897DrJK+7qbf/W+mbrzoVirm5DTSJp6qSHck/RyB8
         eQsKfus7rMYzgL8G426xBicTmEsB6NhWnKwHC2is/g3ua5QGCol+oSvRC+lGF5luzebj
         6Q1LgpUdbalQsdFVBD+nZhLMOTXMjmmSFhJKLDqPvguh4lISY93mko7fKhJTyA3Lwd0G
         A5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728974659; x=1729579459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3Sr2I1RaZiZjliKmQVjZfJeuYKBmVSJVCPnttvu8Jw=;
        b=p7Wn/EIS8qjlPzLlL3MolVTRJbvkrSKOOmOkGxNHdYV6+h5sDsCqrmfl3udyUW0uPb
         cQ9UCmmd5kafjC7inBzYlLXgrqsIPboYqyNYulkbcQspcBwp8nMYOfaLmWi2zkDSd7Ag
         PY/jHh70Yu11vRigJgf9i150ZVH3AefM960mBH1FWftNJvWaTPvO/6x49cvmIicMEmve
         gc6gRszP4wKQ7J3Ri4KUgf/WBfzUn+FdHp7mQPFxdLp7a+eEJ98LXwN1WEtzg0EgyFWX
         0LOchO1GS6iJiCodSLdDoOZW7JtuzeNsX8OugoNQZyycq+wnKpZTjCEqp0de4XSGLlzx
         YILg==
X-Forwarded-Encrypted: i=1; AJvYcCWqFLUhGEHGD34ZzFwUbu3uRfoqzmvVbfeDJqxJjhXnLl662u3zCj1p2AI9F6f7TtaXA1/qlGeXeWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygda6wIi1qtQlyGUBfbjFvKmLSRoidjJ5zBzKZRqqnGfBPPXgV
	845EB2u7Qx70LuFMXKL2I8AMWV546Yfxeoe/Z9l86/OC5yt2p/fHBiTLaKWOQQ==
X-Google-Smtp-Source: AGHT+IGNoLFzkC6DUFLTGD+sCjpTtQ7UbdIgjJioG2IL2atSIk1lsbCw7ZMYQ1hlHK1/Rbn++jqslA==
X-Received: by 2002:a05:600c:225a:b0:431:40ca:ce6e with SMTP id 5b1f17b1804b1-43140cad71bmr6540325e9.31.1728974659287;
        Mon, 14 Oct 2024 23:44:19 -0700 (PDT)
Message-ID: <7750f224-668f-4fd6-aa7b-39264a990c42@suse.com>
Date: Tue, 15 Oct 2024 08:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] x86/boot: Prep work for 32bit object changes
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-2-frediano.ziglio@cloud.com>
Content-Language: en-US
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
In-Reply-To: <20241014085332.3254546-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.10.2024 10:53, Frediano Ziglio wrote:
> Broken out of the subsequent patch for clarity.
> 
>  * Rename head-bin-objs to obj32
>  * Use a .32.o suffix to distinguish these objects
>  * Factor out $(LD32)
> 
> No functional change.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



