Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FA1C26C2
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 18:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUufT-00014Q-Fv; Sat, 02 May 2020 16:07:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUufS-00014L-Dn
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 16:07:06 +0000
X-Inumbo-ID: f7b73a14-8c8e-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7b73a14-8c8e-11ea-b07b-bc764e2007e4;
 Sat, 02 May 2020 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XXC8DGMWkMGF7BQd7M647PKodx+HoA9G+1TKVa1kGOs=; b=hGqXa86aIBJir8+lxov5b9R1sa
 J12iDNGBF2AjT2VKrsyyqxeBzi9UOjW/WxQ5PFkkPluHZrRQYMNqgQviXdz1/pgJj/YNt9KvZZai9
 Y0fycBclKU47PU0E8rIBvQXvbxylVWTqh1hgCuK+4wIKdJvGlQ+rBco5/JJmj4DU5y1k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUufQ-0000pi-Oj; Sat, 02 May 2020 16:07:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUufQ-00054b-Co; Sat, 02 May 2020 16:07:04 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 0/3] Rework {read, write}_atomic()
Date: Sat,  2 May 2020 17:06:57 +0100
Message-Id: <20200502160700.19573-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series is:
    - Hardening write_atomic() to prevent writing to const pointer
    - Allow {read, write}_atomic() to be used in more cases on Arm.

While this was posted after the last posting date, patch #1 is
necessary to avoid the cast introduced by Juergen in [1]. The rest of
the patches would be good hardening to have in Xen 4.14. So I would like
to request the full series to be included in Xen 4.14.

Cheers,

[1] <20200430152848.20275-1-jgross@suse.com>

CC: paul@xen.org

Julien Grall (3):
  xen/arm: atomic: Allow read_atomic() to be used in more cases
  xen/arm: atomic: Rewrite write_atomic()
  xen/x86: atomic: Don't allow to write atomically in a pointer to const

 xen/include/asm-arm/atomic.h | 77 ++++++++++++++++++++++++++----------
 xen/include/asm-x86/atomic.h |  2 +
 2 files changed, 59 insertions(+), 20 deletions(-)

-- 
2.17.1


