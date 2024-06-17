Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E990A918
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742015.1148731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8LI-0005yr-Go; Mon, 17 Jun 2024 09:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742015.1148731; Mon, 17 Jun 2024 09:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8LI-0005wv-E8; Mon, 17 Jun 2024 09:08:00 +0000
Received: by outflank-mailman (input) for mailman id 742015;
 Mon, 17 Jun 2024 09:07:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJ8LH-0005wo-Mw
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:07:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16ac8145-2c89-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 11:07:57 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f7720e6e8so120212966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 02:07:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6fb084f5sm299310766b.163.2024.06.17.02.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 02:07:56 -0700 (PDT)
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
X-Inumbo-ID: 16ac8145-2c89-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718615277; x=1719220077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wmCUQhRrp+U/l5cgP6xim2f8AZbvbWBWfJybaQLpqlg=;
        b=Bf3RxvfHMyX1ttpc2GJl4f2zwy54y/n0HNybQqKq/5js4wO/iuNq0MCdhkD9oqG/0t
         OkzVicV2Vu2BjvFHpO7u1r/QOPvxDxaH61UfJbJbcqIyzFjSee/9BLm4R9fEywzzLJMz
         hvzNTC2WZBX5RmP55rIlB6gMeEkvV1IJHNLWIlw8lGjoWojbftolEVLNdomFB5K6JvML
         3TVJqBNCxcAIdcHuh++Q/R2ldxXO+8dA4X/Jo4qV45U6lFgmLyl+Os1/YxadAyjal7W8
         yAWK26ZkoWz0GqN19FhRQTC85Ra2MDGZoNkZaDZ2C0f4sLBv90AgUVySbNz53uJlEsLE
         SKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718615277; x=1719220077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmCUQhRrp+U/l5cgP6xim2f8AZbvbWBWfJybaQLpqlg=;
        b=xUtGY/m9bx+5O48t/bLngPt98QfzLY6ys5zhB9rTsyG6Gj3C3LwWBSQ/o84PBSQWTJ
         FRo2wZ0PvyLLCTyELsWvE0gni/mzQdAzSR+WG0CwWXQAG6EITrd6f5ngshltsA005uQN
         I2W5Ij+dwnM6BZE57w/BqQH7xGUqJGCxfd0QkNNF/iwXffwV8+S5OrCqQPbptJaanH2X
         FxyvaqSDv7YYiDOlY9kojsPR8FvFyeb6m4ZlJdj7imWk7ImhDXjpVt2AdL48BKpHFMer
         UWIq2btfZqklnS60+jivPOk3N5do7cuR11jksTgKOJgvbBKa0V6iBdPtjamPQeamMEtR
         Cv5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5WnmSCn7WUbWrjbjjCx5Y5hAFJJHNdLvAIYM44SieHhieTa9fIkgB5egX4jJctou7dXTGVtB+6JKD8aXxsUqYp2dHrNFN216eVPRIktM=
X-Gm-Message-State: AOJu0Ywe19AfZt5JCL6wVkPACUYhXLUecE/N65jsSzZIchGhzQ+S8cFF
	VjzwE4ZX1TZc9JZ9+BA+wzRVqENolmBe6P8oQdLoVVQlBhZoWJl6jt7Qhrpc1A==
X-Google-Smtp-Source: AGHT+IEVZI4QO0poLx8usLv0/oKq7jfbDDfGVZLS/ifZCrzljM2fJEiYp+9DO8HFdoJfwrUxp8/iBA==
X-Received: by 2002:a17:906:a0c:b0:a6f:d57:aedc with SMTP id a640c23a62f3a-a6f60dc50eamr754825366b.57.1718615276836;
        Mon, 17 Jun 2024 02:07:56 -0700 (PDT)
Message-ID: <10c2ab19-e2b7-4f5f-ae73-213e0194bb8e@suse.com>
Date: Mon, 17 Jun 2024 11:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com> <Zmxze4a0PZbwcLSb@itl-email>
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
In-Reply-To: <Zmxze4a0PZbwcLSb@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.06.2024 18:44, Demi Marie Obenour wrote:
> On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
>> On 14.06.2024 09:21, Roger Pau Monné wrote:
>>> I'm not sure it's possible to ensure that when using system RAM such
>>> memory comes from the guest rather than the host, as it would likely
>>> require some very intrusive hooks into the kernel logic, and
>>> negotiation with the guest to allocate the requested amount of
>>> memory and hand it over to dom0.  If the maximum size of the buffer is
>>> known in advance maybe dom0 can negotiate with the guest to allocate
>>> such a region and grant it access to dom0 at driver attachment time.
>>
>> Besides the thought of transiently converting RAM to kind-of-MMIO, this
>> makes me think of another possible option: Could Dom0 transfer ownership
>> of the RAM that wants mapping in the guest (remotely resembling
>> grant-transfer)? Would require the guest to have ballooned down enough
>> first, of course. (In both cases it would certainly need working out how
>> the conversion / transfer back could be made work safely and reasonably
>> cleanly.)
> 
> The kernel driver needs to be able to reclaim the memory at any time.
> My understanding is that this is used to migrate memory between VRAM and
> system RAM.  It might also be used for other purposes.

Except: How would the kernel driver reclaim the memory when it's mapped
by a DomU?

Jan

