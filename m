Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4455A6751A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 20:28:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hm0Dl-00051h-NO; Fri, 12 Jul 2019 18:24:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=War0=VJ=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hm0Dk-00050n-Dw
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 18:24:36 +0000
X-Inumbo-ID: 4c589d89-a4d2-11e9-8980-bc764e045a96
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c589d89-a4d2-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 18:24:35 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id d24so10234100ljg.8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2019 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4+AhhQKQJUCwsTwzcXjN1ALcChLmvu5Bnp+lxDInuCw=;
 b=f79LpHnwrG7S9K+u4H5ItSb0fU/Ant5Hk9LVWsprWVFBJVRZJWTDOeFVz7abA3Uh4d
 6xvEkqExaAiNCnouftAc/fTow3n1qzhyN5bT9c+g5keL5fB0H8xrrazieBZ36gZCs0/+
 2cxPLfsS0jClbgbAte3L+55ExyMpktFNv6xyt96HUsx59g9hOmPbskwN81ObMJNoekXq
 ctxSz99B0SVZo5d5TRb7Aq8qYDGgOGgusorgS7D0JoRrYCOgL4r7lm06B+LXfuAdpbug
 LmYs5XrC9293UC3MbFwAnwTbPNTxGIYSSKDY74UvlvFxzIr2Cb1VJWoYlOWwWWHge15u
 sVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4+AhhQKQJUCwsTwzcXjN1ALcChLmvu5Bnp+lxDInuCw=;
 b=aV4KMvlGlD5DNx6wbJ7ilotqUi1ITV3MvnjoeIjYs8qQWG0gPBIb/vQtthzBoeqyva
 RraytBt8lFNEs2DOmQoOg/M/sL0CxFlaMOrUujSBp4kphOpCOXGyofdgCWHr9I8mPz/b
 rhAnRee6YYxOxGDXH+l/tHZSGaQBPFAShom79yN6kQkjpzTE+W/Wv5doc6bo+CZ895o1
 86oIe/GvdbV5Edi94busvufLW8hAObcseIiB4bmMcr9gJye3oo4cJI3h524yv5rOtjXq
 n4fuoiRRQfXXbhoTxu97zJCytKq/Hi8VOBtRWgREG+5fJD23AH3U5JXQdVn2GVDDHVfO
 n6CQ==
X-Gm-Message-State: APjAAAVxFV6ZQgy8Isgu9ChmZ2fYZYmE7PhhrDm33p9lx8P6Jrw2AShI
 28/EWY9zlxNeSa2/Z00LsBb+d3a1Vz0KobytJZA=
X-Google-Smtp-Source: APXvYqyNjn65udzqnT6n/xHtCeJMOe99FLYUWKI15D3wY2ac4augft0qVFh91t3M10fny5oqhiY+SmD4egwD+e0yMNk=
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr6694450lji.57.1562955873565; 
 Fri, 12 Jul 2019 11:24:33 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 12 Jul 2019 13:24:22 -0500
Message-ID: <CACMJ4Ga8iYB_CaQu=ChLj5m-1KyW=woKoFMk-fKPgRhGgCT+Rw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] Summit notes on dom0less extension, domB and x86
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubywKCkkgbWFkZSBzb21lIG5vdGVzIGZyb20gb3VyIGluZm9ybWFsIGRlc2lnbiBzZXNz
aW9uIGFib3V0IGFkZGluZyBkb21CCmZlYXR1cmUgc3R1ZmYgdG8gZG9tMGxlc3MsIGFuZCBkb20w
bGVzcyBvbiB4ODYKCiogT24geDg2LCBlbnZpc2FnaW5nIHRoYXQgYm9vdCBWTSBzdGFydCBtYXRl
cmlhbHMgKGtlcm5lbCwgaW5pdHJkLCBldGMpCiAgYXJlIGxvYWRlZCBieSBtdWx0aWJvb3QsIGFz
IGV4dHJhIGJsb2JzIGluIHRoZSBzYW1lIGZhc2hpb24gYXMgdGhlIGRvbTAga2VybmVsCiAgYW5k
IGluaXRyZCAoYW5kIGV4aXN0aW5nIHN1cHBvcnQgZm9yIGFkZGluZyBUWFQgQUNNcywgWFNNIHBv
bGljeSBmaWxlLCBldGMpCiAgaW4gZ3J1Yi5jZmcuCgpkb21CJ3MgbmVlZHM6CiogTmVlZCB0byBi
ZSBhYmxlIHRvIG1lYXN1cmUgdGhlIGJvb3QgVk1zIGJlZm9yZSB0aGV5IHN0YXJ0CiAgICAtPiB0
aGUgbWVhc3VyZW1lbnRzIChvciBzb21ldGhpbmcgZGVyaXZlZCBmcm9tIHRoZW0pIGdvIGludG8g
dGhlIFRQTQoqIHRoZSBtZWFzdXJlbWVudCBwcm9jZXNzIG5lZWRzIHRvIGJlIHRhaWxvcmFibGUg
dG8gdGhlIHN5c3RlbSB1c2UgY2FzZSwKICBhbmQgZG9lc24ndCBuZWVkIGh5cGVydmlzb3IgcHJp
djsgZG8gaXQgaW4gYSBzaW5nbGUgZmlyc3QtYm9vdGVkIGRvbTBsZXNzCiAgZ3Vlc3QgKGRvbUIp
LgoqIHRoZSBmaXJzdC1ib290ZWQgZ3Vlc3QgKGRvbUIpIGRvZXMgaXRzIG1lYXN1cmluZyBzdHVm
ZiAocXVpY2tseSksIGxhdW5jaGVzIHRoZQogIHJlbWFpbmluZyBib290IGd1ZXN0cyBhbmQgdGhl
biBleGl0cywgc28gaXQncyB2ZXJpZmlhYmx5IGdvbmUsaWUuIGFsb25nIHdpdGgKICBhbGwgcHJp
dmlsZWdlIGl0IHdhcyBnaXZlbiBmb3IgdGhhdCB3b3JrLgoqIGFzIGRvbUIgaXMgc3RhcnRpbmcg
dGhlIG90aGVyIGJvb3QgZ3Vlc3RzLCBpdCBhc3NpZ25zIHdoaWNoCnByaXZpbGVnZXMgYXJlIGdy
YW50ZWQKICB0byB0aGUgZG9tYWlucyB0aGF0IGdldCBzdGFydGVkLiBlZy4gY29udHJvbCBkb21h
aW4sIGh3IGRvbWFpbiwgZXRjLgoKcmVsYXRlZCB0aGluZ3M6CiogVGhlIFRQTSBoYXJkd2FyZSBk
cml2ZXIgZG9lc24ndCBsaXZlIGluIFhlbi4KKiBOZWVkIHRvIGJlIGFibGUgdG8gYm9vdCB0aGUg
c3lzdGVtIGluIGEgd2F5IHRoYXQgdGhlIGNvbnRyb2wgZG9tYWluIGhhcyBoYXZlCiAgbmV2ZXIg
aGFkIHByaXZpbGVnZSBvdmVyIHRoZSBkb21haW4gdGhhdCBoYW5kbGVzIHRoZSBwaHlzaWNhbCBU
UE0sIG9yIHRoZQogIHByb3ZpZGVyIG9mIHRoZSB2aXJ0dWFsIFRQTS4KKiBUaGUgY29udHJvbCBk
b21haW4gY2FuIGhhdmUgYSB2aXJ0dWFsIFRQTS4KCmFueXdheSwgd2FudGVkIHRvIGdldCB0aGlz
IGRvd24gYmVmb3JlIHRvbyBtdWNoIHRpbWUgcGFzc2VzIHNvIHdlIGNhbgpnZXQgc29tZXRoaW5n
IG1vdmluZwoKQ2hyaXN0b3BoZXIKCiggZm9yIHJlZiwgbGFzdCB5ZWFyJ3MgUkZDIHBvc3Qgb24g
ZG9tQiBhbmQgdGhyZWFkOiApCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOC0wNi9tc2cwMTMwNi5odG1sCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
