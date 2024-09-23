Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30497EE6E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802185.1212361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslG0-0004Y2-3j; Mon, 23 Sep 2024 15:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802185.1212361; Mon, 23 Sep 2024 15:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslG0-0004W1-19; Mon, 23 Sep 2024 15:45:48 +0000
Received: by outflank-mailman (input) for mailman id 802185;
 Mon, 23 Sep 2024 15:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sslFy-0004Vs-CZ
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:45:46 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ff3a3c-79c2-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:45:44 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so732358566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:45:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90611164d0sm1242710466b.91.2024.09.23.08.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:45:43 -0700 (PDT)
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
X-Inumbo-ID: e4ff3a3c-79c2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727106344; x=1727711144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9iFvNEw9MgzuDcTC7MHo4v/BvqvI6dVOISMc5oCSfc=;
        b=ZSsNTRkdoRtgVZ0HAXhlT8FjrQBJPRqH/s8CG05Lae6k0dzlqRTx+aJEY2VINo/LmE
         d6BzgpjGtQD4Dcj5u4Ld5jajNQauDD4xpUeTHBTkjNPF+2dh+loPjekJNEAD9JxclSyz
         gAKquQxThVZ6BnG9QCuq0VgSNuoz0yackQmFBCtXxtwaAWftiGt69b8UbPaEzZDDfHb/
         xz3RFDNU75XNI25M/Y6lIyit6TqoY6t8H2oiuNIIVg5GiH45gTm60Z27tzJMxG+2hmah
         1wlhvhcLkMUyFjM8nJl6aGh4z0cbo/j6HVPHh7b9Rcx1F04Wk5SS7HFP+4Weda7fn3GP
         6XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106344; x=1727711144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9iFvNEw9MgzuDcTC7MHo4v/BvqvI6dVOISMc5oCSfc=;
        b=XK9LS2UdYIhYCO/fQaegPXa/rng+Mg/LQeE3APJU87PbXX3w1EvyxQP2SrHCCYONOK
         ID60rIOGrOcp/4gMLofzs/HnA2edzQ+OoiE3dXyYCsP0F/lxi71MDQB1A/Jr2jBGaPVw
         wtSzLiVjYUbZn6vj7gUu867CBb9PuQ1wpRNg9kkGAJJAuGuyHw6Ida3FpWlDj9Q9+HHr
         DJL6OTvAFoNDwD599SCKtLswsfcGjxwecndMxX8aumwh5j066xquyIJFttctB5kqTgvl
         sQuCUBjQtKmq+lFXDTgeZMTrlA9ksORrQTRLCuu8JQUXAnyju0OdMVodFzitW7wpc40+
         sEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWifVhL/UaZ61pKeBXbUcTAnC/on6HFxJGF4YmYAVaHof95VyqHmjJsUiPDkNT3WplPAdkHn1BRIuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ8swmPPaSTp1eNwDRwuZ0gU5G2eE/xgH/SVE4zrUvYgqooFta
	GBIHas81VzXeDdSWnZBC876GaoTq7yvYyAifV9c2jrFTvXezjWJi9zR/VVgqKA==
X-Google-Smtp-Source: AGHT+IFE3068GOGz/wL09pfm3iFoRCsv4SN7rW3d60/rgq5FpYsFws6FMOKwASyzkmNgStoexCEnTw==
X-Received: by 2002:a17:906:730a:b0:a86:82e2:8c6d with SMTP id a640c23a62f3a-a90d5169d3fmr1323029866b.62.1727106343960;
        Mon, 23 Sep 2024 08:45:43 -0700 (PDT)
Message-ID: <21b75626-4c00-479d-bfa7-895f1a3a3398@suse.com>
Date: Mon, 23 Sep 2024 17:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86: Split output sections for UEFI CA memory
 mitigation requirements
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-3-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240919080021.20155-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2024 10:00, Frediano Ziglio wrote:
> Split code and data to satisfy W^X requirement.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
as long as it goes on top of the long section names enabling patch.

Jan

