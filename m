Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5BCAC9A2
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 10:10:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180255.1503474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXG7-00008E-8m; Mon, 08 Dec 2025 09:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180255.1503474; Mon, 08 Dec 2025 09:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSXG7-00005a-60; Mon, 08 Dec 2025 09:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1180255;
 Mon, 08 Dec 2025 09:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSXG5-0008Vc-OU
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 09:10:17 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b588ab73-d415-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 10:10:15 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-429ce7e79f8so2664032f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 01:10:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331e29sm24834189f8f.32.2025.12.08.01.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 01:10:14 -0800 (PST)
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
X-Inumbo-ID: b588ab73-d415-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765185015; x=1765789815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LTdNAJgKr2UFkzmJvH1/thYKNgic9UAy3c4K8AA3GOE=;
        b=dIhTcw5WfmNkCJi8qhlTO6lMQk2AhhrPT7rf60yIs+Dm1t15VIfffEWlJvilEC6+ND
         6yTGjwBK2y48W7pS9n+ScFlr77TyJSF8E9Fycxg1plnoR3qZ9yql2mQXzTijTRyRCYvA
         JRhr0uKFDDUoPBGsfnBor5aF2Pe49KMlNQ76ptAMK8VMITneqz+/8C057g2H4ulVJ8nW
         FY9eHO8s7IkOwAk6kdUSqXE0IprnfE+bwe5Ipn9JRq9TZsCiLbhPRY+j1rdOlsL5y3w6
         1cfeAe/edZLmUmcPq9XPO0CWmPLc2zV+IAyVBMiT+1XWSsZwSc9/jv2h8jNuluqc7kx9
         JsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765185015; x=1765789815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTdNAJgKr2UFkzmJvH1/thYKNgic9UAy3c4K8AA3GOE=;
        b=JD3xeB8ThqSlKPseLffDK5pqRskNt0qRxjM+oouZToeETiUenMfojgSnGGFK1H5svn
         NE3Ci2ziet+gYOo3VfqCeBwt+btT2IUhM9tYts/uLWzauZv7bqaQVe3eX68wkHlMzrSe
         tbHlJ7wFPsSwDOjMe/3/GS1gd8drGTspGedaVO5R3ceyeUzSOAGhoRDfcV66vdAe3QKs
         fSSyMLWT06gD894U1awmp6KyNlKfQAG3hJq+GR0te3C0jiQHFCtlB47qYXG3sAUsukPM
         P7Ri1/PrxNBdnel//CTcpM/nOA677xuzKw8wwCKKOWmsR9qJh2i/KjW8LuBAObl3rhTN
         F24g==
X-Forwarded-Encrypted: i=1; AJvYcCWGfwPruG5TFeD4n1aU+YFLaiXEPPp2f1NL2n0qhrXM9lzF/lv7V7UY3kDfVsMu7Nb02tW8iC8CGiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRr7nx6Jsn7rTHChXvC92KAz3mNmZuqLRyvasnufI/7Loktakv
	3Y94D7To11PnMRZmwNb8pfBFChcLA4Q07VWiPQbwtShmt3M6vEmaCDTRgNSuL8uXpA==
X-Gm-Gg: ASbGncsmlaM+vnUIpbLkRCi69I0Xv94BurK8RXYhNn8ZJIFfO60sGNyqsglpFxeHw5F
	PxyG4p9GgyKZNRbDDmHRLsQg3UpJdBtdmLinauSGRWAGS5VNb8ZOwyMMYYQ7db3vDl8GlDafYJA
	t74J5IjlIAY6YVbvU/dnbaIFIWtt8Wr0RTxdgfP6PXOMBxCixlfXuc+c0FVACRvh/fUAtRxHK5+
	PRdLm+CBgV5ul4CIL8vxYXGP5JeBXlyvdYnZqEfRYhux2ApS4PGmSLZs4UJBxpgbVCqAjFBcBph
	/CjrH27iU/nnu/9frz8hr8DgAKztxUdhKOQoMpAgELL4A/lPZfFlCnFG67YwQbWjcuSSYlIeQF4
	LaIdzpjpoeOwithhqfa/QLcLUfr9CVOYyOOaCT2Q8ZLel2YJ0PWdvCfOZAGGjrI2Fy4MWGPfHpo
	sxHxJFGFUT5AzlRANMJhitojRIaz2AtuhhjdFRypgmcfE3aELvJE+cfPzLy2kVHijPsVHXcyNRG
	Gc=
X-Google-Smtp-Source: AGHT+IEUwq3/+SDYCt8CFVGOCyoMwJod7uNKGIU/PnMwv6Iay4Vm9NylEpWbrI2asJw4JbkcyJ652w==
X-Received: by 2002:a05:6000:144a:b0:42b:38b1:e32e with SMTP id ffacd0b85a97d-42f89f50d87mr7359937f8f.46.1765185014935;
        Mon, 08 Dec 2025 01:10:14 -0800 (PST)
Message-ID: <3caf4cc4-1c01-40f2-865a-5be98d609866@suse.com>
Date: Mon, 8 Dec 2025 10:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/svm: Drop svmdebug.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
 <20251128201937.1294742-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251128201937.1294742-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 21:19, Andrew Cooper wrote:
> svmdebug.h now only contains the declaration for svm_sync_vmcb(), despite the
> function being implemented in svm.c.  Move the declaration into svm.h

Maybe again add "private" or "local", seeing that we have two svm.h?

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


