Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA19B33B3E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092845.1448470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTeN-000662-DJ; Mon, 25 Aug 2025 09:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092845.1448470; Mon, 25 Aug 2025 09:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTeN-000630-AS; Mon, 25 Aug 2025 09:38:03 +0000
Received: by outflank-mailman (input) for mailman id 1092845;
 Mon, 25 Aug 2025 09:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqTeL-00062u-2L
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:38:01 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3052a166-8197-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 11:38:00 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6188b72b7caso5586485a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 02:38:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c805d1668sm176413a12.50.2025.08.25.02.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:37:59 -0700 (PDT)
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
X-Inumbo-ID: 3052a166-8197-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756114679; x=1756719479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ktQOcHVVFpkbUfbyySwP/emmdsvOMIjxUuYNDNUjoo=;
        b=W+go/+4szQyGXfDovobvg1A/VV4pT5zVbW+ztIWAe2R3q4fpVJuIuWmCRnKRPQKnRT
         6gKDZjCQ6AgAxhFgr3kxe5xxFclMgkxdbXxBu2PV7amXD8FQJIAaa/CKeXNDDDgsehbv
         JvGemyxH+DEEg+EM9RcvWy8oRwpsiydgZBfUceEzUBfJdnmtJW3IZ489+gNYbekEh7VK
         LPNU74h5GWkOzti5juOO9y+A2/QFoU1boeVZfkKIHx5g5CzXXiv8I+v/26yh0kleEvhM
         s7Mf5HPYn8FTLAScd7Aoq1EA92b4lfKm+vl1N76kkcnyPhnBgLryK2im/Be++/fRYJQ2
         zAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756114679; x=1756719479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ktQOcHVVFpkbUfbyySwP/emmdsvOMIjxUuYNDNUjoo=;
        b=akVInikRcgZt4XDzA33junj5Zf1lV1MaOR3BgLaUOPnC/jyiyLbq9FVvRVxR8A9ORZ
         h5+kw84BN0dfZAVir8Zs6kIHe2THEKp7V9Uz9Ij1tAqJeOfkrxQUQTigPfe8URoh5ZMg
         ZwOotCKxfouwvsV7Ti+qkZnl3x+tgVlOdFrN6B5kuheUPe6/CG76vRSGveqRea9h0Nrn
         Bd0ci0NkrrAKNmF/UqormpMXjWd+Q3kMaq5jIJTxaPpVWkddkCTtIhy2/K4272IKhcSr
         xHOvsqFBCcWw7xaAjVmugfBk0vrY8VjKyt23IM7pGuTEc4y/DAfNfZvlSD1vBx/vknu6
         PnPw==
X-Forwarded-Encrypted: i=1; AJvYcCVmOxXbajf/qErSBif/U5M0MiSZXuad814ZNK0GzFPeYP0JjfLC5a6SROBzKN/SoB/tEbo4CxSnP3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzES0lpolYmMxZ1JQcYaBdAzlU1louXZ6A6r/joxyDjv1Cgqzu7
	yS3mhNZMnkjzI9Kk4J8+ex4b9MwM0nErf1/x0S7+1pXXr9VIRsjFFCuZvawRGeT4lg==
X-Gm-Gg: ASbGncvjTHOxfjSlqN+TfbylnybqAzfpu0AkfDO9Rj1bTfkANtvsDHcezElGcKPa7Oe
	z73qka9U9fMYEEmux64J8NTSakmpu/rQqSAAIzQintZ/5+1IVotnHnFnVrtzeYtD3sWHX39SaBB
	u7QjFQicPquTnccVGOFVGKeusbFU+B3B568U3IsvUxutsIjgygbGsg3ofzTHaiqiWkR93O+Y5FK
	bG/Rs67ep0JaFBv8EubSMwBRu1RfKOB9yKQ2yRh5dzAHUEmyl0OQi6h7vUqk3j4dlVtsvRpR329
	wMc69e7iOOnuU/sGiGF9KJh6FVRPAwq4fViAQPdubr7mYhfj0jMOExg2BNIe1Jgz+g12v69cvEm
	Q8dHwxKMQSe8CehjtMwSd3Tb0rXK4jfVZOwrSpGCuMIRvLvtS0H2rbs481qXDBCFreogymVlPEW
	bPuV0BNHU=
X-Google-Smtp-Source: AGHT+IGBaljckfTyQnR6SVPLJjOI9oHZzdjrt1V2bI1ecwAaVGTGf/Oqb9pX8LrHrDpTiexvEUQoFg==
X-Received: by 2002:a05:6402:40c3:b0:61c:7743:7f9a with SMTP id 4fb4d7f45d1cf-61c7743853emr1049140a12.28.1756114679481;
        Mon, 25 Aug 2025 02:37:59 -0700 (PDT)
Message-ID: <dc2822c6-5c44-4b11-a677-aec1f146b609@suse.com>
Date: Mon, 25 Aug 2025 11:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/mce: Adjustments to intel_init_ppin()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250821154825.3968600-1-andrew.cooper3@citrix.com>
 <20250821154825.3968600-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250821154825.3968600-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:48, Andrew Cooper wrote:
> There's no family check gating intel_init_ppin(), making it incorrect to use
> on non Fam6 CPUs.  Switch to using VFM.
> 
> Emerald Rapids is the final CPU to have PPIN but lack the the architectural
> enumeration, so include it too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


