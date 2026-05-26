Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFj5KQuXFWp9WgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:50:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602875D5C8F
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319875.1587324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrEU-0000v6-7K; Tue, 26 May 2026 12:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319875.1587324; Tue, 26 May 2026 12:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRrEU-0000tB-1c; Tue, 26 May 2026 12:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1319875;
 Tue, 26 May 2026 12:48:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cassiogabrielcontato@gmail.com>) id 1wRrD8-0008Oi-7N
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:48:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRrD7-00CnB3-4W
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:48:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cassiogabrielcontato@gmail.com>)
 id 6a1596a3-bab6-0a2a0a5309dd-0a2a4509e214-20
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:48:40 +0200
Received: from [74.125.82.181] (helo=mail-dy1-f181.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <cassiogabrielcontato@gmail.com>)
 id 6a1596a7-2497-0a2a45090019-4a7d52b5ccae-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:48:40 +0200
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2f0d3e07e30so34704265eec.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 05:48:40 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br.
 [177.4.162.74]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451f20561sm9516837eec.10.2026.05.26.05.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 05:48:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799719; x=1780404519; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRC0UR7DdrEHF5n8z3rovd3sy9IxWMm0Nnsp9OqSDMw=;
        b=Ji0yjQe13sQxurnhgLt5rJ4nPDQ+1PT8jXcow8wNaK8HxqSlAg60MwxevkuzZV0NbO
         O4H1rP6wSefYEhLXg3VfyCnGELe+uqas22/HPDFZKAZnpWpmyj+tUg9BL0oJCm13Bgn4
         SpFyqu1Dp82Inet8oMDR2uCID+dL5uGlFxfsW9S3bWRFnRXIOcyiHQ8TEZNDFr+nRv3/
         s1hM9o6JNIyDpWhyas8ehJLusm9U4XMSzTd2+cP7dcFVKkJTm7hY+L4oqv+mtywR91xQ
         uOSQO539U8Fsyf+lH4SMZheIeStahnBxRfXFMFaajjeYd29m3jlNRYfuNdFvh4miD/hc
         CDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799719; x=1780404519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRC0UR7DdrEHF5n8z3rovd3sy9IxWMm0Nnsp9OqSDMw=;
        b=JFMBakBLxh8vNeX6wzo/utvl78nVCJsPXFR1qHgbQyYxkNQfssMjEtUczCjSxKZi1J
         ToLlsDyR+CwkMciD86+xAno/f1rMJLefgiu2u1UAey96GZYU2LO8II3X2FXJn0dN/dkn
         jc7tFqDkeZiT5zDKhG02O0GMbJwi/EI/6QUJgf2WahjS+B6YZKmsFr9FQmelzqlVQrBh
         76A39cApDBMVrGTaEqNomQJmAzYzCsBNhW9nd+h5a/z11cUkDDlcZ2famSJ+VLhwAW1u
         O3JJdgRxeBBthmyqUUhp+gxC/QJ4GrFCP2eGydd+z4iEAUmF5mCTBTYfVPYZ9CP6OEMn
         CTGA==
X-Gm-Message-State: AOJu0YyVBAnA3vuns2gM8p9A55mReXwW/uBvHtYeaq4KvPo2dLj5s/db
	GlriMoOGxjSe2+8C/CIXTJArD05pJKq1L8BCfNiADYEovee7X8sXivYN
X-Gm-Gg: Acq92OGXhKECdwKZoEZvDPfRsYKw0H8ouRPHFvyJ78YMyZNN4zX6ej9SPUmsHk6zgX2
	53cZIkCx+iiowYe54FO9mxCXaOVhjKRqieuX/bfO9h4Jvq0dPFejE7K3/j2ecSs/sTXYWrK7rPF
	itglE5Gn3wTfIvRFJHvqFYvXmAwOx1s9t5l7xTudm4RohyEpYqqms42lMfY947pUgOSzdfT0Zzu
	lgK5AmJFBa/gjLmYM7sEB+hNOYrAQ3eJMOVKUyqt6byiigj1wOYjeXQzpAYKL7nhdL9ds5Qepdj
	ULVfU5x7/2FyDUiiVGHafoATwUxAiQ/xjTDVEKn5N+2z+dtAS+0og3u7XCpYFp4mIyrEvpPLQUP
	4T8afXMt24o/o0c1Qz7Cn3qmTh49/E9EDIXA5zgTTgie46glQD0ZTu5F6GnhHdS6OthTPnaq/jI
	W8jjqt+8OuCyyjknORD0jsZ3VvuHSfCLQyokfaDiD7edARBYMGmjHJFfTJKUXp85eAFWOk2Z5wz
	g==
X-Received: by 2002:a05:7300:641a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30449144597mr9815773eec.34.1779799718634;
        Tue, 26 May 2026 05:48:38 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: xen-front: Fix event channel stream lifetime
 bugs
Date: Tue, 26 May 2026 09:48:25 -0300
Message-Id: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5gXZeNepXoYrVjTcgYOyqC+
 O6tdflzDt9GhiwwulYbZSxiMmqJ+lRR90r6BMujNHnnowu+4TRY4hXKWKATHyfFwL2sMI4IbXC
 I4dKfqRCfjN9QhNv93za3b3TTYdK+fwHoTNtOgAAAAA==
X-Change-ID: 20260423-alsa-xen-event-channel-fixes-6e4b40e649f7
To: Takashi Iwai <tiwai@suse.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=m/GceItf9izmgDxXf0ij7qdTlcHvcVkDr7Dd/eqL+EY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmi0xaX7u38p/B9f9y/wt5acZcv3JdKj0zdPX3LA3Wt3
 ss7hW9s6ihlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJVIsx/K87/rjFI9pfUnSt
 wie+TyszJET2dv6NO6jCLVo1e9ni2a4M/92WG9QZKs3x3Jvd/3HTTv3v1oF8ryZklfYv/xRlfew
 qHwMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-purgate-ID: tlsNG-bad1c0/1779799720-36D77A53-B1DF61CB/0/0
X-purgate-type: clean
X-purgate-size: 1223
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
X-Rspamd-Queue-Id: 602875D5C8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix two related event-channel issues in the Xen ALSA frontend.

The first patch resets the event channel's expected incoming event
id when a stream is cleared, and drops stale queued events from
the previous stream instance.

The second patch keeps the request channel connected from .open(),
where it is needed for hw-rule queries and stream open requests,
but delays the event channel until after a successful .prepare().
This prevents current-position events from reaching the ALSA position
handler before runtime buffer and period geometry are valid.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: xen-front: Reset event channel state on stream clear
      ALSA: xen-front: Connect event channel after stream prepare

 sound/xen/xen_snd_front_alsa.c    | 17 ++++++++++++-----
 sound/xen/xen_snd_front_evtchnl.c | 28 +++++++++++++++++++---------
 sound/xen/xen_snd_front_evtchnl.h |  6 ++++--
 3 files changed, 35 insertions(+), 16 deletions(-)
---
base-commit: 31d40472d5699a6139fe3a2ad6558645a99b7422
change-id: 20260423-alsa-xen-event-channel-fixes-6e4b40e649f7

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


