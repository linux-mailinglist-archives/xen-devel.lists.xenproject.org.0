Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E28C00520
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148930.1480749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrpc-0003b6-MR; Thu, 23 Oct 2025 09:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148930.1480749; Thu, 23 Oct 2025 09:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrpc-0003Ys-JY; Thu, 23 Oct 2025 09:42:04 +0000
Received: by outflank-mailman (input) for mailman id 1148930;
 Thu, 23 Oct 2025 09:42:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBrpb-0003Yk-GP
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:42:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86006c38-aff4-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 11:42:00 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so3548535e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 02:42:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae9f8eesm27709675e9.6.2025.10.23.02.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 02:41:59 -0700 (PDT)
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
X-Inumbo-ID: 86006c38-aff4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761212520; x=1761817320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BmZ0OHqn3bIAdqcpUVIWufPsgR7d8480d8zKVxKjUJ8=;
        b=DgRiB5CsNQ230Jrg4ywIkxqnDW2tz8kq/PWAVC8DNKaSAqzR2LemeLG9QgRWYfcbWl
         f6TPZ1X6/DEGSXXDZOWGZ3n09H9oMYePrW0UfEHW+BKKY+St7x3wTrcQg2ZefS0dHkVP
         t/OxI8v2K/FqJ/EOY9UxxqVCWFn+0swdZVe3wJgjpDqylSRRCuARakoPVKsjoVrpQ+7s
         UiI1J/DfCGjAZ2UuK02T5P7RFf98aUvDxPWFarBWg0oB1OFCDnvzNBp9Qacu0gk10QDf
         pVr0SGGXRxCwCXgEyTjXvmXQp1sosqPe0bAbYp2ieIfyXUqkATLp679qjO21BspLWgyH
         3dkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761212520; x=1761817320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZ0OHqn3bIAdqcpUVIWufPsgR7d8480d8zKVxKjUJ8=;
        b=DAnKlR5vSktD1u2rEGhrfS7TS9PwXWVf4YI6qKIbBj4euCyxBU/1mb1Cu16g0+akxy
         SlsUzuWfbHd0QrJ0meB6nT8syYfQn92psqLhu8brQ7bgfWhvo48FVsX4WPN7+sCWGNbB
         dzqQJ947YLmxwDEIqcULWaQWA8giRlLFDhkP+8aNU+D9HLd3eqyxdUsNyqExq0ls1xaR
         P2i0Da8rnDHlcNqGWu0jETemcZ5NPni33JpPHDt+YS8CntrEAKJE5mbqTXZUBZbwcgnS
         CL5LAc4HP9WbDEFXnR+dI4UXMsGxpd5FV3K/Tff/Rb9UEcgvmJn9HpyEkKmI0YSCK/Fw
         CRyw==
X-Forwarded-Encrypted: i=1; AJvYcCXyzVaweUXtkPiwZNyg54ZF0aRtZ1xWvjSWs1gkr206ZKOMiiJsKgMfxtt/7wyyStVCSso6FzFuiqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3aqz79hQMgnd1oBily45uMj3sZElVyH3kJHTNcevMQfc8qRen
	ZvDKnVvL2xYxPzoeuiZEy9e4Gpb5IVKjV0oxI7KbDiUEeT03D4X1QQoRUb9M7K2w4lSLEmGVJcO
	SVOo=
X-Gm-Gg: ASbGnctcjx1c21qYDLAhDea5H33hyCOhULeecHDPTiTIhAokSCx4iLVhSi00QTA8ppn
	DMu8/Z9Ulss3Dj48Fps2LqqT7okilrL3/UkWF+ZsN0ud1fp/mwopsAkrtTIWimbXdl877tpS6Aa
	iBRABI3AubGOiJqU+2DihGW9UilBtxXgmcrjIo9uTsSSmk9QR3vUwIZdZ2F3MNjlxmKdaS2X/+y
	RUka8TJwns9cf9ycDYTBSUMpuqnrPMajFW1xJgHCqvkWOHCCzsCzwUsEcgiN6/7tyDkb31YwMDF
	PjBgN3zsYMuN2QWP773vR6IsT/9B/TkbLR7z22A15nEpApKSpQnFKOhg6Xb2z8PJ18OkvNmZkCl
	Nagi9i2k7BY2lS9+dPWtOqFM1TJHZ1X5xW1hnL5VTZLxtDbsYkCL+m+B2jNb8X5U7G/3O56Pgqw
	xrNWwaRC1ueg/4UTXidWD76hAxG+OPtRcJrV640Ts/OeijBdecTzfqvRqwkww8Yz4N8w96ujc=
X-Google-Smtp-Source: AGHT+IFzLEGY09P9rggoZuWOVXyOHtIUFUFXvP+hiaX78GOl8//OPufXANrLkJqYhGuvb2VQQuiCVg==
X-Received: by 2002:a05:600c:4e8b:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-475cb0452e7mr15090205e9.32.1761212519876;
        Thu, 23 Oct 2025 02:41:59 -0700 (PDT)
Message-ID: <8f7addb4-04d1-4586-811b-8e77ff668274@suse.com>
Date: Thu, 23 Oct 2025 11:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
To: Anthony PERARD <anthony@xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251023085730.36628-1-anthony@xenproject.org>
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
In-Reply-To: <20251023085730.36628-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 10:57, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> If not available, fallback to using YAJL.
> 
> The code is using json_c_visit() which was introduced in 0.13.
> json_object_new_null() and json_object_new_uint64() where added to
> 0.14. And the last one json_object_new_array_ext() was introduced in
> 0.15.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks for sorting this. I can't really offer R-b on this, and A-b would
(at least formally) be meaningless. If you nevertheless want to apply the
A-b, feel free to do so.

Jan

