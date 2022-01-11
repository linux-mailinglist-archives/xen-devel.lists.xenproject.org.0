Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CE48BE13
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 06:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256068.439554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7VxC-0002xc-8w; Wed, 12 Jan 2022 05:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256068.439554; Wed, 12 Jan 2022 05:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7VxC-0002vk-5w; Wed, 12 Jan 2022 05:13:46 +0000
Received: by outflank-mailman (input) for mailman id 256068;
 Tue, 11 Jan 2022 20:10:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hOY/=R3=aquilenet.fr=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7NTs-0003ex-Ql
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:10:56 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94eb3cd9-731a-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 21:10:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 09279678;
 Tue, 11 Jan 2022 21:10:54 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evAtEMHPfxFY; Tue, 11 Jan 2022 21:10:53 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 48C8A261;
 Tue, 11 Jan 2022 21:10:53 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@aquilenet.fr>) id 1n7NTo-00FFQB-6e;
 Tue, 11 Jan 2022 21:10:52 +0100
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
X-Inumbo-ID: 94eb3cd9-731a-11ec-81c1-a30af7de8005
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:10:52 +0100
From: Samuel Thibault <samuel.thibault@aquilenet.fr>
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
Message-ID: <20220111201052.act2l5f5vt6gs4fn@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@aquilenet.fr>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111200547.wb6mwl6zxtf3y54c@begin>
 <20220111145817.22170-18-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 09279678
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

On second thought:

Juergen Gross, le mar. 11 janv. 2022 15:58:16 +0100, a ecrit:
> +typedef int file_read_func(int fd, void *buf, size_t nbytes);
> +typedef int file_write_func(int fd, const void *buf, size_t nbytes);
> +typedef off_t file_lseek_func(int fd, off_t offset, int whence);
> +typedef int file_close_func(int fd);
> +typedef int file_fstat_func(int fd, struct stat *buf);
> +typedef int file_fcntl_func(int fd, int cmd, va_list args);
> +typedef bool file_select_func(int fd);

Is this really useful to pass to the functions the int fd, rather than
directly passing the file*?

Samuel

