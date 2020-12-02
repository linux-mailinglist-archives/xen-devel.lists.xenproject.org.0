Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B654A2CB75C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 09:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42482.76401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkNeZ-0006dC-3F; Wed, 02 Dec 2020 08:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42482.76401; Wed, 02 Dec 2020 08:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkNeY-0006cn-Vv; Wed, 02 Dec 2020 08:38:22 +0000
Received: by outflank-mailman (input) for mailman id 42482;
 Wed, 02 Dec 2020 08:38:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkNeX-0006ci-KM
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 08:38:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8f50bd7-f247-496d-9206-5ddada90bb14;
 Wed, 02 Dec 2020 08:38:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E111AD43;
 Wed,  2 Dec 2020 08:38:19 +0000 (UTC)
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
X-Inumbo-ID: f8f50bd7-f247-496d-9206-5ddada90bb14
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606898299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XEYyqJfDwG6UshypPKSBfFwAxJJi3ee131MIR2Zs4L8=;
	b=OmsUZPZ3nToyRt/I2zOoBW0NrM1qVRfppgD+1UrQ3xnKL8ZVlWTorVgzgFUb7Vig7mc9PD
	C+Rk1RYi2npBhtKN03TQthMkX6VlZiLxY4w61WBVVRb72JJzkHXeElA1JeKMtPk2DGEiG8
	9rGPaYCK0707URPv1IkYHA4iST5hrzo=
Subject: Re: [PATCH] vpci/msix: exit early if MSI-X is disabled
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <20201201174014.27878-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfc96aa9-c39f-177c-c8f8-af18b80804de@suse.com>
Date: Wed, 2 Dec 2020 09:38:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201174014.27878-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.12.2020 18:40, Roger Pau Monne wrote:
> Do not attempt to mask an MSI-X entry if MSI-X is not enabled. Else it
> will lead to hitting the following assert on debug builds:
> 
> (XEN) Panic on CPU 13:
> (XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843

Since the line number is only of limited use, I'd like to see the
function name (vpci_msix_arch_mask_entry()) also added here; easily
done while committing, if the question further down can be resolved
without code change.

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -357,7 +357,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>           * so that it picks the new state.
>           */
>          entry->masked = new_masked;
> -        if ( !new_masked && msix->enabled && !msix->masked && entry->updated )
> +
> +        if ( !msix->enabled )
> +            break;
> +
> +        if ( !new_masked && !msix->masked && entry->updated )
>          {
>              /*
>               * If MSI-X is enabled, the function mask is not active, the entry

What about a "disabled" -> "enabled-but-masked" transition? This,
afaict, similarly won't trigger setting up of entries from
control_write(), and hence I'd expect the ASSERT() to similarly
trigger when subsequently an entry's mask bit gets altered.

I'd also be fine making this further adjustment, if you agree,
but the one thing I haven't been able to fully convince myself of
is that there's then still no need to set ->updated to true.

Jan

