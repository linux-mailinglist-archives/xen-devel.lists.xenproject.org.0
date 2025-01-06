Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CEA0218F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865582.1276826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjCB-0005RF-Og; Mon, 06 Jan 2025 09:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865582.1276826; Mon, 06 Jan 2025 09:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjCB-0005Pl-M2; Mon, 06 Jan 2025 09:14:47 +0000
Received: by outflank-mailman (input) for mailman id 865582;
 Mon, 06 Jan 2025 09:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUjCA-0005Pf-E2
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:14:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab9eed1e-cc0e-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 10:14:45 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3862b364538so8066010f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:14:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e26csm48139528f8f.78.2025.01.06.01.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:14:44 -0800 (PST)
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
X-Inumbo-ID: ab9eed1e-cc0e-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736154885; x=1736759685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lcIB1/Aes+G+TFzjE4b4guP9041iQn9WQdg+/V0MOoI=;
        b=Q/dCIScAdkHvho/J9svvKVv7zraCwjAXzBgF0sWfgawBNg2oZ9ISmJM+kec0YLWvky
         yVuZO6IEpE3r+anNmGmu02U5RLgf4ie9XeWZEt54jptgoIYImQDP7kT/jYzRk2FsQSrH
         u0IqljtpQgyzVvvR1VcxDfnZaSVCyhuWDa92NeLdjl7qiI2/6G6lDw+eQfASBS9AswIo
         YHqDC9VE+QKXwpKIA3txr4CQsviWFjyb+CYc0h03cTrWWKrs4BZIUTAVtQ2sPID1K7Za
         xOuXaQcn3N2biR7UuACHRycS3LDTZ61bk6sgNx8au2fK7xndeRjsOZsfkiyxn1dv9zkm
         7awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154885; x=1736759685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcIB1/Aes+G+TFzjE4b4guP9041iQn9WQdg+/V0MOoI=;
        b=pwtlhcNfTlx1SQPmzBcXQuojJmZqaarxkPVsI66AIjPVsUSX4oG3fbFrg1FdRlfQa2
         g4/xFIf03J9iZEwxppSt0YjTpyyMOxcen6bqMKi49qNlD6a3dVeMpqk6xU3WXo6dAvVk
         Zc107iI+YBpBecLTNUUewXXjOMseyjziU5y/tpIxYbHwrOmHYJlNZ4UnjJnWJz5nEGJl
         mG0TeRkZ70nE/EQsdczaaXwy3ONQwCuJ8pvpvb340U2beA8AsedZ658v1RylvU5NkJYQ
         cV0+BRW3LTn2Fz4WlQDN17fpXtN3ozFrT4YjCxvNBrKXTPqB4trA4IAe2HfqZJSRKEvb
         79Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWmAqhUL1e6C64S+m8YdqAq/s/Nl7//Vu9kne/dvlZlnsEI+N491iZx2HRz0yj9oVijvKoUthmWatE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtZgvmXpisra6I/EMrHHWJMRmuHIPqCix3/YGAOxutX8V9Nsz5
	dUHAnhqN1Snt+TLuIEM4MNDJZcEQdqfYYC2QvcAFuYAaAWzOzksHRUMfTyio3w==
X-Gm-Gg: ASbGncs8jYJSp7cKm+c8np8bRNsDx5YD709EGRbmIcZ2k4T3LY7P3wbYa4iKeymIldk
	q/wjkgxTBpYnOyv/TTYsuQV+NiFhkaTsk/xI6wQjHha49C6K3EnzffDnHV8ildc7kbk+ybAIJuj
	wvb2suSL7aKR6WshNm1WqBvVLLZ+01ZN9bl+Izu1Vo7VkahbKm9ycFRz/WV853P6JfE0OUJPTxV
	gGfqZbN23a/OnF0WB1AgmZPdZ2VhIlZXmiRESRnNmBC9N+xAMbHFsWTrGlIkPLrpTRO6BpqhQ8H
	5oUWVDLHd0svEmWBaiRXVbtGbom3lRFVbItd9/WEKg==
X-Google-Smtp-Source: AGHT+IHNLLCEacBdVXsMUYVBmB6e33MgvIYzVZDlOMoDsFZKrLBDzA0tFaFqtdzw2EemZKQq8rbWqw==
X-Received: by 2002:a05:6000:1569:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38a22a648f7mr43021611f8f.27.1736154884856;
        Mon, 06 Jan 2025 01:14:44 -0800 (PST)
Message-ID: <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
Date: Mon, 6 Jan 2025 10:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
 <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
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
In-Reply-To: <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 05:15, Denis Mukhin wrote:
> 
> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
> 
>>
>>
>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>
>>> From: Denis Mukhin dmukhin@ford.com
>>>
>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
>>>
>>> The call is used in NS8250 emulator to identify the case when physical xen
>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
>>> messages from guest OS are formatted w/o '(XEN)' prefix.
>>
>>
>> Such messages ought to be processed through guest_printk(), which wants a
>> domain pointer, not a domid_t anyway. Plus isn't that going to be
>> current->domain anyway at the callsite, eliminating the need for such a
>>
>> helper altogether?
> 
> If the current domain is owning the physical console and printing, say, Linux
> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
> can be disabled from Xen command line.

Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
which domain a message came from. As long as only Dom0 messages are left un-
prefixed, that's likely fine. Yet as soon as multiple domains can issue such
messages (and have console "focus") I think the prefix needs to be there.

Jan

