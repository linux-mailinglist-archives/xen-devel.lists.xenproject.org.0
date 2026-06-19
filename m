Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GjLvAgazNWqe3QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 23:22:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A596A7CB1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 23:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xen.org header.s=20200302mail header.b=NMqThLVd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none
Received: from list by lists.xenproject.org with outflank-mailman.1342673.1602708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wagf5-00021d-Eb; Fri, 19 Jun 2026 21:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342673.1602708; Fri, 19 Jun 2026 21:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wagf5-0001zz-Bs; Fri, 19 Jun 2026 21:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1342673;
 Fri, 19 Jun 2026 21:22:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wagf4-0001zl-4y
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 21:22:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wagf2-00HVe1-3B;
 Fri, 19 Jun 2026 21:22:00 +0000
Received: from [2a02:8012:3a1:0:28f2:e98a:6c7b:919d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wagf2-00BQ2E-0d;
 Fri, 19 Jun 2026 21:22:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=c6sIMlca3V/okLMgC2C6vwZbW/0Lhm9j7qDHHyT/EAw=; b=NMqThLVd2FQZr+1zmowU+uzO/j
	YhGl/MbenyiTK2BaHlJQLoTqE+X+aBXAf4wX5/+qoD8m8reTcI8EDNV9NxzMjQyk0Eyele/Ml1QAU
	c4idjDamcPBiFtEiut7NY5GYRX4kitCM4k+cqj/JZ5GDlnRqPR7AZFlH9MFbFuTNzjso=;
Message-ID: <48303694-604c-411b-8ea9-0bf648902337@xen.org>
Date: Fri, 19 Jun 2026 22:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.23] Add GICv3 SGI boot/self tests in Xen
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid,xen.org:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[xen.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2A596A7CB1

Hi again,

On 29/05/2026 18:09, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
> new file mode 100644
> index 0000000000..ca922e5d2a
> --- /dev/null
> +++ b/xen/arch/arm/gic-test.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/delay.h>

I think this header is also unecessary.

> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/shutdown.h>
> +#include <asm/gic.h>

[...]

> +static int __init gic_self_sgi_test(void)
> +{
> +    if ( !gic_test )
> +        return 0;
> +
> +    printk("Sending GIC_SGI_TEST to self CPU%u\n", smp_processor_id());
> +    send_SGI_self(GIC_SGI_TEST);
> +
> +    if ( smp_processor_id() == 0 )
> +    {
> +        printk("Sending GIC_SGI_DUMP_STATE to CPU0\n");
> +        smp_send_state_dump(0);
> +
> +        return 0;
> +    }
> +
> +    printk("Sending GIC_SGI_TEST to CPU0 from CPU%u\n", smp_processor_id());
> +    send_SGI_one(0, GIC_SGI_TEST);
> +
> +    /* Execute this test only from the last core */
> +    if ( smp_processor_id() == (smp_get_max_cpus() - 1) )
> +    {
> +        printk("Sending GIC_SGI_TEST to all except CPU%u\n", smp_processor_id());
> +        send_SGI_allbutself(GIC_SGI_TEST);
> +    }
> +
> +    return 0;
> +

Style: The newline seems spurious.

> +}
> +__initcallboottest(gic_self_sgi_test);

Cheers,
-- 
Julien Grall


