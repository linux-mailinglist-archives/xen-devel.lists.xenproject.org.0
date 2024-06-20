Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E385D9103C7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 14:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744442.1151480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKGdA-0002GH-CD; Thu, 20 Jun 2024 12:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744442.1151480; Thu, 20 Jun 2024 12:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKGdA-0002Ea-9k; Thu, 20 Jun 2024 12:11:08 +0000
Received: by outflank-mailman (input) for mailman id 744442;
 Thu, 20 Jun 2024 12:11:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKGd9-0002EP-1s
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 12:11:07 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 298d46f9-2efe-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 14:11:03 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42108856c33so12016195e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 05:11:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f1a4fdsm135405765ad.233.2024.06.20.05.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 05:11:01 -0700 (PDT)
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
X-Inumbo-ID: 298d46f9-2efe-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718885462; x=1719490262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SKD+cu47XfPSl8XESj8gvckbidFA/Q0v6prm1AS0zpE=;
        b=IDbBnswr6tiBmjuUUCmVZjtWVPgtzZ/nAbrayxfsaRbK/1TwCzp8f/o4qL+/mPKNv9
         fuvZY29DFrWBQIQ9OQH9Mg2iIIlWadX7P79zJEtbi9uhvkPcE5Mile+Tsefgv1HwmzTL
         pe1z+0EpBkh8F2mAJZkwbmhlA0usXPEIFDBehXMTiMxGwxAPBx+RQH6Zl4T7sdP1ujxk
         3DGveNc3kM1ECD5AV4lCvKw+My6RNjEWde5B0v0RYlNsojbW0Bv/V0maU8NhuVqUrUoV
         8TzjmBPTBSoxfutXixwc8tKCBih0kULAWti0llPf579oo741ePXG/PqegvixaKUcUpKm
         LFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718885462; x=1719490262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKD+cu47XfPSl8XESj8gvckbidFA/Q0v6prm1AS0zpE=;
        b=WzI6ZmZSQBpx9V8Mh4KvO2+bm2SHoxq5yOOgnK+0ftGPnmLh8rbSHMZNgAiMPIygYx
         qLbAxgHMV8/dt7cLWsDZufuD54IQCH4YIFj/kcys5RN+VtSpwc46zo0AU68aUVzwAXvt
         W+SleyEEnfhhokzP5XpnXnxHr0SjUDM3+4DsFhpZkZf13i7EfniGNk4E8uGetLwOJqo5
         HExWqgDF7hdR5jYF594g/QdCgQDpGdQH/n+f0dMykBgzlydsOf/oqOjt8DV/BIGnqrHh
         SjCDg5ddg5mqj45Rj+fHxQ7jpPFHSeGxf6Dac5zjkSa5/KHl/dN1lFx/zMoqdRcualeR
         fq4A==
X-Gm-Message-State: AOJu0YwATrwNyyK9+6YtV5S2iQ/Nl9uafDi2zYMSJABzA90+0VhR6n7O
	m8fQQ+Yf8xhMeEA5mLPBUDEiQSWr36Rozwc+YCP/ymxbWYv+LaVbD2D+6P7Iiw==
X-Google-Smtp-Source: AGHT+IG1bnPDXaSA1EmKPlhff1+O+/TPEbRyXg1Z8BvD3mcqyJFyJqyKq87SutlvGyoEGV0wmarJBg==
X-Received: by 2002:a5d:4b48:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-361e909623amr7261094f8f.9.1718885462101;
        Thu, 20 Jun 2024 05:11:02 -0700 (PDT)
Message-ID: <4b8d9881-48b4-4600-897d-da8684b10132@suse.com>
Date: Thu, 20 Jun 2024 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] x86/cpuid: Fix handling of XSAVE dynamic leaves
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240620111438.2666922-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20240620111438.2666922-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 13:14, Andrew Cooper wrote:
> [ This is a minimal backport of commit 71cacfb035f4 ("x86/cpuid: Fix handling
>   of XSAVE dynamic leaves") to fix the bugs without depending on large rework of
>   XSTATE handling in Xen 4.19 ]
> 
> First, if XSAVE is available in hardware but not visible to the guest, the
> dynamic leaves shouldn't be filled in.
> 
> Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
> host/guest state automatically, but there is provision for "host only" bits to
> be set, so the implications are still accurate.
> 
> In Xen 4.18, no XSS states are supported, so it's safe to keep deferring to
> real hardware.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'll try to not forget to include this in my next backporting batch. Thanks
for getting this sorted so quickly.

Jan

