Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A320040BC1D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 01:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187066.335800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQHgU-0006eU-3W; Tue, 14 Sep 2021 23:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187066.335800; Tue, 14 Sep 2021 23:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQHgU-0006cJ-0O; Tue, 14 Sep 2021 23:17:50 +0000
Received: by outflank-mailman (input) for mailman id 187066;
 Tue, 14 Sep 2021 23:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzMZ=OE=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mQHgS-0006cD-6s
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 23:17:48 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c39529d0-a703-408e-911a-c82fd71502a0;
 Tue, 14 Sep 2021 23:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id ED04127B;
 Wed, 15 Sep 2021 01:17:43 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3XfStTJK8Dom; Wed, 15 Sep 2021 01:17:43 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 537014A;
 Wed, 15 Sep 2021 01:17:43 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mQHgM-00DvMY-DX;
 Wed, 15 Sep 2021 01:17:42 +0200
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
X-Inumbo-ID: c39529d0-a703-408e-911a-c82fd71502a0
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Wed, 15 Sep 2021 01:17:42 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] mini-os: xenbus: support large messages
Message-ID: <20210914231742.pxpac2lhp2kk5ook@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210818152610.6114-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210818152610.6114-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: ED04127B
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Hello,

Thanks for having worked on this!

Juergen Gross, le mer. 18 août 2021 17:26:10 +0200, a ecrit:
> +static void xenbus_read_data(char *buf, unsigned int len)
> +{
> +    unsigned int off = 0;
> +    unsigned int prod;
> +    unsigned int size;
> +    int notify;
> +
> +    while (off != len)
> +    {
> +        if (xenstore_buf->rsp_prod == xenstore_buf->rsp_cons)
> +            wait_event(xb_waitq,
> +                       xenstore_buf->rsp_prod != xenstore_buf->rsp_cons);

The if is redundant since wait_event already tests it.

> +        prod = xenstore_buf->rsp_prod;
> +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons, prod);
> +        size = min(len - off, prod - xenstore_buf->rsp_cons);
> +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
> +                         MASK_XENSTORE_IDX(xenstore_buf->rsp_cons), size);
> +        off += size;
> +        notify = (xenstore_buf->rsp_cons + XENSTORE_RING_SIZE ==
> +                  xenstore_buf->rsp_prod);

This looks odd to me?  We want to notify as soon as the ring is empty,
which can happen at any place in the ring right?

Linux' code uses (intf->rsp_prod - cons >= XENSTORE_RING_SIZE), *after*
the rsp_cons increase.

> +        rmb();

rmb() must be placed before memcpy_from_ring, to make sure that the data
we read from the buffer is up-to-date according to the read we made from
rsp_prod.

The rest seems ok to me.

Samuel

