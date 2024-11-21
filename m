Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A349D55D4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 23:52:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841675.1257177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEG1S-0001w0-I9; Thu, 21 Nov 2024 22:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841675.1257177; Thu, 21 Nov 2024 22:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEG1S-0001sv-F7; Thu, 21 Nov 2024 22:51:38 +0000
Received: by outflank-mailman (input) for mailman id 841675;
 Thu, 21 Nov 2024 22:51:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rRg=SQ=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1tEG1Q-0001so-Vc
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 22:51:37 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 264cb036-a85b-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 23:51:31 +0100 (CET)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5ee55fa4b31so800609eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 14:51:31 -0800 (PST)
Received: from ip-172-31-19-182.us-east-2.compute.internal
 (ec2-18-220-54-129.us-east-2.compute.amazonaws.com. [18.220.54.129])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4653c3ee43esm4203971cf.22.2024.11.21.14.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 14:51:28 -0800 (PST)
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
X-Inumbo-ID: 264cb036-a85b-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmQiLCJoZWxvIjoibWFpbC1vbzEteGMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI2NGNiMDM2LWE4NWItMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjI5NDkxLjgwNDQ5NCwic2VuZGVyIjoiYWxleGFuZGVyQGVkZXJhLmRldiIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1732229490; x=1732834290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M5KMmAvOf7yexbO07PqanGNRWx1lbfxWV65SvdMYhlY=;
        b=CdWHpEB32jQMMq64s4pgBPJBzhOMFIDcFa5ESxxNSHz+acWPrgNfv1mumt4OefwATX
         /H0goDZBSyxbCjZYg6RXze7pN5VGWC/pr0yZjWECiTAlfkMnDOVxEeyo7cCzmD+wLy3h
         sYlcnswybD1Zxoh6mFwgmMZq2E2MM2/g5rYWf+cK6HnjoCuDiSM8WfdCLSoX4pFUutO0
         HRgypmBw/cdDQm1+bgJAqaOHMwKt9lODJUTW4XhsiGh10E1VGeZ1EGXv//VaUTveh4Dx
         jRK5hCq4GCDLbQwoEuYz1Hd6/rUh0jd8cCVB61wcjMoYl2OQz112xwsIHie/HwLgl4p5
         ujWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732229490; x=1732834290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5KMmAvOf7yexbO07PqanGNRWx1lbfxWV65SvdMYhlY=;
        b=vTP+liFuQEY7CycxRgCsApX142YOPILtHfGPKvCz+F9+BMrT6DPHGthkwoFjs31GxG
         CdLrpIFkyjSbed4p8rFGGZ37+/YKSxLWnlZOhalPIlr035BjD9+A7muAvVpnj9/rrFkE
         vAGhF6ZMEgPm5gVoukfXXgNG23nK6mykqNLCuaoirgmyvz3nFAgRUfSwztMheCl8H3KU
         8tnnp8uSqXBzXY2S/Bzfb1VIN2VyVr1YzWjB7CpWBDZ2peB6p08ngQ2InZlVqz3fGO1O
         GLOBpbfs+HXFz7Ho6LhFez61uKLni0fwsMS03pDbfsXPP6JlGj3F2DcGr9YUoFgXoAhK
         YjeA==
X-Forwarded-Encrypted: i=1; AJvYcCXy8n4r756MRSbXgmAF+ieC/wzX128MKQfUy9XCixV8gUSqR1y64pBiCLzTaglnllvPz3vVO4+3jB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzW7MN1tjxbGT3lHFdONFi5lyRFMnV6g2MUrTQ5+qeUvqYIoY3G
	JbEb2BDiToQbFs8xukT4+q9zKj+w+Dl9RVwe0gk3xCddviFj2KFWu+JAZSjtFkc=
X-Gm-Gg: ASbGnctWjkiCFYl9xjE7mpoMy26lQckuWHmpq1mk4d8ZFPXnHjKtIlWDiVUBZtdD7Bz
	uq5yYMA26oB6W6dMeLunk/A96QB2nLSWNLYxUNAZDBhT3eJ9taMS8Gl3BpN4hACutzaPwJXAsyZ
	YMK6DkN3VTjyV8VutI+D1+LM0gw1cfJIEXskcEYCTyPbZ4zoh5I9UiOa3IYT1a+anGM4YfkqnWW
	bHZyANHHMQy3HxC0FX/KHOa7gRuXjRxAFGMlm14CLxEUC+vIecdoWfeEh+Bca+npnVf7JLZpNMD
	fJxHfPanUU/CEK4IhbmIlWMSzBhtK53CVYON9BJYdZbQbrrFii5rhrT0dkTeyxIQ9tiBfJg=
X-Google-Smtp-Source: AGHT+IHRfgZ/zJdkaYat35UYAnjiCdb2X4OLEmzJdr9rSEx2OpMGZ9tm7YvUi1s+NAeKvDBAkLpcQw==
X-Received: by 2002:a05:6358:c02a:b0:1bc:7c1c:9fc2 with SMTP id e5c5f4694b2df-1ca7970dff8mr121232955d.6.1732229490351;
        Thu, 21 Nov 2024 14:51:30 -0800 (PST)
From: Alexander Merritt <alexander@edera.dev>
To: v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alex Zenla <alex@edera.dev>,
	Alexander Merritt <alexander@edera.dev>,
	Ariadne Conill <ariadne@ariadne.space>
Subject: [PATCH] 9p/xen: fix release of IRQ
Date: Thu, 21 Nov 2024 22:51:00 +0000
Message-ID: <20241121225100.5736-1-alexander@edera.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Zenla <alex@edera.dev>

Kernel logs indicate an IRQ was double-freed.

Pass correct device ID during IRQ release.

Fixes: 71ebd71921e45 ("xen/9pfs: connect to the backend")
Signed-off-by: Alex Zenla <alex@edera.dev>
Signed-off-by: Alexander Merritt <alexander@edera.dev>
Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
---
 net/9p/trans_xen.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index dfdbe1ca5338..198d46d79d84 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -286,7 +286,8 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 		if (!priv->rings[i].intf)
 			break;
 		if (priv->rings[i].irq > 0)
-			unbind_from_irqhandler(priv->rings[i].irq, priv->dev);
+			unbind_from_irqhandler(priv->rings[i].irq, ring);
+		priv->rings[i].evtchn = priv->rings[i].irq = 0;
 		if (priv->rings[i].data.in) {
 			for (j = 0;
 			     j < (1 << priv->rings[i].intf->ring_order);
-- 
2.43.0


