Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9151D0418
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 02:58:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYfiz-0006GG-Ca; Wed, 13 May 2020 00:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYfiy-0006GA-K6
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 00:58:16 +0000
X-Inumbo-ID: d30b8bb0-94b4-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d30b8bb0-94b4-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 00:58:14 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id v4so11939803qte.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2020 17:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=9QmGMkOR+A+pcuReg/osmrOg0hnPPVtYzNJ/7f6YaNg=;
 b=vbptMo/eBHuIG3SRRrDxBqD1zDbRCFmHucEVmXcE07e1JIMsrNjlAvtlsdrBv+BIrs
 BY3ynre2rZ2nKgSLktlZQH4n7gNfmcn/uKwe86v4sXkacMQuVpVMPnua9f+60d7up7PW
 nUjIOFBc/ZHdAUfyyT68ReP8SYRDbQiPxa189wMYX5j+L8P6XzTD5e89BQRRmhdJ9ApW
 pgI1qefmWNHuETb5XDcqG4qWtJr95nHQmdH58qH5hP2Fm/HT1Nq2Y9qSzLW23ilCGssU
 v1/M1m8bpmEmE2yHtnz/mqEOsVGEvlxVd9MZxcJK0W8avzpYDhvLbjcto/JRTqPCWwd5
 wHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=9QmGMkOR+A+pcuReg/osmrOg0hnPPVtYzNJ/7f6YaNg=;
 b=Ti6eJxBH6UTo8xGDbUlXeMn2piPZqqeOFnC6I9RvCj3xzB7zKkPkxpFiF50y4Z581N
 GjbfwElve7fDjAdHA7+C8VBKUS7mVWwj/oGpn1mwqdfR+2vuaa758yn6LOCpvid6vKFL
 A7Y38ILSD4OKALilRns3F5g3DzHEjiRszfnKxgL6CoBQGHJHzWvZAEBemA7kkKb/+HjL
 mqT3pD5+z1w57Cqt045sZj/nIYJie5O0XVp2XLI1tnB8GNv9xrwbP1WMJbPcU6PwL0sX
 9eiFMK8UaD2D5yuKc0lNtT1fhTZpU/CfS+X8wGdJyYS2ljJsg+3ARNFLchZI0BTWJt/U
 FQwg==
X-Gm-Message-State: AOAM531tUsDeXCoEyWtknDIgN+VvAQSd5cj26lvNVnO4HnmlqdCmd44q
 j2DFWEOrPgSONatoCWwfBKjxjzZifsc=
X-Google-Smtp-Source: ABdhPJyRR0JQaQPyfA0v3+R8gVZAK0qYjKH35eNV0aKR0mDANKcXzAIRb4B32yUg//m2MRiLdpJI7w==
X-Received: by 2002:ac8:6651:: with SMTP id j17mr4960597qtp.35.1589331493712; 
 Tue, 12 May 2020 17:58:13 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id 62sm12400828qkh.113.2020.05.12.17.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 17:58:13 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/3] golang/xenlight: init xenlight go module
Date: Tue, 12 May 2020 20:58:06 -0400
Message-Id: <d3744468e8f6ce22756355a2e36b182cea7d5068.1589330383.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589330383.git.rosbrookn@ainfosec.com>
References: <cover.1589330383.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1589330383.git.rosbrookn@ainfosec.com>
References: <cover.1589330383.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Initialize the xenlight Go module using the xenbits git-http URL,
xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight.

Also simplify the build Make target by using `go build` instead of `go
install`, and do not set GOPATH here because it is now unnecessary.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
Changes in v2:
 - Use xenproject.org instead of xen.org in module path.
 - Undo change to XEN_GOCODE_URL; just use `go build`.
---
 tools/golang/xenlight/Makefile | 2 +-
 tools/golang/xenlight/go.mod   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 tools/golang/xenlight/go.mod

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 753132306a..37ed1358c4 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -33,7 +33,7 @@ $(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go types.gen.go helpers.
 # so that it can find the actual library.
 .PHONY: build
 build: package
-	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_XENLIGHT) -L$(XEN_LIBXENTOOLLOG)" GOPATH=$(XEN_GOPATH) $(GO) install -x $(XEN_GOCODE_URL)/xenlight
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_XENLIGHT) -L$(XEN_LIBXENTOOLLOG)" $(GO) build -x
 
 .PHONY: install
 install: build
diff --git a/tools/golang/xenlight/go.mod b/tools/golang/xenlight/go.mod
new file mode 100644
index 0000000000..926474d929
--- /dev/null
+++ b/tools/golang/xenlight/go.mod
@@ -0,0 +1 @@
+module xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight
-- 
2.17.1


