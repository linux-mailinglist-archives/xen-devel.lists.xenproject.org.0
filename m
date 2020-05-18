Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204981D7C53
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahKQ-0001j1-7v; Mon, 18 May 2020 15:05:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jahKP-0001iw-HK
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:05:17 +0000
X-Inumbo-ID: fab79d6d-9918-11ea-a870-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fab79d6d-9918-11ea-a870-12813bfff9fa;
 Mon, 18 May 2020 15:05:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA5BAACB1;
 Mon, 18 May 2020 15:05:17 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9e337ae-295e-5577-3c6d-a42721190b07@suse.com>
Date: Mon, 18 May 2020 17:05:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515135802.63853-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.05.2020 15:58, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -652,6 +652,15 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>  additionally a trace buffer of the specified size is allocated per cpu.
>  The debug trace feature is only enabled in debugging builds of Xen.
>  
> +### disable-c6-errata

Hmm, yes please - a disable for errata! ;-)

How about "avoid-c6-errata", and then perhaps as a sub-option to
"cpuidle="? (If we really want a control for this in the first
place.)

> @@ -573,10 +574,40 @@ bool errata_c6_eoi_workaround(void)
>              INTEL_FAM6_MODEL(0x2f),
>              { }
>          };
> +        /*
> +         * Errata BDX99, CLX30, SKX100, CFW125, BDF104, BDH85, BDM135, KWB131:
> +         * A Pending Fixed Interrupt May Be Dispatched Before an Interrupt of
> +         * The Same Priority Completes.
> +         *
> +         * Resuming from C6 Sleep-State, with Fixed Interrupts of the same
> +         * priority queued (in the corresponding bits of the IRR and ISR APIC
> +         * registers), the processor may dispatch the second interrupt (from
> +         * the IRR bit) before the first interrupt has completed and written to
> +         * the EOI register, causing the first interrupt to never complete.
> +         */
> +        const static struct x86_cpu_id isr_errata[] = {

Same nit as for patch 1 here.

Jan

