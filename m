Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588D868AFC2
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 13:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489828.758363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOeOQ-0007pW-VP; Sun, 05 Feb 2023 12:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489828.758363; Sun, 05 Feb 2023 12:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOeOQ-0007m9-SU; Sun, 05 Feb 2023 12:45:14 +0000
Received: by outflank-mailman (input) for mailman id 489828;
 Sun, 05 Feb 2023 12:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O114=6B=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOeOP-0007hb-9T
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 12:45:13 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed53ab4a-a552-11ed-933c-83870f6b2ba8;
 Sun, 05 Feb 2023 13:45:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 678422013E;
 Sun,  5 Feb 2023 13:45:10 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpK39USoWs7c; Sun,  5 Feb 2023 13:45:10 +0100 (CET)
Received: from begin (unknown [164.15.244.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 376BE20134;
 Sun,  5 Feb 2023 13:45:10 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOeOL-002nFx-2b;
 Sun, 05 Feb 2023 13:45:09 +0100
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
X-Inumbo-ID: ed53ab4a-a552-11ed-933c-83870f6b2ba8
Date: Sun, 5 Feb 2023 13:45:09 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/7] Mini-OS: add concept of mount points
Message-ID: <20230205124509.pr5xswn4ygqsqoba@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 03 févr. 2023 10:18:04 +0100, a ecrit:
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
> +            return mnt->open(mnt, pathname, flags, mode);

Thinking about it more: don't we want to pass pathname+mlen?

So that the open function doesn't have to care where it's mounted.

Samuel

