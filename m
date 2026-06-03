Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HVV7KNsNIGqsvAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:19:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09984636F89
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 13:19:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CLvLqrQ5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326083.1591522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjcp-0000DE-1K; Wed, 03 Jun 2026 11:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326083.1591522; Wed, 03 Jun 2026 11:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUjco-0000AP-M3; Wed, 03 Jun 2026 11:19:06 +0000
Received: by outflank-mailman (input) for mailman id 1326083;
 Wed, 03 Jun 2026 11:19:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wUjcn-0000AC-0q
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:19:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUjcm-00BdFk-6m
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:19:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a200d93-2eae-0a2a0a5409dd-0a2a4506b6d6-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:19:04 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6a200da7-7371-0a2a45060019-d155dd32b5ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 13:19:04 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-46019edc13dso987854f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 04:19:04 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35fb24sm7271390f8f.34.2026.06.03.04.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 04:19:02 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780485543; x=1781090343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LckAMRVgTPWOP0T/18ZXjsfLcefJdIk9KFGROLLEny0=;
        b=CLvLqrQ5uZm9YB/6x4gURAHy1LFomqmXpPYD+19LgsMypZn7qrJhV674OLh2plqprr
         +zXc1MOgn/6bCpRzrQzU3wPixQH8bhedSutEkjuSSocfqOSGVFErbm2e0mUoH/vhUYPn
         ZLR12sTDy1ImFYQpj7A0UjE5DHbFY8MDPn10Sto134Td5qxFLHCilOEQxVo4lssyE8Oq
         h2cvUiYouv3f05MtXDcl3WEW8bHfz0IaMevDk8+SNBNBeLLXQHc8vGWfcs0iZ90xVmj/
         ecjuS7GkwrBHTSglPXiO0bqje3TrYk2NzUVTZqrh0fnWLsggEaImH7ZfCQPAanAeZk/r
         zoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485543; x=1781090343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LckAMRVgTPWOP0T/18ZXjsfLcefJdIk9KFGROLLEny0=;
        b=jKUzEeCdZqvi+lF4DO4jdha7LihOfTR03Rv9rOBlw8KpigZs+Jkunc/ltGXlH/O/OK
         +pVRURMpfHjWZ1ymVcEn16yLBQPr762KTmbdi58L9s3Xk8idutqSbwHxzSbK3LIgxrgI
         kdZMJ8e5+myZot2zi3wmlsuB1WBWmemghp5kA1j1iaOJubHIF0liJ71TKQ8dswYJdwd/
         RhkFCJnU1oQmj8y1U2YeKMeZliJKCQQo5nlxrm1DnxRIH3LTPcSiqb/lCv1B4ZRl2dIt
         DywNP7mTSpM/uX8Anm0BjUThf5887I00Spw/XtlLZ5D2+R5qM5eKupOcnOURnh5h8JG2
         T5UA==
X-Forwarded-Encrypted: i=1; AFNElJ9TiQCsQB6O1RxnLEJ7hDJ1gKAfUEw3LYBkVqLrVhKiTiPWq2djuK5OjpNF2JgRpqDsw57tXgfHN9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyigLdiCfs1xsgqx19X+NjhtqmmAPOQG1ekPlFWc5PbBV9RBIZn
	cQ622BUcx+rPFuTRTl57vxZhyqDs6gmJcqR/zcXbX03BVqqa3EfwppEK
X-Gm-Gg: Acq92OH0M3JbHjlsF5o0x52JhFOvuFbK6zMAxydkTdP7EL3NJyaApHM7VFAryqBUplp
	o0bxyRgr+E0yEPdSX2YSilCb8ZRlyzvI9uNPiCuJQkcUUr2zZeWjvCzoFyOrF1jcBtIA7qupyW7
	nY6NpnTcQTTseU46kzqxH2dTVDjWy+KoZLwCj7r1EIRXV/yb/BX8T/gwhT+99yMc7b072wlU6x8
	hMO7XaapGd+GWXfB8TP9c5n9cgZtv5Q3UwYU6VWyWYLiM1pNW70I74buYQ0SYhxKolVpwmGdTw/
	bbzQrpP5sWWoCZQ7pakln/h9b99UDId2ySYSOTIXL1htMaKDLelj71yBZ6KcpO4a2+70c3X4FMC
	JgfOhV234auPHkRpbwLNxJ7iwQc7M/SsYmbOI/YSo5Vq85cjoVGhzBFeWIJFv8CzxqR2IJvIszT
	PMsXCDLKnzwlp4myTWft/ghuQQOVUYPzdpGo72F8dP5OLo3hI=
X-Received: by 2002:a05:6000:46da:b0:44a:247e:67b1 with SMTP id ffacd0b85a97d-460216bdebemr2950213f8f.5.1780485543375;
        Wed, 03 Jun 2026 04:19:03 -0700 (PDT)
Message-ID: <a2f1164d-ade6-4355-95da-f8c246613e9f@gmail.com>
Date: Wed, 3 Jun 2026 14:19:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 1/4] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1780485544-8D785D75-950D0D53/0/0
X-purgate-type: clean
X-purgate-size: 4094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09984636F89



On 5/28/26 03:25, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> gicv3_lpi_init_host_lpis() allocates host LPI state, including the
> host LPI lookup table, CPU notifier state and the boot CPU pending table.
> Those allocations use gicv3_its_get_memflags().
> 
> ITS workarounds are discovered from gicv3_its_init(), so allocating host
> LPI state from gicv3_dist_init() can happen before the memory restrictions
> required by the ITS are known. On affected systems this can leave
> Redistributor LPI state allocated and programmed with the default memory
> policy.
> 
> Move host LPI initialization after gicv3_its_init(), and only run it when
> a host ITS was found. The old call ignored the return value. Now that the
> call is made from gicv3_init(), check it and panic on failure because
> Redistributor LPI initialization relies on that state being available.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - Replace the v1 ITS pre-initialization hook with the less invasive
>    approach suggested during review: move the existing host LPI
>    initialization after gicv3_its_init().


Just for the context: The original review suggestion [1] was to consider 
splitting gicv3_lpi_init_host_lpis() and defer only the portions that 
depend on ITS quirks being known, specifically the allocation of the 
per-CPU pending table for the boot CPU (gicv3_lpi_allocate_pendtable), 
which is the actual consumer of gicv3_its_get_memflags(). But here, the 
whole gicv3_lpi_init_host_lpis() is moved, so the scope of the deferral 
is broader.

[1] 
https://patchew.org/Xen/cover.1774431310.git.mykola._5Fkvach@epam.com/a7732487959e777ff1de318cb28c588db69fbaa1.1774431311.git.mykola._5Fkvach@epam.com/

> - Check gicv3_lpi_init_host_lpis() and panic on failure, matching the fatal
>    nature of host LPI setup once ITS initialization succeeded.

So, this patch appears to fix two distinct issues:

- ordering issue (LPI init occurring before ITS quirks are known)
- unchecked return value from gicv3_lpi_init_host_lpis()

Should these warrant Fixes: tag(s)?


> ---
>   xen/arch/arm/gic-v3.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 17ff85ef5d..acdac22953 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -764,9 +764,6 @@ static void __init gicv3_dist_init(void)
>       type = readl_relaxed(GICD + GICD_TYPER);
>       nr_lines = 32 * ((type & GICD_TYPE_LINES) + 1);
>   
> -    if ( type & GICD_TYPE_LPIS )
> -        gicv3_lpi_init_host_lpis(GICD_TYPE_ID_BITS(type));
> -
>       /* Only 1020 interrupts are supported */
>       nr_lines = min(1020U, nr_lines);
>       gicv3_info.nr_lines = nr_lines;
> @@ -1990,6 +1987,17 @@ static int __init gicv3_init(void)
>           res = gicv3_its_init();
>           if ( res )
>               panic("GICv3: ITS: initialization failed: %d\n", res);
> +
> +        /*
> +         * Host LPI allocation uses ITS-derived memory attributes, so defer it
> +         * until after gicv3_its_init() has discovered ITS workarounds.
> +         */
> +        if ( gicv3_its_host_has_its() )

This looks like a behaviour change. The condition is narrowed from "GICD 
advertises LPI support" to "host ITS is present". As a result, on a 
system where GICD_TYPE_LPIS is set but no ITS is present, LPI-specific 
variables and data structures will no longer be initialized or 
allocated. If I am not mistaken, software-generated LPIs without ITS 
involvement are currently unsupported, so this change might be safe. 
However, I think the commit message should explicitly document this 
behaviour change and explain why it is safe.


> +        {
> +            res = gicv3_lpi_init_host_lpis(intid_bits);
> +            if ( res )
> +                panic("GICv3: LPI initialization failed: %d\n", res);
> +        }
>       }
>   
>       res = gicv3_cpu_init();


