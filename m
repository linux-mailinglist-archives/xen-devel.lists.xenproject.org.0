Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085032ACC6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92645.174663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGb8-0008Ik-Om; Wed, 03 Mar 2021 01:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92645.174663; Wed, 03 Mar 2021 01:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGb8-0008I9-KX; Wed, 03 Mar 2021 01:46:46 +0000
Received: by outflank-mailman (input) for mailman id 92645;
 Wed, 03 Mar 2021 01:46:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGb6-000841-QR
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:44 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 556a758a-1727-4bff-b2e1-6901913f52b8;
 Wed, 03 Mar 2021 01:46:28 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id a9so7952555qkn.13
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:28 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:27 -0800 (PST)
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
X-Inumbo-ID: 556a758a-1727-4bff-b2e1-6901913f52b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=NeaXDX2+Mvblx3YuOcY75d5cOiV30GS5wta6XWp6vVQ=;
        b=UkhmaFMyBysZaPiAAYUmbOmltiOZOyDhe1ox99Y69kNnkPCuhwwJOHv8A2PZZqtxqP
         qhlMrxz7U8kvTlZZLwP6SZ1+4IMe0JPc2ssj/HhxOoUSrltNcpWQu6cod57znEDiOeoe
         EVgoQ6UIqwphXFthBz+S32DBCGiaOkAwRnbqi46qn0tSixAIPn75XGa+ybZjQhbWC1fk
         cTNUvM4rc7CQjW9qX13O0JriI3RxH47QuCtSPTPJYXzJWH4pxIAVoK7A9bVn8UOxK0j2
         IofhyF0li2QQWx9coiCYno0gyDFf5rYT7lhA8/BjibimPxz+m9ojttBEeXYSS5bPkaLf
         Uz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=NeaXDX2+Mvblx3YuOcY75d5cOiV30GS5wta6XWp6vVQ=;
        b=fVHjK2hlmFDuko2wKGcVH3+Doqe7Nw6HTPkawPkxVsHnV5AE7mxDE1OrZBgbbNS2k0
         Spb6Gk7cmJ2cXKLErnyxUcAEjnaC8k4GCZuNrBYcwEZzIuhDpSGHTYGskvEkdDauoTl9
         vdd3WfmItDbT3w/AfzbLgV0NmlHXVCx1bVvis5L86IMgl0fgYOdQEKzMVwtokEOfYk05
         kVTlcq1KNSw4ai7izgxVlb6Nrt+FOKe3813od6EXbz9F4+4Pp7063yXMiECcbuVHe3hO
         KXd+csmLUwsz0tX/5OuaUsRNjuVHi8XzuElxagdQcDukJStsRoPeErMmZg86KcFJs+Qn
         6HmA==
X-Gm-Message-State: AOAM5326XdwH+NR00x/3lD9S5NJs6F4PMVqu5A2VS/qESYXjmIWZeKtT
	bXqlVaIZZGAlL7yX9qKE8nAlRAHppZBLiQ==
X-Google-Smtp-Source: ABdhPJyV9rkoVg4yxw6X9Mtgp+kwZR51+U7dCKeRs5TxPUaaKEVo6rH5xZGnyMfl7olyd5mCbzeApA==
X-Received: by 2002:a37:ba03:: with SMTP id k3mr15691601qkf.336.1614735988001;
        Tue, 02 Mar 2021 17:46:28 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 4/7] libxl: add DeviceFunction classes to IDL
Date: Tue,  2 Mar 2021 20:46:16 -0500
Message-Id: <5eba989c046387c17549d634841f8215c2fc5893.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

Add a DeviceFunction base class, and Device{Add,Remove,Destroy}Function
classes to idl.py. These classes will allow the device functions to be
generated later in gentypes.py.

The base class, DeviceFunction, extends CtxFunction and adds a domid
parameter to the function's parameter list. When creating a DeviceFunction,
the device parameter must be specified, and extra parameters can be specified
if necessary.

Rather than indicating specific device actions in the DeviceFunction
class, child classes are created for each device function type. Right
now, DeviceAddFunction does not extend the base class. DeviceRemoveFunction
adds the option of specifying 'custom_remove' parameter when custom remove
functions are needed. DeviceDestroyFunction is a child of DeviceRemoveFunction
to inherit the custom_remove attribute.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/libs/light/idl.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/libs/light/idl.py b/tools/libs/light/idl.py
index a8a4768efc..570b168079 100644
--- a/tools/libs/light/idl.py
+++ b/tools/libs/light/idl.py
@@ -379,6 +379,29 @@ class CtxFunction(Function):
 
         Function.__init__(self, name, params, return_type)
 
+class DeviceFunction(CtxFunction):
+    """ A function that modifies a domain's devices. """
+    def __init__(self, name=None, device_param=None, extra_params=None,
+                 return_type=None):
+        self.device_param = device_param
+
+        params = [ ("domid", uint32), device_param ] + extra_params
+
+        CtxFunction.__init__(self, name, params, return_type)
+
+class DeviceAddFunction(DeviceFunction):
+    pass
+
+class DeviceRemoveFunction(DeviceFunction):
+    def __init__(self, name=None, device_param=None, extra_params=None,
+                 return_type=None, custom_remove=None):
+        self.custom_remove = custom_remove
+
+        DeviceFunction.__init__(self, name, device_param, extra_params, return_type)
+
+class DeviceDestroyFunction(DeviceRemoveFunction):
+    pass
+
 def parse(f):
     print("Parsing %s" % f, file=sys.stderr)
 
-- 
2.17.1


