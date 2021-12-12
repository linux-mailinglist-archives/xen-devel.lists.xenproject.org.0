Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFC471762
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245511.423613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwChC-0004jJ-L2; Sun, 12 Dec 2021 00:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245511.423613; Sun, 12 Dec 2021 00:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwChC-0004hW-HU; Sun, 12 Dec 2021 00:26:30 +0000
Received: by outflank-mailman (input) for mailman id 245511;
 Sun, 12 Dec 2021 00:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwChB-0004fO-5h
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:26:29 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24686e93-5ae2-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 01:26:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8FD6F3DB;
 Sun, 12 Dec 2021 01:26:25 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHojSOqlstbh; Sun, 12 Dec 2021 01:26:25 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 0A0CF254;
 Sun, 12 Dec 2021 01:26:24 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwCh6-0024s8-3U;
 Sun, 12 Dec 2021 01:26:24 +0100
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
X-Inumbo-ID: 24686e93-5ae2-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:26:24 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 04/10] mini-os: respect memory map when ballooning up
Message-ID: <20211212002624.fmmebrd5sudcmco4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 8FD6F3DB
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

Juergen Gross, le lun. 06 déc. 2021 08:23:31 +0100, a ecrit:
> @@ -81,8 +93,11 @@ int balloon_up(unsigned long n_pages)
>      if ( n_pages > N_BALLOON_FRAMES )
>          n_pages = N_BALLOON_FRAMES;
>  
> +    start_pfn = e820_get_maxpfn(nr_mem_pages + 1) - 1;
> +    n_pages = e820_get_max_pages(start_pfn, n_pages);

I'd say call it e820_get_max_contig_pages?

> +unsigned long e820_get_max_pages(unsigned long pfn, unsigned long pages)
> +{
> +    int i;
> +    unsigned long end;
> +
> +    for ( i = 0; i < e820_entries; i++ )
> +    {
> +        if ( e820_map[i].type != E820_RAM ||
> +             (e820_map[i].addr >> PAGE_SHIFT) > pfn )
> +            continue;

"> pfn" looks odd to me? If the start of the e820 entry is already
beyond pfn, we'll never find any other entry. We however do want to skip
entries that have addr+size that is below pfn.

> +        end = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
> +        return ((end - pfn) > pages) ? pages : end - pfn;
> +    }
> +
> +    return 0;
> +}

