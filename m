Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393A38F481
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 22:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131899.246362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHLH-00068u-GO; Mon, 24 May 2021 20:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131899.246362; Mon, 24 May 2021 20:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llHLH-000644-C0; Mon, 24 May 2021 20:38:27 +0000
Received: by outflank-mailman (input) for mailman id 131899;
 Mon, 24 May 2021 20:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+P1=KT=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1llHLF-0001ey-T3
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 20:38:25 +0000
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5402a5a-d6d8-4f73-9c70-67ac9f5ed901;
 Mon, 24 May 2021 20:37:49 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h24so10195773qtm.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 13:37:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id t25sm5142847qkt.62.2021.05.24.13.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 13:37:48 -0700 (PDT)
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
X-Inumbo-ID: a5402a5a-d6d8-4f73-9c70-67ac9f5ed901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=MJAWGHEUAw5eoKAlFYrwM/9yu/NhcTzkr9C5oJHPCDA=;
        b=Ev2HuCwLxs6mXamXhdwzSjERFJi8CEscqkB7Q+iZuYUeo6pGoJSW9HmzCpHffgdfb8
         xExpudG7W1CQCSxiKlftWO9Nv1o/GwOVcqQ2c65+VjPKZNjXoduf0qgMttTTukKbuT+k
         7pQAMPKD2lBNN/+XIn5Hr4palHG25SMc/KwFlYpcueuoR87YZlWeutC3dMqEuPhXBkAU
         3vziF5PMLpTYNA8LTvTmFfvnKsdxyphOWs8klTh7uFq9EqzMZtRY4beos6uEbDPi54vh
         FTbUUavmWoM3l93RCEXTt/43Zw5XfRrRY9mnTNGxOiv/aV3CB4tOD15sYAsFsUd/RWY8
         XQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=MJAWGHEUAw5eoKAlFYrwM/9yu/NhcTzkr9C5oJHPCDA=;
        b=mHfoc8k8qgvZQ8a6TF/FsEW6ySxX2nHy3nDjd5QCD8l0djXBkylfQKfMgZsl6UhI0B
         AZSBrXx15LwGWIclbG/ARjbG9J10c5qjFIPH6Luj0G60BcX+ewDfOfiuN+gZrtL9fCQf
         edSmX+6PtdST9AR+7M+6Hc8WWNbB9REChiJp5RJsuzrWzFmt0iCy8ApcQzk5qdQUstaD
         vwPgqeRmGPstBwqo+/GdimkItQhIDLgJI6TZinMKsYiXHVdkQBrrXt9a78qJ3Y2yUZT3
         1jkjG5UgnRClhRLgm7IqoQ2EUbcs6ODpVh+wYvcqIiXYEFUg1lPNcHdxNqKBrDxvhBEl
         vkXw==
X-Gm-Message-State: AOAM53062sGdyx7XfZIJqCcO8Qm17S997Ow5adYrkIKOFC4KjwLXqY6C
	zBFgzjm4tdveFJ5SJvDrXLo=
X-Google-Smtp-Source: ABdhPJwG+1Ue8vohST1MgBlBsluetTjfaTiM/njhK9jyLVPzMh+gqG6MRmhARJDGBEAxzsrqxYRVww==
X-Received: by 2002:ac8:12c9:: with SMTP id b9mr16264534qtj.90.1621888668864;
        Mon, 24 May 2021 13:37:48 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.prg,
	xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RESEND PATCH 09/12] golang/xenlight: add DomainDestroy wrapper
Date: Mon, 24 May 2021 16:36:50 -0400
Message-Id: <82c68547f4cec1c82132cd6a867696f4b38dcd3d.1621887506.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1621887506.git.rosbrookn@ainfosec.com>
References: <cover.1621887506.git.rosbrookn@ainfosec.com>

Add a wrapper around libxl_domain_destroy.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 65f93abe32..1e0ed109e4 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1357,3 +1357,13 @@ func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 
 	return Domid(cdomid), nil
 }
+
+// DomainDestroy destroys a domain given a domid.
+func (ctx *Context) DomainDestroy(domid Domid) error {
+	ret := C.libxl_domain_destroy(ctx.ctx, C.uint32_t(domid), nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1


