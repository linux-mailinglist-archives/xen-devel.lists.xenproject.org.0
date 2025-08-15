Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB68B28056
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 15:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083452.1443050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umu7j-000217-TK; Fri, 15 Aug 2025 13:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083452.1443050; Fri, 15 Aug 2025 13:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umu7j-0001yH-QY; Fri, 15 Aug 2025 13:05:35 +0000
Received: by outflank-mailman (input) for mailman id 1083452;
 Fri, 15 Aug 2025 13:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umu7i-0001yB-3U
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 13:05:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b01006-79d8-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 15:05:32 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb79f659aso300905366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 06:05:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72d7fsm148377166b.45.2025.08.15.06.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 06:05:31 -0700 (PDT)
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
X-Inumbo-ID: 86b01006-79d8-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755263132; x=1755867932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a8O/+n6GBh+JF0+tBupnsjL8WsxDxfRDmDBBeqwpSkI=;
        b=fMqRB/wGBnBVqqk+0U+lNkr2aP+mv5d3uf5nTjZBwg8FCdRqS5wbxyZzQxsOzE3D1w
         xJnG4+EsskhN1Y36ZF/q8ECNL9G+Gs4ziKWrSoo1/0O1dGV0kzIVL4kuMGpz2r0AlnQO
         RnmsnBMV5nLFmdhWugr80lSQmNI7qIflVVKrOL3gRL/B7P0M8Ly/aKogpfPYz8Knt82b
         eKFO0NAI+K4kk69AfTnGDwCNA9NeQPw3+DHJO2bQITKuvhPP6rf/LB9kX7b7jCOF1Hza
         KLBuRTOM0vtb9P6BkhjLABOmGuYvp0/eOrcYtUXFDFChX1XmPh5GYZ4TY/+1nlyrctkN
         /PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263132; x=1755867932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8O/+n6GBh+JF0+tBupnsjL8WsxDxfRDmDBBeqwpSkI=;
        b=D+Y/K/W2YI1nl5qhjxv41NKZjzxi05FQ873Pf4RQY9vuFbdeTqaOUBPAtN6fkMnppX
         Tb4x11MvbVsW8g/rhC01uG41LzWe136C/UlcmVgCJMhwpcKaVyS0OP+pc6S7jZO2QZoc
         4+q/ue9OcxF+7+m+VH7ymuvn/lGDIJ58vmYib/ArjLk27QTfF06tcYC2oSmNZP3PyHro
         /xkG3ZTNFFcCR4xxkPFn66PhYcDJ3w8ZbIgEF3r6I69nsyl+/vwXRg9aO30HycpdWQo9
         Wm23y5n39BySiqG+U6NiSwPV0LKtz74SoNQo/tBk90xF1a8qsi0O1s9/jjSQSW7otmoI
         8boA==
X-Forwarded-Encrypted: i=1; AJvYcCVxJGQw8cvu4SIH3rWb1b6C5l41woMGVsFR4aAuRP5B0ZabDLJDBuHiL2uswdKdcTwvaAeO3Ev2j5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypXAcXdgFETvu2szosgOjt18CII9307UVyLiu9oFor6RbC28zQ
	gyNPMPeTvHloggZTmI0n3YD5kLb2Z0LnOHJW2z2gxlLj8WkkMcPwJKD/LEwKErHa2g==
X-Gm-Gg: ASbGncv+t2sHwJm30b27kMHzoqCVZVui0SS0k6XAkSY2228qaBtRHxQQ6YbTJek8Il+
	sWdEx4bIZDHHvY9W2qOlr1C2Pm9AjxcC5vKrTx535chikahRLThSuZqXvF4i/WWxUh125fFx1jI
	qixlGkGP+VqHoTp+9bT2SAbHPSDjJSDL+1TvemKiOiiGlsz6mUwQYkZJFln7Gy7DRXSKhXyEtYo
	+C3N9GUDehm94YvZSX1wa0jrRhaP8EzJEXgx7WAww2nGwGL7EmWn2HCzJg3FnpDyH3/7FtO/raP
	cfVTyb0zDgIRquRW+1a5WA7i81R3Ew8LtwZaSO8RaaFPO/HW8GPzkiKbUvwzYl59Y037z5bVpZS
	da1mne1bios51HrvX8P4BBpfH2hFl2h+41jMWRhkY1lQA6ycwhJjvztgV0TNZUR1XE6cKgciJKU
	szS0vVoA7n+Fi1tImF4g==
X-Google-Smtp-Source: AGHT+IE8quJostnXrvBRjQbqzPBZnn7PCCygz9reM0zn3YmhdYC7n9CgMBSx/6LAyoERP/5hEGKQhg==
X-Received: by 2002:a17:907:7295:b0:ae3:6651:58ba with SMTP id a640c23a62f3a-afcdc328379mr159102766b.35.1755263132334;
        Fri, 15 Aug 2025 06:05:32 -0700 (PDT)
Message-ID: <9e6ddc2d-9797-4169-a2b1-3ccbfabdb368@suse.com>
Date: Fri, 15 Aug 2025 15:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm/ioreq: Fix condition in
 hvm_alloc_legacy_ioreq_gfn()
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250815101946.2329018-1-oleksandr_tyshchenko@epam.com>
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
In-Reply-To: <20250815101946.2329018-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 12:19, Oleksandr Tyshchenko wrote:
> Fix the incorrect condition that causes hvm_alloc_legacy_ioreq_gfn()
> to return INVALID_GFN even if the HVM param was installed properly by
> the toolstack.
> 
> Fixes: 3486f398a3dd (' x86/hvm/ioreq: allow ioreq servers to use HVM_PARAM_[BUF]IOREQ_PFN')
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


