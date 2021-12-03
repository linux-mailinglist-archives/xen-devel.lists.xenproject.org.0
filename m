Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39746707A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 04:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237105.411204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msyrO-0008Ly-CU; Fri, 03 Dec 2021 03:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237105.411204; Fri, 03 Dec 2021 03:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msyrO-0008KD-8a; Fri, 03 Dec 2021 03:03:42 +0000
Received: by outflank-mailman (input) for mailman id 237105;
 Fri, 03 Dec 2021 03:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Fj5=QU=perches.com=joe@srs-se1.protection.inumbo.net>)
 id 1msyrN-0008K7-6g
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 03:03:41 +0000
Received: from smtprelay.hostedemail.com (smtprelay0044.hostedemail.com
 [216.40.44.44]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b1432fb-53e5-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 04:03:37 +0100 (CET)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 140B9101369A0;
 Fri,  3 Dec 2021 03:03:35 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf06.hostedemail.com (Postfix) with ESMTPA id 6DDA420015; 
 Fri,  3 Dec 2021 03:03:32 +0000 (UTC)
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
X-Inumbo-ID: 9b1432fb-53e5-11ec-976b-d102b41d0961
Message-ID: <863f2cddacac590d581cda09d548ee0a652df8a1.camel@perches.com>
Subject: Re: [PATCH] xen-blkfront: Use the bitmap API when applicable
From: Joe Perches <joe@perches.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Juergen Gross
	 <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, 
	roger.pau@citrix.com, axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Thu, 02 Dec 2021 19:03:32 -0800
In-Reply-To: <3d71577f-dabe-6e1a-4b03-2a44f304b702@wanadoo.fr>
References: 
	<1c73cf8eaff02ea19439ec676c063e592d273cfe.1638392965.git.christophe.jaillet@wanadoo.fr>
	 <c529a221-f444-ad26-11ff-f693401c9429@suse.com>
	 <d8f87c17-75d1-2e6b-65e1-23adc75bb515@wanadoo.fr>
	 <6fcddba84070c021eb92aa9a5ff15fb2a47e9acb.camel@perches.com>
	 <3d71577f-dabe-6e1a-4b03-2a44f304b702@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: dsgan1p8pchxr8wbecis6grq8tsez18d
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 6DDA420015
X-Spam-Status: No, score=-4.90
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/U5Pxt1pAwSKl1eR87urKf9gGDN2xSyaw=
X-HE-Tag: 1638500612-192617

On Thu, 2021-12-02 at 20:07 +0100, Christophe JAILLET wrote:
> Le 02/12/2021 à 19:16, Joe Perches a écrit :
> > On Thu, 2021-12-02 at 19:12 +0100, Christophe JAILLET wrote:
> > > Le 02/12/2021 à 07:12, Juergen Gross a écrit :
> > > > On 01.12.21 22:10, Christophe JAILLET wrote:
> > > > > Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid
> > > > > some open-coded arithmetic in allocator arguments.
> > > > > 
> > > > > Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
> > > > > consistency.
> > > > > 
> > > > > Use 'bitmap_copy()' to avoid an explicit 'memcpy()'
> > []
> > > > > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > []
> > > > > @@ -442,16 +442,14 @@ static int xlbd_reserve_minors(unsigned int
> > > > > minor, unsigned int nr)
> > > > >        if (end > nr_minors) {
> > > > >            unsigned long *bitmap, *old;
> > > > > -        bitmap = kcalloc(BITS_TO_LONGS(end), sizeof(*bitmap),
> > > > > -                 GFP_KERNEL);
> > > > > +        bitmap = bitmap_zalloc(end, GFP_KERNEL);
> > > > >            if (bitmap == NULL)
> > > > >                return -ENOMEM;
> > > > >            spin_lock(&minor_lock);
> > > > >            if (end > nr_minors) {
> > > > >                old = minors;
> > > > > -            memcpy(bitmap, minors,
> > > > > -                   BITS_TO_LONGS(nr_minors) * sizeof(*bitmap));
> > > > > +            bitmap_copy(bitmap, minors, nr_minors);
> > > > >                minors = bitmap;
> > > > >                nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;
> > 
> > 		nr_minors = end;
> > ?
> > 
> 
> No,
> My understanding of the code is that if we lack space (end > nr_minors), 
> we need to allocate more. In such a case, we want to keep track of what 
> we have allocated, not what we needed.
> The "padding" bits in the "long align" allocation, can be used later.

> 
> first call
> ----------
> end = 65
> nr_minors = 63
> 
> --> we need some space
> --> we allocate 2 longs = 128 bits
> --> we now use 65 bits of these 128 bits

or 96, 32 or 64 bit longs remember.

> 
> new call
> --------
> end = 68
> nr_minors = 128 (from previous call)

The initial allocation is now bitmap_zalloc which
specifies only bits and the nr_minors is then in
BITS_TO_LONGS(bits) * BITS_PER_LONG

Perhaps that assumes too much about the internal
implementation of bitmap_alloc




