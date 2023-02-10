Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BA06925EC
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 20:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493595.763596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYcE-0007GN-5E; Fri, 10 Feb 2023 18:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493595.763596; Fri, 10 Feb 2023 18:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYcE-0007Di-2B; Fri, 10 Feb 2023 18:59:22 +0000
Received: by outflank-mailman (input) for mailman id 493595;
 Fri, 10 Feb 2023 18:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qATP=6G=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pQYcC-0007Bl-5B
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:59:20 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04fc30ba-a975-11ed-933c-83870f6b2ba8;
 Fri, 10 Feb 2023 19:59:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9912B20162;
 Fri, 10 Feb 2023 19:59:17 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sn_dddDhMJVD; Fri, 10 Feb 2023 19:59:17 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6B9572015E;
 Fri, 10 Feb 2023 19:59:17 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pQYc8-006ghi-2H;
 Fri, 10 Feb 2023 19:59:16 +0100
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
X-Inumbo-ID: 04fc30ba-a975-11ed-933c-83870f6b2ba8
Date: Fri, 10 Feb 2023 19:59:16 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 7/7] Mini-OS: add read and write support to 9pfsfront
Message-ID: <20230210185916.2qjo6yh7c3usheyp@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210104628.14374-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 10 févr. 2023 11:46:28 +0100, a ecrit:
> +    while ( len )
> +    {
> +        count = len;
> +        if ( count > dev->msize_max - 24 )
> +            count = dev->msize_max - 24;

24 should be detailed, to include e.g. sizeof(p9_header) and the sum of
sizes of the fields (I'm surprised that it's the same 24 for read and
write, notably).

> +        send_9p(dev, req, "ULU", fid, offset, count);
> +        rcv_9p(dev, req, "D", &count, data);
> +
> +        if ( !count )
> +            break;
> +        if ( req->result )
> +        {
> +            ret = -1;
> +            errno = EIO;

I'd say log req->result?

> +            break;
> +        }
> +        ret += count;
> +        offset += count;
> +        data += count;
> +        len -= count;
> +    }
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}
> +
> +static int p9_write(struct dev_9pfs *dev, uint32_t fid, uint64_t offset,
> +                    const uint8_t *data, uint32_t len)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret = 0;
> +    uint32_t count;
> +
> +    if ( !req )
> +    {
> +        errno = EAGAIN;
> +        return -1;
> +    }
> +    req->cmd = P9_CMD_WRITE;
> +
> +    while ( len )
> +    {
> +        count = len;
> +        if ( count > dev->msize_max - 24 )
> +            count = dev->msize_max - 24;

Same here.

> +        send_9p(dev, req, "ULD", fid, offset, count, data);
> +        rcv_9p(dev, req, "U", &count);
> +        if ( req->result )
> +        {
> +            ret = -1;
> +            errno = EIO;

Same here.

> +            break;
> +        }
> +        ret += count;
> +        offset += count;
> +        data += count;
> +        len -= count;
> +    }
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}

