Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA2B3539C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 07:55:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093880.1449252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmeD-0008OH-ER; Tue, 26 Aug 2025 05:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093880.1449252; Tue, 26 Aug 2025 05:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmeD-0008Ls-Az; Tue, 26 Aug 2025 05:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1093880;
 Tue, 26 Aug 2025 05:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqmeC-00089E-1e
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 05:55:08 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37da7e60-8241-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 07:55:07 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61c74fc408bso2626315a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 22:55:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c78e49ca4sm2268079a12.47.2025.08.25.22.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 22:55:06 -0700 (PDT)
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
X-Inumbo-ID: 37da7e60-8241-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756187706; x=1756792506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bf0IrJTm2ybitjzYhaXX3ohuiWGKtvalB20dqkLHQbs=;
        b=OzQo+/sl2B64zD6mCntMTrRra9EIbX0jk2Rl6RZlBXWQ1XHhYvHtQZ2EnVQFTj6UpK
         G5B9n0YAAQZBltUgQnHoum43IpwA8jX1kwHYRMc0BjUZRZxDTYQlIHpvU6PZSeJWxGjo
         Xxd+u3x1YtRGYO1XGEQII1Csz5r7J7MzA/TXWOlE776aNZpKL0HhAzcLgpp2MXTOcxr6
         Q3Tg1CPcdxHz02m3f1SPu8eKTKJaSRjQqEZIF/1nPX474MLHAr0iW75iIG1piDJKJmE9
         6Mfs6NEh/SSFpSkbRKLRGXr3mNxebTpuKa8Io6OPrdLaXPWy2ZcjZPw07fNlq/aXucVQ
         PnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756187706; x=1756792506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bf0IrJTm2ybitjzYhaXX3ohuiWGKtvalB20dqkLHQbs=;
        b=vJ3FSCnYZfS9NXlYVcd0zo5YVqwBsQKB469lvWtcYioryy6a3Mu5bGo92wimxqzwMa
         yxFpgcd/320bRvOS5TBesxLsTKs45Gfu0bvw2enIgLAmPRQ/GBDQ8baICxPDltBy+wQg
         6QAJsxZByFG6Pu8pqINPFR4zBCnhRjS44J4+UQ0mlllo2wUMQVBnHat5rTefEkrwHs/h
         odSnfkCRxGTOoRrhXTLwNc66baLgIBWlgB8Lof3ygkLwfhgmrGAPum53FV1ud8FdFlzV
         lv/70judr47hG+TTkRHDIAlmXYCn9IlA0vtES8zMbfg1loeGsiswaXRrv0Tg6hHJnpxB
         5mKQ==
X-Gm-Message-State: AOJu0Yxj3YqPjSNFUjzeaNkZTchoZ0eaILQlRkXVzk18RB66BVrNdVae
	pPq7PLBizYPzcPNYMn630DDKYMe7YE/YyiWs7VH9cIYpQzJ8EMhEa9FMm1Rx3w336w==
X-Gm-Gg: ASbGncunL1gWntrz6yWYYjIg6hekamA/QTYB/LHSaz9WMHbAbNvAVbrIT9Tyr+AtmHa
	EreiEpaX0wj/cabQYy5c3J+ZZbyOl5OpN1qF7f1HeUgBB/HMKh1beK5nfMFjinNzJ4UU40kJYiq
	5uhFsKhyhZkX/Y6wMCPN8aEpxRv15DYZoH8wu8daXGMjUBWmFLSoJtJHOKZYAdEfe3OU1BwiauV
	LKeB4Ir2GvK6rPDIF5T3PV1xlXA4L6WY3PimouSmD9/CISTSIf/Mx6hgH6Ex8Qb2iV7NMFxtpCQ
	twajT7rVOmoSxrg8MxcT3OiuhG2BhAJczt5F9WlGhec+aiIUgHlxpyTWt7upXOP+ppO54xWyf1A
	xgZpzieCcOUi7vnhTME9CooaIl/1fHLrWBOe9qxT7anpSWrOWtzY34ZPluCOrqmabTqp4AbYixZ
	bRowI+xynrYwoVx7Y8Xw==
X-Google-Smtp-Source: AGHT+IHa1Cle6qKYAj8T+fk7nRkSxLn1UrWvOaKdox9Q0HFOoNX4ZjJAUn5J/xFLjhEp3eHf0pDviQ==
X-Received: by 2002:a05:6402:4413:b0:618:4044:67a7 with SMTP id 4fb4d7f45d1cf-61c1b453362mr12183643a12.5.1756187706521;
        Mon, 25 Aug 2025 22:55:06 -0700 (PDT)
Message-ID: <c243d9b1-385f-49a3-9c50-507250f7bb68@suse.com>
Date: Tue, 26 Aug 2025 07:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
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
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.08.2025 17:50, Oleksii Kurochko wrote:
> Hello community,
> 
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
> 
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.

"amd-cppc CPU Performance Scaling Driver" has been pending for quite a while,
and really ought to make it imo. I'm inclined to say even if an exception was
needed. Parts have gone in, I'm about to commit more parts, but whether
everything would be in by Friday I can't predict.

Jan

