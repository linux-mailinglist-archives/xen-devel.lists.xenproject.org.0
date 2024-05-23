Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF648CD5E1
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:34:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728576.1133547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9Wm-0000WV-LU; Thu, 23 May 2024 14:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728576.1133547; Thu, 23 May 2024 14:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9Wm-0000Th-IS; Thu, 23 May 2024 14:34:44 +0000
Received: by outflank-mailman (input) for mailman id 728576;
 Thu, 23 May 2024 14:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA9Wl-0000TZ-6S
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:34:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 977c0c58-1911-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:34:41 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a5a5cce2ce6so1032633666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:34:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b179casm1936481766b.203.2024.05.23.07.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:34:41 -0700 (PDT)
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
X-Inumbo-ID: 977c0c58-1911-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716474881; x=1717079681; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNwXYm0mm5d+jelZ0oLji3E88NIrdy2izCUlWbmVy+0=;
        b=AI2i7tg8bilrhne5BnKKNBgxCmVcc+ACl96CX9KR3jakASIn5fjS6+a+jVPsp4vunh
         /Q/+0T2s+rEZPJ36IU18zvhpXHLWsa6TJZEc9s32hyNVVuy/CMriWdhYkt9MLr7rzR0U
         lkzVH7Czho9dxpDR5/7Lb79PQFo/LDwZFoTyE3Ft+sy5WZQP3OAOecz7f8jFwknPM5Tv
         SbMp3JR80Tv1kFSN3lg72g3SaD56L5vmL95d+GljzMjtLWj1fD9msXR7ZM1rpNc3cCXU
         E2SeNO6nlt0DtPwLh851twGCr+oVRhuNUxDc5rt0QQlAJ0nr1EQ6oIxxpGmfApHANRPo
         ko9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474881; x=1717079681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNwXYm0mm5d+jelZ0oLji3E88NIrdy2izCUlWbmVy+0=;
        b=mz1U/XfmtGhhEAmq6Qjz9xJ4kEz3tgUM0sbZ2ZnKMZgMZEWwvQBgVZMfV/FuB38oaO
         M0DE+gv6qluoHVRpz1vYGNLSyk0nzeuloFXUWnWpVs5apygbGZ907D+RJEAzEW28kIrm
         9Z8nFCVMl+/jLwXJFZc4N/t3j3Iw563T2tZguUAm+cWD2WqGr1lF5Ig91PZgDBGLd4aH
         Sc1F1VNT4l3s+gl9rMCgghacbaYzhxtF81T9dkcQvZPSmM54XwJEEoFUvfQ80az5NXZs
         FUi6z6Ei6aVAHSWqFQqXCZWXrGdbrKMsTRQGgeCcsekPfvgk7OdkHbhBcrV/5s6jnFz1
         AFpQ==
X-Gm-Message-State: AOJu0Yw/dwPQ0+iVu80FZ3K1DNhyWAP7Gk/VDtg+Nrt2RbrJz6rBIshk
	UU7kdLrPR+symXi0ZTe7SbGqEigZYQVo6A9RTGbfk/JVIEl1SUlSLg3EPk6WsQ==
X-Google-Smtp-Source: AGHT+IGQg9juDUZsDQ/8k7BlyDhY+HqBJ/499kP5CMEUnrtk1MpboZRyXi1s/kFOHLPrR3TeN4hLoQ==
X-Received: by 2002:a17:906:3404:b0:a59:c28a:7ec2 with SMTP id a640c23a62f3a-a62280970ebmr313682966b.41.1716474881628;
        Thu, 23 May 2024 07:34:41 -0700 (PDT)
Message-ID: <189c73d8-9a5b-4983-affe-0c39878f9304@suse.com>
Date: Thu, 23 May 2024 16:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable-smoke test] 186107: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-186107-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <osstest-186107-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 15:45, osstest service owner wrote:
> flight 186107 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/186107/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-armhf                   6 xen-build                fail REGR. vs. 186064

Found ninja-1.11.1 at /usr/bin/ninja

ERROR: Clock skew detected. File /usr/bin/bash has a time stamp 1682259478.4465s in the future.

A full log can be found at /home/osstest/build.186107.build-armhf/xen/tools/qemu-xen-build/meson-logs/meson-log.txt

ERROR: meson setup failed

make: Entering directory '/home/osstest/build.186107.build-armhf/xen/tools/qemu-xen-build'
config-host.mak is out-of-date, running configure
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
bash: line 4: ./config.status: No such file or directory
make: *** No rule to make target 'config-host.mak', needed by 'Makefile.prereqs'.  Stop.
make: *** Waiting for unfinished jobs....
make: Leaving directory '/home/osstest/build.186107.build-armhf/xen/tools/qemu-xen-build'
make[2]: *** [Makefile:212: subdir-all-qemu-xen-dir] Error 2
make[2]: Leaving directory '/home/osstest/build.186107.build-armhf/xen/tools'
make[1]: *** [/home/osstest/build.186107.build-armhf/xen/tools/../tools/Rules.mk:199: subdirs-all] Error 2
make[1]: Leaving directory '/home/osstest/build.186107.build-armhf/xen/tools'
make: *** [Makefile:63: build-tools] Error 2

Suggest to me that there's some issue with the build host.

Jan


