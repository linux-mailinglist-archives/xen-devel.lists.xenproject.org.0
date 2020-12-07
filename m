Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DD2D0EFC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46305.82179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEfx-0006ga-6E; Mon, 07 Dec 2020 11:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46305.82179; Mon, 07 Dec 2020 11:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEfx-0006gB-38; Mon, 07 Dec 2020 11:27:29 +0000
Received: by outflank-mailman (input) for mailman id 46305;
 Mon, 07 Dec 2020 11:27:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEfv-0006g5-4F
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:27:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4694b318-a931-48ba-824c-6c756e32d884;
 Mon, 07 Dec 2020 11:27:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62C4DAD1E;
 Mon,  7 Dec 2020 11:27:25 +0000 (UTC)
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
X-Inumbo-ID: 4694b318-a931-48ba-824c-6c756e32d884
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607340445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZw5fcK9gaw18iUcT69z6KP29lN5Uo1I+aCuJSd5Cvs=;
	b=HTOA0sssIbBQBlXSiwlgIFhH4qg6A0OKoXS/RfdPD0TSpin9ViNOm07DeI2El9j9NIFypO
	XNKA68LbhIaYsl0dv+6vvOtEvi+ib3WNTIcmCzYLrKX2Lt2PCS6vF4AZ4WhQ7i5+g5KW/0
	N1fmF5sfFCF9Pr6ApEJFIzjWbznl57o=
Subject: Re: [PATCH V3 03/23] x86/ioreq: Provide out-of-line wrapper for the
 handle_mmio()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-4-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a12313a8-4e74-02a0-f849-72c6ed9b6161@suse.com>
Date: Mon, 7 Dec 2020 12:27:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-4-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -36,6 +36,11 @@
>  #include <public/hvm/ioreq.h>
>  #include <public/hvm/params.h>
>  
> +bool ioreq_complete_mmio(void)
> +{
> +    return handle_mmio();
> +}

As indicated before I don't like out-of-line functions like this
one; I think a #define would be quite fine here, but Paul as the
maintainer thinks differently. So be it. However, shouldn't this
function be named arch_ioreq_complete_mmio() according to the
new naming model, and then ...

> --- a/xen/include/asm-x86/hvm/ioreq.h
> +++ b/xen/include/asm-x86/hvm/ioreq.h
> @@ -74,6 +74,8 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
>  
>  void hvm_ioreq_init(struct domain *d);
>  
> +bool ioreq_complete_mmio(void);

... get declared next to the other arch_*() hooks? With this
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

