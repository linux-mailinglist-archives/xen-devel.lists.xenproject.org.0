Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709E68B95F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490198.758809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyNk-0005eA-Ci; Mon, 06 Feb 2023 10:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490198.758809; Mon, 06 Feb 2023 10:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyNk-0005bU-A3; Mon, 06 Feb 2023 10:05:52 +0000
Received: by outflank-mailman (input) for mailman id 490198;
 Mon, 06 Feb 2023 10:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8JA=6C=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOyNi-0005ZR-SV
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:05:50 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d32acfb1-a605-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 11:05:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 65B9220127;
 Mon,  6 Feb 2023 11:05:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwxpFAkPtfR4; Mon,  6 Feb 2023 11:05:46 +0100 (CET)
Received: from begin (unknown [89.207.171.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 334B42010E;
 Mon,  6 Feb 2023 11:05:46 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOyNd-0094RX-0W;
 Mon, 06 Feb 2023 11:05:45 +0100
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
X-Inumbo-ID: d32acfb1-a605-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 11:05:45 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 6/7] Mini-OS: add open and close handling to the 9pfs
 frontend
Message-ID: <20230206100545.xice46pygaoh53bf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-7-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 03 févr. 2023 10:18:08 +0100, a ecrit:
> +static unsigned int get_fid(struct dev_9pfs *dev)
> +{
> +    unsigned int fid;
> +
> +    fid = ffs(dev->fid_mask);
> +    if ( fid )
> +        dev->fid_mask &= 1ULL << (fid - 1);

Isn't that missing a ~ ?

> @@ -459,6 +522,134 @@ static int p9_attach(struct dev_9pfs *dev)
>      return ret;
>  }
>  
> +static int p9_clunk(struct dev_9pfs *dev, uint32_t fid)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret;
> +
> +    if ( !req )
> +        return ENOENT;

Rather EAGAIN? (and similar in other functions)
(actually p9_version and p9_attach could be updated too, even if in
their case it's not supposed to happen.

> +    req->cmd = P9_CMD_CLUNK;
> +    send_9p(dev, req, "U", fid);
> +    rcv_9p(dev, req, "");
> +    ret = req->result;
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}


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

Do we need to care about an empty part if we're passed "/foo//bar"?

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
[...]
> + err:
> +    free(path);
> +    close(fd);
> +    errno = ret;

This seems missing free(f9pfs)?

Samuel

