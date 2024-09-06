Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254096E9B0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 08:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791558.1201455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smS9D-0005no-R5; Fri, 06 Sep 2024 06:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791558.1201455; Fri, 06 Sep 2024 06:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smS9D-0005kd-OB; Fri, 06 Sep 2024 06:08:43 +0000
Received: by outflank-mailman (input) for mailman id 791558;
 Fri, 06 Sep 2024 06:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smS9C-0005kX-3c
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 06:08:42 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76a62535-6c16-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 08:08:40 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso151680666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 23:08:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbaf5bsm226008066b.23.2024.09.05.23.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 23:08:39 -0700 (PDT)
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
X-Inumbo-ID: 76a62535-6c16-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725602920; x=1726207720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z4PiOqCXVVy/MOvGFGp8UE0xk2IlwmcukqPPwyG9rhU=;
        b=QXo4TFf8wZFI0GZ37pvU2fntOWrFfDNWpHRxx6y+mn+5dauxw6eT9L8i/pNPa7W73o
         1H01HMxWcrZ+BTLdRkYIGeP7SbJPBQQSw9HNrHpAK9QmJtJgDWifsb2Rg8+a4o/YOzxW
         Y+UxpX3AgxpfnHAvP0lbXal6rlavyjdQ5CwaHvcGgQmk9zMspJycJO+HHLD9FkKwBZDG
         RkiolsaEZVa18AlqnyCTR1NLbYJ+9wRcO+fpLilSNI2odo4iQhrBow1jLfc7KagBuyTs
         3yWixdJ+5q386GaqaGFi+ZlhBbuCRA3jGfnXfXUb6luijGxMHBBfHBfESoHhyFHk1Bym
         QoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725602920; x=1726207720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4PiOqCXVVy/MOvGFGp8UE0xk2IlwmcukqPPwyG9rhU=;
        b=L5K3lFvDuijFXhtMtrTSkcMLbXkDh7zu+srG4P0BoeLAmQsiaploK8US37FnhEM6S7
         7/wKg6XNvwINatlVbDaJYOiZYEkqpKuXQR6dAHJCadRrmyNkKJbr3RrYKPM+MBCF7vwO
         qcMCj2C9OBbY5+om5DFiKcQcKP6PNUd16d1okdjY7u7e6JDCiYEAFJiScemf/9Jeo7oj
         YiVjc2ltsqKQX7nkIIxr7KzxkA9ImTntcDdtrA503yojYCPBJbrAUU/gJkDFmvibr5DL
         TzY+YmMVQoZcCEMsTnKe2RZEB5/JOTRtGjuTR4ZkUs2V+Hy2L0CF7QS3OqWu8IZ4M7IF
         uqnQ==
X-Gm-Message-State: AOJu0Ywj/i2v+q5JT9okcYtLZPEZ/PNucuxt6GmVZ7a4rJ4d8l/hLAZC
	UXgXTQ8Ow2EWPpZmNG49ru7kBvLwfoY30j3EZIOzY4I8g3vyHz0akIjJivJb3cY9ZfVH6cFZ7Xk
	=
X-Google-Smtp-Source: AGHT+IE82eSw/Z6JYvQfRYg6u201aDcrHntn2/sTsCv7Dbrs9G9dNG31p0Mdm3BeZsDqd2MNHeecmg==
X-Received: by 2002:a17:907:9307:b0:a86:80b7:4743 with SMTP id a640c23a62f3a-a8a885ff1bfmr103291566b.24.1725602920160;
        Thu, 05 Sep 2024 23:08:40 -0700 (PDT)
Message-ID: <ba5fb24b-52fd-4a7f-a3dd-3c83c2a97e8a@suse.com>
Date: Fri, 6 Sep 2024 08:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable test] 187507: regressions - FAIL
To: xen-devel@lists.xenproject.org
References: <osstest-187507-mainreport@xen.org>
Content-Language: en-US
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
In-Reply-To: <osstest-187507-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.09.2024 06:41, osstest service owner wrote:
> flight 187507 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/187507/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-i386-xsm                6 xen-build                fail REGR. vs. 187498
>  build-i386                    6 xen-build                fail REGR. vs. 187498

This is a result of "x86emul: introduce a struct cpu_policy * local in
x86_emulate()", and me not noticing the issue because in my tree (for
AMX in particular) I have several more uses of the variable. I'd really
like to avoid undoing the change, but adding __maybe_unused also seems
bogus to me, as does adding a seemingly stray (void)cp somewhere. Good
alternative ideas, anyone?

Jan

