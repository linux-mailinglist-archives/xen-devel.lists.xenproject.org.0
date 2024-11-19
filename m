Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B19D2FF3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 22:18:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840779.1256307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDVbS-0002h2-2x; Tue, 19 Nov 2024 21:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840779.1256307; Tue, 19 Nov 2024 21:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDVbS-0002eZ-0D; Tue, 19 Nov 2024 21:17:42 +0000
Received: by outflank-mailman (input) for mailman id 840779;
 Tue, 19 Nov 2024 21:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CE/=SO=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1tDVag-0002dS-Az
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 21:16:54 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96a7baaa-a6bb-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 22:16:49 +0100 (CET)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6d382677c92so26448716d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 13:16:49 -0800 (PST)
Received: from ip-172-31-19-182.us-east-2.compute.internal
 (ec2-18-219-201-45.us-east-2.compute.amazonaws.com. [18.219.201.45])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d4380db2edsm865966d6.36.2024.11.19.13.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 13:16:47 -0800 (PST)
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
X-Inumbo-ID: 96a7baaa-a6bb-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpmMzMiLCJoZWxvIjoibWFpbC1xdjEteGYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk2YTdiYWFhLWE2YmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDUxMDA5LjU1NDE0Niwic2VuZGVyIjoiYWxleGFuZGVyQGVkZXJhLmRldiIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1732051008; x=1732655808; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg7OcnGXpKtgXWaHwtGS+ToZC8TTTiMcCPq5ZYxyLCo=;
        b=MCdyx9uTe5jSoJ1q9u0wq1q/XWvpfWXzLTChrklTLJuvniTV55EFMJoxSGggzTYhBd
         oeY8TBAmu19v0zmjHeQY7Yp1qY67iiLLWSuFL+mProY7MmkySEeIzsxbFOazyuVodvgV
         mb9OT3H7FXV07+aZQcsWfOZ0CVtndPYcg4YHtjb0clB097Wd5bNNEdkf1crqKVDuTwmW
         HZiJHYFbbw7mnKuvQfWt6ODO11WHvIJC7ecw1XhOKsTrpsJGlKDMAZ5srfvVpM0gWN1M
         QShQOfKVSy071PxVpToRx+vSzfPboBS96+fvqT0cBif/2ltBGOcaOpcZgafzVbpct9Ko
         zi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732051008; x=1732655808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eg7OcnGXpKtgXWaHwtGS+ToZC8TTTiMcCPq5ZYxyLCo=;
        b=UNfeRwxzTX5hvkXmLPmXYiOh5AHW2SXnBEHXcguV2X2jfHDw0y0QBs8DfkFNQJ94zI
         zV8rtMcJ1v82UuV8EvBbumMycYRIb0IunV3uGGn2LzLRHoAgCcBpcYlAJJRIl08/RmKH
         2OF6n6SW1jXxIpwFHmMhdzh/5cq4hpDqhoODNzi/6ZDjRTzBKbFR5d395ZHr39qmIIG8
         S1DtY0R3hUB93zesIYNkwrUCse40hd4kezZWoJBfe1Wg4PSu4ZsFpU7kHmR1xH9QNRvs
         BDhpPsFyssZ2ohALobTu/KsDM1CFflA9I80eg2AZL2pcZLZJaYkF+L92uS7+DZsqHAJ4
         5uHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVGp7nggq5tCOn536VG1KCzv3d5X01t+egptN1bvbr0j2pEDTdUv6aXXeQZYY5V4s9LEQ2eSFs22A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYyzQDcCcL8p7qMFffDUcb1LPsyUXG2Bidnb1zHyH4+3lRfRT2
	9zCFyAJPGhJPjRwXusXcbNoJslsIrlys4WeO10zLaMdF9lYixAWn4xDlZH3RD98=
X-Google-Smtp-Source: AGHT+IHB3u2/l2rZG0k9ZOUXZliIL+D2FSwQjxK7a12SP+D4OKLAIj7VApFTPwlDLTNgD+mrpxyQ9A==
X-Received: by 2002:a05:6214:5004:b0:6d4:2778:ecb6 with SMTP id 6a1803df08f44-6d4377a118bmr7865406d6.18.1732051008401;
        Tue, 19 Nov 2024 13:16:48 -0800 (PST)
From: Alexander Merritt <alexander@edera.dev>
To: v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Simon Horman <horms@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Alex Zenla <alex@edera.dev>,
	Alexander Merritt <alexander@edera.dev>,
	Ariadne Conill <ariadne@ariadne.space>
Subject: [PATCH] 9p/xen: fix init sequence
Date: Tue, 19 Nov 2024 21:16:33 +0000
Message-ID: <20241119211633.38321-1-alexander@edera.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Zenla <alex@edera.dev>

Large amount of mount hangs observed during hotplugging of 9pfs devices. The
9pfs Xen driver attempts to initialize itself more than once, causing the
frontend and backend to disagree: the backend listens on a channel that the
frontend does not send on, resulting in stalled processing.

Only allow initialization of 9p frontend once.

Fixes: c15fe55d14b3b ("9p/xen: fix connection sequence")
Signed-off-by: Alex Zenla <alex@edera.dev>
Signed-off-by: Alexander Merritt <alexander@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 net/9p/trans_xen.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index dfdbe1ca5338..0304e8a1616d 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -465,6 +465,7 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 		goto error;
 	}
 
+	xenbus_switch_state(dev, XenbusStateInitialised);
 	return 0;
 
  error_xenbus:
@@ -512,8 +513,10 @@ static void xen_9pfs_front_changed(struct xenbus_device *dev,
 		break;
 
 	case XenbusStateInitWait:
-		if (!xen_9pfs_front_init(dev))
-			xenbus_switch_state(dev, XenbusStateInitialised);
+		if (dev->state != XenbusStateInitialising)
+			break;
+
+		xen_9pfs_front_init(dev);
 		break;
 
 	case XenbusStateConnected:
-- 
2.43.0


