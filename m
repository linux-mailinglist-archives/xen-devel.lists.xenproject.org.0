Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9078B1B3B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711837.1112104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzssn-00069G-2I; Thu, 25 Apr 2024 06:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711837.1112104; Thu, 25 Apr 2024 06:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzssm-00067v-Vi; Thu, 25 Apr 2024 06:47:00 +0000
Received: by outflank-mailman (input) for mailman id 711837;
 Thu, 25 Apr 2024 06:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzssl-00067p-8F
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:46:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bfc1369-02cf-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 08:46:57 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4155819f710so5033665e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 23:46:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e15-20020a05600c218f00b004146e58cc35sm29369947wme.46.2024.04.24.23.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:46:56 -0700 (PDT)
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
X-Inumbo-ID: 9bfc1369-02cf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714027616; x=1714632416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9D84aDNlhTGKA5DXraeGkolmOLNtdq9D11n1O6zOYTU=;
        b=Ltg12ItFUJRHGMlXdfJgOtVwutAEWF950bb6M3+x42ZcM0RAdGAt+SD7MvxLXqpOfa
         IQ+tM8hqINZmqEDsQLHBaAgKbN6KhUbnzjDSD2mOcHLHVVrCdbgTtT2743bG95sUiia5
         y77P2Itrp5qTXuTGTRvoRmBAWjV7ETptRD3ZkV5/kdm/GjVmuMlgh6YDUdn69/9PHmQn
         b1IJk3326x0TQS2IoCO0WxtHE3L9MftrGZsMFWtoLkpI4PCNijhcYTOUReS0Td6LinhU
         d0lFraJErwdlFcslSbAK9ymL1aDkXOJ06sLZXMz6q4L7N5GQUfE7NKROf+BC4lhCaZOf
         ti0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714027616; x=1714632416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9D84aDNlhTGKA5DXraeGkolmOLNtdq9D11n1O6zOYTU=;
        b=omvxobNzqvDQrzGO6dETAfxn4v3uVwddFdumICbXy0BMFkprac1StCc3FajHMSeTi2
         6PS0cx1/qfu+Mz5sFccjGi7RmEQ2PQHo5ijO2JAriFJgKXbU1LW6pBw3RmZREQ6n8fLD
         F0MZSDvihx0yJDvtsSgfq4/A2OXGciKFDJI5/B/Av+o2rJ6KeqfmYjZlmcqJh1YQv/Rn
         imYWq0XW5yDqCiV+S5Md3i1wP8VTRMtkKgt70B6RHJ7RW6+nA7f0wcXRnsah5ddRFPvu
         2vSH4t+/8le4z1EIkkHvi4QPPv1XLl/eDP4k9VWQEk+WUmx53Tn89cwyGKXlgC8IO0gn
         ECfA==
X-Forwarded-Encrypted: i=1; AJvYcCVQYk+PC41WZRpsE82kB38YfiY/oHLBkpUOu5M0FFGQMNc9434JdDVUqBzZaHy9eMRcJ69CQTXF3+FYMrOnkAA6Fwmq8qTSeekPTSNMimE=
X-Gm-Message-State: AOJu0YwBEsJ/L9N1Hm1Lb0/nw4OZgpMkFNoXbKEfaHgxz2SHmw+OilQG
	b9Sv9BYnCf5WLTL/ch1+DiOlOQTbkr5/he1j2jKQDqtIlilOO0ps2mHB8xYPNw==
X-Google-Smtp-Source: AGHT+IG3Od4uxsHZvE3hu8GjZJAaGwWIfvGcNCXHlOzJ+Ip3743siJuWHyw+zlEEp7No/mgU24vwnA==
X-Received: by 2002:a05:600c:354f:b0:419:87ab:f6db with SMTP id i15-20020a05600c354f00b0041987abf6dbmr3671181wmq.23.1714027616607;
        Wed, 24 Apr 2024 23:46:56 -0700 (PDT)
Message-ID: <adc3564e-3049-4239-9994-b6d59ac3d9fb@suse.com>
Date: Thu, 25 Apr 2024 08:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] add a domU script to fetch overlays and applying
 them to linux
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-15-xin.wang2@amd.com>
 <bc2aab70-08c5-4dfe-91ab-c1c24163cd46@suse.com>
 <8071fb8c-4df8-4905-b203-cc1119038675@amd.com>
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
In-Reply-To: <8071fb8c-4df8-4905-b203-cc1119038675@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2024 02:54, Henry Wang wrote:
> On 4/24/2024 2:16 PM, Jan Beulich wrote:
>> On 24.04.2024 05:34, Henry Wang wrote:
>>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>
>>> Introduce a shell script that runs in the background and calls
>>> get_overlay to retrive overlays and add them (or remove them) to Linux
>>> device tree (running as a domU).
>>>
>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>> ---
>>>   tools/helpers/Makefile       |  2 +-
>>>   tools/helpers/get_overlay.sh | 81 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 82 insertions(+), 1 deletion(-)
>>>   create mode 100755 tools/helpers/get_overlay.sh
>> Besides the same naming issue as in the earlier patch, the script also
>> looks very Linux-ish. Yet ...
> 
> I will fix the naming issue in v2. Would you mind elaborating a bit more 
> about the "Linux-ish" concern? I guess this is because the original use 
> case is on Linux, should I do anything about this?

Well, the script won't work on other than Linux, will it? Therefore ...

>>> --- a/tools/helpers/Makefile
>>> +++ b/tools/helpers/Makefile
>>> @@ -58,7 +58,6 @@ init-dom0less: $(INIT_DOM0LESS_OBJS)
>>>   get_overlay: $(SHARE_OVERLAY_OBJS)
>>>   	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxengnttab) $(APPEND_LDFLAGS)
>>>   
>>> -
>>>   .PHONY: install
>>>   install: all
>>>   	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>>> @@ -67,6 +66,7 @@ install: all
>>>   .PHONY: uninstall
>>>   uninstall:
>>>   	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
>>> +	$(RM) $(DESTDIR)$(LIBEXEC_BIN)/get_overlay.sh
>>>   
>>>   .PHONY: clean
>>>   clean:
>> ... you touching only the uninstall target, it's not even clear to me
>> how (and under what conditions) the script is going to make it into
>> $(DESTDIR)$(LIBEXEC_BIN)/. Did you mean to add to $(TARGETS), perhaps,
>> alongside the earlier added get-overlay binary?

... it first of needs to become clear under what conditions it is actually
going to be installed.

> You are right, I think the get-overlay binary and this script should be 
> installed if DTB overlay is supported. Checking the code, I found 
> LIBXL_HAVE_DT_OVERLAY which can indicate if we have this feature 
> supported in libxl. Do you think it is a good idea to use it to install 
> these two files in Makefile? Thanks.

Counter question: If it's not going to be installed, how are people going
to make use of it? If the script is intended for manual use only, I think
that would want saying in the description. Yet then I couldn't see why
the uninstall goal would need modifying.

As to LIBXL_HAVE_DT_OVERLAY - that's not accessible from a Makefile, I
guess?

Jan

