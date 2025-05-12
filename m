Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0CDAB3516
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981235.1367630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQam-0001JA-0t; Mon, 12 May 2025 10:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981235.1367630; Mon, 12 May 2025 10:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQal-0001Hh-UE; Mon, 12 May 2025 10:41:03 +0000
Received: by outflank-mailman (input) for mailman id 981235;
 Mon, 12 May 2025 10:41:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQaj-0000zV-Nd
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:41:01 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981e1aee-2f1d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:41:00 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad2414a412dso244188666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:41:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219348762sm609488866b.69.2025.05.12.03.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:40:59 -0700 (PDT)
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
X-Inumbo-ID: 981e1aee-2f1d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747046460; x=1747651260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2zfYaxISaj+yDKSdksgMUbW9zDUBJHWIipBVoHndYs0=;
        b=NZrXDdnWkJQEP+Z7g7/XMfNkVPAxgOoskXoIXEspBmJD6TFCdX1VW4QH1iBOXVhODk
         ftrb3BCw/t32ndHMavkb1sI9sqSMcApcMIu4E0QjmRupcsLpMbxJGtcciaiv813DwdsV
         0APyAles8vWozodfrxuGEc5r47KwrTtjuxlP59rvTBiHQ9ru93B8stmzHCra8fYe3Nds
         ETodPWlIMmtwfTm2mjCWl9T8+yd1VqcAh3DVMp165JlKeD7g+p4Ep01H8+4ZBxmngThM
         yCiv+uHVtBuSq4kLaZLJu7XFDlyU6v/StvwtNqdgRRyh8I2y12bxYVtwZe4U6YrCbhkg
         1dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747046460; x=1747651260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zfYaxISaj+yDKSdksgMUbW9zDUBJHWIipBVoHndYs0=;
        b=ttaT7mBotoDgDvqmKEGTL4LVuFziUUvU4s/ggIu921qTf7LOQ/rNzDP9YAWIzOTjPw
         tpIfR7RUH9JkBCAPuiMKiTitAbL/ud9IvRxQNSjNVhr5WkVHDzNCebMVp9OlxGzkYv5u
         C6IolM+Wgx50X8O1bZrGp0IxrcUHQDTjwu0ex/YM2l4rELXQmK0dAWQMRSOexqEYe1Hq
         j+SGvA6oF8xbfgBwwqRmWgBXUHaTz15eM4Dnv/XrlhwS1snBg8z7PrV0Vw22MChCeMgE
         P0GNk+OzwqAcAly1w+ryOvr3pnk+Em4wO6/bVc59PkfrtPlV2dYmu3xmFx7sJoDG3Vru
         wGfA==
X-Gm-Message-State: AOJu0Ywb0jUs/qko+kuCCxo8eTK1DduqvMKVO0u7tme7UGiNgsdWC/F+
	+bo0vuoEACYbrSnM82KiJTYcqsc7kK7I64H9T3rQ+k8j9O2BvrzUJswz+i94BPkHjJFNHXKaEIg
	=
X-Gm-Gg: ASbGnctHLenSEiobd1UR70ktmisN5Mgi1s2L68Tdc38IuJ4wWbEPIUQuq2irxYDYwNZ
	/IL9blbfFUZVDA9mCZtq5iywM96dBUFo1mcE517lRy7FhwaI1BTaRsgL7Y+eKL+URPB6jLSUQ+U
	pPj+52IhZcEsIkA4yzkj2AD6UHEpSOJoPmMw9V4DbBbV0BLzm+HY35CAFJRqflHwWo8wkN0T8dX
	aW3OSnhbBQ2GOaneTieZ6bahgap17+SBaDEbydWaGarY3wq4GG56WteBLFPo6zod1DepCqpsx9c
	qXxp92IqVIAkjcto4SeQtFxwjj/LftGtDsTmvhJTtGQMzGfr8pSgLKfWkS8owZuScrsBnE3muVJ
	xjy0WGMuIdhqLM2QFdDS+pTU/4JJizcIiXT1a
X-Google-Smtp-Source: AGHT+IEscQrgnYLbyxIlixdwMoZb/6ttgq6DUpidVMZ48V3/y8jCqOvY2oHKfX1kqmjv40zTRbAdhw==
X-Received: by 2002:a17:907:e918:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad218ea5b7dmr1138581066b.3.1747046459676;
        Mon, 12 May 2025 03:40:59 -0700 (PDT)
Message-ID: <db2cbf92-303f-47df-8ba6-89cb604db3fe@suse.com>
Date: Mon, 12 May 2025 12:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Disallow most command-line options when lockdown mode
 is enabled
To: Kevin Lampis <kevin.lampis@cloud.com>
References: <20250506162347.1676357-1-kevin.lampis@cloud.com>
 <20250512090210.1718623-1-kevin.lampis@cloud.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250512090210.1718623-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 11:02, Kevin Lampis wrote:
> A subset of command-line parameters that are specifically safe to use
> when lockdown mode is enabled are annotated as such.

You want to go into more detail here, specifically to describe the criteria
of "specifically safe". The command line doc may also want updating.

Jan

