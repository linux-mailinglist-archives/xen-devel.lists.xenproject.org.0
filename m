Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8B77D2C3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 21:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584030.914429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVzIe-000852-Ae; Tue, 15 Aug 2023 19:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584030.914429; Tue, 15 Aug 2023 19:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVzIe-00082G-7E; Tue, 15 Aug 2023 19:01:52 +0000
Received: by outflank-mailman (input) for mailman id 584030;
 Tue, 15 Aug 2023 19:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Gn6=EA=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1qVzIc-0007nM-C7
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 19:01:50 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 303d9e29-3b9e-11ee-8776-cb3800f73035;
 Tue, 15 Aug 2023 21:01:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 736141FD6A;
 Tue, 15 Aug 2023 19:01:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B7221390C;
 Tue, 15 Aug 2023 19:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFeVEZ3L22QTVAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:49 +0000
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
X-Inumbo-ID: 303d9e29-3b9e-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692126109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/BgMI8FuOi/5pmBMZAtt3gp913bmnjYvQcbxzOHfHE=;
	b=nhabCSKsWkx41NfRqAxKgh8FQUXjbeOAtxOYCVMoXsAyxByAjesTZHGSNbtuRbYe9rWpob
	l/pgaU9eAKtGUJ+w5zfo5Qky1TpOVwKv1YoiTfvx4KZQwdlLea7GH114OMQV9Gjib9bFB0
	9JbVbJgcn5fjiqGxhu56qkfvsNm1M/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/BgMI8FuOi/5pmBMZAtt3gp913bmnjYvQcbxzOHfHE=;
	b=+XKBo0gra+U9kLyDt5tVYGNJHRwve2LRNG7LL5QlEl7517QnhuahhelIchrFC0AdbhSepj
	n3JcgCWw5rBcIkAQ==
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 15/25] ALSA: xen: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:26 +0200
Message-Id: <20230815190136.8987-16-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch converts the xen frontend driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_iter() variants.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is adjusted accordingly.

Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/xen/xen_snd_front_alsa.c | 56 +++++++---------------------------
 1 file changed, 11 insertions(+), 45 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index db917453a473..bfae303633ef 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -602,38 +602,24 @@ static snd_pcm_uframes_t alsa_pointer(struct snd_pcm_substream *substream)
 	return (snd_pcm_uframes_t)atomic_read(&stream->hw_ptr);
 }
 
-static int alsa_pb_copy_user(struct snd_pcm_substream *substream,
-			     int channel, unsigned long pos, void __user *src,
-			     unsigned long count)
+static int alsa_pb_copy(struct snd_pcm_substream *substream,
+			int channel, unsigned long pos, struct iov_iter *src,
+			unsigned long count)
 {
 	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
 
 	if (unlikely(pos + count > stream->buffer_sz))
 		return -EINVAL;
 
-	if (copy_from_user(stream->buffer + pos, src, count))
+	if (copy_from_iter(stream->buffer + pos, count, src) != count)
 		return -EFAULT;
 
 	return xen_snd_front_stream_write(&stream->evt_pair->req, pos, count);
 }
 
-static int alsa_pb_copy_kernel(struct snd_pcm_substream *substream,
-			       int channel, unsigned long pos, void *src,
-			       unsigned long count)
-{
-	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
-
-	if (unlikely(pos + count > stream->buffer_sz))
-		return -EINVAL;
-
-	memcpy(stream->buffer + pos, src, count);
-
-	return xen_snd_front_stream_write(&stream->evt_pair->req, pos, count);
-}
-
-static int alsa_cap_copy_user(struct snd_pcm_substream *substream,
-			      int channel, unsigned long pos, void __user *dst,
-			      unsigned long count)
+static int alsa_cap_copy(struct snd_pcm_substream *substream,
+			 int channel, unsigned long pos, struct iov_iter *dst,
+			 unsigned long count)
 {
 	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
 	int ret;
@@ -645,26 +631,8 @@ static int alsa_cap_copy_user(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	return copy_to_user(dst, stream->buffer + pos, count) ?
-		-EFAULT : 0;
-}
-
-static int alsa_cap_copy_kernel(struct snd_pcm_substream *substream,
-				int channel, unsigned long pos, void *dst,
-				unsigned long count)
-{
-	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
-	int ret;
-
-	if (unlikely(pos + count > stream->buffer_sz))
-		return -EINVAL;
-
-	ret = xen_snd_front_stream_read(&stream->evt_pair->req, pos, count);
-	if (ret < 0)
-		return ret;
-
-	memcpy(dst, stream->buffer + pos, count);
-
+	if (copy_to_iter(stream->buffer + pos, count, dst) != count)
+		return -EFAULT;
 	return 0;
 }
 
@@ -697,8 +665,7 @@ static const struct snd_pcm_ops snd_drv_alsa_playback_ops = {
 	.prepare	= alsa_prepare,
 	.trigger	= alsa_trigger,
 	.pointer	= alsa_pointer,
-	.copy_user	= alsa_pb_copy_user,
-	.copy_kernel	= alsa_pb_copy_kernel,
+	.copy		= alsa_pb_copy,
 	.fill_silence	= alsa_pb_fill_silence,
 };
 
@@ -710,8 +677,7 @@ static const struct snd_pcm_ops snd_drv_alsa_capture_ops = {
 	.prepare	= alsa_prepare,
 	.trigger	= alsa_trigger,
 	.pointer	= alsa_pointer,
-	.copy_user	= alsa_cap_copy_user,
-	.copy_kernel	= alsa_cap_copy_kernel,
+	.copy		= alsa_cap_copy,
 };
 
 static int new_pcm_instance(struct xen_snd_front_card_info *card_info,
-- 
2.35.3


