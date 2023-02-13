Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300469548B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 00:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494866.765042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRi0m-0005HO-Tr; Mon, 13 Feb 2023 23:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494866.765042; Mon, 13 Feb 2023 23:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRi0m-0005Dz-QN; Mon, 13 Feb 2023 23:13:28 +0000
Received: by outflank-mailman (input) for mailman id 494866;
 Mon, 13 Feb 2023 23:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xl=6J=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pRi0l-0004r4-A4
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 23:13:27 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04819dda-abf4-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 00:13:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 51D392015E;
 Tue, 14 Feb 2023 00:13:25 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6mMgcOWUcc4; Tue, 14 Feb 2023 00:13:25 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 33F742013C;
 Tue, 14 Feb 2023 00:13:25 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pRi0i-00FwLB-2v;
 Tue, 14 Feb 2023 00:13:24 +0100
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
X-Inumbo-ID: 04819dda-abf4-11ed-933c-83870f6b2ba8
Date: Tue, 14 Feb 2023 00:13:24 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 0/7] Mini-OS: add minimal 9pfs support
Message-ID: <20230213231324.zfax6v5elvndzky3@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230213084412.21065-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213084412.21065-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Thanks!!

Juergen Gross, le lun. 13 févr. 2023 09:44:05 +0100, a ecrit:
> This series is adding minimal support to use 9pfs in Mini-OS. It is
> adding a PV 9pfs frontend and the ability to open, close, read and
> write files.
> 
> The series has been tested with qemu as 9pfs backend in a PVH Mini-OS
> guest (I've used a slightly modified Xenstore-stubdom for that purpose
> in order to reuse the build runes).
> 
> This series is meant to setup the stage for adding file based logging
> support to Xenstore-stubdom and later to add live update support (being
> able to save the LU data stream in a dom0 file makes this a _lot_
> easier).
> 
> In order to keep Mini-OS's license I have only used the protocol docs
> available on the internet [1] and then verified those with the qemu 9pfs
> backend implementation (especially for supporting the 9P2000.u variant,
> as qemu doesn't support the basic 9P2000 protocol).
> 
> The needed fixed values of the protocol have been taken from [2].
> 
> [1]: http://ericvh.github.io/9p-rfc/rfc9p2000.html
> [2]: https://github.com/0intro/libixp
> 
> Changes in V2:
> - addressed comments by Samuel Thibault
> 
> Changes in V3:
> - addressed comments by Samuel Thibault and Andrew Cooper
> 
> Juergen Gross (7):
>   Mini-OS: xenbus: add support for reading node from directory
>   Mini-OS: add concept of mount points
>   Mini-OS: add support for runtime mounts
>   Mini-OS: add 9pfs frontend
>   Mini-OS: add 9pfs transport layer
>   Mini-OS: add open and close handling to the 9pfs frontend
>   Mini-OS: add read and write support to 9pfsfront
> 
>  9pfront.c                     | 1300 +++++++++++++++++++++++++++++++++
>  Config.mk                     |    1 +
>  Makefile                      |    1 +
>  arch/x86/testbuild/all-no     |    1 +
>  arch/x86/testbuild/all-yes    |    1 +
>  arch/x86/testbuild/newxen-yes |    1 +
>  include/9pfront.h             |    7 +
>  include/lib.h                 |   14 +
>  include/xenbus.h              |    6 +
>  lib/sys.c                     |  123 +++-
>  xenbus.c                      |   40 +-
>  11 files changed, 1473 insertions(+), 22 deletions(-)
>  create mode 100644 9pfront.c
>  create mode 100644 include/9pfront.h
> 
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

