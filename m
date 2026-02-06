Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LzONMQYhmktJwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:37:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131E100639
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223644.1531107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOpE-0000Cs-GC; Fri, 06 Feb 2026 16:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223644.1531107; Fri, 06 Feb 2026 16:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOpE-0000Am-DZ; Fri, 06 Feb 2026 16:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1223644;
 Fri, 06 Feb 2026 16:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RA+/=AK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1voOpC-0000Ag-E5
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:36:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a7f5404-037a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:36:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso21047305e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 08:36:52 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629754c62sm6410513f8f.38.2026.02.06.08.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 08:36:50 -0800 (PST)
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
X-Inumbo-ID: 0a7f5404-037a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770395811; x=1771000611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3iKjscCOfwDt9D3tqFrpxr7mrqRlHECUuBkOTLEFi14=;
        b=XyvzeglVqNEyeEIxI1Kn6htrcsjnzK/knDqAq0sqS1Tlg7zwjRIYbuHNmR11VyUud9
         wUvSatq/le2Z2H5+omF9SyG9K/CFu+nlGUU9BKbRl4QcfrS8qP26u2rstzPsvQZS2pGX
         H6vZzKnB6y1EbF5MZ4njy6ILmpplPKps3NJKwybo1R5w4WdB8qtQnH1UpTA5yutT/A5u
         WESCDpg8QeeNupMEavelwufDRKopquVJXi3RzuOm2catsfDP9JtoMGRmWNE246UkjuzS
         TU7EP9uZ72dJvKlIIZ2u4KYpRWvsrq+RNeP1/EnqcJOYYL/KH+1RfaV4xhx6iWfmlkBw
         fE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395811; x=1771000611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iKjscCOfwDt9D3tqFrpxr7mrqRlHECUuBkOTLEFi14=;
        b=OZrlEKJecx8Lux9Gr2gyuTiytWHIO5Ml43hmTArhgayUd68sFCABSWO8P6sfnbyVRt
         b/TXYRKDqRWirBXvEnE12zyMQ3KCjMAn6KHBJBxG2MekIZqRTqnivtdFvldX+WbXngsg
         oC6ji1UOdSIHfaVkz/TAQ13pab2Gf+2tgrhew1kyrRcez7A1C+LAckesMXS5XItPQp9G
         FW/CoBznTsmfYewTsac7efBGqOPJY3BGDNKla110Y61rHr0l7eY8nXHYKMsfrhA6lR6+
         mWApa2Bdh6V6KhXqFgEytytypnbGpjWEqtZL4BKjohA7J8nRJJsTjXcM8cNd3o5tsavX
         qG6Q==
X-Gm-Message-State: AOJu0YyiILGiZm1XNYQRATNC2W8j7pIOvTWHBDIhFKDegbpYdiGHsX4G
	q75TKG+ZjTb2Cncbp4vYLhFAYjyULKWyfiozMEZxqO2e5yMhSk7JFcorMTQdtA==
X-Gm-Gg: AZuq6aJtk1Tbv+fIAdzJPsr+C9We3N4oVCZ+jrzPYaRj2I2lEVPort5sG7tcu5dfK6x
	O9XEyxqLo0B2Ajc1zY9u5txPxJ5dtGzpPFE09fwkJag1TJgLOfbQOFvV/FQq3Ti5/5jOJX6JjJq
	4ateFLsEFbHSUdoRcncSeAqJbFLLfArZES9uI4UdNtSjF8F13D+Zq0xORH8X2UEEcGAMo6m979Q
	GMuzaQzBwaWkJyYse9YlBv0shF/bJL+yDac/q5PGvKIVnkYKvnh8/DAV1YKjSJgT5WJymsRod/X
	imt+Lj/yS8kFfcfu/uT7AY4YL3oeLig3l+omknA2IAmyxoJ52A0Z28ovJBsNq1ulbkahe2d8n8w
	t0RV0KV2mWA+jMICShre84caV0TE5mX0zCuYxxgHWaQzEzM8AlVrg/cNaPNxRml9anYvcjpWxb6
	rjw0xORXwb3ujb9xI+MbcSma5SXwZExt+Hdln42kTiNJZIL03IkAMur/wJHIVN7V0=
X-Received: by 2002:a05:600c:3b23:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4832021eae9mr49223655e9.28.1770395811199;
        Fri, 06 Feb 2026 08:36:51 -0800 (PST)
Message-ID: <14d19350-0de8-4496-99e5-0ba76e421684@gmail.com>
Date: Fri, 6 Feb 2026 17:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce vcpu_kick() implementation
To: xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <0335a7db0343d81ce4256482a464e7ba5df1c204.1769099885.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0335a7db0343d81ce4256482a464e7ba5df1c204.1769099885.git.oleksii.kurochko@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8131E100639
X-Rspamd-Action: no action


On 1/22/26 5:47 PM, Oleksii Kurochko wrote:
> Add a RISC-V implementation of vcpu_kick(), which unblocks the target
> vCPU and sends an event check IPI if the vCPU was running on another
> processor. This mirrors the behavior of Arm and enables proper vCPU
> wakeup handling on RISC-V.
>
> Remove the stub implementation from stubs.c, as it is now provided by
> arch/riscv/domain.c.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v2:
>   - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
> ---
>   xen/arch/riscv/domain.c | 14 ++++++++++++++
>   xen/arch/riscv/stubs.c  |  5 -----
>   2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index e38c0db62cac..13ac384c4b76 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -1,8 +1,10 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <xen/cpumask.h>
>   #include <xen/init.h>
>   #include <xen/mm.h>
>   #include <xen/sched.h>
> +#include <xen/smp.h>
>   #include <xen/vmap.h>
>   
>   #include <asm/bitops.h>
> @@ -240,3 +242,15 @@ void vcpu_sync_interrupts(struct vcpu *v)
>   #   error "Update vsieh"
>   #endif
>   }
> +
> +void vcpu_kick(struct vcpu *v)
> +{
> +    bool running = v->is_running;
> +
> +    vcpu_unblock(v);
> +    if ( running && v != current )
> +    {
> +        perfc_incr(vcpu_kick);

Because of this it is needed to introduce:
   PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
Otherwise randconfig build will fail when CONFIG_PERF_COUNTERS=y.

I would like to ask if it would be okay to add it xen/include/xen/perfc_defn.h
just after PERFCOUNTER(need_flush_tlb_flush,...) or would it be better to have
it in arch specific perfc_defn.h?

~ Oleksii


