Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751CAE5E1C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023235.1399176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyGO-0008VM-Uj; Tue, 24 Jun 2025 07:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023235.1399176; Tue, 24 Jun 2025 07:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyGO-0008Th-Ri; Tue, 24 Jun 2025 07:40:16 +0000
Received: by outflank-mailman (input) for mailman id 1023235;
 Tue, 24 Jun 2025 07:40:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTyGN-0008TY-40
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:40:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 769423d6-50ce-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:40:13 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso52384f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:40:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83932dfsm101967595ad.30.2025.06.24.00.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 00:40:12 -0700 (PDT)
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
X-Inumbo-ID: 769423d6-50ce-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750750813; x=1751355613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6OPQKA5Xu12cwY7Ki0OpcHSJzl+QeCS7t+q18ea7k6E=;
        b=QBo+oRdacFG73HtGNumb7i0e+YVUNkXbZtclAJjVxvWy/03D+kX5+5CVvd7xYerbdj
         sCxAFIF+ie1N4ASfvteswzNrzHUdXYjVHEY2olhMKQsso2bbHjLRT7MrPC2Crnk6yA5G
         Ngq+Vg+DbtTmysOqmnKU6qlQckoud8FGes0kW+KLkWsEEZJvTxy8R28Q/R01xY4F5y3/
         u3z6hYqs/kdYzxBpyHzLxBFHSMMLMkXGZOsqE9F/dljJhK5CgiQcZN/AamIfbaGRf1XF
         4LQgZo2/GQ9w0iNGpihZOhWcWs2YJQ/0dWyCTyRzMosAxRR3uaMHqFzydQj/qXvOluaN
         rBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750813; x=1751355613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OPQKA5Xu12cwY7Ki0OpcHSJzl+QeCS7t+q18ea7k6E=;
        b=bUZIOuixBVyj4Orl2HE5cNJl/WnoAyiuUJ6MCU8P4hhkbnmbORHvE+rzTvw+LQwX0p
         DlK0dpUT3x/cQxJcUG/7U2rseJSR8472UrplAyiNi5YGgHw35Ap1RwD+Vz/9NnF22rVZ
         Xpbs4F5vIsSiTO+oFPugHSXjfQS37QyFxnbqMNesqmHEtsLU/eYQqKHvQAn9K45N3Aov
         0x2DT73V1YcTBN/O4/91gI6kPRVuQG0i5OaJrHYvMlJMy6eB4T5jobWguKzrXZxrbIWX
         CD0NCZXn6kYSgD0aMN1ozVk8u+n/dUZrV0uSP1l6t6fn2oXoOCTY1PZakWsc2pnWdbgX
         cLIA==
X-Forwarded-Encrypted: i=1; AJvYcCUNDnOgZcnUuc8SAVTskLUDfI+j+R4lSrZZUmhZBbeZjQo6yfoQzfH5XoxoL7ZzNINLiPK8J4edOuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzo0kJSJhsdXhNhclrD1OLJvtErxLtlph7IQhDxX5bgL4XuPs4y
	Ij8+qCWSsrHgLzdcfSIn4psqk+YHH52bV8BiKCort75Ww2TqXYK1UW91nbZjEy/Hig==
X-Gm-Gg: ASbGncsFi17T3Fc83q98YWrL1E287Z1eTBqvGf6+O1BQUe4u8qHejPDhJ9PuwJ/1ib5
	z+g1/F7HCLt6aqxe55XIi06lKEzdDXBeDqx7VxIEM5gNW+0xzwEnP/btH09ZJQjQUqR+wBLWBlZ
	LtF6f73Mb21W8FLJHZuFImgvkjELn0CBAbh8U7/eBAfTqZRLo0N4NA1wKVhwqdo4I1N8UjpPeaL
	eMOwZerdRd06+8dsA08CRgJe04hKDb3kY2UDifcggCCliZaVypBvSriPJk2fLKss4/YyGPEN4/D
	dcF0UowUJ4RG5YQN2cKTwOO94bttjhBfmHSFTHthdmTs8pTHuLms5PsYphMUlxphDvHXkeTHzfs
	itQOhZPuDXg7wH/MJhLfwlsM9vksSaLLtnxjmFonKT0yIZTg=
X-Google-Smtp-Source: AGHT+IGBxywPIoDQlQDJssHQGBM0dEMRicayIkELANOuY57UmzARgUPyn5rg2EYi+M6tMnIxBFmytA==
X-Received: by 2002:a05:6000:2913:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a6d1330159mr11183025f8f.51.1750750812625;
        Tue, 24 Jun 2025 00:40:12 -0700 (PDT)
Message-ID: <6d33355c-477f-4ef3-8f17-b7f1dd1164ce@suse.com>
Date: Tue, 24 Jun 2025 09:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART
 emulator
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-15-dmukhin@ford.com>
 <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com> <aFpViicgGigZPFNv@kraken>
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
In-Reply-To: <aFpViicgGigZPFNv@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 09:36, dmkhn@proton.me wrote:
> On Tue, Jun 24, 2025 at 07:53:04AM +0200, Jan Beulich wrote:
>> On 24.06.2025 05:57, dmkhn@proton.me wrote:
>>> --- a/xen/drivers/vuart/Kconfig
>>> +++ b/xen/drivers/vuart/Kconfig
>>> @@ -3,6 +3,15 @@ config HAS_VUART
>>>
>>>  if (ARM_32 || ARM_64)
>>>
>>> +config HAS_VUART_MMIO
>>> +	bool "Simple MMIO-based emulated UART support"
>>
>> Perhaps in a separate change this should be renamed. HAS_* should never
>> have prompts.
> 
> Oh, so HAS_ flags are non-interactive selectors by design?

Well "has" simply by the word means "this is available". Any user-selectable item
deriving from the mere availability would then have a "depends on HAS_...", thus
hiding the option in situation where the functionality isn't available (be it per
arch or for other reasons).

Jan

