Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2C2DD221
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 14:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55932.97579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kptJs-0007By-Vs; Thu, 17 Dec 2020 13:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55932.97579; Thu, 17 Dec 2020 13:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kptJs-0007BZ-SV; Thu, 17 Dec 2020 13:27:48 +0000
Received: by outflank-mailman (input) for mailman id 55932;
 Thu, 17 Dec 2020 13:27:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMd0=FV=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1kptJr-0007BU-Kk
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 13:27:47 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c07b12be-9693-4e6a-a35a-7fac6f0813d0;
 Thu, 17 Dec 2020 13:27:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-abEwEbf0N_yVvfafwXb5ZQ-1; Thu, 17 Dec 2020 08:27:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962D959;
 Thu, 17 Dec 2020 13:27:41 +0000 (UTC)
Received: from localhost (ovpn-112-215.rdu2.redhat.com [10.10.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43B34E723;
 Thu, 17 Dec 2020 13:27:34 +0000 (UTC)
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
X-Inumbo-ID: c07b12be-9693-4e6a-a35a-7fac6f0813d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608211665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fcN1UDTE30qNALnBkD3BVEMwYUnsHOvNV3eVqMCCVDE=;
	b=iFy4U3hV7fCfcIkbakVqrsazLf+22lZe5zL52Gsek8AX1IMmIZlH16iXqZ4sPaNRfBz01E
	bhoSRgsXFmTmQEhpT1i1WPlbNUIMLcuEeP8sZTtTvSxZUgTi1nredJxcPMIgbjyp95wNrN
	OIB711AXRDfw/a5bYKNROhkqEDJmKKw=
X-MC-Unique: abEwEbf0N_yVvfafwXb5ZQ-1
Date: Thu, 17 Dec 2020 14:27:33 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Fam Zheng <fam@euphon.net>,
	Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Message-ID: <20201217132733.cma4u2niu3texah3@mhamilton>
References: <20201215131527.evpidxevevtfy54n@mhamilton>
 <20201215150119.GE8185@merkur.fritz.box>
 <20201215172337.w7vcn2woze2ejgco@mhamilton>
 <20201216123514.GD7548@merkur.fritz.box>
 <20201216145502.yiejsw47q5pfbzio@mhamilton>
 <20201216183102.GH7548@merkur.fritz.box>
 <20201217093744.tg6ik73o45nidcs4@mhamilton>
 <20201217105830.GA12328@merkur.fritz.box>
 <d7c1ee7f-4171-1407-3a71-a7e45708cc4a@virtuozzo.com>
 <20201217130602.GB12328@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201217130602.GB12328@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5763q23vvthyoprt"
Content-Disposition: inline

--5763q23vvthyoprt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 02:06:02PM +0100, Kevin Wolf wrote:
> Am 17.12.2020 um 13:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > 17.12.2020 13:58, Kevin Wolf wrote:
> > > Am 17.12.2020 um 10:37 hat Sergio Lopez geschrieben:
> > > > On Wed, Dec 16, 2020 at 07:31:02PM +0100, Kevin Wolf wrote:
> > > > > Am 16.12.2020 um 15:55 hat Sergio Lopez geschrieben:
> > > > > > On Wed, Dec 16, 2020 at 01:35:14PM +0100, Kevin Wolf wrote:
> > > > > > > Anyway, trying to reconstruct the block graph with BdrvChild =
pointers
> > > > > > > annotated at the edges:
> > > > > > >=20
> > > > > > > BlockBackend
> > > > > > >        |
> > > > > > >        v
> > > > > > >    backup-top ------------------------+
> > > > > > >        |   |                          |
> > > > > > >        |   +-----------------------+  |
> > > > > > >        |            0x5655068b8510 |  | 0x565505e3c450
> > > > > > >        |                           |  |
> > > > > > >        | 0x565505e42090            |  |
> > > > > > >        v                           |  |
> > > > > > >      qcow2 ---------------------+  |  |
> > > > > > >        |                        |  |  |
> > > > > > >        | 0x565505e52060         |  |  | ??? [1]
> > > > > > >        |                        |  |  |  |
> > > > > > >        v         0x5655066a34d0 |  |  |  | 0x565505fc7aa0
> > > > > > >      file                       v  v  v  v
> > > > > > >                               qcow2 (backing)
> > > > > > >                                      |
> > > > > > >                                      | 0x565505e41d20
> > > > > > >                                      v
> > > > > > >                                    file
> > > > > > >=20
> > > > > > > [1] This seems to be a BdrvChild with a non-BDS parent. Proba=
bly a
> > > > > > >      BdrvChild directly owned by the backup job.
> > > > > > >=20
> > > > > > > > So it seems this is happening:
> > > > > > > >=20
> > > > > > > > backup-top (5e48030) <---------| (5)
> > > > > > > >     |    |                      |
> > > > > > > >     |    | (6) ------------> qcow2 (5fbf660)
> > > > > > > >     |                           ^    |
> > > > > > > >     |                       (3) |    | (4)
> > > > > > > >     |-> (1) qcow2 (5e5d420) -----    |-> file (6bc0c00)
> > > > > > > >     |
> > > > > > > >     |-> (2) file (5e52060)
> > > > > > > >=20
> > > > > > > > backup-top (5e48030), the BDS that was passed as argument i=
n the first
> > > > > > > > bdrv_set_aio_context_ignore() call, is re-entered when qcow=
2 (5fbf660)
> > > > > > > > is processing its parents, and the latter is also re-entere=
d when the
> > > > > > > > first one starts processing its children again.
> > > > > > >=20
> > > > > > > Yes, but look at the BdrvChild pointers, it is through differ=
ent edges
> > > > > > > that we come back to the same node. No BdrvChild is used twic=
e.
> > > > > > >=20
> > > > > > > If backup-top had added all of its children to the ignore lis=
t before
> > > > > > > calling into the overlay qcow2, the backing qcow2 wouldn't ev=
entually
> > > > > > > have called back into backup-top.
> > > > > >=20
> > > > > > I've tested a patch that first adds every child to the ignore l=
ist,
> > > > > > and then processes those that weren't there before, as you sugg=
ested
> > > > > > on a previous email. With that, the offending qcow2 is not re-e=
ntered,
> > > > > > so we avoid the crash, but backup-top is still entered twice:
> > > > >=20
> > > > > I think we also need to every parent to the ignore list before ca=
lling
> > > > > callbacks, though it doesn't look like this is the problem you're
> > > > > currently seeing.
> > > >=20
> > > > I agree.
> > > >=20
> > > > > > bs=3D0x560db0e3b030 (backup-top) enter
> > > > > > bs=3D0x560db0e3b030 (backup-top) processing children
> > > > > > bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0=
e2f450 (child->bs=3D0x560db0fb2660)
> > > > > > bs=3D0x560db0fb2660 (qcow2) enter
> > > > > > bs=3D0x560db0fb2660 (qcow2) processing children
> > > > > > bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db0e34d2=
0 (child->bs=3D0x560db1bb3c00)
> > > > > > bs=3D0x560db1bb3c00 (file) enter
> > > > > > bs=3D0x560db1bb3c00 (file) processing children
> > > > > > bs=3D0x560db1bb3c00 (file) processing parents
> > > > > > bs=3D0x560db1bb3c00 (file) processing itself
> > > > > > bs=3D0x560db0fb2660 (qcow2) calling bsaci child=3D0x560db16964d=
0 (child->bs=3D0x560db0e50420)
> > > > > > bs=3D0x560db0e50420 (qcow2) enter
> > > > > > bs=3D0x560db0e50420 (qcow2) processing children
> > > > > > bs=3D0x560db0e50420 (qcow2) calling bsaci child=3D0x560db0e34ea=
0 (child->bs=3D0x560db0e45060)
> > > > > > bs=3D0x560db0e45060 (file) enter
> > > > > > bs=3D0x560db0e45060 (file) processing children
> > > > > > bs=3D0x560db0e45060 (file) processing parents
> > > > > > bs=3D0x560db0e45060 (file) processing itself
> > > > > > bs=3D0x560db0e50420 (qcow2) processing parents
> > > > > > bs=3D0x560db0e50420 (qcow2) processing itself
> > > > > > bs=3D0x560db0fb2660 (qcow2) processing parents
> > > > > > bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db=
1672860
> > > > > > bs=3D0x560db0fb2660 (qcow2) calling set_aio_ctx child=3D0x560db=
1b14a20
> > > > > > bs=3D0x560db0e3b030 (backup-top) enter
> > > > > > bs=3D0x560db0e3b030 (backup-top) processing children
> > > > > > bs=3D0x560db0e3b030 (backup-top) processing parents
> > > > > > bs=3D0x560db0e3b030 (backup-top) calling set_aio_ctx child=3D0x=
560db0e332d0
> > > > > > bs=3D0x560db0e3b030 (backup-top) processing itself
> > > > > > bs=3D0x560db0fb2660 (qcow2) processing itself
> > > > > > bs=3D0x560db0e3b030 (backup-top) calling bsaci child=3D0x560db0=
e35090 (child->bs=3D0x560db0e50420)
> > > > > > bs=3D0x560db0e50420 (qcow2) enter
> > > > > > bs=3D0x560db0e3b030 (backup-top) processing parents
> > > > > > bs=3D0x560db0e3b030 (backup-top) processing itself
> > > > > >=20
> > > > > > I see that "blk_do_set_aio_context()" passes "blk->root" to
> > > > > > "bdrv_child_try_set_aio_context()" so it's already in the ignor=
e list,
> > > > > > so I'm not sure what's happening here. Is backup-top is referen=
ced
> > > > > > from two different BdrvChild or is "blk->root" not pointing to
> > > > > > backup-top's BDS?
> > > > >=20
> > > > > The second time that backup-top is entered, it is not as the BDS =
of
> > > > > blk->root, but as the parent node of the overlay qcow2. Which is
> > > > > interesting, because last time it was still the backing qcow2, so=
 the
> > > > > change did have _some_ effect.
> > > > >=20
> > > > > The part that I don't understand is why you still get the line wi=
th
> > > > > child=3D0x560db1b14a20, because when you add all children to the =
ignore
> > > > > list first, that should have been put into the ignore list as one=
 of the
> > > > > first things in the whole process (when backup-top was first ente=
red).
> > > > >=20
> > > > > Is 0x560db1b14a20 a BdrvChild that has backup-top as its opaque v=
alue,
> > > > > but isn't actually present in backup-top's bs->children?
> > > >=20
> > > > Exactly, that line corresponds to this chunk of code:
> > > >=20
> > > > <---- begin ---->
> > > >      QLIST_FOREACH(child, &bs->parents, next_parent) {
> > > >          if (g_slist_find(*ignore, child)) {
> > > >              continue;
> > > >          }
> > > >          assert(child->klass->set_aio_ctx);
> > > >          *ignore =3D g_slist_prepend(*ignore, child);
> > > >          fprintf(stderr, "bs=3D%p (%s) calling set_aio_ctx child=3D=
%p\n", bs, bs->drv->format_name, child);
> > > >          child->klass->set_aio_ctx(child, new_context, ignore);
> > > >      }
> > > > <---- end ---->
> > > >=20
> > > > Do you think it's safe to re-enter backup-top, or should we look fo=
r a
> > > > way to avoid this?
> > >=20
> > > I think it should be avoided, but I don't understand why putting all
> > > children of backup-top into the ignore list doesn't already avoid it.=
 If
> > > backup-top is in the parents list of qcow2, then qcow2 should be in t=
he
> > > children list of backup-top and therefore the BdrvChild should alread=
y
> > > be in the ignore list.
> > >=20
> > > The only way I can explain this is that backup-top and qcow2 have
> > > different ideas about which BdrvChild objects exist that connect them=
.
> > > Or that the graph changes between both places, but I don't see how th=
at
> > > could happen in bdrv_set_aio_context_ignore().
> > >=20
> >=20
> > bdrv_set_aio_context_ignore() do bdrv_drained_begin().. As I reported
> > recently, nothing prevents some job finish and do graph modification
> > during some another drained section. It may be the case.
>=20
> Good point, this might be the same bug then.
>=20
> If everything worked correctly, a job completion could only happen on
> the outer bdrv_set_aio_context_ignore(). But after that, we are already
> in a drain section, so the job should be quiesced and a second drain
> shouldn't cause any additional graph changes.
>=20
> I would have to go back to the other discussion, but I think it was
> related to block jobs that are already in the completion process and
> keep moving forward even though they are supposed to be quiesced.
>=20
> If I remember correctly, actually pausing them at this point looked
> difficult. Maybe what we should then do is letting .drained_poll return
> true until they have actually fully completed?
>=20
> Ah, but was this something that would deadlock because the job
> completion callbacks use drain sections themselves?
>=20
> > If backup-top involved, I can suppose that graph modification is in
> > backup_clean, when we remove the filter.. Who is making
> > set_aio_context in the issue? I mean, what is the backtrace of
> > bdrv_set_aio_context_ignore()?
>=20
> Sergio, can you provide the backtrace and also test if the theory with a
> job completion in the middle of the process is what you actually hit?

No, I'm sure the job is not finishing in the middle of the
set_aio_context chain, which is started by a
virtio_blk_data_plane_[start|stop], which in turn is triggered by a
guest reboot.

This is a stack trace that reaches to the point in which backup-top is
entered a second time:

#0  0x0000560c3e173bbd in child_job_set_aio_ctx
    (c=3D<optimized out>, ctx=3D0x560c40c45630, ignore=3D0x7f6d4eeb6f40) at=
 ../blockjob.c:159
#1  0x0000560c3e1aefc6 in bdrv_set_aio_context_ignore
    (bs=3D0x560c40dc3660, new_context=3D0x560c40c45630, ignore=3D0x7f6d4eeb=
6f40) at ../block.c:6509
#2  0x0000560c3e1aee8a in bdrv_set_aio_context_ignore
    (bs=3Dbs@entry=3D0x560c40c4c030, new_context=3Dnew_context@entry=3D0x56=
0c40c45630, ignore=3Dignore@entry=3D0x7f6d4eeb6f40) at ../block.c:6487
#3  0x0000560c3e1af503 in bdrv_child_try_set_aio_context
    (bs=3Dbs@entry=3D0x560c40c4c030, ctx=3Dctx@entry=3D0x560c40c45630, igno=
re_child=3D<optimized out>, errp=3Derrp@entry=3D0x7f6d4eeb6fc8) at ../block=
.c:6619
#4  0x0000560c3e1e561a in blk_do_set_aio_context
    (blk=3D0x560c41ca4610, new_context=3D0x560c40c45630, update_root_node=
=3Dupdate_root_node@entry=3Dtrue, errp=3Derrp@entry=3D0x7f6d4eeb6fc8) at ..=
/block/block-backend.c:2027
#5  0x0000560c3e1e740d in blk_set_aio_context
    (blk=3D<optimized out>, new_context=3D<optimized out>, errp=3Derrp@entr=
y=3D0x7f6d4eeb6fc8)
    at ../block/block-backend.c:2048
#6  0x0000560c3e10de78 in virtio_blk_data_plane_start (vdev=3D<optimized ou=
t>)
    at ../hw/block/dataplane/virtio-blk.c:220
#7  0x0000560c3de691d2 in virtio_bus_start_ioeventfd (bus=3Dbus@entry=3D0x5=
60c41ca1e98)
    at ../hw/virtio/virtio-bus.c:222
#8  0x0000560c3de4f907 in virtio_pci_start_ioeventfd (proxy=3D0x560c41c99d9=
0)
    at ../hw/virtio/virtio-pci.c:1261
#9  0x0000560c3de4f907 in virtio_pci_common_write
    (opaque=3D0x560c41c99d90, addr=3D<optimized out>, val=3D<optimized out>=
, size=3D<optimized out>)
    at ../hw/virtio/virtio-pci.c:1261
#10 0x0000560c3e145d81 in memory_region_write_accessor
    (mr=3D0x560c41c9a770, addr=3D20, value=3D<optimized out>, size=3D1, shi=
ft=3D<optimized out>, mask=3D<optimized out>, attrs=3D...) at ../softmmu/me=
mory.c:491
#11 0x0000560c3e1447de in access_with_adjusted_size
    (addr=3Daddr@entry=3D20, value=3Dvalue@entry=3D0x7f6d4eeb71a8, size=3Ds=
ize@entry=3D1, access_size_min=3D<optimized out>, access_size_max=3D<optimi=
zed out>, access_fn=3D
    0x560c3e145c80 <memory_region_write_accessor>, mr=3D0x560c41c9a770, att=
rs=3D...)
    at ../softmmu/memory.c:552
#12 0x0000560c3e148052 in memory_region_dispatch_write
    (mr=3Dmr@entry=3D0x560c41c9a770, addr=3D20, data=3D<optimized out>, op=
=3D<optimized out>, attrs=3Dattrs@entry=3D...) at ../softmmu/memory.c:1501
#13 0x0000560c3e06b5b7 in flatview_write_continue
    (fv=3Dfv@entry=3D0x7f6d400ed3e0, addr=3Daddr@entry=3D4261429268, attrs=
=3D..., ptr=3Dptr@entry=3D0x7f6d71dad028, len=3Dlen@entry=3D1, addr1=3D<opt=
imized out>, l=3D<optimized out>, mr=3D0x560c41c9a770)
    at /home/BZs/1900326/qemu/include/qemu/host-utils.h:164
#14 0x0000560c3e06b7d6 in flatview_write
    (fv=3D0x7f6d400ed3e0, addr=3Daddr@entry=3D4261429268, attrs=3Dattrs@ent=
ry=3D..., buf=3Dbuf@entry=3D0x7f6d71dad028, len=3Dlen@entry=3D1) at ../soft=
mmu/physmem.c:2799
#15 0x0000560c3e06e330 in address_space_write
    (as=3D0x560c3ec0a920 <address_space_memory>, addr=3D4261429268, attrs=
=3D..., buf=3Dbuf@entry=3D0x7f6d71dad028, len=3D1) at ../softmmu/physmem.c:=
2891
#16 0x0000560c3e06e3ba in address_space_rw (as=3D<optimized out>, addr=3D<o=
ptimized out>, attrs=3D...,=20
    attrs@entry=3D..., buf=3Dbuf@entry=3D0x7f6d71dad028, len=3D<optimized o=
ut>, is_write=3D<optimized out>)
    at ../softmmu/physmem.c:2901
#17 0x0000560c3e10021a in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x560c40d7e0d0) a=
t ../accel/kvm/kvm-all.c:2541
#18 0x0000560c3e1445e5 in kvm_vcpu_thread_fn (arg=3Darg@entry=3D0x560c40d7e=
0d0) at ../accel/kvm/kvm-cpus.c:49
#19 0x0000560c3e2c798a in qemu_thread_start (args=3D<optimized out>) at ../=
util/qemu-thread-posix.c:521
#20 0x00007f6d6ba8614a in start_thread () at /lib64/libpthread.so.0
#21 0x00007f6d6b7b8763 in clone () at /lib64/libc.so.6

Thanks,
Sergio.

--5763q23vvthyoprt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/bXMQACgkQ9GknjS8M
AjWHbhAAqAynHW2PvCqRDO5Fkb14jQqz48cxSOsYnnLgsq18xpQ7SiA9pHN83zjJ
FBKwp2KYzTbaFF5Ojs/2JTlJBg/6ZZm+2nAXLTuMrQjQbR8ugjYB5iUk4F5ox48h
NYrmczZK5oCUbHcbXkTa8H1YyVUo7xkx0F9JDG+GUTgKuazK6edwnE7k///+JmQK
1au5ggmctwQZp2eLuX2Z0Y2cLAjkDSeSuweXH7LcAsEyf1GdlAxYVB1J0r6UXoMV
5wxaTiHJdAubwGubfeLbAfMC/v9FohtQ4VVRiOSA0P7UfJDp4pFgefNjvxwBItwR
LNc3ldk0eIGnWdt7+de0p5B6ObtMbbSqxIE3gJCLswjlZ8zjzLCnSWDJ+XJ88nx7
78wkC4KtM6fCeMeYlahVFd8Kl4e/ykVq71H9W2XKgKwRQXH218DW7U7T2yqIGugw
a6iECkEVhEksbaW5qFJvYgUH7N0hYV/InuKx5aq5f1tPD9TdTv0dPXXPkhR6r4vB
3B3FPQ13LEEBjIHcg9ygOElwqo3kWDOXPb4Ms/RGoRSGqD3eeObewLBsjzddpe7A
Vy977Bn7vrVs5hSar3e66QX2KmGFScgHAmedXOIrnM0299NCw4kCwhCF5x7hJ2Fd
OXtJhXA08Uo4q/FW8WJl9Sd/KWIa2mdVB8g+yCYYfj15i8B+N2A=
=zHsJ
-----END PGP SIGNATURE-----

--5763q23vvthyoprt--


