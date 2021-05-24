Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B038F48B
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131941.246373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHPu-0000JI-4S; Mon, 24 May 2021 20:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131941.246373; Mon, 24 May 2021 20:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHPt-0000Gj-VW; Mon, 24 May 2021 20:43:13 +0000
Received: by outflank-mailman (input) for mailman id 131941;
 Mon, 24 May 2021 20:43:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHLU-0001ey-TW
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:40 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27c6af09-440c-442f-9373-fb53e860d068;
 Mon, 24 May 2021 20:37:52 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id h20so12792625qko.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:52 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:51 -0700 (PDT)
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
X-Inumbo-ID: 27c6af09-440c-442f-9373-fb53e860d068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=qZQxVcviBuvDjUeKOepu8YHqa+eGuG2DXDt5FNQL7LQ=;
        b=G+pyi2ApCHcfc8UBweruANC8e0cOXX1CT03CKkAiDQRJHE7Klfn/pOpBYStmWWcyA4
         AaYspo8J8GV+nlWKzUOviIvEb+K/L3KaHitNBCX35AfW8kdilbhDTj2Ih+mtyOfGM8Yr
         F6nBzUQijOg+DmNcRbgoOg96MmWJ0EdBHAWkGpHLkVJTUYcMR6XCap7KSN2lpvXCeSkh
         I2wZq1GZ/PRiZQNe4/3wLXlfK7NgQOSFqaxwGopBrV+57r0/qvF4ZpsUEW+By46BlXxT
         dAIWqnDwKUkL/ZBMot4k6a94qk4V1uIM83QIstPfIjkNVGN8MYd8rASPEAQCNcKJUt1r
         LxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=qZQxVcviBuvDjUeKOepu8YHqa+eGuG2DXDt5FNQL7LQ=;
        b=lGYwDTmUVlw67BsPd9DybsYtrfI6U/n3xuFEsVsk5K9vgCoakI2stb8Zm/MFLnumYm
         qoeC0Y3y2SYn0tOGLNGvH/cPAuDVZF28ahnow891HhbK9nugTbT0CDtqKZhQPnWO4QlV
         Vk3O4ZKi9cJCqiEyr0nmLbCyj2ZOeInqegJriE+zK+0CYuTVnjFCh4eJXrxK8DiRCari
         HWyt0NnmXfY/PQYc+OItG3qB+EnULSAwqsZ5w0NdLsF3sC1Zj9AwUg0P9cLACjy+UyY8
         onHXzo2N/OFIIVLUbXiiEVzHMvBz5uZ3tmWBw5ehtMtoYhU2vBGDZhmbulH2NrlHvd2U
         +q7w==
X-Gm-Message-State: AOAM533EWehlpskrWWNCsvTzncjw+JjY+PlmMJzT7x04PvccDBnprQjq
	9cCJJfTewej3h3xTVVhPtu4=
X-Google-Smtp-Source: ABdhPJxK46rUoHOq90Ayw4jb8Va6QGKRHd2hRegjODp3MiUcX7+YcJZ+SyslYYQ7cj5J7aomMpbqPw==
X-Received: by 2002:a05:620a:1252:: with SMTP id a18mr30362134qkl.416.1621888672226;
        Mon, 24 May 2021 13:37:52 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 12/12] golang/xenlight: add NotifyDomainDeath method to Context
Date: Mon, 24 May 2021 16:36:53 -0400
Message-Id: <e415b0e26954cfc6689fbd3ba7d79fe664f3bb50.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

Add a helper function to wait for domain death events, and then write
the events to a provided channel. This handles the enabling/disabling of
the event type, freeing the event, and converting it to a Go type. The
caller can then handle the event however they need to. This function
will run until a provided context.Context is cancelled.

NotifyDomainDeath spawns two goroutines that return when the
context.Context is done. The first will make sure that the domain death
event is disabled, and that the corresponding event queue is cleared.
The second calls libxl_event_wait, and writes the event to the provided
channel.

With this, callers should be able to manage a full domain life cycle.
Add to the comment of DomainCreateNew so that package uses know they
should use this method in conjunction with DomainCreateNew.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 83 ++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 6fb22665cc..8406883433 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -53,6 +53,7 @@ import "C"
  */
 
 import (
+	"context"
 	"fmt"
 	"os"
 	"os/signal"
@@ -1340,7 +1341,9 @@ func (ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error
 	return nil
 }
 
-// DomainCreateNew creates a new domain.
+// DomainCreateNew creates a new domain. Callers of DomainCreateNew are
+// responsible for handling the death of the resulting domain. This should be
+// done using NotifyDomainDeath.
 func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 	var cdomid C.uint32_t
 	var cconfig C.libxl_domain_config
@@ -1358,6 +1361,84 @@ func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 	return Domid(cdomid), nil
 }
 
+// NotifyDomainDeath registers an event handler for domain death events for a
+// given domnid, and writes events received to ec. NotifyDomainDeath returns an
+// error if it cannot register the event handler, but other errors encountered
+// are just logged. The goroutine spawned by calling NotifyDomainDeath runs
+// until the provided context.Context's Done channel is closed.
+func (ctx *Context) NotifyDomainDeath(c context.Context, domid Domid, ec chan<- Event) error {
+	var deathw *C.libxl_evgen_domain_death
+
+	ret := C.libxl_evenable_domain_death(ctx.ctx, C.uint32_t(domid), 0, &deathw)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	// Spawn a goroutine that is responsible for cleaning up when the
+	// passed context.Context's Done channel is closed.
+	go func() {
+		<-c.Done()
+
+		ctx.logd("cleaning up domain death event handler for domain %d", domid)
+
+		// Disable the event generation.
+		C.libxl_evdisable_domain_death(ctx.ctx, deathw)
+
+		// Make sure any events that were generated get cleaned up so they
+		// do not linger in the libxl event queue.
+		var evc *C.libxl_event
+		for {
+			ret := C.libxl_event_check(ctx.ctx, &evc, C.LIBXL_EVENTMASK_ALL, nil, nil)
+			if ret != 0 {
+				return
+			}
+			C.libxl_event_free(ctx.ctx, evc)
+		}
+	}()
+
+	go func() {
+		var (
+			ev  Event
+			evc *C.libxl_event
+		)
+
+		for {
+			select {
+			case <-c.Done():
+				return
+			default:
+				// Go on and check for an event...
+			}
+
+			ret := C.libxl_event_wait(ctx.ctx, &evc, C.LIBXL_EVENTMASK_ALL, nil, nil)
+			if ret != 0 {
+				ctx.logw("unexpected error waiting for event: %s", Error(ret))
+				continue
+			}
+
+			// Try to convert the event to Go, and then free the
+			// C.libxl_event no matter what.
+			err := ev.fromC(evc)
+			C.libxl_event_free(ctx.ctx, evc)
+			if err != nil {
+				ctx.logw("error converting event from C: %v", err)
+				continue
+			}
+
+			ctx.logd("received domain death event (domid=%v, type=%v)", ev.Domid, ev.Type)
+
+			// Write the event to the channel
+			select {
+			case ec <- ev:
+			case <-c.Done():
+				return
+			}
+		}
+	}()
+
+	return nil
+}
+
 // DomainDestroy destroys a domain given a domid.
 func (ctx *Context) DomainDestroy(domid Domid) error {
 	ret := C.libxl_domain_destroy(ctx.ctx, C.uint32_t(domid), nil)
-- 
2.17.1


