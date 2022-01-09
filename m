Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A4488749
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 02:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255031.437080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N5b-0002TM-RI; Sun, 09 Jan 2022 01:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255031.437080; Sun, 09 Jan 2022 01:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6N5b-0002RR-Ls; Sun, 09 Jan 2022 01:33:43 +0000
Received: by outflank-mailman (input) for mailman id 255031;
 Sun, 09 Jan 2022 01:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WZq=RZ=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n6N5a-0002Qy-6y
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 01:33:42 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ced7483-70ec-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 02:33:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id D1330368;
 Sun,  9 Jan 2022 02:33:40 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGccZaLAxH5G; Sun,  9 Jan 2022 02:33:40 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 07374283;
 Sun,  9 Jan 2022 02:33:40 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n6N5X-006iV8-BD;
 Sun, 09 Jan 2022 02:33:39 +0100
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
X-Inumbo-ID: 2ced7483-70ec-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 9 Jan 2022 02:33:39 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 15/15] mini-os: introduce get_file_from_fd()
Message-ID: <20220109013339.bilc3u2xc3t72irf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220106115741.3219-1-jgross@suse.com>
 <20220106115741.3219-16-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106115741.3219-16-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: D1330368
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

Juergen Gross, le jeu. 06 janv. 2022 12:57:41 +0100, a ecrit:
> Exporting the files[] array especially for components outside the
> mini-os source tree is limiting the ability to change any file handling
> in mini-os.
> 
> Introduce a new function get_file_from_fd() to return the struct file
> pointer (or NULL) for a given file descriptor.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h | 1 +
>  lib/sys.c     | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 91364ba..7a0546b 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -198,6 +198,7 @@ struct file {
>  
>  extern struct file files[];
>  
> +struct file *get_file_from_fd(int fd);
>  int alloc_fd(enum fd_type type);
>  void close_all_files(void);
>  extern struct thread *main_thread;
> diff --git a/lib/sys.c b/lib/sys.c
> index 6f2b026..0e6fe5d 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -98,6 +98,14 @@ struct file files[NOFILE] = {
>      { .type = FTYPE_CONSOLE }, /* stderr */
>  };
>  
> +struct file *get_file_from_fd(int fd)
> +{
> +    if ( fd < 0 || fd >= NOFILE )
> +        return NULL;
> +
> +    return (files[fd].type == FTYPE_NONE) ? NULL : files + fd;
> +}
> +
>  DECLARE_WAIT_QUEUE_HEAD(event_queue);
>  
>  int alloc_fd(enum fd_type type)
> -- 
> 2.26.2
> 

-- 
Samuel
The nice thing about Windows is - It does not just crash, it displays a
dialog box and lets you press 'OK' first.
(Arno Schaefer's .sig)

