Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7059D0E73
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 11:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839231.1255049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyxd-00062w-3P; Mon, 18 Nov 2024 10:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839231.1255049; Mon, 18 Nov 2024 10:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyxd-000603-0Z; Mon, 18 Nov 2024 10:26:25 +0000
Received: by outflank-mailman (input) for mailman id 839231;
 Mon, 18 Nov 2024 10:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tCyxa-0005zx-U1
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 10:26:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d267e30-a597-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 11:26:20 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso15178425e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 02:26:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382459eca06sm3295766f8f.67.2024.11.18.02.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 02:26:19 -0800 (PST)
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
X-Inumbo-ID: 8d267e30-a597-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhkMjY3ZTMwLWE1OTctMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTI1NTgwLjE2ODI1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731925579; x=1732530379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw+rgc6O7dqqnjWu40ijNXutVm9WfKl4DHL+HSCSE/M=;
        b=Yhx5AZkk6Gub/4L2rDnf/sjlt0KdjxX78v3rKTEyc4VvzU9uSrEssa8RHoPWi33bMv
         XPsD4mguHj/aOD68IkKMa7vMfnyh/WQmdA7vxVrcTK5RhrCBkvBNnx7v4dtbiiQU6d1j
         wVmpsuRImfyR92wPtR36dRO4z6KEh4ZW6t2ieYDZMUW5La73kgGtAWOX5mbQmai3s+cj
         c19iNk/NWnIy6d4iux6QTQuMQUpFJVeJKUjHgB53hm5QD3yT/ffC88UvwIdcGnaHUSG3
         TwVRTYvZ/FLuT1EScadk9ox1P+RPfitc+2oANdCm6FBvjG+GDRhX7mXyQKhmnlnQASYn
         lpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731925579; x=1732530379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aw+rgc6O7dqqnjWu40ijNXutVm9WfKl4DHL+HSCSE/M=;
        b=iSENZWREEuEO9q59B5qXOvvTWUNyjpgUtHgdAiv/tG2lOmLSk/iLSmC/vdcf5+OVmY
         bGkjpiGm1qENoJr86WpGDCk6F074z0i5DEDmoW0URUkhGmRVeRn0KdmGzxTUT84wcuiP
         9VeWjS8oCN20XckrZB7nwqeKcwq1Gj2RUlpGhPgRMXSFPh2zrHP4hDFT/BMAzmfDnVC2
         JRtHV/0mfW3ln3VpGFTtw8b6xXa/I0sDatsajsrwBeKks6d80iwDaIUJs3G4/pab1/CW
         wA1/ZaPGYjojS8zRvC3sO288sz0wqLVEbKfoQdaC+fFMeH5YixVJxzNsQOkgTF2iGPIq
         RnGg==
X-Gm-Message-State: AOJu0YxT3119c6344Avk4l8UnSbIjjVL/bLh9U55FkPqhn8qoMoozKeP
	EBkK7vNbZiO5856QMOUsDgYv+kLjKCs3g7I9JcVYR7i+qXfMgLyTSoguWSSi9A==
X-Google-Smtp-Source: AGHT+IHXuKL4+tyNGVkqiuofAblSJ5BpgJPzq0tO/ZhZ4qmPg3kjsKIiFFj8OwNQtEfE7zwa1FkmJQ==
X-Received: by 2002:a5d:5d8a:0:b0:37d:51bc:3229 with SMTP id ffacd0b85a97d-38225ad5e80mr9720835f8f.51.1731925579450;
        Mon, 18 Nov 2024 02:26:19 -0800 (PST)
Message-ID: <5e09d145-4397-4572-b705-b0c0533fa9fa@suse.com>
Date: Mon, 18 Nov 2024 11:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jiqian Chen <Jiqian.Chen@amd.com>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzsUL3dnjl5x0-si@macbook>
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
In-Reply-To: <ZzsUL3dnjl5x0-si@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2024 11:17, Roger Pau Monné wrote:
> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
>> +    for ( int i = 0; i < nbars; i++, rebar_offset += 8 ) {
> 
> unsigned int, and defined outside of the loop.

Just to mention it: Iirc Andrew started (deliberately) introducing
loop induction variables inside loop headers. IOW while not formally
written down anywhere, I probably wouldn't ask people anymore to
move such declarations out of loop headers.

Jan

