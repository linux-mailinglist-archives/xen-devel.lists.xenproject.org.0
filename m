Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBECGXRo32mvSgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 12:29:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549B40348D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 12:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282253.1564880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCxUF-00028j-G7; Wed, 15 Apr 2026 10:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282253.1564880; Wed, 15 Apr 2026 10:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCxUF-00025v-Ca; Wed, 15 Apr 2026 10:28:47 +0000
Received: by outflank-mailman (input) for mailman id 1282253;
 Wed, 15 Apr 2026 10:28:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCxUD-00025W-RH
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 10:28:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCxUC-005mFT-Df
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 12:28:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df6856-e002-0a2a0a5209dd-0a2a45088a96-26
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 12:28:44 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69df685c-fab6-0a2a45080019-d155dd29b0c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 12:28:44 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cf8fe9c2aso4132735f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 03:28:44 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead33d65asm4199243f8f.4.2026.04.15.03.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 03:28:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776248924; x=1776853724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xv7hMJMSYEeaNFos14tIaoI9ze4huV8IS1cZ7kSzMfU=;
        b=tA/Qw/Auzo3fHPkDKXrmKsDChBLvNzVILm3HYIfkkeyihqsOcQgz0wgFgtWndrjaMK
         P4dSzMlP5ltoOnnoEw+7oRs/LK2T0UEqtQEYsCh4ZfjazaHVq6jhUipxv4uZERkywP+U
         6pAgip2m981QWzqL63fGpgbI3YUN0GfbzP2Qrlc+N5+JkKCKE0rav7spF+26KYf7qU/s
         uOtHDswCnHdZzK9Px74H8AwCM/+SPic/ZEe5aqO9efBYt6NZBvzWMUcbetdXse89MW4v
         ak2Waj9X7K6QUX/yCBNvIrDsVsmQjVJDY5n/qEAzuqdxNfOLjNdhxFmXfIRvO7q6xIfR
         lxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776248924; x=1776853724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv7hMJMSYEeaNFos14tIaoI9ze4huV8IS1cZ7kSzMfU=;
        b=K/phqf4OHQzoqXZjqBuXfF1jLb/MpIijOA2AGk08/OCE2WkacaN5S1oAzvFhpoiUVd
         y5RTnHIMm+cND05HlWvyGZItCQRarI/3nO1yG+W7x2R4cM9CzLCoEl9dAayWwUw8ygwv
         loe0FFc/QdJdcBpbdJ0vfN4UH7YbdrwMTflUUoHXtxqN7998J2CpBE8gd4facY0EkVb3
         sCYyoxyzfc+wkJ7J8doAiazUQDSRslv0iYBD4lFyHRUQ8hk99Qyem4D/uTFJSCK6QcPb
         4+i9S+tzz+WDz7ETilRZWkLBSz/Lxs7s82O/bJ1p1xZMMjI89xlqneVQcDTuxQV0lWfb
         HPpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8stzIcMBDIpHXDG5ax/9vs6et5Tzp4QHjZor1DtacA2NCCKr+NzsomnuTjoCelC+u9g80nCY0LlRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6G86GhSUs37IZ8KGp9Dm6vaIuzSfqUGhaMg5W/uitNMubjyIr
	UFtPSp9RZ/ZuZex8wiDV5SXm3M1s8t88vP5o81PCnM9MbKhG7Zv+dFyo
X-Gm-Gg: AeBDiet1hso11Bx8M758p1gK1hHrO2eXSXI6fsfUlG/z+jeIVCfluMBHTpPE0w3dOdL
	4jRBNS3Dp3+f7StSiiAiJIkW/FChA0nsqhU2kkHEXLaOGmCNVdXJWUxJ3OWkaVfqIc7VG6GRsXZ
	wdklAUQnHAJKbJ5y/0ZGSbeDwz2hginVVzUvp80ikSMoSBBIKvNDpzd2HhDUdmGV0Y1rk4tqKoA
	9rD8OOk7M0CGYhBzzDZx82fHs5cY6Q5D5jnpSp/4yJ+NOWKw7gLHbffgLUCQCHFLVjH/QRhNbjM
	YqzivArnG222HWcfK0cI7jTGh71DTwLf/A0W2NUHqUZPL4ukOKILJ9zbQSJujwIk4xch3IF3k0L
	9XuqDv/W4fevTQyekUyv1TIXvhQCKZX8yf7XXAvpuIt080WLkm8uZwW5pJDVaPMf1JJejDJTU4J
	4LV651raTBh94Iw5wbJJDwO1jDqCbgRFctPX87JOqNB/FV57puzYAEfc9YZdR/cpO/5ELN6q1XX
	S38VaOjU+IfhA==
X-Received: by 2002:a05:6000:2c06:b0:43c:f0c0:c571 with SMTP id ffacd0b85a97d-43d642c9401mr29784194f8f.47.1776248923535;
        Wed, 15 Apr 2026 03:28:43 -0700 (PDT)
Message-ID: <7032dd40-f1fe-4d34-b559-6f2eb853bf5b@gmail.com>
Date: Wed, 15 Apr 2026 12:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 27/27] xen/riscv: add initial dom0less infrastructure
 support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <a66c727d0b99b9de41f516e1304b1a70192c9392.1773157782.git.oleksii.kurochko@gmail.com>
 <79c69067-4771-40df-a52b-8b552cd92a00@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <79c69067-4771-40df-a52b-8b552cd92a00@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1776248924-F654F497-69CCCEED/10/73395122804
X-purgate-type: spam
X-purgate-size: 508
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1549B40348D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/26 4:11 PM, Jan Beulich wrote:
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -32,6 +32,8 @@
>>   #include <asm/traps.h>
>>   #include <asm/vsbi.h>
>>   
>> +domid_t max_init_domid = 0;
> The initializer isn't of much use, is it? Instead add __read_mostly, like
> Arm has it?

Then I expect it will fail to compile as setup.c should contain only 
__init data.

So the we have to remove or __read_mostly or put max_init_domid to 
different file.

~ Oleksii

