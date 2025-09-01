Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC615B3E4E6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104783.1455821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4Z5-0000xh-GX; Mon, 01 Sep 2025 13:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104783.1455821; Mon, 01 Sep 2025 13:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4Z5-0000vC-Dp; Mon, 01 Sep 2025 13:27:19 +0000
Received: by outflank-mailman (input) for mailman id 1104783;
 Mon, 01 Sep 2025 13:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut4Z4-0000v4-1J
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:27:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60fee254-8737-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:27:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ceb830dd58so2339283f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:27:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d540843a2csm6651684f8f.22.2025.09.01.06.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:27:15 -0700 (PDT)
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
X-Inumbo-ID: 60fee254-8737-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756733236; x=1757338036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gvbf806z1YTJkAoFI2g50YQgUWKaxjjGYjfQIW29zBM=;
        b=JNpskKmmwsydl2qm78zoCZjRvB5B+2c2ZSY2/ZQx/Db5yiEC1MSqmDSaU+GerBw6OA
         xjr3eG+6XmMQt5+KfKKlLtGGrrCLeLwityJDQIZoUYOI8sYJosFiIfi/5zycNU1eXKd+
         9RfNFF0VsgWaW+DWq6w1rMI3cQ/4QMXLata+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756733236; x=1757338036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvbf806z1YTJkAoFI2g50YQgUWKaxjjGYjfQIW29zBM=;
        b=cBecyQBlwT/2UlqHbNmMcI/9A6lCxkbhjdY2kH2YTHu6q8LUU0WPCff1Aii8/87F00
         +61QuXc6r8a5lNvAFY7ZGFxa0Qj8gyPLbHhFIFiovsOyiI4Sm+GbaJAewzFohJqgAK8v
         4bjUEXHf+pYAyGtWnynD4SHb/+y7jug119nttSeJzfVGX6Opm5yJuOPeYzw9CrYgyfUR
         0t7fN+qNAJXMDTaxU6IfD4o2Z/h4tw2Gg4syU47ixS4SSPEtBbbBkTg72VDHmSNyqolU
         iD39sDmGjDVjWrDFd97Zb9gHot96CnugG3Vfl0gT32fOZE78gf/evbRjFEWy1NKasgku
         4Drw==
X-Forwarded-Encrypted: i=1; AJvYcCXor8tSqn4tj99HNlny6ZoELxtgplfpPXB1hhLnBK/eXMg0sCC86XVixRYsje7Shdeb549SqGSZs+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZswgb/BcMJ1bI+NtLdbOYWGYR9M+TxWw+ELdKXrzn+tG9S07m
	6zhSAcTtsz1rR77XslS2hLJZzd6yH4WDf1VyhTYGcWUFfumbeUy74DW8j54NCjnL5EU=
X-Gm-Gg: ASbGncskmbK/RJpZc70332oGu1SngEJD3UV2XuuvKzaiKdRjliCiRXA6XshByHsCI8v
	ReOGjkWCWpK3VOhMcoTBv6F1OMRFcR354WQsWEoLCT9IMz4FPj0OKwagCyQHM8p9p7NdUUJSjUg
	xQa9gL1prPkElw9vaz7m4/YUYeb3ehwOPdWU1fm4zZjbdlA3UfKwh8t8tPWzv/OiHkBmLcZbuMV
	IT8T1LmtGDDPLeS1gx9k3tpNBVHDAV9R59dKoIvtoe/Hh1M3sxl4AlXLyH6TJXq3BSIF1rEHeM/
	WhbRlFSLdhV5r0lQ3qlvHNvfgqwBfomcpNglWn846LoM/pDezNCZOsIoimb1i7yhtrsxTgYisnJ
	oZpmsmhvtkZKhVevs4YLje3g6UNCXhlSumVPUYijC/RJTt87VXwYs0TMS22YJRokrQqpBNy13mG
	Budu4=
X-Google-Smtp-Source: AGHT+IGmLZFJrWr+E43gbEu3gZNFrvKDiSGNPzx8rF4EupiVVwzmB4+zY4KjlkHTbAdX8WPlhlVWmw==
X-Received: by 2002:a05:6000:40dd:b0:3d4:13c4:af73 with SMTP id ffacd0b85a97d-3d413c4b319mr5518148f8f.12.1756733236366;
        Mon, 01 Sep 2025 06:27:16 -0700 (PDT)
Message-ID: <cd69d25d-0b0a-4436-a1b2-61695329a86d@citrix.com>
Date: Mon, 1 Sep 2025 14:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/23] x86/pv: Exception handling in FRED mode
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-21-andrew.cooper3@citrix.com>
 <1800ea68-eee1-4433-aa22-954dcd226fe5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1800ea68-eee1-4433-aa22-954dcd226fe5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/09/2025 1:57 pm, Jan Beulich wrote:
> On 28.08.2025 17:04, Andrew Cooper wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -2265,9 +2265,83 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>>  
>>  void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>>  {
>> +    struct fred_info *fi = cpu_regs_fred_info(regs);
>> +    uint8_t type = regs->fred_ss.type;
>> +    uint8_t vec = regs->fred_ss.vector;
>> +
>>      /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
>> -    regs->entry_vector = regs->fred_ss.vector;
>> +    regs->entry_vector = vec;
>> +
>> +    if ( !IS_ENABLED(CONFIG_PV) )
>> +        goto fatal;
>> +
>> +    /*
>> +     * First, handle the asynchronous or fatal events.  These are either
>> +     * unrelated to the interrupted context, or may not have valid context
>> +     * recorded, and all have special rules on how/whether to re-enable IRQs.
>> +     */
>> +    switch ( type )
>> +    {
>> +    case X86_ET_EXT_INTR:
>> +        return do_IRQ(regs);
>>  
>> +    case X86_ET_NMI:
>> +        return do_nmi(regs);
>> +
>> +    case X86_ET_HW_EXC:
>> +        switch ( vec )
>> +        {
>> +        case X86_EXC_DF: return do_double_fault(regs);
>> +        case X86_EXC_MC: return do_machine_check(regs);
> Looking at patch 21, I came to wonder where it is that we're moving back to
> SL0 in the #MC case (which may not be fatal), for ERETU to not fault.

(Almost) any event taken in Ring3 enters Ring0 at SL0, even those with
custom STK_LVLS configuration.

See 5.1.2 Determining the New Values for Stack Level, RSP, and SSP

Nested exceptions (i.e contributory fault) and #DF can end up at SL > 0
with a Ring 3 frame.  In principle you'd need to do recovery based on
regs->fred_ss.nested but Xen doesn't have any contributory exceptions
configured like this.

Under FRED, there are far fewer ways to take a contributory fault. 
Pagetable corruption for the entrypoint or stack, or hitting a stack
guard page.  Hitting the guard page will #DF; others will triple fault.

~Andrew

