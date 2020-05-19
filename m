Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D11D8D69
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarVP-00015l-22; Tue, 19 May 2020 01:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarVN-00014l-NM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:57:17 +0000
X-Inumbo-ID: f36e41b8-9973-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f36e41b8-9973-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 01:56:27 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o19so9895427qtr.10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXBQgi2sAye4H55aK3umMyFvWsC+VqqA4xSnBHzfcsA=;
 b=mU+6BsnXFny2vtjKJ7i2MqzmjsByZT7LuGqKAmoJxuA8CfzxfN68x19jSieBJ9mFvy
 sH7P/lMzGGLi7uGGAx+jhC0nEko/+P2bZWYr7+SxqPqEi6XSQ2CgzAaIhOJYOcgHpvKG
 Prfgt9bJ6k1IHH8YuyPXhKNvYX+GdoNAZvn3lkPm/qjZ8uHGFi0Us8OXTMLJcXUSsSTg
 owlWvUDk/l2/FHzsjFVj4UkeZqINJ5mge2RFk6PV304ssF6OyVmKqMIDRsDGuQPo5BXv
 CVA1oXOqw8ZmaXYXIPnoak4/to9zpCRJS6R+OOyfIxYkNLfdCoIi2XWTwZKkWCMwCEaP
 9Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXBQgi2sAye4H55aK3umMyFvWsC+VqqA4xSnBHzfcsA=;
 b=qHYMRcivoubHaHddF5HOAs+FFjb0hOLNwknqFP+VnMO/18181IUN28bKZHHm0CmVPj
 +zMKNb32oh91eEw+3BImrpCFhtFV0mUvKQm2w+hZRiXg96SLgjOY1qY7VZthrCP9XFLT
 z3a8hXNgOoy3pH0BCdrDFy5Ayh6gi2zcs+45hzIvLJwMABVzpHPh264lBBUHohQLtwa3
 nR7eMAd1hOFbPZK4+IRiLNg9yFYv6poAyhkhNur0rkLE7kHL6XltsxBrPpbNKL0EW/jy
 vtxYj4pj+m34k6HTcZ7Z39rtPVMA1qXUhUmRkzmppmFaI7PYkUBLzGJRD2Tsa4FauZem
 I2Eg==
X-Gm-Message-State: AOAM533Uq1ciD8pMPsQHOMd3dS44KIpnkmfUCyZmRiPe8M9eWzKP7jy1
 rlDGLmR20mn/k2TAgLr66EgBB0cK
X-Google-Smtp-Source: ABdhPJyOiC2OceB9Rb7cENPNDP6xt/sf5xjwv66y7Sna7Gqonzk3hgNejlfWlv7lb7Of+q2Ktn2LQw==
X-Received: by 2002:ac8:3693:: with SMTP id a19mr12844368qtc.226.1589853386733; 
 Mon, 18 May 2020 18:56:26 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:25 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 18/19] docs: Add device-model-domid to xenstore-paths
Date: Mon, 18 May 2020 21:55:02 -0400
Message-Id: <20200519015503.115236-19-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Document device-model-domid for when using a device model stubdomain.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 docs/misc/xenstore-paths.pandoc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index a152f5ea68..766e8008dc 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -148,6 +148,11 @@ The domain's own ID.
 The process ID of the device model associated with this domain, if it
 has one.
 
+#### ~/image/device-model-domid = INTEGER   [INTERNAL]
+
+The domain ID of the device model stubdomain associated with this domain,
+if it has one.
+
 #### ~/cpu/[0-9]+/availability = ("online"|"offline") [PV]
 
 One node for each virtual CPU up to the guest's configured
-- 
2.25.1


