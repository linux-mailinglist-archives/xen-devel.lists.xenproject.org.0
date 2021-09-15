Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106E40C776
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 16:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187728.336709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVwC-0005wI-QY; Wed, 15 Sep 2021 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187728.336709; Wed, 15 Sep 2021 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQVwC-0005uM-Mu; Wed, 15 Sep 2021 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 187728;
 Wed, 15 Sep 2021 14:30:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uklH=OF=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mQVwA-0005gO-IW
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 14:30:58 +0000
Received: from mail2-relais-roc.national.inria.fr (unknown [192.134.164.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86930eac-1631-11ec-b536-12813bfff9fa;
 Wed, 15 Sep 2021 14:30:51 +0000 (UTC)
Received: from nat-eduroam-36-gw-01-bso.bordeaux.inria.fr (HELO begin)
 ([194.199.1.36])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 16:30:50 +0200
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mQVw1-00FD1a-0C;
 Wed, 15 Sep 2021 16:30:49 +0200
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
X-Inumbo-ID: 86930eac-1631-11ec-b536-12813bfff9fa
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A10s0O6PZyLiCZ8BcTqajsMiBIKoaSvp037BN?=
 =?us-ascii?q?7SFMoH1uHPBw+Pre/8jzuSWE6gr5O0tOpTn/Asm9qBrnnPYfi7X5Vo3PYOCJgg?=
 =?us-ascii?q?aVEL0=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="528623449"
Date: Wed, 15 Sep 2021 16:30:48 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3] xenbus: support large messages
Message-ID: <20210915143048.lluaekufonze6pic@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210915140815.26736-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915140815.26736-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Re,

Juergen Gross, le mer. 15 sept. 2021 16:08:15 +0200, a ecrit:
> +    while (off != len)
> +    {
> +        wait_event(xb_waitq, xenstore_buf->rsp_prod != xenstore_buf->rsp_cons);
> +
> +        prod = xenstore_buf->rsp_prod;
> +        cons = xenstore_buf->rsp_cons;
> +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", cons, prod);
> +        size = min(len - off, prod - cons);
> +
> +        rmb();   /* Make sure data read from ring is ordered with rsp_prod. */
> +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
> +                         MASK_XENSTORE_IDX(cons), size);
> +        off += size;
> +        xenstore_buf->rsp_cons += size;
> +        wmb();
> +        if (xenstore_buf->rsp_prod - cons >= XENSTORE_RING_SIZE)
> +            notify_remote_via_evtchn(xenbus_evtchn);
> +    }

Reading it again, I'm still not convinced we covered all cases. There is
at least one thing: Linux does

	virt_rmb();
	memcpy(data, src, avail);
	/* Other side must not see free space until we've copied out */
	virt_mb();
	intf->rsp_cons += avail;

which makes sense to me: we don't want the compiler or anything to
reorder the write to rsp_cons respectively to the memcpy. So I believe
we also need a full barrier before 

	xenstore_buf->rsp_cons += size;

in mini-os.


Then there is

	xenstore_buf->rsp_cons += size;
	wmb();
	if (xenstore_buf->rsp_prod - cons >= XENSTORE_RING_SIZE)
	    notify_remote_via_evtchn(xenbus_evtchn);

The Linux code does

	intf->rsp_cons += avail;
	
	/* Implies mb(): other side will see the updated consumer. */
	if (intf->rsp_prod - cons >= XENSTORE_RING_SIZE)
		notify_remote_via_evtchn(xen_store_evtchn);

(Note that the "Implies mb()" comment is about the notify_remote_via_evtchn call)

I believe the Linux code itself is missing a full barrier here: before
reading intf->rsp_prod, we want to make sure that our update of rsp_cons
is seen by the producer. Otherwise it may happen that the producer
doesn't see the rsp_cons and updates its rsp_prod (filling the ring
and going to sleep), and the consumer does not see the rsp_prod update
either, and thus we miss a notification and the producer stays stuck.

Extremely rare scenario etc. but I believe we do want a full barrier
between rsp_cons += and the if, both in mini-os and Linux.

Samuel

