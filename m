Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457DACC994
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004562.1384331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxm-0007QR-Nx; Tue, 03 Jun 2025 14:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004562.1384331; Tue, 03 Jun 2025 14:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxm-0007OJ-Id; Tue, 03 Jun 2025 14:50:02 +0000
Received: by outflank-mailman (input) for mailman id 1004562;
 Tue, 03 Jun 2025 14:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WdC=YS=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uMSxk-00060n-3P
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:50:00 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05dc7897-408a-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:49:59 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso7319233e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:49:59 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55350cab690sm450214e87.53.2025.06.03.07.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:49:57 -0700 (PDT)
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
X-Inumbo-ID: 05dc7897-408a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748962199; x=1749566999; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQZpCaGwN67bAjam9mj+oezbvKc88yCztRac3tGbr1g=;
        b=PVpp1t+w6flUgorB/q0H5JkTZRl43mbgRsV3vvqaPpb4mTkXxdMoY2Xc2ORlO9vZmc
         69kvN5NHEV6ocZAs2P4KF0RMPTT3t0LwL1SYSVacUPVuUzKfPxBcl/YsgqUJX3Akq77H
         V5m8g732OPVlPEEOwMXSviGwjrIcTCd77zA3/QXIMOQZhE5NcdDrphhWDhJYISSvzhES
         wpHT2MJlPYASUFWs7wewsyKSyFGgcfJ5CH/rlXGzgTNTfjcOE2MBLAmKBed3AwY15KKe
         bcyDlRANoSvXRAjc3Co+dcLHv2G82koi2daZiIk6JoUcKbZPNJ6tmZrcgG8yYWEWFEWn
         p3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962199; x=1749566999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQZpCaGwN67bAjam9mj+oezbvKc88yCztRac3tGbr1g=;
        b=mQykN1m2NY5cgaKpKravjl54bsILQwk5T9K2PUMdNri/vu+VwisTJ0YiGwinOPbuV7
         iZsMevlOVZXZG/JgjXWQg7iI0Stm8UkfcdEvcMNWApQcjtU6HgzOA4kwxNPTUfi/qypY
         1R7rVcF31Z/KzEvW7LlILlC6rq6zCGxN8pK+2dTEYa9aSh3Hob8msgCXdNejazOmRpW6
         rUvxWdyXmtQhd+e6iE+iIViAv/nweNP9MQih7JpzvGFLQn3VIE+rdqgiSszZj2eccthv
         LGWSm1xUQGJo7LQS19YVzQ4XsfVY+uqFwkrY7r1ZLgfHpaiz4WZkC9nGFHpwGSoKDfBH
         ZzHg==
X-Gm-Message-State: AOJu0Yx1hWEfHe+pKA868+ILzDxltM/aLjsCyDqIvlDJwGfvvTrqSOAD
	tVs9kqCxVZrk35hJX44rd3ocfi7G7K6vgnwx6aatZXWlc+XF2dWyBu2+FGvDfSL9r4A=
X-Gm-Gg: ASbGncvn8zQRoe8q+avk/EIsXhxCBANu9O705YFEBGtM6xYGuKdSlnuUUtmw7OU0cc5
	/y3wAXTIZqa1i8po9u6BtqBlGnNF09865+dXtDz7XZj9/Vsxqq4DT4HxH31Hnv628DHJocuN/0A
	2ZsPq4LsqP8YAEEdD3tBEzjftC098miyw3OgMPm0+zb9NTCfUXSm8FMrxkFDbXL7x4X9cRI+yZD
	7f8Q2ox+7CjbX19LDhXHfXuX+l+NO4czDWlQnCeE0T+Qp+1cMMH1ij4ul3fQYUg7ZnX5Lk6UwbE
	j+qFlWU00IEge0AXP3DpRlnLuRUJXy7u0fuBsQM8JDux/u5a774JyAmG723S21Pvpnm8yDSgaus
	Rjhk/4+JJBg1WiU6oeqi7lNBMQiIDaFplkw==
X-Google-Smtp-Source: AGHT+IGGQ7NvgDsfuiAWCA46sv02b09CkDopMWaZ/5Lkp1s7+9CQeYnYoAEWbBDrB5w+u3eS1tdXLQ==
X-Received: by 2002:a05:6512:2203:b0:553:3303:471 with SMTP id 2adb3069b0e04-5533b90af1emr4945561e87.30.1748962198615;
        Tue, 03 Jun 2025 07:49:58 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 5/5] tools/golang: Regenerate bindings for trap_unmapped_accesses
Date: Tue,  3 Jun 2025 16:49:48 +0200
Message-ID: <20250603144948.1685047-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
References: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 tools/golang/xenlight/helpers.gen.go | 6 ++++++
 tools/golang/xenlight/types.gen.go   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 90846ea8e8..191be87297 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1170,6 +1170,9 @@ x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
+}
+if err := x.TrapUnmappedAccesses.fromC(&xc.trap_unmapped_accesses);err != nil {
+return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 
  return nil}
@@ -1695,6 +1698,9 @@ xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
+}
+if err := x.TrapUnmappedAccesses.toC(&xc.trap_unmapped_accesses); err != nil {
+return fmt.Errorf("converting field TrapUnmappedAccesses: %v", err)
 }
 
  return nil
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e7667f1ce3..656933c6c9 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -606,6 +606,7 @@ MsrRelaxed Defbool
 Altp2M Altp2MMode
 VmtraceBufKb int
 Vpmu Defbool
+TrapUnmappedAccesses Defbool
 }
 
 type DomainBuildInfoTypeUnion interface {
-- 
2.43.0


