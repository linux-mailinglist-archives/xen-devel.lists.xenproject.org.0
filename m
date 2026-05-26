Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP4ZGQ6XFWqPWgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:50:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CE5D5C9E
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319877.1587327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrEU-0000xA-DB; Tue, 26 May 2026 12:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319877.1587327; Tue, 26 May 2026 12:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrEU-0000vF-8t; Tue, 26 May 2026 12:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1319877;
 Tue, 26 May 2026 12:48:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cassiogabrielcontato@gmail.com>) id 1wRrDA-0008Ou-E4
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRrD9-000tzp-Qh
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:48:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cassiogabrielcontato@gmail.com>)
 id 6a1596a7-5cb7-0a2a0a5109dd-0a2a4502bdc0-12
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:48:43 +0200
Received: from [74.125.82.174] (helo=mail-dy1-f174.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <cassiogabrielcontato@gmail.com>)
 id 6a1596aa-af86-0a2a45020019-4a7d52aed41b-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:48:43 +0200
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-304545f5206so5558143eec.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 05:48:43 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br.
 [177.4.162.74]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20561sm9516837eec.10.2026.05.26.05.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 05:48:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799721; x=1780404521; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SeoXPiG4SB9SK2Lj+OOHLE9VbLHbVVD8iNOr5ymQzc=;
        b=RgNHZKAlsycS/KrzpegYW25P88m2WKUNAMeqWM9Rtq14myAw3o4uVAUgmsUsi22UTJ
         G0C+MW02bb66vrbPxmRCJY0ygXSZmkBwjx2XUHnt6hGrTRM6KlQYFfl7xuuCby63pESM
         cSeUp03GYoDL/AMpuJVQhkEHzQmcZ8tGARuP2DerLotU/3wMAOJR6S91kJFtsLeI9XVq
         LfKwPSDeroaEETwx/FWWFC/9x2fycveDCCw4Oi/CL+zI2/HeJhCATIhPS7FaHCUznz+n
         DhW2RBnSVpEfVQHuhIkIlyJyzKpq60tYDVEH4zwJxpkRM3/Wk5P9od8nAYOqZIJSEEPZ
         nGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799721; x=1780404521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SeoXPiG4SB9SK2Lj+OOHLE9VbLHbVVD8iNOr5ymQzc=;
        b=IZQcR7YtdpAXFd5vL3k14LQNwUqgPzX/bV8VukmDMJwkmtvIKmMaUchJOCGgYGdZlN
         l8yWY+MzPDgRD5GkmLqzfdbqzsQAz61od/SDXeDLpUy1FtusEgoYLUaKKa6bUhG48ZHs
         nWNFFs11BqM86eoi9439a1NhV1Ha4UBuOufm69KG5YU29q0T5Lw7k2SGjrxatZAlMiCq
         r9xSgipChMQDPEx4IZIpD8qVZnZUBAhCLQzlvJkQJiS3mzOGpmGNDlgWHj4609W1ivd6
         dsuWlGBqNEneu2k4jGtpW+dEeTeKMvbXejCJE8agks9jSfpbQd3CZWVIQPG1hXPDHXUP
         AqIA==
X-Gm-Message-State: AOJu0YxxNxvvyvVdzykg8f0z8nYdBe2SPjLfNegv0NrqhBUBGeCxJPwc
	Dr0yhKY6f2G7rGkmJJvLoWiCvrB5KaVCTbqqt7xHuKz0//LYSsOqVRv3
X-Gm-Gg: Acq92OEpYxnwwuOFAZUgZXtzmRb1413M1e8DMJdZm4D5J5AE9xpMBgqHAhgMSJFXKE0
	NWgfEULgG018FGExK32ACA34VqKb2uYw8Fcpbr/UWwC5xzQM/Jp1bfEHKmZpz4Ti4ajn9jPDkdL
	yMkslkN/U6i2CdefmaUB0HtR4rDAjK9e1VH6iwLyd9wxydkUvDnRNRiQfWBJqrE/uQZxSP9abuj
	Gtyd4GqTZnSBhtLA/QxzYa8lmlPzHLcMk88lggIcR/WvCBGTMmQR3rze32y/OV56aVP7fWJClda
	U3rajcZVIQJ0c1GpOBr4IKhZVFSn3QNeXwEoLfiYHAomF/1w2V02Q88JPGKOYsbQRnFn358syV7
	6gsUzs6PAWs0jndeDwkNMqUA/0GEoegprgNLtFXum+pQsaeqklg9acwjiKjniubUIeEh/bjPYDs
	5ohDAGWZbKHkIJ4A+t7eBRA8YVKeYhMlwYbRJsXS/PB+5Ae80X/2mjYD6ptd/y6hdR23pRKcT/F
	sP3SmovL58W
X-Received: by 2002:a05:7300:fd10:b0:2de:1508:937c with SMTP id 5a478bee46e88-3044912be04mr7816259eec.24.1779799721346;
        Tue, 26 May 2026 05:48:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 26 May 2026 09:48:26 -0300
Subject: [PATCH 1/2] ALSA: xen-front: Reset event channel state on stream
 clear
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-alsa-xen-event-channel-fixes-v1-1-91d3a6a50778@gmail.com>
References: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
In-Reply-To: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2435;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WzcH2Sbtw60mkU1iRWe1iTMpo9hq4D+yg6klUsKkNfY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmi0xY/773+TatxsuO3sLm1k80P1AktaOgPtVqpe93SL
 eevisy9jlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZgIjxLD/7pC83C/jANS+Xu1
 xTxfdK10nmlr/Ov2wbwHxwVTts6d1sLIcP1OeqHlcb0O3c5kV4NmDnstqS6+sNPxc8qOzU5VN0r
 mAgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-purgate-ID: tlsNG-720697/1779799723-A857B161-9CC8DDE0/0/0
X-purgate-type: clean
X-purgate-size: 2437
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.com,m:oleksandr_andrushchenko@epam.com,m:perex@perex.cz,m:xen-devel@lists.xenproject.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cassiogabrielcontato@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cassiogabrielcontato@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 178CE5D5C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

xen_snd_front_evtchnl_pair_clear() resets evt_next_id for both
channels. That is correct for the request channel, where evt_next_id is
used to allocate the next request id. It is wrong for the event channel:
incoming events are validated against evt_id, and evt_id is incremented
by evtchnl_interrupt_evt().

This leaves the expected event id from the previous stream instance. A
backend that restarts event ids for a reopened stream can then have valid
current-position events dropped until the stale frontend id catches up.

Reset evt_id for the event channel. Also advance the event-page consumer
to the current producer while clearing the stream, so obsolete events
queued for the previous stream instance are not delivered to the next
ALSA runtime.

Fixes: 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/xen/xen_snd_front_evtchnl.c | 8 ++++++--
 sound/xen/xen_snd_front_evtchnl.h | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index bc03f71bf16e..09e4c1d05636 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -456,7 +456,11 @@ void xen_snd_front_evtchnl_pair_clear(struct xen_snd_front_evtchnl_pair *evt_pai
 	}
 
 	scoped_guard(mutex, &evt_pair->evt.ring_io_lock) {
-		evt_pair->evt.evt_next_id = 0;
+		evt_pair->evt.evt_id = 0;
+		/* Drop obsolete events queued for the previous stream instance. */
+		evt_pair->evt.u.evt.page->in_cons =
+			evt_pair->evt.u.evt.page->in_prod;
+		/* Ensure the consumer index is visible before stream reuse. */
+		virt_wmb();
 	}
 }
-
diff --git a/sound/xen/xen_snd_front_evtchnl.h b/sound/xen/xen_snd_front_evtchnl.h
index 3675fba70564..8400261ac466 100644
--- a/sound/xen/xen_snd_front_evtchnl.h
+++ b/sound/xen/xen_snd_front_evtchnl.h
@@ -37,9 +37,9 @@ struct xen_snd_front_evtchnl {
 	/* State of the event channel. */
 	enum xen_snd_front_evtchnl_state state;
 	enum xen_snd_front_evtchnl_type type;
-	/* Either response id or incoming event id. */
+	/* Current response id or next expected incoming event id. */
 	u16 evt_id;
-	/* Next request id or next expected event id. */
+	/* Next request id. */
 	u16 evt_next_id;
 	/* Shared ring access lock. */
 	struct mutex ring_io_lock;

-- 
2.54.0


