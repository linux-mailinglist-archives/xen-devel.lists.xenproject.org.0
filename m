Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC648675B1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:55:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685523.1066361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVX-0004kH-3X; Mon, 26 Feb 2024 12:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685523.1066361; Mon, 26 Feb 2024 12:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVX-0004ht-0K; Mon, 26 Feb 2024 12:54:59 +0000
Received: by outflank-mailman (input) for mailman id 685523;
 Mon, 26 Feb 2024 12:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reaVV-0004hn-SF
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:54:57 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d7e71a7-d4a6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 13:54:55 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso478361666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:54:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x8-20020a170906710800b00a4138c3f065sm2396006ejj.56.2024.02.26.04.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 04:54:55 -0800 (PST)
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
X-Inumbo-ID: 3d7e71a7-d4a6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708952095; x=1709556895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ATeifoqIO8fF4lVNDNfylY1qFqEXX2S7rnGO0IvD8bw=;
        b=IhSFniePkpmyC7+13yLyPg1gqFYZ9YGZoiuL7frcpnh43IzTnvzjFO00krIc9ZmLfu
         F/PGaetN/BYCDVPLUgeyhAJiobQxz4xJmW3su7c9HB0j3CJ7LjQKhlzgP7cA/QI8GLDo
         UUVFOQH0d7ur1pEr28pX8tiiWMZMcJEBstRixrNhpKcs22oaSdGCKEq5CJjjgb5wz7hA
         Ir9SDPpfKFTmoRs5Dynx4O5Km8v1GRUGkalcyT/BP8Wn3ZM/rKIuVfYVHFOAOHxSbTtD
         iCvPAzUBC3K1kcNmhfe7BdyJmOXd8rkfCHND6MEL8seYWS1KHA4njdqzUE30Zn1igsyE
         n7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952095; x=1709556895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATeifoqIO8fF4lVNDNfylY1qFqEXX2S7rnGO0IvD8bw=;
        b=P0alUDYcIuSGjD7gtXWLsf9xGqA65vlAZR89oTmkwcszDbpowhGGVPwJXeBzhDFBot
         wmcw2sM84g4CMhjq3YJXCBxFpS8j8odrzXnmMitROzb07jLp6tyNcDiQWUCNfmoSVYjE
         eU772w86mGKI0hWipBJwv+/irBm/fH8PNiQ1AZwH4ix6kk5s246u327p2RCR6C5FDrJu
         RO45efkCNKkKtBPcUMTxpgmIHa1JZ/P14VuywsQZMoeFfE1XveNQvL0Iq/uLmS94FA9y
         hT5W0DK6bFiywySm4h9G7uuCLy1TzAwZneXS6Me2vVQM1YEfa2wCtT/44xg//Fvggdvk
         kAig==
X-Forwarded-Encrypted: i=1; AJvYcCU5KTDr0ETBncopjsewnVYk4cv86RLMKAj0gJRjKr+o3TGvPugRR2iqKQofN0VAuBTqaVrn/MPw0xTGSXhwb+oI1P4+ck3PiTXZGMQDeWs=
X-Gm-Message-State: AOJu0Yy5Gth8zVgdeMsUMpRIg6ymLbk2PJ7hDOO/28k36u/R5GnGFrxa
	vs/R6JcVN/FctiQrwOKRQAGyzlgBj/eqGsNYxB5+xISq8oJVPU3izRwa1mxQNw==
X-Google-Smtp-Source: AGHT+IGJIBBK0e+0epLPulSe2wNB/YhES14xkro/EGMVbfHkrunBhrRxlt5MoRcIaeL2/rke6b6pvA==
X-Received: by 2002:a17:906:490c:b0:a43:825c:7bde with SMTP id b12-20020a170906490c00b00a43825c7bdemr681364ejq.15.1708952095473;
        Mon, 26 Feb 2024 04:54:55 -0800 (PST)
Message-ID: <30e1bfea-d76b-4e3d-b148-f25d1c811f8d@suse.com>
Date: Mon, 26 Feb 2024 13:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86/spec: do not print thunk option selection if
 not built-in
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240226110748.80254-1-roger.pau@citrix.com>
 <20240226110748.80254-5-roger.pau@citrix.com>
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
In-Reply-To: <20240226110748.80254-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:07, Roger Pau Monne wrote:
> Now that the thunk built-in enable is printed as part of the "Compiled-in
> support:" line, avoid printing anything in "Xen settings:" if the thunk is
> disabled at build time.

Why "Now that ..."? It's other logging the earlier patch adds there.

> Note the BTI-Thunk option printing is also adjusted to print a colon in the
> same way the other options on the line do.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

With either a clarification of what's meant or e.g. s/Now that/Since/
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

