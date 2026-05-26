Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBrqKQuXFWqNWgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:50:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD85D5C8D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319879.1587332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrEU-00011J-Ms; Tue, 26 May 2026 12:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319879.1587332; Tue, 26 May 2026 12:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrEU-0000xL-HJ; Tue, 26 May 2026 12:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1319879;
 Tue, 26 May 2026 12:48:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cassiogabrielcontato@gmail.com>) id 1wRrDD-0008PP-3V
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:48:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRrDC-00Agmw-Fd
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:48:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cassiogabrielcontato@gmail.com>)
 id 6a15969c-e002-0a2a0a5209dd-0a2a450cc9f2-42
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:48:46 +0200
Received: from [74.125.82.180] (helo=mail-dy1-f180.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <cassiogabrielcontato@gmail.com>)
 id 6a1596ac-62f1-0a2a450c0019-4a7d52b4b5f4-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:48:46 +0200
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-3025d725a05so24371879eec.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 05:48:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br.
 [177.4.162.74]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20561sm9516837eec.10.2026.05.26.05.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 05:48:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779799724; x=1780404524; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzFzYUS5xkTaeTcSd6mKOHfBy/NkiDE68cAiMBc0jmA=;
        b=MkSxzFayEtZDD1ikZLyWWPy6mpdAeUZWiiSNvnNrQoH0bliW+HKCR6YR38hT3qzb+2
         LA4TzoCLwQrTwUVek1N+ovzIPGPLry7mAHevs4sIoZPGEOP8jUomWfCAUMbUsz3uCF3A
         zswl431J/Z+f+nqr4R5ppU6aJbANxIBULhnlc/q7T4nVQe3IJvnTXzfbXPxFmfAv/ER3
         TH0P9CmDgqpKeRC6v/WPiQnLbH+GswWNJkzrRCOUHfJNSwS1U752VnduFL9Icf4iTJgb
         qZt7b2viyEd1OcCL5AdDXiPR++J8GRqZg5Sa19xdkmlm/tMvZoJKFyJlUu9SX/2lq6e1
         47ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799724; x=1780404524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzFzYUS5xkTaeTcSd6mKOHfBy/NkiDE68cAiMBc0jmA=;
        b=L+inZHai61QHK+m8INAYb+JogDA4SyBSwXpVEPGHE935grjfkLu4qFlOwg6k9qPFu7
         +kJOO+JGwIp9EZpcuazY91MVCcS6cLpKLXCLNaUb0MKKGPEgVtms8PSjnI+6aksYJu/a
         1NY93JAAFBOlmuAjhXKS7erS426wYtAbFYg8yU1rxML3os64hoh9UALHgyW+b0fAoMHC
         dihx6C+muqnA4HelqS+7p+RNq4z4lb+DCQk02ntmAOmWj2EHEbGEGbpKuT8pULc/7vlV
         NwhH1qIlkNp6x+mPkwz1GfQfAqMZD9jnikkXHKU9/RiVgcJAnhWhkHlFC6cpxJHhBOpJ
         XDpQ==
X-Gm-Message-State: AOJu0YxTqPtyL05xUMeo7j5cQ3WL/QLwLUkA4LjnJ2G7q1mkoKQ29zyj
	nx2PL5b52IX4wPbzG37Tz8SQiN+xtgGPlTtNK98SYxMTjv1200MdNb+W
X-Gm-Gg: Acq92OGltfWY9rFFEafGZntkZWulq/d2w7OqP0kHkez4tcCWA/+tPwHr3UEPzHOSi+a
	Yf8u9bIVDeQtnj8yENMDF2rOgFdo+ZObOf9MchdkBE8nFS39JbgDygg18lcbY0uIMk1MxxQLqdd
	3YLeW9GQyOnRidLplFVBpDnBContYIhDE/sUzg/Ks4h8rA0jlAlUbJn2r7Re5cSp1rxgSuqt/Yp
	hxhm0v3z7GFxQPBW4w/cgnrjmgxkam+YZciBh5GApToUAbSXsXugBW04TUvn7p5d6UXGnyRnngJ
	KVysefZmSorIq3sTiP/lFY+I/6CbuYh13bmP4PuxnlSX22BqvqxL2Fk8oNynQRYHZoVVK7ev9Se
	wo31MKknPhhIqPLnL/Suiwc+PAl2fkn9KJ2RYFKP+tgnGxVc27jdUriR7ItLpwgH6xkiak7weDi
	eYVwVBFByGt11QUox0sTurBcHDc1aa5o/ArFcUugZr0t24znGy32VTpOnukOBJk6rlhmiaqqz6t
	Crk8W/GsjRp
X-Received: by 2002:a05:7300:cd99:b0:304:188d:d0be with SMTP id 5a478bee46e88-30449156f8cmr7666135eec.16.1779799724191;
        Tue, 26 May 2026 05:48:44 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 26 May 2026 09:48:27 -0300
Subject: [PATCH 2/2] ALSA: xen-front: Connect event channel after stream
 prepare
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-alsa-xen-event-channel-fixes-v1-2-91d3a6a50778@gmail.com>
References: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
In-Reply-To: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6113;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=vlLMVEi4mc8JanxVJ4cRF3k2qZw2pWROuD5ZLWy8lr4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmi05ZMEt7+9+1C28rcdPNvQW7GF7lsFX6I7du/9n/a1
 hL3eJsPHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRSi9Ghjn8jK6XEorLNIwL
 CjLqvO8kOe91Ldz1U6l0ZoHX0e9eZxgZVv2rZPjn22DTbf8/XWu/7PVUl10bTwQJJfHpFL+Xvb6
 aHwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-purgate-ID: tlsNG-d25034/1779799726-E2169CF5-D2402B03/0/0
X-purgate-type: clean
X-purgate-size: 6115
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.com,m:oleksandr_andrushchenko@epam.com,m:perex@perex.cz,m:xen-devel@lists.xenproject.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cassiogabrielcontato@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[cassiogabrielcontato@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 17DD85D5C8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The request channel must be connected from ALSA .open(), because hw-rule
queries and the stream open request use it. The event channel is
different: XENSND_EVT_CUR_POS handling uses ALSA runtime buffer and
period geometry, and the corresponding Xen stream parameters are not
submitted to the backend until .prepare() sends XENSND_OP_OPEN.

Currently .open() connects both channels. A backend current-position
event, or a stale event queued for an earlier stream instance, can
therefore reach xen_snd_front_alsa_handle_cur_pos() before
runtime->buffer_size and runtime->period_size are valid.

Add a per-channel connection helper, connect only the request channel in
.open(), connect the event channel after a successful stream prepare,
and disconnect it before stream close/free. Re-check the event-channel
state after taking ring_io_lock so disconnecting the event channel
synchronizes against a threaded IRQ that passed the initial lockless
state test. Keep defensive runtime geometry checks in the position
handler.

Fixes: 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/xen/xen_snd_front_alsa.c    | 17 ++++++++++++-----
 sound/xen/xen_snd_front_evtchnl.c | 20 +++++++++++++-------
 sound/xen/xen_snd_front_evtchnl.h |  2 ++
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index dc626480123a..a6dd196f73d6 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -378,7 +378,7 @@ static int alsa_open(struct snd_pcm_substream *substream)
 
 	stream_clear(stream);
 
-	xen_snd_front_evtchnl_pair_set_connected(stream->evt_pair, true);
+	xen_snd_front_evtchnl_set_connected(&stream->evt_pair->req, true);
 
 	ret = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				  alsa_hw_rule, stream,
@@ -498,6 +498,8 @@ static int alsa_hw_free(struct snd_pcm_substream *substream)
 	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
 	int ret;
 
+	xen_snd_front_evtchnl_set_connected(&stream->evt_pair->evt, false);
+
 	ret = xen_snd_front_stream_close(&stream->evt_pair->req);
 	stream_free(stream);
 	return ret;
@@ -532,6 +534,7 @@ static int alsa_prepare(struct snd_pcm_substream *substream)
 			return ret;
 
 		stream->is_open = true;
+		xen_snd_front_evtchnl_set_connected(&stream->evt_pair->evt, true);
 	}
 
 	return 0;
@@ -571,20 +574,24 @@ void xen_snd_front_alsa_handle_cur_pos(struct xen_snd_front_evtchnl *evtchnl,
 {
 	struct snd_pcm_substream *substream = evtchnl->u.evt.substream;
 	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t delta, new_hw_ptr, cur_frame;
 
-	cur_frame = bytes_to_frames(substream->runtime, pos_bytes);
+	if (!runtime->buffer_size || !runtime->period_size)
+		return;
+
+	cur_frame = bytes_to_frames(runtime, pos_bytes);
 
 	delta = cur_frame - stream->be_cur_frame;
 	stream->be_cur_frame = cur_frame;
 
 	new_hw_ptr = (snd_pcm_uframes_t)atomic_read(&stream->hw_ptr);
-	new_hw_ptr = (new_hw_ptr + delta) % substream->runtime->buffer_size;
+	new_hw_ptr = (new_hw_ptr + delta) % runtime->buffer_size;
 	atomic_set(&stream->hw_ptr, (int)new_hw_ptr);
 
 	stream->out_frames += delta;
-	if (stream->out_frames > substream->runtime->period_size) {
-		stream->out_frames %= substream->runtime->period_size;
+	if (stream->out_frames > runtime->period_size) {
+		stream->out_frames %= runtime->period_size;
 		snd_pcm_period_elapsed(substream);
 	}
 }
diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index 09e4c1d05636..17a30452c0cc 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -94,6 +94,9 @@ static irqreturn_t evtchnl_interrupt_evt(int irq, void *dev_id)
 
 	guard(mutex)(&channel->ring_io_lock);
 
+	if (unlikely(channel->state != EVTCHNL_STATE_CONNECTED))
+		return IRQ_HANDLED;
+
 	prod = page->in_prod;
 	/* Ensure we see ring contents up to prod. */
 	virt_rmb();
@@ -430,8 +433,8 @@ int xen_snd_front_evtchnl_publish_all(struct xen_snd_front_info *front_info)
 	return ret;
 }
 
-void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair *evt_pair,
-					      bool is_connected)
+void xen_snd_front_evtchnl_set_connected(struct xen_snd_front_evtchnl *channel,
+					 bool is_connected)
 {
 	enum xen_snd_front_evtchnl_state state;
 
@@ -440,13 +443,16 @@ void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair
 	else
 		state = EVTCHNL_STATE_DISCONNECTED;
 
-	scoped_guard(mutex, &evt_pair->req.ring_io_lock) {
-		evt_pair->req.state = state;
+	scoped_guard(mutex, &channel->ring_io_lock) {
+		channel->state = state;
 	}
+}
 
-	scoped_guard(mutex, &evt_pair->evt.ring_io_lock) {
-		evt_pair->evt.state = state;
-	}
+void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair *evt_pair,
+					      bool is_connected)
+{
+	xen_snd_front_evtchnl_set_connected(&evt_pair->req, is_connected);
+	xen_snd_front_evtchnl_set_connected(&evt_pair->evt, is_connected);
 }
 
 void xen_snd_front_evtchnl_pair_clear(struct xen_snd_front_evtchnl_pair *evt_pair)
diff --git a/sound/xen/xen_snd_front_evtchnl.h b/sound/xen/xen_snd_front_evtchnl.h
index 8400261ac466..f6ebdb09c029 100644
--- a/sound/xen/xen_snd_front_evtchnl.h
+++ b/sound/xen/xen_snd_front_evtchnl.h
@@ -77,6 +77,8 @@ void xen_snd_front_evtchnl_free_all(struct xen_snd_front_info *front_info);
 int xen_snd_front_evtchnl_publish_all(struct xen_snd_front_info *front_info);
 
 void xen_snd_front_evtchnl_flush(struct xen_snd_front_evtchnl *evtchnl);
+void xen_snd_front_evtchnl_set_connected(struct xen_snd_front_evtchnl *channel,
+					 bool is_connected);
 
 void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair *evt_pair,
 					      bool is_connected);

-- 
2.54.0


