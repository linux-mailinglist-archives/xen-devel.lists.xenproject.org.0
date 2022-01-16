Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2DF48FEE2
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257949.443621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CUC-000120-Vi; Sun, 16 Jan 2022 20:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257949.443621; Sun, 16 Jan 2022 20:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CUC-0000zd-Sb; Sun, 16 Jan 2022 20:50:48 +0000
Received: by outflank-mailman (input) for mailman id 257949;
 Sun, 16 Jan 2022 20:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CUB-0000zX-IQ
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:50:47 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7e23fa-770d-11ec-9bbc-9dff3e4ee8c5;
 Sun, 16 Jan 2022 21:50:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 1908D18A;
 Sun, 16 Jan 2022 21:50:46 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7imR6Hv4x9dA; Sun, 16 Jan 2022 21:50:45 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 362AA8B;
 Sun, 16 Jan 2022 21:50:45 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CU8-005uaU-Fz;
 Sun, 16 Jan 2022 21:50:44 +0100
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
X-Inumbo-ID: fa7e23fa-770d-11ec-9bbc-9dff3e4ee8c5
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:50:44 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 2/3] tools/libs/gnttab: decouple more from mini-os
Message-ID: <20220116205044.bmwmrrh2rirwdr4u@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220116082346.26194-1-jgross@suse.com>
 <20220116082346.26194-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220116082346.26194-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 1908D18A
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

Juergen Gross, le dim. 16 janv. 2022 09:23:45 +0100, a ecrit:
> libgnttab is using implementation details of Mini-OS. Change that by
> letting libgnttab use the new alloc_file_type() and get_file_from_fd()
> functions and the generic dev pointer of struct file from Mini-OS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - add alloc_file_type() support
> V3:
> - switch callback to use struct file * as a parameter (Andrew Cooper)
> - use __attribute__((constructor)) (Andrew Cooper)
> ---
>  tools/libs/gnttab/minios.c | 67 +++++++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
> index f78caadd30..f59fad3577 100644
> --- a/tools/libs/gnttab/minios.c
> +++ b/tools/libs/gnttab/minios.c
> @@ -28,18 +28,55 @@
>  #include <sys/mman.h>
>  
>  #include <errno.h>
> +#include <malloc.h>
>  #include <unistd.h>
>  
>  #include "private.h"
>  
>  void minios_gnttab_close_fd(int fd);
>  
> +static int gnttab_close_fd(struct file *file)
> +{
> +    gntmap_fini(file->dev);
> +    free(file->dev);
> +
> +    return 0;
> +}
> +
> +static const struct file_ops gnttab_ops = {
> +    .name = "gnttab",
> +    .close = gnttab_close_fd,
> +};
> +
> +static unsigned int ftype_gnttab;
> +
> +__attribute__((constructor))
> +static void gnttab_initialize(void)
> +{
> +    ftype_gnttab = alloc_file_type(&gnttab_ops);
> +}
> +
>  int osdep_gnttab_open(xengnttab_handle *xgt)
>  {
> -    int fd = alloc_fd(FTYPE_GNTMAP);
> -    if ( fd == -1 )
> +    int fd;
> +    struct file *file;
> +    struct gntmap *gntmap;
> +
> +    gntmap = malloc(sizeof(*gntmap));
> +    if ( !gntmap )
>          return -1;
> -    gntmap_init(&files[fd].gntmap);
> +
> +    fd = alloc_fd(ftype_gnttab);
> +    file = get_file_from_fd(fd);
> +
> +    if ( !file )
> +    {
> +        free(gntmap);
> +        return -1;
> +    }
> +
> +    file->dev = gntmap;
> +    gntmap_init(gntmap);
>      xgt->fd = fd;
>      return 0;
>  }
> @@ -54,8 +91,9 @@ int osdep_gnttab_close(xengnttab_handle *xgt)
>  
>  void minios_gnttab_close_fd(int fd)
>  {
> -    gntmap_fini(&files[fd].gntmap);
> -    files[fd].type = FTYPE_NONE;
> +    struct file *file = get_file_from_fd(fd);
> +
> +    gnttab_close_fd(file);
>  }
>  
>  void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
> @@ -64,16 +102,16 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
>                               uint32_t notify_offset,
>                               evtchn_port_t notify_port)
>  {
> -    int fd = xgt->fd;
> +    struct file *file = get_file_from_fd(xgt->fd);
>      int stride = 1;
> +
>      if (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN)
>          stride = 0;
>      if (notify_offset != -1 || notify_port != -1) {
>          errno = ENOSYS;
>          return NULL;
>      }
> -    return gntmap_map_grant_refs(&files[fd].gntmap,
> -                                 count, domids, stride,
> +    return gntmap_map_grant_refs(file->dev, count, domids, stride,
>                                   refs, prot & PROT_WRITE);
>  }
>  
> @@ -81,11 +119,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
>                         void *start_address,
>                         uint32_t count)
>  {
> -    int fd = xgt->fd;
> +    struct file *file = get_file_from_fd(xgt->fd);
>      int ret;
> -    ret = gntmap_munmap(&files[fd].gntmap,
> -                        (unsigned long) start_address,
> -                        count);
> +
> +    ret = gntmap_munmap(file->dev, (unsigned long) start_address, count);
>      if (ret < 0) {
>          errno = -ret;
>          return -1;
> @@ -95,10 +132,10 @@ int osdep_gnttab_unmap(xengnttab_handle *xgt,
>  
>  int osdep_gnttab_set_max_grants(xengnttab_handle *xgt, uint32_t count)
>  {
> -    int fd = xgt->fd;
> +    struct file *file = get_file_from_fd(xgt->fd);
>      int ret;
> -    ret = gntmap_set_max_grants(&files[fd].gntmap,
> -                                count);
> +
> +    ret = gntmap_set_max_grants(file->dev, count);
>      if (ret < 0) {
>          errno = -ret;
>          return -1;
> -- 
> 2.26.2
> 

-- 
Samuel
"c'est pas nous qui sommes à la rue, c'est la rue qui est à nous"

