Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39D9D96EA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 13:03:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843684.1259306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFuI0-0004PA-3Z; Tue, 26 Nov 2024 12:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843684.1259306; Tue, 26 Nov 2024 12:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFuI0-0004Mk-0h; Tue, 26 Nov 2024 12:03:32 +0000
Received: by outflank-mailman (input) for mailman id 843684;
 Tue, 26 Nov 2024 12:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFuHy-0004Me-Dg
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 12:03:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71eba37a-abee-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 13:03:27 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-434a2033562so12645235e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 04:03:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad6723sm13221455f8f.16.2024.11.26.04.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 04:03:26 -0800 (PST)
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
X-Inumbo-ID: 71eba37a-abee-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcxZWJhMzdhLWFiZWUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjIyNjA3LjU3MDQ3NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732622607; x=1733227407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPFk8VlynJ+ar18atOdhPkuCkjxJ4St2l9dzlWGZulQ=;
        b=VtBT+hP4upruEr9o/sYFTgR+AlwNjl1NIBv7tqR5OwWSvrcsiFi6iu8KIrKn26fzWw
         8pm67t3ayiK1iG3AdHYuc9GAgFPAE061eTM39lDHGWKGh0ZlDkpiIK+FCrRZWkqgkJWN
         XEdbieOwgA01Hr6bnMRLhwW2CAe6ydF8DAD5nDTJdGK9F1QnnnJJXhXyBLLIEjTSVdD8
         bzUmJ/nkfeevqmlzrX/KTbVbovLn5A3xm7YTJ7Q6I9teHu1cQttibmPSJCTzszuCObII
         W0PS1SLNOtEhFx/Z4DGlRgRj9WTCBCaL2/ZqPSAgAIOCt9P3+J6Vx454L0ZWWnBTrp4O
         aq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732622607; x=1733227407;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPFk8VlynJ+ar18atOdhPkuCkjxJ4St2l9dzlWGZulQ=;
        b=Dp6bXBh59SEQotwWL9HinwW9JdxJJoWDxMnoyr/mOphw7YXO5KjjiVqV609Zt7spsW
         fsdytRWUv4OqHCbhXgSzWe8DwDoRJ2Pdf4bgH2ASYwVFQs3+c1Q+zxTMZiYfhnwVaabj
         IPeurRtfV9YxRrf1LvkS3iiRZeJfAflMh5aR+ErhAHqpsyuuFTw2J94ov5gP2nn0Si/L
         sEdW2SeznN56aw6BqSbob2ReXsz5jxHtJyv4PoYk2g1jozpXU4e6Dj3D9lif2Md6Ng1+
         6s81KLUnzgAEmcfezyX2X7GyDl1YS4jKGeRezFsBYUlWLH7c/8J8KVnKiGFHEFk7yoLE
         6QPg==
X-Gm-Message-State: AOJu0YxnzM6Ns01Fm58LShzuhdDcVxnE9cZKqJsp197zkz6jz7PPh7/p
	V5UX1pOPG0146ZejvBRxYs1tTl98n4rqmqSxyt/m+m2chfCh6gNRDrCf6cEO7g==
X-Gm-Gg: ASbGncuuC5e88H+Zb2KhHRrg+2TX2ojMq+KUYdPlWN4LHyWuckI6mns/5OE6W+VfRjC
	eWg7DBIJ3PPbsonmcis8Q+g6iwNyz3mQ0Qgx530JAj1tcMuhMs/X4AXbvmhDOGiaxH627iAShZQ
	V5UzyId/f25D7fMXV/ZiEHcSt6JG74PFzE81lssgBqupRI37crsIMn3AcWLAM8OSs9APuGSUU7s
	tzblzhFo3rdjbbS1b2iqxwF2+1VZew2KvwtQWvJZGMwwIcKT4p6wBdmk6HSzgU87pkTi871/An3
	pf40ZKERD3P1koB3xLUxRiDZKb520p1Ozzc=
X-Google-Smtp-Source: AGHT+IGTtHxJzVB4lVnIvLcxLirpwq4W5keCrOSHBu3u0GbbWmbvdxU7qzkMqXW92F7tJnZTWnS/KA==
X-Received: by 2002:a05:6000:1f8c:b0:382:424b:d0a6 with SMTP id ffacd0b85a97d-38260be2ea2mr13798891f8f.55.1732622606866;
        Tue, 26 Nov 2024 04:03:26 -0800 (PST)
Message-ID: <7d115f26-757d-40a6-87ee-76d55042b8d6@suse.com>
Date: Tue, 26 Nov 2024 13:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86: Add architectural LBR declarations
To: ngoc-tu.dinh@vates.tech
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
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
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <20241118084914.22268-3-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 09:49, ngoc-tu.dinh@vates.tech wrote:
> From: Tu Dinh <ngoc-tu.dinh@vates.tech>
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
> ---
>  xen/arch/x86/include/asm/msr-index.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index 9cdb5b2625..867deab3c6 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -304,6 +304,17 @@
>  #define MSR_IA32_LASTINTFROMIP		0x000001dd
>  #define MSR_IA32_LASTINTTOIP		0x000001de
>  
> +/* Architectural LBR state MSRs */
> +#define MSR_IA32_LASTBRANCH_CTL		0x000014ce

The SDM calls this IA32_LBR_CTL, so we want it to be MSR_LBR_CTL, ...

> +#define  LASTBRANCH_CTL_LBREN		(1<<0) /* Enable LBR recording */
> +#define  LASTBRANCH_CTL_VALID		_AC(0x7f000f, ULL)
> +#define MSR_IA32_LASTBRANCH_DEPTH	0x000014cf

... MSR_LBR_DEPTH, and ...

> +#define MSR_IA32_LER_INFO		0x000001e0
> +#define MSR_IA32_LASTBRANCH_0_INFO	0x00001200
> +#define MSR_IA32_LASTBRANCH_0_FROM_IP	0x00001500
> +#define MSR_IA32_LASTBRANCH_0_TO_IP	0x00001600

... similarly *_LBR_* here.

For these three, as they actually cover groups, in other similar cases we
use function like macros, to ease access to any of the MSRs in the group.
I.e.

#define MSR_LBR_INFO(n) (0x00001200 + (n))

> +#define MAX_MSR_ARCH_LASTBRANCH_FROM_TO	64

Where's this 64 coming from? I understand CPUID permits up to 64, but the
XSAVES area layout covers only up to 32. Is the SDM flawed here?

Jan

