Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12889850A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 12:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700798.1094487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsKOq-00074C-1u; Thu, 04 Apr 2024 10:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700798.1094487; Thu, 04 Apr 2024 10:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsKOp-00071o-VJ; Thu, 04 Apr 2024 10:32:51 +0000
Received: by outflank-mailman (input) for mailman id 700798;
 Thu, 04 Apr 2024 10:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsKOp-00071i-Bv
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 10:32:51 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af99426e-f26e-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 12:32:50 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso1071093a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 03:32:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j11-20020aa7ca4b000000b0056de3d69d96sm3355220edt.28.2024.04.04.03.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 03:32:49 -0700 (PDT)
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
X-Inumbo-ID: af99426e-f26e-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712226770; x=1712831570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EdGWaiJCVcR7vs8ts3uyzYVQX4DbSLb9BDdKBDFsF40=;
        b=d8SIgiXfqAMb4rXPwx3q4r+JeMlXmrcud+kirQOUj8/rw6ZQ/LkIqonoYGgL7pVc5d
         WgweQUg5DGR5Dr80HwsklC+mcMnLb5afbVync90GXZ81GD/XbrYixmFJ4yl/Kqbp2StM
         FJkzTeNYsN6UsJhQGBiTjR/HGW86ATIvzx1o6OrY+Y4L0CiN7P+qJf9YuuAwlu+zVMZM
         j8r5NdDcrUAadEriUuaCvOzpdYICOC5VChGXHh7DnQzeR9AvO5InTIiEKMbmL8Bqkp4n
         0EhkNcTTL63LxbYXBjVQeipi3CHKo2wouZncAPpJM9jicP0BFoeik2hnqmxR+74iYKvu
         8Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226770; x=1712831570;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdGWaiJCVcR7vs8ts3uyzYVQX4DbSLb9BDdKBDFsF40=;
        b=QKH/5Xx+ZU5NyVR5aobnkIFo9P4onszw8Q92aF/9SZk52X1PwgrpTfS+RTRX0mXYTw
         ixlDKyWsEhzvXaNeYKIlmM9NP3K4wGWbyd1VmBPWf3FLANB8BgKAAbhsr/OeTwGFV1aN
         YfT3zc+R0D3x57tqwnww76xcmjr5mjAfDl4hNK0/SdygWMngC+pKczYsgZ47kwSH06Re
         ApVJFq5f8OAtYHl6AKSW60E0BQ12svfGk3No+EQkAHD1R2hqw4Rki8QLAC4fbNUAFl1s
         gcgECCpht1a+1NeWP8C7/QpVRv9cvujh/XbVm911IpLTde4o6qWqraXQy0uvZFwt6CBF
         cjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmrOTiqUqZk6yffRt2sB7ZwANwOE1up9nQnqZazwA8q9IVY3ee2Rh5E32bqoRTAXaGWtuqEaFIUe6ZSI/sVq5/75F2h+JobB+E4NeHYPE=
X-Gm-Message-State: AOJu0YwRwrL/Q1nRoFC3NsW9RNxUt0bsJSPL+MoxauXq9HFLFeSx3LlT
	5R3iLXxvnmjeUk+ga3m8E3h0/zWDwTeX3iMUoxNtibtsLcD/HjURuAKybfh7Vw==
X-Google-Smtp-Source: AGHT+IHZ3vz1mxdDQa7yiAugYwWlaLnxTrc9z9kn949zE6uxxDYPsrjGTeq8Evx1A0Lt9D4ZD1fYTA==
X-Received: by 2002:a50:c350:0:b0:568:bfcd:e895 with SMTP id q16-20020a50c350000000b00568bfcde895mr1345133edb.41.1712226769725;
        Thu, 04 Apr 2024 03:32:49 -0700 (PDT)
Message-ID: <e7524dcd-8364-4d1a-b65c-95479d96eb18@suse.com>
Date: Thu, 4 Apr 2024 12:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: adjust initial setting of watchdog kind
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe289ca1-aa3a-49af-b7d7-70949237464b@suse.com>
 <1c3d790d-bdac-495a-868b-36e12d45c457@citrix.com>
 <e3f69f47-88a8-4eb5-a019-ec4de0c9deb3@suse.com>
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
In-Reply-To: <e3f69f47-88a8-4eb5-a019-ec4de0c9deb3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 09:59, Jan Beulich wrote:
> On 19.03.2024 21:35, Andrew Cooper wrote:
>> On 25/01/2024 2:12 pm, Jan Beulich wrote:
>>> "watchdog_timeout=0" is documented to disable the watchdog. Make sure
>>> this also is true when there's a subsequent "watchdog" command line
>>> option (and no further "watchdog_timeout=" one).
>>
>> We also document that latest takes precedence, at which point "watchdog"
>> would re-activate.
> 
> True,

Actually - no. Latest takes precedence doesn't matter here. "watchdog"
following "watchdog_timeout=0" is simply asking to enable the watchdog
with a timeout of 0, meaning infinity in practice. Which still is as
good as "watchdog=off".

> so perhaps ...
> 
>>> While there also switch watchdog_setup() to returning void, bringing it
>>> in line with the !CONFIG_WATCHDOG case. Further amend command line
>>> documentation to also mention the implicit effect of specifying a non-
>>> zero timeout.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Alternatively "watchdog" following "watchdog_timeout=0" could be taken
>>> to mean to use the default timeout again.
> 
> ... this alternative wants following.
> 
>> I realise that watchdog_timeout is my fault, but in fairness it was an
>> early change of mine in Xen and didn't exactly get the kind of review it
>> would get these days.  It also wasn't used by XenServer in the end - we
>> just stayed at a default 5s.
>>
>> I'm very tempted to suggest deleting watchdog_timeout, and extending
>> watchdog= to have `force | <bool> | <int>s` so you could specify e.g.
>> `watchdog=10s`.

This being a set of alternatives also isn't quite right. "force" needs to
be possible to combine with a timeout value. Yet if we make it "List of",
which I was ...

>> The watchdog is off by default so I don't expect this will impact
>> people.  It is also more convenient for the end user, and means that we
>> don't have have the current split approach of two separate options
>> fighting for control over each other.
> 
> While I'd be happy to fold the two options, I don't think the watchdog
> being off by default is relevant here. People using just the
> watchdog_timeout= option with a non-zero value will already have the
> watchdog enabled. They'd need to pay attention to an eventual CHANGELOG
> entry and change their command line.
> 
> Furthermore consolidating the two options isn't going to remove any
> of the problems. What effect would e.g. "watchdog=off,10s" have? The
> principle of "latest takes precedence" assigns clear meaning to
> "watchdog=off watchdog=10s", but the above remains as ambiguous as
> e.g. "watchdog=force,0s". I'd be inclined to follow those to the
> letter, i.e. "watchdog=off,10s" sets the timeout to 10 but disables
> the watchdog while "watchdog=force,0s" simply results in a non-
> functioning watchdog (due to 0s effectively meaning 4 billion seconds
> and hence for all practical purposes "never").

... assuming anyway (despite you having it written differently), we'll
have said problems again. So perhaps

<bool> | List of [ force | <int>s ]

with a timeout of 0 disabling the watchdog and a non-zero one enabling it?

Jan

