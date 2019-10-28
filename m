Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B53E785F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 19:24:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP9ew-0000lP-94; Mon, 28 Oct 2019 18:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZIpA=YV=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iP9eu-0000lK-Nr
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 18:22:28 +0000
X-Inumbo-ID: e5435d12-f9af-11e9-a531-bc764e2007e4
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5435d12-f9af-11e9-a531-bc764e2007e4;
 Mon, 28 Oct 2019 18:22:27 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b20so8553613lfp.4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AmXxX3VgioA77BuFL1MgA9bHl37lAvOM/aNAudeiASw=;
 b=hwB4OZR56vS4x7Sg1cUWQQWvxVL95MQoRaEUqjL+OssYycbKi0EvPTc0MHCo+XqwQb
 iSD+wRWG74XcVC/rKqLPbtlCoqAhxOizPokQCj80Ksd2xCgiv6Bi5rUv0+8z6TDnIWPG
 ivLKvx+pHt8UJMj8lMSdUfnbC4EjWUFOomxk+fcQzXsKOl+wwX3qJ4IlAHIGLZBPvHQa
 zB+3UE0lpBnZnyLx7I1l4KtTPjkKh1EkwhVF3RgikPkkZZ+MmaStHhwk38ljhdjUPmUE
 DtMgMtcFg33YEcMXjIfK7u0SlTXUNyLh2BMFCUfjHCOJVzaqChUde8Shr6gnAT6DjL68
 o5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AmXxX3VgioA77BuFL1MgA9bHl37lAvOM/aNAudeiASw=;
 b=HazSv3wA+00QdGQLLvUsA5613KhK91N6z6MlVni+moG/DIVemFChkka2yfG6Dzgj+f
 JVAFbLS2cSGMACXCYESHauMmhwrY/2jUn9XC/FQc/6uC+w36t1kweyo4vLezrsoHXXvo
 75NbYlR24KdIQzU5OyXXtmJ/n01NYPfK6dlIh8aQlTSJgkOVJYMeSnTqV4YyRexcx3fN
 rxqTLBveEUx54LNerKZnKAQbXop4HbFdfUG5nIdaEDI9fDKXoh8eeM7XlBR2n4QSQqwI
 /yng/ARu7ctrD0nnUrW6F3luI64At3vMWStnV2MvHTcpIQNSJba12PJWJGWR0zTHOqeP
 oM0w==
X-Gm-Message-State: APjAAAWp3k7H9iohZUW8jhfUbwrWL14UQyDv8oxvZdiGufK4KRa8kJau
 xolgw4zu0yjQGZN/xEuX/1GSzZ/kjVbMSw==
X-Google-Smtp-Source: APXvYqyNi5Vo49hRob1Gv4Cd9hlbe/gZAmpmVtLHWaCozRqGDmGueburTNPnn/jqwSdfg0wZwpMnmQ==
X-Received: by 2002:a19:f018:: with SMTP id p24mr12021909lfc.93.1572286946283; 
 Mon, 28 Oct 2019 11:22:26 -0700 (PDT)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id p86sm7474522lja.100.2019.10.28.11.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 11:22:25 -0700 (PDT)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 28 Oct 2019 20:22:15 +0200
Message-Id: <20191028182216.3882-1-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v1 0/1] libxl/gentypes: add range init to array
 elements in json parsing
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
Cc: anthony.perard@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 julien.grall@arm.com, ian.jackson@eu.citrix.com, wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKVGhl
cmUgYXJlIHR3byBvbGQgdGhyZWFkcyBpbiB3aGljaCB0aGlzIGlzc3VlcyB3YXMgYWRkcmVzc2Vz
IChbMV0sIFsyXSkgYnV0CnRoZSByb290IGNhdXNlIHdhc24ndCBkZWZpbmVkLiBUaGUgcmVhbCBy
b290IGNhdXNlIGlzIHRoYXQgd2hlbiBsaWJ4bCBjcmVhdGVzCmpzb24gZmlsZSBpdCBkb2Vzbid0
IHB1dCBlbnRyaWVzIGZvciBmaWVsZHMgd2l0aCBkZWZhdWx0IHZhbHVlICh3aGljaCBpcwpjb3Jy
ZWN0KS4gVGhlbiBkdXJpbmcgcGFyc2luZyBqc29uIGJhY2sgdG8gZGF0YSwgYXJyYXkgZWxlbWVu
dHMgYXJlIGluaXRpYWxpemVkCmJ5IHplcm8gaW4gYWxsIGNhc2VzLiBCdXQgdGhleSBzaG91bGQg
YmUgaW5pdGlhbGl6ZWQgdG8gZGVmYXVsdCB2YWx1ZSAoaWYgaXQgaXMKbm90IGVxdWFscyB0byB6
ZXJvKS4KClsxXSBodHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNTEzNzg3MjcyMTAx
MzAmdz0yClsyXSBodHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNTcwNzE1NTE5MjU3
MzQmdz0yCgpPbGVrc2FuZHIgR3J5dHNvdiAoMSk6CiAgbGlieGwvZ2VudHlwZXM6IGFkZCByYW5n
ZSBpbml0IHRvIGFycmF5IGVsZW1lbnRzIGluIGpzb24gcGFyc2luZwoKIHRvb2xzL2xpYnhsL2dl
bnR5cGVzLnB5IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
