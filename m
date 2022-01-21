Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7343495DB4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 11:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259302.447430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAr4g-0005ZG-2v; Fri, 21 Jan 2022 10:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259302.447430; Fri, 21 Jan 2022 10:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAr4f-0005Wc-V8; Fri, 21 Jan 2022 10:23:17 +0000
Received: by outflank-mailman (input) for mailman id 259302;
 Fri, 21 Jan 2022 10:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vcJM=SF=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1nAr4e-0005WW-Sg
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 10:23:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2440556d-7aa4-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 11:23:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAC69B81ED6;
 Fri, 21 Jan 2022 10:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E29C340E2;
 Fri, 21 Jan 2022 10:23:12 +0000 (UTC)
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
X-Inumbo-ID: 2440556d-7aa4-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642760592;
	bh=Ii8yP7zh6788U1HOUMwjHhPT9P1RzJltvOJwO3NSagA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=ZW7+iSguoYSnP6jxulMh8gNC8UZD4XTHYJIdhdlufaef0ehROXK5ZiU2FHmzVDAxK
	 qFkw/z36mKQI0h+3d3gSZjczS8/9/c0aZxJYonwTgGvjy15GpNriKTPIvFkFVf4+ID
	 WoF39e2RWfeoFtQwv3EpKSux0svfJJtwRNq26KBkZjGPxL4ajBI3fTwbL3kA3jTvph
	 Ktb59Q5FIs+DgWwY2+rnMc0QdjGGT4utg2T80Zy5EI44JEwAsFZZPvlxp7pXnI6xuq
	 uqd/jRizTjfQpcuzAw09T45IkobTdvnRGTz2uzUfWxssK9ecs97I86KE4iRICzUPKU
	 iFULgvbf2XhLQ==
From: SeongJae Park <sj@kernel.org>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: paul@xen.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen, blkback: fix persistent grants negotiation
Date: Fri, 21 Jan 2022 10:23:09 +0000
Message-Id: <20220121102309.27802-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <Yd13iklHYgCxrLQw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 11 Jan 2022 13:26:50 +0100 "Roger Pau Monné" <roger.pau@citrix.com> wrote:

> On Tue, Jan 11, 2022 at 11:50:32AM +0000, Durrant, Paul wrote:
> > On 11/01/2022 11:11, Roger Pau Monné wrote:
> > > On Thu, Jan 06, 2022 at 09:10:13AM +0000, Maximilian Heyne wrote:
> > > > Given dom0 supports persistent grants but the guest does not.
> > > > Then, when attaching a block device during runtime of the guest, dom0
> > > > will enable persistent grants for this newly attached block device:
> > > > 
> > > >    $ xenstore-ls -f | grep 20674 | grep persistent
> > > >    /local/domain/0/backend/vbd/20674/768/feature-persistent = "0"
> > > >    /local/domain/0/backend/vbd/20674/51792/feature-persistent = "1"
> > > 
> > > The mechanism that we use to advertise persistent grants support is
> > > wrong. 'feature-persistent' should always be set if the backend
> > > supports persistent grant (like it's done for other features in
> > > xen_blkbk_probe). The usage of the feature depends on whether both
> > > parties support persistent grants, and the xenstore entry printed by
> > > blkback shouldn't reflect whether persistent grants are in use, but
> > > rather whether blkback supports the feature.
> > > 
> > > > 
> > > > Here disk 768 was attached during guest creation while 51792 was
> > > > attached at runtime. If the guest would have advertised the persistent
> > > > grant feature, there would be a xenstore entry like:
> > > > 
> > > >    /local/domain/20674/device/vbd/51792/feature-persistent = "1"
> > > > 
> > > > Persistent grants are also used when the guest tries to access the disk
> > > > which can be seen when enabling log stats:
> > > > 
> > > >    $ echo 1 > /sys/module/xen_blkback/parameters/log_stats
> > > >    $ dmesg
> > > >    xen-blkback: (20674.xvdf-0): oo   0  |  rd    0  |  wr    0  |  f    0 |  ds    0 | pg:    1/1056
> > > > 
> > > > The "pg: 1/1056" shows that one persistent grant is used.
> > > > 
> > > > Before commit aac8a70db24b ("xen-blkback: add a parameter for disabling
> > > > of persistent grants") vbd->feature_gnt_persistent was set in
> > > > connect_ring. After the commit it was intended to be initialized in
> > > > xen_vbd_create and then set according to the guest feature availability
> > > > in connect_ring. However, with a running guest, connect_ring might be
> > > > called before xen_vbd_create and vbd->feature_gnt_persistent will be
> > > > incorrectly initialized. xen_vbd_create will overwrite it with the value
> > > > of feature_persistent regardless whether the guest actually supports
> > > > persistent grants.
> > > > 
> > > > With this commit, vbd->feature_gnt_persistent is set only in
> > > > connect_ring and this is the only use of the module parameter
> > > > feature_persistent. This avoids races when the module parameter changes
> > > > during the block attachment process.
> > > > 
> > > > Note that vbd->feature_gnt_persistent doesn't need to be initialized in
> > > > xen_vbd_create. It's next use is in connect which can only be called
> > > > once connect_ring has initialized the rings. xen_update_blkif_status is
> > > > checking for this.
> > > > 
> > > > Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
> > > > Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> > > > ---
> > > >   drivers/block/xen-blkback/xenbus.c | 9 +++------
> > > >   1 file changed, 3 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > > > index 914587aabca0c..51b6ec0380ca4 100644
> > > > --- a/drivers/block/xen-blkback/xenbus.c
> > > > +++ b/drivers/block/xen-blkback/xenbus.c
> > > > @@ -522,8 +522,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
> > > >   	if (q && blk_queue_secure_erase(q))
> > > >   		vbd->discard_secure = true;
> > > > -	vbd->feature_gnt_persistent = feature_persistent;
> > > > -
> > > >   	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
> > > >   		handle, blkif->domid);
> > > >   	return 0;
> > > > @@ -1090,10 +1088,9 @@ static int connect_ring(struct backend_info *be)
> > > >   		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
> > > >   		return -ENOSYS;
> > > >   	}
> > > > -	if (blkif->vbd.feature_gnt_persistent)
> > > > -		blkif->vbd.feature_gnt_persistent =
> > > > -			xenbus_read_unsigned(dev->otherend,
> > > > -					"feature-persistent", 0);
> > > > +
> > > > +	blkif->vbd.feature_gnt_persistent = feature_persistent &&
> > > > +		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
> > > 
> > > I'm not sure it's correct to potentially read feature_persistent
> > > multiple times like it's done here.
> > > 
> > > A device can be disconnected and re-attached multiple times, and that
> > > implies multiple calls to connect_ring which could make the state of
> > > feature_gnt_persistent change across reconnections if the value of
> > > feature_persistent is changed. I think that would be unexpected.
> > > 
> > 
> > Would that not be legitimate though? What happens if blkfront is upgraded
> > (or downgraded)? Each connection should be 'groundhog day' for the backend
> > IMO.
> 
> Previous implementation cached the value of feature_persistent for the
> lifetime of the backend, and I assume this was the intended behavior.
> Ie: so that an admin could create a set of backends with persistent
> grants not enabled and then switch it on afterwards and expect only
> newly created backends to use the new value.
> 
> If the intention is indeed to read the value of feature_persistent on
> each reconnection it should be noted in the commit message, as it's a
> behavior change.

Sorry for late reply.  And yes, the intention of my previous implementation is
as Roger explained.  I guess simply moving the caching to xen_blkbk_probe()
would keep the behavior and fix this issue?

I'm also ok with the new behavior.  However, then we will need to clearly
describe the change in the commit message and the document[1].  Because
blkfront side also has same behavior[2], maybe keeping the behavior is better?

[1] Documentation/ABI/testing/sysfs-driver-xen-blkback
[2] 74a852479c68 ("xen-blkfront: add a parameter for disabling of persistent grants")


Thanks,
SJ

> 
> Thanks, Roger.

