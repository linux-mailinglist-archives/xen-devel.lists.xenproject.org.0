Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNTcMkKRe2nOGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:56:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3284CB2866
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216897.1526810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVJY-0002oT-Dv; Thu, 29 Jan 2026 16:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216897.1526810; Thu, 29 Jan 2026 16:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVJY-0002mA-Ai; Thu, 29 Jan 2026 16:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1216897;
 Thu, 29 Jan 2026 16:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1BJ=AC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vlVJW-0002k4-QU
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:56:14 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6af950de-fd33-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 17:56:13 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806d23e9f1so13832465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:56:13 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce56068sm132750625e9.13.2026.01.29.08.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:56:11 -0800 (PST)
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
X-Inumbo-ID: 6af950de-fd33-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769705772; x=1770310572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cub1RFwZp6v1FzV2qW+f32eURjkoUCqrv9MbmlN/GXQ=;
        b=eJuUDy03s9nD3x05UafWruG5im+JOxJmm3HVLwGUGgbI4SwDgcDa9S1+00pTZZE6oW
         BGO3nlDrNATWGzENenBhZrOYqDCakc88RkVgrZRGccujJWGldqv2zG+oCh1zSwa+iwRT
         olE4L2c9o7fBAwfDvnAM1FUhBN4TUtJ4LuHDjV9PQGaqrpqrFnYfxkPkIAe2j6NlC9pY
         lB0BV/ljqW3EMf5JH+J+o297MWh7pgQrS+QCmvvru/9VO54ljoT6WK9hl3Sip+42KIoa
         zAAQo5QThXrlFrulW+kbuQtxPwlVB3mEmpC2rFE5z0ctSx+zwas6bUdlXmJyXAqmSG5p
         ZTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705772; x=1770310572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cub1RFwZp6v1FzV2qW+f32eURjkoUCqrv9MbmlN/GXQ=;
        b=OYTd+0qxixyeYH/Yp6XGiZzfkV6N57q71y/RLe5yE0XG4PwzNKrYLVupbuv8hhf1aS
         ZJ+h/p2kZ3GHpcb3d/BdNgm9S3Etge9CJmsywwy3HwKsrKlWNDO+oTEC9mD64KNWHR6x
         oQRKyLwlOCJkDZ9vor1Le7c6vkHqVPCDRUxbJmu6zkRn/y1ZvMKkSxX0RFR+vNf8YnqW
         oJF/HO2yCKLn/kzRtwyDN1i9GYlkw4o77asjgf+KdnFpssZR2n2GpMzStIVI8+Zb92oI
         Goq7Lzo6gxbCnsuSz08fXU2lOgC6bRQHXKyXh6MaLPYJUntcIAmXBJl+KGgpTxGBdjOu
         hR6g==
X-Forwarded-Encrypted: i=1; AJvYcCVcqIeVcBeqybHsDKEMVoKqS0WEIsthAL8Crf+NDmtJq2d5WJgsM4iNttL8qY4cP2sO23Keb1cikPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBeaQ5ET5H/OQsXeljibpy8kmfaVFJa/EwycFgoecGJ8a90dAk
	mesATM6sVpRhWvcATyRmHB1URVf10n6ZEp6qlZ34G9w0VGrLtRjFgY0X
X-Gm-Gg: AZuq6aJoS+M6uoc3CsJdzvtKYWJaLMou57z3rxgTQmK8/QqF/6cmmk4yatM/Byh4Whc
	DmU+i/YJHJ9gYX5jkI9/KR2bH72zuhB6iA3qzhPZVHIHmlsBegws1Ws7fZmJ0ynJbGTYocJQuRC
	bppUl5BKh8QL96Zq6onaZVVSJdKbBi8O4C0Wtu3yidsLZDNNLfUL4VGDrE4kcAcS0BAqN0fk628
	RcGdaYUwlE3sKelq9MCvWUMRADB6xPimfEB8UCpvhsUCobuK/N3K7lgCmmlQyXrz55WoH1h3xgF
	ibu5Nh02Tc6CdfCOWza+eFxKNZfkkMphEvdCDPQYerCtYhUqx9X/il4TkkLtVKqEfhrVJtRQdSU
	ifsCl9Nnkxjfs6iYncPKgRoqZonZHq6MCXIHHzSD3Y7xxRD2GspglWoOeVv79DqlRuMm0NmP1mE
	FnnvzOjILajYPiCHR211HD9tGYtF1gRq123boWq+PX/CADid3czKm54USvz81xHC8=
X-Received: by 2002:a05:600c:154f:b0:47e:e2ec:9960 with SMTP id 5b1f17b1804b1-48069c9a68amr147957075e9.35.1769705772178;
        Thu, 29 Jan 2026 08:56:12 -0800 (PST)
Message-ID: <d9142fd1-97db-41f7-8559-ecfc6bc68565@gmail.com>
Date: Thu, 29 Jan 2026 17:56:11 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3b2a9dbe-fa14-43a3-a7c3-a4c1396a5c70@suse.com>
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3284CB2866
X-Rspamd-Action: no action


On 1/29/26 4:43 PM, Jan Beulich wrote:
> On 29.01.2026 15:40, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -196,6 +196,7 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>           {
>>               /* Handle interrupt */
>>               unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
>> +            bool intr_handled = true;
> Of course I don't know what your further plans are here, so maybe doing
> it this way really is desirable. As the code is right now, I wonder if
> you couldn't make this a 2-line change, ...
>
>> @@ -204,10 +205,12 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>                   break;
> ... using return here and ...
>
>>               default:
>> +                intr_handled = false;
>>                   break;
>>               }
>>   
>> -            break;
>> +            if ( intr_handled )
>> +                break;
> ... simply dropping this break altogether.

Well, your change is better but it won't apply to my current code of do_trap():
     ....
     default:
         if ( cause & CAUSE_IRQ_FLAG )
         {
             /* Handle interrupt */
             unsigned long icause = cause & ~CAUSE_IRQ_FLAG;
             bool intr_handled = true;

             switch ( icause )
             {
             case IRQ_S_EXT:
                 intc_handle_external_irqs(cpu_regs);
                 break;
             ...
             default:
                 intr_handled = false;
                 break;
             }

             if ( intr_handled )
                 break;
         }

         do_unexpected_trap(cpu_regs);
         break;
     }

     if ( cpu_regs->hstatus & HSTATUS_SPV )
         check_for_pcpu_work();
}

So if to use return instead of break here, I will miss the call of check_for_pcpu_work()
which is syncing interrupt and check if some softirq should be done:

static void check_for_pcpu_work(void)
{
     ASSERT(!local_irq_is_enabled());

     while ( softirq_pending(smp_processor_id()) )
     {
         local_irq_enable();
         do_softirq();
         local_irq_disable();
     }

     vcpu_flush_interrupts(current);

     vcpu_sync_interrupts(current);
}

~ Oleksii


