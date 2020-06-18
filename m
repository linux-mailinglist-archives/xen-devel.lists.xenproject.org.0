Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4731FF551
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvpf-0002Xe-OG; Thu, 18 Jun 2020 14:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlvpd-0002XZ-H1
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:47:57 +0000
X-Inumbo-ID: b2584c7a-b172-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2584c7a-b172-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 14:47:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5157AAC79;
 Thu, 18 Jun 2020 14:47:55 +0000 (UTC)
Subject: Re: [PATCH for-4.14 5/8] x86/hvm: only translate ISA interrupts to
 GSIs in virtual timers
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b7eb220-afb8-26e6-6406-70759cac9333@suse.com>
Date: Thu, 18 Jun 2020 16:47:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 17:56, Roger Pau Monne wrote:
> Only call hvm_isa_irq_to_gsi for ISA interrupts, interrupts
> originating from an IO APIC pin already use a GSI and don't need to be
> translated.
> 
> I haven't observed any issues from this, but I think it's better to
> use it correctly.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/x86/hvm/vpt.c
> +++ b/xen/arch/x86/hvm/vpt.c
> @@ -86,7 +86,7 @@ static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
>          return pt->irq;
>  
>      isa_irq = pt->irq;
> -    gsi = hvm_isa_irq_to_gsi(isa_irq);
> +    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;

... would you mind taking the opportunity and moving this ...

>      if ( src == hvm_intsrc_pic )
>          return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base

... below here, perhaps even past the ASSERT() that follows?

(I have to admit that I find the two kinds of "source" indicators
- the "src" function parameter and "pt->source" confusing. Aren't
they supposed to match up?)

Jan

