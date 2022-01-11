Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD448B8C8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 21:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256138.439416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NyV-0006u0-Op; Tue, 11 Jan 2022 20:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256138.439416; Tue, 11 Jan 2022 20:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NyV-0006rN-Lc; Tue, 11 Jan 2022 20:42:35 +0000
Received: by outflank-mailman (input) for mailman id 256138;
 Tue, 11 Jan 2022 20:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7NyU-0006GK-2M
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 20:42:34 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffded402-731e-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 21:42:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id DC4EE678;
 Tue, 11 Jan 2022 21:42:31 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPcginCM2lUV; Tue, 11 Jan 2022 21:42:31 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 2B053174;
 Tue, 11 Jan 2022 21:42:31 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7NyQ-00FFmz-Nn;
 Tue, 11 Jan 2022 21:42:30 +0100
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
X-Inumbo-ID: ffded402-731e-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 21:42:30 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 11/12] mini-os: add struct file_ops for FTYPE_FILE
Message-ID: <20220111204230.xd4rj7fkmidooiik@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-12-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: DC4EE678
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

Juergen Gross, le mar. 11 janv. 2022 16:12:14 +0100, a ecrit:
> FTYPE_FILE is the last relevant file type without a struct file_ops.
> Add it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  lib/sys.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/sys.c b/lib/sys.c
> index 12deaed..0f42e97 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -99,6 +99,11 @@ static struct file_ops file_ops_none = {
>      .name = "none",
>  };
>  
> +static struct file_ops file_file_ops = {
> +    .name = "file",
> +    .lseek = lseek_default,
> +};
> +
>  #ifdef HAVE_LWIP
>  static int socket_read(int fd, void *buf, size_t nbytes)
>  {
> @@ -160,6 +165,7 @@ static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
>  #ifdef CONFIG_CONSFRONT
>      [FTYPE_CONSOLE] = &console_ops,
>  #endif
> +    [FTYPE_FILE] = &file_file_ops,
>  #ifdef HAVE_LWIP
>      [FTYPE_SOCKET] = &socket_ops,
>  #endif
> @@ -397,16 +403,9 @@ off_t lseek(int fd, off_t offset, int whence)
>      if ( ops->lseek )
>          return ops->lseek(fd, offset, whence);
>  
> -    switch(files[fd].type) {
> -       case FTYPE_FILE:
> -          break;
> -       default:
> -          /* Not implemented for this filetype */
> -          errno = ESPIPE;
> -          return (off_t) -1;
> -    }
> -
> -    return lseek_default(fd, offset, whence);
> +    /* Not implemented for this filetype */
> +    errno = ESPIPE;
> +    return (off_t) -1;
>  }
>  
>  int fsync(int fd) {
> -- 
> 2.26.2
> 

-- 
Samuel
"...[Linux's] capacity to talk via any medium except smoke signals."
(By Dr. Greg Wettstein, Roger Maris Cancer Center)

