Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020A3658FB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113603.216505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpYj-0007HY-6u; Tue, 20 Apr 2021 12:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113603.216505; Tue, 20 Apr 2021 12:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpYj-0007H9-3p; Tue, 20 Apr 2021 12:32:53 +0000
Received: by outflank-mailman (input) for mailman id 113603;
 Tue, 20 Apr 2021 12:32:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYpYh-0007Gl-2G
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:32:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdb9ad0c-b35f-4107-8f88-7526e3f83690;
 Tue, 20 Apr 2021 12:32:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4A8D4B2E2;
 Tue, 20 Apr 2021 12:32:49 +0000 (UTC)
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
X-Inumbo-ID: fdb9ad0c-b35f-4107-8f88-7526e3f83690
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618921969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzJ2zvxaFBZEyJ0VfIKGlqu6FRZCu862q22MyiJu+rw=;
	b=JzU43WafOKQqIbkeGqy8fYj5opIEFiQDgCN0Ezi7CTGeNay2XbC0OMdnVSb11SnvkDtYfc
	Hyfksasn3xJ83paWoW0eM30vSlj4rCySYmJll597Z7rU4z9fOMMu5irXpKSQK0P/Ff2+m5
	dqBK2lY6EN2Ak3jdLUX75f375ijBAIY=
Subject: Re: [PATCH v9 10/13] x86/smpboot: switch clone_mapping() to new APIs
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1617706782.git.hongyxia@amazon.com>
 <d55bcecc33df5b277bc3e1dbb48826bc816d8d10.1617706782.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de0df262-6c83-41d2-02d6-ce56d484baa2@suse.com>
Date: Tue, 20 Apr 2021 14:32:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d55bcecc33df5b277bc3e1dbb48826bc816d8d10.1617706782.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 13:05, Hongyan Xia wrote:
> @@ -742,51 +742,58 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>          }
>      }
>  
> +    UNMAP_DOMAIN_PAGE(pl1e);
> +    UNMAP_DOMAIN_PAGE(pl2e);
> +    UNMAP_DOMAIN_PAGE(pl3e);

Just one minor remark: A pedantic(?) compiler might warn about the
setting to NULL of pl3e here, when

>      if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
>      {
> -        pl3e = alloc_xen_pagetable();
> +        mfn_t l3mfn;
> +
> +        pl3e = alloc_map_clear_xen_pt(&l3mfn);
>          rc = -ENOMEM;
>          if ( !pl3e )
>              goto out;
> -        clear_page(pl3e);
>          l4e_write(&rpt[root_table_offset(linear)],
> -                  l4e_from_paddr(__pa(pl3e), __PAGE_HYPERVISOR));
> +                  l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR));
>      }
>      else
> -        pl3e = l4e_to_l3e(rpt[root_table_offset(linear)]);
> +        pl3e = map_l3t_from_l4e(rpt[root_table_offset(linear)]);

... it is guaranteed to get initialized again before any further
consumption. IOW strictly speaking the last of those three would
want to be unmap_domain_page(), just like you have ...

> @@ -802,6 +809,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>  
>      rc = 0;
>   out:
> +    unmap_domain_page(pl1e);
> +    unmap_domain_page(pl2e);
> +    unmap_domain_page(pl3e);
>      return rc;
>  }

... here.

Jan

