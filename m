Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E1A76733
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 15:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932539.1334647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFcG-00079P-UV; Mon, 31 Mar 2025 13:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932539.1334647; Mon, 31 Mar 2025 13:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzFcG-00076X-R6; Mon, 31 Mar 2025 13:55:52 +0000
Received: by outflank-mailman (input) for mailman id 932539;
 Mon, 31 Mar 2025 13:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzFcF-00076R-FC
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 13:55:51 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da13db4d-0e37-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 15:55:49 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso33630045e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 06:55:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6656afsm11227933f8f.40.2025.03.31.06.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 06:55:48 -0700 (PDT)
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
X-Inumbo-ID: da13db4d-0e37-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743429349; x=1744034149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UEQksUadJSEBc/4siRJnplZuaChLe0p0a/F+hBy8aC4=;
        b=O5ooDFJGdkZKKTUCdJUjtJhkYG4MK7f5zeGQUqq/XvoZWfgNtC9JeV1BE3k7vuy7k+
         LKs0MxDCcoUh8zxuuG0JKdc5Uwl/rDV/X9WUcXNGZxUYRRBBvBO/t06GfLKtVYnK8pZ/
         pSXZM5wFd+3CFdM+ZhRyXx3Vq6g6b7kIScNtLn3hIG/+WcxvI1yXtvZ1EUM1nyQUNFjf
         Ua5Ra76PxIpoAm8biEXOsV2t81U1xp9Yo8A9mGeEEe9A24nZAFWfHPjCB1ETjIMbx2pN
         IrthIymFjRb6CCl9WlKpz4+XqbTAGuRyGJ2Ij8Up249khzptRoLFd1wTbe6SvGFR81J8
         6EuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429349; x=1744034149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEQksUadJSEBc/4siRJnplZuaChLe0p0a/F+hBy8aC4=;
        b=bWkmY9IwSqSywxA2Bk5CayOPZMFy5Pcmwi8ph0Vr4oufgUlaFXw6eukPKYFNagdjA7
         64kA7dOBO/M/UdbPtUq79bf3xe80cWlmFxCAALMOHaIOFTQ4nz0+M4LrIQRn2OYI9C6e
         Z5c8OkaXXiGkeTdkybbU4ra7xTVWkYgWA+NXyB2D5Vz4ydlO2aYRKBvlHhGt0ZmQnzEt
         U7lQVqPQV4UvcorZR5jyac5589CqNmCG7Bvuoj/9X5KjTppdXhxUysnJrDQo+BRD0FXK
         3npYXDHx+1B1lzu+4YiQkdxqdbYfsh0zEd7GA4dOCRaM9O1QD8pz14Qy2nu1mZkhrvlX
         Zklw==
X-Forwarded-Encrypted: i=1; AJvYcCXCBKZXPpk6Jc95b7zsyLuKZewffi/XXTAYX9KSd58rVe7rBgn9VYg41JzrutpI8Nb2wasRYdRsBQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySOT9sZXPaGrEz7YbvSYdwLZ+bMz0z8Mv0QYSjx7OJXcfadM6M
	PiqkmWtJ5zap7/Os7qnxkZ0uBeXxenyecpgE/pLFK66cGbXJpBFLzTyi5V/EQw==
X-Gm-Gg: ASbGncso4ER2NVbjBVFTdWN6l3/UWGH/OO93AIRrfp3GjlogyJU90eROJ8u4zk9LKQY
	uQEN+lHM7uPpFbgmalzhk9NiGGJfnvufzM9rh1TZi8YRTjnVGS96rxLkAk+Ux0Y8iK7Jc/MOmyz
	oPp/hE7E0GHi5fkTFNhu49H3N8A74FI6O7gQHuEEi2aM7CUe4sZ5R5H7o8X165DgneCJ6jM4IrD
	3n48NFzuF+biSKu1svEKcWXC4Hd9zspFZKM6pG5R1GUtquAYM1TA7qxysS4B4LIo5DPnZgXkjP5
	yxr8cjIdPmmo63bZlERisa/ON6aR0vImCUh/hzzAmbiG9gAO6rBr7wFaw/Q1SJlUkbaVwHuxcDD
	hUJFxFThePglG2FHEqjrX6pKfoSBG9w==
X-Google-Smtp-Source: AGHT+IEEvh3M2bAx30AC0KRWfv78VFMSG6xDQNgkDP+E4e+dHOretfYFfv5IJvZc/DCO7Dt/EB1Mig==
X-Received: by 2002:a05:6000:40ce:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39c1211d34fmr6663766f8f.53.1743429348922;
        Mon, 31 Mar 2025 06:55:48 -0700 (PDT)
Message-ID: <a57e34d0-f51c-4df2-91e6-e82eb3c6003e@suse.com>
Date: Mon, 31 Mar 2025 15:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/16] xen/decompressors: Use new byteorder
 infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lin Liu <lin.liu@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> From: Lin Liu <lin.liu@citrix.com>
> 
> unaligned.h already inlcudes byteorder.h, so most can simply be dropped.
> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

Nit: Again missing your own S-o-b?

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

