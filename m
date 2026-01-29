Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLG8JC/De2k9IQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 21:29:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F5B43E3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 21:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217008.1526859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlYco-0004ry-Dg; Thu, 29 Jan 2026 20:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217008.1526859; Thu, 29 Jan 2026 20:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlYco-0004p0-B5; Thu, 29 Jan 2026 20:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1217008;
 Thu, 29 Jan 2026 20:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1BJ=AC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vlYcm-0004ou-Qk
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 20:28:20 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c30627a-fd51-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 21:28:18 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806f80cac9so8795565e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 12:28:18 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce56068sm143099505e9.13.2026.01.29.12.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 12:28:17 -0800 (PST)
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
X-Inumbo-ID: 0c30627a-fd51-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769718498; x=1770323298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=saCq/Yzes5VXl76F58dkLElaB5R3og0823+IoM8YGVQ=;
        b=iGDjsjcsMCpvQF7HcIMdJM4dVIcQ5zAbbW3I0fAxpPz+bpezg/E1bYSWE6CJH2u1jo
         kPQrVNCZhqzTiixdJVUZBe6s47LfiN9KYyGwmX5u4IFwfpU6U+IwnvPEyTKZzI9dSVP2
         7qqFRpobi0ibpkcdQdU6pIzJI1XwQ/IzD3CD1gZThED1BTtK2TxwYnDvhZXQP4lJrmIT
         m+IOnQTBFzx5achdESyLJKhy+9n+lEZHTPqZAerhQQyqBr7+hmFyWxlwgUgzOhH7DVY6
         cMDCw3loKCGpCX4ehZZgsTOMrwsCtQy0zJg8KDorAxxiiEevObeMjgeSmtjMHNoItFmB
         TJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769718498; x=1770323298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saCq/Yzes5VXl76F58dkLElaB5R3og0823+IoM8YGVQ=;
        b=K6K6QhmMcMxUxu24Ixpbu98/4Q/oouFX9rCzvv+ytxL9sA2rkFUbVSpp78xOTbS1mL
         +S/7Cq19WlG7whZAJWILsbAgbE8QtRs4kOf2YYMMeajg887MhlG54F/ZuK/brsY815oN
         bry/C8SoneAi7WsgpYZ+wecvOlRd8iKpgSjozr2CP84Hu4n00EC9pcZkBUuS/W0TpFZM
         TLKbBaopuoMyHxHP4HnTcAa3eQ88alsv/ugV79/+wj/TRQiHyPJxuxRyMzMe47Kho44F
         hxZ1nj/+UjYQtWdESZCl4kvXbJNJ0s/IYCdnKjJ0FgjlTzV4228L0imrfSoyiPMMshKa
         Spuw==
X-Forwarded-Encrypted: i=1; AJvYcCUuH0/8iAP1rJtpOFMcKjuTsQUTKKKE7e1MuuvwdJ3FjclnmAULIMcsWEiWKLw3kBUZ5OeGE5b8ioU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6w1WoC4kAt9Pzd0oJI4yl4ZIAYoMpwqpEe/YBG9GwQzfhOUBi
	TtM+7yOHMBYHiFaXfyCUAixPZXJxS/mLOxlsD+yTYjgHEEf+Lq574dn8
X-Gm-Gg: AZuq6aKqi2+dV3HtrzVy6WU1e7nSy1HKPANWH8nZmalmLXOR1xPIbNBytyq9RZDTekt
	YNgmmCkpMw48BiVW92Ad5b65T8Y+g5HYDlwMVDprgRpKlrickYo52cUXDo2OthOeYzr3vp1UfhV
	qDbZy3ecxjhxPB9EIkAVgQ5c/dF1ReTJVqlVNzq5NQ+YWc1dUya5BSlemh9NupMBh9I2WFDewI8
	GwoTclGmbGAj9ACIKUCfWcNWsw03VC2v7xFdbmH1lXazZJNm/hRp5I1L6rZSZslye85hRNEqVj6
	zjJymJJS8SPHAkG1C9K1OF2KgzlKUdpQBafQp9UZYa4/y7RnDptMlCsJuL83MA6eldLbMRQjg6i
	l0mxccqflr6SzJ/2HUlN6819eIo9AdkH+UpYnF1z3XegRcxL3GSjcsEGU/UlvY7e/dRBMHRrAZJ
	jjM47Zz2q7ys8dpF09kCIlJp4KNbHuM3Uz53nnIjEDrCzXb3w3sPYjz69kyzlI+G0=
X-Received: by 2002:a05:600c:348b:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-482db4d826dmr3898415e9.23.1769718497908;
        Thu, 29 Jan 2026 12:28:17 -0800 (PST)
Message-ID: <9ce6f636-3b75-4ccb-b5c5-d6a0fac30897@gmail.com>
Date: Thu, 29 Jan 2026 21:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: route unhandled interrupts to
 do_unexpected_trap()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <f6d0cc1a6d960acf96d0f43813bfe6a62ca9a041.1769697450.git.oleksii.kurochko@gmail.com>
 <3b2a9dbe-fa14-43a3-a7c3-a4c1396a5c70@suse.com>
 <d9142fd1-97db-41f7-8559-ecfc6bc68565@gmail.com>
 <0d4f6079-1ce3-45a1-841b-4dbea29cd315@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0d4f6079-1ce3-45a1-841b-4dbea29cd315@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EC4F5B43E3
X-Rspamd-Action: no action


On 1/29/26 6:03 PM, Jan Beulich wrote:
> On 29.01.2026 17:56, Oleksii Kurochko wrote:
>> On 1/29/26 4:43 PM, Jan Beulich wrote:
>>> On 29.01.2026 15:40, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/traps.c
>>>> +++ b/xen/arch/riscv/traps.c
>>>> @@ -196,6 +196,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>>>            {
>>>>                /* Handle interrupt */
>>>>                unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
>>>> +            bool intr_handled = true;
>>> Of course I don't know what your further plans are here, so maybe doing
>>> it this way really is desirable. As the code is right now, I wonder if
>>> you couldn't make this a 2-line change, ...
>>>
>>>> @@ -204,10 +205,12 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>>>                    break;
>>> ... using return here and ...
>>>
>>>>                default:
>>>> +                intr_handled = false;
>>>>                    break;
>>>>                }
>>>>    
>>>> -            break;
>>>> +            if ( intr_handled )
>>>> +                break;
>>> ... simply dropping this break altogether.
>> Well, your change is better but it won't apply to my current code of do_trap():
>>       ....
>>       default:
>>           if ( cause & CAUSE_IRQ_FLAG )
>>           {
>>               /* Handle interrupt */
>>               unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
>>               bool intr_handled = true;
>>
>>               switch ( icause )
>>               {
>>               case IRQ_S_EXT:
>>                   intc_handle_external_irqs(cpu_regs);
>>                   break;
>>               ...
>>               default:
>>                   intr_handled = false;
>>                   break;
>>               }
>>
>>               if ( intr_handled )
>>                   break;
>>           }
>>
>>           do_unexpected_trap(cpu_regs);
>>           break;
>>       }
>>
>>       if ( cpu_regs->hstatus & HSTATUS_SPV )
>>           check_for_pcpu_work();
>> }
>>
>> So if to use return instead of break here, I will miss the call of check_for_pcpu_work()
> Ah, I see. But how should I have known without the description saying anything
> along these lines?

Of course, without proper description it was impossible to understand that.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii


