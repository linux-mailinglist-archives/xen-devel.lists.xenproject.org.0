Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE032ACC9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92648.174688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGbI-0008So-Ds; Wed, 03 Mar 2021 01:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92648.174688; Wed, 03 Mar 2021 01:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGbI-0008S5-8z; Wed, 03 Mar 2021 01:46:56 +0000
Received: by outflank-mailman (input) for mailman id 92648;
 Wed, 03 Mar 2021 01:46:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGbG-000841-QY
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:54 +0000
Received: from mail-qv1-xf30.google.com (unknown [2607:f8b0:4864:20::f30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4152de8a-57c6-46b6-b772-e48621250722;
 Wed, 03 Mar 2021 01:46:31 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id n4so8641165qvl.4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:31 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:30 -0800 (PST)
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
X-Inumbo-ID: 4152de8a-57c6-46b6-b772-e48621250722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ZBxo1ZZtGeZ/L0BM6vs2MRgDVAvnnL5QuvziUxZ+Mfs=;
        b=c/2/ARFN73/sZw/qonXPJ2alnC439EgjDE8nnYjsOEMkYU2zIXXiC60l8Jj5+SUVhV
         fPj6546TNsAxyqjYIg5iWcCUZREnxfsSx/bvLwg7x/QNEPySiTPAY6dsyB3LWdiP1WWd
         z+V/cLGCaFLjpnMNGUKZvneTiiNp7J2IVu3z/KTGAKtr9JXPecQq93znBsho5hb0TwuQ
         modv5t4aFo28hQ7mJeZM6q6dVrEGTxvYvRBDCfLro/cVVfn+2qyZIZoG0AJ0N5YcLHWo
         DHxI7365kLhovX0jQ40Cqg+lQHqOHym2iU5d+JbYJYWSXzCnqVnLYLrA7S09C/CvuhnQ
         v/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ZBxo1ZZtGeZ/L0BM6vs2MRgDVAvnnL5QuvziUxZ+Mfs=;
        b=kg6/j2gRJk+Dqti3F8juVU5u8VSCEUJz82bBCa7H6kQ3x6CN2OSiFGTylFMM3JNDNm
         ZMic6pr3nZApvwBsT1XyRwvciYl0TxocIXvnaJf1VcP0hO/MFUUuMw5C3xvgHyra1Jgt
         edBYHWmwLsZWDR2J5kdyW21WqNbUVNA0mcok0F0WNY3JFzvKYH0eBk5Oiyjz2vRIhXIT
         nKPHZM65j+a1mY5FGjKQfIsbVcPNE+Q0eoiWXlzPiuc7puVghU4JTOBVfw6hkN7vGcbH
         Pr/Q3b31uwMeiFUrhFxGUwTSOc+jMKjj7u0qPj7EelkvRMjrHCIEkiKI1EiKsrJAlJzS
         U7kQ==
X-Gm-Message-State: AOAM533ctJN9f5sLHfrBSMSQsEzu4m3tip2EdcOVBo3V+Md4/3xohpyy
	2D4BPbjQCWtCUlvjODIkDJs+mBKfEbX2hg==
X-Google-Smtp-Source: ABdhPJwtuYq4lWi8WRY/KMlmq6VazCxMaPD9FCMWX5jPelkPzARQ/yVIFSB+00K4jzHx3dUmS6N8zA==
X-Received: by 2002:a0c:c585:: with SMTP id a5mr662605qvj.60.1614735990468;
        Tue, 02 Mar 2021 17:46:30 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 6/7] libxl: implement device add/remove/destroy functions generation
Date: Tue,  2 Mar 2021 20:46:18 -0500
Message-Id: <5986715fe1d677533b67c06e9561cd716716d46a.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

Use the newly added function support in the IDL to generate the function
definitions for the device add, remove, and destroy functions. The
content of the generated functions is taken from the device fuction
macro framework in libxl_internal.h.

For now, the definitions are not actually written out to a .c file, but
are invoked to ensure there is no build regression introduced. A later
commit will replace the existing macros with this generated code.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/libs/light/gentypes.py | 91 +++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index f9957b79a2..9f1856399a 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -584,6 +584,85 @@ def libxl_C_enum_from_string(ty, str, e, indent = "    "):
         s = indent + s
     return s.replace("\n", "\n%s" % indent).rstrip(indent)
 
+def libxl_func_define_device_add(func):
+    s = ''
+
+    return_type = func.return_type.typename
+    if isinstance(func.return_type, idl.Enumeration):
+        return_type = idl.integer.typename
+
+    params = ', '.join([ ty.make_arg(name) for (name,ty) in func.params ])
+
+    s += '{0} {1}({2})\n'.format(return_type, func.name, params)
+    s += '{\n'
+    s += '\tAO_CREATE(ctx, domid, ao_how);\n'
+    s += '\tlibxl__ao_device *aodev;\n\n'
+    s += '\tGCNEW(aodev);\n'
+    s += '\tlibxl__prepare_ao_device(ao, aodev);\n'
+    s += '\taodev->action = LIBXL__DEVICE_ACTION_ADD;\n'
+    s += '\taodev->callback = device_addrm_aocomplete;\n'
+    s += '\taodev->update_json = true;\n'
+    s += '\tlibxl__{0}(egc, domid, type, aodev);\n\n'.format(func.rawname)
+    s += '\treturn AO_INPROGRESS;\n'
+    s += '}\n'
+
+    return s
+
+def libxl_func_define_device_remove_ext(func, action=None):
+    s = ''
+
+    flag = None
+    if action == 'remove':
+        flag = 'LIBXL__FORCE_AUTO'
+    elif action == 'destroy':
+        flag = 'LIBXL__FORCE_ON'
+    else:
+        raise Exception('Unsupported action %s' % action)
+
+    # This is used to formulate the function name libxl__device_from_<devtype>
+    devtype = func.device_param[1].rawname.replace('device_','')
+
+    remtype = 'generic'
+    if func.custom_remove is not None:
+        remtype = func.custom_remove
+
+    return_type = func.return_type.typename
+    if isinstance(func.return_type, idl.Enumeration):
+        return_type = idl.integer.typename
+
+    params = ', '.join([ ty.make_arg(name) for (name,ty) in func.params ])
+
+    s += '{0} {1}({2})\n'.format(return_type, func.name, params)
+    s += '{\n'
+    s += '\tAO_CREATE(ctx, domid, ao_how);\n'
+    s += '\tlibxl__device *device;\n'
+    s += '\tlibxl__ao_device *aodev;\n'
+    s += '\tint rc;\n'
+    s += '\n'
+    s += '\tGCNEW(device);\n'
+    s += '\trc = libxl__device_from_{0}(gc, domid, type, device);\n'.format(devtype)
+    s += '\tif (rc != 0) goto out;\n'
+    s += '\n'
+    s += '\tGCNEW(aodev);\n'
+    s += '\tlibxl__prepare_ao_device(ao, aodev);\n'
+    s += '\taodev->action = LIBXL__DEVICE_ACTION_REMOVE;\n'
+    s += '\taodev->dev = device;\n'
+    s += '\taodev->callback = device_addrm_aocomplete;\n'
+    s += '\taodev->force.flag = {0};\n'.format(flag)
+    s += '\tlibxl__initiate_device_{0}_remove(egc, aodev);\n'.format(remtype)
+    s += '\n'
+    s += 'out:\n'
+    s += '\tif (rc) return AO_CREATE_FAIL(rc);\n'
+    s += '\treturn AO_INPROGRESS;\n'
+    s += '}\n'
+
+    return s
+
+def libxl_func_define_device_remove(func):
+    return libxl_func_define_device_remove_ext(func, action='remove')
+
+def libxl_func_define_device_destroy(func):
+    return libxl_func_define_device_remove_ext(func, action='destroy')
 
 if __name__ == '__main__':
     if len(sys.argv) != 6:
@@ -592,7 +671,7 @@ if __name__ == '__main__':
 
     (_, idlname, header, header_private, header_json, impl) = sys.argv
 
-    (builtins,types,_) = idl.parse(idlname)
+    (builtins,types,funcs) = idl.parse(idlname)
 
     print("outputting libxl type definitions to %s" % header)
 
@@ -794,4 +873,14 @@ if __name__ == '__main__':
         f.write("}\n")
         f.write("\n")
 
+    for func in funcs:
+        if type(func) is idl.DeviceAddFunction:
+            _ = libxl_func_define_device_add(func)
+        elif type(func) is idl.DeviceRemoveFunction:
+            _ = libxl_func_define_device_remove(func)
+        elif type(func) is idl.DeviceDestroyFunction:
+            _ = libxl_func_define_device_destroy(func)
+        else:
+            raise Exception("Unexpected Function class %s" % type(func))
+
     f.close()
-- 
2.17.1


