Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD3814E0C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 18:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655286.1022986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEBi3-0002SE-4r; Fri, 15 Dec 2023 17:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655286.1022986; Fri, 15 Dec 2023 17:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEBi3-0002PP-1L; Fri, 15 Dec 2023 17:10:47 +0000
Received: by outflank-mailman (input) for mailman id 655286;
 Fri, 15 Dec 2023 17:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpGJ=H2=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1rEBi1-0002PI-1H
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 17:10:45 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df19536e-9b6c-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 18:10:40 +0100 (CET)
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
X-Inumbo-ID: df19536e-9b6c-11ee-9b0f-b553b5be7939
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702660239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0HJJPub1Rbn3MJWlEsGP0R+kJz2sY8/FL1YHZqJTPQ=;
	b=bu//WPoJj1s+CyuzY9fCzuWUPNElBTG0mDAue5MtksSZ/nlXc3JYfccn6tG0UR7/s9bLcB
	TyHwPF9rL6/pk9aAThq84QZ/O0PPk1BIhRiaV+wWrm874nalOaix3eDsDuVspKXyfMpQsX
	SEP7qczM42BqZeYaUbDx8DFkqux75/XmDcmsMW8XVXUoArSSTH/2/SLlrKU/Y/BeoEFJ1G
	niUm3L0GNIf2r6tGor3HgSQ2mPyJbN54p8y9ylbMz9svBrqSDE0+Rvfj8QwFQ3UWZybFQ3
	9KKmqHpMn8OyR/lDx/Ew+Azv1ohXTln9Yj3vk5ZeyQyuhF5aBTxjwvDJbtZIEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702660239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0HJJPub1Rbn3MJWlEsGP0R+kJz2sY8/FL1YHZqJTPQ=;
	b=IFHcLtVItNS1jqIMdMN6dYTNqvyEKzMDmeSXBvDnw0eZeuYwuQGT7alkK3RqsOXKSI1Vp9
	o+kMgK4SkJMS6CBw==
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hao Luo <haoluo@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	KP Singh <kpsingh@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wei.liu@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	bpf@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org
Subject: [PATCH net-next 16/24] net: netkit, veth, tun, virt*: Use nested-BH locking for XDP redirect.
Date: Fri, 15 Dec 2023 18:07:35 +0100
Message-ID: <20231215171020.687342-17-bigeasy@linutronix.de>
In-Reply-To: <20231215171020.687342-1-bigeasy@linutronix.de>
References: <20231215171020.687342-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The per-CPU variables used during bpf_prog_run_xdp() invocation and
later during xdp_do_redirect() rely on disabled BH for their protection.
Without locking in local_bh_disable() on PREEMPT_RT these data structure
require explicit locking.

This is a follow-up on the previous change which introduced
bpf_run_lock.redirect_lock and uses it now within drivers.

The simple way is to acquire the lock before bpf_prog_run_xdp() is
invoked and hold it until the end of function.
This does not always work because some drivers (cpsw, atlantic) invoke
xdp_do_flush() in the same context.
Acquiring the lock in bpf_prog_run_xdp() and dropping in
xdp_do_redirect() (without touching drivers) does not work because not
all driver, which use bpf_prog_run_xdp(), do support XDP_REDIRECT (and
invoke xdp_do_redirect()).

Ideally the minimal locking scope would be bpf_prog_run_xdp() +
xdp_do_redirect() and everything else (error recovery, DMA unmapping,
free/ alloc of memory, =E2=80=A6) would happen outside of the locked sectio=
n.

Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Hao Luo <haoluo@google.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Song Liu <song@kernel.org>
Cc: Stanislav Fomichev <sdf@google.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org
Cc: virtualization@lists.linux.dev
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/net/hyperv/netvsc_bpf.c |  1 +
 drivers/net/netkit.c            | 13 +++++++----
 drivers/net/tun.c               | 28 +++++++++++++----------
 drivers/net/veth.c              | 40 ++++++++++++++++++++-------------
 drivers/net/virtio_net.c        |  1 +
 drivers/net/xen-netfront.c      |  1 +
 6 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/drivers/net/hyperv/netvsc_bpf.c b/drivers/net/hyperv/netvsc_bp=
f.c
index 4a9522689fa4f..55f8ca92ca199 100644
--- a/drivers/net/hyperv/netvsc_bpf.c
+++ b/drivers/net/hyperv/netvsc_bpf.c
@@ -58,6 +58,7 @@ u32 netvsc_run_xdp(struct net_device *ndev, struct netvsc=
_channel *nvchan,
=20
 	memcpy(xdp->data, data, len);
=20
+	guard(local_lock_nested_bh)(&bpf_run_lock.redirect_lock);
 	act =3D bpf_prog_run_xdp(prog, xdp);
=20
 	switch (act) {
diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
index 39171380ccf29..fbcf78477bda8 100644
--- a/drivers/net/netkit.c
+++ b/drivers/net/netkit.c
@@ -80,8 +80,15 @@ static netdev_tx_t netkit_xmit(struct sk_buff *skb, stru=
ct net_device *dev)
 	netkit_prep_forward(skb, !net_eq(dev_net(dev), dev_net(peer)));
 	skb->dev =3D peer;
 	entry =3D rcu_dereference(nk->active);
-	if (entry)
-		ret =3D netkit_run(entry, skb, ret);
+	if (entry) {
+		scoped_guard(local_lock_nested_bh, &bpf_run_lock.redirect_lock) {
+			ret =3D netkit_run(entry, skb, ret);
+			if (ret =3D=3D NETKIT_REDIRECT) {
+				dev_sw_netstats_tx_add(dev, 1, len);
+				skb_do_redirect(skb);
+			}
+		}
+	}
 	switch (ret) {
 	case NETKIT_NEXT:
 	case NETKIT_PASS:
@@ -95,8 +102,6 @@ static netdev_tx_t netkit_xmit(struct sk_buff *skb, stru=
ct net_device *dev)
 		}
 		break;
 	case NETKIT_REDIRECT:
-		dev_sw_netstats_tx_add(dev, 1, len);
-		skb_do_redirect(skb);
 		break;
 	case NETKIT_DROP:
 	default:
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index afa5497f7c35c..fe0d31f11e4b6 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1708,16 +1708,18 @@ static struct sk_buff *tun_build_skb(struct tun_str=
uct *tun,
 		xdp_init_buff(&xdp, buflen, &tfile->xdp_rxq);
 		xdp_prepare_buff(&xdp, buf, pad, len, false);
=20
-		act =3D bpf_prog_run_xdp(xdp_prog, &xdp);
-		if (act =3D=3D XDP_REDIRECT || act =3D=3D XDP_TX) {
-			get_page(alloc_frag->page);
-			alloc_frag->offset +=3D buflen;
-		}
-		err =3D tun_xdp_act(tun, xdp_prog, &xdp, act);
-		if (err < 0) {
-			if (act =3D=3D XDP_REDIRECT || act =3D=3D XDP_TX)
-				put_page(alloc_frag->page);
-			goto out;
+		scoped_guard(local_lock_nested_bh, &bpf_run_lock.redirect_lock) {
+			act =3D bpf_prog_run_xdp(xdp_prog, &xdp);
+			if (act =3D=3D XDP_REDIRECT || act =3D=3D XDP_TX) {
+				get_page(alloc_frag->page);
+				alloc_frag->offset +=3D buflen;
+			}
+			err =3D tun_xdp_act(tun, xdp_prog, &xdp, act);
+			if (err < 0) {
+				if (act =3D=3D XDP_REDIRECT || act =3D=3D XDP_TX)
+					put_page(alloc_frag->page);
+				goto out;
+			}
 		}
=20
 		if (err =3D=3D XDP_REDIRECT)
@@ -2460,8 +2462,10 @@ static int tun_xdp_one(struct tun_struct *tun,
 		xdp_init_buff(xdp, buflen, &tfile->xdp_rxq);
 		xdp_set_data_meta_invalid(xdp);
=20
-		act =3D bpf_prog_run_xdp(xdp_prog, xdp);
-		ret =3D tun_xdp_act(tun, xdp_prog, xdp, act);
+		scoped_guard(local_lock_nested_bh, &bpf_run_lock.redirect_lock) {
+			act =3D bpf_prog_run_xdp(xdp_prog, xdp);
+			ret =3D tun_xdp_act(tun, xdp_prog, xdp, act);
+		}
 		if (ret < 0) {
 			put_page(virt_to_head_page(xdp->data));
 			return ret;
diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 977861c46b1fe..c69e5ff9f8795 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -624,7 +624,18 @@ static struct xdp_frame *veth_xdp_rcv_one(struct veth_=
rq *rq,
 		xdp->rxq =3D &rq->xdp_rxq;
 		vxbuf.skb =3D NULL;
=20
-		act =3D bpf_prog_run_xdp(xdp_prog, xdp);
+		scoped_guard(local_lock_nested_bh, &bpf_run_lock.redirect_lock) {
+			act =3D bpf_prog_run_xdp(xdp_prog, xdp);
+			if (act =3D=3D XDP_REDIRECT) {
+				orig_frame =3D *frame;
+				xdp->rxq->mem =3D frame->mem;
+				if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
+					frame =3D &orig_frame;
+					stats->xdp_drops++;
+					goto err_xdp;
+				}
+			}
+		}
=20
 		switch (act) {
 		case XDP_PASS:
@@ -644,13 +655,6 @@ static struct xdp_frame *veth_xdp_rcv_one(struct veth_=
rq *rq,
 			rcu_read_unlock();
 			goto xdp_xmit;
 		case XDP_REDIRECT:
-			orig_frame =3D *frame;
-			xdp->rxq->mem =3D frame->mem;
-			if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
-				frame =3D &orig_frame;
-				stats->rx_drops++;
-				goto err_xdp;
-			}
 			stats->xdp_redirect++;
 			rcu_read_unlock();
 			goto xdp_xmit;
@@ -857,7 +861,18 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq=
 *rq,
 	orig_data =3D xdp->data;
 	orig_data_end =3D xdp->data_end;
=20
-	act =3D bpf_prog_run_xdp(xdp_prog, xdp);
+	scoped_guard(local_lock_nested_bh, &bpf_run_lock.redirect_lock) {
+		act =3D bpf_prog_run_xdp(xdp_prog, xdp);
+		if (act =3D=3D XDP_REDIRECT) {
+			veth_xdp_get(xdp);
+			consume_skb(skb);
+			xdp->rxq->mem =3D rq->xdp_mem;
+			if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
+				stats->rx_drops++;
+				goto err_xdp;
+			}
+		}
+	}
=20
 	switch (act) {
 	case XDP_PASS:
@@ -875,13 +890,6 @@ static struct sk_buff *veth_xdp_rcv_skb(struct veth_rq=
 *rq,
 		rcu_read_unlock();
 		goto xdp_xmit;
 	case XDP_REDIRECT:
-		veth_xdp_get(xdp);
-		consume_skb(skb);
-		xdp->rxq->mem =3D rq->xdp_mem;
-		if (xdp_do_redirect(rq->dev, xdp, xdp_prog)) {
-			stats->rx_drops++;
-			goto err_xdp;
-		}
 		stats->xdp_redirect++;
 		rcu_read_unlock();
 		goto xdp_xmit;
diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index d16f592c2061f..5e362c4604239 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1010,6 +1010,7 @@ static int virtnet_xdp_handler(struct bpf_prog *xdp_p=
rog, struct xdp_buff *xdp,
 	int err;
 	u32 act;
=20
+	guard(local_lock_nested_bh)(&bpf_run_lock.redirect_lock);
 	act =3D bpf_prog_run_xdp(xdp_prog, xdp);
 	u64_stats_inc(&stats->xdp_packets);
=20
diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index ad29f370034e4..e3daa8cdeb84e 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -978,6 +978,7 @@ static u32 xennet_run_xdp(struct netfront_queue *queue,=
 struct page *pdata,
 	xdp_prepare_buff(xdp, page_address(pdata), XDP_PACKET_HEADROOM,
 			 len, false);
=20
+	guard(local_lock_nested_bh)(&bpf_run_lock.redirect_lock);
 	act =3D bpf_prog_run_xdp(prog, xdp);
 	switch (act) {
 	case XDP_TX:
--=20
2.43.0


