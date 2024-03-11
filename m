Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DFF877E07
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691371.1077295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcm3-0006HL-BD; Mon, 11 Mar 2024 10:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691371.1077295; Mon, 11 Mar 2024 10:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcm3-0006F0-7g; Mon, 11 Mar 2024 10:20:51 +0000
Received: by outflank-mailman (input) for mailman id 691371;
 Mon, 11 Mar 2024 10:20:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjcm1-0006Eu-K2
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:20:49 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078d35ad-df91-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 11:20:48 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d27fef509eso67471661fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:20:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h25-20020a1709070b1900b00a3e5adf11c7sm2696964ejl.157.2024.03.11.03.20.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 03:20:47 -0700 (PDT)
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
X-Inumbo-ID: 078d35ad-df91-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710152448; x=1710757248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4nOoUMQ1fb+vrW2YXvGVfqAbVjEUbKgIjCyWyBUNyY8=;
        b=gAMWdX9Ux/PjsbcQvNm4Nab9uL3wYB4MtEaGDqQhfyhwlFruWm+gNKeLxrsn4/NlkU
         /8ZouqbYGvZzJDt6KrPLxnajOAJizfkcFG/dInn/c/yNb6qBpNn7k+9pn4f9qe8ByuJU
         ifdFtzTl2yuGLfEnKgzbWtSQjAyfsyJgwYnwNKpolL6Rp4NrAdb7W8HA2PGLb1mV3ZT/
         6NCpFiITA+RmBynryNX2T0n6LBM1vRmkIMo8JeyfW5XHTku+NwQu6EQkhLqIyP6fPUJ1
         T8JRf+4pEiU5/bAJUbevBTOQzmEKUNBspV0H/sGnJfjwWZEx6yO4fN4YfpTqaonI3wgc
         q9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710152448; x=1710757248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nOoUMQ1fb+vrW2YXvGVfqAbVjEUbKgIjCyWyBUNyY8=;
        b=n62/M/4bfpw8G4vOekm6SrB4/JWnQqGYs0HxkxyIkTvBShI35MDobZMGQcD3EjU/+Y
         s0anRcjqaZJ0mCvM041wDEr0Wo1lHhj5OquhCfa2QIlGn1CI11YAXReVnUpwqtwS/2Gb
         6MsaFSxp0JGwP9Hy84J/5floZuSk1C+dRj8fP/mMj2HwIOiUsvDCLxp8cn40Y9ytZ6MI
         ggttBfN0e6hpqCxPxLPdrgQprXEXuuO/D85eaW0L5YRTFZEgSwsywX3Q/WtWgwqJpAJs
         9LnFEaqcXKL3DRltv14WPuL/cEnZDuPtd4BxspLWCHmi6TF/GnuNupB+qiLZi7vbLBfj
         8VIA==
X-Gm-Message-State: AOJu0YyLO008OKxjTyZ36P72QlJNYixE+cIoSddiNtWd0hB43qerpqc4
	ulzuQl3qQEIqUoEAbGXFA44mKnNqE2IHRVvSbDZ7IPLOa/KQuvr/NRoJIewYcEjBJI1OeCm8dAg
	=
X-Google-Smtp-Source: AGHT+IEhoohpxrSbQV38QSj45UViPX4ANs46DLLT2142VsjWD/BIpkENWNVNKtf7b/FEaAwxRrjHWg==
X-Received: by 2002:a2e:97d1:0:b0:2d2:b337:f55d with SMTP id m17-20020a2e97d1000000b002d2b337f55dmr3746733ljj.16.1710152447967;
        Mon, 11 Mar 2024 03:20:47 -0700 (PDT)
Message-ID: <167864dd-32b7-4ce2-b844-c033815308cf@suse.com>
Date: Mon, 11 Mar 2024 11:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 1396892d
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65eed87594573_2c8a3cc158049@gitlab-sidekiq-catchall-v2-df9f7d5b4-wgfn8.mail>
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
In-Reply-To: <65eed87594573_2c8a3cc158049@gitlab-sidekiq-catchall-v2-df9f7d5b4-wgfn8.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 11:09, GitLab wrote:
> 
> 
> Pipeline #1208444169 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 1396892d ( https://gitlab.com/xen-project/hardware/xen/-/commit/1396892d801cf148644cd5590be2f143648f9083 )
> Commit Message: xen/ppc: switch PPC to use asm-generic/device.h...
> Commit Author: Oleksii Kurochko ( https://gitlab.com/olkur )
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1208444169 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1208444169 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 2 failed jobs.
> 
> Job #6362114743 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362114743/raw )
> 
> Stage: build
> Name: alpine-3.18-gcc-debug

Perhaps a networking glitch:

make[2]: Leaving directory '/builds/xen-project/hardware/xen/extras/mini-os-remote'
touch mk-headers-x86_64
wget: can't connect to remote host (104.239.192.120): Connection refused
wget: can't connect to remote host (104.239.192.120): Connection refused
make[1]: *** [Makefile:90: newlib-1.16.0.tar.gz] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:119: zlib-1.2.3.tar.gz] Error 1
wget: can't connect to remote host (104.239.192.120): Connection refused
make[1]: *** [Makefile:139: pciutils-2.2.9.tar.bz2] Error 1
make[1]: Leaving directory '/builds/xen-project/hardware/xen/stubdom'
make: *** [Makefile:151: install-stubdom] Error 2


> Job #6362114850 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362114850/raw )
> 
> Stage: build
> Name: debian-bookworm-gcc

Possibly here too:

fatal: remote error: git-cache-proxy: git remote died with error exit code 1 // Fetching origin // fatal: unable to access 'https://xenbits.xen.org/git-http/mini-os.git/': Failed to connect to xenbits.xen.org port 443: Connection refused // error: Could not fetch origin
make: *** [Makefile:23: mini-os-dir] Error 128
make: *** Waiting for unfinished jobs....

However, I'm puzzled by quite a few ocaml issues along the lines of

File "config.ml", line 102, characters 16-31:
102 |       | Failure "int_of_string"   -> append (k, "expect int arg")
                      ^^^^^^^^^^^^^^^
Warning 52 [fragile-literal-pattern]: Code should not depend on the actual values of
this constructor's arguments. They are only for information
and may change in future versions. (See manual section 11.5)

Apparently just warnings, but the "Failure" in there makes them not appear
so at the first glance.

Jan

