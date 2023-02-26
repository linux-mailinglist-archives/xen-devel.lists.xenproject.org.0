Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56236A32DD
	for <lists+xen-devel@lfdr.de>; Sun, 26 Feb 2023 17:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502140.773861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWJyy-0000Qs-Ms; Sun, 26 Feb 2023 16:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502140.773861; Sun, 26 Feb 2023 16:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWJyy-0000Ne-Jy; Sun, 26 Feb 2023 16:34:40 +0000
Received: by outflank-mailman (input) for mailman id 502140;
 Sun, 26 Feb 2023 16:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eb3C=6W=redhat.com=trix@srs-se1.protection.inumbo.net>)
 id 1pWJyx-0000NY-1v
 for xen-devel@lists.xenproject.org; Sun, 26 Feb 2023 16:34:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741226eb-b5f3-11ed-88bb-e56d68cac8db;
 Sun, 26 Feb 2023 17:34:36 +0100 (CET)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-502-IvdbNkHKMUSM67kUTHewYg-1; Sun, 26 Feb 2023 11:34:33 -0500
Received: by mail-qt1-f200.google.com with SMTP id
 t22-20020ac86a16000000b003bd1c0f74cfso1707385qtr.20
 for <xen-devel@lists.xenproject.org>; Sun, 26 Feb 2023 08:34:33 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 g2-20020ac870c2000000b003b868cdc689sm3171728qtp.5.2023.02.26.08.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 08:34:31 -0800 (PST)
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
X-Inumbo-ID: 741226eb-b5f3-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677429274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AORosMQj3A7DS3Nk/fBRbnzvD4PblGqGAWvsizAa8P8=;
	b=YGm/6kgWz96USy3U4u6R1DAy+r5k4X5KptyHlfg4RMRhII/dzqs6SNm0VR/B/Rki6vnul2
	qCi+AHD8bAncyzpTn1FLa4qEv0Y3iBZQD6zPvf86/7qXdYfebqb7uyIvP+pZuGUUkkubLb
	sciEHqg04dMuTm2T8ZrM+IBrw3mVO0Y=
X-MC-Unique: IvdbNkHKMUSM67kUTHewYg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AORosMQj3A7DS3Nk/fBRbnzvD4PblGqGAWvsizAa8P8=;
        b=yh2+LzXKEnbU47Qu8cjPR9mLscf1noggoQ3frSo2fhyXiZKlLfQXTnr1csy/eRaBzO
         V8OwUl+6oukrkO4SdnsWbPAgCd5Sg+589zezXYnN7vyue33L/9X/D3voCRRFTUN7B0fI
         FFbQrkMkSlBcRXy/zxgQlv8FrrXT26TlcHAvG48nIJ9VF+n7UDlHyC4Ds5XbwBf3hjpH
         6NIwRiXH6NhsvkHTPHTqvax0p2dXP+UcIo5l0fOIXUU+Ki+AEqVmX2eaw+rR6A4he9Sl
         LFmPoMQJ2MvTu5VGLqhD3qPfd9DDY9LZuA0IIhmfX/tPJAofFfpRlMoksTEtIP1Ch9N3
         AbbA==
X-Gm-Message-State: AO0yUKV/hiARJxZYeOCbvlYrYG6Dpn8biEAnmtKFhavi3t2SJzsypxho
	+RtY6yMgK/uoFhyMDmq8wUi/IcucljTaEUFJhjkxq4bepJHJh0AZvoo6eU7WUKiymhPb4iofpMt
	8vFMHZC5Dy2YCbTearb+ob7ul6W0=
X-Received: by 2002:ac8:4e84:0:b0:3bf:d9a9:25fb with SMTP id 4-20020ac84e84000000b003bfd9a925fbmr876277qtp.10.1677429272650;
        Sun, 26 Feb 2023 08:34:32 -0800 (PST)
X-Google-Smtp-Source: AK7set87gS29lQpRvxFPSHfdfKAfctYcKloYbTI3zUudY16bh9F5kOGQv9rhoki2m/9HRW6el0/hNQ==
X-Received: by 2002:ac8:4e84:0:b0:3bf:d9a9:25fb with SMTP id 4-20020ac84e84000000b003bfd9a925fbmr876253qtp.10.1677429272361;
        Sun, 26 Feb 2023 08:34:32 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: wei.liu@kernel.org,
	paul@xen.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] xen-netback: remove unused variables pending_idx and index
Date: Sun, 26 Feb 2023 11:34:29 -0500
Message-Id: <20230226163429.2351600-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

building with gcc and W=1 reports
drivers/net/xen-netback/netback.c:886:21: error: variable
  ‘pending_idx’ set but not used [-Werror=unused-but-set-variable]
  886 |                 u16 pending_idx;
      |                     ^~~~~~~~~~~

pending_idx is not used so remove it.  Since index was only
used to set pending_idx, remove index as well.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/xen-netback/netback.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index bf627af723bf..1b42676ca141 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -883,11 +883,9 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 		struct xen_netif_tx_request txfrags[XEN_NETBK_LEGACY_SLOTS_MAX];
 		struct xen_netif_extra_info extras[XEN_NETIF_EXTRA_TYPE_MAX-1];
 		unsigned int extra_count;
-		u16 pending_idx;
 		RING_IDX idx;
 		int work_to_do;
 		unsigned int data_len;
-		pending_ring_idx_t index;
 
 		if (queue->tx.sring->req_prod - queue->tx.req_cons >
 		    XEN_NETIF_TX_RING_SIZE) {
@@ -983,9 +981,6 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 			break;
 		}
 
-		index = pending_index(queue->pending_cons);
-		pending_idx = queue->pending_ring[index];
-
 		if (ret >= XEN_NETBK_LEGACY_SLOTS_MAX - 1 && data_len < txreq.size)
 			data_len = txreq.size;
 
-- 
2.27.0


