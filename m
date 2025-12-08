Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C96CCAD334
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 13:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180473.1503644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSajV-0006Xa-03; Mon, 08 Dec 2025 12:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180473.1503644; Mon, 08 Dec 2025 12:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSajU-0006Ul-Tl; Mon, 08 Dec 2025 12:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1180473;
 Mon, 08 Dec 2025 12:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSajU-0006Uf-0H
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 12:52:52 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd57b157-d434-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 13:52:49 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so35741095e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 04:52:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7ca4f219sm24132051f8f.0.2025.12.08.04.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 04:52:48 -0800 (PST)
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
X-Inumbo-ID: cd57b157-d434-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765198369; x=1765803169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oSfNQs/aaSi3hksy2OevppyStjwcZ9spCScFVOT4tUQ=;
        b=RRTNABqIu3iaqsQp5QT/0PLAyp7Fw4fjmU+3Q0O1er0tgvrtzNmN/PnTmce0cWUCy8
         457sgG5WMAs0gNHd+gvc8EMCoNMpmI1ODc8D/mwB1UeSyNIDvD/cAI0Z6T19XJ2I+fJ5
         0e/JwGMg7uRLp6nrt62Bs9O5BZ7ZjyvtE5j699qRZfivii76cxz9zMOLkcH88okDBSwI
         s4l+sSpd0jyFRcUFatiwYjCjMKaiNg/UDTWj45ZgOaorpbyjhzJvB3BGMYElRHo+Bn6Y
         LM/a0Cms3KZxE9T6XqOenXx43xs5tMgN4ToAzOdW9K1DQboXFDCMkuQzTJ/vbONzriyF
         msMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765198369; x=1765803169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSfNQs/aaSi3hksy2OevppyStjwcZ9spCScFVOT4tUQ=;
        b=IcXq5AvtogDrTPmcNJNKm1Hb5PzEU0I9NOwSAEg8/CciKkZ8cOFv+oou6tAHqYjl9E
         //75xsLLj7bhdxJf5/MyOyiQR18mcxIeP9pwhjrY637+7VwenImk99xAFfOsJcnzHOV1
         vomuzz6zQT6MRFS1hwbBCokpapAxSaV6uS7o7dOLobP9JTMmtaVHPSUooXIPJfLmPcEF
         bS92LNfddUCqP5mpaurEPDW5W+WwcCT6GL9n21LYig5PBz7dktfDbA8HybvlJxNwNZTp
         UySbt0Pw5Eqk7xZLze77MXAAO1fiatCF1KZoPuDj65Qfrhi2WwRI7hYV4+Wv9Gu7He5W
         8VXA==
X-Forwarded-Encrypted: i=1; AJvYcCUT4uZq8WQMYiMGF7vNtyRr526OwXOelb8MIHblN6MBAx1h5Sryo6kZhCdLruutnXgl4eK3w2F096E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdzzTIL4PCrgqF9ITkBqhuKVRaByPu3s0viwbU1S9BWWTS3pp5
	SzlzpfX94scNpY3AXuGwFXrkDGQ1DHjJSkvC0khFA/kWi0+qtEk4+0O5HnJKJqJwPw==
X-Gm-Gg: ASbGncummDfPCSMqibDT0WRJYGVjzuG2T6XSimiMBugANLmj2ixEzj8uy/BFyNCi6hq
	+ab0+4WqIj37gD1H+us2VqMHb15+7zR/fw2o4c+coBxJxWturBHlEtcN4u/omj+cCKCoCBADyT3
	wQ53wLiJ/fqUUu7zR9ezbsCIJmBaZlHErwdXQuEO96Yn4qaFr9GTXCHs53aboWTkI+Dnr82AEQB
	+hSkuFskBUwg2ocjnLWTa6jk5KiTO5HJm4x+h1nTEHf5tsGqSdU0qQdxGtmBmSnutzpRnlTBcvG
	NJVGoQcX8O6X8NWmmNJ8zyRnv7KI68hr3D9ry4J0w+L7UxIh9ECFbgg9eCGa6sS8OYpsqfCnYY5
	GvcvQDQKmwI/fEU7Vh+sS1B4pokQW9YmupP8FDZBQ2PdxXw9lF5dlWx6y7mb6vU1KTteXNGtRsI
	ZxNSh4s4ZIVngCVm0MF1RXAj/U1+syw2H/gskX2+Y0jNWNnx/nr18t5MpkCdgYl9oldVe56XPQL
	P0=
X-Google-Smtp-Source: AGHT+IFVlJp+L80mm2IFLL+d9DUEpMcZKNfIpuBYDDLe0E5w+g28TEwCC05Ty+TpBFNOYkBnGacCEA==
X-Received: by 2002:a05:600c:5489:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-47939dfcc18mr90740845e9.10.1765198369244;
        Mon, 08 Dec 2025 04:52:49 -0800 (PST)
Message-ID: <796783b3-0727-4375-bec1-0e6a18a2a582@suse.com>
Date: Mon, 8 Dec 2025 13:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] tests: fixup domid test harness dependencies
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20251204123712.721443-1-dmukhin@ford.com>
 <20251204123712.721443-2-dmukhin@ford.com>
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
In-Reply-To: <20251204123712.721443-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2025 13:37, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> There can be multiple test harnesses per one test target. Fix that by
> iterating over all prerequisites in emit-harness-nested-rule().

This reads as if previously there was no iterating, and you add some.
What you do it further parameterize the existing macro. That anomaly
actually looks to reflect itself ...

> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  tools/tests/domid/Makefile | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> index 753129029ed9..1a2129d20655 100644
> --- a/tools/tests/domid/Makefile
> +++ b/tools/tests/domid/Makefile
> @@ -14,16 +14,18 @@ $(shell sed -n \
>      's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
>  endef
>  
> -# NB: $1 cannot be a list
> +# $1 target
> +# $2 list of test harnesses

... in this comment. According to ...

>  define emit-harness-nested-rule
> -$(1): $(CURDIR)/harness.h
> -	mkdir -p $$(@D);
> -	ln -sf $$< $$@;
> +$(1): $(2)

... the use of the parameter, this is the list of dependencies.

And then, how does this make any difference at all when ...

> +	mkdir -p $$(@D); \
> +	for i in $$<; do ln -sf $$$$i $$@; done
>  
>  endef
>  
>  define emit-harness-rules
> -$(foreach x,$(2),$(call emit-harness-nested-rule,$(CURDIR)/generated/$(x)))
> +$(foreach x,$(2),$(call \
> +    emit-harness-nested-rule,$(CURDIR)/generated/$(x),$(CURDIR)/harness.h))

... you still hardcode the exact same file here?

As an aside, imo this would better be wrapped as

$(foreach x,$(2),$(call emit-harness-nested-rule, \
                        $(CURDIR)/generated/$(x),$(CURDIR)/harness.h))

or even

$(foreach x,$(2),$(call emit-harness-nested-rule, \
                        $(CURDIR)/generated/$(x), \
                        $(CURDIR)/harness.h))

Jan

