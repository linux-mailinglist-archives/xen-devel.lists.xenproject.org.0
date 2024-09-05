Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA096DEE2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791236.1201090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEjZ-0001WM-32; Thu, 05 Sep 2024 15:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791236.1201090; Thu, 05 Sep 2024 15:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEjY-0001St-Uv; Thu, 05 Sep 2024 15:49:20 +0000
Received: by outflank-mailman (input) for mailman id 791236;
 Thu, 05 Sep 2024 15:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smEjY-0000IZ-Eh
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:49:20 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69eda574-6b9e-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:49:19 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86984e035aso142566866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:49:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a623e33f6sm149844366b.212.2024.09.05.08.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:49:19 -0700 (PDT)
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
X-Inumbo-ID: 69eda574-6b9e-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725551359; x=1726156159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qOMHI/KdbMhf+AMOW9dOHEZIKrRNTDQG7r0AY0lW2oc=;
        b=gaH7strazLGVSsSFPtnpo4622IJa2Kb4QIA4Ptze8JD0Db4n21Ynu6fgS0fgYDf+i5
         8tvVAUmRdZCaIKc3JeKKkDqFEhoJtJLpvEU6BFsO9/uEJH+OIiPPAS00UailFb347Air
         1RJfB0wt+Qet8RNKXSefWnwSlTyXsuIfidRc9rtnNdjp/iVTojlBs5rAyPEuVqXcYJQa
         UhuGbm2DQIoe1vXP2FjrzlAtFp9+/tRoj8L/oGPhpsFcKs/CTMzIWqOO0cVZ5qwiPfRG
         PIyb+bR5Qk8Js9kqrWmea/W0rzsytCdC6OBGSwvNB+86wUTvA+zt/IyBdz8RLJFgv7k2
         GdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551359; x=1726156159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOMHI/KdbMhf+AMOW9dOHEZIKrRNTDQG7r0AY0lW2oc=;
        b=ROzfiI5rYu0SvUZ13qaYh2qiH46c7whxqLHuOHmJcdlGO3Qif1m5nJOiyO5t+mJOd4
         JALsMTOc4/M7qWjVtyke7huUOTbP1+rXMJv5L6t/hIOgeR2sLspDIz1q60hfZTubsB7h
         +QqrgTq/4rzNtXxkDwSjXYR4MZXZbxyguXgTAkIjuGictcl87Z4B869WbvAPiZOUHvwC
         by9aqk3kVe0RGbyqM/YidO+3wJxtmn8jEZd1BsPyhu79DJWbL6+IXs3/OZc+zDa7hdFd
         0ya1i7VFldQJ7qJr3wd7ZNUKEgtnZX5ABpGUpsTQgP3xqd7ggLLySTFoRXkYYSW7H45L
         VE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkVhwDL/TzLXo+Ai8Zp0eqySwwRs8ziPvI4KkrpgfX5w98haWar9X+Or354qa+oCmKRI9IP3D2+Dg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrxMB/7lehxQZx5lQZCe7GXOn+1NIPGHXaBFgvfTFFSKILxBFr
	0UDDshBpAlqmCPppFM9O0MopXN4tFDw7Smki1iNZ2/6Csg/38vDONsOApgoXuQ==
X-Google-Smtp-Source: AGHT+IEUV9esTp4H4Jul/5BIrE25J6yz35ffki86mS3bzyBCufTbtKmR8M6MVUTRxfwZz59/WNUZwA==
X-Received: by 2002:a17:907:3f24:b0:a77:cbe5:413f with SMTP id a640c23a62f3a-a89a3511015mr1569648366b.4.1725551359236;
        Thu, 05 Sep 2024 08:49:19 -0700 (PDT)
Message-ID: <f19d6272-b63a-4d8a-a2be-607835de0318@suse.com>
Date: Thu, 5 Sep 2024 17:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] x86/time: split CMOS read and probe logic into
 function
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240904153151.83995-1-roger.pau@citrix.com>
 <20240904153151.83995-4-roger.pau@citrix.com>
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
In-Reply-To: <20240904153151.83995-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 17:31, Roger Pau Monne wrote:
> The current logic to probe for the CMOS RTC is open-coded in get_cmos_time(),
> move it to a separate function that both serves the purpose of testing for the
> CMOS RTC existence and returning its value.
> 
> The goal is to be able to split the probing and the reading logic into separate
> helpers, and putting the current logic in a separate function helps simplifying
> further changes.
> 
> A transient *rtc_p variable is introduced as a parameter to the function, that
> will be removed by further changes.  Also note that due to the code movement,
> now cmos_rtc_probe will only get cleared on a second call to get_cmos_time(),
> as the newly introduced cmos_probe() function doesn't modify the variable
> anymore.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



