Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF49BFB670
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:28:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147900.1480035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBW4Z-00016Z-LI; Wed, 22 Oct 2025 10:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147900.1480035; Wed, 22 Oct 2025 10:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBW4Z-00013c-IV; Wed, 22 Oct 2025 10:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1147900;
 Wed, 22 Oct 2025 10:28:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBW4X-00013W-Qh
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:28:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ee03b9-af31-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 12:28:00 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47112a73785so50844735e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 03:28:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c438caeesm36152615e9.18.2025.10.22.03.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 03:28:00 -0700 (PDT)
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
X-Inumbo-ID: c8ee03b9-af31-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761128880; x=1761733680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9C9COks+l1CuXwtmwDqd+AZ7DZ340WLwUGQQ4RYQbOs=;
        b=NlF1cCG13fjdri1/9F3rbfWGCdbx3Tn9CqDNJQ67e5GKdnFIUViGaAE/9yMrkiOqMH
         XMZ6RV/73PLLqMq9EYDZaZkdcP09v27n1D1JLrovcyM8U2k7rtel2EjbS02c7IaAyvHa
         crJjtUWOU56yNi+JdJ/VVVJsjELyQuUS2Vd9iHfmit0h1K6DHl2/zMUivSfNYn1r1hUg
         +YEdUSi5pgEET2G6YLE4OKxexof+IU4BvFGR/kaZJuLgFjS5TjauUqNAklECfuvB4jHZ
         tkEMex30L9yUwJouZxIPDggQGvC4WvN0/sRNKIL9tpVb6OFkYuGIwian82atoRt9/shP
         +I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128880; x=1761733680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9C9COks+l1CuXwtmwDqd+AZ7DZ340WLwUGQQ4RYQbOs=;
        b=f73tl6m3bsDoLWHCpLD/J/NTwB7DVHGX96ryR27R3LeBxzyjN+/O+Mat1p8NzKqPaB
         HcUiNzm6oypeoQh7EzTugF9Ql1vp8xIWN0wbWQyX8v0OoCxtmayx/YI4EYRBCnVbZSws
         Bjt5zOhDKHz3bGzJNy83nxruSgzcr6y9H4skCdwQMbKgw4k+E1z/iNsle3VCTPpvo21q
         WVvPoR4gZDQ2OkFdF/oHrflvpOy2Y43017KVOVULDTzpnYaa1BZGAKOVTbcZHJOGHLW3
         g4nXlwflIxJe3n1oDic815OBcMg8ZbhsFRvlPJ93wyqyATNmOUmMrXoqr3PYL0aRgYJn
         dMGg==
X-Forwarded-Encrypted: i=1; AJvYcCWGLBstKfVXjLV0cguA9OdVWbYoaNvu1tGz62Vbc54L3SOi0khYP3psvrmMRRD67bu9ltcRLoTuirk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSf/0M/W/Cc96z2Wj1+uCJnK34GTU7WQRLK4729I26kuWD8UgZ
	aPMCsK2Ff2riwGitSEddSDOEmOQyk3vmvR6FGxWMvEFdOFquqAWWRE7a6Ui4TQcmOA==
X-Gm-Gg: ASbGncuTi+4FDQe3BOKp0FdLLtp4Z/HEMCbNLp5wLMKxqIQQYAXYwHxZRam1PF5AIL5
	Xiuc1p6pkU8fHt6AOHA7aYBWE8PUSRjFSJT6ECNpI8TSSr9+PkHnvNHiZBVyPIITlkBOj/mrkn0
	XaqfhBI9j/WEzP5MrSbYmUW9VMr3dq3PJISwxmjeQFrn/7hIVLMRoHFw68+HEm+OpKmEgN5vI2X
	d/9mNVMivO80hOSibIKxMOV73HnGGn/ksXMUEmowhn6ZhnXFHodabVMm0mjyF/1vtwNWCxojiIr
	LonnTin/TEcT3Qb+drt8cy5lj2fuBTifO/fLSJJXGFzqtwK4tLyGqHAVeZiZAsGnFp+toQ5AUQp
	q8lQEwS/xIz7VXTav9srtD+f615JJjJaZOGfRhxzP5Qyx+KfqaEQCVKTdYLTFPAhzFuJGri/6dt
	zM2hDqecxPN1/jaXIVF7Az+tl5cIa7vRyrOd9Ozl4OBJQUc+4CaVJ+dp/9gBDi
X-Google-Smtp-Source: AGHT+IFXpD4QGlChlInj2xKTFdpEVcIsLW0FRZppx2Q8oPvclMGlHiKo8EzMYTnOO7Oo44bs/vlv1w==
X-Received: by 2002:a05:600c:4507:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-47117876744mr159497095e9.7.1761128880463;
        Wed, 22 Oct 2025 03:28:00 -0700 (PDT)
Message-ID: <e8765029-3a8d-496d-a409-8e576618c1b8@suse.com>
Date: Wed, 22 Oct 2025 12:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] vtd: Move (un)map_vtd_domain_page to extern.h
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1761124632.git.teddy.astie@vates.tech>
 <74ff3496afcc0a0b747f9ea203d10f51e6b4d00c.1761124632.git.teddy.astie@vates.tech>
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
In-Reply-To: <74ff3496afcc0a0b747f9ea203d10f51e6b4d00c.1761124632.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.10.2025 11:51, Teddy Astie wrote:
> These functions are basically wrappers of map_domain_page;

Given this, ...

> move
> them to the shared extern.h and make them inline to help with code
> generation.

... rather than moving can't we just drop them?

Jan

