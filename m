Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5E7CFE50
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619420.964488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8s-0008EZ-0e; Thu, 19 Oct 2023 15:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619420.964488; Thu, 19 Oct 2023 15:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8r-00081o-MZ; Thu, 19 Oct 2023 15:40:57 +0000
Received: by outflank-mailman (input) for mailman id 619420;
 Thu, 19 Oct 2023 15:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+UH=GB=desiato.srs.infradead.org=BATV+298c059cf2aa39b7dc34+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8o-0006dc-To
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:54 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ce9956-6e95-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 17:40:51 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qtV8M-009yCl-2Y; Thu, 19 Oct 2023 15:40:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8L-000Ptt-2u; Thu, 19 Oct 2023 16:40:25 +0100
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
X-Inumbo-ID: e1ce9956-6e95-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hy2YuY0dWcf+Lr7etZHB++T3clcBvefTeZ93BBNCjCM=; b=DmYBdYN03plLfc9Z3a7Lig0nJS
	chnqFUJQtb1XZqAyZrsfM2mUTXC5PcfxZrq5zSrXl+lX6RKF4oHzTono8UUQK3c+YMIa+HnC3lfci
	wi9+B/rKkt09RsCvw0Bu21ZQJVXPp1+W6r8Xh5psyRFJoQDLcdlq3DSdw70ihNk9cHBPAwUgU/Zjs
	e4i22xctxwNK/haxM82vmxAcPxHGGy6RtaK2LO8sEocYde64fM423I6YsWQbsO02lH649k3cjpvNQ
	vM+kXLeT+o3P2w7JAyJ0oxgD/5bFr7LDzuaxudCx9YNoV3lkbsgasNcMGA5qD3B5CZtpS5Ov/GrXi
	oCWeFxiA==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v2 04/24] hw/xen: don't clear map_track[] in xen_gnttab_reset()
Date: Thu, 19 Oct 2023 16:40:00 +0100
Message-Id: <20231019154020.99080-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The refcounts actually correspond to 'active_ref' structures stored in a
GHashTable per "user" on the backend side (mostly, per XenDevice).

If we zero map_track[] on reset, then when the backend drivers get torn
down and release their mapping we hit the assert(s->map_track[ref] != 0)
in gnt_unref().

So leave them in place. Each backend driver will disconnect and reconnect
as the guest comes back up again and reconnects, and it all works out OK
in the end as the old refs get dropped.

Fixes: de26b2619789 ("hw/xen: Implement soft reset for emulated gnttab")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_gnttab.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 21c30e3659..839ec920a1 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -541,7 +541,5 @@ int xen_gnttab_reset(void)
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].flags = GTF_permit_access;
     s->entries.v1[GNTTAB_RESERVED_XENSTORE].frame = XEN_SPECIAL_PFN(XENSTORE);
 
-    memset(s->map_track, 0, s->max_frames * ENTRIES_PER_FRAME_V1);
-
     return 0;
 }
-- 
2.40.1


