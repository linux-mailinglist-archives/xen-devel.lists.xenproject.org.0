Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F93ADB5EF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017434.1394436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRC95-0006WC-IN; Mon, 16 Jun 2025 15:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017434.1394436; Mon, 16 Jun 2025 15:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRC95-0006TY-FA; Mon, 16 Jun 2025 15:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1017434;
 Mon, 16 Jun 2025 15:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/Gb=Y7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uRC94-00060y-73
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:53:14 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 029bd096-4aca-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:53:13 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so2700841f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:53:13 -0700 (PDT)
Received: from gmail.com (140.red-213-97-47.staticip.rima-tde.net.
 [213.97.47.140]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7e980sm11167447f8f.41.2025.06.16.08.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:53:12 -0700 (PDT)
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
X-Inumbo-ID: 029bd096-4aca-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750089193; x=1750693993; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQZpCaGwN67bAjam9mj+oezbvKc88yCztRac3tGbr1g=;
        b=ahxNKTcviVI81Q0UnH+VcQFEzqJdtlZyL0ypHMUPhr2zUxbgapkJ6OxCRMmWVsas2w
         F1BxeSnNSErM9StaGhwHzXH5DzNGYknNe2zJ0ZHuFtY65msk6+Y9sIpc8F/cd/DC5hKP
         o0CFj39sPOariMkmytDz7snQZB5UaDM166YSo7RoVmfAPEeaiWyhuE89lC6S+rqba441
         VP1+FMaIJTlP0t3tRo42KPrOT97bdOrJWSQrJjJkeodOFgrTOzYTjlXHsBAQieMgzWfk
         xV7y7dIxXIkJn39brr+a+3V7CTZae2YNIXq0Ka0nNnvTqbCs5DA9NiyF+5oqFEt6aYfn
         QGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089193; x=1750693993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQZpCaGwN67bAjam9mj+oezbvKc88yCztRac3tGbr1g=;
        b=bnQnLXJgUt5fXLDntMs7KoK6EQsdJy/S7Ti6GzZDV6DlOcCYDCo6tIeAiUTNQYj3Tj
         x3yuiH6de4BbZPulcI7WL0sjsXkLiHFsSpGs5hGwwtrSy+Zeb+1Jog8OjsmZl3eIvdis
         Tfz1XI2Pf2ocsScboVIFfmy5iuLfl3HLcbNkMER45qYGXqnm2zvmvxh9djaqH5dop/Y3
         8rhvl4uWAJfTP7KVxLkPFXW9f65z/oNRZoJahxX87IM0LbTF7DJ1aLIs/SYGbv2mKiKw
         4HdJxSG3ynCAvlqL/N/8pVFyHVC7B4wi//5JxO/MxTzvsHr5hXpreUOUvZ/4gOYjL9CV
         2/Hw==
X-Gm-Message-State: AOJu0YyTuCg02ID7Om98RX8bfTRNZi6zH1y/ZWRsN5NGei+K+dOiz/3U
	+titQAjVsUiUe7EaFflK23EmTscQkHh4B+c6YhqhYn1U8I7RAsQwN1eTLqVt5mb+mjs=
X-Gm-Gg: ASbGncuZk5BRiKKBUDPjTbJRHXCBbG4MDUtBmEUNVRiHcUkWtWVUyU6EyKk5N06et6I
	szSW4YEh4MctgvpZfHGEyH8g9ZXW3QifAmKWzpamwHPBBIHq7oemeI7V61QIXXYf7V/vPENnwKs
	m8hszjo6rlhiWmUIqBRM8Ss0hub4YHtHa69T+D7LabtJDETTjl9Wfzq4+xEd4q81sGx8vmXagp+
	wC2HGxBaa3y63ImzWgIozwhwj5jj9AqBhakRar7IgyRQmdm4Lx6PkRZri49FX7Qttmbu8Zt5ADO
	gxxU6Nq25ZGMAd20vDMK2X0D3GIsDyzyLDueAgiQnudx0Wheh6KG77p+lUytw1S/JVP3ks+p+8n
	d/x6frt2JgU4XXZKqmEXZ4gPW8NrbAs8fPVfcNJVU5tw=
X-Google-Smtp-Source: AGHT+IHpvPp+/8SnXYZTtAz5euhAKk5EDZjL7senbpc2uPA0sxOxDiKrHxkM2fe273b0KhcegmhPuQ==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr7650682f8f.4.1750089192632;
        Mon, 16 Jun 2025 08:53:12 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	rosbrookn@gmail.com,
	gwd@xenproject.org,
	edgar.iglesias@amd.com
Subject: [PATCH v5 5/5] tools/golang: Regenerate bindings for trap_unmapped_accesses
Date: Mon, 16 Jun 2025 17:53:06 +0200
Message-ID: <20250616155306.405257-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616153826.404927-1-edgar.iglesias@gmail.com>
References: <20250616153826.404927-1-edgar.iglesias@gmail.com>
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


