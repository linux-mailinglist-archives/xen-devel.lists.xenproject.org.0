Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2628292EC6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 21:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8822.23711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUbAr-0007SP-0I; Mon, 19 Oct 2020 19:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8822.23711; Mon, 19 Oct 2020 19:50:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUbAq-0007S0-TK; Mon, 19 Oct 2020 19:50:28 +0000
Received: by outflank-mailman (input) for mailman id 8822;
 Mon, 19 Oct 2020 19:50:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fLnO=D2=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kUbAp-0007Rv-W8
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 19:50:28 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cf0248a9-b928-4f09-969a-6e7f011d050d;
 Mon, 19 Oct 2020 19:50:26 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-a2_yWrXGPeKRGS6HwGc5WA-1; Mon, 19 Oct 2020 15:50:24 -0400
Received: by mail-qk1-f200.google.com with SMTP id a81so523241qkg.10
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 12:50:24 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id l25sm401073qtf.18.2020.10.19.12.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 12:50:22 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fLnO=D2=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kUbAp-0007Rv-W8
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 19:50:28 +0000
X-Inumbo-ID: cf0248a9-b928-4f09-969a-6e7f011d050d
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id cf0248a9-b928-4f09-969a-6e7f011d050d;
	Mon, 19 Oct 2020 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603137026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type;
	bh=gurUpVJY92BNatRtGPJGA4twsuCjo97EHFL7kW3iTCQ=;
	b=iz05p/CCrBPlCjPg3iRXT4Y+T2jxZ0idujFsBeP1HPLER0DIOdRc7hmYxDD+zK3LfV2Llb
	qkWGhHi8aXc3bO2VgIF+QYKW9MsmAFBwcBVAfPL9as5iCQemzvLbF3hvKg40dF3a7ac/1s
	W7z3+rC5LY+EZ32kfLrw8GxpaJPjXMk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-a2_yWrXGPeKRGS6HwGc5WA-1; Mon, 19 Oct 2020 15:50:24 -0400
X-MC-Unique: a2_yWrXGPeKRGS6HwGc5WA-1
Received: by mail-qk1-f200.google.com with SMTP id a81so523241qkg.10
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 12:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gurUpVJY92BNatRtGPJGA4twsuCjo97EHFL7kW3iTCQ=;
        b=tmKhMQVUegRsDFfQV3XrMxRWnkOCtZoaqvb+imBO+bPUx5iNCvyRjMm9z6tHKa7+DS
         tmyqMIPTOsZ6ydT4Y9b9UzkK/3y207NtE1T5lssbBjzT4dKyV0FB3nSRLuTTSTVH2WVw
         etvAXq3Kh5pMLJOI8Rc8kXy688wO88Wnqw2WFSkUAzYH9TxoBtBWnjdL/Gnoeytvinwc
         B93cdIidF8orCSuQ03gOxSQeMnUEkx4Gij6GGAVlNAScyYp1vIe+OlAn1JBLiG7TZibo
         rzyM4P+4gIYX6O+yd6Ef89wXhS6JgfO2JCj/u0wAnDq5VF5h1KQsQgUh+89RczzGGM3Z
         4dSA==
X-Gm-Message-State: AOAM533z+pOUGk/fqAqHKwBloZaA4McQWfpEu5xARJw5CkOLc44BR86T
	sNEGk86kXSXJsaJtvNkIj0vFa2GwZNYQKf/LwynGOQk+rfWlg14sBiWo7UtvJqAee2MvM2UNwBM
	LmGz+TcpkOjlJmtNKnUiBuUp0zsQ=
X-Received: by 2002:ac8:705b:: with SMTP id y27mr1114108qtm.192.1603137023756;
        Mon, 19 Oct 2020 12:50:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvDlls0C3FPTa4CLaTFO3RK5ocpNR7SlP5iafd30354sGejOe41Jo8FGhAcBQn8KNGmwvqIQ==
X-Received: by 2002:ac8:705b:: with SMTP id y27mr1114095qtm.192.1603137023534;
        Mon, 19 Oct 2020 12:50:23 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id l25sm401073qtf.18.2020.10.19.12.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:50:22 -0700 (PDT)
From: trix@redhat.com
To: konrad.wilk@oracle.com,
	axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] block: xen-blkback: remove unneeded break
Date: Mon, 19 Oct 2020 12:50:16 -0700
Message-Id: <20201019195016.15337-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a goto

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/block/xen-blkback/blkback.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index adfc9352351d..f769fbd1b4c4 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -1269,7 +1269,6 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	default:
 		operation = 0; /* make gcc happy */
 		goto fail_response;
-		break;
 	}
 
 	/* Check that the number of segments is sane. */
-- 
2.18.1


