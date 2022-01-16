Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F948FEE4
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257953.443643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CUz-0001uW-I5; Sun, 16 Jan 2022 20:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257953.443643; Sun, 16 Jan 2022 20:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CUz-0001sJ-Em; Sun, 16 Jan 2022 20:51:37 +0000
Received: by outflank-mailman (input) for mailman id 257953;
 Sun, 16 Jan 2022 20:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CUy-0000zX-95
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:51:36 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17bbd1a8-770e-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 21:51:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 21BCC18A;
 Sun, 16 Jan 2022 21:51:35 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtDKsxmyGmo3; Sun, 16 Jan 2022 21:51:34 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 4EAED9E;
 Sun, 16 Jan 2022 21:51:34 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CUv-005ubn-Q9;
 Sun, 16 Jan 2022 21:51:33 +0100
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
X-Inumbo-ID: 17bbd1a8-770e-11ec-9bbc-9dff3e4ee8c5
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:51:33 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 0/3] tools/libs: decouple more from mini-os
Message-ID: <20220116205133.pq4qvtt5jv7v6r2n@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220116082346.26194-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116082346.26194-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 21BCC18A
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

Juergen Gross, le dim. 16 janv. 2022 09:23:43 +0100, a ecrit:
> This small series removes some hard coupling of the Xen build with some
> Mini-OS internals, especially the struct file layout and the internal
> organization of the file handling.
> 
> This series depends on the Mini-OS series posted recently:
> 
> https://lists.xen.org/archives/html/xen-devel/2022-01/threads.html#00635
> 
> The main idea is to no longer have Xen library specific structures
> inside struct file, or to let struct file layout depend on the
> configuration of Mini-OS.
> 
> All Xen libraries needing a hook in struct file should use the now
> available generic dev pointer and allocate the needed data dynamically.
> 
> Additionally Xen libraries should get the pointer of struct file via
> the new get_file_from_fd() function instead of accessing directly the
> files[] array, which might go away in future (e.g. in order to support
> dynamic allocation of struct file as needed).
> 
> Via using alloc_file_type() the libs provide a function vector in
> order to enable Mini-OS to remove the dedicated callbacks into the
> libs via known function names and replacing them to use the new
> vector.

Thanks!

