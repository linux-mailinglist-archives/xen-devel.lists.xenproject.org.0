Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE2358775
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 16:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107392.205307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVyi-00037D-Vk; Thu, 08 Apr 2021 14:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107392.205307; Thu, 08 Apr 2021 14:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUVyi-00036o-ST; Thu, 08 Apr 2021 14:49:52 +0000
Received: by outflank-mailman (input) for mailman id 107392;
 Thu, 08 Apr 2021 14:49:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUVyh-00036j-4c
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 14:49:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0df3eb8-86b0-4ba7-aa08-6f00ec7a396f;
 Thu, 08 Apr 2021 14:49:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C822B141;
 Thu,  8 Apr 2021 14:49:49 +0000 (UTC)
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
X-Inumbo-ID: e0df3eb8-86b0-4ba7-aa08-6f00ec7a396f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617893389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GV22W6QQSs9YGSGTdpX8nuwJiCSWzqdDNV8x/swoSOc=;
	b=Ii6HjbqQPOTHlcBkzvoECv+6G+RczogfKAJxtgaiGYkEBYzxrk13nkNnuzjjVv82KEItpb
	fvOf7kFCQXR22iN2I/6lpT8I2m5fJpMuHS73EKC3I58xOOhLxI4Y4kpD/KcjQ5QPzLdHnK
	7xPtog9x530yuMCajlqkPT4izP1XvHk=
Subject: Re: [PATCH v3 08/11] x86/dpci: switch to use a GSI EOI callback
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47616bd4-2e3e-92ea-73de-8ea6fb1992ed@suse.com>
Date: Thu, 8 Apr 2021 16:49:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 12:33, Roger Pau Monne wrote:
> @@ -515,17 +528,44 @@ int pt_irq_create_bind(
>          }
>          else
>          {
> +            /*
> +             * NB: the callback structure allocated below will never be freed
> +             * once setup because it's used by the hardware domain and will
> +             * never be unregistered.
> +             */
> +            cb = xmalloc(struct hvm_gsi_eoi_callback);

Is this comment as well as ...

>              ASSERT(is_hardware_domain(d));
>  
> +            if ( !cb )
> +            {
> +                spin_unlock(&d->event_lock);
> +                return -ENOMEM;
> +            }
> +
>              /* MSI_TRANSLATE is not supported for the hardware domain. */
>              if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
>                   pirq >= hvm_domain_irq(d)->nr_gsis )
>              {
>                  spin_unlock(&d->event_lock);
> -
> +                xfree(cb);
>                  return -EINVAL;
>              }
>              guest_gsi = pirq;
> +
> +            cb->callback = dpci_eoi;
> +            cb->data = d;
> +            /*
> +             * IRQ binds created for the hardware domain are never destroyed,
> +             * so it's fine to not keep a reference to cb here.
> +             */
> +            rc = hvm_gsi_register_callback(d, guest_gsi, cb);

... the one here really true? vpci_msi_arch_update() and
vpci_msi_disable() seem to tell me otherwise (or for the former
comment, they suggest there should be un-registration somewhere).
It also doesn't seem logical to me, considering (yet to be made
work) pass-through of devices or hot-unplugged ones, at which
point Dom0 shouldn't retain IRQ bindings, I would think.

Jan

