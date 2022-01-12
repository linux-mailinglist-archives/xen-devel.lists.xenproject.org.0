Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E013D48C251
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 11:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256449.440077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7atu-0006Lp-GD; Wed, 12 Jan 2022 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256449.440077; Wed, 12 Jan 2022 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7atu-0006J6-C1; Wed, 12 Jan 2022 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 256449;
 Wed, 12 Jan 2022 10:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR4C=R4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7att-0005sd-KC
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 10:30:41 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b003d5d7-7392-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 11:30:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8B4A3416;
 Wed, 12 Jan 2022 11:30:39 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ba3ceNDcRovm; Wed, 12 Jan 2022 11:30:39 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 2C7B140E;
 Wed, 12 Jan 2022 11:30:39 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7atq-00HPZ4-P9;
 Wed, 12 Jan 2022 11:30:38 +0100
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
X-Inumbo-ID: b003d5d7-7392-11ec-bd6f-bfb69f65cdc7
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Wed, 12 Jan 2022 11:30:38 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd()
 for console
Message-ID: <20220112103038.oubgjjanalwcyfit@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
 <20220111203501.tywfn4czhwavhgrf@begin>
 <bb7d4313-2500-3e60-8a51-93e909739c90@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb7d4313-2500-3e60-8a51-93e909739c90@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 8B4A3416
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

Juergen Gross, le mer. 12 janv. 2022 08:57:07 +0100, a ecrit:
> On 11.01.22 21:35, Samuel Thibault wrote:
> > Juergen Gross, le mar. 11 janv. 2022 16:12:12 +0100, a ecrit:
> > > +static int consfront_fstat(int fd, struct stat *buf)
> > > +{
> > > +    struct file *file = get_file_from_fd(fd);
> > > +
> > > +    buf->st_mode = S_IRUSR | S_IWUSR;
> > > +    buf->st_mode |= (file->type == FTYPE_CONSOLE) ? S_IFCHR : S_IFREG;
> > > +    buf->st_atime = buf->st_mtime = buf->st_ctime = time(NULL);
> > > +
> > > +    return 0;
> > > +}
> > 
> > This seems to be missing filling st_uid, st_gid, etc.?
> 
> Not really. Those are set to zero via the call of init_stat()
> in fstat().

Ah, I missed that call indeed.

Samuel

