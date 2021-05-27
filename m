Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB46392F29
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133337.248564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFlO-0001Cn-EZ; Thu, 27 May 2021 13:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133337.248564; Thu, 27 May 2021 13:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFlO-0001Au-Aw; Thu, 27 May 2021 13:09:26 +0000
Received: by outflank-mailman (input) for mailman id 133337;
 Thu, 27 May 2021 13:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFlM-0001Am-M4
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:09:24 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d77f7bb-cd7e-4b05-8793-c849af92b23e;
 Thu, 27 May 2021 13:09:23 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A78C8218DD;
 Thu, 27 May 2021 13:09:22 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 7DBDC11A98;
 Thu, 27 May 2021 13:09:22 +0000 (UTC)
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
X-Inumbo-ID: 5d77f7bb-cd7e-4b05-8793-c849af92b23e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622120962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trLBAOWe0MCleefC+wGsBbKvDk54IBj1+8SrsR29cGI=;
	b=CZ73lC6l7m/6kpFXnBwSHC2Qi05l5z0GwPVV4EO6ELMcTDS9Vc1IwsRqYXBLD6U6Pl9Wj1
	f1B7/ckbSSIaZUd2m6+WYYygivdYwJbGPSIOEwo5yk2O1ubA6S8vvHaNf+ZdETPpcei2vv
	RgzcSbMzOchK1cuQfQPUSGDeRSrhp1o=
Subject: Re: [PATCH v2 01/12] x86: introduce ioremap_wc()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <20abac99-609c-f4f6-1242-c79919f4c317@suse.com>
 <b8035805-4f44-18ce-f4cb-4ce1d3c594fc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d7019879-037b-7945-4a8a-5a8252e5922a@suse.com>
Date: Thu, 27 May 2021 15:09:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b8035805-4f44-18ce-f4cb-4ce1d3c594fc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.05.2021 14:48, Julien Grall wrote:
> On 27/05/2021 13:30, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5881,6 +5881,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>>       return (void __force __iomem *)va;
>>   }
>>   
>> +void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
>> +{
>> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
>> +    unsigned int offs = pa & (PAGE_SIZE - 1);
>> +    unsigned int nr = PFN_UP(offs + len);
>> +    void *va;
>> +
>> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
>> +
>> +    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
>> +
>> +    return (void __force __iomem *)(va + offs);
>> +}
> 
> Arm is already providing ioremap_wc() which is a wrapper to 
> ioremap_attr().

I did notice this, yes.

> Can this be moved to the common code to avoid duplication?

If by "this" you mean ioremap_attr(), then I wasn't convinced we want
a function of this name on x86. In particular you may note that
x86'es ioremap() is sort of the equivalent of Arm's ioremap_nocache(),
but is different from the new ioremap_wc() by more than just the
different PTE attributes.

Also I was specifically asked to make ioremap_wc() __init; ioremap()
cannot be, because of at least the use from pci_vtd_quirk().

Plus I'd need to clean up Arm's lack of __iomem if I wanted to fold
things. Or wait - it's declaration and definition which are out of
sync there, i.e. a pre-existing issue.

Bottom line - while I did consider folding, I don't think that's
feasible at this point in time.

Jan

