Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903BE47176E
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245522.423638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCrb-0007Gq-Uj; Sun, 12 Dec 2021 00:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245522.423638; Sun, 12 Dec 2021 00:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCrb-0007EM-Qy; Sun, 12 Dec 2021 00:37:15 +0000
Received: by outflank-mailman (input) for mailman id 245522;
 Sun, 12 Dec 2021 00:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwCra-0007EB-Ae
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:37:14 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5fcb489-5ae3-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 01:37:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8D9493C1;
 Sun, 12 Dec 2021 01:37:12 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krA46Fvan94B; Sun, 12 Dec 2021 01:37:12 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 0F1EF229;
 Sun, 12 Dec 2021 01:37:11 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwCrX-00251x-5g;
 Sun, 12 Dec 2021 01:37:11 +0100
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
X-Inumbo-ID: a5fcb489-5ae3-11ec-bf02-3911bdbc85ab
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:37:11 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 06/10] mini-os: add memory map service functions
Message-ID: <20211212003711.l7jsqgbbxjzgl5iv@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 8D9493C1
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

Juergen Gross, le lun. 06 déc. 2021 08:23:33 +0100, a ecrit:
> +void e820_put_reserved_pfns(unsigned long start_pfn, int pages)
> +{
> +    int i;
> +    unsigned long addr = start_pfn << PAGE_SHIFT;
> +    unsigned long size = (long)pages << PAGE_SHIFT;
> +
> +    for ( i = 0; i < e820_entries && addr < e820_map[i].addr; i++ );

Shouldn't that be addr > e820_map[i].addr + e820_map[i].size?

> +    BUG_ON(i == e820_entries || e820_map[i].type != E820_RESERVED);

We should also BUG_ON e820_map[i].addr > addr (i.e. we didn't find an
entry that contained our address).

> +    if ( addr == e820_map[i].addr )
> +    {
> +        e820_map[i].addr += size;

I'd say BUG_ON here if e820_map[i].size < size.

> +        e820_map[i].size -= size;
> +        if ( e820_map[i].size == 0 )
> +            e820_remove_entry(i);
> +        return;
> +    }
> +
> +    if ( addr + size == e820_map[i].addr + e820_map[i].size )
> +    {
> +        e820_map[i].addr = addr;
> +        e820_map[i].size = size;

? Shouldn't that rather be just

> +        e820_map[i].size -= size;

? (since what we remove is at the end of the area, the start of the area
doesn't change)

> +        return;
> +    }

