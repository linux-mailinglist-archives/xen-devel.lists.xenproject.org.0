Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0648B8C6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256135.439401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ny9-0006Kw-Dt; Tue, 11 Jan 2022 20:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256135.439401; Tue, 11 Jan 2022 20:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ny9-0006IP-Ar; Tue, 11 Jan 2022 20:42:13 +0000
Received: by outflank-mailman (input) for mailman id 256135;
 Tue, 11 Jan 2022 20:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7Ny7-0006GK-DI
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:42:11 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f231f8ec-731e-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7BFDC678;
 Tue, 11 Jan 2022 21:42:08 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3PqWnO4Gxlu; Tue, 11 Jan 2022 21:42:07 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 558D4174;
 Tue, 11 Jan 2022 21:42:07 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7Ny2-00FFmd-7I;
 Tue, 11 Jan 2022 21:42:06 +0100
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
X-Inumbo-ID: f231f8ec-731e-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:42:06 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH v2 17/18] mini-os: use function vectors instead of switch
 for file operations
Message-ID: <20220111204206.4cueltjygd2ydnga@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111145817.22170-1-jgross@suse.com>
 <20220111145817.22170-18-jgross@suse.com>
 <20220111200547.wb6mwl6zxtf3y54c@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111200547.wb6mwl6zxtf3y54c@begin>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 7BFDC678
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

Samuel Thibault, le mar. 11 janv. 2022 21:05:47 +0100, a ecrit:
> Juergen Gross, le mar. 11 janv. 2022 15:58:16 +0100, a ecrit:
> > @@ -370,8 +413,45 @@ int write(int fd, const void *buf, size_t nbytes)
> >      return -1;
> >  }
> >  
> > +off_t lseek_default(int fd, off_t offset, int whence)
> > +{
> > +    switch ( whence )
> > +    {
> 
> Is there a reason for making this one a separate function, unlike others
> for which you kept the code in the main function?

Ah, I guess that it's because in the end, it's the only function that
has a default implementation left?  And thus the rule is that unless the
method is set, the default implementation is ENOSYS?  I agree with that,
then.

Samuel

