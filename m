Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BD1F6087
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDv1-0007xi-SS; Thu, 11 Jun 2020 03:30:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDuz-0007xd-VV
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:18 +0000
X-Inumbo-ID: deb0e65e-ab93-11ea-b7bb-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deb0e65e-ab93-11ea-b7bb-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:17 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j32so3581374qte.10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q8ajjPfNfXlfaUIObFCSSsRlFcGxHZregYc1KnoZkdc=;
 b=i+VgovDkfnd3LziCf0T4rcJ1hWApwbSLh0MfmvJcOzLB4Bgdcb+uPGtT0Eg/pnizet
 7AJcwyHds+zaVoARrwjx5aG2szCcid542NLO+g5jM6P+bTgHavq5LzmXN+z8uX1tNs43
 +YM3DFDWocC1subzOxgnD6h+GN8Ryboqp8KKacly1lMaYoVuySVmaAVepvS3hwGBgMG2
 kOVHh68jNx3iS3OTKuDhESHsz1B2Jovfk2SEtzRXsD2PpBVq22+9mqAbuaLrHMDeSGSZ
 SJV2keiUoo+la+xwFGP4dLudBNSctcJP4aGPXegNWCJyzi2b4LkwrK4sVC7gWEmWzFgu
 URNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q8ajjPfNfXlfaUIObFCSSsRlFcGxHZregYc1KnoZkdc=;
 b=RWIf3dpajvHOVZol8JqibrRyVGKp/hRAVIXfdGvGCBVj2fYzh1BSsGItyn0pVE/sq5
 QY6/j+gg+dVLSRrnpW9L+hgXokyzydtu/Bm2TVAKdzfhJ7HEPyfMbM+dMx0OOS3mOUhB
 gdE2gjDq0x9tUfBepvelagqCY2IkZedNh6qkSQ1v66GX3RlifvUeouWr7baH8A3HXKKu
 nwcBKk4IBHvrT+hW3U2veiTYI9cl4BbB6Cg2GLB6lHL+PeL8n1C5A0fz5O4eW1yA5HkC
 yw/qBd6LlsdSyszP6c5qGJMxQj0yk96z/yFy4XyMtd+/4/6MnoAmwprmlcb35xpPDxAL
 Vg7A==
X-Gm-Message-State: AOAM530S4Y4baurwDOrRXYEoBprDCRvAv4LujxaBISgC+qGFEw0YzHyE
 uFvtjrMnFrktwrSEwnZj2aLLbyu0
X-Google-Smtp-Source: ABdhPJwNq26gIu0+54W7Z2GYJT9hIjdtpKfesEulzEowTtm7uhlhG/NQWxK07dRBg7/YOJIYEgIraQ==
X-Received: by 2002:aed:35fa:: with SMTP id d55mr6440367qte.385.1591846216558; 
 Wed, 10 Jun 2020 20:30:16 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 00/10]  Coverity fixes for vchan-socket-proxy
Date: Wed, 10 Jun 2020 23:29:26 -0400
Message-Id: <20200611032936.350657-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series addresses some Coverity reports.  To handle closing FDs, a
state struct is introduced to track FDs closed in both main() and
data_loop().

v2 changes "Ensure UNIX path NUL terminated" to avoid a warning with
gcc-10.  Also, "Move perror() into listen_socket" and "Move perror()
into connect_socket" are new.

Jason Andryuk (10):
  vchan-socket-proxy: Ensure UNIX path NUL terminated
  vchan-socket-proxy: Move perror() into listen_socket
  vchan-socket-proxy: Move perror() into connect_socket
  vchan-socket-proxy: Check xs_watch return value
  vchan-socket-proxy: Unify main return value
  vchan-socket-proxy: Use a struct to store state
  vchan-socket-proxy: Switch data_loop() to take state
  vchan-socket-proxy: Set closed FDs to -1
  vchan-socket-proxy: Cleanup resources on exit
  vchan-socket-proxy: Handle closing shared input/output_fd

 tools/libvchan/vchan-socket-proxy.c | 183 ++++++++++++++++++----------
 1 file changed, 119 insertions(+), 64 deletions(-)

-- 
2.25.1


