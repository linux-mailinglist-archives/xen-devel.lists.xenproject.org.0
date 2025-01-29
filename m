Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A6A21852
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 08:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878908.1289116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td2sw-0004Uu-Jp; Wed, 29 Jan 2025 07:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878908.1289116; Wed, 29 Jan 2025 07:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td2sw-0004TD-Gu; Wed, 29 Jan 2025 07:53:18 +0000
Received: by outflank-mailman (input) for mailman id 878908;
 Wed, 29 Jan 2025 07:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1td2sv-0004T7-GB
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 07:53:17 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1873f577-de16-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 08:53:15 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso9325732a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 23:53:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab171sm928129766b.107.2025.01.28.23.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 23:53:14 -0800 (PST)
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
X-Inumbo-ID: 1873f577-de16-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738137195; x=1738741995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mcgoQ4RQ/+msiATfSS3LRvmHZ1tq/ucOrokkG5BuK4c=;
        b=W0GJg/8i22SViP5VHhWme4DHiP6ckCEc1W9hzm28fBveH7AautTYUcX+yT1Df/Rh1S
         n2FeCaXPD34tEWixxZRPjNKY+nLFP3Dez33/66bnfdVyZfRTLC8s1fZFy+T6q2r4anVc
         GODf8+IR6WTHuj58Ms9vvYogwnrt1JSSKUebQCleKRv/WwDKg0AXJ4vtPfFuW/l+OLb+
         BtoLexwV4RSE2htpFZ7bEzXbmKOF8HhRP2gZIcCLQoSgw+pwa2g5AlzAsaOqzwdAgCvW
         JS4mhpxCXFLg7rEm0vsUTjVwlK+DmymqUU/bU/Sf53M/xskZ83mrXSGQaClZaTAUNJEs
         VIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738137195; x=1738741995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcgoQ4RQ/+msiATfSS3LRvmHZ1tq/ucOrokkG5BuK4c=;
        b=fXRWM05KLxG8LGuqOdIvztkaZw4NLzJ0KDmQIED1Y9lT1YM4ZMeJDSKBQ28RNVwiaB
         uEQD1dSNMOj1wOU+hQzEbMYaiG3TxyF560kgV/0+o9yNZcWg4mjEY9ecQ6+REs7D7ljT
         NMxaCpq2xRbvVAslANWufhjoLQQ9YxDALJoWXDANdCOPbLVSWvTl6EWI4K2wfacxQ4nQ
         u/jH3iB3tXWwGw2JK5+X+/C3BJFt8SPu+9sYpFiEZCUM1HetvGC4A4nUhsSMgQD+Jp7+
         crVfV6ateOyH+f4F2+OAVTiwLTbDe3uNZVu3jdwLsB2F8B5oWi4DQesEB1ImmTdcjfUH
         BDxg==
X-Forwarded-Encrypted: i=1; AJvYcCWq7tqVj9DJRPsbmjjJ0XHmHgJLGIvTYCYqxx/Ua/DlVBlNMQbY5QGNn6KZFKPSvq6r7flFdczvvS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyumzLBRDTyx5BeEjoLZOeWPq0iSaRGbausta6GMPQByTZnmgnO
	VnUxTPe4/3p7qBt0tE77FzFqhaLfaDkT9TxiUojS5RjvACTKPiToEr9tW310ug==
X-Gm-Gg: ASbGncvnLVhUrP84icdAURptE1OMVd0LdLFqLRFNAzroVDEr+RqDZRWJuHBxLcOy2jV
	FUI3YkLLDrPWKbq7dwL/Dr2dfZtiIps30N78Msp0tsmdj4l58OOIeVSVBA8tGRNvM26vGE6IBJJ
	cxhW/sCFbq9KbIJHXrbcwMvrpmv4uDEuWEEowelX0tgm0PUYAuagRK3zfjQuDdb4SDvYlNdgQKz
	F3YddoMWi2w4mrZD942ebOhtyPhk7gtAGc1/lSVI7qiMq05S068KZmm5M2GnMfm64T9jM2+Hvti
	J8k+yITECEkMvl6Nh0m0ljqgEwmvhgGn8UYr+hf+ajPfGz+YKaDaqC0RAdg2dWc2n45/F7vkGrG
	A
X-Google-Smtp-Source: AGHT+IHN7Yw+nj0laTMFMqxkFW6y877jCTQNKW7apzEZ1xKv8k1Ooc3D0fbPkXvLOo0EadNg8+2Guw==
X-Received: by 2002:a05:6402:4309:b0:5d0:fb56:3f with SMTP id 4fb4d7f45d1cf-5dc5efbf5d8mr4587300a12.12.1738137194507;
        Tue, 28 Jan 2025 23:53:14 -0800 (PST)
Message-ID: <b4426452-16cc-4a85-84b1-8e27152796d4@suse.com>
Date: Wed, 29 Jan 2025 08:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/24] xen/console: make console buffer size
 configurable
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com>
 <d471f3b0-5638-47b3-927e-318b0575eaa3@suse.com>
 <RKwzueYurWHDxryD0KUwTcZHRfprlyr4H0fIq4w-yV2i5uK4XfDGrWsUBgt8FnW4R-28hIjbclYcGVP62eLjfFAIwNjXzP0Qj2sajURd-8s=@proton.me>
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
In-Reply-To: <RKwzueYurWHDxryD0KUwTcZHRfprlyr4H0fIq4w-yV2i5uK4XfDGrWsUBgt8FnW4R-28hIjbclYcGVP62eLjfFAIwNjXzP0Qj2sajURd-8s=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2025 04:04, Denis Mukhin wrote:
> On Tuesday, January 28th, 2025 at 8:32 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
>>
>>> From: Denis Mukhin dmukhin@ford.com
>>>
>>> Add new CONRING_SIZE Kconfig parameter to specify the boot console buffer size
>>> in bytes. The value is rounded to the nearest power of 2 to match existing
>>> conring_size= behavior.
>>>
>>> The supported range is [16KiB..128MiB].
>>>
>>> Bump default size to 32 KiB.
>>>
>>> Link: https://gitlab.com/xen-project/xen/-/issues/185
>>> Signed-off-by: Denis Mukhin dmukhin@ford.com
>>
>>
>> As asked elsewhere already: How's this related to the goal of the series?
> 
> I mentioned in the cover letter that there are two group of patches - console
> driver cleanups/fixes and the follow on UART emulator (and up until v3 it was OK
> to have this patch bundled into the series).
> 
> Yes, I acknowledge that the first group of patches for console driver grew big
> and probably should have been posted in its own thread.
> 
> I can move "console" part to its own series if it makes sense now.
> 
> What do you think?

I for one would appreciate you doing so. Where patches are independent, you
may even want to consider posting them individually. That way it'll be clear
they're isolated, and hence any one of them that is fully reviewed/acked can
go in (once the tree is fully open again).

Jan

