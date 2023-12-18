Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186708170D1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 14:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655973.1023888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFE0t-0003pF-Qb; Mon, 18 Dec 2023 13:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655973.1023888; Mon, 18 Dec 2023 13:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFE0t-0003m3-N2; Mon, 18 Dec 2023 13:50:31 +0000
Received: by outflank-mailman (input) for mailman id 655973;
 Mon, 18 Dec 2023 13:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFE0s-0003lr-GZ
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 13:50:30 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 672e8e87-9dac-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 14:50:28 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d13e4f7abso13808915e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 05:50:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600c450b00b0040c495b1c90sm31447034wmo.11.2023.12.18.05.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 05:50:28 -0800 (PST)
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
X-Inumbo-ID: 672e8e87-9dac-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702907428; x=1703512228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ck/LeqPE6c91McazT8sAMARWeAxNpRDqXCjjQdtdRv4=;
        b=WO/J17j2GfPqAqc/NUmPEvyoZVizC4jH20U83tCNP/As7UI/xLiBElUPQ6jGbr4M3J
         12ZNIS5YqOw+QGBhSZtBLUy5/77q/0O9YJg3o99FmKLUwnZHIA5qEOwrkXCAcVPSNMU6
         QnIEzBPdkK4etGUeWacPro8amasn6IP9NUItRg1peuwe0mWANbHfZEIrcsfb9of5PljX
         mC/jhZrAa7G2FE6uVvP3lXbDAmcyz/dZQyV8z6VIeBpWRQOx+9AFMuz+6fiCAHUdxrQ3
         JFQHTRYF/aCMHYAyMgJd1c4x1zss8cX7dnQELOq9GuhabZrm+fQwcXVVPMXM+uXPVY/F
         4ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907428; x=1703512228;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ck/LeqPE6c91McazT8sAMARWeAxNpRDqXCjjQdtdRv4=;
        b=jBTH7tSshsxBcvQit3GYFKuw5SsdraD8iOhmSSLpq8Jn3IFP0JrArfnUYxSZaXGMtg
         D5jPyf/R5OB8ixYfyV1DNSNSGlwStI+CttzAstIUNPw5bWUIX4e3QzfjdMPia5J+813C
         KzF6yK2E7+o58gFOUIPEpNArhdIMSRBEQzPcYQmtLXmNQv1gx+OoPxUakXO+A92JCxMx
         Bc1ZmF/T1Gc7AjWX2hXOPwM3Jl/nPlb6ZwlAEsOYJ53veKD+OnKEuoDp1AyqzSkPFVD6
         3I6rfB9D52deB39iZa3LJ/tUQfYBTqpf/FNSMsiLWCZ02v/Cjt+AH8TChEOBp5sPfWtd
         IxHw==
X-Gm-Message-State: AOJu0Yyq+kyQNpknDtipSuAuaYZfrsy09lifXr4qiva0oGyzF9LL3zPQ
	l3NKwchiWTbNbI68tY1QDPYJoA3xTJUUKskxbblC
X-Google-Smtp-Source: AGHT+IFsLcnu0lMrLnnUzr+UuS0/VJZn0r+2vY72r5W/v2+zDIYsUEHeYrWBpRT9/EccRSWvyKJw/A==
X-Received: by 2002:a05:600c:1c09:b0:40b:3645:4671 with SMTP id j9-20020a05600c1c0900b0040b36454671mr9808617wms.10.1702907428640;
        Mon, 18 Dec 2023 05:50:28 -0800 (PST)
Message-ID: <2f6367bd-d63d-435f-8d6e-553d5e129eb5@suse.com>
Date: Mon, 18 Dec 2023 14:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] x86/spec-ctrl: add logic to issue IBPB on exit to
 guest
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <31da79de-bd6b-af95-793a-c16516992bc7@suse.com> <ZYA3Db53Z3fvBlwn@macbook>
 <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
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
In-Reply-To: <1c00c3ba-4d10-4cdc-ae2e-ca2fb2157be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 14:46, Jan Beulich wrote:
> On 18.12.2023 13:11, Roger Pau Monné wrote:
>> Hello,
>>
>> I'm not as expert as Andrew in all the speculation stuff, but I will
>> try to provide some feedback.
>>
>> On Tue, Feb 14, 2023 at 05:10:42PM +0100, Jan Beulich wrote:
>>> In order to be able to defer the context switch IBPB to the last
>>> possible point, add logic to the exit-to-guest paths to issue the
>>> barrier there, including the "IBPB doesn't flush the RSB/RAS"
>>> workaround. Since alternatives, for now at least, can't nest, emit JMP
>>> to skip past both constructs where both are needed. This may be more
>>> efficient anyway, as the sequence of NOPs is pretty long.
>>
>> Could you elaborate on the reason why deferring the IBPB to the exit
>> to guest path is helpful?  So far it just seem to make the logic more
>> complex without nay justification (at least in the changelog).
> 
> I've added "(to leave behind as little as possible)" ahead of the 1st
> comma - is that sufficient, do you think?

Actually, the next patch supplies better context, i.e. is more / also
about avoiding to clobber Xen's own predictions.

Jan

