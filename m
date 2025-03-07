Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33AA562F7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904733.1312576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTPz-0003Zl-27; Fri, 07 Mar 2025 08:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904733.1312576; Fri, 07 Mar 2025 08:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTPy-0003Y9-VS; Fri, 07 Mar 2025 08:50:54 +0000
Received: by outflank-mailman (input) for mailman id 904733;
 Fri, 07 Mar 2025 08:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqTPy-0003Y3-3Y
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:50:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4617bf21-fb31-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 09:50:52 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so17330595e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 00:50:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd41c7cc7sm78908345e9.0.2025.03.07.00.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 00:50:51 -0800 (PST)
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
X-Inumbo-ID: 4617bf21-fb31-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741337451; x=1741942251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O1x1n+AZzf5/b70OMat2ZfJvKVdQaC7k7NkrClJm+nU=;
        b=V37WWK4b28prbkr+rCu8gdkmZf0hol3nstrge59eZ9CauDFfQIveiQFcIww+1vH3yS
         dCSrBLKrhfUw3Y3QfET6+iHysrtDmutwwfDJA2dssYNkE8wQ4k21SbwJqVN3lXYxpnEP
         mfHUwu/13G4/Q53Cw02eXkR0yDLGU2RWNMdKVtTqO5XtpwFsy4PmBHJ65Tlih6udFKoM
         3NXkOXVreokzHu2yOdD7gTn4eXlp7KaKOOQWxoY6aDWA9CkQpHFXmqIPEbdD7lYPeIKg
         ht2um63Eq360kq4zhQOC8tTwe5QqaF/vm5gQknVg9dfehgI3nIlNPjlIK/olnWDgQFY/
         9QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741337451; x=1741942251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1x1n+AZzf5/b70OMat2ZfJvKVdQaC7k7NkrClJm+nU=;
        b=WHEMbRdJqh3dr9gzdfYKi0krE00bYFer9YGwYUgqRPNViRlQSFjxE1YbpdbURb5s6R
         c5RgEZZnEK/9G80H/Fn/gtKkZOgQ9kJjX4okjJIwdumeT3DuBbO73YFfeWk66YcIkSAu
         iTGY6Y0VGfSK+x3Lw87AJh1NfAnwL37YGFUnjGlehw+Dh/BT+zsFz3QOgdgwEsfzX2co
         IqmEBMU49gR8UsDFUAKJxAX1OmNl6UmVoJlgXcXjcVUT73jKbMmU5PN7Z5VzFUSpykvj
         RZURXt4B3lqXBCEebTpRAXXqqZ94ORdw8rlIngjt3CfqM71yGpZ/6kR+eugLelL4vFWk
         PCtw==
X-Forwarded-Encrypted: i=1; AJvYcCVhcPpDOb3SkQ42Sepj9trOYeO0FclDA0wEDBoXdKW/LUtV9Ntm27d4aMJwfXW3Ash00UVh7ELXo/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyyg2IMhqrHn+1FSOYcXNJPSpX0Rx59G1AvK5C3S8ltC1ibftQB
	rPV6CljbRFRs7rOQejPvs3UeVHasoH5BvOO2FhLQN76fqEYmQTXrpt0nwNXsfw==
X-Gm-Gg: ASbGncv01psbJpGo2XyAm4xTnGrkrLjx4bpWN2YgE5hj8dQNeG0e9oBexQrktxFGMMz
	KHNLG6/gbI7ZwDQyT2MLTSdP2yqTdwjCvCf0hJA814W/mq6x4YtI7JKlj9o+vTMMJpQE0DMqiro
	is/S7Ez6JL3y0nq0TaTB4bcmZymIxzMN3EZNzpr4dj6pu+NYLTb2IFOPmDAGKHYHGBodBRCPFZq
	0+1S5ykhW6qnIBa3aqo+MeWkzTj/iLfX5kQVrzuP0hm+H30W+IKr9Wl61MWFikqJpH8hc/oZkXi
	Lumq6ubwqK+KLuJAAnn2gFTKDV4UC2bisIn62igaDt+fJDMQymAc9gJQRx6iK1PEAfbVkWYwQBa
	cO+ix0eIXlPKUPKXMVhh1JPOlnCgm3w==
X-Google-Smtp-Source: AGHT+IFtm0vCNT80/kaN0ZBJg+VWDLFqUhJpN6OWNhiKBvTVPzqhWfBg+8Nb70DFrpKT/ClmgXv6OQ==
X-Received: by 2002:a05:600c:468f:b0:43b:cf12:2ca6 with SMTP id 5b1f17b1804b1-43c5a62ff38mr16569555e9.1.1741337451492;
        Fri, 07 Mar 2025 00:50:51 -0800 (PST)
Message-ID: <26b95258-af65-4cbb-a054-d7fe9b0ea1e4@suse.com>
Date: Fri, 7 Mar 2025 09:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/e820: Remove opencoded vendor/feature checks
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250306233519.3006560-1-andrew.cooper3@citrix.com>
 <1f5bf9e0-4f88-4d00-8b44-cc4e666aeea5@suse.com>
Content-Language: en-US
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
In-Reply-To: <1f5bf9e0-4f88-4d00-8b44-cc4e666aeea5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 09:48, Jan Beulich wrote:
> On 07.03.2025 00:35, Andrew Cooper wrote:
>> We've already scanned features by the time init_e820() is called.  Remove the
>> cpuid() calls.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
>> Backporting.  Not sure it's worth backporing, but it is safe (just) to
>> backport past commit 365f408339d3 ("x86/boot: Load microcode much earlier on
>> boot").  That commit was the last one to reposition early_cpu_init().
> 
> At least I wouldn't consider such cleanup to be an obvious backporting
> candidate.
> 
>> I'm pretty sure that all 64bit CPUs have MTRR, but I'm less certain if
>> dropping the check is wise given the variety of VM configurations that exist.
> 
> We did consider exposing PAT-only configurations to guests, so I don't think
> we should be implying MTRR from being 64-bit (unless we know cpu_has_hypervisor
> is false).

Except that - we do:

#define cpu_has_mtrr            1

I guess that wants undoing (pre-dating the consideration of Xen running
virtualized itself).

Jan

