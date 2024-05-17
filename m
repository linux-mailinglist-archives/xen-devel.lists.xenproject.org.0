Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D069B8C8129
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 09:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723837.1128948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7reK-0006DR-Jo; Fri, 17 May 2024 07:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723837.1128948; Fri, 17 May 2024 07:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7reK-0006BT-GV; Fri, 17 May 2024 07:05:04 +0000
Received: by outflank-mailman (input) for mailman id 723837;
 Fri, 17 May 2024 07:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bw27=MU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7reJ-0006AW-1U
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 07:05:03 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c784a105-141b-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 09:05:01 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-573061776e8so4400249a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 00:05:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c322c85sm11653972a12.84.2024.05.17.00.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 00:05:00 -0700 (PDT)
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
X-Inumbo-ID: c784a105-141b-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715929501; x=1716534301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PHNZgILOy1MQlCOuS7WwvW8i7CptPWYzUVwIn8u8o8=;
        b=J4GV4UEvQc3163k/oEFnow47zgqV7fBcH/zKl4jmx952h3VMSO/lj/XHVWVne5yTpq
         Z8ddArtmtd774LmQUtQF97uIGFKhIYrlgd+lAlyH4Kxq2/Yagt7aes4phDMMDNJstLp1
         /2fuFDDGvZT8usYXzY4B5Y7DpPmBbWPkmysaF3HMe2NyoaIwIcSq4W62oWUuCHAFGucI
         /VyJQCnfBiG1pw9YX+EKaA20KCjQQMJxQsA4hmlmbIuZN1N4NKLqkwmW5NrSnG7Mh6w9
         votfXGPDVQ/Oj3kMUOI002nrK/fxOKnXhAM2GjaX2GOiVCLb2sS1QU5bSWujnWlSagdM
         aGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715929501; x=1716534301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PHNZgILOy1MQlCOuS7WwvW8i7CptPWYzUVwIn8u8o8=;
        b=rBvlhA5zU6ZucZ8Ew5OTxA8VFEz36Bxnrcgs0AOEYcxjxYeiniIbXG3ecvGw1DwkT+
         6FKyK0+U/rAZ0V5YarUv8Tpc0GI3pNCAsi8dpt7WbSoPPotOnnu/2dfCAV030rJPF2g8
         rz5/iP1lNhE7a73GQ24OqhdXiamXhb41UITHcpexhPCQtSCG8VsHlKA1AFXCRQ/HGOJq
         +9pFov1KpfBZFwjDRvwIzcgGkXtOBULNkOjZCqg6xzxobn6CEp1ZRs2Engr9zq7GOo5b
         Lhy+3hk+a6GuhpBwCdGH2GC9NOVHgVawh8JSOhdSNlSa07zmCcgHUS1jJpuIQHvwqu3N
         bi4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSnumxsCmHaSWgcJRsc2bzPsVb/vX2V9qcMPejG9XZc7aQbdkvvYlHlnRF50/ZestpNo17aKz/rObKgzWHpmA3jxdzr84IpLU8F58WsV8=
X-Gm-Message-State: AOJu0YzJD8Do8LM2VymOUYydhRfxDaURKI92puWdHfYKaS2/eflis4G2
	17Tc3/I7HJ3EWbe++rw1oRDDaVj/OWtCX0L5xpaIobLBch4XrllNfticx5P38w==
X-Google-Smtp-Source: AGHT+IF1VxgxyluUeMT7KnNXDwt9w+MqU/EYunaTGPdvIyK9Ic+rQmge7/v10YRTY5lnXt7dX5Lr7g==
X-Received: by 2002:a05:6402:3199:b0:574:d098:37ae with SMTP id 4fb4d7f45d1cf-574d0983832mr7287069a12.4.1715929501168;
        Fri, 17 May 2024 00:05:01 -0700 (PDT)
Message-ID: <e75ca24e-12fe-44ac-9c67-bcc222ac8752@suse.com>
Date: Fri, 17 May 2024 09:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
 <alpine.DEB.2.22.394.2405161806560.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405161806560.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 03:21, Stefano Stabellini wrote:
> On Thu, 16 May 2024, Jan Beulich wrote:
>> 1) In the discussion George claimed that exposing status information in
>> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
>> how a similar assumption by CPU designers has led to a flood of
>> vulnerabilities over the last 6+ years. Information exposure imo is never
>> okay, unless it can be _proven_ that absolutely nothing "useful" can be
>> inferred from it. (I'm having difficulty seeing how such a proof might
>> look like.)
> 
> Many would agree that it is better not to expose status information in
> an uncontrolled manner. Anyway, let's focus on the actionable.
> 
> 
>> 2) Me pointing out that the XSM hook might similarly get in the way of
>> debugging, Andrew suggested that this is not an issue because any sensible
>> XSM policy used in such an environment would grant sufficient privilege to
>> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
>> for Xen-internal event channels. The debugging argument then becomes weak,
>> as in that case the XSM hook is possibly going to get in the way.
>>
>> 3) In the discussion Andrew further gave the impression that evtchn_send()
>> had no XSM check. Yet it has; the difference to evtchn_status() is that
>> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
>> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
>> similarly useful to allow getting a stuck channel unstuck.)
>>
>> In summary I continue to think that an outright revert was inappropriate.
>> DomU-s should continue to be denied status information on Xen-internal
>> event channels, unconditionally and independent of whether dummy, silo, or
>> Flask is in use.
> 
> I think DomU-s should continue to be denied status information on
> Xen-internal event channels *based on the default dummy, silo, or Flask
> policy*. It is not up to us to decide the security policy, only to
> enforce it and provide sensible defaults.
> 
> In any case, the XSM_TARGET check in evtchn_status seems to do what we
> want?

No. XSM_TARGET permits the "owning" (not really, but it's its table) domain
access. See xsm_default_action() in xsm/dummy.h.

Jan

> evtchn_send uses XSM_HOOK, which is weaker, but it doesn't seem to be an
> issue because (ignoring the consumer_is_xen check) there is a if(!lchn)
> check that would fail on invalid event channels?


