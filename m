Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042417E281D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628135.979267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AF-00006Q-7P; Mon, 06 Nov 2023 15:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628135.979267; Mon, 06 Nov 2023 15:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AF-0008OE-3Z; Mon, 06 Nov 2023 15:05:19 +0000
Received: by outflank-mailman (input) for mailman id 628135;
 Mon, 06 Nov 2023 15:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AD-000893-As
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4d616d2-7cb5-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 16:05:16 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4083f613275so34133525e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:16 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:15 -0800 (PST)
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
X-Inumbo-ID: e4d616d2-7cb5-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283115; x=1699887915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRK5wV0p3XK/zB6bzaQicMvY21LdOakLo9+vF3VIjHw=;
        b=UWV17fW+ctiXRL6URYf0akj+iraMAytVnugFX7wFd7UQUWGXcRFxY+XDhehGBFXy0t
         QvwS9j0ia/KUoD94zq72Nae3vhme4ZYQgUihBLFUi9utlyD57lPNF5Nnwl1yEGm62z/V
         bI1o5HL7/IW9z/81dcqJ5pJZftZJDoNvE5zRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283115; x=1699887915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRK5wV0p3XK/zB6bzaQicMvY21LdOakLo9+vF3VIjHw=;
        b=kX/RqYcmbrPGQn2RUPJeFBTaZcBY9qZaK4LwAd3shAH83vcsnuAWmo9ZdJlR6H1uLx
         w86pOHdSRAqy8JqspGOwm52iRZzcQUEGH1TQ91MUR74T6bdGTpOWpP4K7y8h2Kyr1uiQ
         vhQ19K7f5ItDSs1ipPTeE4lmY8w9bLDCQCLS0d3oRBObXPNus3VRZo/415t6ALSTC1Sv
         l7I3Nd66AjcB1huvaMn9pruuSCeVBh8vRWKUf1fAtnCrvVPZWHqKx5/xBxt/qFv9VYyY
         f06WUi3L3tMFz1zgfclSxLwbvPd1k+rmHFZFdLlRzkrqmUkhxK2Z2AWLwZ98pkGDQOoY
         eQ0A==
X-Gm-Message-State: AOJu0YzPyfbhtpwX8pFM9XcQyXaTl7XiUYfjQ1wEmCChz7tL0gqt0PcQ
	cp37behFPjJPgPm14tCldvq1OXWWleRQQbqbreQ=
X-Google-Smtp-Source: AGHT+IG18h4uGdSyUknwafJjm6DBdq+5DvkA9UzKtHFfxAq/HwAKalRu7cbbWqCtuHf/w/f+LVM1nw==
X-Received: by 2002:a05:600c:4fd1:b0:408:80bb:ae80 with SMTP id o17-20020a05600c4fd100b0040880bbae80mr25137238wmq.7.1699283115679;
        Mon, 06 Nov 2023 07:05:15 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 5/6] tools/pygrub: Expose libfsimage's fdopen() to python
Date: Mon,  6 Nov 2023 15:05:07 +0000
Message-Id: <20231106150508.22665-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a wrapper for the new fdopen() function of libfsimage.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/pygrub/src/fsimage/fsimage.c | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/pygrub/src/fsimage/fsimage.c b/tools/pygrub/src/fsimage/fsimage.c
index 12dfcff6e3..216f265331 100644
--- a/tools/pygrub/src/fsimage/fsimage.c
+++ b/tools/pygrub/src/fsimage/fsimage.c
@@ -270,6 +270,30 @@ fsimage_open(PyObject *o, PyObject *args, PyObject *kwargs)
 	return (PyObject *)fs;
 }
 
+static PyObject *
+fsimage_fdopen(PyObject *o, PyObject *args, PyObject *kwargs)
+{
+	static char *kwlist[] = { "fd", "offset", "options", NULL };
+	int fd;
+	char *options = NULL;
+	uint64_t offset = 0;
+	fsimage_fs_t *fs;
+
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|Ls", kwlist,
+	    &fd, &offset, &options))
+		return (NULL);
+
+	if ((fs = PyObject_NEW(fsimage_fs_t, &fsimage_fs_type)) == NULL)
+		return (NULL);
+
+	if ((fs->fs = fsi_fdopen_fsimage(fd, offset, options)) == NULL) {
+		PyErr_SetFromErrno(PyExc_IOError);
+		return (NULL);
+	}
+
+	return (PyObject *)fs;
+}
+
 static PyObject *
 fsimage_getbootstring(PyObject *o, PyObject *args)
 {
@@ -302,6 +326,13 @@ PyDoc_STRVAR(fsimage_open__doc__,
     "offset - offset of file system within file image.\n"
     "options - mount options string.\n");
 
+PyDoc_STRVAR(fsimage_fdopen__doc__,
+    "fdopen(fd, [offset=off]) - Use the file provided by the given fd as a filesystem image.\n"
+    "\n"
+    "fd - File descriptor to use.\n"
+    "offset - offset of file system within file image.\n"
+    "options - mount options string.\n");
+
 PyDoc_STRVAR(fsimage_getbootstring__doc__,
     "getbootstring(fs) - Return the boot string needed for this file system "
     "or NULL if none is needed.\n");
@@ -315,6 +346,8 @@ static struct PyMethodDef fsimage_module_methods[] = {
 	    METH_VARARGS, fsimage_init__doc__ },
 	{ "open", (PyCFunction)fsimage_open,
 	    METH_VARARGS|METH_KEYWORDS, fsimage_open__doc__ },
+	{ "fdopen", (PyCFunction)fsimage_fdopen,
+	    METH_VARARGS|METH_KEYWORDS, fsimage_fdopen__doc__ },
 	{ "getbootstring", (PyCFunction)fsimage_getbootstring,
 	    METH_VARARGS, fsimage_getbootstring__doc__ },
 	{ NULL, NULL, 0, NULL }
-- 
2.34.1


