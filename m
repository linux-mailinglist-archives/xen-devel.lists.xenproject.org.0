Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFA48709C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 03:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254251.435905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5fAE-0002NK-SQ; Fri, 07 Jan 2022 02:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254251.435905; Fri, 07 Jan 2022 02:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5fAE-0002LH-OI; Fri, 07 Jan 2022 02:39:34 +0000
Received: by outflank-mailman (input) for mailman id 254251;
 Fri, 07 Jan 2022 02:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHxo=RX=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n5fAD-0002L6-Ag
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 02:39:33 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098cce22-6f63-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 03:39:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id AFCA1FF;
 Fri,  7 Jan 2022 03:39:28 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17FGiXXIGYMX; Fri,  7 Jan 2022 03:39:27 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 5F7E0295;
 Fri,  7 Jan 2022 03:39:27 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n5fA5-001Sjd-QV;
 Fri, 07 Jan 2022 03:39:25 +0100
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
X-Inumbo-ID: 098cce22-6f63-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Fri, 7 Jan 2022 03:39:25 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 00/15] mini-os: remove struct file dependency from config
Message-ID: <20220107023925.535yyongimla2umw@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: AFCA1FF
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

Hello,

I had a glimpse at the changes, this looks good to me!

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
on the whole series.

I'll see when I'll be able to find time to review the changes, unless
somebody beats me to it :)

Samuel

Juergen Gross, le jeu. 06 janv. 2022 12:57:26 +0100, a ecrit:
> Today the layout of struct file is depending on the Mini-OS
> configuration. This is especially bad as the layout is exported to
> external users like the Xen libraries built for Mini-OS, and those
> are being built only once for multiple stubdom configurations.
> 
> Today there is no direct problem resulting from this, as the main
> difference between struct file layouts is a large union containing all
> the device specific data for the different file types. The largest
> union member is not configuration dependant, so the build is currently
> not broken.
> 
> In order to avoid any future problems this patch series is eliminating
> the configuration dependency by replacing most of the device specific
> union members by a single pointer.
> 
> The two union members used by Xen libraries can't be replaced yet, as
> those need to be switched to use the generic pointer first.
> 
> In order to hide the Mini-OS internal implementation of the files
> array, the last patch is introducing a service function for obtaining
> the pointer to struct file for a given file descriptor, which must be
> used for that purpose by all Mini-OS external components.
> 
> Juergen Gross (15):
>   mini-os: split struct file definition from its usage
>   mini-os: makes file.read bool and move it ahead of device specific
>     part
>   mini-os: make offset a common struct file member for all types
>   mini-os: replace multiple fd elements in struct file by common one
>   mini-os: introduce a common dev pointer in struct file
>   mini-os: eliminate blkfront union member in struct file
>   mini-os: eliminate consfront union member in struct file
>   mini-os: eliminate fbfront union member in struct file
>   mini-os: eliminate kbdfront union member in struct file
>   mini-os: eliminate netfront union member in struct file
>   mini-os: move tpm respgot member of struct file to device specific
>     data
>   mini-os: eliminate tpmfront union member in struct file
>   mini-os: eliminate tpmtis union member in struct file
>   mini-os: eliminate xenbus union member in struct file
>   mini-os: introduce get_file_from_fd()
> 
>  blkfront.c             |  15 +++---
>  console/xencons_ring.c |   2 +-
>  fbfront.c              |  16 +++----
>  include/lib.h          |  59 ++++-------------------
>  include/tpmfront.h     |   2 +
>  lib/sys.c              | 103 ++++++++++++++++++++++-------------------
>  lib/xs.c               |  13 +++---
>  netfront.c             |   6 +--
>  tpm_tis.c              |  23 ++++-----
>  tpmfront.c             |  33 +++++++------
>  10 files changed, 119 insertions(+), 153 deletions(-)
> 
> -- 
> 2.26.2

