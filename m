Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOzuF9MeEGrqTgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:16:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D45B0FA6
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 11:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316494.1585895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQLyv-0004vS-LM; Fri, 22 May 2026 09:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316494.1585895; Fri, 22 May 2026 09:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQLyv-0004t1-Im; Fri, 22 May 2026 09:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1316494;
 Fri, 22 May 2026 09:15:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQLyu-0004su-3a
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:15:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQLyt-006Xl2-Ff
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 11:15:47 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a101ec1-5cb7-0a2a0a5109dd-0a2a450be180-12
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:15:47 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a101ec3-212f-0a2a450b0019-d155dd2eec38-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 11:15:47 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-44a14580111so5425044f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 02:15:47 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm2844426f8f.36.2026.05.22.02.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 02:15:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779441347; x=1780046147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkfAOLXaXpIT/Nezy3HcPg1CcsGmcAt1KlFltMVEvOw=;
        b=XDGsRTZ+ECrRX0ULniQJkM12dMKVfm2kpK99d0JtDl+6o3y7tcZRKUUOGUQt6b+Xta
         iMXbeUTcSps3tUc6Pu8zFmLn3fx5InqhUjQbHHxn6Rko565vS9cwStLEd2zAOtLSZMS2
         xQnWW+2GFyXXCj/gDjuMBwfSm8khjzCYzHUCNkgHfs7o8fzOUMNXeG0Up7IQwcATIJTK
         0x3lvJUEY3jPGbPMVyTZGO3dsdiKslH6lD8maIfOtX4B7sYqNrqBOua0WjtRrg0FzWRy
         iJ2Zr8lYVs74zPWumeNCYfGZWMO4Ki3Yl6SaMwVOy8D+IWlWLiacWGvvGx55k3XUwDq/
         Ke8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441347; x=1780046147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkfAOLXaXpIT/Nezy3HcPg1CcsGmcAt1KlFltMVEvOw=;
        b=TTLFkZ5B3Um1baYz8IB1CVK2BVuVGJxmUGof4S1PYbo7avqboRZfNze2WbYQ2Trz1r
         wHQyiVcz7nmUhCaSwjSugKNBTd5ptzsZDB7h7/5PDgAdco3bM+aPb6DioS6kYNgwe1hJ
         Ma9itz+blSGodAnZK/WwjegIvKBW1vuFa+R8KQ3AaITT0QulGXDYenuD6eossVZl5q2Y
         Ve/y89Sr29HdOkzQzYKjBumOBYKkR1uTUjP7NyyNG7zbtN/1lflaqkFKTjPCgYjeJ1Ww
         9qKtUzCrmN8ZewIn4eJu8DcDxBpp7jqYQBfcljyx0cej/c0T8424/VzF4WHX50RVju/Z
         L3/A==
X-Forwarded-Encrypted: i=1; AFNElJ/6oRJ0SnZ8GPkjmDNAVB8Q8Ji0BGASKbATfW97z82o66GQWPAyu+rdNiRFK5vZ7urdByvoMMBQmaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydBffUOMRVRb8h3MOUCS0x2Ux9YKWYZPrF/NHf1+BXlwQIwqfe
	UPGGGF10w/bUothv51JANNjNG75jcEuP1+W3tJNpOsk+LdQI5F+9DhPO
X-Gm-Gg: Acq92OH5bZDZ6WqTmmp68Louoccz5yQGc3vA/DJqMCYHzluM7ZpAaQzwM7/PQa+O4pH
	7aVMMN7EoFZk/ZfIAnxawAiXHFCFTw6w8gQJ42GZwWoFvZhrW+ft3mWMx/P38hzUIIJRDYKgkuA
	IWsslQIG1tG//UCsBVS2JiD/Bc3AWBMyr3wqKepGXy8/fB/xUdBPH9UJQIE9A0OB0ZrA2XNzwjT
	5mrhDXU4WULjUmb/0uf5fEO/XeSfUyE4Gk12jhAtL9fAosZb5bfLZhaAUFNhHn661cbC2bxQ1zb
	0BSHFV1fVc60S+KFTH/BQyE0QojMttqYn4Vrpm4hTIbW8/oCh6eBAWHyXoGZOwmRuYKamofX25m
	Sgb8GIPGqZglOq24UF5yFV+KcGZ/lmO7z9r7osY00YTxflwmy/lj/m9SnR6Evo9BMa2pakGX6HP
	1nsnuNE8ySQcUeO9pljP4zTP2do6Jao+DwT7nCG2ZlKhCM28n7+cFIQk/KBSHUcMKTPlJOCj9Cv
	g9IqmyiiZuPDA==
X-Received: by 2002:a05:6000:18ad:b0:452:a293:4d91 with SMTP id ffacd0b85a97d-45eb33551bemr3977862f8f.0.1779441346576;
        Fri, 22 May 2026 02:15:46 -0700 (PDT)
Message-ID: <cbbea642-8aa4-4437-9311-15d0ee0c853a@gmail.com>
Date: Fri, 22 May 2026 11:15:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/3] time: add "NOW() good" indicator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
 <38b28709-eddc-4dc7-9e8e-92db67d20ea7@suse.com>
 <fd31b3e1-1995-4cfd-840d-0d7c26765318@gmail.com>
 <55cbae35-702a-4176-9c2d-3d400c451a29@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <55cbae35-702a-4176-9c2d-3d400c451a29@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779441347-13979F3B-A03A0139/10/73395122804
X-purgate-type: spam
X-purgate-size: 2103
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,wdc.com,gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A50D45B0FA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/26 9:56 AM, Jan Beulich wrote:
> On 22.05.2026 09:46, Oleksii Kurochko wrote:
>>
>>
>> On 5/20/26 4:45 PM, Jan Beulich wrote:
>>> printk_start_of_line() checks for a value of 0 right now. In order to be
>>> able to have NOW() return at least monotonically increasing values, that
>>> needs replacing by an explicit indicator.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Arm and RISC-V may want to consider whether their initial get_cycles()
>>> can't be moved yet earlier, such that the indicator also can be set
>>> yet earlier.
>>> ---
>>
>> At least, for RISC-V ...
>>
>>> v3: New.
>>>
>>> --- a/xen/arch/arm/time.c
>>> +++ b/xen/arch/arm/time.c
>>> @@ -145,6 +145,7 @@ void __init preinit_xen_time(void)
>>>            panic("Timer: Cannot initialize platform timer\n");
>>>    
>>>        boot_count = get_cycles();
>>> +    NOW_good = true;
>>>    }
>>>    
>>>    static void __init init_dt_xen_time(void)
>>> --- a/xen/arch/riscv/time.c
>>> +++ b/xen/arch/riscv/time.c
>>> @@ -87,6 +87,7 @@ void __init preinit_xen_time(void)
>>>            panic("%s: ACPI isn't supported\n", __func__);
>>>    
>>>        boot_clock_cycles = get_cycles();
>>> +    NOW_good = true;
>>
>> ...  preinit_xen_time() call could be moved a little bit above just
>> after riscv_fill_hwcap() as it is using riscv_isa_extension_available()
>> inside.
>>
>> preinit_xen_time() could be splited so it can be moved just above
>> tasklet_subsys_init() after device tree is initialized but I don't think
>> there is to much sense for that.
>>
>>>    
>>>        /* set_xen_timer must have been set by sbi_init() already */
>>>        ASSERT(set_xen_timer);
>>
>> The ASSERT is harmless, but NOW_good could technically go after it.
> 
> "could" or do you perhaps even mean "should"? I'd like to keep the write
> next to that of boot_clock_cycles, but of course only if there's no
> dependency on set_xen_timer.

There is no dependency on set_xen_timer so feel free to keep the write 
next to that of boot_clock_cycles.

~ Oleksii

