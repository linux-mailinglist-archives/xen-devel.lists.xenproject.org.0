Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA9768B99F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 11:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490214.758832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyVR-0007gW-Em; Mon, 06 Feb 2023 10:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490214.758832; Mon, 06 Feb 2023 10:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOyVR-0007eQ-Az; Mon, 06 Feb 2023 10:13:49 +0000
Received: by outflank-mailman (input) for mailman id 490214;
 Mon, 06 Feb 2023 10:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8JA=6C=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOyVP-0007eF-Ew
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 10:13:47 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efd3c771-a606-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 11:13:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 2567720127;
 Mon,  6 Feb 2023 11:13:43 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lz8KYkgw86im; Mon,  6 Feb 2023 11:13:43 +0100 (CET)
Received: from begin (unknown [89.207.171.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 0B8452010E;
 Mon,  6 Feb 2023 11:13:43 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOyVJ-0095QC-0K;
 Mon, 06 Feb 2023 11:13:41 +0100
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
X-Inumbo-ID: efd3c771-a606-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 11:13:41 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 7/7] Mini-OS: add read and write support to 9pfsfront
Message-ID: <20230206101341.5l7cxb2vvregskrx@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-8-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)


Juergen Gross, le ven. 03 févr. 2023 10:18:09 +0100, a ecrit:
> This patch is missing the limitation of read/write messages to stay
> below the max. supported message size.

It should at least be asserted.

> +static int p9_read(struct dev_9pfs *dev, uint32_t fid, uint64_t offset,
> +                   uint8_t *data, uint32_t len)
> +{
> +    struct req *req = get_free_req(dev);
> +    int ret;
> +    uint32_t count;
> +
> +    if ( !req )
> +    {
> +        errno = EIO;

Here as well (and in p9_write) we'd want EAGAIN rather than EIO which
can be mistaken with the error case below.

> +        return -1;
> +    }
> +
> +    req->cmd = P9_CMD_READ;
> +    send_9p(dev, req, "ULU", fid, offset, len);
> +    rcv_9p(dev, req, "D", &count, data);
> +
> +    if ( req->result )
> +    {
> +        ret = -1;
> +        errno = EIO;
> +    }
> +    else
> +        ret = count;
> +
> +    put_free_req(dev, req);
> +
> +    return ret;
> +}

Samuel

