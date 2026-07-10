Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8EfdBXIVUWqj/AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:53:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E79173C652
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OTQtcmdj;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359581.1613087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDX8-0007lF-C9; Fri, 10 Jul 2026 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359581.1613087; Fri, 10 Jul 2026 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiDX8-0007iX-92; Fri, 10 Jul 2026 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1359581;
 Fri, 10 Jul 2026 15:52:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wiDX7-0007iR-0e
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:52:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiDX6-006tGO-4c
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:52:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a511549-5cb7-0a2a0a5109dd-0a2a4504a1c6-10
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:52:56 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a511558-b1e5-0a2a45040019-d155da2aed1c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:52:56 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c15cf78d1a2so142852366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 08:52:56 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15df03dccfsm319446766b.62.2026.07.10.08.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 08:52:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783698776; x=1784303576; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N3SjL0p2uguK5IJ2mOciRbpgXKMzn2xeLTzIps7SUvA=;
        b=OTQtcmdjW6srwmXmwpCEN7ClMzw9GjYcG0tBCRU7mWEcLOwEiUiHrGZkR7AClbGWxX
         0TYXZbj69juFOVia5G7OBGrnYQNtWh45DJga26yw5khaKU9w+jHhfed+irkeUgJFWgPZ
         V+uycfdbAOAuw4wZ1jJvycNAk0oFFFGaI9xbD32YDVSgV4Mr1DOXEYgkt+MVC28KFUSn
         Tb1UmV3uVc0LqrdX43ELHYgihAMKcMDlc0grk5afRw8C8UO+7WLxqY6jQYlGoszuiUvi
         FdMANMV0YddRX4Pp36T9SdaSLh8/gpLDcSq2/DpFk1MPemo3eyM4QrC/pEn2JRXyCG9w
         aTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698776; x=1784303576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3SjL0p2uguK5IJ2mOciRbpgXKMzn2xeLTzIps7SUvA=;
        b=IxGx/w8EFy4wBzcF2cUGCaiYDZfsXRGdW4wOCHWWVhUYKsWRlDRidgIv9g8izXWDPc
         4fBKm4sk0V5pSRU/72a6Xi/RrR0IgBNkK2zzRPE5o+bZJ+HA0V1SWS/u0DZIHMiWrIfZ
         y6fsQcsB5YnLoIM94hXY0qzzRjqTC+wS08fXy6JCvDB+N/FZHpD2RVGsrhZv8dsm/vcA
         erj2QQDNTstyUqRH09sc+EDSRnL7oMBjux1LFVEUX5DB70/liJ/mHn8Q3mt/uw3A+Uo6
         D5TEBVka5/fgvMzu6sN7HU/4b9/sqoUkOXsxS66mdfff/nxZL7xGhfAhnAIThVhDY6Yc
         3zig==
X-Forwarded-Encrypted: i=1; AHgh+RpEGagFSgLBzjff5aDI/pIjycEk9r2IxxcTuTAbyolXS8kcl5XVoQSCtrTZIsLTgMsmjVGUEUDGDqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqqWVY+ITdkW8O891CczlWwVP6aCo79GojHK1PZuNQsOfZMNBZ
	xefpDzIH8aEu5h7eNzohpoq0Kr8AP5gXqZSoEU57T8aqoScO5OshEbKw
X-Gm-Gg: AfdE7cneK5+Jwi6iDkmAotAU1MNTNL79RiNy+CgARXG1U6MaTWZQgjs4Y7kfLpkSYVS
	9MvnrjfX5ffR+mFyOy5OagexZQAviP14wk4P0BwDVskkRlzYk5K5ocNc4SEQDkQnlZxnnjb2H+8
	y2ZiA3TtsHT9h8x0DbbSmYKvd5cMLe+j3sX0rVWedF6aJty5mTBnAL8QoJyd8t7TceAX6H/9iOZ
	n22shb4M6689gjYBgq3dWGxDcuy64sECrdDkMKKk+58D09HP8TgmbCWkwB1WzsjtIRCCUZYCoxd
	a51EZvFHrohsP3lP99V9Gn95LK72UmhWT/Kua0HAXT/SJzDVQdI9I0G4aDxkD2knPq3bkd14ST+
	yXOeWxdxYXkZ73V7Emjf0AI/gIj7m5eMIzZoJ/SE9c2gye+eY+lU0eBbXdh6hwtG6C+Su1AZAf3
	ajAvZZSLj73aiZEzV/ICU9EwBdsMved8uiSdIXTaIpkg5sIsH7Y6lDcMDZfZjm3+012J8=
X-Received: by 2002:a17:906:341b:b0:bff:738c:7a64 with SMTP id a640c23a62f3a-c15ce0f2901mr379319966b.49.1783698775535;
        Fri, 10 Jul 2026 08:52:55 -0700 (PDT)
Message-ID: <69d18359-3fae-4618-b46a-ad52bcf1a027@gmail.com>
Date: Fri, 10 Jul 2026 17:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/26] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <1f51410c080599a5c80173398d9db837b8718356.1783331040.git.oleksii.kurochko@gmail.com>
 <6a4adfa7-ec9a-4cbd-a9e2-571293cbb1ed@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6a4adfa7-ec9a-4cbd-a9e2-571293cbb1ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1783698776-7EC54FE7-43F8C7DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2423
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E79173C652



On 7/9/26 5:39 PM, Jan Beulich wrote:
> On 06.07.2026 17:57, Oleksii Kurochko wrote:
>> At the current development stage, only domain vINTC init and deinit
>> operations are required, so implement those first.
>>
>> Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
>> MSI delivery mode selected as the current solution is exepcted to have
>> always IMSIC, and initialize vintc->ops.
> 
> How would domaincfg be initialized on real hardware? 

Xen will initialize that in aplic_init_hw_interrupts():
writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);

I can see that maybe
> firmware would have to set DM suitably (and you may mean to take firmware's
> role here). 

I don't think that firmware will do that (and OpenSBI for example 
doesn't do that). If firmware can do that we for sure want to control in 
Xen what is written to ->domaincfg.

> But isn't setting at least IE entirely the OSes responsibility?

At least, Linux setups ->domaincfg once at the boot time:

	/* Setup APLIC domaincfg register */
	val = readl(priv->regs + APLIC_DOMAINCFG);
	val |= APLIC_DOMAINCFG_IE;
	if (msi_mode)
		val |= APLIC_DOMAINCFG_DM;
	writel(val, priv->regs + APLIC_DOMAINCFG);
	if (readl(priv->regs + APLIC_DOMAINCFG) != val)
		dev_warn(priv->dev, "unable to write 0x%x in domaincfg\n", val);

And don't touch this register anymore, even for interrupt disablement it 
isn't used.

So Xen can just does once:
writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);

and then just properly handle access of a guest to domaincfg.

> 
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -15,6 +15,8 @@
>>   
>>   #include <asm/imsic.h>
>>   
>> +/* domaincfg bits 31:24 are read-only 0x80 */
>> +#define APLIC_DOMAINCFG_RO      (0x80U << 24)
> 
> Bit 7 is also documented as read-only 0. Wouldn't the comment better reflect
> that as well?

Not sure, bits 31:24 are read-only *0x80* but bit 7 is read-only *0*.

> 
>>   #define APLIC_DOMAINCFG_IE      BIT(8, U)
>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
> 
> Wouldn't you better spell out BE as well?

I can add:
   #define APLIC_DOMAINCFG_BE       BIT(0, U)

But it isn't used at the moment (Linux also defines it but never 
actually using it). Do you want still to add that now?

Thanks.

~ Oleksii

