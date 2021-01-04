Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155B2E9B20
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61363.107906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSpC-0004oE-U8; Mon, 04 Jan 2021 16:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61363.107906; Mon, 04 Jan 2021 16:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSpC-0004np-R2; Mon, 04 Jan 2021 16:35:18 +0000
Received: by outflank-mailman (input) for mailman id 61363;
 Mon, 04 Jan 2021 16:35:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwSpB-0004nk-Lm
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:35:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7720006b-af6a-4ac8-af29-414bd9d83edd;
 Mon, 04 Jan 2021 16:35:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4876EAE63;
 Mon,  4 Jan 2021 16:35:15 +0000 (UTC)
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
X-Inumbo-ID: 7720006b-af6a-4ac8-af29-414bd9d83edd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609778115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76TcmsviJqQ8Ltgx9VCPL+P9wTomxStRQa2Rg+vOQ5I=;
	b=hzc9FVKkMTSqmtYjK2xGZ5YIFCMvrzxCnkIz1rDqeTvbSvO+62mXhHfK6dto6kxfljutDJ
	9SSxLpkPBpps5+5unEyT4787N14tjbNcYqOBA0y0H2F7sRfFOROHolgx/ms/6d7SC5E5pF
	KkOgtYTXll8ZiecoUtV6ShDQ4PqcUeQ=
Subject: Re: [PATCH 1/5] x86/vPCI: tolerate (un)masking a disabled MSI-X entry
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Manuel Bouyer <bouyer@antioche.eu.org>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <fef14892-f21d-e304-d9b1-7484e0ea3415@suse.com>
 <20201228182407.5ntx7qppe4vu7fvu@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <255866b7-8bc1-6bdc-2188-e772a3b9fa7e@suse.com>
Date: Mon, 4 Jan 2021 17:35:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228182407.5ntx7qppe4vu7fvu@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.12.2020 19:24, Roger Pau Monné wrote:
> On Mon, Dec 07, 2020 at 11:36:38AM +0100, Jan Beulich wrote:
>> None of the four reasons causing vpci_msix_arch_mask_entry() to get
>> called (there's just a single call site) are impossible or illegal prior
>> to an entry actually having got set up:
>> - the entry may remain masked (in this case, however, a prior masked ->
>>   unmasked transition would already not have worked),
>> - MSI-X may not be enabled,
>> - the global mask bit may be set,
>> - the entry may not otherwise have been updated.
>> Hence the function asserting that the entry was previously set up was
>> simply wrong. Since the caller tracks the masked state (and setting up
>> of an entry would only be effected when that software bit is clear),
>> it's okay to skip both masking and unmasking requests in this case.
> 
> On the original approach I just added this because I convinced myself
> that scenario was impossible. I think we could also do:
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 64dd0a929c..509cf3962c 100644
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
> @@ -470,6 +474,7 @@ static int init_msix(struct pci_dev *pdev)
>      for ( i = 0; i < pdev->vpci->msix->max_entries; i++)
>      {
>          pdev->vpci->msix->entries[i].masked = true;
> +        pdev->vpci->msix->entries[i].updated = true;
>          vpci_msix_arch_init_entry(&pdev->vpci->msix->entries[i]);
>      }
> 
> In order to solve the issue.
> 
> As pointed out in another patch, regardless of what we end up doing
> with the issue at hand we might have to consider setting updated to
> true in init_msix in case we want to somehow support enabling an entry
> that has it's address and data fields set to 0.

Yes, but I view this as an orthogonal aspect to consider (down
the road).

>> Fixes: d6281be9d0145 ('vpci/msix: add MSI-X handlers')
>> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Manuel, can we get confirmation that this fixes your issue?

I'll give it some time before committing for him to confirm,
but I guess I'd like to time out by the end of the week.

Jan

