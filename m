Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE98268DB0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 16:31:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHpV5-0004VS-1J; Mon, 14 Sep 2020 14:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHpV3-0004VK-Ga
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:30:33 +0000
X-Inumbo-ID: 640f21a1-6cc2-40c2-aeee-aba9e0e08735
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 640f21a1-6cc2-40c2-aeee-aba9e0e08735;
 Mon, 14 Sep 2020 14:30:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86EFFB39B;
 Mon, 14 Sep 2020 14:30:47 +0000 (UTC)
Subject: Re: [RFC PATCH] efi: const correct EFI functions
To: Trammell Hudson <hudson@trmm.net>
References: <20200914142528.897639-1-hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
Date: Mon, 14 Sep 2020 16:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914142528.897639-1-hudson@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 16:25, Trammell Hudson wrote:
> By defining IN as const, the EFI handler functions become almost
> const-correct and allow most of the rest of the EFI boot code to
> use constant strings.

How does this work with combined "IN OUT"? I'm afraid there is a
reason why things aren't done the way you suggest.

> --- a/xen/include/efi/efidef.h
> +++ b/xen/include/efi/efidef.h
> @@ -50,7 +50,7 @@ typedef VOID            *EFI_EVENT;
>  //
>  
>  #ifndef IN
> -    #define IN
> +    #define IN const
>      #define OUT
>      #define OPTIONAL
>  #endif

I think the #ifdef here is precisely so you can override the three
identifiers without having to touch this (imported) header. We try
to keep imported headers as little modified as possible.

Jan

