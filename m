Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLrbIALD+WmxDQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:14:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF84CAB8C
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:14:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300455.1574983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCmm-0004zK-5I; Tue, 05 May 2026 10:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300455.1574983; Tue, 05 May 2026 10:13:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCmm-0004x0-2U; Tue, 05 May 2026 10:13:52 +0000
Received: by outflank-mailman (input) for mailman id 1300455;
 Tue, 05 May 2026 10:13:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKCmk-0004wu-5e
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:13:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCmh-004YFm-L0
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:13:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9c2d9-2eae-0a2a0a5409dd-0a2a450cbb26-12
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:13:47 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9c2db-62f1-0a2a450c0019-d155802ae9af-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:13:47 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso26283565e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:13:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055f249bbsm3106616f8f.36.2026.05.05.03.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:13:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777976027; x=1778580827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4BnYR3EAgJVTUnUNZV4aFtblgZoPDgGxh0x6Xg3Ztg=;
        b=a0PioNfcbTPkdNhFr6hctZn6nRkUJwHw8AlTwXrEiUH1z6CSthFKEoTTgelmTq71GH
         7AyqfHR2O36Z3X4gU3QAGTA6n4uJm1KuhqBj7Hmu0MT2pdW0Dj/VojwTgZLCZR+kefSZ
         XaLK2/0OcwB58RB5AouAYFDXQXS6dqD8A7wFgcD2xKTmdsFsPY82+jBX0vPOdICyJnC3
         GLcC5sMYAWQ4qpsEYu9N6DAyxwoIkakGUorfPpdHcAI7h6vMtrvggKNQFQwkMgycDZxp
         UVGL+dAo7y8LH0oNrm9oGcVARMtAKW48krxZ/j1CoB0kUXMW8gLxWwY6n4CKkH4k2yoi
         hCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976027; x=1778580827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4BnYR3EAgJVTUnUNZV4aFtblgZoPDgGxh0x6Xg3Ztg=;
        b=go8B0WGWSjbaD5qpAIKSdluy8tA8ksNBM1Np3VHWIjpQlJTf8NRQIKqu3VxKL+8mCr
         nOUT7HladYhI1gDzpKRn/QeBaSiBJm4djlrOwHV7r8HsASbgtoFC5sVv8eLnUziyAjKX
         habsNplPWqeAqvs2hR6aFTXDfzyGHs6hOLlmh5lfTnsnh8qz9mkOMX3/f4PWeK17xDp7
         3O9vsLLej5d1wN6Or6ZvEjVnULdp8/2KoI6wIwXBoyrwOvV7EZzdU/BH6DuMs/m6mBn7
         lMJdg+J7mpIlXaFkqhU5/w9TKq+vr4QYbZ4mwk2ME2TUzr8vLFehkPMiFXhp2j1CStGB
         ++WA==
X-Gm-Message-State: AOJu0YxTGTTQc/pTDZHSVKkwBVXlFDf8m9Wks4UWKYS5PEy95R1QR1hs
	XqoTOR5EjoDvLnVY3wGOYZ5xBtEeKYzOHx96oxlr7G3yTkdT/jcPzBXirYDc+OfY2Q==
X-Gm-Gg: AeBDieuwSKfbY9Nki1tCQO2dRrVO3NEzIF4pIf1afgcX0aZjyoqI1c+WqnI/d/rkbYM
	YkAhRJVrqVpOeo+s82XF49pdWiJNTlZypher7VfO0fj+r1yvOYujeuafFVQP0WUfLg2Yl4baz+u
	WSiaiKLEBsAAX1Bp8Ae3cpkZ7PAoRWUL59tzy5eKJkGS0VLCdEK83XDSrmOymX7NJZD+pV+HNab
	QCYWMBqeQ1wdC78W1XIoNi251imoOsNrmd4pvlRVVoyZ1gHRrB1imbufOrtI+C08jpEo988dPq/
	8VZkpke8iah4/DFtI7KjH6LkwjmYOHW8Mhdqna5eeCOGJNFJr0f4a9uutodqDFd6/qLp8qLyu6g
	5nn5NiJF4ZA80yIRYCtTc6XNDCg9tsAKWzT/s6o2kap1AsYiNqXOyylzrDXL3gIkvrpWkfv9ycU
	vxN8htGAfyeuC829oZp0hC9ZyFeCgnXEXhW/6oo2o6xrznM8DKl7A9ZqBrCGDknAAAZRSOtCV3V
	znb1B9Y4DfGSDZEj6iIWgfKKg==
X-Received: by 2002:a05:600c:16c9:b0:48d:35e:84a0 with SMTP id 5b1f17b1804b1-48d035e84damr109509905e9.28.1777976026971;
        Tue, 05 May 2026 03:13:46 -0700 (PDT)
Message-ID: <3953265a-2bfc-4853-bda5-3450c096ebb2@suse.com>
Date: Tue, 5 May 2026 12:13:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
 <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
 <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
 <F9DB9C27-810C-41DB-95DD-D00772CE4385@arm.com>
 <32eddac5-73c7-46c4-8944-99cfe970c803@suse.com>
 <5B084D26-4FE9-4C1A-8C3A-298FB73F34CB@arm.com>
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
In-Reply-To: <5B084D26-4FE9-4C1A-8C3A-298FB73F34CB@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777976027-6EB74CF5-A400962C/0/0
X-purgate-type: clean
X-purgate-size: 1708
X-Rspamd-Queue-Id: ECEF84CAB8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 12:07, Luca Fancellu wrote:
> 
> 
>> On 5 May 2026, at 10:05, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.05.2026 10:27, Luca Fancellu wrote:
>>>> On 4 May 2026, at 06:30, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 29.04.2026 12:08, Luca Fancellu wrote:
>>>>>> @@ -136,7 +136,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>>>>>> unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
>>>>>>                                             paddr_t gpa,
>>>>>>                                             void *buf,
>>>>>> -                                              unsigned int len)
>>>>>> +                                              unsigned long len)
>>>>>> {
>>>>>
>>>>> Now that we do this, potentially we could have truncation in the places where we store its return value
>>>>> inside an int:
>>>>
>>>> Those would suffer from truncation before and after this change, wouldn't they?
>>>> Just that where the truncation occurs does move. I.e. if necessary they would
>>>> want dealing with separately.
>>>
>>> yes that’s true, truncation was already there in different places, do you want to deal with it separately so that
>>> we have a Fixes tag for it?
>>
>> I already said I'd like that to be dealt with separately, didn't I?
> 
> I understood the “separately” part.
> 
> What I was asking is whether the reason is that this should be its own fix, with its own Fixes tag, since the truncation predates this patch.

The reason isn't so much the Fixes: tag, but independent issues generally
wanting independent fixes. This also helps with backporting (in general;
maybe not so much here).

Jan

