Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEDB47B62A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 00:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250056.430637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzRzJ-0000q5-Sr; Mon, 20 Dec 2021 23:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250056.430637; Mon, 20 Dec 2021 23:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzRzJ-0000lZ-Oh; Mon, 20 Dec 2021 23:22:37 +0000
Received: by outflank-mailman (input) for mailman id 250056;
 Mon, 20 Dec 2021 23:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lA0=RF=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mzRzI-0000lC-In
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 23:22:36 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b56776d1-61eb-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 00:22:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id CB62C4EC;
 Tue, 21 Dec 2021 00:22:32 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FQ-1_piAvVs; Tue, 21 Dec 2021 00:22:32 +0100 (CET)
Received: from begin.home (2a01cb0088600700de41a9fffe47ec49.ipv6.abo.wanadoo.fr
 [IPv6:2a01:cb00:8860:700:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 2741A199;
 Tue, 21 Dec 2021 00:22:32 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mzRzD-00069H-GA;
 Tue, 21 Dec 2021 00:22:31 +0100
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
X-Inumbo-ID: b56776d1-61eb-11ec-8d39-b1a4ed000e3e
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 21 Dec 2021 00:22:31 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 04/10] mini-os: respect memory map when ballooning up
Message-ID: <20211220232231.sylwjfk6rsjrgeqi@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211220160716.4159-1-jgross@suse.com>
 <20211220160716.4159-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220160716.4159-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: CB62C4EC
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

Juergen Gross, le lun. 20 déc. 2021 17:07:10 +0100, a ecrit:
> +unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages)
> +{
> +    int i;
> +    unsigned long end;
> +
> +    for ( i = 0; i < e820_entries && e820_map[i].addr < (pfn << PAGE_SHIFT);

Shouldn't that be addr+size? Otherwise if pfn is in the middle of an
e820 entry, we will miss picking up that.

> +          i++ )
> +    {
> +        end = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
> +        if ( e820_map[i].type != E820_RAM || end <= pfn )
> +            continue;
> +
> +        return ((end - pfn) > pages) ? pages : end - pfn;
> +    }
> +
> +    return 0;
> +}

