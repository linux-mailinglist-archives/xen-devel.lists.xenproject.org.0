Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F7327A7C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91370.172705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeZ3-0005sQ-C7; Mon, 01 Mar 2021 09:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91370.172705; Mon, 01 Mar 2021 09:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGeZ3-0005qU-6w; Mon, 01 Mar 2021 09:10:05 +0000
Received: by outflank-mailman (input) for mailman id 91370;
 Mon, 01 Mar 2021 09:10:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGeZ2-0005nq-5u
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:10:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5519d4c5-4ea9-42a2-80c8-e3895efc59c6;
 Mon, 01 Mar 2021 09:10:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FBC9ADDD;
 Mon,  1 Mar 2021 09:10:02 +0000 (UTC)
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
X-Inumbo-ID: 5519d4c5-4ea9-42a2-80c8-e3895efc59c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614589802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpIjoIF/4xtxEiq/P5y5V6xvRl0P36DV4+b9ggmFKIQ=;
	b=YmvxN6IETBxbloKnrf2S22U4ieQ79m+hQjLPXANTsJS8n66Tk18VTuztopoG+w84GGhrj+
	L2MePqSnNVzUsJeBGXR8M8lfe0t130aBsrxihH/bhZiwwpUT+uJhuzpXNSX7fTNicw+v8S
	Nco5abfWeNjAvMsSGi+lJFP6/ObX1FY=
Subject: Re: [PATCH v2] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, julien@xen.org, xen-devel@lists.xenproject.org
References: <20210226225217.2137-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed3b997c-a741-2e71-dc5b-4bc68ed22087@suse.com>
Date: Mon, 1 Mar 2021 10:10:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226225217.2137-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 23:52, Stefano Stabellini wrote:
> Introduce two feature flags to tell the domain whether it is
> direct-mapped or not. It allows the guest kernel to make informed
> decisions on things such as swiotlb-xen enablement.
> 
> The introduction of both flags (XENFEAT_direct_mapped and
> XENFEAT_not_direct_mapped) allows the guest kernel to avoid any
> guesswork if one of the two is present, or fallback to the current
> checks if neither of them is present.
> 
> XENFEAT_direct_mapped is always set for not auto-translated guests.
> 
> For auto-translated guests, only Dom0 on ARM is direct-mapped. Also,
> see is_domain_direct_mapped() which refers to auto-translated guests:
> xen/include/asm-arm/domain.h:is_domain_direct_mapped
> xen/include/asm-x86/domain.h:is_domain_direct_mapped
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with one cosmetic aspect taken care of:

> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -560,6 +560,10 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>                               (1U << XENFEAT_hvm_callback_vector) |
>                               (has_pirq(d) ? (1U << XENFEAT_hvm_pirqs) : 0);
>  #endif
> +            if ( is_domain_direct_mapped(d) || !paging_mode_translate(d) )

While I realize the left side of the || is what you're after,
I'd generally see the more common/universal/whatever-you-want-
to-call-it condition be checked first, and the most special
purpose one last. IOW I'd prefer if both side of the || could
be swapped.

Jan

