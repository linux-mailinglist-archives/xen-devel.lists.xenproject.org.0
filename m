Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FCD8AAD2C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708979.1108221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlyD-0004tI-Qb; Fri, 19 Apr 2024 10:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708979.1108221; Fri, 19 Apr 2024 10:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlyD-0004r5-Nr; Fri, 19 Apr 2024 10:59:53 +0000
Received: by outflank-mailman (input) for mailman id 708979;
 Fri, 19 Apr 2024 10:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxlyC-0004qv-Fw
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:59:52 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2244866-fe3b-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:59:51 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34a3e0b31e6so981279f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:59:51 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d678d000000b003462b54bc8asm4124418wru.109.2024.04.19.03.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:59:50 -0700 (PDT)
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
X-Inumbo-ID: f2244866-fe3b-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713524391; x=1714129191; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+86u8cP5WKiv7OHOhZqMvo/xywY+1Pp+VEDWuQLISU=;
        b=azuPqHGi6j0JxXPLyR3+VOvlWqqmLS/g+6ePacgv4xQF2+hOzt7/TbvksttM4Lidm0
         0cfvEEnvpmLIY1BWL+ILcd591FakClYp/nqDkqycxzqNhxvmGtsiXQnC8YO6ysH7s3V5
         xXZUZSc8f2PFaaeGQp3wzR5hD2fi8SMKSL3uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524391; x=1714129191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+86u8cP5WKiv7OHOhZqMvo/xywY+1Pp+VEDWuQLISU=;
        b=ftEXBRJEV1f4hShRNWLvmoSBPx2iENwx6DtYa8kMgUurbA47p93i7emY2sFsi9Slav
         SXb1ioKc7CnTgL1jNhLkYnpkIJSBno9Bswq+yiRQYVw4Z07yomLZywYQUWmcZQIelrfA
         P0R/WOpYjEkzFKE+IeS02f8bxh4tnlFfe2pmN5UUOCdwPLELhpadf74kCGldPE7x7lYd
         MEBJ36Qai4q/fwNLASeyEN+6WdVRSXki8XgxKnr5exwQaiZWi9PS7Bbrq+9G9Sf9UndU
         f6I6c6x2bWkP3+n9IForGO9gOIdOSOYaRjkoFZUIskuWa5lwivw8RrANlJ00S3cVcO33
         pqhg==
X-Gm-Message-State: AOJu0YyCyGoW8hOMOBuiMVxo28Et/Uxp6MY8iw6oy0xuIEasm1Crw51s
	eu7YnxXUh+8FNIHoyrzsYw7Ov2eH9s6P4dxl8haoi0BIWAtPqoZNXSI4dYoc2FBLOvNeG7KLfCM
	m
X-Google-Smtp-Source: AGHT+IHRRlFbhMTVpeYOK5hv7CmkcAxeSRgFNBI/XKCRgO0jb4SxhxzjAWepTBVuDET36QuAHbUSUg==
X-Received: by 2002:a5d:59a7:0:b0:34a:7a97:77d5 with SMTP id p7-20020a5d59a7000000b0034a7a9777d5mr186954wrr.26.1713524390529;
        Fri, 19 Apr 2024 03:59:50 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Tobias Fitschen <tobias.fitschen@posteo.de>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/3] tools/golang: When returning pointers, actually allocate structrues
Date: Fri, 19 Apr 2024 11:50:35 +0100
Message-Id: <20240419105037.700283-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a handful of cases, it was decided to return a pointer to a
structure rather than the plain structure itself, due to the size.
However, in these cases the structure was never allocated, leading to
a nil pointer exception when calling the relevant `fromC` method.

Allocate structures before attempting to fill them in.

Reported-by: Tobias Fitschen <tobias.fitschen@posteo.de>
Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
This has been compile-tested only; Tobias, I'd appreciate a test if you get a chance.

CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/xenlight.go | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index a45c636952..d793f172e5 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -999,6 +999,7 @@ func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 		err = Error(ret)
 		return
 	}
+	physinfo = &Physinfo{}
 	err = physinfo.fromC(&cphys)
 
 	return
@@ -1010,6 +1011,7 @@ func (ctx *Context) GetVersionInfo() (info *VersionInfo, err error) {
 
 	cinfo = C.libxl_get_version_info(ctx.ctx)
 
+	info = &VersionInfo{}
 	err = info.fromC(cinfo)
 
 	return
@@ -1027,6 +1029,7 @@ func (ctx *Context) DomainInfo(Id Domid) (di *Dominfo, err error) {
 		return
 	}
 
+	di = &Dominfo{}
 	err = di.fromC(&cdi)
 
 	return
-- 
2.25.1


