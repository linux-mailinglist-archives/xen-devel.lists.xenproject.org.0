Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D03D132D49
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 18:42:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iosp4-0004bt-7X; Tue, 07 Jan 2020 17:39:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iosp3-0004bo-BR
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 17:39:17 +0000
X-Inumbo-ID: a04550ec-3174-11ea-b836-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a04550ec-3174-11ea-b836-bc764e2007e4;
 Tue, 07 Jan 2020 17:39:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id y11so362891wrt.6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 09:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bf7IwerQKWCzfFFe/CskDgHbLHFhUdpBVRriPuu6j7k=;
 b=jlqHXTCL6yON6DSOsMhst64k/Kd+G3f7u2T3odyoOH3cmWQ5dOeV2gzFg6Jz4Fj4j+
 kvkNWhXjLqx6X/M2up99/6DjFv/tMxCQfwSdxsckvpcpid4jz6yVjlM9BwtR+l0YcAMg
 J2Ft4w+PsYcVHXPbUHPPw1Y/kZD2pAavgAlXvfBoqvTWKVSGXUdZboDBalgfWo9ytng5
 eFkawaiqswUjYHGSKmoQ8V4VUMzJr4aDk8wYHtKIGJWsDh/9wzK7l9TvZL8QqDXidKU/
 0jAon8n3zT7TgyIgeuHHQO7XrIFZr36ShuxkyYPZt4d1e73lcpJPmVunMQPxgqinEoUL
 84yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Bf7IwerQKWCzfFFe/CskDgHbLHFhUdpBVRriPuu6j7k=;
 b=e85J+N8dRJvgaSV1t/Mcndn546HuoQQVI09c4SGa7FxZuzm4xjQaufRNrdZCbyFu3R
 i+iD5e61UdzNQcbmnnWY4A6eCyTi3xcbfPZEXhLIEYnoY2WDKOSWfEP9k70GK7ImkLdp
 YN2eHQbDyTScMLz958ElJtYrTYXa0XDGz5vBZWqoe4zZst+IrZruxwjgk+BX2T0/6UwM
 RnX/8vLTzcO0IiHXujEviIjJH3od0R9RYKcI1OPFZMFfN90T6lGcT683JzPANeZCMdyJ
 j+Xkuy6II0DgPwXLF0xu4yad4L0RiSLFrYBniyer//8m2c2+U1kQ9SVhSTBhk74rLhMQ
 Go3Q==
X-Gm-Message-State: APjAAAXwVlaTHs11/yZdNn8m5by8cD4tj89lMQjfBZKdwL2oMATBlOfD
 gh9e6kk/abJYZr9HlodtKI6Hsqz77S8=
X-Google-Smtp-Source: APXvYqzRPySxCECi2DlQJtDONyhl9+1NglFkz/CvZmcjzEgLPhqd68Bu+fRByXC59odvNh0Gdk/wWQ==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr246791wrx.66.1578418755915; 
 Tue, 07 Jan 2020 09:39:15 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id u18sm648235wrt.26.2020.01.07.09.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:39:15 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  7 Jan 2020 17:39:00 +0000
Message-Id: <20200107173902.13768-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] Misc Hyper-V TLFS fixes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <JBeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IHR3byBpc3N1ZXMgZGlzY292ZXJlZCBieSBKYW4uCgpXZWkgTGl1ICgyKToKICB4ODYvaHlw
ZXJ2OiBkcm9wIHVzYWdlIG9mIEdFTk1BU0tfVUxMIGZyb20gaHlwZXJ2LXRsZnMuaAogIHg4Ni9o
eXBlcnY6IGRyb3AgYWxsIF9fcGFja2VkIGZyb20gaHlwZXJ2LXRsZnMuaAoKIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8IDYwICsrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCi0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
