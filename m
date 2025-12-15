Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEECBD296
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 10:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186700.1508127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV4q1-0008TD-Id; Mon, 15 Dec 2025 09:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186700.1508127; Mon, 15 Dec 2025 09:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV4q1-0008Q5-F5; Mon, 15 Dec 2025 09:25:53 +0000
Received: by outflank-mailman (input) for mailman id 1186700;
 Mon, 15 Dec 2025 09:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV4q0-0008Pz-C9
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 09:25:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ba1fe7c-d998-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 10:25:50 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso25473215e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 01:25:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f7037casm63551785e9.15.2025.12.15.01.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 01:25:49 -0800 (PST)
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
X-Inumbo-ID: 0ba1fe7c-d998-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765790750; x=1766395550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YWk0EIbt82JQ1964f4M96lQ0hioHPVaulROOQ/otUgg=;
        b=CNy0yX+AIC/7pB9GaGceHaWOkJ0LdD/vTN1MqDuGy1f2VWjIONY/A8c3GSZK2EdAky
         Pw9/mfKt3bC3Ik0SV4BbTztl1DvRuo7Mw91qvQ3GrumQOQHn3enGQG4+140p0x6E9xeQ
         hl5Un7zg2pOrN/k1jcm7KmmkJuoPil2n0m/aGfUNWcqOviJx2xm1yfUOzM0ehkQCsEA0
         OjLztc3/e5K4CSRqV5igL4vgWJcQO1DwHFXpNkKq2uwgDedIK1xgPlr5iDMvv3B1P/wc
         TC3+V8UNJDzvLrklNkIx+IdkbWKNBZrEvuqSFX2atUjYi/EZ4S2fwvdN1Z4MSHDla7/u
         4U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765790750; x=1766395550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWk0EIbt82JQ1964f4M96lQ0hioHPVaulROOQ/otUgg=;
        b=tSENDaeAXnu1//r8w1GAXIRWT6tug8eqhCV8X3hNpI/2ScqGDNfr3WZP+6Ac2V8pkv
         vOfG/08f+KVPA8uFgJbGfsNG4ZD/ztob385VWXorGM6vU2iRc1NjNBwXmAWgBfZVSAk5
         SnS+qtMVXc7/Y50/5y4izHUciM20gLjLB6OddTXAbLQ2imH0AYxZxkknRpe5lVJaqgtD
         jfRc8a6qHshi/SdJTHYqSlsBYar7Eduu85XP2O84d9IPOIsQPDPW8z5D5e0+V5Yn6HoJ
         HfzgSTB27f0+r+xNLb5WVTCL58d6jYcrkEv7duufJvxkbcmZhw3z0Z8wDnkukI0qmkSG
         iodw==
X-Forwarded-Encrypted: i=1; AJvYcCUpxRBIjUdUgq+Go1IchwM1See65JE4sQh2Y6teGHd5iuob9waCWE14wnw5oFBcHrR11eC0U0RAax8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzKb1S27eX3MncygOU0P5GK6VyH1YWOUigxt7voUKVnHRvEKq1
	qV0dRDmTyMlnNmIhi7WpzUNXSY2y+8uK+22by0p6yYgzQM26Zy9cm1tji+3oVKmTnQ==
X-Gm-Gg: AY/fxX56klAg8Nv4IJR416GH5znEugHCgE3EBnb1YC2/WMAdIuL/y85QqObZntWIXe6
	MKWNTJU39aXjwWmw8nMS1YhD1CUj42iES+jEVD9AtAZp4Jrw3KHRSEXpd5eOGWB5kfeYI7Q6uBp
	03MIDqa8H5Vp9t9EYa9aaUKPyL9iFeKXArdsQtR6yJWwY50hCnSVJckX9ZfIe8s7f3+U+L9yi1W
	PuOVqvztSXRdvzMFgpuo+9ZvvemkZ4uOGI5MZeW3PSFk7fqiXYeq6YEl4Z1fS5fChTrKg595bHq
	XP4uvqkaPDzaYqJJBP+3flMaov8PpMBfLfU/ZuaaVg0EzhT+yhYORGPhL2+KvnEtcesycJDwr9r
	20GfwisGRc3elSjmn3u57TT71zomCRPysBHTxQ7tGycpq1zZ9iYaNm7xwMsnbF18sxTf5m8UhFP
	CPQW6pExJNZ4KbCks4kKuAqU4GuZfuL7+bzf/FF01gcXQ1d5M9f3L9ToPdcfF33TiBKtLCAa+0/
	D8=
X-Google-Smtp-Source: AGHT+IF1kY+et7A0eINI32lT7R4Cp9IIw7Bkrws9ZmETX4My62fVEix+Hc34r5GnRwJ8JNgORLUfkA==
X-Received: by 2002:a05:600c:6095:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-47a8f90db57mr110265785e9.29.1765790749773;
        Mon, 15 Dec 2025 01:25:49 -0800 (PST)
Message-ID: <1d285717-e4ac-442e-b63b-14c99925418b@suse.com>
Date: Mon, 15 Dec 2025 10:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Drop SHADOW_AUDIT_ENABLE indirection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251212160153.2485230-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251212160153.2485230-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 17:01, Andrew Cooper wrote:
> Simply define shadow_audit_enable to be false for the !SHADOW_AUDIT case.
> 
> Change the variable to be a bool, and __read_mostly as it's only enabled by
> debugkey.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, any tidying of shadow code reminds me that I still have a series
pending [1]. Iirc you did look at v1 and/or v2, but v3 has been sitting
largely unresponded to for two and a half years (one patch went in with
Roger's ack, and one other patch was ack-ed by him but apparently wants
other stuff to go in first). Can we please see about having that make some
progress as well?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-05/msg01140.html

