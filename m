Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C9C64133
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163691.1490772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyQU-000549-Q0; Mon, 17 Nov 2025 12:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163691.1490772; Mon, 17 Nov 2025 12:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyQU-00052S-NC; Mon, 17 Nov 2025 12:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1163691;
 Mon, 17 Nov 2025 12:33:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKyQT-00052L-Au
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:33:45 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fc8091-c3b1-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 13:33:44 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-640d0ec9651so7048144a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:33:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4b2155sm10001623a12.29.2025.11.17.04.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:33:43 -0800 (PST)
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
X-Inumbo-ID: a7fc8091-c3b1-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763382824; x=1763987624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=54pnEdEmG4e+rqUhKDpkGtJJSN0IECebFS7E3rTIPZ0=;
        b=a20el0lR3UyQErpgQKsw2QSkD9HT4a9fDfp/CTTfwBs9BCMJ6JrPfcxMi+40adwyUR
         O5RrNVep9TUVmPU2m20pqRP/nHhQaRNLaAW8pb+YEDgHK4CpCoAaAFTSW1QMi3i6mPna
         vQRI3ad10JqS/ll/ed5d0NXl8QFj3n5DKZdCslNTwLyqzsAZPa3cGYC2Yie4WQhiUji7
         rhh1R3+VBb0OkpXn8WDMhpLaLO+G6mc9pbnTa49cKiMihX28WlShJK4WrvVh0HebkJZa
         8LKxjD9KKUSplSs26pj55kFnum4EdVUD84rKhyqOZShrnvDYn9ATGCVnpSQpQRcIJod+
         uFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382824; x=1763987624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54pnEdEmG4e+rqUhKDpkGtJJSN0IECebFS7E3rTIPZ0=;
        b=qOdUi4J5L4YkLi54mdKUMIlG/tbWsz/OcX74tKR10+IXPCGEkMngsxYmpIuqC3t5Qw
         tfgmIFtAqc0qreeBzvEX5Wo5zeLN/7gL8SyCrkJRgCzWL0KTpr96aKJ+ulgElV3F9/VU
         ainXQ6KeTcqJDxTGPMALaZ6e3+3MCUSBtWzOKFq3NCZ6AQ0k2SvX+i+Qmr4vcGY4LmVU
         ideklceT54U0gUMKvkbA13+Z80xwjvvW0WfcWkqbchLSHYSiWButZHz+LOiUUNZYfRUx
         toeGOWUN9TuHvsN5s9ZmbgHY/qXTNBnb21wdQh0pxEEw0udjZBelXxw94IEWrxRrXS2i
         WKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWluSHeLcG7FU+c8J/Rjy1DdUb4dmISd2jbNDn3WzTZfoD7fnN8/VZr+d5IEvY9BT+sSuiiEBlUYxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yztpudr++6abKBQEfUKM2bkTGbrz85Yyyn0fbpGfCH95QANc+xI
	7n3cfb1T8yWpZWpbeZGkvmFzOnKWvdsWIRH09G5i1edmsxQgVj3v6oofmeArNRRpnQ==
X-Gm-Gg: ASbGncupRn8MhZ27sp40XHF3KTmJt9KvM8yVUjkMxuM8toX/a+i7fHDd1ZqfQjFkqOh
	4ukJ8BYWZU5hS4X/luJm/52ClfRWPj8ug/cvgzwLTk/LByVaZyx5Wx4H1pkz0eleKn2NVMmEZ9P
	fnlQHS6QWkmrMDYcKbt2i6oPKeFWNLd4UqRAurSWUykaC7xEmtRZvhIswia+GmRD8E6rxEh2WII
	WASZCsITT1ws8dGqtI4KijdNvImVdPSAJIf36FQMr5OS81QQi6RiACA3OnPnwDu55yN4IWYSEUt
	8+2nvRmq1jsJW52cIxNbHF0XRTFi09EA/b9IXmMAm2TYPy+Zj//77Jt7OAnDRIfQiXEfDwLjuxW
	ncaJgQ9ZSOTITXKY8mOmHRQ+SO+akk358665tLR2/jhu7gw1+bbSchLQLYFil2dYcPmRe5xVobX
	BrsjkwJFDCMMj6Cn//wTaheyCiita8GvHOC5/Iou5TyPCGmt7Vt7ikBOOg46IrdmTmJ2kaRztta
	HpnOJiNyqUShA==
X-Google-Smtp-Source: AGHT+IHF3pDEVd7yNW9S467NZzeogkg6lGpz+Yx/8PepQ4TnnGn274eJVg4BeE0K/xftEBf5vIrPmw==
X-Received: by 2002:a05:6402:20c3:10b0:640:b736:6c2f with SMTP id 4fb4d7f45d1cf-64350e8a799mr8741907a12.18.1763382823737;
        Mon, 17 Nov 2025 04:33:43 -0800 (PST)
Message-ID: <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
Date: Mon, 17 Nov 2025 13:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
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
In-Reply-To: <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2025 14:00, Jürgen Groß wrote:
> On 14.11.25 12:40, Andrew Cooper wrote:
>> On 14/11/2025 11:32 am, Juergen Gross wrote:
>>> diff --git a/docs/Makefile b/docs/Makefile
>>> index 37776d303c..e5f4a8ca86 100644
>>> --- a/docs/Makefile
>>> +++ b/docs/Makefile
>>> @@ -8,8 +8,11 @@ DATE		:= $(call date,"+%Y-%m-%d")
>>>   DOC_ARCHES      := arm ppc riscv x86_32 x86_64
>>>   MAN_SECTIONS    := 1 5 7 8
>>>   
>>> +IN_FILES := man/xl-disk-configuration.5.pod man/xl-network-configuration.5.pod
>>> +IN_FILES += man/xl.1.pod man/xl.cfg.5.pod man/xl.conf.5.pod
>>
>> Sorry, I meant to say this on the previous revision.  Can we please list
>> these one per line, for the future ease of inserting/removing.
> 
> Okay.
> 
>> Is IN_FILES really correct?  These are the generated (non-.in) files,
>> rather than the .in files themselves.  GEN_FILES from v1 would seem to
>> be a better fit.
> 
> I wanted to make clear this is related to *.in files. And IMHO GEN_FILES
> was too generic on a second thought.
> 
> GENERATED_FROM_IN_SUFFIXED_FILES seems a little bit clumsy. ;-)
> Seriously, if you have any better name, I'd be happy to use it.

GEN_POD_FILES, seeing they're all *.pod?

Jan

