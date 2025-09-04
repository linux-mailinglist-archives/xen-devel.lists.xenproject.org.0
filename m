Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54089B431DC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 07:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109425.1459012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu2zj-0004NS-IP; Thu, 04 Sep 2025 05:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109425.1459012; Thu, 04 Sep 2025 05:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu2zj-0004Lz-FX; Thu, 04 Sep 2025 05:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1109425;
 Thu, 04 Sep 2025 05:58:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu2zh-0004Lt-F0
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 05:58:49 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38a6d25c-8954-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 07:58:47 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61feb87fe26so150354a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 22:58:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7a10sm13890552a12.5.2025.09.03.22.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 22:58:46 -0700 (PDT)
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
X-Inumbo-ID: 38a6d25c-8954-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756965526; x=1757570326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=st99eOe1p4Y6UEYhsnIz9Etion7fYyP9ZTFsqlb+lXU=;
        b=avl2Wn0AW6TVNG0Qtzq3ImV6DPzdsuwsnE+UtV9bgghsAKSr7fekwFvv+XentwhNLG
         XGZGkESZ7GLrOC+88VvSv9szfl5bLO1xuhpPZk2b7bnyd8+uus4Q0GuUzZFuwJLfL78D
         wN/qYuNf423i4bdSkLLf5L/EjmXIcIjC7G8GlxcOElcD78SwNKjTtmJTb8vVg0WV9wi0
         8hPL91CJDAwoCg+fqZM30HB+KTZMIW1kKnC72ERqZa71SEpTEhQhHSa8FyG4sCWxu+PH
         HOfpj9HWTJ2uLKNdAdVz4Fvu7AYYLmSgop4h1igfKG1wiMesKIAwR3jCAm8H/4RSlIzU
         hulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756965526; x=1757570326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st99eOe1p4Y6UEYhsnIz9Etion7fYyP9ZTFsqlb+lXU=;
        b=Hhlt6j2ZQg50Nrjo9nNVOO0FXvRLvj6xVqhnIjwESKK/hzh0uio8gJ+gB602hGvB4F
         UfTYOn1TXvva1GRJb9ua0ySJnlu6WDNDDOiv5edLJkQNLc5mkVn3sPo4zYbFhL5iZreL
         Nr1Oa8oDg4875QLfhf0SLpna0Mpc8plQUQWlz+300+YW6vWE/uC6VfdDiWFnEy25FAW2
         yqRj7NoiXEbxBdunR2g8+EcZAYvXqCvov4S0SEQVgDxHVZMQXFvmTvSEG00RPyR3r+BQ
         78aJm/J1qdipjcRrt6F1vmIME5UtyZqp4pBDp3wd8TrX2levyi7jHOjNMx1/rO49JRmg
         IJ2A==
X-Gm-Message-State: AOJu0YwFLrXWfQXYRiVFGtLIHiAqkpWxrYloHBqy2JXba3aW2lzGChiL
	fzSwnfbQuXaKKg9rkacWa7qo5rwlsoYemqX0FPam1SQ0uyASdbECifTnnvnWzi3vXNs8pll8w/p
	6JqI=
X-Gm-Gg: ASbGncux66yZ2C7szUFfl+uiXAYU0mgb4u37TFffTLc07lV0BpyzLh9O4Wo5jIQbIqc
	YP6AztoXpDjWjsy6E2Rv5bnrpXeR0cV2vStlIO6KUocKviy7hPrct9GAAq1ILOFvV9x+Sdpl4A5
	XyKnt4QNNFvqVgeS8sV6lob07ZZ1QD7wakT7JnP5jqup6Ul+BzZjd6FTkxur2MVR891VKTKi+jT
	1e59mUvIse3HSTJgC0wDY4MjorxqSoGhii+/cdhQD+uVoGVtDEF1pwBp6oEzzHFrm5UxAqg1/if
	tXX6nTfWksyii7+W3K+D0xYOOkX5RPlj/GI/UvGXpnEELr71mM2AZJgTM/uA4b/iTfzoQLLoB+5
	IhuSxVynE/2gkJAkGVsAihVbKdLMT1TeDa+E4LKMbU0ZHOPi0iWBteig2xnWr4OFK54H2KUiwrs
	1l60yPW3+dCpJW87i/+A==
X-Google-Smtp-Source: AGHT+IEdf9aqurdLNteBfPFYV3Wvn0/PpUQS5NbLlDJvKrw8TxgiJmf2CurOansqukIeW16hiT1//A==
X-Received: by 2002:a05:6402:42cc:b0:618:38d6:7819 with SMTP id 4fb4d7f45d1cf-61d26d78d3cmr16258060a12.21.1756965526447;
        Wed, 03 Sep 2025 22:58:46 -0700 (PDT)
Message-ID: <0fb22103-c928-40ff-8be9-bf8d3914f028@suse.com>
Date: Thu, 4 Sep 2025 07:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.18 | 51190865
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68b862c0518f3_2cdd2ac12775d@gitlab-sidekiq-catchall-v2-5996545549-kk9d8.mail>
 <8319cf73-52f9-48e2-a571-452da53c36d9@suse.com> <aLhm5OMSUjGvQYAW@mail-itl>
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
In-Reply-To: <aLhm5OMSUjGvQYAW@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 18:03, Marek Marczykowski wrote:
> On Wed, Sep 03, 2025 at 05:58:32PM +0200, Jan Beulich wrote:
>> On 03.09.2025 17:46, GitLab wrote:
>>>
>>>
>>> Pipeline #2019390073 has failed!
>>>
>>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>>> Branch: staging-4.18 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.18 )
>>>
>>> Commit: 51190865 ( https://gitlab.com/xen-project/hardware/xen/-/commit/51190865a4918c443c310c0478247d5f9caa5dad )
>>> Commit Message: x86/suspend: unconditionally raise a timer soft...
>>> Commit Author: Roger Pau Monné
>>> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
>>>
>>>
>>> Pipeline #2019390073 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/2019390073 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>>> had 5 failed jobs.
>>>
>>> Job #11230955404 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955404/raw )
>>>
>>> Stage: test
>>> Name: adl-suspend-x86-64-gcc-debug
>>> Job #11230955410 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955410/raw )
>>>
>>> Stage: test
>>> Name: adl-pci-pv-x86-64-gcc-debug
>>> Job #11230955417 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11230955417/raw )
>>>
>>> Stage: test
>>> Name: adl-pci-hvm-x86-64-gcc-debug
>>> Job #11233274365 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11233274365/raw )
>>>
>>> Stage: test
>>> Name: adl-smoke-x86-64-gcc-debug
>>> Job #11233405609 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11233405609/raw )
>>>
>>> Stage: test
>>> Name: adl-smoke-x86-64-dom0pvh-gcc-debug
>>
>> While the same tests are fine for 4.19 and 4.20, all five show rubbish in the log,
>> and then fail. No idea what's going on.
> 
> The log says "baudrate is    : 115200", but looking at the state after
> the test I see 9600. No idea if that was simply switched back after, or
> setting to 115200 didn't work. Anyway I suggest to restart (now that
> other jobs completed). I set it manually to 115200 now too (not sure if
> that will remain there...).

The rubbish in the output looks to have gone away, but the adl-* tests fail
as before. I'm retrying two of them another time, but with little hope.

Jan

