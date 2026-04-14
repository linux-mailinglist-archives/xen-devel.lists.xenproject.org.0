Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KLxITIo3mmSoQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:42:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6E3F9815
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281653.1564498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCc9r-0000R1-OJ; Tue, 14 Apr 2026 11:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281653.1564498; Tue, 14 Apr 2026 11:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCc9r-0000OB-Lb; Tue, 14 Apr 2026 11:42:19 +0000
Received: by outflank-mailman (input) for mailman id 1281653;
 Tue, 14 Apr 2026 11:42:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCc9q-0000O5-Pb
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:42:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCc9q-00AwR9-1m
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:42:18 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de280f-5cb7-0a2a0a5109dd-0a2a450ce60a-24
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:42:17 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de2819-f40c-0a2a450c0019-d155802bec47-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:42:17 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso91071905e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 04:42:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5cf2e70sm202909035e9.0.2026.04.14.04.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 04:42:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776166937; x=1776771737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUP8Sn5b+QdkF//PtXNqcRDDdQzwJmQqArPusk2Q4ZA=;
        b=PanHo9F0BGgQJfnpk654MGXvA4++6jYeWN1Ia9KUsvL1mGfBqfsIGIa6H+FWnJsD/s
         QuaSvx7CmrW5xurD0InU8S4Ba1ZM6rPqGCVNR/DwcQAACs/Cs7vafK6cD/9A4ILcMEWS
         bOiZ+sEPzmNaWK/6ykjeLu6of5FhsDdkY7SXy4beReQKkgLM4ntxFSBMYmp+gLvZcxtF
         M8MARLSoPqunwp7pA6lp14MMb5rvjdNHivO29Vm5zb+dJtd7MVQRlsKvKXL/qo5Qm7Fs
         p/laOrIbU3TjJ7FaejPfya6Qfki0IWew6WAYDWXprUcNigqv11nP86UtqNCZqxPiSfFD
         3efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166937; x=1776771737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUP8Sn5b+QdkF//PtXNqcRDDdQzwJmQqArPusk2Q4ZA=;
        b=qXgbIZPj6EfdZ9cM5t0qbCZiNGmZ9cEUhFE8YL4D0cp+iREFwQy0K81cjgPwLu9z9N
         3E6WIMVeVH0JFz9dU0InB8iMottG4RZvpgwKkxWMBF9xwYfPLsdPkY0iZ3sg0lE66Lfi
         ZlSl2JmQSnGZ3naOnC7GO5k9j2fkr19IY2d0R8Ozzw1Jh3/qDnlRi67mW0LF8ueHqxW0
         FtvuGRxNcIfepBtUguIOlfXp6SEzjYFP0qK4gp7U5uyQCchLljzvOvvfkY0rFzEaHV+c
         /V5iCHTEe9LwQZ4ETWJXSEm7zXLBbcul+yImNA+a85JAdz8z5mbxMVDY/rlbaGa+xFMs
         05ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mtDG3OnYZC52lZF6yhSUSf3PfIHsppg2FdooXly3DoWzCF0IjlX842WoP2mzkQg4wT20s44gsAK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywfu2iwb1L/sjTf3x0ChFm0t6+Uav/A+TjC5eV4Icq7rvbJxE6N
	sOvIv3VE/Nin7sul+XLd0OWNw538N4RGeP0tG+OZxXQqP5LmAHl9v8pN
X-Gm-Gg: AeBDievqsE85wwuFqcFfgrOSElp6JTmk3ZGIeqk6A83dwkbyCrgmpQ2oicqGtGlpYfj
	+r5425AwsrfOhIkp3w09uULJpEl5uGZwiYQ31djvObBL3z1YnGLBZT8vDz67tXJwolJuZDMgtLh
	9YtQK3qSRe3qLVbId87PLgRLL1oZdHEn+DJiJB0rE0AIDiOUiJjp/jFyQtwdu1MT2AOXKFPgNcL
	QDo5AsCZ1+zK4in2za38O+MMbckHVh6gSoTVwKu4lkazaNZBKsYAmvR/UKDhIUoH6/Sc3QNk247
	fsw2lmkk9S32rZZ+9UWL9wM3vRLQ/MFM1MWyR/ElYUSLYZVMHUbobuXcv3elYpdVoSB8+6e48Kv
	ay9oyQBviCDxM1OtIpkw6Ch+apcTjY+pnQETsH0bkPCL8zcGm01AEw8n+O+bC+kzYhuJuj7g6IT
	pwuEx31Xh5GXczrDu1HiAmh/lXuvxcZIYoeXPKiZ/YlaugTiEXFEL4Cy94AVUoDkTG3EJl4DbWx
	9Xt5+oNd3rb5A==
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id 5b1f17b1804b1-488d67f0aa2mr211771925e9.12.1776166936568;
        Tue, 14 Apr 2026 04:42:16 -0700 (PDT)
Message-ID: <42b01875-e992-414a-84a7-3bc4e4aa16ef@gmail.com>
Date: Tue, 14 Apr 2026 13:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/27] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h.
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
 <2097fefb49fca36f641ddd7d7fb31e796a03619e.1773157782.git.oleksii.kurochko@gmail.com>
 <072c0f21-a223-46dd-8ea2-f3591c2fd547@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <072c0f21-a223-46dd-8ea2-f3591c2fd547@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776166937-83B44A3D-E7882E6A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2544
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F3A6E3F9815
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 2:51 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> These definitions are required for correct decoding of APLIC MMIO
>> accesses and target configuration, and will be used by both the
>> physical and virtual APLIC implementations.
>>
>> No functional change is intended by this patch; it only centralises
>> hardware definitions that were previously missing.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I can commit this as is (with my ack added), but I'd like you to consider
> again my remark elsewhere as to ...
> 
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -17,6 +17,11 @@
>>   
>>   #define APLIC_NUM_REGS 32
>>   
>> +#define APLIC_REG_OFFSET_MASK   0x3FFF
>> +#define APLIC_TARGET_IPRIO_MASK 0xFF
>> +#define APLIC_TARGET_GUEST_IDX_SHIFT 12
>> +#define APLIC_TARGET_EIID_MASK  0x7FF
>> +
>>   #define APLIC_DOMAINCFG_IE      BIT(8, U)
>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
>>   
>> @@ -27,6 +32,36 @@
>>   #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>>   #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>>   
>> +#define APLIC_DOMAINCFG         0x0000
>> +#define APLIC_SOURCECFG_BASE    0x0004
>> +#define APLIC_SOURCECFG_LAST    0x0FFC
>> +
>> +#define APLIC_SMSICFGADDR       0x1BC8
>> +#define APLIC_SMSICFGADDRH      0x1BCC
>> +
>> +#define APLIC_SETIP_BASE        0x1C00
>> +#define APLIC_SETIP_LAST        0x1C7C
>> +#define APLIC_SETIPNUM          0x1CDC
>> +
>> +#define APLIC_CLRIP_BASE        0x1D00
>> +#define APLIC_CLRIP_LAST        0x1D7C
>> +#define APLIC_CLRIPNUM          0x1DDC
>> +
>> +#define APLIC_SETIE_BASE        0x1E00
>> +#define APLIC_SETIE_LAST        0x1E7C
>> +#define APLIC_SETIENUM          0x1EDC
>> +
>> +#define APLIC_CLRIE_BASE        0x1F00
>> +#define APLIC_CLRIE_LAST        0x1F7C
>> +#define APLIC_CLRIENUM          0x1FDC
>> +
>> +#define APLIC_SETIPNUM_LE       0x2000
>> +
>> +#define APLIC_GENMSI            0x3000
>> +
>> +#define APLIC_TARGET_BASE       0x3004
>> +#define APLIC_TARGET_LAST       0x3FFC
> 
> ... the case of hex digits vs the need to have L (and hence U) suffixes in
> upper case for Misra's sake. Those suffixes are easier to spot as such when
> the hex digits use lower case. Then even for un-suffixed numbers lower case
> is preferable imo, for overall consistency.

I will switch to lower case.

~ Oleksii

