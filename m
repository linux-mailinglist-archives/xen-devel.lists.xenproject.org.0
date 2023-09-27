Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1DF7AFE6B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608738.947419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPvE-0001XG-Iq; Wed, 27 Sep 2023 08:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608738.947419; Wed, 27 Sep 2023 08:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlPvE-0001UG-Fx; Wed, 27 Sep 2023 08:29:28 +0000
Received: by outflank-mailman (input) for mailman id 608738;
 Wed, 27 Sep 2023 08:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvhV=FL=gmail.com=k.kahurani@srs-se1.protection.inumbo.net>)
 id 1qlPvC-0001UA-Jj
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:29:26 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7ac62ce-5d0f-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 10:29:25 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so12271501a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Sep 2023 01:29:25 -0700 (PDT)
Received: from localhost.localdomain ([105.29.162.58])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056402068300b005256771db39sm7763953edy.58.2023.09.27.01.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 01:29:23 -0700 (PDT)
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
X-Inumbo-ID: f7ac62ce-5d0f-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695803365; x=1696408165; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqzMLrutU/O6W+UgakqlkbwTrx1oB6pMeuXfKi5IFhk=;
        b=mPQobPct1Tnq4LONiXlIwctGF0cRcHReA5dQAFs5ibRoFIVZkexSQcwUCbahjfGxZS
         UqrRJuPo4LorNXqrMykVm1Z64jNAjViC6xIuBeW/O40+Xj8O9XDaIhwwaiEAVdf5sBLO
         U3r3Psze7whGiLbaP22L610POIx6+gI4MP06g6sqv5O6DB0uSCDR4dssj8C2fWUZZnJr
         FopAZRvtYxpnXhr80xco1Qd6dIdWV8vpeBl/HYJF6c4tPTlCTZcwURprS7C4ENZmt4g2
         XRgoQvKA2ahoQ4mhwJ5EoX4G4ncpoB0QiRHfmsKue/69pCCrE2nPXviX4N0wMRpfctdt
         I8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803365; x=1696408165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqzMLrutU/O6W+UgakqlkbwTrx1oB6pMeuXfKi5IFhk=;
        b=dmzoVWVHm57z5KzDsw8PV0cBlYaqdyUt0dZPdwfyR+Zx+n6kwvFQ0MY0h1OUCtG59c
         4e0USokmbEFKN4ed+pB20Hi71LEUkAo3TwS5VgH+1iQSY9uIIwgnHUPkWZ/+EXS2sC2C
         0k6nhFDPjs9zeQ8rlucgaWlTyhiUPNW126pK5POBjZewMdpnSfPAl4DrqrdwAk9VP6gD
         kWHLZR/r/ZwZ2IgQ6NF06sBZ1bU5GbTkTPLgjEih0zPesJIlnFNsg7TGhoAFH6kphbcr
         jRlXa5eywHmdypzOMMuxIVfn/u136VGEmrEK7f+3JUk0KwMqYtJ/3aWyFYp4JxvdU7kt
         Y4BQ==
X-Gm-Message-State: AOJu0YySMOu/nGvQVUQxk4rTi3cm9utgO3iXJ+n5EmMz4Co/sTr7vyV8
	PkodxHhhYJukTDD3Zx17q8iI10g1jE0=
X-Google-Smtp-Source: AGHT+IGEvtWog5f46DQVKz2/HPmkwyHuufDzJwb3m/0rrIctLdakAOfl6oDV0S96vLRTi2Q5xclp+g==
X-Received: by 2002:a50:ec8e:0:b0:525:680a:6b89 with SMTP id e14-20020a50ec8e000000b00525680a6b89mr1297725edr.12.1695803364420;
        Wed, 27 Sep 2023 01:29:24 -0700 (PDT)
From: David Kahurani <k.kahurani@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: netdev@vger.kernel.org,
	wei.liu@kernel.org,
	paul@xen.org,
	David Kahurani <k.kahurani@gmail.com>
Subject: [PATCH] net/xen-netback: Break build if netback slots > max_skbs + 1
Date: Wed, 27 Sep 2023 11:29:18 +0300
Message-Id: <20230927082918.197030-1-k.kahurani@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If XEN_NETBK_LEGACY_SLOTS_MAX and MAX_SKB_FRAGS have a difference of
more than 1, with MAX_SKB_FRAGS being the lesser value, it opens up a
path for null-dereference. It was also noted that some distributions
were modifying upstream behaviour in that direction which necessitates
this patch.

Signed-off-by: David Kahurani <k.kahurani@gmail.com>
---
 drivers/net/xen-netback/netback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 88f760a7cbc3..df032e33787f 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1005,6 +1005,7 @@ static void xenvif_tx_build_gops(struct xenvif_queue *queue,
 			break;
 		}
 
+		BUILD_BUG_ON(XEN_NETBK_LEGACY_SLOTS_MAX > MAX_SKB_FRAGS + 1);
 		if (ret >= XEN_NETBK_LEGACY_SLOTS_MAX - 1 && data_len < txreq.size)
 			data_len = txreq.size;
 
-- 
2.25.1


