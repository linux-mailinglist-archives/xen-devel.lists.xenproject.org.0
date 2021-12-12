Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED127471771
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245537.423672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCxi-00013n-6h; Sun, 12 Dec 2021 00:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245537.423672; Sun, 12 Dec 2021 00:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCxi-00011Q-3A; Sun, 12 Dec 2021 00:43:34 +0000
Received: by outflank-mailman (input) for mailman id 245537;
 Sun, 12 Dec 2021 00:43:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwCxg-0000zD-G8
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:43:32 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86ef05c4-5ae4-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 01:43:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id E12563C1;
 Sun, 12 Dec 2021 01:43:29 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jN9RwrQgMh7V; Sun, 12 Dec 2021 01:43:29 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id E724D1CF;
 Sun, 12 Dec 2021 01:43:28 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwCxc-00256f-2y;
 Sun, 12 Dec 2021 01:43:28 +0100
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
X-Inumbo-ID: 86ef05c4-5ae4-11ec-bf02-3911bdbc85ab
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:43:28 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 08/10] mini-os: add proper pvh grant table handling
Message-ID: <20211212004328.ozyid2zh4fapcnit@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-9-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: E12563C1
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

Juergen Gross, le lun. 06 déc. 2021 08:23:35 +0100, a ecrit:
> Grant table initialization for PVH requires some additional actions
> compared to PV mode. Add those.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/gnttab.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/x86/gnttab.c b/arch/x86/gnttab.c
> index 56e59d7..281c207 100644
> --- a/arch/x86/gnttab.c
> +++ b/arch/x86/gnttab.c
> @@ -22,11 +22,15 @@
>   */
>  
>  #include <mini-os/os.h>
> +#include <mini-os/console.h>
> +#include <mini-os/e820.h>
>  #include <mini-os/hypervisor.h>
>  #include <mini-os/gnttab.h>
>  #include <mini-os/mm.h>
>  #include <mini-os/types.h>
> +#include <xen/memory.h>
>  
> +#ifdef CONFIG_PARAVIRT
>  grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
>  {
>      struct gnttab_setup_table setup;
> @@ -39,6 +43,33 @@ grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
>      HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
>      return map_frames(frames, nr_grant_frames);
>  }
> +#else
> +grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
> +{
> +    int i, rc;
> +    struct xen_add_to_physmap xatp;
> +    unsigned long pfn;
> +    unsigned long frames[nr_grant_frames];
> +
> +    pfn = e820_get_reserved_pfns(nr_grant_frames);
> +    for ( i = 0; i < nr_grant_frames; i++ )
> +    {
> +        xatp.domid = DOMID_SELF;
> +        xatp.idx = i;
> +        xatp.space = XENMAPSPACE_grant_table;
> +        xatp.gpfn = pfn + i;
> +        rc = HYPERVISOR_memory_op(XENMEM_add_to_physmap, &xatp);
> +        if ( rc )
> +        {
> +            xprintk("could not init grant table\n");
> +            do_exit();
> +        }
> +        frames[i] = pfn + i;
> +    }
> +
> +    return map_frames(frames, nr_grant_frames);
> +}
> +#endif
>  
>  void arch_suspend_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
>  {
> -- 
> 2.26.2
> 

-- 
Samuel
 > Il [e2fsck] a bien démarré, mais il m'a rendu la main aussitot en me
 > disant "houlala, c'est pas beau à voir votre truc, je préfèrerai que
 > vous teniez vous même la tronçonneuse" (traduction libre)
 NC in Guide du linuxien pervers : "Bien configurer sa tronçonneuse."

