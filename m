Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEyPG8BADGqqawUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:51:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D768557CDCA
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 12:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312753.1582848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPI2Q-0004rZ-HE; Tue, 19 May 2026 10:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312753.1582848; Tue, 19 May 2026 10:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPI2Q-0004pL-ES; Tue, 19 May 2026 10:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1312753;
 Tue, 19 May 2026 10:51:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPI2O-0004pF-Sx
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 10:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPI2O-00BcJb-92
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 12:51:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4083-bab6-0a2a0a5309dd-0a2a450bbbcc-48
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:51:00 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c4092-212f-0a2a450b0019-d155da2dec59-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 12:50:58 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-bd22b2abaa4so603913766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 03:50:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4eaef0asm689042466b.57.2026.05.19.03.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 03:50:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779187858; x=1779792658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=357u5AtE+LISrInibwhnX3322hlpE0n0mX1oKA00rAg=;
        b=qRCmboFetcqMIpTCkJ0GDUkVA5z/dasC0KVFiid5JKWQVCHHKGCDFz1jdYWCP3algp
         cRC9Oqk4Eh/MU+02+sFRFSqtQCFj67axo1begLzpEZOVExzHhaprlnhwo5DudxCWoZC/
         Y5nQSbLirhkTtw7O9XxpisMEmvkKZMht3XlmBpJyRZ4ePx6xeyRATRssoNtSN7oZKpDT
         sZZCP9khQwkd9HaXbDKLoMdeQrGduJV2sxorXEtgGNFyEloEzZ2aV4R++Rn4loM+cmfo
         bUyjj/IcQaSQLLJjVlIgpKA6jkFXz6ULIPJdD76mwX8Ip2g6sP+WrnnU6Kb63nuKzUMS
         sHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187858; x=1779792658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=357u5AtE+LISrInibwhnX3322hlpE0n0mX1oKA00rAg=;
        b=X+H2jzJdO7JBeHoxCGIq6aNiNY4Nyyqcs1Olqjtg8rfJ82wSOvIf1ehF1Qp2GMNRmT
         1KYyXSY/s5z7i651kBhW65Tp0+2D1RjZQHonG3fyiPLlvEYjohASTOhREAeuPQ90WoKV
         5NgABwh/tyBvup8xpssq7F21e3EVIosbkzthJQpNHpTUpI4/DqhpYrke3B+AEKDnuKti
         dtMszqwKTXIDOvloBbogC7sKon91TPVyDNZfZqp8xwGJf5UZkDhuo+z8iqwiYAbRTPNC
         C4VoQfMxkHsLVZeaOSE28TlpjamWhPLUSfPZryK8/SC5KJs9gNGErWhjHpJN6yK7Jydb
         Gilg==
X-Forwarded-Encrypted: i=1; AFNElJ9dYxKaR0dLZjjSS9HNjyAcaJY+19hTbUDQofxWDgFl4Ye8LljACHhUz4/xCnQHLa4XUe28GqfdaFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6WUT3wo3XkX5kjL6AdiWVtxeFuOVwYGCEq8QQNdQudAwitBeE
	XQeDAgRVZsojfRN7nscbau/fyMFbujZCqX8wquWPd0t04h76JiGCWFwR
X-Gm-Gg: Acq92OHj620a/8rk+Mq4nKym9d+esfQXbRJmdq61DLZBby8ojEPDEYtSjBDi1a1rf/b
	cKwVdBhX3zGqK+t0v1OXQJ9abbcofPE4GdJSkKpfpXig7BM6ETBODrKq9fH/cfDOQqNODIH8y1x
	L7+lqVibEb/tceiaPq4nAbcNnPBsBy2slXTLj05vp4AO7S8Sj9yQsF0eZz8eeVh/8Ag8Yi5xxjX
	vYU87pwr23LpHJ+sPfp4witBX9c+kWZA3z0GVqv8HFuiJdL2z35xIzSphaL+RIB22s1qb88aL1Z
	cTx36cCeAwVHvaq1kPbpJyKHTMBLpuXG1XXgHNV/qCxXH6Y3EwFUa1mzEuxALImJ/GZTtzicnUZ
	kmg/vLCH/e3CjwifOHzre+aOVqv5fPg6UluFpPFmqIHCRrp3pLM028PsgrfVPnIRhizH6vvqO1V
	jUdfzVEvRA0X8xHyxLKu7+a2QA7ro3PIyJ/T2b/Ntn6zjlsn5er3aI0MNSvx1ztXyB0S08OZISR
	GQ=
X-Received: by 2002:a17:907:c80e:b0:bd4:f814:dbbe with SMTP id a640c23a62f3a-bd517814c55mr1076011966b.19.1779187857278;
        Tue, 19 May 2026 03:50:57 -0700 (PDT)
Message-ID: <5c348320-099e-4511-842b-4d352d641c10@gmail.com>
Date: Tue, 19 May 2026 12:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: fix switch_stack_and_jump()
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <1ac102874c8f7190ea09787a035692b03e4b46cf.1779179301.git.oleksii.kurochko@gmail.com>
 <5f8850b7-11db-4d78-8353-6e0580bd397b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5f8850b7-11db-4d78-8353-6e0580bd397b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779187858-1B374F3B-101629EC/10/73395122804
X-purgate-type: spam
X-purgate-size: 3070
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D768557CDCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 11:28 AM, Jan Beulich wrote:
> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>> The following compilation issue occurs when UBSAN related stuff is enabled:
>> prelink.o: in function `smp_processor_id':
>>    /build/xen/./arch/riscv/include/asm/current.h:46:(.init.text+0x274e2):
>>    relocation truncated to fit: R_RISCV_JAL against `init_done'
>> make[2]: *** [arch/riscv/Makefile:45: xen-syms] Error 1
> 
> There's no init_done() as of yet.

It was found based on downstream version of RISC-V port.

> 
>> The switch_stack_and_jump macro uses "j " #fn which assembles to
>> JAL x0, init_done is a RISC-V J-type instruction with only ±1MB range.
>>
>> Without UBSAN, .init.text is small enough that init_done (which lives in
>> .text, not .init.text) is within 1MB of the JAL. With UBSAN enabled, all
>> the instrumentation calls bloat .init.text well past 1MB, so init_done
>> is now >1MB away from the JAL. The linker tries to truncate the 20-bit
>> J-type offset and fails.
> 
> .init.text is well below 64k right now. Are you telling us that it grows
> by more than a factor of 16 when UBSAN is enabled? IOW while the change
> may indeed be needed, I question this explanation. .text growth may matter
> as well, and e.g. .rodata (living between both sections) might also grow.

No, it won't grow so much.

With UBSAN enabled:

$ objdump -h xen/prelink.o

xen/prelink.o:     file format elf64-little

Sections:
Idx Name          Size      VMA               LMA               File off
   0 .text         0011c79e  0000000000000000  0000000000000000  00000040
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   1 .init.text    000285fe  0000000000000000  0000000000000000  0011c7de
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE

With UBSAN, .text itself is 0x11c79e ≈ 1.11 MiB — already exceeding the 
JAL range on its own. Even if .init.text directly followed .text (which 
it doesn't), a call from .init.text to a symbol near the start of .text 
would be ~1.11 MiB away. init_done likely sits somewhere specific within 
.text rather than at its very end, but add the .rodata + .data sections 
on top and the gap is comfortably past ±1 MiB.

As a result, the target symbol init_done may end up outside the range 
supported by the R_RISCV_JAL relocation, which is limited to 
approximately ±1 MiB.

Without UBSAN enabled:

xen/prelink.o:     file format elf64-little

Sections:
Idx Name          Size      VMA               LMA               File off
   0 .text         00044618  0000000000000000  0000000000000000  00000040
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   1 .init.text    00012c72  0000000000000000  0000000000000000  00044658
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE

Does it make sense now? I can use the text above for commit message 
instead of what is mentioned now for more accuracy.

Would it be better to send this patch when this issue will occur in 
upstream?

~ Oleksii

