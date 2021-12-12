Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD0471773
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245544.423699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwD4y-00035L-9r; Sun, 12 Dec 2021 00:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245544.423699; Sun, 12 Dec 2021 00:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwD4y-00032q-5y; Sun, 12 Dec 2021 00:51:04 +0000
Received: by outflank-mailman (input) for mailman id 245544;
 Sun, 12 Dec 2021 00:51:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwD4x-0002gD-7x
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:51:03 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9426cb2d-5ae5-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 01:51:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id F26C13C1;
 Sun, 12 Dec 2021 01:51:01 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uElmtqq-kG3t; Sun, 12 Dec 2021 01:51:01 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 2141928B;
 Sun, 12 Dec 2021 01:51:01 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwD4u-0025BY-DH;
 Sun, 12 Dec 2021 01:51:00 +0100
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
X-Inumbo-ID: 9426cb2d-5ae5-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:51:00 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 10/10] mini-os: modify grant mappings to work in PVH mode
Message-ID: <20211212005100.gld3gajiwiog54rv@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-11-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-11-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: F26C13C1
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le lun. 06 déc. 2021 08:23:37 +0100, a ecrit:
> For being able to use the grant mapping interface in PVH mode some
> changes are required, as the guest needs to specify a physical address
> in the hypercall interface.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  gntmap.c         | 81 ++++++++++++++++++++++++++++++++++--------------
>  include/gntmap.h |  1 +
>  2 files changed, 59 insertions(+), 23 deletions(-)
> 
> diff --git a/gntmap.c b/gntmap.c
> index 7ae8fe6..126b04f 100644
> --- a/gntmap.c
> +++ b/gntmap.c
> @@ -32,6 +32,7 @@
>  
>  #include <mini-os/os.h>
>  #include <mini-os/lib.h>
> +#include <mini-os/e820.h>
>  #include <mini-os/xmalloc.h>
>  #include <errno.h>
>  #include <xen/grant_table.h>
> @@ -97,11 +98,42 @@ gntmap_set_max_grants(struct gntmap *map, int count)
>      if (map->entries == NULL)
>          return -ENOMEM;
>  
> +#ifndef CONFIG_PARAVIRT
> +    map->start_pfn = e820_get_reserved_pfns(count);
> +#endif
> +
>      memset(map->entries, 0, sizeof(struct gntmap_entry) * count);
>      map->nentries = count;
>      return 0;
>  }
>  
> +static int
> +_gntmap_unmap_grant_ref(struct gntmap *map, int idx)
> +{
> +    struct gntmap_entry *entry = map->entries + idx;
> +    struct gnttab_unmap_grant_ref op;
> +    int rc;
> +
> +#ifdef CONFIG_PARAVIRT
> +    op.host_addr    = (uint64_t) entry->host_addr;
> +#else
> +    op.host_addr    = (uint64_t)(map->start_pfn + idx) << PAGE_SHIFT;
> +#endif
> +    op.dev_bus_addr = 0;
> +    op.handle       = entry->handle;
> +
> +    rc = HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, &op, 1);
> +    if (rc != 0 || op.status != GNTST_okay) {
> +        printk("GNTTABOP_unmap_grant_ref failed: "
> +               "returned %d, status %" PRId16 "\n",
> +               rc, op.status);
> +        return rc != 0 ? rc : op.status;
> +    }
> +
> +    entry->host_addr = 0;
> +    return 0;
> +}
> +
>  static int
>  _gntmap_map_grant_ref(struct gntmap *map, int idx,
>                        unsigned long host_addr,
> @@ -112,10 +144,17 @@ _gntmap_map_grant_ref(struct gntmap *map, int idx,
>      struct gntmap_entry *entry = map->entries + idx;
>      struct gnttab_map_grant_ref op;
>      int rc;
> +#ifndef CONFIG_PARAVIRT
> +    unsigned long pfn = map->start_pfn + idx;
> +#endif
>  
>      op.ref = (grant_ref_t) ref;
>      op.dom = (domid_t) domid;
> +#ifdef CONFIG_PARAVIRT
>      op.host_addr = (uint64_t) host_addr;
> +#else
> +    op.host_addr = (uint64_t)pfn << PAGE_SHIFT; 
> +#endif
>      op.flags = GNTMAP_host_map;
>      if (!writable)
>          op.flags |= GNTMAP_readonly;
> @@ -128,31 +167,18 @@ _gntmap_map_grant_ref(struct gntmap *map, int idx,
>          return rc != 0 ? rc : op.status;
>      }
>  
> -    entry->host_addr = host_addr;
> -    entry->handle = op.handle;
> -    return 0;
> -}
> -
> -static int
> -_gntmap_unmap_grant_ref(struct gntmap *map, int idx)
> -{
> -    struct gntmap_entry *entry = map->entries + idx;
> -    struct gnttab_unmap_grant_ref op;
> -    int rc;
> -
> -    op.host_addr    = (uint64_t) entry->host_addr;
> -    op.dev_bus_addr = 0;
> -    op.handle       = entry->handle;
> -
> -    rc = HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, &op, 1);
> -    if (rc != 0 || op.status != GNTST_okay) {
> -        printk("GNTTABOP_unmap_grant_ref failed: "
> -               "returned %d, status %" PRId16 "\n",
> -               rc, op.status);
> -        return rc != 0 ? rc : op.status;
> +#ifndef CONFIG_PARAVIRT
> +    rc = do_map_frames(host_addr, &pfn, 1, 0, 0, DOMID_SELF, NULL,
> +                       writable ? L1_PROT : L1_PROT_RO);
> +    if ( rc )
> +    {
> +        _gntmap_unmap_grant_ref(map, idx);
> +        return rc;
>      }
> +#endif
>  
> -    entry->host_addr = 0;
> +    entry->host_addr = host_addr;
> +    entry->handle = op.handle;
>      return 0;
>  }
>  
> @@ -165,6 +191,10 @@ gntmap_munmap(struct gntmap *map, unsigned long start_address, int count)
>      DEBUG("(map=%p, start_address=%lx, count=%d)",
>             map, start_address, count);
>  
> +#ifndef CONFIG_PARAVIRT
> +    unmap_frames(start_address, count);
> +#endif
> +
>      for (i = 0; i < count; i++) {
>          idx = gntmap_find_entry(map, start_address + PAGE_SIZE * i);
>          if (idx < 0) {
> @@ -242,6 +272,11 @@ gntmap_fini(struct gntmap *map)
>              (void) _gntmap_unmap_grant_ref(map, i);
>      }
>  
> +#ifndef CONFIG_PARAVIRT
> +    e820_put_reserved_pfns(map->start_pfn, map->nentries);
> +    map->start_pfn = 0;
> +#endif
> +
>      xfree(map->entries);
>      map->entries = NULL;
>      map->nentries = 0;
> diff --git a/include/gntmap.h b/include/gntmap.h
> index fde53f3..d3d7e88 100644
> --- a/include/gntmap.h
> +++ b/include/gntmap.h
> @@ -10,6 +10,7 @@
>  struct gntmap {
>      int nentries;
>      struct gntmap_entry *entries;
> +    unsigned long start_pfn;
>  };
>  
>  int
> -- 
> 2.26.2
> 

-- 
Samuel
 Yep. Moi j'ai un clavier à une touche. 
 Par contre, ma souris a 102 boutons, c'est pas toujours pratique.
 -+- OG in: Guide du Cabaliste Usenet - Le mulot contre attaque -+-

