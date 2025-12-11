Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF09CB659D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184280.1506766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTidz-00017k-OU; Thu, 11 Dec 2025 15:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184280.1506766; Thu, 11 Dec 2025 15:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTidz-00015Z-LZ; Thu, 11 Dec 2025 15:31:51 +0000
Received: by outflank-mailman (input) for mailman id 1184280;
 Thu, 11 Dec 2025 15:31:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTidy-00015T-Ot
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:31:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81f0bdce-d6a6-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 16:31:48 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so2103215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:31:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b9b26fsm6880943f8f.40.2025.12.11.07.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:31:47 -0800 (PST)
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
X-Inumbo-ID: 81f0bdce-d6a6-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765467108; x=1766071908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Iyet7NxAy0x0B+xNbxswknYYUrTPd7LUjEqrxWTg5+I=;
        b=eMSnPFpkEgEWcX1GDz+rfZPyX9LPVBh63VRBnAij5b4+XkSXNmMJWPCyyGl2Rj8wu1
         k19Yzwk2dtGsPmgnqJr5FFDw/B//0WLaLeeqR1m2QSJVjkpnD8bSvLeWhGK2APODvaJ7
         cPn8owGBL+Nlx8uaDd7+hlf4ddhCRdXm00U+/Rkgi9WceschDIfu2t6LMed5J8GwZkUR
         WvHORlIFZxHlLhjNPe0pbyre5NFvbpWuC+zwr0FxeRrokHP7EBm4vNVaEfNGr9DZ7mhW
         EoIGV/PURLIjHDJmyQg6irjhs1QlD8WrtoRtt7HAG2LHw2h+WaonnFRRYahKgzUEC0Y4
         7KnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765467108; x=1766071908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iyet7NxAy0x0B+xNbxswknYYUrTPd7LUjEqrxWTg5+I=;
        b=f9kw+PlkhZPtqO7bMLdegzTQdeEq6yoZRYShIIV6c27qxrPgtEMn4VDChVDa2aS6YY
         xn2eVvqBBSHkT/PXddK6E415SfnYCMbvjCb/1eiipnLduW6D3ct7pvRTYm8S9gLwn6ga
         kxS37xj0zuNjtAIDDyPB26xgVmvcUPh5TmPx0WoV4IUPoVdfRLXGEw6cvjGZQpRe9flu
         3Fu1RDor0J38YYAV+/jOwzsX33IZcbf8KaZ235jZy7DfHjzztLCIKHZHyC4QA4y2yBli
         e6kbeAc2dYl9WEVjibD+93Rcm6CURTS63Bi3l9yXZIW0OZG/Iq8RKFq8tobinVHtcCNA
         5bfw==
X-Gm-Message-State: AOJu0YxRpg6HlAAKLC8I8UsEk875NOUgp6GPM3UXK8Eo6psZXThCKbXn
	5X0EpO5667B+PI0ZMPOjf1cWDqawDWnqYYnX1ey1jD8NLRYoIxlEN2h8tKR5mSuoWPBpmz3DwIR
	NVv0=
X-Gm-Gg: AY/fxX6joLo597m70JaQbnBDUkPJW0N50yzMILqeUR+7kcqYA2p0LqgB4gnYXvfb32z
	nGZb2YkD6kFZGwe2EKlekTPWhFJPSfhRbSoXEGaf4y1UYyx09yaGTENUO22Jtz3yenfR9ZOX9wf
	LA65h3OaW8UVqha0lgmPDForWdJp253w3hAQVDbxKrSHoMmjB96LbGUy8gO7fNjLxPWxUzADJ/D
	BaZAE5vE8Kc5YpOPD9kJI2GiVdxntWQcxyGDK+fC+1OKPqspqlejXkbAWfLSUth1cBYxmkhd/U9
	wcbbggpiWdJbNKTii4o5EtdPHSYVrl7Ga2GlPGta6eI7a09vlohnvZgc2hDAyzSjTbaxkbd5AWq
	aNDLT8HADenpcsLsKehhZhR9CnplsNd1aKktAPilvth2l3+Yan3PvrTC+uqj+O6xZMaJqTzwmAY
	Qcjxw62sUleEeekxKd5BocpHH/b1naDaQZqGtTwRM+hq1dEBlfT06RMaUM+kWdrBLzWW7EOFX4T
	8Q=
X-Google-Smtp-Source: AGHT+IGSIEK4jDuyKw5Q2F9JfPaXdFEYrbBq29UUrKpw+7Y7QTtoxJzTxlwMQSF1GJNnIRXtSSu9OA==
X-Received: by 2002:a05:600c:4f12:b0:477:97ca:b727 with SMTP id 5b1f17b1804b1-47a83806a32mr65386775e9.19.1765467107607;
        Thu, 11 Dec 2025 07:31:47 -0800 (PST)
Message-ID: <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
Date: Thu, 11 Dec 2025 16:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 13:06, Mykola Kvach wrote:
> On Thu, Dec 11, 2025 at 1:44 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>> I tested the issue with the provided patch, and it is still reproducible.
> 
> I also triggered a pipeline with the patch you provided on top of my
> changes [1],
> and it failed there as well. In fact, it exposed additional problems
> in other jobs.
> 
> [1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2209153728

These are the failures we're trying to hunt down.

Looking at one of the Arm build logs, I can't see any indication that you actually
extended the patch to Arm's linking rule. Hence my conclusion in the other reply
may be wrong - we simply still don't know what the situation is there.

Jan

