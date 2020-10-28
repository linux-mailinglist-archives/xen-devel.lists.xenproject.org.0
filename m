Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6429CFD7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 12:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13575.34255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXk4C-0003An-MS; Wed, 28 Oct 2020 11:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13575.34255; Wed, 28 Oct 2020 11:56:36 +0000
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
	id 1kXk4C-0003AO-JO; Wed, 28 Oct 2020 11:56:36 +0000
Received: by outflank-mailman (input) for mailman id 13575;
 Wed, 28 Oct 2020 11:56:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXk4A-0003AJ-A4
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:56:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33d7a09a-d013-412c-800a-b2e549e85790;
 Wed, 28 Oct 2020 11:56:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C289EB036;
 Wed, 28 Oct 2020 11:56:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXk4A-0003AJ-A4
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 11:56:34 +0000
X-Inumbo-ID: 33d7a09a-d013-412c-800a-b2e549e85790
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 33d7a09a-d013-412c-800a-b2e549e85790;
	Wed, 28 Oct 2020 11:56:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603886192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvcQaZ+Y1Ei0/m74T7rBNWRFLD/qF9LXTrfinx3+oi8=;
	b=qiJR77FjoRv8c6F3YzSmtUpbWYfCOz9gK7PgAvNIdQlDRiZyouXtO4Y1OilEehr7IsEjSo
	YkhkQVne5rdoT+49iJfwmVheJyQqo7H3My6Zp4L+xbI/QQ9HgMjM7qs1nuXWMuNnnC3+rW
	uv872bgu9WJqH1oCtZzCpOyrlAMoL8I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C289EB036;
	Wed, 28 Oct 2020 11:56:32 +0000 (UTC)
Subject: Re: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1603731279.git.rahul.singh@arm.com>
 <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b345b0d4-8045-1d5d-b3c9-498311cfb1ac@suse.com>
Date: Wed, 28 Oct 2020 12:56:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 18:17, Rahul Singh wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1419,13 +1419,15 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>  
> -    /* Prevent device assign if mem paging or mem sharing have been 
> +#if defined(CONFIG_HAS_MEM_PAGING) || defined(CONFIG_MEM_SHARING)
> +    /* Prevent device assign if mem paging or mem sharing have been
>       * enabled for this domain */
>      if ( d != dom_io &&
>           unlikely(mem_sharing_enabled(d) ||
>                    vm_event_check_ring(d->vm_event_paging) ||
>                    p2m_get_hostp2m(d)->global_logdirty) )
>          return -EXDEV;
> +#endif

Besides this also disabling mem-sharing and log-dirty related
logic, I don't think the change is correct: Each item being
checked needs individually disabling depending on its associated
CONFIG_*. For this, perhaps you want to introduce something
like mem_paging_enabled(d), to avoid the need for #ifdef here?

Jan

