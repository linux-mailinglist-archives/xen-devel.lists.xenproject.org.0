Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A786471772
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245542.423683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwD4n-0002j9-Ub; Sun, 12 Dec 2021 00:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245542.423683; Sun, 12 Dec 2021 00:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwD4n-0002gO-RS; Sun, 12 Dec 2021 00:50:53 +0000
Received: by outflank-mailman (input) for mailman id 245542;
 Sun, 12 Dec 2021 00:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwD4m-0002gD-D8
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:50:52 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd37ad9-5ae5-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 01:50:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 4E27F3C1;
 Sun, 12 Dec 2021 01:50:49 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eQWN4mfQbNI; Sun, 12 Dec 2021 01:50:48 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 0107C28B;
 Sun, 12 Dec 2021 01:50:47 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwD4h-0025BJ-50;
 Sun, 12 Dec 2021 01:50:47 +0100
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
X-Inumbo-ID: 8cd37ad9-5ae5-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:50:47 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 09/10] mini-os: prepare grantmap entry interface for use
 by PVH mode
Message-ID: <20211212005047.ksbjkax2veon2dvl@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-10-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-10-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 4E27F3C1
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

Juergen Gross, le lun. 06 déc. 2021 08:23:36 +0100, a ecrit:
> Instead of passing the pointer of a grantmap entry to the
> _gntmap_[un]map_grant_ref() sub-functions use the map pointer and the
> entry index instead. This will be needed for PVH mode usage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  gntmap.c | 48 +++++++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
> 
> diff --git a/gntmap.c b/gntmap.c
> index f6ab3ad..7ae8fe6 100644
> --- a/gntmap.c
> +++ b/gntmap.c
> @@ -55,36 +55,34 @@ struct gntmap_entry {
>  };
>  
>  static inline int
> -gntmap_entry_used(struct gntmap_entry *entry)
> +gntmap_entry_used(struct gntmap *map, int idx)
>  {
> -    return entry->host_addr != 0;
> +    return map->entries[idx].host_addr != 0;
>  }
>  
> -static struct gntmap_entry*
> -gntmap_find_free_entry(struct gntmap *map)
> +static int gntmap_find_free_entry(struct gntmap *map)
>  {
>      int i;
>  
>      for (i = 0; i < map->nentries; i++) {
> -        if (!gntmap_entry_used(&map->entries[i]))
> -            return &map->entries[i];
> +        if (!gntmap_entry_used(map, i))
> +            return i;
>      }
>  
>      DEBUG("(map=%p): all %d entries full",
>             map, map->nentries);
> -    return NULL;
> +    return -1;
>  }
>  
> -static struct gntmap_entry*
> -gntmap_find_entry(struct gntmap *map, unsigned long addr)
> +static int gntmap_find_entry(struct gntmap *map, unsigned long addr)
>  {
>      int i;
>  
>      for (i = 0; i < map->nentries; i++) {
>          if (map->entries[i].host_addr == addr)
> -            return &map->entries[i];
> +            return i;
>      }
> -    return NULL;
> +    return -1;
>  }
>  
>  int
> @@ -105,12 +103,13 @@ gntmap_set_max_grants(struct gntmap *map, int count)
>  }
>  
>  static int
> -_gntmap_map_grant_ref(struct gntmap_entry *entry, 
> +_gntmap_map_grant_ref(struct gntmap *map, int idx,
>                        unsigned long host_addr,
>                        uint32_t domid,
>                        uint32_t ref,
>                        int writable)
>  {
> +    struct gntmap_entry *entry = map->entries + idx;
>      struct gnttab_map_grant_ref op;
>      int rc;
>  
> @@ -135,8 +134,9 @@ _gntmap_map_grant_ref(struct gntmap_entry *entry,
>  }
>  
>  static int
> -_gntmap_unmap_grant_ref(struct gntmap_entry *entry)
> +_gntmap_unmap_grant_ref(struct gntmap *map, int idx)
>  {
> +    struct gntmap_entry *entry = map->entries + idx;
>      struct gnttab_unmap_grant_ref op;
>      int rc;
>  
> @@ -160,19 +160,19 @@ int
>  gntmap_munmap(struct gntmap *map, unsigned long start_address, int count)
>  {
>      int i, rc;
> -    struct gntmap_entry *ent;
> +    int idx;
>  
>      DEBUG("(map=%p, start_address=%lx, count=%d)",
>             map, start_address, count);
>  
>      for (i = 0; i < count; i++) {
> -        ent = gntmap_find_entry(map, start_address + PAGE_SIZE * i);
> -        if (ent == NULL) {
> +        idx = gntmap_find_entry(map, start_address + PAGE_SIZE * i);
> +        if (idx < 0) {
>              printk("gntmap: tried to munmap unknown page\n");
>              return -EINVAL;
>          }
>  
> -        rc = _gntmap_unmap_grant_ref(ent);
> +        rc = _gntmap_unmap_grant_ref(map, idx);
>          if (rc != 0)
>              return rc;
>      }
> @@ -189,7 +189,7 @@ gntmap_map_grant_refs(struct gntmap *map,
>                        int writable)
>  {
>      unsigned long addr;
> -    struct gntmap_entry *ent;
> +    int idx;
>      int i;
>  
>      DEBUG("(map=%p, count=%" PRIu32 ", "
> @@ -206,9 +206,9 @@ gntmap_map_grant_refs(struct gntmap *map,
>          return NULL;
>  
>      for (i = 0; i < count; i++) {
> -        ent = gntmap_find_free_entry(map);
> -        if (ent == NULL ||
> -            _gntmap_map_grant_ref(ent,
> +        idx = gntmap_find_free_entry(map);
> +        if (idx < 0 ||
> +            _gntmap_map_grant_ref(map, idx,
>                                    addr + PAGE_SIZE * i,
>                                    domids[i * domids_stride],
>                                    refs[i],
> @@ -233,15 +233,13 @@ gntmap_init(struct gntmap *map)
>  void
>  gntmap_fini(struct gntmap *map)
>  {
> -    struct gntmap_entry *ent;
>      int i;
>  
>      DEBUG("(map=%p)", map);
>  
>      for (i = 0; i < map->nentries; i++) {
> -        ent = &map->entries[i];
> -        if (gntmap_entry_used(ent))
> -            (void) _gntmap_unmap_grant_ref(ent);
> +        if (gntmap_entry_used(map, i))
> +            (void) _gntmap_unmap_grant_ref(map, i);
>      }
>  
>      xfree(map->entries);
> -- 
> 2.26.2
> 

-- 
Samuel
<L> pour moi le seul qui est autorisé à fasciser, c moi :-)

