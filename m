Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52C280F33
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 10:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1746.5326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOGjX-0001ij-J9; Fri, 02 Oct 2020 08:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1746.5326; Fri, 02 Oct 2020 08:48:07 +0000
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
	id 1kOGjX-0001iK-Fk; Fri, 02 Oct 2020 08:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1746;
 Fri, 02 Oct 2020 08:48:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOGjW-0001iF-TW
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:48:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5031ce30-d688-46f1-9c41-1977436e4e50;
 Fri, 02 Oct 2020 08:48:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B436AC4D;
 Fri,  2 Oct 2020 08:48:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOGjW-0001iF-TW
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 08:48:06 +0000
X-Inumbo-ID: 5031ce30-d688-46f1-9c41-1977436e4e50
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5031ce30-d688-46f1-9c41-1977436e4e50;
	Fri, 02 Oct 2020 08:48:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601628485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaIWTy0Xra05FhczbcrTApaziPrlp5SYm6vWFV29lVI=;
	b=DsT+GE1eqthxd1J7NOguwMD2Jah6ZiI+Qt1HgxEDXrLITjB0EixAsj+LNV6a+P126LJ7Ah
	dLjiAp1wzo7KJX8dtoYmz9X65TKrWaNznZ5x9wsjRW/N6msrJJ7xi51XOg/32D36UFKi3R
	Lq5GAMMwzGLVdu1I18MUTqqvi83FjGg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6B436AC4D;
	Fri,  2 Oct 2020 08:48:05 +0000 (UTC)
Subject: Re: [PATCH v2 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
To: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bafcd30e-f75b-79c8-2424-6a63cb0b96d4@suse.com>
Date: Fri, 2 Oct 2020 10:48:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:40, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>  
>  void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>  {
> -    struct vcpu *v = vlapic_vcpu(vlapic);
> -    struct domain *d = v->domain;
> -
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
> -        vioapic_update_EOI(d, vector);
> +        vioapic_update_EOI(vector);
>  
> -    hvm_dpci_msi_eoi(d, vector);
> +    hvm_dpci_msi_eoi(vector);
>  }

What about viridian_synic_wrmsr() -> vlapic_EOI_set() ->
vlapic_handle_EOI()? You'd probably have noticed this if you
had tried to (consistently) drop the respective parameters from
the intermediate functions as well.

Question of course is in how far viridian_synic_wrmsr() for
HV_X64_MSR_EOI makes much sense when v != current. Paul, Wei?

A secondary question of course is whether passing around the
pointers isn't really cheaper than the obtaining of 'current'.

Jan

