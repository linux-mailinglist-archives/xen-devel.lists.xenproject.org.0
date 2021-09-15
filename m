Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0E40C44C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 13:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187516.336402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSxl-0005aD-Ih; Wed, 15 Sep 2021 11:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187516.336402; Wed, 15 Sep 2021 11:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSxl-0005X5-Fa; Wed, 15 Sep 2021 11:20:25 +0000
Received: by outflank-mailman (input) for mailman id 187516;
 Wed, 15 Sep 2021 11:20:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uklH=OF=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mQSxk-0005Wz-Hx
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 11:20:24 +0000
Received: from mail3-relais-sop.national.inria.fr (unknown [192.134.164.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac53fdfe-4486-4ce5-94bc-4f2a534ee4ad;
 Wed, 15 Sep 2021 11:20:22 +0000 (UTC)
Received: from nat-eduroam-36-gw-01-bso.bordeaux.inria.fr (HELO begin)
 ([194.199.1.36])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 13:20:20 +0200
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mQSxg-00F8lH-Bk;
 Wed, 15 Sep 2021 13:20:20 +0200
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
X-Inumbo-ID: ac53fdfe-4486-4ce5-94bc-4f2a534ee4ad
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AO0s7kKurlqaXSTNPnfL9oYNI7skDttV00zEX?=
 =?us-ascii?q?/kB9WHVpm5Oj5ruTdaUgpGbJYWgqKQkdcIa7WZVoJkmyyXcV2/h0AV7GZmPbUQ?=
 =?us-ascii?q?STQr2KgbGSoQEIeBeSygcH78ddmsFFYbWaMbEdt7eY3ODSKbodKbe8gcWVrNab?=
 =?us-ascii?q?5HMoaQFudq16qyZwDQufHkAefnggObMJULGZovddrz27YHINc4CHBn0IRfXKo8?=
 =?us-ascii?q?SjruOBXSI7?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="393037543"
Date: Wed, 15 Sep 2021 13:20:20 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] mini-os: xenbus: support large messages
Message-ID: <20210915112020.iy6vqn4qcvtbohyi@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210818152610.6114-1-jgross@suse.com>
 <20210914231742.pxpac2lhp2kk5ook@begin>
 <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 15 sept. 2021 12:48:44 +0200, a ecrit:
> On 15.09.21 01:17, Samuel Thibault wrote:
> > > +        prod = xenstore_buf->rsp_prod;
> > > +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons, prod);
> > > +        size = min(len - off, prod - xenstore_buf->rsp_cons);
> > > +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
> > > +                         MASK_XENSTORE_IDX(xenstore_buf->rsp_cons), size);
> > > +        off += size;
> > > +        notify = (xenstore_buf->rsp_cons + XENSTORE_RING_SIZE ==
> > > +                  xenstore_buf->rsp_prod);
> > 
> > This looks odd to me?  We want to notify as soon as the ring is empty,
> > which can happen at any place in the ring right?
> 
> No, we want to notify if the ring was full and is about to gain some
> space again, as the other side was probably not able to put all data
> in and is now waiting for more space to become available.

Ok, that said, the producer may fill the ring between this test and
the rsp_cons update, and thus the producer will go sleep and here the
consumer will not notice it and thus never notify it.

So we really need to make the test after the rsp_cons update, like Linux
does:

> > Linux' code uses (intf->rsp_prod - cons >= XENSTORE_RING_SIZE), *after*
> > the rsp_cons increase.

Samuel

