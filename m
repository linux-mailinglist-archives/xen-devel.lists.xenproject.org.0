Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A34669C3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 19:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236906.410866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msqdC-0006T7-TR; Thu, 02 Dec 2021 18:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236906.410866; Thu, 02 Dec 2021 18:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msqdC-0006QW-Pw; Thu, 02 Dec 2021 18:16:30 +0000
Received: by outflank-mailman (input) for mailman id 236906;
 Thu, 02 Dec 2021 18:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XjF0=QT=perches.com=joe@srs-se1.protection.inumbo.net>)
 id 1msqdC-0006QQ-7b
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 18:16:30 +0000
Received: from smtprelay.hostedemail.com (smtprelay0236.hostedemail.com
 [216.40.44.236]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e69d4f-539b-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 19:16:28 +0100 (CET)
Received: from omf05.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 4E9A918484CB8;
 Thu,  2 Dec 2021 18:16:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf05.hostedemail.com (Postfix) with ESMTPA id A265920016; 
 Thu,  2 Dec 2021 18:16:24 +0000 (UTC)
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
X-Inumbo-ID: f6e69d4f-539b-11ec-976b-d102b41d0961
Message-ID: <6fcddba84070c021eb92aa9a5ff15fb2a47e9acb.camel@perches.com>
Subject: Re: [PATCH] xen-blkfront: Use the bitmap API when applicable
From: Joe Perches <joe@perches.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Juergen Gross
	 <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, 
	roger.pau@citrix.com, axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Thu, 02 Dec 2021 10:16:23 -0800
In-Reply-To: <d8f87c17-75d1-2e6b-65e1-23adc75bb515@wanadoo.fr>
References: 
	<1c73cf8eaff02ea19439ec676c063e592d273cfe.1638392965.git.christophe.jaillet@wanadoo.fr>
	 <c529a221-f444-ad26-11ff-f693401c9429@suse.com>
	 <d8f87c17-75d1-2e6b-65e1-23adc75bb515@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.77
X-Stat-Signature: 561o3yrhzhgof883pt4t3mmwux5dja7y
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: A265920016
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18JTU2ijvwIy/Ds0rg5WhKwO4BPDfU4ABw=
X-HE-Tag: 1638468984-745583

On Thu, 2021-12-02 at 19:12 +0100, Christophe JAILLET wrote:
> Le 02/12/2021 à 07:12, Juergen Gross a écrit :
> > On 01.12.21 22:10, Christophe JAILLET wrote:
> > > Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid 
> > > some open-coded arithmetic in allocator arguments.
> > > 
> > > Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
> > > consistency.
> > > 
> > > Use 'bitmap_copy()' to avoid an explicit 'memcpy()'
[]
> > > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
[]
> > > @@ -442,16 +442,14 @@ static int xlbd_reserve_minors(unsigned int 
> > > minor, unsigned int nr)
> > >       if (end > nr_minors) {
> > >           unsigned long *bitmap, *old;
> > > -        bitmap = kcalloc(BITS_TO_LONGS(end), sizeof(*bitmap),
> > > -                 GFP_KERNEL);
> > > +        bitmap = bitmap_zalloc(end, GFP_KERNEL);
> > >           if (bitmap == NULL)
> > >               return -ENOMEM;
> > >           spin_lock(&minor_lock);
> > >           if (end > nr_minors) {
> > >               old = minors;
> > > -            memcpy(bitmap, minors,
> > > -                   BITS_TO_LONGS(nr_minors) * sizeof(*bitmap));
> > > +            bitmap_copy(bitmap, minors, nr_minors);
> > >               minors = bitmap;
> > >               nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;

		nr_minors = end;
?



