Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EQc4BoGJMmqu1gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:48:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8F69943A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VDeXrMs1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340330.1601386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZokb-0006Gn-Ck; Wed, 17 Jun 2026 11:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340330.1601386; Wed, 17 Jun 2026 11:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZokb-0006EP-90; Wed, 17 Jun 2026 11:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1340330;
 Wed, 17 Jun 2026 11:48:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZokZ-0006Df-MK
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:48:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZokZ-003Rg8-2Z
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:48:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328968-e002-0a2a0a5209dd-0a2a4501a0a2-30
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:48:07 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328976-c1f2-0a2a45010019-d155802bc1ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:48:07 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so41138345e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:48:06 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97227sm160960075e9.13.2026.06.17.04.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:48:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781696886; x=1782301686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eq+2+Qy5sCsWgcJZvcJBmGuJA294xB2JXK4BFK0RFSQ=;
        b=VDeXrMs1qSZ5hATZCjaZFSPNAgbboIOuVDRaoLTW2tHd8HMbkCXZpYddQdckkCThgC
         sIPqYAa715kRCby85dgw3KBv48LsL1aIt4tiXFO/rIjDFDyQqc2Ko7vSul+gDVW+Z7XR
         FBujXVHPGUxo82+QPfLOUg0+6aerC9+56tIS0KqTw6QgTAsVS2V2/AK7V0Ll2XjBABBh
         TeHGcboULYHfLoygdILQLYoO9mN8wPrC23sDId3UZfGQtDOn59NQ0aw9Kz+N+1vcbmfO
         lMbIFhUkmnhZk2dE9E9qrwLZTlhwTTGEegHP7V+hb3weg3N+wxBXGFB+NKMJT3VNpQ41
         nv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781696886; x=1782301686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq+2+Qy5sCsWgcJZvcJBmGuJA294xB2JXK4BFK0RFSQ=;
        b=LhPuD2Bf2dMl4/r/WFM9Q+q/ZbnrbNFc7nWWaNuPNFTSjSG9l7Tf3/T+O2CYccIS2t
         iCctVoixyta9r3q4y7simT+Yd9I+AbUs8Nxw0SlNHCy8sTKkmAN5+PaoHndq7+rw4CqG
         w9+k0Hon3z71/2Sy5q9tVnwLkI7WiEWGC7rpctyEcAlqoLPw69DP2kYMV9DrZqAGmqxZ
         WGmo+Nn26XrYTodHXZ3iaHp3Is5rVf0HckFzqoCvEqDAXjjkRvilKSvcdWEi4V8A6oqp
         FsukflGo+bHd1rGhjj2bmpsfKcU0Ofcx+unoJ7S/l308ICPDS/Cj5qdfwp8VCu33gH9g
         dc3w==
X-Forwarded-Encrypted: i=1; AFNElJ/cgYtI6Rq3Dc8wYvV4iRjmnNIv1SgdSDVvfWwLFdpuUhi7Mdak4MIhMaBV2sQwq5V1fyw6IjTSRIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz3rcN2R4aekc6uZEYilzjK2HEDSYWxR959cYCj82Id1dPB0aR
	n1n7gd39Ia0sp7fQkF5SchLPJBQykHs1Kuyk4DeD8Vi5OpAaIKsqWpi/
X-Gm-Gg: Acq92OHh7wDzra0dSp32Pc6y+W+dIqymkWCQkUevafIPKYGQustAj62KkKTlhhw9yn2
	5BIhz6Hei91BUZc6jF6SZ+smLb693l6Zu9cAsukoGs7vNLayG92UjuSnFUkLsXcLVCeSfDg6hvI
	KZUULz2jNVh7U+ECgqN+GZWpU+Nl3hmwk9sgtbNesgOfFjVd1H3ZhEznDSXCqTiezPUlMGs3ObJ
	ZvTe+0gHSdWFv+XSJ3F8h0upwQPrbpl6q227gwf5JTGPpG4AfbeRtaFJiMaqoWWYpaz3ZhPNqqe
	SVlAwyd7u3u7P3HYzBMYkdTEh3RDdzF/fPy39rDmA2rfXAvqIOOa7G1cD2T+JILMKIKelCie/ep
	5Qw9z7Qq49m2KQz0T+PsVKfpHr36yKck8Vbl66yeotC0b5644P43U8yasVHWNpnUSYPq5k92tta
	BnZGGUpqguheiLCKpRFf4XQv2IoRE6YFh+5lKqeAeTpDxskRJZhZZ6NgDVIDp93+CF0tc=
X-Received: by 2002:a05:600c:820d:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-4923678873cmr11455645e9.7.1781696886072;
        Wed, 17 Jun 2026 04:48:06 -0700 (PDT)
Message-ID: <18835571-14e5-4ea6-812e-95ce4d67a607@gmail.com>
Date: Wed, 17 Jun 2026 13:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/riscv: Implement construct_domain()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <db630a8a003a1aa69e4edaf6d5f4994f18ac1354.1781693963.git.oleksii.kurochko@gmail.com>
 <cd91fa75-435b-4100-8932-99f3da5523a7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cd91fa75-435b-4100-8932-99f3da5523a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781696887-B735AFF4-15E7A8EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 2369
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96E8F69943A



On 6/17/26 1:26 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> Implement construct_domain() function for RISC-V, which performs initial setup
>> for the domain's first vCPU, loads the kernel, initrd, and device tree,
>> and sets up guest CPU registers for boot.
>>
>> It also creates additional vCPUs up to max_vcpus and assigns the device tree
>> address and boot cpuid in registers.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v3:
>>   - s/%d/%u for printing vCPU index in the failure message.
>>   - Drop dprintk() for successful vCPU creation.
> 
> My
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> was lost, however. One more remark:
> 
>> --- /dev/null
>> +++ b/xen/arch/riscv/domain-build.c
>> @@ -0,0 +1,50 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/fdt-domain-build.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/current.h>
>> +#include <asm/guest_access.h>
>> +
>> +int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    struct vcpu *v = d->vcpu[0];
>> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
>> +
>> +    BUG_ON(v->is_initialised);
>> +
>> +    /*
>> +     * At the moment *_load() don't return value and will just panic()
>> +     * inside.
>> +     * TODO: it will be good to change that.
>> +     */
>> +    kernel_load(kinfo);
>> +    initrd_load(kinfo, copy_to_guest_phys);
>> +    dtb_load(kinfo, copy_to_guest_phys);
>> +
>> +    regs->sepc = kinfo->entry;
>> +
>> +    /* Guest boot cpuid = 0 */
>> +    regs->a0 = 0;
>> +    regs->a1 = kinfo->dtb_paddr;
>> +
>> +    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
>> +    {
>> +        const struct vcpu *tmp_v = vcpu_create(d, i);
>> +
>> +        if ( !tmp_v )
>> +        {
>> +            printk("Failed to allocate %pd v%u\n", d, i);
> 
> If you dropped the blank before v%u, the output would match that of %pv
> (improving the chances of people actually spotting that the exact same
> thing is meant). Once again - can do the adjustment while committing,
> provided you agree (and provided earlier patches gain the necessary
> acks).

I will be happy with that.

Thanks.

~ Oleksii

