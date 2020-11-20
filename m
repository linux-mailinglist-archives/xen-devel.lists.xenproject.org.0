Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326412BA55B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31780.62455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Gt-0007OB-GY; Fri, 20 Nov 2020 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31780.62455; Fri, 20 Nov 2020 08:59:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2Gt-0007Nn-DF; Fri, 20 Nov 2020 08:59:59 +0000
Received: by outflank-mailman (input) for mailman id 31780;
 Fri, 20 Nov 2020 08:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg2Gs-0007Ng-48
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:59:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 792855b5-19c4-49eb-ae08-9956c70f5db3;
 Fri, 20 Nov 2020 08:59:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9A72AC0C;
 Fri, 20 Nov 2020 08:59:56 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg2Gs-0007Ng-48
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:59:58 +0000
X-Inumbo-ID: 792855b5-19c4-49eb-ae08-9956c70f5db3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 792855b5-19c4-49eb-ae08-9956c70f5db3;
	Fri, 20 Nov 2020 08:59:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605862796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtzVT+psnRyLMZqf7NPV4DyyZ+QvtPWbucYiH+zRXaQ=;
	b=Wzg80ch2E0v/Wehh/deV82GMPaSrZptDAvMyyHCGg4qIMjmuQfg3MJLUMxFazOtBznhUYg
	wnBUm2qK30/jdUWPr33hwkDXVQ1Hl6KnZ6sa/wZ7MDO3mXqVcgTHmls5HRgHlL4IcTx07k
	E2SRyyReiYaZQkMr6LI4IZEkKNUxKlE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A9A72AC0C;
	Fri, 20 Nov 2020 08:59:56 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
Date: Fri, 20 Nov 2020 09:59:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201120085249.GA1508@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.11.2020 09:52, Manuel Bouyer wrote:
> On Fri, Nov 20, 2020 at 09:28:55AM +0100, Roger Pau Monné wrote:
>>> i.e. at that point we're waiting for Dom0 to signal it's done handling
>>> the IRQ. There is, however, a timer associated with this. Yet that's
>>> actually to prevent the system getting stuck, i.e. the "in-flight"
>>> state ought to clear 1ms later (when that timer expires), and hence
>>> ought to be pretty unlikely to catch when non-zero _and_ something's
>>> actually stuck.
>>
>> I somehow assumed the interrupt was in-flight because the printing to
>> the Xen console caused one to be injected, and thus dom0 didn't had
>> time to Ack it yet.
> 
> What does Xen consider to be an ACK from the dom0 ?
> AFAIK we have EOI only for LAPIC interrupts.

Well, anything coming through the LAPIC needs ack-ing (except for
the spurious interrupt of course), or else ISR won't get updated
and further interrupts at this or lower priority can't be serviced
(delivered) anymore. This includes interrupts originally coming
through the IO-APIC. But the same constraint / requirement exists
on baremetal.

Jan

