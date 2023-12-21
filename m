Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF9281B0B2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658594.1027829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEkt-0007tt-34; Thu, 21 Dec 2023 08:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658594.1027829; Thu, 21 Dec 2023 08:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGEks-0007qq-W4; Thu, 21 Dec 2023 08:50:10 +0000
Received: by outflank-mailman (input) for mailman id 658594;
 Thu, 21 Dec 2023 08:50:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGEkr-0007qh-KE
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:50:09 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f19a4e7e-9fdd-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 09:50:08 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so108766f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:50:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05600c138400b0040c03c3289bsm2468383wmf.37.2023.12.21.00.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:50:07 -0800 (PST)
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
X-Inumbo-ID: f19a4e7e-9fdd-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703148608; x=1703753408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2x+MZ7cSnOWKQ3huKNwW1qlNaoxAkTdCQN0qFFCj7I0=;
        b=VBJHqbPkExM5vvNJfM0fitMOuN3je7RIH5jBpK76Vqg7XOmZXibrXYTfth8geK1b/A
         4pQF59T1XPjbUDKHALQEppgx+r4CcIlPAPq8pdB+QbB3ZmqoxlqWvn4aYKkRWRAJVj0k
         XuNry7kgNNyJ9BzMvYqzMJ9jZlIMLxAdDsBlyYeUwbGrZfYm5TP6YEV1Fqqvk6K8ukvJ
         JOegI6qW1WzH8dAZieukLi/mRdCom9huKjYYGTVYYYy4/wjvZifBzkz8qY1BttRGFT1Y
         Rzi1O6omM2Rh9cRw8l85WN1dV1UCMBZIQm5VsXqLEKm/FxqAGjIp2cFNHw7fSLbcqB2J
         CNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703148608; x=1703753408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2x+MZ7cSnOWKQ3huKNwW1qlNaoxAkTdCQN0qFFCj7I0=;
        b=aMPHD4ebtdEC/o6LY5+DcsF4q/CWyKtAhBonqJ2u4X8w/rCc/n5QYLlNeJ48RuDv01
         tTYwOz2t7FSgvTtdtbO1yaN5PAtsgJxDD/FhzNV1bSTW78mG2gG80na5yqdlC5ivszuB
         qqAW8c4UPNRfZtfib4h0zLgwL/g2XeHn9vA8qKUvTRaDW/bYwqw9NBrVXUe1EU+mi3fF
         AdlichiGWpu2OdLbcAokP6C3EmxxuYa+/ogWu+/bZ+cFijI/q26gKq9ZbV/5mwMryw4d
         ziZlMoUJBw7GnpHlB+cv2gZqSqkdWKLwnkuzyFbteVPIsfPwsofhld1o7otf8kAudlIC
         e0iw==
X-Gm-Message-State: AOJu0YzkhAkp+kls8qqe2HD6L0jq0JPor7akeIHoQ/2AjG2cZl3d/2Az
	fi0aR6+U/zNWcEg6TghfVXkv
X-Google-Smtp-Source: AGHT+IGEAj83gtMFtU++SeI+9sSET4mbCwyi7MDfdn8xV62km1/kCMbsDGj2S05R7Ah+jvEJZbliZA==
X-Received: by 2002:a05:600c:4d96:b0:40c:3182:e061 with SMTP id v22-20020a05600c4d9600b0040c3182e061mr193798wmp.19.1703148608165;
        Thu, 21 Dec 2023 00:50:08 -0800 (PST)
Message-ID: <6f706a0d-1fd1-4ae9-b84d-b94747164db7@suse.com>
Date: Thu, 21 Dec 2023 09:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: extend CPU errata #1474 affected models
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20231220142218.22850-1-roger.pau@citrix.com>
 <ffb3445f-fd50-4746-9f70-272ea52271ec@citrix.com> <ZYMD_qukgCutWXRI@macbook>
 <00b19784-00bb-494d-bfc0-f0deaa0c1e08@citrix.com>
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
In-Reply-To: <00b19784-00bb-494d-bfc0-f0deaa0c1e08@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 16:42, Andrew Cooper wrote:
> On 20/12/2023 3:10 pm, Roger Pau Monné wrote:
>> On Wed, Dec 20, 2023 at 02:46:43PM +0000, Andrew Cooper wrote:
>>> On 20/12/2023 2:22 pm, Roger Pau Monne wrote:
>>>> @@ -978,24 +978,24 @@ void amd_check_zenbleed(void)
>>>>  		       val & chickenbit ? "chickenbit" : "microcode");
>>>>  }
>>>>  
>>>> -static void cf_check zen2_disable_c6(void *arg)
>>>> +static void cf_check zen_disable_c6(void *arg)
>>> fam17_disable_c6() ?  I know Hygon is 0x18 but it's also reasonably well
>>> know to be the same uarch.
>>>
>>> This particular algorithm is good for all Fam17 uarches, irrespective of
>>> #1474, even if they happen to be the same set of CPUs in practice.
>> Yeah, I was about to use fam17h prefix, but that wouldn't cover Hygon.
>> I we are fine with it I can send an adjusted v2 using fam17h prefix.
> 
> I think we're fine calling it fam17.  Happy to do that consistently.

I agree. And it clearly cannot be just "zen", to avoid it also wrongly
covering Zen3 / Zen4.

Jan

