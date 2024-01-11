Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7A82B2EF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 17:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666433.1037066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxuJ-0002d0-0t; Thu, 11 Jan 2024 16:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666433.1037066; Thu, 11 Jan 2024 16:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxuI-0002Zl-UM; Thu, 11 Jan 2024 16:27:50 +0000
Received: by outflank-mailman (input) for mailman id 666433;
 Thu, 11 Jan 2024 16:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNxuH-0002Zc-J6
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 16:27:49 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b1dcb27-b09e-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 17:27:47 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so13475485e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 08:27:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c1d1100b0040e4a2b36bfsm6337212wms.22.2024.01.11.08.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 08:27:46 -0800 (PST)
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
X-Inumbo-ID: 5b1dcb27-b09e-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704990467; x=1705595267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXTY36Q0A3vZMiG5DjYNECedAKGrzFQN4UyIQLIk0WY=;
        b=LenJCavk1ghaGN+5yRiQafMWJjGD5OT3C7RJ8P4tYk/u9Nwx0AlV+w2rFlI8wJOzxl
         GTTDaz2RYXmwDuM3O/ERaF9Js5tAkqt7hZ1HgdP1RW9PSYuzdvnU0rfC5gOGI69eOTA4
         dM7ZoZnsW99JWRQIHrjGjxq6EL8UVZeBCO+9nA7VIX+OcmgnqtGQIAJddK6YED/omTRr
         +QW/FiVxFmEYJh/Nk047gaFxVoLMbS9PmWXiF0B4QUE5siSt1jGFHALXktY2d8+AyGTT
         bPqzuz6q8D9PL/napzD+Dm730wR9+lBNKDcEElqfTE4gMrhxIVEsjg69HchLD6Buk+/y
         sshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990467; x=1705595267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXTY36Q0A3vZMiG5DjYNECedAKGrzFQN4UyIQLIk0WY=;
        b=wIYIEXDxW/1ZkE3BMj8DWWsPPHIt/pfA9eVKfr95rfc3SKPpFr47GXy4GbKo1dwchK
         UL13jHq/EwhdD27NL+B6DrqDgpZiW8ZB1gL3O5Qj/zt7D382Up4TNL0kwj1fcjh6PP7d
         R1I7CFr8xNqxYQb5NUTZEEfGQCgfl10uVa5bFfQQ7gFVo0DUB0vf/gIU7IyPjFEcy7gL
         uuMXHJAVACxjTv0zLnqfT/XZ4TAE+4gP2UBFOLkXnFK6u/BqbFJK7HQSaKLFvyZNf1SV
         Tpn4KIjLdXifH01E9nc4umEmyAaofIwP3noMUuwq7Bs/EPJUnGMeRe4EOkkzX92mSz4n
         1j/Q==
X-Gm-Message-State: AOJu0YyaDt9/dB8qE6BpoV7dofDSNWKRj6rVPNabDOMdoPNrCk48cBay
	Fu1Q8PAxiVm2E83sUiohCAd0E1VqFqmu
X-Google-Smtp-Source: AGHT+IF5ZmPqgbuSxe5Zt6bZ9rASfQdLcZ68Qt2MB4tonZ+3KL1Y0AOAtIBxfQ94tWVhhbMJtmXSWA==
X-Received: by 2002:a05:600c:2988:b0:40e:6240:3293 with SMTP id r8-20020a05600c298800b0040e62403293mr53460wmd.40.1704990467103;
        Thu, 11 Jan 2024 08:27:47 -0800 (PST)
Message-ID: <d42b5ddf-5aa7-462c-aa59-829f0850d5f9@suse.com>
Date: Thu, 11 Jan 2024 17:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
 <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
 <aa0a0b1c-ffe0-456f-933f-2e62c9a47f82@suse.com>
 <ea5c4f94-e4eb-471e-aa45-cf4b8a3a3763@citrix.com>
 <5fb290bc-ded2-4883-a726-caeed98e9445@suse.com>
 <d0af2c58-e902-48d5-b616-da5accf05375@citrix.com>
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
In-Reply-To: <d0af2c58-e902-48d5-b616-da5accf05375@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 17:08, Andrew Cooper wrote:
> On 11/01/2024 3:49 pm, Jan Beulich wrote:
>> On 11.01.2024 16:24, Andrew Cooper wrote:
>>> On 11/01/2024 12:11 pm, Jan Beulich wrote:
>>> It does occur to me that we're trying to accommodate for two behaviours
>>> here.
>>>
>>> For a real keypress, we want to dump from the the point the interrupt
>>> hit because that's the interesting bit of stack to see.  For a SYSCTL,
>>> there's nothing, and we're using BUGFRAME_run_fn to generate one.
>> There's three forms of handle_keypress() invocations really, and hence
>> why (after having dropped the regs parameter already) I re-instated it.
> 
> Ok.  As you've done this analysis work, can you list these 3 forms?
> 
> I've clearly missed one in my analysis.

The console handler invocation is (now) using get_irq_regs(). The sysctl
handling, as said, passes guest_cpu_user_regs(). And then there are two
cases where NULL is passed, one from keypress_action() (a tasklet handler)
and the other from keyhandler_crash_action(). I'm not convinced the latter
is fully correct. The tasklet handler is used only for non-IRQ keys, and
hence only in cases where regs wouldn't have been passed to the handler
anyway.

IOW - leaving the keyhandler_crash_action() uncertainty aside, I think it
ought to be possible to do as you did suggest.

Jan

