Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB28B1B2C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711832.1112095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzskd-0003j5-AC; Thu, 25 Apr 2024 06:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711832.1112095; Thu, 25 Apr 2024 06:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzskd-0003g1-6u; Thu, 25 Apr 2024 06:38:35 +0000
Received: by outflank-mailman (input) for mailman id 711832;
 Thu, 25 Apr 2024 06:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzskb-0003fv-UO
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:38:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e7a51a8-02ce-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 08:38:31 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b0bc4ce39so6575675e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 23:38:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b0041b434e5869sm1185525wmq.43.2024.04.24.23.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:38:30 -0700 (PDT)
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
X-Inumbo-ID: 6e7a51a8-02ce-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714027111; x=1714631911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IPnvjqat0snK2gZ3hKO9HI3gMS2nnsexL82beyC2ddI=;
        b=eCA6P7tx8EGgusLGNyV8TXGmIlEF+ye67KopKE1upVW5ucZb8mUpw+F2hJlCF4cA8r
         8SiWrxWO51h6lR9WiSjBsw7SKi0sQ7g1gO3neRLomcelB3PymTrQpE+l2w/lBm/xRz0e
         umxGQEhDQMWFHrpfTvjwE8jJtQRQImudNeCt2UjWT5WyoPYNqJjJm9qwKOf26Evgnqg2
         IjGsqQ0WKhXrFvawctNzIvuRkRfmZ3Kui/2PG/8qzxVV41EcyGoTZD3KhEo9rxEdMDV9
         LWQDReWUS4zJp1rkJwra/FfYxQY1ZSfRfZVj/y9NH8wk5qotvonmd/ZkGQQA64eX3zL9
         4sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714027111; x=1714631911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPnvjqat0snK2gZ3hKO9HI3gMS2nnsexL82beyC2ddI=;
        b=lPm6ZuFXwuyCmVqZdg9IjlDQLduUEr9j/Dz/08kQZbqYS93DJ/CHqWuDjQy2RZzbVc
         4XnVmccEFMCCHUOUnUUvf3jQ1cY0tszTtDb34ZpoT10z3rcTT7VyalpxatN+uBaM/D6X
         ltW9x//a3QZgQtSDeSMHwTUAUhnV5Ewu0CIrbNnnUJoCq/1R5tllTB3dUokC2yq2CgFf
         qdfCrLjAYku21p5pRFenCvHWOU1QTtesUOq2Sr29pJPRvEldf6J3ae7W6HlXKNuBLFXp
         A5/dW1ZalyqEI2QdOF/38w9HAYtbVxP2NebN/xgx3q3bYBwxPhhhMjIBmnVf5q86FuQg
         TInQ==
X-Gm-Message-State: AOJu0Yw7HXD7n9egBiyf3dfgdmta6xRo7JpLmq1PrzhM1uj08EOMk723
	9x//Otu3DHkCAKOXOQCJKsWHLOsxhXxr4d8YquuGlEl7ryYgWx3OzaQNzmaxy+vRYwg16NEZUbo
	=
X-Google-Smtp-Source: AGHT+IFDqUbPJ09FUy80aExdFdXb3YNbVxMLoWuAOr36VwFwIy2s+US+/OFIWnflRLzl4Y1syvLKBw==
X-Received: by 2002:a05:600c:4f8a:b0:419:f911:680a with SMTP id n10-20020a05600c4f8a00b00419f911680amr4610110wmq.1.1714027110796;
        Wed, 24 Apr 2024 23:38:30 -0700 (PDT)
Message-ID: <7caaa211-fcd0-4e15-9bb5-f0b967ea9209@suse.com>
Date: Thu, 25 Apr 2024 08:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-linus test] 185785: regressions - FAIL
Content-Language: en-US
To: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-185785-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
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
In-Reply-To: <osstest-185785-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2024 03:38, osstest service owner wrote:
> flight 185785 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/185785/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl-raw       8 xen-boot                 fail REGR. vs. 185768
>  test-armhf-armhf-libvirt-vhd  8 xen-boot                 fail REGR. vs. 185768

This looks to be recurring. From one of the logs:

Apr 24 21:09:04.301751 Configuring network interfaces...RTNETLINK answers: Operation not supported
Apr 24 21:09:05.033646 done.
Apr 24 21:09:05.033646 Cleaning up temporary files....
Apr 24 21:09:05.105744 Setting up X socket directories... /tmp/.X11-unix /tmp/.ICE-unix.
Apr 24 21:09:05.381747 Starting nftables: none
Apr 24 21:09:05.405781 �mnl.c:60: Unable to initialize Netlink socket: Protocol not supported
Apr 24 21:09:05.837763  failed!
Apr 24 21:09:05.837817 startpar: service(s) returned failure: nftables ... failed!

Hints at a possible network setup issue, which would explain the timeout
in trying to ping the host.

Jan

