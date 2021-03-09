Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E85333191
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 23:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95823.180882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkww-0007sB-N8; Tue, 09 Mar 2021 22:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95823.180882; Tue, 09 Mar 2021 22:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJkww-0007rm-JQ; Tue, 09 Mar 2021 22:35:34 +0000
Received: by outflank-mailman (input) for mailman id 95823;
 Tue, 09 Mar 2021 22:35:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJkwv-0007rh-Cb
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 22:35:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6239356-4ecd-4403-88e2-8d5e3072ec97;
 Tue, 09 Mar 2021 22:35:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDEA165100;
 Tue,  9 Mar 2021 22:35:31 +0000 (UTC)
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
X-Inumbo-ID: f6239356-4ecd-4403-88e2-8d5e3072ec97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615329332;
	bh=VN9rZoWbHkLdYDlNXm4OHg/xd2sYDympEa+yPJV165I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HDx/84d5HDbiTMts7VoaS1jCvn0FyZxx4ySh5tNmm/I1noPq4EzFiQtWdfV19OHoD
	 I91RShh4lXyBgYuH7hVuPB+HmRtgKLWhhzeOqTanMxLiOSDBgxRKy1PxNlt/KBnKNy
	 yMtId5xQBQR43YRqUei6XopmhB8n6DU6Orcwn/ePEsA8JMHeKW0NB5XpCf7BUnXVVa
	 wEOxeZ/1a2sUyFqyzw1IamrPJHy61AokA1+YzPHnoTCKWCotuFcShxDzkdqKWIgh7b
	 TFR2DJ4rVBXh6VG/MWeQqsT8ekTfvUSoeyG7yXK+NELnMXQpj2t5ePm+RLs+9dV8iJ
	 EyVErxeGk9t6Q==
Date: Tue, 9 Mar 2021 14:35:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Xen: drop exports of {set,clear}_foreign_p2m_mapping()
In-Reply-To: <746a5cd6-1446-eda4-8b23-03c1cac30b8d@suse.com>
Message-ID: <alpine.DEB.2.21.2103091434000.16374@sstabellini-ThinkPad-T480s>
References: <746a5cd6-1446-eda4-8b23-03c1cac30b8d@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Mar 2021, Jan Beulich wrote:
> They're only used internally, and the layering violation they contain
> (x86) or imply (Arm) of calling HYPERVISOR_grant_table_op() strongly
> advise against any (uncontrolled) use from a module. The functions also
> never had users except the ones from drivers/xen/grant-table.c forever
> since their introduction in 3.15.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> It's not clear to me why Arm doesn't have merely stubs just like x86 has
> when PV support is disabled.
 
ARM implements the two functions to keep track of foreign pages mapped
into the system. It uses swiotlb-xen to translate gfn to mfn for foreign
pages. Local pages are 1:1. This way, an IOMMU is not required.


> --- a/arch/arm/xen/p2m.c
> +++ b/arch/arm/xen/p2m.c
> @@ -130,7 +130,6 @@ int set_foreign_p2m_mapping(struct gntta
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(set_foreign_p2m_mapping);
>  
>  int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
>  			      struct gnttab_unmap_grant_ref *kunmap_ops,
> @@ -145,7 +144,6 @@ int clear_foreign_p2m_mapping(struct gnt
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(clear_foreign_p2m_mapping);
>  
>  bool __set_phys_to_machine_multi(unsigned long pfn,
>  		unsigned long mfn, unsigned long nr_pages)
> --- a/arch/x86/xen/p2m.c
> +++ b/arch/x86/xen/p2m.c
> @@ -776,7 +776,6 @@ int set_foreign_p2m_mapping(struct gntta
>  out:
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(set_foreign_p2m_mapping);
>  
>  int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
>  			      struct gnttab_unmap_grant_ref *kunmap_ops,
> @@ -802,7 +801,6 @@ int clear_foreign_p2m_mapping(struct gnt
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(clear_foreign_p2m_mapping);
>  
>  #ifdef CONFIG_XEN_DEBUG_FS
>  #include <linux/debugfs.h>
> 

