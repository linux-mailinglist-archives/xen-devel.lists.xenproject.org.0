Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0F695485
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 00:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494851.765007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRhzH-0004Ff-UB; Mon, 13 Feb 2023 23:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494851.765007; Mon, 13 Feb 2023 23:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRhzH-0004DO-R3; Mon, 13 Feb 2023 23:11:55 +0000
Received: by outflank-mailman (input) for mailman id 494851;
 Mon, 13 Feb 2023 23:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xl=6J=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pRhzF-0004DD-Pp
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 23:11:54 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caf602b8-abf3-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 00:11:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id B571B2015E;
 Tue, 14 Feb 2023 00:11:48 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFJRHOnEtlpj; Tue, 14 Feb 2023 00:11:48 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6AD3C20119;
 Tue, 14 Feb 2023 00:11:48 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pRhzA-00FwGp-03;
 Tue, 14 Feb 2023 00:11:48 +0100
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
X-Inumbo-ID: caf602b8-abf3-11ed-93b5-47a8fe42b414
Date: Tue, 14 Feb 2023 00:11:47 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
Message-ID: <20230213231147.lw4iae5z4yq4focz@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230213084412.21065-1-jgross@suse.com>
 <20230213084412.21065-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213084412.21065-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 13 févr. 2023 09:44:11 +0100, a ecrit:
> Add the open() and close() support to the 9pfs frontend. This requires
> to split the path name and to walk to the desired directory level.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - check path to be canonical
> - avoid short read when walking the path
> - fix get_fid() (Samuel Thibault)
> - return EAGAIN if no free request got (Samuel Thibault)
> V3:
> - add check for "//" in path_canonical() (Samuel Thibault)
> ---
>  9pfront.c | 324 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 322 insertions(+), 2 deletions(-)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 0b8d5461..fb2e5669 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -6,6 +6,7 @@
>  #include <mini-os/os.h>
>  #include <mini-os/lib.h>
>  #include <mini-os/events.h>
> +#include <mini-os/fcntl.h>
>  #include <mini-os/gnttab.h>
>  #include <mini-os/semaphore.h>
>  #include <mini-os/wait.h>
> @@ -52,13 +53,32 @@ struct dev_9pfs {
>      struct wait_queue_head waitq;
>      struct semaphore ring_out_sem;
>      struct semaphore ring_in_sem;
> +
> +    unsigned long long fid_mask;              /* Bit mask for free fids. */
> +};
> +
> +struct file_9pfs {
> +    uint32_t fid;
> +    struct dev_9pfs *dev;
> +    bool append;
>  };
>  
>  #define DEFAULT_9PFS_RING_ORDER  4
>  
> +/* P9 protocol commands (response is either cmd+1 or P9_CMD_ERROR). */
>  #define P9_CMD_VERSION    100
>  #define P9_CMD_ATTACH     104
>  #define P9_CMD_ERROR      107
> +#define P9_CMD_WALK       110
> +#define P9_CMD_OPEN       112
> +#define P9_CMD_CREATE     114
> +#define P9_CMD_CLUNK      120
> +
> +/* P9 protocol open flags. */
> +#define P9_OREAD            0   /* read */
> +#define P9_OWRITE           1   /* write */
> +#define P9_ORDWR            2   /* read and write */
> +#define P9_OTRUNC          16   /* or'ed in, truncate file first */
>  
>  #define P9_QID_SIZE    13
>  
> @@ -69,10 +89,27 @@ struct p9_header {
>  } __attribute__((packed));
>  
>  #define P9_VERSION        "9P2000.u"
> -#define P9_ROOT_FID       ~0
> +#define P9_ROOT_FID       0
>  
>  static unsigned int ftype_9pfs;
>  
> +static unsigned int get_fid(struct dev_9pfs *dev)
> +{
> +    unsigned int fid;
> +
> +    fid = ffs(dev->fid_mask);
> +    if ( fid )
> +        dev->fid_mask &= ~(1ULL << (fid - 1));
> +
> +     return fid;
> +}
> +
> +static void put_fid(struct dev_9pfs *dev, unsigned int fid)
> +{
> +    if ( fid )
> +        dev->fid_mask |= 1ULL << (fid - 1);
> +}
> +
>  static struct req *get_free_req(struct dev_9pfs *dev)
>  {
>      struct req *req;
> @@ -140,6 +177,9 @@ static void copy_from_ring(struct dev_9pfs *dev, void *data, unsigned int len)
>   * send_9p() and rcv_9p() are using a special format string for specifying
>   * the kind of data sent/expected. Each data item is represented by a single
>   * character:
> + * b: 1 byte unsigned integer (uint8_t)
> + *    Only valid for sending.
> + * u: 2 byte unsigned integer (uint16_t)
>   * U: 4 byte unsigned integer (uint32_t)
>   * S: String (2 byte length + <length> characters)
>   *    in the rcv_9p() case the data for string is allocated (length omitted,
> @@ -153,7 +193,9 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
>      va_list ap, aq;
>      const char *f;
>      uint32_t intval;
> +    uint16_t shortval;
>      uint16_t len;
> +    uint8_t byte;
>      char *strval;
>  
>      hdr.size = sizeof(hdr);
> @@ -167,6 +209,14 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
>      {
>          switch ( *f )
>          {
> +        case 'b':
> +            hdr.size += 1;
> +            byte = va_arg(aq, unsigned int);
> +            break;
> +        case 'u':
> +            hdr.size += 2;
> +            shortval = va_arg(aq, unsigned int);
> +            break;
>          case 'U':
>              hdr.size += 4;
>              intval = va_arg(aq, unsigned int);
> @@ -196,6 +246,14 @@ static void send_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
>      {
>          switch ( *f )
>          {
> +        case 'b':
> +            byte = va_arg(ap, unsigned int);
> +            copy_to_ring(dev, &byte, sizeof(byte));
> +            break;
> +        case 'u':
> +            shortval = va_arg(ap, unsigned int);
> +            copy_to_ring(dev, &shortval, sizeof(shortval));
> +            break;
>          case 'U':
>              intval = va_arg(ap, unsigned int);
>              copy_to_ring(dev, &intval, sizeof(intval));
> @@ -288,6 +346,7 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
>      char *str;
>      uint16_t len;
>      uint32_t err;
> +    uint16_t *shortval;
>      uint32_t *val;
>      char **strval;
>      uint8_t *qval;
> @@ -345,6 +404,10 @@ static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
>      {
>          switch ( *f )
>          {
> +        case 'u':
> +            shortval = va_arg(ap, uint16_t *);
> +            copy_bufs(&buf1, &buf2, &len1, &len2, shortval, sizeof(*shortval));
> +            break;
>          case 'U':
>              val = va_arg(ap, uint32_t *);
>              copy_bufs(&buf1, &buf2, &len1, &len2, val, sizeof(*val));
> @@ -486,6 +549,170 @@ static int p9_attach(struct dev_9pfs *dev)
>      return ret;
>  }
>  
> +static int p9_clunk(struct dev_9pfs *dev, uint32_t fid)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret;
> +
> +    if ( !req )
> +        return EAGAIN;
> +
> +    req->cmd = P9_CMD_CLUNK;
> +    send_9p(dev, req, "U", fid);
> +    rcv_9p(dev, req, "");
> +    ret = req->result;
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}
> +
> +static int p9_walk(struct dev_9pfs *dev, uint32_t fid, uint32_t newfid,
> +                   char *name)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret;
> +    uint16_t nqid;
> +    uint8_t qid[P9_QID_SIZE];
> +
> +    if ( !req )
> +        return EAGAIN;
> +
> +    req->cmd = P9_CMD_WALK;
> +    if ( name[0] )
> +    {
> +        send_9p(dev, req, "UUuS", fid, newfid, 1, name);
> +        rcv_9p(dev, req, "uQ", &nqid, qid);
> +    }
> +    else
> +    {
> +        send_9p(dev, req, "UUu", fid, newfid, 0);
> +        rcv_9p(dev, req, "u", &nqid);
> +    }
> +
> +    ret = req->result;
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}
> +
> +static int p9_open(struct dev_9pfs *dev, uint32_t fid, uint8_t omode)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret;
> +    uint8_t qid[P9_QID_SIZE];
> +    uint32_t iounit;
> +
> +    if ( !req )
> +        return EAGAIN;
> +
> +    req->cmd = P9_CMD_OPEN;
> +    send_9p(dev, req, "Ub", fid, omode);
> +    rcv_9p(dev, req, "QU", qid, &iounit);
> +
> +    ret = req->result;
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}
> +
> +static int p9_create(struct dev_9pfs *dev, uint32_t fid, char *path,
> +                     uint32_t mode, uint8_t omode)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret;
> +    uint8_t qid[P9_QID_SIZE];
> +    uint32_t iounit;
> +
> +    if ( !req )
> +        return EAGAIN;
> +
> +    req->cmd = P9_CMD_CREATE;
> +    send_9p(dev, req, "USUbS", fid, path, mode, omode, "");
> +    rcv_9p(dev, req, "QU", qid, &iounit);
> +
> +    ret = req->result;
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}
> +
> +/*
> + * Walk from root <steps> levels with the levels listed in <*paths> as a
> + * sequence of names. Returns the number of steps not having been able to
> + * walk, with <*paths> pointing at the name of the failing walk step.
> + * <fid> will be associated with the last successful walk step. Note that
> + * the first step should always succeed, as it is an empty walk in order
> + * to start at the root (needed for creating new files in root).
> + */
> +static unsigned int walk_9pfs(struct dev_9pfs *dev, uint32_t fid,
> +                              unsigned int steps, char **paths)
> +{
> +    uint32_t curr_fid = P9_ROOT_FID;
> +    int ret;
> +
> +    while ( steps-- )
> +    {
> +        ret = p9_walk(dev, curr_fid, fid, *paths);
> +        if ( ret )
> +            return steps + 1;
> +        curr_fid = fid;
> +        *paths += strlen(*paths) + 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static unsigned int split_path(const char *pathname, char **split_ptr)
> +{
> +    unsigned int parts = 1;
> +    char *p;
> +
> +    *split_ptr = strdup(pathname);
> +
> +    for ( p = strchr(*split_ptr, '/'); p; p = strchr(p + 1, '/') )
> +    {
> +        *p = 0;
> +        parts++;
> +    }
> +
> +    return parts;
> +}
> +
> +static bool path_canonical(const char *pathname)
> +{
> +    unsigned int len = strlen(pathname);
> +    const char *c;
> +
> +    /* Empty path is allowed. */
> +    if ( !len )
> +        return true;
> +
> +    /* No trailing '/'. */
> +    if ( pathname[len - 1] == '/' )
> +        return false;
> +
> +    /* No self or parent references. */
> +    c = pathname;
> +    while ( (c = strstr(c, "/.")) != NULL )
> +    {
> +        if ( c[2] == '.' )
> +            c++;
> +        if ( c[2] == 0 || c[2] == '/' )
> +            return false;
> +        c += 2;
> +    }
> +
> +    /* No "//". */
> +    if ( strstr(pathname, "//") )
> +        return false;
> +
> +    return true;
> +}
> +
>  static int connect_9pfs(struct dev_9pfs *dev)
>  {
>      int ret;
> @@ -504,10 +731,101 @@ static void intr_9pfs(evtchn_port_t port, struct pt_regs *regs, void *data)
>      wake_up(&dev->waitq);
>  }
>  
> +static int close_9pfs(struct file *file)
> +{
> +    struct file_9pfs *f9pfs = file->filedata;
> +
> +    if ( f9pfs->fid != P9_ROOT_FID )
> +    {
> +        p9_clunk(f9pfs->dev, f9pfs->fid);
> +        put_fid(f9pfs->dev, f9pfs->fid);
> +    }
> +
> +    free(f9pfs);
> +
> +    return 0;
> +}
> +
>  static int open_9pfs(struct mount_point *mnt, const char *pathname, int flags,
>                       mode_t mode)
>  {
> -    errno = ENOSYS;
> +    int fd;
> +    char *path = NULL;
> +    char *p;
> +    struct file *file;
> +    struct file_9pfs *f9pfs;
> +    uint16_t nwalk;
> +    uint8_t omode;
> +    int ret;
> +
> +    if ( !path_canonical(pathname) )
> +        return EINVAL;
> +
> +    f9pfs = calloc(1, sizeof(*f9pfs));
> +    f9pfs->dev = mnt->dev;
> +    f9pfs->fid = P9_ROOT_FID;
> +
> +    fd = alloc_fd(ftype_9pfs);
> +    file = get_file_from_fd(fd);
> +    file->filedata = f9pfs;
> +
> +    switch ( flags & O_ACCMODE )
> +    {
> +    case O_RDONLY:
> +        omode = P9_OREAD;
> +        break;
> +    case O_WRONLY:
> +        omode = P9_OWRITE;
> +        break;
> +    case O_RDWR:
> +        omode = P9_ORDWR;
> +        break;
> +    default:
> +        ret = EINVAL;
> +        goto err;
> +    }
> +
> +    if ( flags & O_TRUNC )
> +        omode |= P9_OTRUNC;
> +    f9pfs->append = flags & O_APPEND;
> +
> +    nwalk = split_path(pathname, &path);
> +
> +    f9pfs->fid = get_fid(mnt->dev);
> +    if ( !f9pfs->fid )
> +    {
> +        ret = ENFILE;
> +        goto err;
> +    }
> +    p = path;
> +    nwalk = walk_9pfs(mnt->dev, f9pfs->fid, nwalk, &p);
> +    if ( nwalk )
> +    {
> +        if ( nwalk > 1 || !(flags & O_CREAT) )
> +        {
> +            ret = ENOENT;
> +            goto err;
> +        }
> +
> +        ret = p9_create(mnt->dev, f9pfs->fid, p, mode, omode);
> +        if ( ret )
> +            goto err;
> +        goto out;
> +    }
> +
> +    ret = p9_open(mnt->dev, f9pfs->fid, omode);
> +    if ( ret )
> +        goto err;
> +
> + out:
> +    free(path);
> +
> +    return fd;
> +
> + err:
> +    free(path);
> +    close(fd);
> +    errno = ret;
>  
>      return -1;
>  }
> @@ -552,6 +870,7 @@ void *init_9pfront(unsigned int id, const char *mnt)
>      init_waitqueue_head(&dev->waitq);
>      init_SEMAPHORE(&dev->ring_out_sem, 1);
>      init_SEMAPHORE(&dev->ring_in_sem, 1);
> +    dev->fid_mask = ~0ULL;
>  
>      for ( i = 0; i < N_REQS; i++ )
>      {
> @@ -753,6 +1072,7 @@ void shutdown_9pfront(void *dev)
>  
>  static const struct file_ops ops_9pfs = {
>      .name = "9pfs",
> +    .close = close_9pfs,
>  };
>  
>  __attribute__((constructor))
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

