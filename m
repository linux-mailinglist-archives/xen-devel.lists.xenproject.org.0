Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB71E04E7
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3CR-0004LJ-Ib; Mon, 25 May 2020 02:50:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3CQ-0004L8-Id
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:50:46 +0000
X-Inumbo-ID: 884632d8-9e32-11ea-9887-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 884632d8-9e32-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 02:50:46 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id l3so7511743qvo.7
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ds4Pyg1znJ3S0Yg3vWRMgNmyuvMQ1euqy6dagIketK0=;
 b=L6qXpcjjOcA1qYvY32zs5lbEBNrn4lYO4CNDF/NB7xae9LlITGYHYax3YmsIOiM+Sp
 jtSgD7NFMXilhhjJvcKaB3m53Bb3FHtw1MTeTrtnjfcdm0gDch061xr58+AaSlt2JGay
 E7v7NdpspaHZnLR2/3kVuluY4k5xPHwNyG8bb8yjNZALerzj8ZK/4p7Fqr2Fjo0Htb2R
 b65Ga0UDcyvOLQMMAp56Db8WjfO2k7mIKbwSOxxIcYrkADN0d3kt3FZ5eElN0wMmRrI9
 f29GsizKwpS0oNNoiBwWDbcBLnsafwZw0tyT8JfD0eGotV1EQw7nS9eN7TlY5BmZb+Yd
 6NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ds4Pyg1znJ3S0Yg3vWRMgNmyuvMQ1euqy6dagIketK0=;
 b=Vm+n91htwbg7m5fqhnwN+iCew+vnvZjHFIadjLuAzhVFM93aDAV5xels6jX6Cs/+ak
 HPWmV1/5iKC3fPjtWmTw8ZFYiIWPFgbtK/6VZHOIRp6JiCVCNaNT9hETcjgIbOiurkky
 zCMjwjLd2d/ThBx5Ak9ZVVK7RoWsGnts5HlXD7kFcM0DEptyDPWfcvT1mg5hUiQADBYp
 OiKBe2VwiQA8O5qcphxCAsuSVqZ6Xg89Q3x0gAExtvOLvS1sGFZgW07KVHrP6cwHZ2JT
 wZ77pvMRtwtT9rYQItfmoOdmgRXoaUFGSylrmK5DQG3kIKF5sEzdnDixT/6k2iOP+qLe
 dl9w==
X-Gm-Message-State: AOAM533Vbfo7248m7BGsCGGTwEgOznCy/WRVhg4NeRtfPk+dLFNwTI2h
 rHLRLl9S116A9YDbEArbdskogCuD
X-Google-Smtp-Source: ABdhPJwVY4tyeXHUFHKqVTHep4vSGYq3+fpnSZ41i5Zzo0H8ntsDwuXfy/s0AQhbGmkAQpLlA5F9mg==
X-Received: by 2002:a05:6214:8e4:: with SMTP id
 dr4mr13187822qvb.97.1590375045443; 
 Sun, 24 May 2020 19:50:45 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:50:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/8] Coverity fixes for vchan-socket-proxy
Date: Sun, 24 May 2020 22:49:47 -0400
Message-Id: <20200525024955.225415-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series addresses some Coverity reports.  To handle closing FDs, a
state struct is introduced to track FDs closed in both main() and
data_loop().

Jason Andryuk (8):
  vchan-socket-proxy: Ensure UNIX path NUL terminated
  vchan-socket-proxy: Check xs_watch return value
  vchan-socket-proxy: Unify main return value
  vchan-socket-proxy: Use a struct to store state
  vchan-socket-proxy: Switch data_loop() to take state
  vchan-socket-proxy: Set closed FDs to -1
  vchan-socket-proxy: Cleanup resources on exit
  vchan-socket-proxy: Handle closing shared input/output_fd

 tools/libvchan/vchan-socket-proxy.c | 164 ++++++++++++++++++----------
 1 file changed, 106 insertions(+), 58 deletions(-)

-- 
2.25.1


