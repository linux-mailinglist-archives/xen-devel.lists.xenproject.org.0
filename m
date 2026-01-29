Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Cm0JPySe2nOGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:03:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD533B29B2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:03:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216912.1526830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVQf-00056q-Ai; Thu, 29 Jan 2026 17:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216912.1526830; Thu, 29 Jan 2026 17:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVQf-00053y-7t; Thu, 29 Jan 2026 17:03:37 +0000
Received: by outflank-mailman (input) for mailman id 1216912;
 Thu, 29 Jan 2026 17:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlVQd-00053q-Fw
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 17:03:35 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 717c047f-fd34-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 18:03:33 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so10159295e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 09:03:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm213120475e9.14.2026.01.29.09.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 09:03:32 -0800 (PST)
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
X-Inumbo-ID: 717c047f-fd34-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769706213; x=1770311013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vCcfHHmatJ4vGGgYGaUxRM+jo98CkzvCmhVWfzCg96w=;
        b=N8bLbcEqSMqQrFQX236aixYZ0uc4MbZZsfSSUopFtSQSTjpCSuSnpDKwexIxK7ko34
         Fy/e4izk45alMdcb9siZuyiDCMIAXjNCcUcJ+9E285rzx8VclQM/dUJRUq5uaBwzebe3
         JqHztE9RP2zFchy5Du8gIIwjmT1PC0qTbXG8XK4Tdf2VVigBb8k6yqRnOdW7viD0Dg4o
         riZkPXia2mhQez7L33dQ/bo32YFo7C/wFAYS7dHD+VUCnBT6/GlHXIknPoeKYadjsbjr
         m0SOyFwxlAiUxZVKil3Ya+7lWqpDwBrY/+fkfvG2orikMLuntsgNcOkHfTUKN4i0jvSx
         3c5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769706213; x=1770311013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCcfHHmatJ4vGGgYGaUxRM+jo98CkzvCmhVWfzCg96w=;
        b=l+Npk9E3WFV6fq98Czpr3kdwmAJq/TAUpWQkTSJv0fymEU/Y0llMTLacUV65bzBZY1
         FgqIbf0Y7xOEmRp0huqC9Cn64kPygyXIbl5R4rTeta4mvkgQMwjzAhklva736y5zOoGF
         VXH92cryOIg4tBp8fil8wcT3X8V5MVorePA8KNy+eawhFCnZ6z+M7fgtkD442Vj3qQEj
         RwQDU8Ds9WuhBCMGjewlCwVl08OvANIHgD78/3O/U1UBOsiiM9I4FKwTk6LudF7C6ev7
         mlzVCe84cLj2S40Ur+DYRrwRs7n7LS7FwngBcX9aY2w7btylcQUlVAzz2y1yGh+UAlOH
         3qyg==
X-Forwarded-Encrypted: i=1; AJvYcCUI3aXvRyUmTsA5qnc+xlqekVX46YB6uLcw2sEfN93HCOSdJFzXM0x1pM62rTCmm7nuMARnB9ac7GA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywag1TMmn0N94LTBAZ4OjsFBJ/S93QqRLAeuHyvAWERUUca8WcH
	cKcSjPNuJujA4yRU8RmHusa2/IVqDqDSuJDuIAeafEsyFLRkN0yZNBFvcE5Fvw3L4w==
X-Gm-Gg: AZuq6aIYHxizlJX7yOpj6PKR0HrCzijw6JUgg8RXBLMk/zalm8go9zIjEMHaqfEiQlE
	P8bbQQnboOZ7KH3qWEQQjCeC+Q+QxazXKQ9T1Zhi/u7uImh91MMtgL61heDPRjA7gcSyeOtxrqw
	ge5bnAQjfRkel0XJAylizEHGOl2n1vJNGnKxgEmejUf1ftibM6gZ2K2Tx157RblutYYtYUITVHl
	K6ukibe1k+5D4yJ+B0oscRogmIRXJ8Lpe2hT1I2VZuYph9Uvq58LqKeyO0oTmFqTEx1YvQ86dee
	edr7oPVcePZ/nHib93JHZns09zjQnFFpHq99bnd4uuccTsZaETMvu2GIzaf81ZCh2dTydnb30+W
	8911R3MZXGJNzYCn1TVPzA9TsPnk5vNFbINJE2p2s5tt9R8B4nm/VUrUOxIIKAgBNrvCVPwEdD1
	pFGonoZ+NCoZfyY4Tar+hT+7DEvAFIS2C2eUSAO0fr/De6c1/9LO2LI0c0y1AoYL5I1X25Y1FOh
	dw=
X-Received: by 2002:a05:600c:8b05:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-4808289fa19mr54506835e9.6.1769706212784;
        Thu, 29 Jan 2026 09:03:32 -0800 (PST)
Message-ID: <0d4f6079-1ce3-45a1-841b-4dbea29cd315@suse.com>
Date: Thu, 29 Jan 2026 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: route unhandled interrupts to
 do_unexpected_trap()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <d9142fd1-97db-41f7-8559-ecfc6bc68565@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD533B29B2
X-Rspamd-Action: no action

On 29.01.2026 17:56, Oleksii Kurochko wrote:
> 
> On 1/29/26 4:43 PM, Jan Beulich wrote:
>> On 29.01.2026 15:40, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -196,6 +196,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>>           {
>>>               /* Handle interrupt */
>>>               unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
>>> +            bool intr_handled = true;
>> Of course I don't know what your further plans are here, so maybe doing
>> it this way really is desirable. As the code is right now, I wonder if
>> you couldn't make this a 2-line change, ...
>>
>>> @@ -204,10 +205,12 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>>                   break;
>> ... using return here and ...
>>
>>>               default:
>>> +                intr_handled = false;
>>>                   break;
>>>               }
>>>   
>>> -            break;
>>> +            if ( intr_handled )
>>> +                break;
>> ... simply dropping this break altogether.
> 
> Well, your change is better but it won't apply to my current code of do_trap():
>      ....
>      default:
>          if ( cause & CAUSE_IRQ_FLAG )
>          {
>              /* Handle interrupt */
>              unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
>              bool intr_handled = true;
> 
>              switch ( icause )
>              {
>              case IRQ_S_EXT:
>                  intc_handle_external_irqs(cpu_regs);
>                  break;
>              ...
>              default:
>                  intr_handled = false;
>                  break;
>              }
> 
>              if ( intr_handled )
>                  break;
>          }
> 
>          do_unexpected_trap(cpu_regs);
>          break;
>      }
> 
>      if ( cpu_regs->hstatus & HSTATUS_SPV )
>          check_for_pcpu_work();
> }
> 
> So if to use return instead of break here, I will miss the call of check_for_pcpu_work()

Ah, I see. But how should I have known without the description saying anything
along these lines?

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

