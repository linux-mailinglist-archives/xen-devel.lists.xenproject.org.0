Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC3484C5B3
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 08:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677266.1053761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXcTR-0005X0-U4; Wed, 07 Feb 2024 07:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677266.1053761; Wed, 07 Feb 2024 07:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXcTR-0005Uq-RQ; Wed, 07 Feb 2024 07:36:01 +0000
Received: by outflank-mailman (input) for mailman id 677266;
 Wed, 07 Feb 2024 07:36:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXcTQ-0005Uk-Hi
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 07:36:00 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89657b1b-c58b-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 08:35:59 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40fff96d5d7so2436025e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 23:35:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056000024300b0033b2799815csm775284wrz.86.2024.02.06.23.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 23:35:58 -0800 (PST)
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
X-Inumbo-ID: 89657b1b-c58b-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707291359; x=1707896159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJ3YMq/32Qq9ggAY1KGcljB21mQ0ETSPdhbYcdJIuZ4=;
        b=Fz+df0k6/UJGfhTyeqa9sOqbfnjiZUME6h0koUdKTL3vvJjhcwiJ0BVC3e5ikFATnK
         Jbzlx0pdLsxNA7YNuDE/eBqqkCca7oSM4N+zUgqtU3HckoVD4ZrYPaTXjy0ajkakHS3N
         XfMuFvIxDyoXFITBEwq6XT/56DlNbkkqbdiHglFv6kNc82KWHUABkIIunDIfC8sdUN+U
         67f5weBHQhpisaos/Qnie2wer28jHbKDHJTAssVpSFtkE9K+dFyBdbFur0z2dH+qDMQk
         zrXStKhOF88FFwLp+6ShiUbLgV6FXGkFWHG2oikK7gVCPuV1q3Ylt+V3r/jAdwjRCl1M
         HZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707291359; x=1707896159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJ3YMq/32Qq9ggAY1KGcljB21mQ0ETSPdhbYcdJIuZ4=;
        b=uc6Y+zYeHUHwqwIGTBlt7wdsvKZYdJ02+JDvBu6nJz4k8J+sa09w+khtFwrE6ye/Q3
         5DnAIRqzGwb3TkYNx00c+icXHmMJ1LPklVXrFH5kheAaLA3cFxsOFn8kqVyhyaYChpLF
         DvkJt+/+pIkGh38MsRHy2aAwRv+w+mFMnvkCiZ1AYPyuoaOzrMM8cKeoQxjoNJmEjG7P
         7HCtEs2S8tscJQSX79Z0jDSpvrLcqtbEVRQIDz5wmSjH/yBkDtaOrrhvVqF3VDRNNplW
         dtp7XRMQNaUSo0fo01vKRPTb3F0ackzpnzH5GPnRGsFPYq2Ef1liKNG2akRhBOfq5Nef
         NPMg==
X-Gm-Message-State: AOJu0Yw5OLvCCur+4K7xv/6Tii0SibVIAhf8qDT4iMGTbWoMVd525MxD
	u1jymUw2HUM5JRAPTXDnB38Ds5fdxSYB/auQ/o9VUdL6wt+thEtwvHEqRpXjgQ==
X-Google-Smtp-Source: AGHT+IHNUlUMaPjfhrnufYqBPn4y3HplSYGb/heWAmCYFHaSeT/5LNc2iBak0KXFhcswzcgkHtmXHQ==
X-Received: by 2002:a5d:5505:0:b0:33b:5036:8111 with SMTP id b5-20020a5d5505000000b0033b50368111mr239435wrv.11.1707291358767;
        Tue, 06 Feb 2024 23:35:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeJ1d1jqul7Y4ZzqxHr6zv4LDiQXOqq5nr8o7r8dIs2Jee8e7BCse2/+5Epg+h6tzq2sY3ImVzGRGuiUQR++yDNEQ6beBc5FLmgd5Pp8T/lU1Sv9ScX57BC2DDX+T7Y6IeuE0lCjmkHyxVd6nHmqFKSgc58QmiTPw34j9xiaa97zp4iKnfVhypt43RSQMRfp3VzbiWvIZFNoBoTUQzCV9zbPN5
Message-ID: <c5de1969-32dd-4e52-b669-c1bfeae28e40@suse.com>
Date: Wed, 7 Feb 2024 08:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 3/4] xen/x86: address violations of MISRA C:2012
 Rule 13.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <16bb514ac0a5fe0d6e9a2c95279a8200ff4495c6.1706886631.git.simone.ballarin@bugseng.com>
 <b23ffbf2-e1b1-42f5-b0ea-9f0889a5a7af@suse.com>
 <alpine.DEB.2.22.394.2402061656080.1925432@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402061656080.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 01:56, Stefano Stabellini wrote:
> On Tue, 6 Feb 2024, Jan Beulich wrote:
>> On 02.02.2024 16:16, Simone Ballarin wrote:
>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>
>>> This patch moves expressions with side-effects into new variables before
>>> the initializer lists.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> To be honest, I don't like this. It's more code for no gain. Really its
>> hampering clarity imo. I'm willing to be convinced otherwise, but for
>> now this gets a nack from me.
> 
> Which part of the patch you don't like? The changes to
> bad_ioapic_register?

Really all of them. bad_ioapic_register() is merely worst.

Jan

