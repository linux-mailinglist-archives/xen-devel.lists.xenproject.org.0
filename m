Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8268B8D4
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 10:41:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490154.758742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxzO-0000Oi-7f; Mon, 06 Feb 2023 09:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490154.758742; Mon, 06 Feb 2023 09:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOxzO-0000Mc-48; Mon, 06 Feb 2023 09:40:42 +0000
Received: by outflank-mailman (input) for mailman id 490154;
 Mon, 06 Feb 2023 09:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8JA=6C=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pOxzM-0000MP-MO
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 09:40:40 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de7cc13-a602-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 10:40:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 546FE20127;
 Mon,  6 Feb 2023 10:40:34 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1HQiThQCbPM; Mon,  6 Feb 2023 10:40:34 +0100 (CET)
Received: from begin (unknown [89.207.171.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EDDB62010A;
 Mon,  6 Feb 2023 10:40:33 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pOxzE-0091TM-3B;
 Mon, 06 Feb 2023 10:40:32 +0100
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
X-Inumbo-ID: 4de7cc13-a602-11ed-933c-83870f6b2ba8
Date: Mon, 6 Feb 2023 10:40:32 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 5/7] Mini-OS: add 9pfs transport layer
Message-ID: <20230206094032.se33a5z3kzfauywg@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203091809.14478-6-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 03 févr. 2023 10:18:07 +0100, a ecrit:
> +/*
> + * Using an opportunistic approach for receiving data: in case multiple
> + * requests are outstanding (which is very unlikely), we nevertheless need
> + * to consume all data available until we reach the desired request.
> + * For requests other than the one we are waiting for, we link the complete
> + * data to the request via an intermediate buffer. For our own request we can
> + * omit that buffer and directly fill the caller provided variables.
> + */

This documents the "why" which is very welcome, but does not document
what the function does exactly (AIUI, copy from buf1+buf2 into target up
to len bytes, and update buf/len accordingly).

> +static void copy_bufs(unsigned char **buf1, unsigned char **buf2,
> +                      unsigned int *len1, unsigned int *len2,
> +                      void *target, unsigned int len)
> +{
> +    if ( len <= *len1 )
> +    {
> +        memcpy(target, *buf1, len);
> +        *buf1 += len;
> +        *len1 -= len;
> +    }
> +    else
> +    {
> +        memcpy(target, *buf1, *len1);
> +        target = (char *)target + *len1;
> +        len -= *len1;
> +        *buf1 = *buf2;
> +        *len1 = *len2;
> +        *buf2 = NULL;
> +        *len2 = 0;
> +        if ( len > *len1 )
> +            len = *len1;

But then this is a short copy, don't we need to error out, or at least
log something? Normally the other end is not supposed to push data
incrementaly, but better at least catch such misprogramming.

> +        memcpy(target, *buf1, *len1);
> +    }
> +}
> +
> +static void rcv_9p_copy(struct dev_9pfs *dev, struct req *req,
> +                        struct p9_header *hdr, const char *fmt, va_list ap)

Please document what this helper function does (at the very least which
way the copy happens). The hdr != NULL vs == NULL notably needs to be
explained.

> +        case 'Q':
> +            qval = va_arg(ap, uint8_t *);
> +            copy_bufs(&buf1, &buf2, &len1, &len2, qval, 13);

I'd say make this 13 a macro.


> +static void rcv_9p(struct dev_9pfs *dev, struct req *req, const char *fmt, ...)
> +{
> +    va_list ap;
> +
> +    va_start(ap, fmt);
> +
> +    down(&dev->ring_in_sem);
> +
> +    while ( !rcv_9p_one(dev, req, fmt, ap) );
> +
> +    rmb(); /* Read all data before updating ring index. */
> +    dev->intf->in_cons = dev->cons_pvt_in;

Shouldn't there be an event notification after updating the consumption
index?

> +    up(&dev->ring_in_sem);
> +
> +    va_end(ap);
> +}

Samuel

