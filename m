Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519817023F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:23:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6yUY-0001AX-Dr; Wed, 26 Feb 2020 15:20:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RfmG=4O=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j6yUW-0001AS-Sx
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:20:52 +0000
X-Inumbo-ID: 93610f84-58ab-11ea-aba8-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93610f84-58ab-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 15:20:52 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id t13so2503759qto.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nE9gKksLxp9PZg4VpY//o6cSB2xESEXByYin31GcIGo=;
 b=ehD9TQBcFDQdOzr+Ldhblq0DFVCTLqt9LTFiP75wqKnwdJ6ffRJFctlwXn6/Yj/hbG
 5jWsLT2xt9rcxyZ/8LdlIO4BRI2lxRGExmuxk95SwXsv9XcPRB2whaaQkffimpMIN6Mn
 JiunDCg0iQMZ5Rc+ioNN0RV/ylfFgZfkHjtu8araI92k62/KM2GzaIh2Vmzj8LvYq/sg
 ssblLdUKLH074nO5NvdBY4nt3vwZW3eO4QYzwoKtWUOtVybolXWFDfh9WlECDQibCw2K
 /9pYDwfMsSgXWpPNJ19N8iq1qZaacGaGnbhIH7l58rzCVRXEwIJA/vVYgnCwvdOcT/El
 7FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nE9gKksLxp9PZg4VpY//o6cSB2xESEXByYin31GcIGo=;
 b=oxyJViCc5vjJwYjrb0brtxhhz860FDjj8pF1wItm8IlELmXYTyGoO48W+db8w5eG5P
 ZOzIjKuUmdG/qjZEKgYnjoXXg6EV97LDsITy1xxqhsydseNpxPfa/NHv7555eQK6EaA2
 uShWQjs1PeumqFDPppSVF7vzFjbdYSlG+nj8aH2v6CbcZMX621/LRJ09M/Fe352mGMVJ
 FD3yUwy9P5WIMHKlW3vcFShXcB8ZyOrxbL0tEnBGVu0hl1YJQ5MrpPVFn906u0viQbNt
 DRYUvkhq8CmEsDilJv4puT3tnnZE1bSNEhQhHWznR2jwCrq/Ow/llZW3GLHEJQHqcTqE
 E79w==
X-Gm-Message-State: APjAAAVWoA0q3QzGkwMObt/SDvvjYo0AiESCaGkpiOrpOlXcYYvy6VUj
 DnwJVDuQrR6DFwiDQcuk606BQELN
X-Google-Smtp-Source: APXvYqwsPvVdbkMnFd7Xdf6VlAl43v1kBWt8Nxn6B44e7szPF06dGhio0rPIdF/0Fc2u2nHYEIa9EQ==
X-Received: by 2002:ac8:1a19:: with SMTP id v25mr5555960qtj.146.1582730451623; 
 Wed, 26 Feb 2020 07:20:51 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 q196sm327187qke.80.2020.02.26.07.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 07:20:50 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 10:20:11 -0500
Message-Id: <20200226152013.12200-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] Remove locking.sh dependency on perl
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGVybCBpcyBhIGxhcmdlIGRlcGVuZGVuY3kgZm9yIGxvY2tpbmcuc2gncyBzaW5nbGUgdXNlIG9m
IGNvbXBhcmluZyBhCmZpbGUgZGVzY3JpcHRvcidzIGFuZCBhIGZpbGUncyBpbm9kZXMuICBNYW55
IHN5c3RlbXMgZG9uJ3Qgb3RoZXJ3aXNlCnJlcXVpcmUgcGVybCwgc28gZHJvcHBpbmcgdGhpcyB1
c2UgZWxpbWluYXRlcyB0aGUgZGVwZW5kZW5jeS4KClJlcGxhY2UgdGhlIG9wZW4tY29kZWQgcGVy
bCB3aXRoIGFuIGVxdWl2YWxlbnQgQyBpbXBsZW1lbnRhdGlvbi4KCkphc29uIEFuZHJ5dWsgKDIp
OgogIHRvb2xzL2hlbHBlcnM6IEludHJvZHVjZSBjbXAtZmQtZmlsZS1pbm9kZSB1dGlsaXR5CiAg
TGludXgvbG9ja2luZy5zaDogVXNlIGNtcC1mZC1maWxlLWlub2RlIGZvciBsb2NrIGNoZWNrCgog
LmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogdG9vbHMvaGVscGVycy9N
YWtlZmlsZSAgICAgICAgICAgIHwgIDMgKysrCiB0b29scy9oZWxwZXJzL2NtcC1mZC1maWxlLWlu
b2RlLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9ob3RwbHVn
L0xpbnV4L2xvY2tpbmcuc2ggICAgfCAxMCArKy0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDQ5IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvaGVs
cGVycy9jbXAtZmQtZmlsZS1pbm9kZS5jCgotLSAKMi4yNC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
