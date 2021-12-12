Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90790471770
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245529.423659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCvf-0000Kd-Lb; Sun, 12 Dec 2021 00:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245529.423659; Sun, 12 Dec 2021 00:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCvf-0000Gq-I2; Sun, 12 Dec 2021 00:41:27 +0000
Received: by outflank-mailman (input) for mailman id 245529;
 Sun, 12 Dec 2021 00:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwCvd-0000Ea-PX
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:41:25 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b5f8910-5ae4-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 01:41:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 806A23C1;
 Sun, 12 Dec 2021 01:41:23 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4QIe0UBnj1B; Sun, 12 Dec 2021 01:41:22 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 411ED1CF;
 Sun, 12 Dec 2021 01:41:22 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwCvZ-00255z-GS;
 Sun, 12 Dec 2021 01:41:21 +0100
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
X-Inumbo-ID: 3b5f8910-5ae4-11ec-bf02-3911bdbc85ab
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:41:21 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 07/10] mini-os: move x86 specific gnttab coding into
 arch/x86/gnttab.c
Message-ID: <20211212004121.27tquytcimfd47b5@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 806A23C1
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

Juergen Gross, le lun. 06 déc. 2021 08:23:34 +0100, a ecrit:
> Having grant table code in arch/x86/mm.c seems wrong. Move it to the
> new file arch/x86/gnttab.c, especially as the amount of code is
> expected to grow further.
> 
> No functional change.

There is the __pte fix that you'd probably want to mention.

> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/gnttab.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++
>  arch/x86/mm.c     | 47 ----------------------------
>  2 files changed, 78 insertions(+), 47 deletions(-)
>  create mode 100644 arch/x86/gnttab.c
> 
> diff --git a/arch/x86/gnttab.c b/arch/x86/gnttab.c
> new file mode 100644
> index 0000000..56e59d7
> --- /dev/null
> +++ b/arch/x86/gnttab.c
> @@ -0,0 +1,78 @@
> +/* -*-  Mode:C; c-basic-offset:4; tab-width:4 -*-
> + *
> + * (C) 2021 - Juergen Gross, SUSE Software Solutions Germany GmbH
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <mini-os/os.h>
> +#include <mini-os/hypervisor.h>
> +#include <mini-os/gnttab.h>
> +#include <mini-os/mm.h>
> +#include <mini-os/types.h>
> +
> +grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
> +{
> +    struct gnttab_setup_table setup;
> +    unsigned long frames[nr_grant_frames];
> +
> +    setup.dom = DOMID_SELF;
> +    setup.nr_frames = nr_grant_frames;
> +    set_xen_guest_handle(setup.frame_list, frames);
> +
> +    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
> +    return map_frames(frames, nr_grant_frames);
> +}
> +
> +void arch_suspend_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
> +{
> +#ifdef CONFIG_PARAVIRT
> +    int i;
> +
> +    for ( i = 0; i < nr_grant_frames; i++ )
> +    {
> +        HYPERVISOR_update_va_mapping((unsigned long)gnttab_table + PAGE_SIZE * i,
> +                __pte(0x0 << PAGE_SHIFT), UVMF_INVLPG);
> +    }
> +#endif
> +    return;
> +}
> +
> +void arch_resume_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
> +{
> +    struct gnttab_setup_table setup;
> +    unsigned long frames[nr_grant_frames];
> +#ifdef CONFIG_PARAVIRT
> +    int i;
> +#endif
> +
> +    setup.dom = DOMID_SELF;
> +    setup.nr_frames = nr_grant_frames;
> +    set_xen_guest_handle(setup.frame_list, frames);
> +
> +    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
> +
> +#ifdef CONFIG_PARAVIRT
> +    for ( i = 0; i < nr_grant_frames; i++ )
> +    {
> +        HYPERVISOR_update_va_mapping((unsigned long)gnttab_table + PAGE_SIZE * i,
> +                __pte((frames[i] << PAGE_SHIFT) | L1_PROT), UVMF_INVLPG);
> +    }
> +#endif
> +}
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index c30d8bc..220c0b4 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -837,53 +837,6 @@ void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p)
>  #endif
>  }
>  
> -grant_entry_v1_t *arch_init_gnttab(int nr_grant_frames)
> -{
> -    struct gnttab_setup_table setup;
> -    unsigned long frames[nr_grant_frames];
> -
> -    setup.dom = DOMID_SELF;
> -    setup.nr_frames = nr_grant_frames;
> -    set_xen_guest_handle(setup.frame_list, frames);
> -
> -    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
> -    return map_frames(frames, nr_grant_frames);
> -}
> -
> -void arch_suspend_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
> -{
> -#ifdef CONFIG_PARAVIRT
> -    int i;
> -
> -    for (i = 0; i < nr_grant_frames; i++) {
> -        HYPERVISOR_update_va_mapping((unsigned long)(((char *)gnttab_table) + PAGE_SIZE * i),
> -                (pte_t){0x0<<PAGE_SHIFT}, UVMF_INVLPG);
> -    }
> -#endif
> -    return;
> -}
> -
> -void arch_resume_gnttab(grant_entry_v1_t *gnttab_table, int nr_grant_frames)
> -{
> -    struct gnttab_setup_table setup;
> -    unsigned long frames[nr_grant_frames];
> -#ifdef CONFIG_PARAVIRT
> -    int i;
> -#endif
> -    setup.dom = DOMID_SELF;
> -    setup.nr_frames = nr_grant_frames;
> -    set_xen_guest_handle(setup.frame_list, frames);
> -
> -    HYPERVISOR_grant_table_op(GNTTABOP_setup_table, &setup, 1);
> -
> -#ifdef CONFIG_PARAVIRT
> -    for (i = 0; i < nr_grant_frames; i++) {
> -        HYPERVISOR_update_va_mapping((unsigned long)(((char *)gnttab_table) + PAGE_SIZE * i),
> -                (pte_t){(frames[i] << PAGE_SHIFT) | L1_PROT}, UVMF_INVLPG);
> -    }
> -#endif
> -}
> -
>  unsigned long alloc_virt_kernel(unsigned n_pages)
>  {
>      unsigned long addr;
> -- 
> 2.26.2
> 

-- 
Samuel
War doesn't prove who's right, just who's left.

