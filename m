Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E2C8A471
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172935.1498041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGN2-0004VC-Vb; Wed, 26 Nov 2025 14:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172935.1498041; Wed, 26 Nov 2025 14:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGN2-0004TE-T1; Wed, 26 Nov 2025 14:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1172935;
 Wed, 26 Nov 2025 14:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOGN1-0004T8-Os
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:19:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f52eddb1-cad2-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 15:19:45 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so39076955e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:19:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8baesm41114953f8f.39.2025.11.26.06.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 06:19:44 -0800 (PST)
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
X-Inumbo-ID: f52eddb1-cad2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764166785; x=1764771585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnfpycUEx0DFVsEnYUywi/PGrnaPVM8e1nx+eui0S24=;
        b=O4uR+UwWlt7qf4R+IBlCZH3omWlg6j7gIhoxn6GEvYkz4PVmkuKMvz0fJYOzEE96Nn
         zNU3DWTxM0luFj0bVMxlX/UIw1yEhw0vn5AJlOT3ZL92VbUPdRsOBExNudc8uQMjPfLb
         s5wyAYRfTOhn7OqE+OqZ8pV3SFwzzfKkiNkGC+ZaF4SSjtknKsn+XovBlsPb0afhdlKn
         U9A9bq000yYXSNrvp3K8RJZ4HgnfIptFks7oBlw/WKvyADXeenkvmUjkyTRGawfeDuWX
         7rpVy0+q5WqPl7b2tXgH68b0KvDPbEUrk+OOrbpXv3d2z5aPjoHOAkzFmYB6hMyXkAWP
         qZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166785; x=1764771585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnfpycUEx0DFVsEnYUywi/PGrnaPVM8e1nx+eui0S24=;
        b=qGGmH8dn4y91AyBdoPKb1q/q1fSbbDNi0tWWQxTyxdhGS2sftwQAgEYr2UoJstkqcs
         1ADcN5749AcUYHO5iAvdPak6C8voKvvo5emy4q+LQ+fC+VP9CTVJjYvNjFQkMkMFhfMB
         3b7ZWktngYVEpNSxMwMJyzAudHbK81TZMJOJTPGQstVluKDXk4Lh+rt3ORXAl4z6Wp2W
         /Dp0EjWxplwkYa0nfa4ZJJd9UJjOcedldHHf95NRHR74Yt3ha+Ji6wQv89rswnwm9tgl
         s/zqUcQpBBXvDNmxUuiJ8cyml6dsE1A8cD+mqOsjOiCcfXO7WAiw4hLmKTM56NGzn/eL
         /k0w==
X-Forwarded-Encrypted: i=1; AJvYcCVgvB9o3w3HnSXZNCbjEISjD96CLRMiwBly2tNvlXgTSY6OKz31TaZIYZqaAgHgw9cXAgiLm0XpRDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSwd4Rb64SYq0wpfiy31xDSgLloV7QC+DAKD+5kEG4JWZke68P
	gZuPv875BjtmUg7L4/kECWv9JnYVm7k1BNyswBVAz/0HA1hBvsHIiT0nMZW+HAZ0ow==
X-Gm-Gg: ASbGncvgJxBAvbFLzmoKDtsj4MjwUYHEus07h0B5/jdIxyvwMEIKmcX4lWaceFjjn6c
	TNz32S9038hTBqtksYTtJFOuMlwsvEVlr/qlVuHSt+YYZ0newmmymVd4NZh3uKWBSQfEzXLKj1i
	0xvORtpr8MBaZP+CmlMB+4JTizSrOzqPVW3UoUbzsgywD4uQuC9t5/Gs3Ftv2ytAbG35opSsU04
	0AZ0O59W0dWExxRSsBGJOy2WxYn76a+WH/Ky3+17CmeMo+oZvjIeeTH2zEa4/WY37pMd3d7cUw8
	BsjKO6eORYLwHCy6nJkHMnZhaU5vMa4U80GkkzFRwvMVDH0pwFm09Ny1uoEWglPCNKHYXBGuQn7
	X5PQZ4QKHGM8qkJ/9gwPIKo30GKqzG+X7cULifZ1nFz/Wk4pdZlEIoRI4nAfzoWn7DCGNR9wwUJ
	Hd6B5ZI9DibOYyCVn2y1BNKsVqvuKeg8+BqxP35Yrnatqfr7M5PCB6RdExZRxdfjggeFLXvDm60
	2f6sbYbtME/FA==
X-Google-Smtp-Source: AGHT+IGLJXZhgry7rv1x6LZJppuNP6BfrDg2XnDUlmJejBKRlzD/R/GkznPBYx9Q4hVANyxiMQSmFQ==
X-Received: by 2002:a05:600c:5252:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-47904b248demr77773925e9.31.1764166784829;
        Wed, 26 Nov 2025 06:19:44 -0800 (PST)
Message-ID: <ab8dc060-7707-4ff3-a413-730555aefeee@suse.com>
Date: Wed, 26 Nov 2025 15:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251126132220.881028-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 14:22, Andrew Cooper wrote:
> When re-scanning features,

What exactly do you mean with this, outside of XenServer (i.e. upstream)? The
only thing I can think of is recheck_cpu_features(), which calls identify_cpu()
and hence init_amd(). Thus ...

> forced caps are taken into account but unforced
> such as this are not.  This causes BTC_NO to go missing, and for the system to
> appear to have lost features.

... I don't really follow where features might be lost.

Jan

