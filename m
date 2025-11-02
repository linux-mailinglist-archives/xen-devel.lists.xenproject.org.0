Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797CC2898F
	for <lists+xen-devel@lfdr.de>; Sun, 02 Nov 2025 04:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155138.1484701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFOfE-0007l7-63; Sun, 02 Nov 2025 03:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155138.1484701; Sun, 02 Nov 2025 03:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFOfE-0007jj-3O; Sun, 02 Nov 2025 03:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1155138;
 Sun, 02 Nov 2025 03:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LVbI=5K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vFOfC-0007jb-Ky
 for xen-devel@lists.xenproject.org; Sun, 02 Nov 2025 03:21:54 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 136fb0ff-b79b-11f0-9d16-b5c5bf9af7f9;
 Sun, 02 Nov 2025 04:21:53 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 1430CEC018D;
 Sat,  1 Nov 2025 23:21:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Sat, 01 Nov 2025 23:21:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Nov 2025 23:21:49 -0400 (EDT)
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
X-Inumbo-ID: 136fb0ff-b79b-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1762053712; x=1762140112; bh=7hp+3CUJGKWZLD+hs/ZP9jRp9wO3QWsC
	LcVGR4MJGqI=; b=Acxal4bIYVnPZ4U9m9xz1ww8MwlHQ7U2OfaYK0UOczkpcnlp
	9WXoMQlkR/3+2NU1/4JUxeVB/BYKeyfFfTGCnQb/CzpSz+HKHCyweChjy2GOEQQm
	Lq6tiEQudElM6ur0bEP12/VGvH0cIT3Q/WVns5bfMIznVPJZBFvDTkOlvGWzPRq+
	1OUqYOS59vaAYKKTPO5u6LN3lUSo8yLKjVxuPRCJQ19+o4+nckvx800EON50P/gY
	78C0N0aKYscPXkz9FtXgyz1vbqHTCB2Nrxu9WTNGGwD+c+7yqB2n6B5G0NLGPUpR
	7tpmjIXE0UHExak2soe/zyqQ9PSoDs+XGCo5Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762053712; x=1762140112; bh=7hp+3CUJGKWZLD+hs/ZP9jRp9wO3
	QWsCLcVGR4MJGqI=; b=qIRZnWUxNNmXVVXbT2dQc2bM3+01aSp0RMwjv7xqfCge
	sydge9N73VuOktpifnHYH/Mg3lpXbB0Bvd21BOSo1aMV4SWZJ5kR48zipRRtG1nE
	AfSN3LMO0curC3EdmS9+qhPzTT9AvbgFzP9pGo6v8oh2DVZBI154t4wmWqQPYo7F
	qoMWHM7mXvl5qWO8wYfLHvrj9tGPbcBwsrUb4BH/EQrSqFjyn0fnK+d+abmj6ZQJ
	txugkoJXZgB7fkS5fwycxKU761ubmEVz1SJEi8aKkZnisJHFIJaRj+X1hNsvxK+p
	yIr3iXOtiUm2BOnKxZ/vLdTi3e+qi5wsyeudX0iwZA==
X-ME-Sender: <xms:T84GaQaERxFIcHrqT_-je8u5rmmiy_Wbo0MKH_et94WqwvNWdSlv-g>
    <xme:T84Gab1QOpeX6or8XcoTcotSUwAfEarLALzBjbeFjaejUZddSNMAvj9jfN8sl7VmP
    k5skdLIqbj0GiU8mG_27dj3kjKLFf7Ee6bOrYupBu-B329ffg>
X-ME-Received: <xmr:T84GaboqoeW5hDCQAcjBsLzZBiEyMT4D4OGmvPTVQEHlHHzZVLBfFPbTlaXLS6PGWyRofqnwrQD4rG6uuJkXotKvnum3RjishOKjv72KoTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeegudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeeiveek
    ueehfeegveejveevuedtjeeiveeguefhvdffueetfedtuddvueetveenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdp
    rhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepshhsthgrsg
    gvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgp
    thihshhhtghhvghnkhhosegvphgrmhdrtghomhdprhgtphhtthhopehjihgrnhhgrdhpvg
    hnghelseiithgvrdgtohhmrdgtnhdprhgtphhtthhopegthhgvnhhqihhujhhiieeiiees
    ghhmrghilhdrtghomhdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurd
    gtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgv
    tghtrdhorhhg
X-ME-Proxy: <xmx:T84GaSM0Rrntpe2dpe1DelGU6fxM69KeMa2CMQMVAruIQHJzpLw5Pw>
    <xmx:T84GacrdpdOFpJ_2MOqtxUogwmJCCMKY7CHFDycssv3dc1ghJSw8tw>
    <xmx:T84GaVvsj_U_IiHKkM1DkZ3lW-MAjvXErrMrNPKCo3PO8DsThC7W2w>
    <xmx:T84Gab08owYKCtGPDFJTNuKooxcK2BmWoPjzEJ-lxfWZIRTVTUUeLw>
    <xmx:UM4GadWWm080WdXiZ630qOlPi_dAm9aP9avnDEi9X7Ez8P2_mNpwFqOB>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Peng Jiang <jiang.peng9@zte.com.cn>,
	Qiu-ji Chen <chenqiuji666@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
Subject: [PATCH] xen/xenbus: better handle backend crash
Date: Sun,  2 Nov 2025 04:20:12 +0100
Message-ID: <20251102032105.772670-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the backend domain crashes, coordinated device cleanup is not
possible (as it involves waiting for the backend state change). In that
case, toolstack forcefully removes frontend xenstore entries.
xenbus_dev_changed() handles this case, and triggers device cleanup.
It's possible that toolstack manages to connect new device in that
place, before xenbus_dev_changed() notices the old one is missing. If
that happens, new one won't be probed and will forever remain in
XenbusStateInitialising.

Fix this by checking backend-id and if it changes, consider it
unplug+plug operation. It's important that cleanup on such unplug
doesn't modify xenstore entries (especially the "state" key) as it
belong to the new device to be probed - changing it would derail
establishing connection to the new backend (most likely, closing the
device before it was even connected). Handle this case by setting new
xenbus_device->vanished flag to true, and check it before changing state
entry.

And even if xenbus_dev_changed() correctly detects the device was
forcefully removed, the cleanup handling is still racy. Since this whole
handling doesn't happend in a single xenstore transaction, it's possible
that toolstack might put a new device there already. Avoid re-creating
the state key (which in the case of loosing the race would actually
close newly attached device).

The problem does not apply to frontend domain crash, as this case
involves coordinated cleanup.

Problem originally reported at
https://lore.kernel.org/xen-devel/aOZvivyZ9YhVWDLN@mail-itl/T/#t,
including reproduction steps.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I considered re-using one of existing fields instead of a new
xenbus_device->vanished, but I wasn't sure if that would work better.
Setting xenbus_device->nodename to NULL would prevent few other places
using it (including some log messages). Setting xenbus_device->otherend
might have less unintentional impact, but logically it doesn't feel
correct.

With this patch applied, I cannot reproduce the issue anymore - neither
with the simplified reproducer script, nor with the full test suite.
---
 drivers/xen/xenbus/xenbus_client.c |  2 ++
 drivers/xen/xenbus/xenbus_probe.c  | 25 +++++++++++++++++++++++++
 include/xen/xenbus.h               |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index e73ec225d4a61..ce2f49d9aa4ad 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -275,6 +275,8 @@ __xenbus_switch_state(struct xenbus_device *dev,
  */
 int xenbus_switch_state(struct xenbus_device *dev, enum xenbus_state state)
 {
+	if (dev->vanished)
+		return 0;
 	return __xenbus_switch_state(dev, state, 0);
 }
 
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 86fe6e7790566..3c3e56b544976 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -444,6 +444,9 @@ static void xenbus_cleanup_devices(const char *path, struct bus_type *bus)
 		info.dev = NULL;
 		bus_for_each_dev(bus, NULL, &info, cleanup_dev);
 		if (info.dev) {
+			dev_warn(&info.dev->dev,
+			         "device forcefully removed from xenstore\n");
+			info.dev->vanished = true;
 			device_unregister(&info.dev->dev);
 			put_device(&info.dev->dev);
 		}
@@ -659,6 +662,28 @@ void xenbus_dev_changed(const char *node, struct xen_bus_type *bus)
 		return;
 
 	dev = xenbus_device_find(root, &bus->bus);
+	/* Backend domain crash results in not coordinated frontend removal,
+	 * without going through XenbusStateClosing. Check if the device
+	 * wasn't replaced to point at another backend in the meantime.
+	 */
+	if (dev && !strncmp(node, "device/", sizeof("device/")-1)) {
+		int backend_id;
+		int err = xenbus_gather(XBT_NIL, root,
+				        "backend-id", "%i", &backend_id,
+					NULL);
+		if (!err && backend_id != dev->otherend_id) {
+			/* It isn't the same device, assume the old one
+			 * vanished and new one needs to be probed.
+			 */
+			dev_warn(&dev->dev,
+				 "backend-id mismatch (%d != %d), reconnecting\n",
+				 backend_id, dev->otherend_id);
+			dev->vanished = true;
+			device_unregister(&dev->dev);
+			put_device(&dev->dev);
+			dev = NULL;
+		}
+	}
 	if (!dev)
 		xenbus_probe_node(bus, type, root);
 	else
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 7dab04cf4a36c..43a5335f1d5a3 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -87,6 +87,7 @@ struct xenbus_device {
 	struct completion down;
 	struct work_struct work;
 	struct semaphore reclaim_sem;
+	bool vanished;
 
 	/* Event channel based statistics and settings. */
 	atomic_t event_channels;
-- 
2.51.0


