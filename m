Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6CA5D8A0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 09:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910109.1316883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHo2-0006hw-QF; Wed, 12 Mar 2025 08:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910109.1316883; Wed, 12 Mar 2025 08:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHo2-0006fS-NP; Wed, 12 Mar 2025 08:51:14 +0000
Received: by outflank-mailman (input) for mailman id 910109;
 Wed, 12 Mar 2025 08:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsHo1-0006fK-Dz
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 08:51:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25902835-ff1f-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 09:51:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso3151646f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 01:51:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfcb8sm20762231f8f.33.2025.03.12.01.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:51:10 -0700 (PDT)
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
X-Inumbo-ID: 25902835-ff1f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741769471; x=1742374271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nIWMIijTkI2Ao3vMUw/l9DFrjzu18CxO6OHhFeZqUnU=;
        b=BnZSIT+sn3OF40Okt4luzqpYhVyoi3tIkrX/xDq3ycWHCkcksAVWbv6iE7Kn6t4Hwh
         WhJu+wu2VFI/7ACWAXnoYbdUP2DAMD/c2m1T03uOo4P5aYAE6sMOP/qe1ZXy3mtDIQY/
         bkOsx0SNxrBJWAmUQuGQqSZNnan8HKGXyiJCPjmTQzA1D65H2vsEFCPnYerV7vE9OP7a
         PS470eJGIHIu+N2TDm56iFuI/L2CS9ILxOHKA4NOxjfkqivcCqIKPgUdQ5MW9S2n3lrl
         RJUqD/Ok5CWrQdWtHqPnKb5otx5mV2F/RRiQmcaJMFzVaTevP47pM3zXy+XLqXfmbgDI
         fkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741769471; x=1742374271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIWMIijTkI2Ao3vMUw/l9DFrjzu18CxO6OHhFeZqUnU=;
        b=R8Lqj8XinL+kbyAn6aLWKmf7bKlsslq+IOvhTlH/y2ixmAmAbWaxL6MeQizN3qteyN
         bKlR3TxjZ0TLW0aOvkeymf4dzcBWqJT4LVLw5i1F6FJ0+F63JXFRnWLNEIVCo2F1vq9q
         YZPJz7zaQ6rzR/A7NiZz5eOwJRFdWeJrTNOJw5XjrrHlYIyOgBLxjlBftZ+ucSG/vqJL
         SYIzpDrdJRVeAZNB8ohhclWFEni+my8G5TAzTxP2tcwnEXdprEcfMd/ZGGm62yRlQ9hy
         4oGg/h46Lz+BqiInfvf70n6izlfHBq1rGhjZAHvEBW+rhjMdlZEbYlT1YPTppd6p5eAO
         OdGg==
X-Forwarded-Encrypted: i=1; AJvYcCXsMm0mKxV+7WK1jtZcgWoWuev5mycWSCQin1cXUKRTVptxaU1BEbk33waIJgwu/hENZ4jgDfltQTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9hlc41MXV1C9Q44tMmg+0YkH8tUU6m+NbCMjrO4ZlIUB+8eQO
	jcDV43muKFzoXhHP4aRUwPwbWIynjmWoAvuWkVBb8nO0mQRpeR2sMpMkh7V7cA==
X-Gm-Gg: ASbGncv6SpOaaPupIk188Y4c6wwP6CjFFvkkKA2asjAQB90xcu3H+fPrgK4ID4/pV96
	4PiPOhZ6ghlErrYTsSTbrM/prVMG4Y/m6tjXQwxzh9Sm/F7f0mz3C7a9m0hSXIqaHP5CncN6uKY
	yQe0k3Mw2VfVuNPEdGTkxDMshoFpBSzlx4DywgdByE/sbfdRFmm6grkWYCGOBI/bG5s2lnDJlp3
	XI16HQje5uJz++NgwESfyzCwRzFzVpGYUMBZEeXVHRkO/krpfqdw4Ue3aaXsXUKMf78Obkj5Vnm
	uo+7qV0aUBotX+Cze9ZvTwiitobHhaK4OvlmVSc7a+yViChLbD7AuStASlPPpGbyHAW8AM92SRE
	JB0mZJK0e3wmGA4rYhfoJvWSmXN8VMg==
X-Google-Smtp-Source: AGHT+IEoyh83SoCmV7d41SM2TYpvLmlUNGbPOVs86/1BmSl7348Jt4/xB+JLfjz73o9aPRPskN+54A==
X-Received: by 2002:a5d:5885:0:b0:38f:2b77:a9f3 with SMTP id ffacd0b85a97d-3926c1ce288mr8160102f8f.43.1741769470729;
        Wed, 12 Mar 2025 01:51:10 -0700 (PDT)
Message-ID: <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>
Date: Wed, 12 Mar 2025 09:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:02, Jiqian Chen wrote:
> PCI passthrough is already supported for HVM domUs when dom0 is PVH
> on x86. The last related patch on Qemu side was merged after Xen4.20
> release. So mention this feature in Xen4.21 entry.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  CHANGELOG.md | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7201c484f899..b6de9b72ea7a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On x86:
>     - Option to attempt to fixup p2m page-faults on PVH dom0.
>     - Resizable BARs is supported for PVH dom0.
> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.

Aren't we still in need of SR-IOV support in order to make such an
unconditional statement?

Jan

