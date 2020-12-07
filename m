Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E02D0F43
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46328.82216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEnh-0007y3-FQ; Mon, 07 Dec 2020 11:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46328.82216; Mon, 07 Dec 2020 11:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEnh-0007xe-C4; Mon, 07 Dec 2020 11:35:29 +0000
Received: by outflank-mailman (input) for mailman id 46328;
 Mon, 07 Dec 2020 11:35:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEng-0007xZ-34
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:35:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96f2ee80-a521-4c74-b220-62957361df63;
 Mon, 07 Dec 2020 11:35:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6320FAC90;
 Mon,  7 Dec 2020 11:35:26 +0000 (UTC)
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
X-Inumbo-ID: 96f2ee80-a521-4c74-b220-62957361df63
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607340926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBDHXALC2M4fuyp8zCjOLP5BxwUfsPXvFMOfCYZK1Q4=;
	b=KugIuvkRAiE+yQWQjtTiHom7tVM8hldeg7DEf0icu4CYnl8onuiH4a/jkBn1RniFUYhTun
	aS/QgKFWesBt2SMyozYGUUPWtWtX51tMT9DeNiKzhrKlyqeRwC8hgtWn7UJZ30NrQwMCv+
	pT/n7hhidqPT66OoY+awkV5Dz0ZU1Y4=
Subject: Re: [PATCH V3 10/23] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-11-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f9a68ad-c663-d7a1-9194-4ad28958b077@suse.com>
Date: Mon, 7 Dec 2020 12:35:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-11-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4699,50 +4699,6 @@ int xenmem_add_to_physmap_one(
>      return rc;
>  }
>  
> -int arch_acquire_resource(struct domain *d, unsigned int type,
> -                          unsigned int id, unsigned long frame,
> -                          unsigned int nr_frames, xen_pfn_t mfn_list[])
> -{
> -    int rc;
> -
> -    switch ( type )
> -    {
> -#ifdef CONFIG_HVM
> -    case XENMEM_resource_ioreq_server:
> -    {
> -        ioservid_t ioservid = id;
> -        unsigned int i;
> -
> -        rc = -EINVAL;
> -        if ( !is_hvm_domain(d) )
> -            break;
> -
> -        if ( id != (unsigned int)ioservid )
> -            break;
> -
> -        rc = 0;
> -        for ( i = 0; i < nr_frames; i++ )
> -        {
> -            mfn_t mfn;
> -
> -            rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
> -            if ( rc )
> -                break;
> -
> -            mfn_list[i] = mfn_x(mfn);
> -        }
> -        break;
> -    }
> -#endif
> -
> -    default:
> -        rc = -EOPNOTSUPP;
> -        break;
> -    }
> -
> -    return rc;
> -}

Can't this be accompanied by removal of the xen/ioreq.h inclusion?
(I'm only looking at patch 4 right now, but the renaming there made
the soon to be unnecessary #include quite apparent.)

Jan

