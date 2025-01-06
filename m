Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA79A02847
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 15:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865770.1277038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUoIi-00077s-Vr; Mon, 06 Jan 2025 14:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865770.1277038; Mon, 06 Jan 2025 14:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUoIi-00075s-Sa; Mon, 06 Jan 2025 14:41:52 +0000
Received: by outflank-mailman (input) for mailman id 865770;
 Mon, 06 Jan 2025 14:41:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUoIg-00075h-Qi
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 14:41:50 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca1eac2-cc3c-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 15:41:49 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so7947357f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 06:41:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8ac97fsm47415069f8f.92.2025.01.06.06.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 06:41:48 -0800 (PST)
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
X-Inumbo-ID: 5ca1eac2-cc3c-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736174509; x=1736779309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fzPSGaSXvLw8O5qFfodSX1BVmEDbqzNhsRiBtQfmk/0=;
        b=Fe4ARf/ZN691Amm1ayxFrPH0xAkBMO35e2oQvygpQIHwLlWe1kCyk0HcRP7N9kwpbD
         ZfbsjAoz35jJh4qV6jD1hCU+EuvH7Mm0KCwliXarUcygBz43iJ6hoatQjxCr/1G7LEWX
         QUxQYyZBggvcCtQkUFmQCoLRgF79Cir1tHBTt4jop+uiAPEm4VwE3EWHQmdFo4Vp4d2S
         d3PV8xoKtos+RtUO7KztcPi5oEXXj7Bd5jcven0pbxr3DLPcz/+U7nnjkdK/fZ6i2HI+
         MmYaJlNJ2T1w18wCW8HTaP/w2aaQgertYUHJCfngp7lFZBrR87+OnQOAquhjUSwmqbZ6
         YZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174509; x=1736779309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzPSGaSXvLw8O5qFfodSX1BVmEDbqzNhsRiBtQfmk/0=;
        b=ZFMld5J71P95ea889+uui5MGfymKyBOfchI/NCkQ1HllOPXFXYDuk4BnG1aO/SiSNi
         7iB1lL5gh8JIRpi+d6pXRFE8MToMAzJu+C8CKjTEaf8V22UDmx1Gu0k9OS76FXf4hQ57
         bfuj6us7qgybx6KRVe84DW41frzNVDc8Pky9CiDwRTVednwkUZPhxZisPt28fPRqQkBK
         ib+COmRyJilBk2riju484kXwPzTzFKQwg+N4aGD4R8DVqGVN6b8/fcucEj88estOhyq0
         v7xyLse2azrUDMq87zGI752W7r+3lykSglSHV2WikHqJnE78JIACNyuuNtqlumyRyTYB
         Aecg==
X-Forwarded-Encrypted: i=1; AJvYcCXvYg/3KeAg4vVEA0Un2edTj54OXOhkHU5dGlmoNJRYSpHN20cIj+f9zItwOdB75DfH36PpLOdGTEg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySlKLeGj1wlkorKrCdxU4dDD+e7/171NyAF4jTLW3F7DsqkW5Y
	v80fphonxrZgoimAkxshiF000dqUeWzF8bAUJyGA94jfzttfA9oTjt6cU/Wnqw==
X-Gm-Gg: ASbGncvHOuSos+yg5BOyfiAcdylfpUg/s/ReAwVA2+O4bEpWM8gIUcHn6PM+LGHg+4P
	lgQbf12mNFpHu8mJYWPTOvqHLsp9eiesh4jiS1OgIr2doLJUrJ7W7xB6QaK3nK4zXfHgTDb4M1v
	HMx14PlAE74OwgqncxE1JpREcHuE0yvMJoz7M1+d7/6K0WUx/9pnY6Dzd2XkctqGy3OAsusPilT
	dTLgPKDaPj87X2ziZdR9U8hIhA7IKjUnzEzwkxyKWSdwWoM44UEHufQjfELVhgnL/ZEQ3hyzIT9
	NH2F0QoHUZRAZVjRVSv6r13Xbsx39A6ExVcVD0iBFg==
X-Google-Smtp-Source: AGHT+IEorWSFPcmGSKPtJJ/om9Eo0dDS1m5aUQn0ClBGDB3yFozC7WapaVadzS5CFYJRtSK1GrxUBA==
X-Received: by 2002:adf:a342:0:b0:38a:624b:e37b with SMTP id ffacd0b85a97d-38a624be4e4mr13741297f8f.53.1736174508663;
        Mon, 06 Jan 2025 06:41:48 -0800 (PST)
Message-ID: <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
Date: Mon, 6 Jan 2025 15:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/amd: Misc setup for Fam1Ah processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106141929.615831-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250106141929.615831-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 15:19, Andrew Cooper wrote:
> Fam1Ah is similar to Fam19h in these regards.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> With this patch, I think we're in an ok position to declare support on Zen5
> CPUs.

What about amd_log_freq(), where the 0x19 upper bound may need bumping?

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -114,6 +114,7 @@ static bool verify_patch_size(uint32_t patch_size)
>  #define F16H_MPB_MAX_SIZE 3458
>  #define F17H_MPB_MAX_SIZE 3200
>  #define F19H_MPB_MAX_SIZE 5568
> +#define F1AH_MPB_MAX_SIZE 14368

Yet another pretty odd number. Are these actually documented anywhere?
And what has come of their plan to make ucode size available via CPUID
(for which I even sent a patch quite a long while ago)?

Jan

