Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716C8C7695
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723291.1128006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aMR-0005IE-1c; Thu, 16 May 2024 12:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723291.1128006; Thu, 16 May 2024 12:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aMQ-0005GA-UV; Thu, 16 May 2024 12:37:26 +0000
Received: by outflank-mailman (input) for mailman id 723291;
 Thu, 16 May 2024 12:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7aMP-0005G4-Na
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:37:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c00cb18-1381-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 14:37:24 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so322895566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:37:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17f0dsm975929066b.211.2024.05.16.05.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:37:23 -0700 (PDT)
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
X-Inumbo-ID: 0c00cb18-1381-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715863044; x=1716467844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8XEvVeiMVNR9flj7k3kSfSfD9pzbPRxdD0zGTFaP9Y=;
        b=ODWsp09n566ml/ConQ2dbyz17U4W5QDQ0erTnqrua8lytzoy3Qwu2cnBa3n/BrSSEu
         1ljgk+GlO3s95UaMXO+GniJtl1R4JImeMbPrIPEUT0Y1dWEOcNBtWsfaVYu2wqicbyYN
         WsdPV+8rJeQSGtq3U69I/jTuZoovgezwt/Dwvn6opMjcMlgO51860XCDI+6gDipt781O
         gCmhDXooERABmH6FD4XRFvoj1IiG4NMpVdUOBp3PtOwrraru34H0kvOiGVszqY+mxy8z
         MOFWsq7Rcag6BCFSuWVR0yGTLv9TmUPXjRxhow5Q0y5CTyAFbaLkAATsZEdeiRmdg74q
         vLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863044; x=1716467844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8XEvVeiMVNR9flj7k3kSfSfD9pzbPRxdD0zGTFaP9Y=;
        b=hDjKoo5OYwAYrYRbKxgjlD2KdWonC0zlYYR5MFxQkBTE6Az/BYcZhkjMgdFE4Ckk/9
         r0MINIj9g0z+Lqvwnd+nTDH3ouIcpggBgWQQ2osd7Zs9FpRLggI/ITNAPMEIrg5LGY9L
         wI4hrcM05sx9/RIH7p4rE24BITyC8CN0SNioPDOXXAdw2+BOQ3xbQcnOHKH4mkFBT0qF
         wqjD8kSDo6I9m2NDCGUXmlCvF3pbSmVrW4ReD9YZWbFFLdMf94v4cOZIYc6MwkRYNUfm
         7PMHPMeZ1vgsSvCgHEGKZVwHuzk6rD8HWzmTv3tI8KDpycLIFGKufghRKM4P/IcvyRNT
         p+BA==
X-Gm-Message-State: AOJu0YzKeJlounTvpnT3RIN3arQSPHSAZE9D02hsdx4M3whHzV3Ks3Jf
	u44EC8hSPVI2wy5i5ZIeDgb19fXBAjSUH8nwcbSY6gb0OZwEML3E0ImN2PSuSg==
X-Google-Smtp-Source: AGHT+IHqUb76w5A9zgx0D9op5fXp+0mipdfVjXA0f9uvCIvzYXXOZRLu1I00fgSv7V9/MUOxKAxMDg==
X-Received: by 2002:a17:906:13c8:b0:a59:cbb5:e09e with SMTP id a640c23a62f3a-a5a2d6669b6mr1251785766b.58.1715863043962;
        Thu, 16 May 2024 05:37:23 -0700 (PDT)
Message-ID: <ce573d24-1d52-48a8-b3f0-8636dacd5c9b@suse.com>
Date: Thu, 16 May 2024 14:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <ZkXvdWf2mVkPW458@macbook> <7965ba74-9177-44b7-9253-7ab5a77fd88f@cloud.com>
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
In-Reply-To: <7965ba74-9177-44b7-9253-7ab5a77fd88f@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2024 14:29, Alejandro Vallejo wrote:
> On 16/05/2024 12:35, Roger Pau Monné wrote:
>> On Thu, May 16, 2024 at 12:07:10PM +0100, Alejandro Vallejo wrote:
>>> Bring test_x86_emulator in line with other tests by adding
>>> install/uninstall rules.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>>  tools/tests/x86_emulator/Makefile | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/tests/x86_emulator/Makefile b/tools/tests/x86_emulator/Makefile
>>> index 834b2112e7fe..30edf7e0185d 100644
>>> --- a/tools/tests/x86_emulator/Makefile
>>> +++ b/tools/tests/x86_emulator/Makefile
>>> @@ -269,8 +269,15 @@ clean:
>>>  .PHONY: distclean
>>>  distclean: clean
>>>  
>>> -.PHONY: install uninstall
>>> -install uninstall:
>>> +.PHONY: install
>>> +install: all
>>> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
>>> +	$(if $(TARGET-y),$(INSTALL_PROG) $(TARGET-y) $(DESTDIR)$(LIBEXEC_BIN))
>>> +
>>> +.PHONY: uninstall
>>> +uninstall:
>>> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGET-y))
>>> +
>>
>> FWIW, should you check that HOSTCC == CC before installing?  Otherwise
>> I'm unsure of the result in cross-compiled builds, as the x86_emulator
>> is built with HOSTCC, not CC.
>>
>> Thanks, Roger.
> 
> Right...
> 
> More generally, should we do s/CC/HOSTCC/ on all compiler checks? I see
> no particular reason to do them on $(CC) rather than the actual compiler
> used during build.

No. There really is a mix here, intentionally. Anything built through testcase.mk
is using CC, and hence respective checking needs to use CC, too. That said, I
don't think the split is done quite correctly just yet, which may raise the
question of whether having the split is actually worth it.

Jan

