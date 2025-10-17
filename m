Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F744BE67E4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 07:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144884.1478085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dOX-00073E-Cg; Fri, 17 Oct 2025 05:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144884.1478085; Fri, 17 Oct 2025 05:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9dOX-00070h-9z; Fri, 17 Oct 2025 05:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1144884;
 Fri, 17 Oct 2025 05:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9dOW-00070b-9W
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 05:52:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83adea99-ab1d-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 07:52:50 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso10860675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 22:52:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5833dcsm38253322f8f.19.2025.10.16.22.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 22:52:49 -0700 (PDT)
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
X-Inumbo-ID: 83adea99-ab1d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760680369; x=1761285169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NTetatIyzY9cEtxrSgAMjEmaS7y/8Tr6wbXzJx+Dhlo=;
        b=DrY1s0jD5Y8RoUBffpChFp8cCxkY5R9KIxtikt/Wr9ZG1J7vavzFCE+5ji8cRr07jX
         a3JbAy1gFREhF/o7x2EqLX0Bbcbh11g7MQnjAegcQL9b2MM1gSMVvaDQaQchBONPZhfK
         B02/5l2HqmipxX5ZDt7pEGa5cnxjZQnsjIuSlCUfMRzxzFxXFI4fXU7XGWQLGhbQkWiw
         ibgFRc/7Al5SQieOOtCuVBA+ZQ8WRGBfVgMJob8ZGrNP4HYp9F7QpgIvUi72V8vCjGbB
         xdY6N7kCbWTbrUGB6KF7ToW/LMgyI3fktZ6xPYOeez1rnV9GWI8la9x7EJ6fW8zRnCdZ
         AJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760680369; x=1761285169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTetatIyzY9cEtxrSgAMjEmaS7y/8Tr6wbXzJx+Dhlo=;
        b=XpR6YBpg3Dje0AwBeEWYGzbHDY4chYqhmziJrVTrlWtT6pvH0w8w7NYG++pz5P621z
         NWGrWZwbQFzZTqbS/Whfo+e1aL45zzSk363k2TlkbJDu7/S2zsWAJtDE4VXh2HqxqoE+
         IJQ3R0zaQhZzzhtikIbQhdMzXiFlKaGBe3E6anhqD9xO1KfnrLJog20hDU4WtLHTctpM
         GBFxpkY3xEgK1Reu5qR3629sBmeR8waoQAaRKqlDhf2GW0GalMyjLpnROPKsd8FwLLv4
         2C8rYFcaEcNCYX36wLybUplvMOPmLTH+IRHIyLk/BCZIbKybVAnPlnTzhi6/7ai6zA00
         kz4g==
X-Forwarded-Encrypted: i=1; AJvYcCW+sxz7cIhOIXktaJyLeUs13KKO2/+M7AESrgGXAaFreuSZ/QoylenCSCnOJUDGIefhj3HGJQzcImE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJnKrxFUp5+vEAm0nbo5lDKfyJPeNlp8wodrmCr9RkbrXWbIWH
	q5VUF1Aug8EJbiP/g9yDWiiTyMY1T/pjU5nMebsR13hQmENGP0XnMqouRsDQjh0VhA==
X-Gm-Gg: ASbGncuLYG27pLBEcSX7zikZae+GIumc7lZOvl9dnY7nx0JNfBQSn27AyxkRI+JrQKX
	P5zFMydXxUFMKIS4jSIlWs6QWcVJTN++QmqccCxz7lazCn7FEKOGfx32+/W5bqc6zgSI7gPUD06
	Ub/xW2e3rgX8ZljnzDTz7v4wYVjL+RdYig1MMOIKIPGXEJGO7/GGNABtJnR1q8LE1hmu6guMBpn
	WB90PTBlNyotTgt6OmDSi+1FgBILJAGGUHlR3x7Cuel7Nf5k9yoWdQxmR+ouXdp488p7fiu/9hx
	mpcYCqALI65WqlPTL1rqNYYGcbpZL60jd7YIA7XSE14geMMOlY3y/TtAo76d4m/3AHuh6igrN90
	bSb0T9VfOH6OMeIniuWow0hSqYC/2GUEOEyZ+K6WU6OsMBsEVo4cWsL3N89B5CwkZea7Rzs7mny
	J74HaZ4r7ielydmWeOSUyz2f16clZQKdPFBbQuZM6plpNbQcZxqqu5iMwvMpXoZBY5Ao6tsVI=
X-Google-Smtp-Source: AGHT+IGMxz8kkh0Om07JgP7MPQ+oJZEvSlMhyft/C28h1hNcRK98uMbLfWvDkD/7M5Hgu08kuxuaQA==
X-Received: by 2002:a05:600c:8183:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-4711724e5bcmr19362475e9.7.1760680369510;
        Thu, 16 Oct 2025 22:52:49 -0700 (PDT)
Message-ID: <a9c6e131-95a4-4ee2-8f2c-c6748d5adeb7@suse.com>
Date: Fri, 17 Oct 2025 07:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/ucode: Fix missing printk() newline in
 ucode_probe_amd()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251016232646.2688404-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251016232646.2688404-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.10.2025 01:26, Andrew Cooper wrote:
> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


