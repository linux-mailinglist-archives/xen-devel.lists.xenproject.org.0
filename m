Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A1F2F6090
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 12:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66952.119135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01Cs-00022b-N1; Thu, 14 Jan 2021 11:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66952.119135; Thu, 14 Jan 2021 11:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01Cs-00022C-JG; Thu, 14 Jan 2021 11:54:26 +0000
Received: by outflank-mailman (input) for mailman id 66952;
 Thu, 14 Jan 2021 11:54:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l01Cq-000227-Lm
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 11:54:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec23d669-5876-43a8-b977-b133cc054032;
 Thu, 14 Jan 2021 11:54:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5BFCB7BE;
 Thu, 14 Jan 2021 11:54:22 +0000 (UTC)
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
X-Inumbo-ID: ec23d669-5876-43a8-b977-b133cc054032
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610625263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSWqQlyzDXxAglArIfBQkI4IYgQ4eZr54ly0WGE4FLA=;
	b=oVGJKEPAUUIPWJoldrzyNdiKl6UIPEg0PINa91MmQumDsK8FsAwKLe11tUOjydekXVEWfy
	CE5KueR6qEshMAD8eCbbAVdxYFdYZXuReY+BVEgc0GfBySnTGr6HtcmM+huxzkNQTrNp+S
	uNyhaAbgt98STdMe1CIV4bhDGrBHSrk=
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210112173248.28646-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20f1ed79-89c5-d4a3-5b12-af82bed2dc1e@suse.com>
Date: Thu, 14 Jan 2021 12:54:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112173248.28646-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 18:32, Roger Pau Monne wrote:
> @@ -967,10 +879,10 @@ static void hvm_pirq_eoi(struct pirq *pirq)
>       * since interrupt is still not EOIed
>       */
>      if ( --pirq_dpci->pending ||
> -         !pt_irq_need_timer(pirq_dpci->flags) )
> +         /* When the interrupt source is MSI no Ack should be performed. */
> +         pirq_dpci->flags & HVM_IRQ_DPCI_TRANSLATE )

If we settle on this timer being possible to drop, then there's
just one cosmetic issue here (which can be fixed while committing
I suppose) - there is a pair of parentheses missing here.

Otherwise we will want to at least keep

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -184,11 +184,6 @@ int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
>  void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq);
>  struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *);
>  void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
> -#ifdef CONFIG_HVM
> -bool pt_irq_need_timer(uint32_t flags);
> -#else
> -static inline bool pt_irq_need_timer(unsigned int flags) { return false; }
> -#endif

along with making the function static in its source file.

Jan

