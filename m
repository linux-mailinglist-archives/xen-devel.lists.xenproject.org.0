Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264207CFE4C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619414.964443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8o-0007BN-7Y; Thu, 19 Oct 2023 15:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619414.964443; Thu, 19 Oct 2023 15:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtV8o-0007A5-2X; Thu, 19 Oct 2023 15:40:54 +0000
Received: by outflank-mailman (input) for mailman id 619414;
 Thu, 19 Oct 2023 15:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8m-0005v1-7J
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:40:52 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0bd07f6-6e95-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 17:40:49 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtV8M-007osh-9t; Thu, 19 Oct 2023 15:40:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8L-000Pty-36; Thu, 19 Oct 2023 16:40:25 +0100
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
X-Inumbo-ID: e0bd07f6-6e95-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=hLazHzQr9WU4aKDL3e0cHQ8ZFMzJwP9pBwOEG+7+DoA=; b=mZVHuHGu2yiNHmYQ6lAmxyEZjN
	e6NSylNjif4ob9D4TnTQeVnUE1lTePYhEsdCI7J46anemdWJCMzjBGU6ztQsfxcdTtlyQER8zRAze
	sar13P2OM77RUpnRMfNomAGWXl77C3jfsJp+nY6jQeLnkhjLNP3Ey6o5ZGnxbcOnVTPrOyQMvyh6T
	icRvk0TzuJG1NIKoOMC1qdQLWJGsko7VHDIPJlICHOsG9ds8BfY7FtUgZwd0noA9uaOhkrfYLU7KL
	uyx63lcS6ETtZjPM4GkmV5/0HG4jDqF3shYhUhWy4stZZ7T/33VQ0O7W0wJg46U63S8BjjpCZMzZD
	qY8yAUEA==;
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
Subject: [PATCH v2 05/24] hw/xen: fix XenStore watch delivery to guest
Date: Thu, 19 Oct 2023 16:40:01 +0100
Message-Id: <20231019154020.99080-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When fire_watch_cb() found the response buffer empty, it would call
deliver_watch() to generate the XS_WATCH_EVENT message in the response
buffer and send an event channel notification to the guest… without
actually *copying* the response buffer into the ring. So there was
nothing for the guest to see. The pending response didn't actually get
processed into the ring until the guest next triggered some activity
from its side.

Add the missing call to put_rsp().

It might have been slightly nicer to call xen_xenstore_event() here,
which would *almost* have worked. Except for the fact that it calls
xen_be_evtchn_pending() to check that it really does have an event
pending (and clear the eventfd for next time). And under Xen it's
defined that setting that fd to O_NONBLOCK isn't guaranteed to work,
so the emu implementation follows suit.

This fixes Xen device hot-unplug.

Fixes: 0254c4d19df ("hw/xen: Add xenstore wire implementation and implementation stubs")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_xenstore.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/kvm/xen_xenstore.c b/hw/i386/kvm/xen_xenstore.c
index 660d0b72f9..82a215058a 100644
--- a/hw/i386/kvm/xen_xenstore.c
+++ b/hw/i386/kvm/xen_xenstore.c
@@ -1357,10 +1357,12 @@ static void fire_watch_cb(void *opaque, const char *path, const char *token)
     } else {
         deliver_watch(s, path, token);
         /*
-         * If the message was queued because there was already ring activity,
-         * no need to wake the guest. But if not, we need to send the evtchn.
+         * Attempt to queue the message into the actual ring, and send
+         * the event channel notification if any bytes are copied.
          */
-        xen_be_evtchn_notify(s->eh, s->be_port);
+        if (put_rsp(s) > 0) {
+            xen_be_evtchn_notify(s->eh, s->be_port);
+        }
     }
 }
 
-- 
2.40.1


