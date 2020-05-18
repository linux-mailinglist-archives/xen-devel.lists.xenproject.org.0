Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D81D6E82
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:16:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUO0-0000sv-VE; Mon, 18 May 2020 01:16:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNy-0000r9-Td
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:16:06 +0000
X-Inumbo-ID: 0a171162-98a5-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a171162-98a5-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 01:15:19 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id ee19so3960856qvb.11
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXBQgi2sAye4H55aK3umMyFvWsC+VqqA4xSnBHzfcsA=;
 b=Y4CygHC367Xbf5A5hj37oQO+gjLXJALnjUlf1hUo1/p0jZGOddoNrQdqhOv0g1ZRn/
 60HOuxmnDFCU5aoQqaCzo9567/GJoG1e+zjIT40yI2/u2leFRyenK5OA1MKLXVnDVLo6
 GzGVgrKL2WB50cwdsMjkI7FsqEcW6G8RuJpItEzJHiyNfjwF3Wb/7nnbedNNFCrZSUDN
 kbiOBqw2uz0cW6WAwexPdAR8nR0O6cbo74TPxyGD4fQ0x9zxilfa7eirSTBVlE84+k5h
 PFIW4l4glYiBJx7Gcvp9Dqru4Rrb/1IFByUFWFaJzt3opu4EjTZuLxKcgJmbBB4+H1Wg
 /DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXBQgi2sAye4H55aK3umMyFvWsC+VqqA4xSnBHzfcsA=;
 b=epC3mg/fXb9bOaFxGb3qZW0oxhEV/mcy3E7/VBUq0SETKCo8RppZ/NKfWLm3eG4jZH
 pPydwJNy8+GMI/taiE3iidywkhZi3mo9RXo9b5K4s915OY1XypGkSiZG7uHNNKXWE043
 WU0mCwAp6bb1TcKbFcdLcy30vE+2sKMMBPyjeccavCIG7Y+kSrw41LtsUvFJO9aLu/TV
 Fp6911c9FEPhAxyuAgBxoOuNyk5QI4njlc86DyA5H56BWj2mFgBoTjJBCtp2i3/Ei8SI
 IbgpGBzMCEUkLvDMksttBDAdydc2HFXGm8N19fkek3LSvJFWUtSknFysDkCOXO+ajgtj
 DI5A==
X-Gm-Message-State: AOAM532rRcWdS/cAJSfvBHVV0yZ/HbL4WtwIyt9kkniUw8toWdmwpyDn
 UQeoqw0tigoZjJhKme6va4/Ec3VG
X-Google-Smtp-Source: ABdhPJxQGoZ1QAmGwaUzaXiU2hFYeH9LnL6fFqe6WVMNfa04YE+a3N6KoBM2gCiM0CmwlYxZYL1R2A==
X-Received: by 2002:a0c:e488:: with SMTP id n8mr3033916qvl.172.1589764518955; 
 Sun, 17 May 2020 18:15:18 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:18 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 17/18] docs: Add device-model-domid to xenstore-paths
Date: Sun, 17 May 2020 21:13:52 -0400
Message-Id: <20200518011353.326287-18-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
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


