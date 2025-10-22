Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6ABFCD12
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 17:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148369.1480446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBaat-0002iX-Tv; Wed, 22 Oct 2025 15:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148369.1480446; Wed, 22 Oct 2025 15:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBaat-0002g3-QS; Wed, 22 Oct 2025 15:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1148369;
 Wed, 22 Oct 2025 15:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBaas-0002fx-Ri
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 15:17:42 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4022977b-af5a-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 17:17:40 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso6850675f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 08:17:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f7dsm25190309f8f.4.2025.10.22.08.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 08:17:39 -0700 (PDT)
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
X-Inumbo-ID: 4022977b-af5a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761146260; x=1761751060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G2P9JZm+DdvlhD1OtJvx/Oox1Uok0kmfHvBuDHcXGDE=;
        b=JKKrUp4aXoYJaOV+6mhaA13ZCi9mIvV44mXWbTxa/jvcWbhpjTwNTmeO+hKt1iXRCF
         oEnU9l4KHm99Cn6xxp4OcZjR5nZBJqZOmFPxYEPS6HqixYsp30rJa86zEO07Kh3s1sep
         RZy8suw7j0Sc/nY8nuYrKaMW9JzfjINbhQZSpimPnnK0y0jB0uIWMi8mSvAKY53ht6ca
         ++4z+8nNxbpIvrjtVLfAFF6C4MMbsg7SFILNThvC+76yJqpi4qcPnpon+cvtGfs08sQg
         oVmMgplp7qCjPaar2PXEbxNtldyHLEDwNWNyIWCinivUkfkidqcUIFZxk4HkR7kfk9JY
         hY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146260; x=1761751060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2P9JZm+DdvlhD1OtJvx/Oox1Uok0kmfHvBuDHcXGDE=;
        b=F1FzvgNN512FXE01gh4fnbgoHus0JAmUpMCmykA0pwgvcE49Cg0Q4KSS5yDd68z1tD
         qbfdNAL67Zbt6bHKJOz3l/DuBy2Nw003V+wrrU81WQSIMPCDsaLOTeY5mJelwglsUl/Q
         T7L5FhPOZpzG2otxnpS/gk9T5w4yeA1Ic7RvRmvXhkBzKsGDg215UZ5FYr0o+hoZcEgg
         cO4JSngYC8YCYZH+tKaupSJqyQRr4qjgEepm3rCUJJEHyRRYz7hzs8qxC3ESjam/6anT
         V98G7aiYM885CMGsThTI9PJ4rnytZHwDBgv3Dd3bjH1XJS8v099vqqFV3TF5skEQylGR
         qnaA==
X-Forwarded-Encrypted: i=1; AJvYcCVH7tNlKRTYSGX6DnYvyxogq+nkdTamIj/HY3hqHrl5J79SEc59/40k1sXaTPzhmdVYxjrAOn8XAlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg4Bw3P/IL+p4U3p09ftoh1Wvhuyvtf3kYb9wuA7kG/pAPupdD
	hEKl1z5WzD+gRzAYpfz0OIplPYmGEOaJf7h2pCZmKF1sVaqvkHSBABOyvGHhUqaKMw==
X-Gm-Gg: ASbGncsLP1yVfo5Ce/kWwmvMRkOdr7uiaKhbIr+DceyRvmsLTWuIZ6XIOcm8HkscPQs
	mpKppbwmPH2DiImnfXp+UoCsAdbEChEP7OCh5Hby9TPTqIaMbvul2vpVTheH8nM+qxS7/rNXK7U
	JyjxbqLHWeaLJGVU4mYSmp759QeZVBDVNvxT2CcEygPi+jgW+jW2iuSB4TFq+TLuS7F3dGSGD0t
	ywnCdkSn/w0Iwaqfiaf9EG3NY2q/AZll9Ap/rEnXC/DdBk2RDOpEdlPAEVdXA/hZBYk8AV0eN04
	2TQ22uE7HdxTRQEPH6LXLiQxrLq0A3EOl4xeVxsI5xtJps1rp9Zga1UBoXOaAiGpNJDKugVnnHd
	eQQ7DSGOe+TAZeOkGvaR5i1xhA5hhxinc3dvUQNDRoIJRCjxOdLsXld82Bb6R18dxTPCbzrTzcr
	gND/KAM0GlEhD6BaXd03ePPbvzwm7ybzYbSev7lyq3ln2elTgWRuhs1VB5wKLsTrDiRvH+4No=
X-Google-Smtp-Source: AGHT+IH8pnKqtf6p3xNcX53dgpB44rxZwJs2M69bwgf2wu6TfflwO+FOQm4rl0rdrnKOxBOq1Vk4mw==
X-Received: by 2002:a05:6000:2888:b0:427:2e8:fe53 with SMTP id ffacd0b85a97d-42704d7eac3mr12240184f8f.6.1761146260117;
        Wed, 22 Oct 2025 08:17:40 -0700 (PDT)
Message-ID: <266ebf6f-6926-4401-aa66-8b2f180cd90a@suse.com>
Date: Wed, 22 Oct 2025 17:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/22] x86/tpm.c: implement event log for TPM2.0
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a86083c305921cabd2df33a9eda2e2854600b20b.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <a86083c305921cabd2df33a9eda2e2854600b20b.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> @@ -769,19 +807,11 @@ static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
>          }
>  
>          if ( hash->alg == TPM_ALG_SHA1 )
> -        {
>              sha1_hash(hash->data, buf, size);
> -        }
>          else if ( hash->alg == TPM_ALG_SHA256 )
> -        {
>              sha2_256_digest(hash->data, buf, size);
> -        }
>          else

Please omit the braces then right when introducing the code.

> @@ -832,26 +958,15 @@ void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
>              printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
>  #endif
>          }
> -    } else {
> -        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
> -        uint8_t sha256_digest[SHA2_256_DIGEST_SIZE];
> +    }
> +    else
> +    {

Similarly here - please get the style right when the code is first added.

Jan

