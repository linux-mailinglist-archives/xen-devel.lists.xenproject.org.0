Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0BD39FD0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 08:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1207977.1520216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhji6-0002BB-6t; Mon, 19 Jan 2026 07:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1207977.1520216; Mon, 19 Jan 2026 07:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhji6-00027s-3A; Mon, 19 Jan 2026 07:30:02 +0000
Received: by outflank-mailman (input) for mailman id 1207977;
 Mon, 19 Jan 2026 07:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5NKf=7Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vhji4-00027m-SD
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 07:30:00 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a856e7e4-f508-11f0-9ccf-f158ae23cfc8;
 Mon, 19 Jan 2026 08:29:58 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so25271065e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 Jan 2026 23:29:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e9ac373sm79472765e9.1.2026.01.18.23.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jan 2026 23:29:57 -0800 (PST)
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
X-Inumbo-ID: a856e7e4-f508-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768807797; x=1769412597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFYKlFrylLExJQVZ6G2P+N9Oy2TYCgyjtxuyeF5sSNY=;
        b=Pwfel6DWWjTQ2cSdsGNby/g2qJyQlFmgRl1OyVTc/Oc/aV5JVREI1wEKqcFcckKIc8
         Z+7HvxfZQGVyJqLvm+6wO6YrGn4vE0rNunnFZa3v8duat+H5KyPDQv67FRno2CZBlbq9
         FLfm813HZMv/vIizWGfGJx/+j0dRXzHHjVgZHMQBks4WsTHhXt265EBaRu9enapOfCph
         nocAZYGrBgc4Slp+eMz72pytD9RK4UKfwnZRSygCNxstg8hN/xd3+EqHO2Szt/F78rnC
         ZxomGBJ00YtfOegb7rOK7Yip9EeZ6OmmlCRVfAITB4pv/OgHnhUAPHYs892aIi51dYww
         RRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807797; x=1769412597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFYKlFrylLExJQVZ6G2P+N9Oy2TYCgyjtxuyeF5sSNY=;
        b=YfX4M8BvLSn8ywA6Jqzg228A2RCY7ejvv9ZBgdz+yRtTXBN1Gg2kFHkCyFi+wSEpOa
         cU2BmDKlWRXkJMxuK71Tp5sSXA4uNsOTtvSu7tVoK7j5U5xF0ra2x/6QJk10eRnfqWvg
         Dr+TcHlw+TvWEah16Kz8VKUCCDsqok2sP+IKrkYh9DFR3dAa1JlAGWo61uocjazHqnsa
         byrumMI732EIWc2jk0szenaafQpKm75phw5fqvIbRa7gbhBLqyucwbjhprwaUAyfkUGz
         L32nTyiY1a/XTZo6eCqG9II2O+BUipdRTemkjlusAW6MvgkEPxbb2v/TxM+IHQtECTZf
         iR7A==
X-Forwarded-Encrypted: i=1; AJvYcCUEKwvY7xsn6+3BFCmAd/KefbKh3Rrnn0C9IJ3AlwBVT/P+B8f1jp/xXxCgMD8KLVFwDOxNKj183OQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy0yEpJDzcFCCRyvMWsgxmmeWdBniUXvI/f7kQT80s8b1oGfhd
	b69uKT3Lm+dqIzbDalyBv8XD81LSFa0hyM9fRrxKbwJHb/oXfg6uQhlNYRM4ivnKjw==
X-Gm-Gg: AY/fxX49mrZqlpYIdIWXAPi+Er/Nq7otPlOO25rg0Ny3XiotKScwTXZRfExaX3nwy+x
	0DleLFTTnHE0FPpT0LNduZ/ruM+QPfStwAiunJHi0H9suoSlhnfAUOn0hNWeVfp1FmuZ4dYSjYo
	a16EaXAd1q0Jp7D5IGBvc4lLLooNQHrMgHoOHCwEAi4ZJmAj88OR/bTwJtfRVjf9qhScgLngAa+
	XByx+B7WBYxnx/koTEe238uxJjdpmbBpAa1ZoTn20vycCsONKOwrWbxoghcA4e/M1IBLDu2+a0K
	ObBZt4eyrmuiyq8okKYvv+8ogUB4qcP5cEmrHNCxiTO1tvmza4tSb6Ylwx+Q2209D119IkQANZr
	eANzPsufuLl4oGtiVRTcjO9qCYoAahi2VYwmUsNMcVzmeiqI/57p3m1Q4BdNtHniwcG65AXqh3J
	h4nJSUJG5VsYLNSAfHjJ1gbygHQb24/v7Rj5kIrfAXY2e2QblWf4GX9X0EhiVNl3c52V/OVgY8A
	vM=
X-Received: by 2002:a05:600c:4ed3:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-4801e3397d6mr120127135e9.19.1768807797510;
        Sun, 18 Jan 2026 23:29:57 -0800 (PST)
Message-ID: <6f275030-a3c2-4710-952e-56c3226b5a8b@suse.com>
Date: Mon, 19 Jan 2026 08:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmukhin@xen.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260116030842.415583-2-dmukhin@ford.com>
 <09c0007b-3cac-469a-83a0-726c1be149da@suse.com>
 <alpine.DEB.2.22.394.2601161239510.72558@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601161239510.72558@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 21:47, Stefano Stabellini wrote:
> On Fri, 16 Jan 2026, Jan Beulich wrote:
>> On 16.01.2026 04:08, dmukhin@xen.org wrote:
>>> --- a/INSTALL
>>> +++ b/INSTALL
>>> @@ -33,11 +33,11 @@ small subset of the options.  Attempts to change other options will be
>>>  silently overridden.  The only way to find which configuration options
>>>  are available is to run `make menuconfig' or the like.
>>
>> I fear this earlier paragraph needs editing as well, which will then
>> make more clear that ...
>>
>>> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
>>> -in your environment.  However, doing this is not supported and the
>>> -resulting configurations do not receive security support.  If you set
>>> -this variable there is nothing stopping you setting dangerously
>>> -experimental combinations of features - not even any warnings.
>>> +This behavior can be overridden by enabling "Configure EXPERT features"
>>> +in Kconfig (CONFIG_EXPERT).
>>
>> ... this may not be quite adequate.
>>
> 
> I am not sure how you would like to change the earlier paragraph or this
> paragraph. I gave it a try and removed both paragraphs, replacing it
> with this:
> 
> """
> Only a subset of options is supported or security-supported by Xen
> Project. You can explore all available options, including unsupported
> ones and those recommended only for expert users, by using `make
> menuconfig` and enabling `CONFIG_UNSUPPORTED` and/or `CONFIG_EXPERT`.
> However, enabling these options is not supported, and configurations
> resulting from them do not receive security support.
> """
> 
> What do you think?

This would be fine with me.

Jan

