Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D97E099A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 20:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627329.978310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz07z-00034x-HB; Fri, 03 Nov 2023 19:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627329.978310; Fri, 03 Nov 2023 19:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz07z-00032h-EY; Fri, 03 Nov 2023 19:46:47 +0000
Received: by outflank-mailman (input) for mailman id 627329;
 Fri, 03 Nov 2023 19:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qz07y-0002vU-PA
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 19:46:46 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7eac6fa-7a81-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 20:46:45 +0100 (CET)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-66d0169cf43so14333826d6.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 12:46:45 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 ef19-20020a0562140a7300b0063f88855ef2sm1022825qvb.101.2023.11.03.12.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 12:46:43 -0700 (PDT)
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
X-Inumbo-ID: b7eac6fa-7a81-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699040804; x=1699645604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gqDHPgN6jv++qihAVFZm0kQRDggASrTCe7c/nz15F8=;
        b=L7mOowzysLxb6JDWGfn62Xcx7nWDdWHyIUmgHIBfAlbScF1Vl81kPHUv0bTRiZwawq
         AbN/nqKa+FgxpZfhauNYsZU9NSVfrk+nYrgiXpvYOyAwla82GS/AGU11xuPaEE9taOlP
         W5xlZkuS5rOVcCbLHNz++Rqp1Goibo1l0V0qyar1T+RTpNHyl7teJ27+GtpWq0EU3o5w
         cDgcXQXaH/Ekj6kILAZM87XjkPVGbNmu4XFhtZe//KKBYR5IA44qGVuVrZfM7ACrVVWl
         MSRszQq/YzVVKX7gmQ4u89LaBXTSpZMerkjm0YumpQH0fCK2UXl256+Rt/ZXYmI+aNbs
         NwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699040804; x=1699645604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gqDHPgN6jv++qihAVFZm0kQRDggASrTCe7c/nz15F8=;
        b=P8FS4NeEYbtxEXvomf+KE/lulqPTbmpRGNlzopTG9a4R+/TRDFbYMRbgt0S0S3CTVd
         zKNkdNcDprQQtmEC3YFV6ZfFmQUnImYfAka6DLpDGm2hVPMmqd4KKGnNV+d2ipN05VBx
         GIyhXoAYJcbGRNmxxSRK9eSVUwiDvwMlU6ZpmaVq/5S2pTTfTIEzikQzlvlu/h51onkt
         ZaoIB+5Jgpsrl7En8ErBPP5lXix9bgQRR2CNFq+9dehnqwhKcgDJFgc/tLYgGvWBobOq
         V567M2TcznHx/MqUaz4OTnU9yS9NXe2Xjv7MlpjKlTPWHn/Tzd+4cvr7YIbqVc/y18X5
         3JjQ==
X-Gm-Message-State: AOJu0YwhShpGGSUBaAeYpmN5wSQ2lbTKkCQLeOSrOxrZLVvIWQ/z8odn
	gciWqPzFtH4tBNXQj2bmZtUn09+xI/s=
X-Google-Smtp-Source: AGHT+IGHHdFzOukNi8hidgytliM+4825JSb86BpajPyr1TL5n6ElQiNdLtX7508lkq2xBR0JnZQg1g==
X-Received: by 2002:a05:6214:1c41:b0:64f:4e64:5962 with SMTP id if1-20020a0562141c4100b0064f4e645962mr30190273qvb.31.1699040803814;
        Fri, 03 Nov 2023 12:46:43 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.18 1/2] golang: Fixup binding for Arm FF-A
Date: Fri,  3 Nov 2023 15:45:50 -0400
Message-ID: <20231103194551.64448-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103194551.64448-1-jandryuk@gmail.com>
References: <20231103194551.64448-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new FF-A TEE type changed the go bindings.  Update them.

Fixes: 8abdd8d52862 ("tools: add Arm FF-A mediator")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/golang/xenlight/types.gen.go | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 4f40aac28c..6a9ebb3fec 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -488,6 +488,7 @@ type TeeType int
 const(
 TeeTypeNone TeeType = 0
 TeeTypeOptee TeeType = 1
+TeeTypeFfa TeeType = 2
 )
 
 type SveType int
-- 
2.41.0


