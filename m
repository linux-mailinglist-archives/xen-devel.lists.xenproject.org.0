Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB9692597
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 19:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493536.763509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYOA-00027m-51; Fri, 10 Feb 2023 18:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493536.763509; Fri, 10 Feb 2023 18:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYOA-00025O-22; Fri, 10 Feb 2023 18:44:50 +0000
Received: by outflank-mailman (input) for mailman id 493536;
 Fri, 10 Feb 2023 18:44:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qATP=6G=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pQYO9-0001sh-2z
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:44:49 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd8c19a5-a972-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 19:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 379F62015E;
 Fri, 10 Feb 2023 19:44:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Am5c1eVhXUX; Fri, 10 Feb 2023 19:44:46 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 0F16F20152;
 Fri, 10 Feb 2023 19:44:46 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pQYO5-006gNA-2T;
 Fri, 10 Feb 2023 19:44:45 +0100
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
X-Inumbo-ID: fd8c19a5-a972-11ed-933c-83870f6b2ba8
Date: Fri, 10 Feb 2023 19:44:45 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 2/7] Mini-OS: add concept of mount points
Message-ID: <20230210184445.p7aopsjlmvplfdze@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210104628.14374-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 10 févr. 2023 11:46:23 +0100, a ecrit:
> Add the concept of mount points to Mini-OS. A mount point is a path
> associated with a device pointer and an open() callback. A mount point
> can be either a file (e.g. "/dev/mem") or a directory ("/var/log").
> 
> This allows to replace the special casing in the generic open()
> handling with a generic mount point handling.
> 
> Prepare the open() callbacks to support creating new files by adding a
> mode parameter.
> 
> Additionally add a close() prototype to include/lib.h, as it is missing
> today.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - pass path below mount point to open callbacks (Samuel Thibault)
> ---
>  include/lib.h |  9 ++++++
>  lib/sys.c     | 80 +++++++++++++++++++++++++++++++++++++++------------
>  2 files changed, 70 insertions(+), 19 deletions(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index bec99646..36d94ec4 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -187,6 +187,13 @@ struct file_ops {
>      bool (*select_wr)(struct file *file);
>  };
>  
> +struct mount_point {
> +    const char *path;
> +    int (*open)(struct mount_point *mnt, const char *pathname, int flags,
> +                mode_t mode);
> +    void *dev;
> +};
> +
>  unsigned int alloc_file_type(const struct file_ops *ops);
>  
>  off_t lseek_default(struct file *file, off_t offset, int whence);
> @@ -198,6 +205,8 @@ int alloc_fd(unsigned int type);
>  void close_all_files(void);
>  extern struct thread *main_thread;
>  void sparse(unsigned long data, size_t size);
> +
> +int close(int fd);
>  #endif
>  
>  #endif /* _LIB_H_ */
> diff --git a/lib/sys.c b/lib/sys.c
> index 8f8a3de2..2f33c937 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -263,11 +263,6 @@ char *getcwd(char *buf, size_t size)
>      return buf;
>  }
>  
> -#define LOG_PATH "/var/log/"
> -#define SAVE_PATH "/var/lib/xen"
> -#define SAVE_CONSOLE 1
> -#define RESTORE_CONSOLE 2
> -
>  int mkdir(const char *pathname, mode_t mode)
>  {
>      errno = EIO;
> @@ -286,18 +281,30 @@ int posix_openpt(int flags)
>      return fd;
>  }
>  
> +static int open_pt(struct mount_point *mnt, const char *pathname, int flags,
> +                   mode_t mode)
> +{
> +    return posix_openpt(flags);
> +}
> +
>  int open_savefile(const char *path, int save)
>  {
>      int fd;
>      char nodename[64];
>  
> -    snprintf(nodename, sizeof(nodename), "device/console/%d", save ? SAVE_CONSOLE : RESTORE_CONSOLE);
> +    snprintf(nodename, sizeof(nodename), "device/console/%d", save ? 1 : 2);
>  
>      fd = open_consfront(nodename);
>      printk("fd(%d) = open_savefile\n", fd);
>  
>      return fd;
>  }
> +
> +static int open_save(struct mount_point *mnt, const char *pathname, int flags,
> +                     mode_t mode)
> +{
> +    return open_savefile(pathname, flags & O_WRONLY);
> +}
>  #else
>  int posix_openpt(int flags)
>  {
> @@ -311,24 +318,59 @@ int open_savefile(const char *path, int save)
>  }
>  #endif
>  
> -int open(const char *pathname, int flags, ...)
> +static int open_log(struct mount_point *mnt, const char *pathname, int flags,
> +                    mode_t mode)
>  {
>      int fd;
> +
>      /* Ugly, but fine.  */
> -    if (!strncmp(pathname,LOG_PATH,strlen(LOG_PATH))) {
> -	fd = alloc_fd(FTYPE_CONSOLE);
> -        printk("open(%s) -> %d\n", pathname, fd);
> -        return fd;
> +    fd = alloc_fd(FTYPE_CONSOLE);
> +    printk("open(%s%s) -> %d\n", mnt->path, pathname, fd);
> +    return fd;
> +}
> +
> +static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
> +                    mode_t mode)
> +{
> +    int fd;
> +
> +    fd = alloc_fd(FTYPE_MEM);
> +    printk("open(%s%s) -> %d\n", mnt->path, pathname, fd);
> +    return fd;
> +}
> +
> +static struct mount_point mount_points[] = {
> +    { .path = "/var/log",     .open = open_log,  .dev = NULL },
> +    { .path = "/dev/mem",     .open = open_mem,  .dev = NULL },
> +#ifdef CONFIG_CONSFRONT
> +    { .path = "/dev/ptmx",    .open = open_pt,   .dev = NULL },
> +    { .path = "/var/lib/xen", .open = open_save, .dev = NULL },
> +#endif
> +};
> +
> +int open(const char *pathname, int flags, ...)
> +{
> +    unsigned int m, mlen;
> +    struct mount_point *mnt;
> +    mode_t mode = 0;
> +    va_list ap;
> +
> +    if ( flags & O_CREAT )
> +    {
> +        va_start(ap, flags);
> +        mode = va_arg(ap, mode_t);
> +        va_end(ap);
>      }
> -    if (!strncmp(pathname, "/dev/mem", strlen("/dev/mem"))) {
> -        fd = alloc_fd(FTYPE_MEM);
> -        printk("open(/dev/mem) -> %d\n", fd);
> -        return fd;
> +
> +    for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
> +    {
> +        mnt = mount_points + m;
> +        mlen = strlen(mnt->path);
> +        if ( !strncmp(pathname, mnt->path, mlen) &&
> +             (pathname[mlen] == '/' || pathname[mlen] == 0) )
> +            return mnt->open(mnt, pathname + mlen, flags, mode);
>      }
> -    if (!strncmp(pathname, "/dev/ptmx", strlen("/dev/ptmx")))
> -        return posix_openpt(flags);
> -    if (!strncmp(pathname,SAVE_PATH,strlen(SAVE_PATH)))
> -        return open_savefile(pathname, flags & O_WRONLY);
> +
>      errno = EIO;
>      return -1;
>  }
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

