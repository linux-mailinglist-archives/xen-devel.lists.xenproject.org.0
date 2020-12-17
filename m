Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EFD2DD1CF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 14:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55920.97543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpszC-0004wT-76; Thu, 17 Dec 2020 13:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55920.97543; Thu, 17 Dec 2020 13:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpszC-0004w3-3P; Thu, 17 Dec 2020 13:06:26 +0000
Received: by outflank-mailman (input) for mailman id 55920;
 Thu, 17 Dec 2020 13:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiow=FV=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1kpszA-0004vy-32
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 13:06:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a3fdc264-2b9d-4240-a530-1c11f20ed6de;
 Thu, 17 Dec 2020 13:06:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-y7LRLn09PFaB_IwleJrLMQ-1; Thu, 17 Dec 2020 08:06:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9081835DE9;
 Thu, 17 Dec 2020 13:06:18 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33C431B469;
 Thu, 17 Dec 2020 13:06:03 +0000 (UTC)
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
X-Inumbo-ID: a3fdc264-2b9d-4240-a530-1c11f20ed6de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608210382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoEHYiafdJ3VFjwGMLtUd6Ab5KECP7FSkHqJfsBmj5k=;
	b=BZ9tLnM+CoT28EsvTFHlQDLAukWSW/q7+R+jOh8ydGMB+rPD7RcOpbzJtcGFp1oxepTUTq
	6nVa+VU/K/9+lVeTEhwZpGbn7tRd/iGltwwavDp0uk19TwCTMO3YgLCkMerRfscMNV5jlS
	Yl315nEUZqod4kk/ebUPl1u8Z9uVP0M=
X-MC-Unique: y7LRLn09PFaB_IwleJrLMQ-1
Date: Thu, 17 Dec 2020 14:06:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Sergio Lopez <slp@redhat.com>, Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201217130602.GB12328@merkur.fritz.box>
References: <20201215121233.GD8185@merkur.fritz.box>
 <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
 <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 17.12.2020 um 13:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 17.12.2020 13:58, Kevin Wolf wrote:
> > Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
> > > On Wed, Dec 16, 2020 at 07:31:02PM +0100, Kevin Wolf wrote:
> > > > Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
> > > > > On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
> > > > > > Anyway, trying to reconstruct the block graph with BdrvChild pointers
> > > > > > annotated at the edges:
> > > > > > 
> > > > > > BlockBackend
> > > > > >        |
> > > > > >        v
> > > > > >    backup-top ------------------------+
> > > > > >        |   |                          |
> > > > > >        |   +-----------------------+  |
> > > > > >        |            0x5655068b8510 |  | 0x565505e3c450
> > > > > >        |                           |  |
> > > > > >        | 0x565505e42090            |  |
> > > > > >        v                           |  |
> > > > > >      qcow2 ---------------------+  |  |
> > > > > >        |                        |  |  |
> > > > > >        | 0x565505e52060         |  |  | ??? [1]
> > > > > >        |                        |  |  |  |
> > > > > >        v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
> > > > > >      file                       v  v  v  v
> > > > > >                               qcow2 (backing)
> > > > > >                                      |
> > > > > >                                      | 0x565505e41d20
> > > > > >                                      v
> > > > > >                                    file
> > > > > > 
> > > > > > [1] This seems to be a BdrvChild with a non-BDS parent. Probably a
> > > > > >      BdrvChild directly owned by the backup job.
> > > > > > 
> > > > > > > So it seems this is happening:
> > > > > > > 
> > > > > > > backup-top (5e48030) <---------| (5)
> > > > > > >     |    |                      |
> > > > > > >     |    | (6) ------------> qcow2 (5fbf660)
> > > > > > >     |                           ^    |
> > > > > > >     |                       (3) |    | (4)
> > > > > > >     |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
> > > > > > >     |
> > > > > > >     |-> (2) file (5e52060)
> > > > > > > 
> > > > > > > backup-top (5e48030), the BDS that was passed as argument in the first
> > > > > > > bdrv_set_aio_context_ignore() call, is re-entered when qcow2 (5fbf660)
> > > > > > > is processing its parents, and the latter is also re-entered when the
> > > > > > > first one starts processing its children again.
> > > > > > 
> > > > > > Yes, but look at the BdrvChild pointers, it is through different edges
> > > > > > that we come back to the same node. No BdrvChild is used twice.
> > > > > > 
> > > > > > If backup-top had added all of its children to the ignore list before
> > > > > > calling into the overlay qcow2, the backing qcow2 wouldn't eventually
> > > > > > have called back into backup-top.
> > > > > 
> > > > > I've tested a patch that first adds every child to the ignore list,
> > > > > and then processes those that weren't there before, as you suggested
> > > > > on a previous email. With that, the offending qcow2 is not re-entered,
> > > > > so we avoid the crash, but backup-top is still entered twice:
> > > > 
> > > > I think we also need to every parent to the ignore list before calling
> > > > callbacks, though it doesn't look like this is the problem you're
> > > > currently seeing.
> > > 
> > > I agree.
> > > 
> > > > > bs=0x560db0e3b030 (backup-top) enter
> > > > > bs=0x560db0e3b030 (backup-top) processing children
> > > > > bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e2f450 (child->bs=0x560db0fb2660)
> > > > > bs=0x560db0fb2660 (qcow2) enter
> > > > > bs=0x560db0fb2660 (qcow2) processing children
> > > > > bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db0e34d20 (child->bs=0x560db1bb3c00)
> > > > > bs=0x560db1bb3c00 (file) enter
> > > > > bs=0x560db1bb3c00 (file) processing children
> > > > > bs=0x560db1bb3c00 (file) processing parents
> > > > > bs=0x560db1bb3c00 (file) processing itself
> > > > > bs=0x560db0fb2660 (qcow2) calling bsaci child=0x560db16964d0 (child->bs=0x560db0e50420)
> > > > > bs=0x560db0e50420 (qcow2) enter
> > > > > bs=0x560db0e50420 (qcow2) processing children
> > > > > bs=0x560db0e50420 (qcow2) calling bsaci child=0x560db0e34ea0 (child->bs=0x560db0e45060)
> > > > > bs=0x560db0e45060 (file) enter
> > > > > bs=0x560db0e45060 (file) processing children
> > > > > bs=0x560db0e45060 (file) processing parents
> > > > > bs=0x560db0e45060 (file) processing itself
> > > > > bs=0x560db0e50420 (qcow2) processing parents
> > > > > bs=0x560db0e50420 (qcow2) processing itself
> > > > > bs=0x560db0fb2660 (qcow2) processing parents
> > > > > bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1672860
> > > > > bs=0x560db0fb2660 (qcow2) calling set_aio_ctx child=0x560db1b14a20
> > > > > bs=0x560db0e3b030 (backup-top) enter
> > > > > bs=0x560db0e3b030 (backup-top) processing children
> > > > > bs=0x560db0e3b030 (backup-top) processing parents
> > > > > bs=0x560db0e3b030 (backup-top) calling set_aio_ctx child=0x560db0e332d0
> > > > > bs=0x560db0e3b030 (backup-top) processing itself
> > > > > bs=0x560db0fb2660 (qcow2) processing itself
> > > > > bs=0x560db0e3b030 (backup-top) calling bsaci child=0x560db0e35090 (child->bs=0x560db0e50420)
> > > > > bs=0x560db0e50420 (qcow2) enter
> > > > > bs=0x560db0e3b030 (backup-top) processing parents
> > > > > bs=0x560db0e3b030 (backup-top) processing itself
> > > > > 
> > > > > I see that "blk_do_set_aio_context()" passes "blk->root" to
> > > > > "bdrv_child_try_set_aio_context()" so it's already in the ignore list,
> > > > > so I'm not sure what's happening here. Is backup-top is referenced
> > > > > from two different BdrvChild or is "blk->root" not pointing to
> > > > > backup-top's BDS?
> > > > 
> > > > The second time that backup-top is entered, it is not as the BDS of
> > > > blk->root, but as the parent node of the overlay qcow2. Which is
> > > > interesting, because last time it was still the backing qcow2, so the
> > > > change did have _some_ effect.
> > > > 
> > > > The part that I don't understand is why you still get the line with
> > > > child=0x560db1b14a20, because when you add all children to the ignore
> > > > list first, that should have been put into the ignore list as one of the
> > > > first things in the whole process (when backup-top was first entered).
> > > > 
> > > > Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque value,
> > > > but isn't actually present in backup-top's bs->children?
> > > 
> > > Exactly, that line corresponds to this chunk of code:
> > > 
> > > <---- begin ---->
> > >      QLIST_FOREACH(child, &bs->parents, next_parent) {
> > >          if (g_slist_find(*ignore, child)) {
> > >              continue;
> > >          }
> > >          assert(child->klass->set_aio_ctx);
> > >          *ignore = g_slist_prepend(*ignore, child);
> > >          fprintf(stderr, "bs=%p (%s) calling set_aio_ctx child=%p\n", bs, bs->drv->format_name, child);
> > >          child->klass->set_aio_ctx(child, new_context, ignore);
> > >      }
> > > <---- end ---->
> > > 
> > > Do you think it's safe to re-enter backup-top, or should we look for a
> > > way to avoid this?
> > 
> > I think it should be avoided, but I don't understand why putting all
> > children of backup-top into the ignore list doesn't already avoid it. If
> > backup-top is in the parents list of qcow2, then qcow2 should be in the
> > children list of backup-top and therefore the BdrvChild should already
> > be in the ignore list.
> > 
> > The only way I can explain this is that backup-top and qcow2 have
> > different ideas about which BdrvChild objects exist that connect them.
> > Or that the graph changes between both places, but I don't see how that
> > could happen in bdrv_set_aio_context_ignore().
> > 
> 
> bdrv_set_aio_context_ignore() do bdrv_drained_begin().. As I reported
> recently, nothing prevents some job finish and do graph modification
> during some another drained section. It may be the case.

Good point, this might be the same bug then.

If everything worked correctly, a job completion could only happen on
the outer bdrv_set_aio_context_ignore(). But after that, we are already
in a drain section, so the job should be quiesced and a second drain
shouldn't cause any additional graph changes.

I would have to go back to the other discussion, but I think it was
related to block jobs that are already in the completion process and
keep moving forward even though they are supposed to be quiesced.

If I remember correctly, actually pausing them at this point looked
difficult. Maybe what we should then do is letting .drained_poll return
true until they have actually fully completed?

Ah, but was this something that would deadlock because the job
completion callbacks use drain sections themselves?

> If backup-top involved, I can suppose that graph modification is in
> backup_clean, when we remove the filter.. Who is making
> set_aio_context in the issue? I mean, what is the backtrace of
> bdrv_set_aio_context_ignore()?

Sergio, can you provide the backtrace and also test if the theory with a
job completion in the middle of the process is what you actually hit?

Kevin


