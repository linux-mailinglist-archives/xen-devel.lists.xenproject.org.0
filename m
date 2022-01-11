Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A599F48B777
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 20:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256020.439094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7N00-00036Z-2j; Tue, 11 Jan 2022 19:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256020.439094; Tue, 11 Jan 2022 19:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Mzz-00032Z-Vj; Tue, 11 Jan 2022 19:40:03 +0000
Received: by outflank-mailman (input) for mailman id 256020;
 Tue, 11 Jan 2022 19:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7Mzz-0002n5-4d
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 19:40:03 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ab366c-7316-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 20:40:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id AA4EF6E6;
 Tue, 11 Jan 2022 20:39:59 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WfAGvK-wgJ29; Tue, 11 Jan 2022 20:39:59 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id BBD90F2;
 Tue, 11 Jan 2022 20:39:58 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7Mzs-00FEjk-S9;
 Tue, 11 Jan 2022 20:39:56 +0100
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
X-Inumbo-ID: 43ab366c-7316-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 20:39:56 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Andrew Cooper <amc96@srcf.net>
Cc: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
Message-ID: <20220111193956.5jidxzw3kecz3h4i@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Andrew Cooper <amc96@srcf.net>, Juergen Gross <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2d4c905-c477-8553-85a7-90168d914b6e@srcf.net>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: AA4EF6E6
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Andrew Cooper, le mar. 11 janv. 2022 18:08:27 +0000, a ecrit:
> On 11/01/2022 14:58, Juergen Gross wrote:
> > +typedef int file_read_func(int fd, void *buf, size_t nbytes);
> > +typedef int file_write_func(int fd, const void *buf, size_t nbytes);
> > +typedef off_t file_lseek_func(int fd, off_t offset, int whence);
> > +typedef int file_close_func(int fd);
> > +typedef int file_fstat_func(int fd, struct stat *buf);
> > +typedef int file_fcntl_func(int fd, int cmd, va_list args);
> > +typedef bool file_select_func(int fd);
> 
> Are these typedef's useful?  I don't see them used anywhere other than
> the file_ops structure.
> 
> > +
> > +struct file_ops {
> > +    const char *name;
> > +    file_read_func *read;
> > +    file_write_func *write;
> > +    file_lseek_func *lseek;
> > +    file_close_func *close;
> > +    file_fstat_func *fstat;
> > +    file_fcntl_func *fcntl;
> > +    file_select_func *select_rd;
> > +    file_select_func *select_wr;
> >  };

I agree, I'd rather see the protoypes inside the struct itself.

Samuel

