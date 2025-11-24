Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C0C809CD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170864.1495888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW9X-0004WE-VZ; Mon, 24 Nov 2025 12:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170864.1495888; Mon, 24 Nov 2025 12:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW9X-0004T8-SL; Mon, 24 Nov 2025 12:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1170864;
 Mon, 24 Nov 2025 12:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNW9X-0004T2-1j
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:58:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd567f0-c935-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:58:46 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779a637712so25723625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:58:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f3635bsm28688730f8f.17.2025.11.24.04.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:58:44 -0800 (PST)
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
X-Inumbo-ID: 4fd567f0-c935-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763989125; x=1764593925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7cecABuUD2NkM+81wicLsfO+Pa2O1CZyPkgdiqZp8Dc=;
        b=RjfMlpUFM4XE63W5Tm2bAAzT+lBUMaFJb1SRoPWyFzHZD0N38pWGPEkoZmLnaDfuok
         VnSJVNrd2SjoBKMM21b2pdaw52R4BGNwEz3RjrvnjVtUAJR8JdaMalB51ZX2DD6JyiLU
         vugi52U4GF1mTVEef+SUMiZRXW1XcWrh/BwCs+4Gj6ZPdREuoW/WBToBxt48HBb/0vxQ
         VFi35Ub8UT5tcVDUzsZ6TuRBEa6PgyYreAdBdFpJE6iR/brb9Z7HtwNWn3oguc35+vH6
         5yccCxjlhDuzZgKoK8RIkZMqAkatf8N3SN4DF0nUHwKeh4/138A47NXhhXIkga3IwqHj
         X4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989125; x=1764593925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cecABuUD2NkM+81wicLsfO+Pa2O1CZyPkgdiqZp8Dc=;
        b=CNrIkFA/T1EfgaLzpqbFomITlZUWpEJjOfuZ3nwemfQjN2M/1LUJYRvu6Iu+X6b7as
         6kM8f6i2jt7gGGLulq4izONtAyeKdl0bsOD3xtZdM9ZOYpcvFGTipWc2d/Y1h2Z3KHJW
         BSRG/mIPeH/ngSBTC33Dk4UmW+HrnYsi1aStg3REsYEf9HIX8XU38AvkDHT1lOdHG+K2
         6PAJimZJ7L6Cgoay7OM2z2QN8etdvY39kzjfgVjcADfYjgy1WqxikyrANWq+MrcHPfhC
         Fg6sSpx4MDjP6KKUMX8hGuyBpuYWqsLmOobF7+pBsQ0ycI1jiFjFlr2h2dzlZYjma6KU
         Dlng==
X-Forwarded-Encrypted: i=1; AJvYcCUQkdHIlsdmZn0yhp7uNOpqIKyTYYJ0h+rwKis90rS/g7rrVXhykf3JuJanhsF1Cecwxclne6N9Zow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRAKBQXMXBCM9ZADMvMUZm6LB3a1ayFk0FNUkRu4GoA9wzKtiz
	ablr15qjvmy8i6wlNVnuze5x76FrzYkgoJC9dwIzk/CoYyzZCQmIyAINfhsbJfw3Ig==
X-Gm-Gg: ASbGncvJ4belFSwpS7nbEgJKvisRBQ39Adp4LmG3Ual6YVaIl+b27eU840YHDkrOJuI
	RpQWwrpWXW4ZWNL8Py6An+KqeEtYl40rfQIGn+8HkoScsncfUSoIRKlqNUwa41kvXbFvmoEjVWt
	pYSP7u2fgQlC8+oIkBuAbgcCydL260D61oGrBqnTmKPAMfE0V21n7X9AQWWeBwaEefeWODqhpzB
	b32e4IjHKvxishO50CU/C0qJZF+qle5O0iRbnAZmsQMzXWy+NmUO00uDdlQGesmJOQigscxHOlv
	jornWBE+M5XIWfTpzX6c3yTNRBdlEOs4nm4XyRKmBFbBSpVT6lsUyEpSbueVuvOFKH5k98p9jx9
	lF/gHcocbTFVY8CibgQJwch2HwFo/VXHgs7TqkX59dD1kVSrXFs7DaFcGwGNSldeS+Ico/HpzNz
	3GZacuIRezWGE5+bWzPD/W/lZbprzWypNGyD8au+a4jl6uke6QdHA9Myq6dATs5MjoWwDNiwgHY
	Jc=
X-Google-Smtp-Source: AGHT+IEVFFXi0tXYRYsOPaSb347Ujguz0Wg21QGTDjpFVvJbs7gyTCYRuKr57Fxjoj6uhxtMRi+NNg==
X-Received: by 2002:a05:600c:450f:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-477c01eb9bdmr128502995e9.31.1763989125310;
        Mon, 24 Nov 2025 04:58:45 -0800 (PST)
Message-ID: <f136c91a-9e8b-44de-918d-7d989867ed26@suse.com>
Date: Mon, 24 Nov 2025 13:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/param: address violation of MISRA C Rule 20.7
To: Nicola Vetrini <nicola.vetrini@gmail.com>
Cc: andrew.cooper3@citrix.com, sstabellini@kernel.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
 <bbbe135e699e8589c36555f02e208edff64ef76c.1763642993.git.nicola.vetrini@gmail.com>
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
In-Reply-To: <bbbe135e699e8589c36555f02e208edff64ef76c.1763642993.git.nicola.vetrini@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 20:32, Nicola Vetrini wrote:
> The rule states: Expressions resulting from the expansion of
> macro parameters shall be enclosed in parentheses.
> 
> Add parentheses in the defition of `custom_runtime_var_sz' to
> address the violations.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


