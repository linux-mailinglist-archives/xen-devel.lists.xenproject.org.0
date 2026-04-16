Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMO2EDkC4WmJoQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:37:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F0410FF9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 17:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283704.1565850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOmG-0004kq-Nr; Thu, 16 Apr 2026 15:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283704.1565850; Thu, 16 Apr 2026 15:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDOmG-0004iC-L0; Thu, 16 Apr 2026 15:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1283704;
 Thu, 16 Apr 2026 15:37:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wDOmF-0004i6-1q
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:37:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDOmC-00Ehrf-T1
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 17:37:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e101ff-5cb7-0a2a0a5109dd-0a2a450aa70a-36
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:37:10 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e10226-56b3-0a2a450a0019-d1558034cd45-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 17:37:10 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso84592285e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 08:37:10 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3ebaaasm14957474f8f.32.2026.04.16.08.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 08:37:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776353830; x=1776958630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTgwX3DDhFAwJqj7/tnYaVWnU0P+NsU+BCjKucw75LE=;
        b=G1vNkH/Pc1XcNMEjt3ZmMGCRzsJIxtUn9+7Qk2In7uI6DJuXG3XwueYZ6qRPC2nOEN
         JEUTZB/LqGBg4BJC7dFtkwlW/7K2p4yCXrDkOYjb6rsXx/6e4rIX/mtSe7RgMU9pFk0U
         KwuebaUfq4vDEXtnXTNUJyExyNDlKyyCJA4X0E76zbnyPtEv/fceyT64fXkBu/xKnNTF
         T3fK4KrEbfRJwN2C9rg3iZpCkOs+4/8Zzr9eSnPwEguEQPFHuA+W7EA+DQ9Xr6DtaH70
         7B09OnoUevacy8Nu8byIBz8u4H4SZu5YqcSWvWkX9fBh250pUqhVVGQFly6rqbhoMFwO
         Qtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776353830; x=1776958630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTgwX3DDhFAwJqj7/tnYaVWnU0P+NsU+BCjKucw75LE=;
        b=f371nTaALDAQU89nAysDfr3pNGSLKuQAAb5zMqcRU+looYaS08YSPaMGPR/H0GmtDY
         /lTgdENRRlojcnNEkRjk2XZDfmxLNuo+pkOSvvwg9GDm/luivKuI9dAMxRiMJKrorDcl
         yRiU9+rBY5cdX2oqrN8DWPSvtESlbrbRyfveX790TRvVZiphGFFZm8iLqoRMIFoEkdVP
         1NLBY89DGqECbxiFy27kstlul1K/Ornx8Ulo5aTc/aUtWt9LxaKD311/TW3nJJHErdtX
         zv0DzP/1maeCB+ikJwnLFlTuG2DFgpQsHkcjUgthdOlcy3hcq3DHYXIPLQGO3hLiurL6
         Co9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9m6oO3xYiXyn+/Uib2i9xU2XN7dnCxICb0b0IMPhSdz7WCWSK+2irZfvbB3k9ve5OtyMiJ60vjMiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPl0WPZ0cAucRn8OpqBAgo4huUxjauLBXCT8d6keElT7jb5iqH
	uplnhVZNIHPQSmNy/qsA4icjDzOffN7NsKndvKv+xS6qt/AgmeYf/kKK
X-Gm-Gg: AeBDiev0egzVrvWiS5/9V9rEiF7FTD1rX9EXaEPK/zOoUnsvMg/ikD8saKaLnH6XHgk
	zI9YL82SNrnitk4TkyCPv4RZSzBfXYSPpLWKG0STCkpDIO6ubV73MSnZHWQ0c5m7zJ1WmjxilRC
	YO0iAfRRRALHmC31tR6r2RPXuqfPq2j0s0WXuz2YPXPbrfVV6UGINehzXJlOWYXFCUzQ+1QjDR5
	QtcpSnsRDj13XuKo7wX0USeLImP7W7hGwBpD37IxHPpvumUFDpGl6AvYUWrYlLgdMJaepqZrVL4
	YLb7H4Lx/0GbVLsaS1ilCLhwjuuCv4jdY/IHijed0XvWw+iSkTM5e8sqV1laYHoUJ8NkQtwqWqn
	KswBtOy1YLlNVN50HSSLJKbWmoPLZr6ZfnFJiQA+2mf4jV962pqcNoDFctwedWohJ1jma5EQ83T
	9b7nEjgNOXrvhcTqUAoa+Z8pQ78faXS1ia5SPjWFBaRpWkc6+U6LpYeXo/PxFlDhsGpTPdwR5Nl
	/sz4WghQhkXbQ==
X-Received: by 2002:a05:600c:8585:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-488d684bcb0mr275613335e9.14.1776353829604;
        Thu, 16 Apr 2026 08:37:09 -0700 (PDT)
Message-ID: <3c8cba0b-8d9c-4656-b70e-f5c65017aecc@gmail.com>
Date: Thu, 16 Apr 2026 17:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: allow Xen to use SSTC while hiding it from
 guests
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <eba232ac5a338332ddedc2cb084e0c04ee8744c2.1775835741.git.oleksii.kurochko@gmail.com>
 <9eb6c6d9-8e1c-40f6-a44b-579df213bda0@citrix.com>
 <feee06f0-584a-4b2c-b761-c3b77627c26d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <feee06f0-584a-4b2c-b761-c3b77627c26d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1776353830-47B7F8B7-7A702960/10/73395122804
X-purgate-type: spam
X-purgate-size: 1943
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,vates.tech,amd.com,xen.org,citrix.com,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A68F0410FF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 9:50 AM, Jan Beulich wrote:
> On 10.04.2026 19:41, Andrew Cooper wrote:
>> On 10/04/2026 4:45 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
>>> index 7efa76fdbcb1..80f0e9ddae6a 100644
>>> --- a/xen/arch/riscv/time.c
>>> +++ b/xen/arch/riscv/time.c
>>> @@ -91,4 +90,23 @@ void __init preinit_xen_time(void)
>>>           panic("%s: ACPI isn't supported\n", __func__);
>>>   
>>>       boot_clock_cycles = get_cycles();
>>> +
>>> +    /* set_xen_timer must have been set by sbi_init() already */
>>> +    ASSERT(set_xen_timer);
>>> +
>>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_sstc) )
>>> +    {
>>> +        set_xen_timer = sstc_set_xen_timer;
>>> +
>>> +        /*
>>> +         * A VS-timer interrupt becomes pending whenever the value of
>>> +         * (time + htimedelta) is greater than or equal to vstimecmp CSR.
>>> +         * Thereby to avoid spurious VS-timer irqs set vstimecmp CSR to
>>> +         * ULONG_MAX.
>>> +         */
>>> +        csr_write(CSR_VSTIMECMP, ULONG_MAX);
>>> +#ifdef CONFIG_RISCV_32
>>> +        csr_write(CSR_VSTIMECMPH, ULONG_MAX);
>>> +#endif
>>
>> You've got this pattern twice in this patch alone, and these aren't the
>> only CSRs which are formed of pairs to get a 64bit value in 32bit mode.
>>
>> Sadly, the numbering isn't consistent for the high constant, but we can
>> let the compiler do most of the hard work for us.
>>
>> #ifdef CONFIG_RISCV_32
>> # define __csr_write32h(csr, val) csr_write(csr ## H, (val) >> 32)
>> #else
>> # define __csr_write32h(csr, val) (void)(csr, val)
> 
> Just to mention: Since the comma is an operator here (not a lexical element
> separating function arguments), more parenthesization may be needed for
> Misra's sake.

I will define it in the next way:

# define __csr_write32h(csr, val) (void)((csr), (val))

Thanks


~ Oleksii

