Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A168AFBF
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 13:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489817.758343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOeLe-00074Y-CA; Sun, 05 Feb 2023 12:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489817.758343; Sun, 05 Feb 2023 12:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOeLe-00071B-9N; Sun, 05 Feb 2023 12:42:22 +0000
Received: by outflank-mailman (input) for mailman id 489817;
 Sun, 05 Feb 2023 12:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O114=6B=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOeLc-0006l7-B8
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 12:42:20 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8567f3ca-a552-11ed-93b5-47a8fe42b414;
 Sun, 05 Feb 2023 13:42:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id A94D72013E;
 Sun,  5 Feb 2023 13:42:16 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6j9RGqsjjpM4; Sun,  5 Feb 2023 13:42:16 +0100 (CET)
Received: from begin (unknown [164.15.244.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 84AE520134;
 Sun,  5 Feb 2023 13:42:16 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOeLY-002nFE-0U;
 Sun, 05 Feb 2023 13:42:16 +0100
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
X-Inumbo-ID: 8567f3ca-a552-11ed-93b5-47a8fe42b414
Date: Sun, 5 Feb 2023 13:42:16 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 3/7] Mini-OS: add support for runtime mounts
Message-ID: <20230205124216.psjld3kc4qtijtrw@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 03 févr. 2023 10:18:05 +0100, a ecrit:
> Add the support to mount a device at runtime. The number of dynamic
> mounts is limited by a #define.
> 
> For devices supporting multiple files struct file is modified to hold
> a pointer to file specific data in contrast to device specific data.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/lib.h |  5 +++++
>  lib/sys.c     | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/include/lib.h b/include/lib.h
> index 36d94ec4..fd8c36de 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -172,6 +172,7 @@ struct file {
>      union {
>          int fd; /* Any fd from an upper layer. */
>          void *dev;
> +        void *filedata;
>      };
>  };
>  
> @@ -194,6 +195,10 @@ struct mount_point {
>      void *dev;
>  };
>  
> +int mount(const char *path, void *dev,
> +          int (*open)(struct mount_point *, const char *, int, mode_t));
> +void umount(const char *path);
> +
>  unsigned int alloc_file_type(const struct file_ops *ops);
>  
>  off_t lseek_default(struct file *file, off_t offset, int whence);
> diff --git a/lib/sys.c b/lib/sys.c
> index 1475c621..4171bfd6 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -339,7 +339,14 @@ static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
>      return fd;
>  }
>  
> -static struct mount_point mount_points[] = {
> +#ifdef CONFIG_CONSFRONT
> +#define STATIC_MNTS   4
> +#else
> +#define STATIC_MNTS   2
> +#endif
> +#define DYNAMIC_MNTS  8
> +
> +static struct mount_point mount_points[STATIC_MNTS + DYNAMIC_MNTS] = {
>      { .path = "/var/log",     .open = open_log,  .dev = NULL },
>      { .path = "/dev/mem",     .open = open_mem,  .dev = NULL },
>  #ifdef CONFIG_CONSFRONT
> @@ -365,6 +372,8 @@ int open(const char *pathname, int flags, ...)
>      for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
>      {
>          mnt = mount_points + m;
> +        if ( !mnt->path )
> +            continue;
>          mlen = strlen(mnt->path);
>          if ( !strncmp(pathname, mnt->path, mlen) &&
>               (pathname[mlen] == '/' || pathname[mlen] == 0) )
> @@ -375,6 +384,45 @@ int open(const char *pathname, int flags, ...)
>      return -1;
>  }
>  
> +int mount(const char *path, void *dev,
> +          int (*open)(struct mount_point *, const char *, int, mode_t))
> +{
> +    unsigned int m;
> +    struct mount_point *mnt;
> +
> +    for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
> +    {
> +        mnt = mount_points + m;
> +        if ( !mnt->path )
> +        {
> +            mnt->path = strdup(path);
> +            mnt->open = open;
> +            mnt->dev = dev;
> +            return 0;
> +        }
> +    }
> +
> +    errno = ENOSPC;
> +    return -1;
> +}
> +
> +void umount(const char *path)
> +{
> +    unsigned int m;
> +    struct mount_point *mnt;
> +
> +    for ( m = 0; m < ARRAY_SIZE(mount_points); m++ )
> +    {
> +        mnt = mount_points + m;
> +        if ( mnt->path && !strcmp(mnt->path, path) )
> +        {
> +            free((char *)mnt->path);
> +            mnt->path = NULL;
> +            return;
> +        }
> +    }
> +}
> +
>  int isatty(int fd)
>  {
>      return files[fd].type == FTYPE_CONSOLE;
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

