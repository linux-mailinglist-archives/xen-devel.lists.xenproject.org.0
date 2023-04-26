Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE726EF6F7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526748.818684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcS-0000wh-TJ; Wed, 26 Apr 2023 14:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526748.818684; Wed, 26 Apr 2023 14:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcS-0000uF-Oc; Wed, 26 Apr 2023 14:59:44 +0000
Received: by outflank-mailman (input) for mailman id 526748;
 Wed, 26 Apr 2023 14:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcR-0000cE-4i
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:43 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f96807f5-e442-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 16:59:42 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so4529844f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:42 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:40 -0700 (PDT)
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
X-Inumbo-ID: f96807f5-e442-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521181; x=1685113181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmERS2liqEHDrbW1Ycwm/uU3R2wj9QakSk+FoH5C6bM=;
        b=ilPmWn7nj10VuZmEUluxGvctuWIjxS03O93jjXKqnhTefPbgbOzlLw78W3PZFPE4my
         c8bBGm6m1WFL0Y1ObwSX+3QNp5ORWDjKO22n461KjhoPhB61kwL6n2NEhe7JxVuh275P
         qqyYVXkgzuGPU7NqeyXr0wcExx11XL2JspYSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521181; x=1685113181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmERS2liqEHDrbW1Ycwm/uU3R2wj9QakSk+FoH5C6bM=;
        b=XXln4e7H2B8ZCA9jqxHJdrSAO7LaRmEiOhJtCmS8hxWfygHvraJQFTjlU+6gBYcvWZ
         Nc/doUfHJRL8sigqyukHIdYu2ym+2zYK7F4T1cvmR2YBYGlPPNWIvT5xI2215b2G3jRj
         24loZkK8L5jlmfCV3M5Qc4hr/BIZxnXLigEjNXNslAfvDtSN50vyE5CsOTcbmtN68GE+
         ZB3GIwEowdsdP4+8/Ky3lCPCECPEc518YJZRF9/X0lF4NrJeDi+QX8XyDtjOe7vhc11C
         ZNYP83GLIWTWUKR2DhwGBQNwptY7E9m9FyFOT6H70sNSGwXT1nrAup7loUq80d8AIEg5
         AI5w==
X-Gm-Message-State: AAQBX9f1llVT3tvrpCHe+QAnNm5Nx7oBOn3kgryw3D9j+eqA/EtI+RCa
	xen3R829Wmh8gygnsXo9LxYddP4L3FCXs1w7cHk=
X-Google-Smtp-Source: AKy350Zh87+7rMSV0zQ/4l32i4gMVMhSQBMrhTpfpjG0umZMEvTPcYok0gQh6j/HB8qcGkoE4rXcFA==
X-Received: by 2002:a5d:4e01:0:b0:304:6715:8728 with SMTP id p1-20020a5d4e01000000b0030467158728mr10762186wrt.18.1682521181193;
        Wed, 26 Apr 2023 07:59:41 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/7] tools: Create xc_domain_getinfo_single()
Date: Wed, 26 Apr 2023 15:59:27 +0100
Message-Id: <20230426145932.3340-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's a stricter version of xc_domain_getinfo() where the returned domid
always matches the requested domid or the error code shows an error instead.
A few patches ahead usages of xc_domain_getinfo() are removed until only
xc_domain_getinfo_single() and xc_domain_getinfolist() remain.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h     | 16 ++++++++++++++++
 tools/libs/ctrl/xc_domain.c | 22 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 90b33aa3a7..73b07955c6 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -696,6 +696,22 @@ int xc_vcpu_getaffinity(xc_interface *xch,
 int xc_domain_get_guest_width(xc_interface *xch, uint32_t domid,
                               unsigned int *guest_width);
 
+/**
+ * This function will return information about a single domain. It looks
+ * up the domain by the provided domid and succeeds if the domain exists
+ * and is accesible by the current domain, or fails otherwise. A buffer
+ * may optionally passed on the `info` parameter in order to retrieve
+ * information about the domain. The buffer is ignored if NULL is
+ * passed instead.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domid to lookup
+ * @parm info Optional domain information buffer (may be NULL)
+ * @return 0 on success, otherwise the call failed and info is undefined
+ */
+int xc_domain_getinfo_single(xc_interface *xch,
+                             uint32_t domid,
+                             xc_domaininfo_t *info);
 
 /**
  * This function will return information about one or more domains. It is
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e939d07157..3ff91023bf 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -345,6 +345,28 @@ int xc_dom_vuart_init(xc_interface *xch,
     return rc;
 }
 
+int xc_domain_getinfo_single(xc_interface *xch,
+                             uint32_t domid,
+                             xc_domaininfo_t *info)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_getdomaininfo,
+        .domain = domid,
+    };
+
+    int rc = do_domctl(xch, &domctl);
+    if (rc < 0)
+        return rc;
+
+    if (domctl.u.getdomaininfo.domain != domid)
+        return -ESRCH;
+
+    if (info)
+        *info = domctl.u.getdomaininfo;
+
+    return rc;
+}
+
 int xc_domain_getinfo(xc_interface *xch,
                       uint32_t first_domid,
                       unsigned int max_doms,
-- 
2.34.1


