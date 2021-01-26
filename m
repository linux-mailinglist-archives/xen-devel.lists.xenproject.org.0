Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551D3040F4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75160.135259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PiE-0002NJ-2b; Tue, 26 Jan 2021 14:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75160.135259; Tue, 26 Jan 2021 14:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PiD-0002Mu-V8; Tue, 26 Jan 2021 14:52:57 +0000
Received: by outflank-mailman (input) for mailman id 75160;
 Tue, 26 Jan 2021 14:52:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4PiB-0002Mp-TG
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:52:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 288723cd-1f37-4089-8b40-3c6992e5421b;
 Tue, 26 Jan 2021 14:52:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23397AC6E;
 Tue, 26 Jan 2021 14:52:54 +0000 (UTC)
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
X-Inumbo-ID: 288723cd-1f37-4089-8b40-3c6992e5421b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611672774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+r1idT+j24+vI3F7fiZ1w8IAkUZ3/tLMcLP30JUfjY=;
	b=uxPig276281qc+suKiS3ihKYcCf6EbDSq3DxHYre3EH81KkNiPFrKfcvKNcaWvXzM+GSFN
	WvGfq9FNdyReekPBar/LhfjBnti9KzUvAWaDF/8ctoiPykXPArhBfS1y/aK6irpIBR2zQz
	j+i39BmRfPIPhsQgedjc2LNMCl1Q14Y=
Subject: Re: [PATCH 2/3] x86/irq: don't disable domain MSI IRQ on force unbind
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7633ddb0-922b-0165-7e8c-d265786ef4aa@suse.com>
Date: Tue, 26 Jan 2021 15:52:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126110606.21741-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 12:06, Roger Pau Monne wrote:
> When force unbinding a MSI the used IRQ would get added to the domain
> irq-pirq tree as -irq -pirq,

I think it's -pirq at index irq, i.e. I don't think IRQ gets
negated as far as the radix tree goes. info->arch.irq gets a
negative value stored, yes.

> thus preventing the same IRQ to be used by the domain.

Iirc this (answering your post-commit-message question here)
is for cleaning up _after_ the domain, i.e. there's no goal
to allow re-use of this IRQ. The comment ahead of
unmap_domain_pirq() validly says "The pirq should have been
unbound before this call." The only time we can't make
ourselves dependent upon this is when the guest is being
cleaned up. During normal operation I think we actually
_want_ to enforce correct behavior of the guest here.

> It's not clear to me why we add the irq as -irq -pirq to the irq-pirq
> domain tree on forced unbind, as allowing to bind the irq again should
> just work regardless of whether it has been previously forcefully
> unbound?

To continue from the above, see pirq_guest_unbind() where
we have

    if ( desc == NULL )
    {
        irq = -pirq->arch.irq;
        BUG_ON(irq <= 0);
        desc = irq_to_desc(irq);
        spin_lock_irq(&desc->lock);
        clear_domain_irq_pirq(d, irq, pirq);
    }

as the alternative to going the normal path through
__pirq_guest_unbind(). Again iirc that's to cover for the
unbind request arriving after the unmap one (i.e. having
caused the unmap to force-unbind the IRQ).

Jan

