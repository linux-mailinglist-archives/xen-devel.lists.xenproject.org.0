Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DFACAA25
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002869.1382270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM017-0002Jn-SE; Mon, 02 Jun 2025 07:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002869.1382270; Mon, 02 Jun 2025 07:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM017-0002Hf-P4; Mon, 02 Jun 2025 07:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1002869;
 Mon, 02 Jun 2025 07:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM016-0002HZ-Li
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:55:32 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f469ce6f-3f86-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 09:55:30 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso3070252f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:55:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf539esm65320235ad.194.2025.06.02.00.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:55:29 -0700 (PDT)
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
X-Inumbo-ID: f469ce6f-3f86-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748850930; x=1749455730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=na4hsWIUgzqP17/7nLAHiigP7fiaicCJrWy9v/JjPtQ=;
        b=E6t+H25fDHPwcnx/YTFZm2YItJuUd146j/3hU5WMlOCn0gVsdWBDU66AzaZhkEnZDN
         vnnWxIXlhyrw6XmSeJoZOX1O06koKEOEsEy7Upbq4goQvtTsy7laZd5jgJXVdQTdSv4g
         mKFhNPxJR+MC8fXIiRtJDMEKzdyRn3fjjvtOnWS6BliEm2BkbJnhf3PTcvHMwkI+TkwA
         vzJ1lAM2gYnUH/2zIo0CsEaOp82J/zxUZaaUWf/EwzRJjOb/rIopic6CimM72D8HwWj+
         JDLWQm6/cmbJWTnPqxC7p0YqA+d9Hp/yNnNo68LELRgjmrQctxy2NIEPybpYlHxo2h5s
         TdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850930; x=1749455730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=na4hsWIUgzqP17/7nLAHiigP7fiaicCJrWy9v/JjPtQ=;
        b=Hcv7D8lqyA3RjAj+967hN5WR46UzRYhrTJdh4NMBYJAe9/SpKsjQpecDC6bXjrdGer
         f4B2GnABRezrjzMcxGZ60mGLbjFEJBe7zfr4chr6egDOdiRdL+XVJIg6RvVGDV6lB1Wy
         +9z5X0NYDhm4ZKS0sxgFb/pmZXnb0YE69cLMuMkCs9Phjd5F1yBU9ISfFaOGTnWop/Lc
         ZFQ4w0tsWzet1jGsn8JJOF/MThKoyge0ZPq//0PpzP7HYtClmblBUIIYrb+Q8KJpLa0u
         a9JNcfwOo0jAHpRPwqE6vmkc1kf1lW8i/rgMiDnhsTnyPeojzoR9ed63VUO/4Y4MQnzK
         Jy7w==
X-Forwarded-Encrypted: i=1; AJvYcCXmpLBagHatqvimgS+ht5sH9GtsCuaYO3MiGaAnDIV92R3IEK2d0zDvF4VGGCUyMky2iF6yzhUfeqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhC0sf4rBc2OChwI0Ke2tQCun1dCX0ZbdVics4WpzR1ME7nV7D
	F49WY7TdqAQJLncX97T9RqIRQkSoruNk57pfJ41S6z8fyR7I2Fp2prCur869I786mg==
X-Gm-Gg: ASbGncuYaXKptWagfjDwMchQx6XeJy3pxiZdtHwDPWfJIICFEdL6AzR6a6R1VOg2ckD
	v9V+lsZgEoS9OqRJvZaP1w7hlOwkPrk0UgRxLkct5u1Q+893fy6GyBzZ7UP8MGC2vMJQavQNWbw
	qx4If6qige/ylEgPOS7/CT0IoI4tNcsaF4HkPzNt0C/0UKLmDbQlbt31CYPlf9V0T0EbIPvaKLo
	Yt6920/2Uxdyvo7Jp4bGfb6MMNNMVLuMYMtmp5CYKWru+obv9uKeIqRIgNdgdd7+3MYARii81mQ
	p7IDgGshj5IfKqb4uY97FBAKp8rqAsrBSk/duSRJbkaJ8X0ji9IFAl+weqiMwUsLumu1LIOhFLZ
	O8IdKbmSsrxMuqWrukrYznwUacqNh/FNNSV1qCGYfRVcYyDA=
X-Google-Smtp-Source: AGHT+IEe0cGAIcjlDFcf0JrEJvDh27LUcDOfQ1IiKMHpgNYaQKw9EmLuF9X54MuS5yYlyA/zH4agxA==
X-Received: by 2002:a05:6000:220d:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a4fe154f5bmr4535272f8f.6.1748850930195;
        Mon, 02 Jun 2025 00:55:30 -0700 (PDT)
Message-ID: <2548f9a0-76f8-4e6e-8330-759b118b777b@suse.com>
Date: Mon, 2 Jun 2025 09:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] x86: Preinitialise all modules to be of kind
 BOOTMOD_UNKNOWN
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-10-agarciav@amd.com>
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
In-Reply-To: <20250530120242.39398-10-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 14:02, Alejandro Vallejo wrote:
> A later patch removes boot_module and replaces its uses with bootmodule.
> The equivalent field for "type" doesn't have BOOTMOD_UNKNOWN as a zero
> value, so it must be explicitly set in the static xen_boot_info.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/arch/x86/setup.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 1f5cb67bd0..5da9df33c9 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -298,6 +298,7 @@ struct boot_info __initdata xen_boot_info = {
>      .loader = "unknown",
>      .cmdline = "",
>      .domains = { [0 ... MAX_NR_BOOTDOMS - 1] = { .domid = DOMID_INVALID } },
> +    .mods = { [0 ... MAX_NR_BOOTMODS] = { .type = BOOTMOD_UNKNOWN } },
>  };

A brief comment may be nice, to help readers understand that there is no off-
by-1 here.

Jan

