Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E6CFC12
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 16:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHqCL-0006wL-1e; Tue, 08 Oct 2019 14:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jabB=YB=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iHqCJ-0006vz-4o
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 14:10:43 +0000
X-Inumbo-ID: 644177d8-e9d5-11e9-96dc-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 644177d8-e9d5-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 14:10:33 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m7so17723651lji.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8cB5iex11iqVqDmJdNxCcGJEmCz5fLgF2Tp7Bx104WI=;
 b=CIXl+xvNvz41+yj3i1UYt7xrv3F7Yy2UtVAD29K2Ob6DxVuKOwl7TTQ6hXhWISLbJK
 7AwskGMLjcxyUrvNwTB8ytAe1FUCXqlMXOdjRExpmSil9Q7buBgahfUb3olJkhmRThYW
 PPgtyFJaFyFuN5CUJzebz6F95Ch98el+u3S6t4gz1BLFdQwNabb2Qo8DFaN1D6zIkfW8
 AcjNF+RCz8uSlO8nezzFDYXjwrpuh8/xJObpT8B9ga6QhU4lsAdAa72r5PxZNMTzEHUu
 6nTPTCXQz3xHlzU/+CKd2wmECHssvKlaSpnRpfUbH4d7tE9wSbGzgMQ04JBMp8sJGPDi
 NsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8cB5iex11iqVqDmJdNxCcGJEmCz5fLgF2Tp7Bx104WI=;
 b=e9u1fTH+HVjujmKR7kQXxkNALfNiCpzpkqs7q2SWrL+DOkYLwNTkS7d5n5RlknVoxz
 J90d9gFLwi0pBlNqztq/Q21taPY78+bEy/kmJpt3zVhBYTwkptKGjBIdwAEBRlTOW6qo
 lt98r1A3YLLM7pJGMRoNf3WMsKif5ixSPF2XEs5wXPqyHcMfSuT9Ixa6DXMlA1ZbEZ6M
 Q8pTkFUQDq5wUzFyyydWhD+tjxeWfdte617dqvIat4ls47xtR02GdIcsgtk4HqwNvfTX
 Cs5z+JLtrcXoBJPvFfOhGSrOFSBlsZs2qpSXo8ppsAASXDGNd0QJ4iJE0qKsbT5C4TQc
 1DKQ==
X-Gm-Message-State: APjAAAWdOR2p8XsPSaZ3Xhzt64dFvBDHr9P2JbaX9bUDJcaJpXNZwE6j
 iOaoHDXetJe9gpvXLQ5r9iRjgl61NHo=
X-Google-Smtp-Source: APXvYqx3olnVYwO9LIS+6/+MUJykG7EFYX6ORNtmVabgCPKFVPIxQ+RICrmYikRh3SHQdHwb491k8g==
X-Received: by 2002:a2e:504f:: with SMTP id v15mr22919371ljd.67.1570543832359; 
 Tue, 08 Oct 2019 07:10:32 -0700 (PDT)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z20sm4937764ljk.63.2019.10.08.07.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 07:10:31 -0700 (PDT)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  8 Oct 2019 17:10:24 +0300
Message-Id: <20191008141024.10885-3-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008141024.10885-1-al1img@gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
Subject: [Xen-devel] [PATCH v1 2/2] libxl: add removing XS backend path for
 PV devices on domain destroy
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
Cc: Oleksandr Grytsov <oleksandr_grytsov@epam.com>, ian.jackson@eu.citrix.com,
 wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKQ3Vy
cmVudGx5IGJhY2tlbmQgcGF0aCBpcyByZW1vdmUgZm9yIHNwZWNpZmljIGRldmljZXM6IFZCRCwg
VklGLCBRRElTSy4KVGhpcyBjb21taXQgYWRkcyByZW1vdmluZyBiYWNrZW5kIHBhdGggZm9yOiBW
RElTUEwsIFZTTkQsIFZJTlBVVC4KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHcnl0c292IDxv
bGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kZXZpY2Uu
YyB8IDE0ICsrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jIGIv
dG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMKaW5kZXggMTQwMmI2MWE4MS4uOGNlNzA2NjFlNSAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZGV2aWNlLmMKKysrIGIvdG9vbHMvbGlieGwv
bGlieGxfZGV2aWNlLmMKQEAgLTE0NzcsNyArMTQ3Nyw3IEBAIHR5cGVkZWYgc3RydWN0IGxpYnhs
X19kZG9tYWluX2RldmljZSB7CiAgKi8KIHR5cGVkZWYgc3RydWN0IGxpYnhsX19kZG9tYWluX2d1
ZXN0IHsKICAgICB1aW50MzJfdCBkb21pZDsKLSAgICBpbnQgbnVtX3ZpZnMsIG51bV92YmRzLCBu
dW1fcWRpc2tzOworICAgIGludCBudW1fcWRpc2tzOwogICAgIExJQlhMX1NMSVNUX0hFQUQoLCBz
dHJ1Y3QgbGlieGxfX2Rkb21haW5fZGV2aWNlKSBkZXZpY2VzOwogICAgIExJQlhMX1NMSVNUX0VO
VFJZKHN0cnVjdCBsaWJ4bF9fZGRvbWFpbl9ndWVzdCkgbmV4dDsKIH0gbGlieGxfX2Rkb21haW5f
Z3Vlc3Q7CkBAIC0xNTMwLDggKzE1MzAsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19hbmRfbWF5YmVf
cmVtb3ZlX2d1ZXN0KGxpYnhsX19nYyAqZ2MsCiB7CiAgICAgYXNzZXJ0KGRkb21haW4pOwogCi0g
ICAgaWYgKGRndWVzdCAhPSBOVUxMICYmCi0gICAgICAgIGRndWVzdC0+bnVtX3ZpZnMgKyBkZ3Vl
c3QtPm51bV92YmRzICsgZGd1ZXN0LT5udW1fcWRpc2tzID09IDApIHsKKyAgICBpZiAoZGd1ZXN0
ICE9IE5VTEwgJiYgTElCWExfU0xJU1RfRklSU1QoJmRndWVzdC0+ZGV2aWNlcykgPT0gTlVMTCkg
ewogICAgICAgICBMSUJYTF9TTElTVF9SRU1PVkUoJmRkb21haW4tPmd1ZXN0cywgZGd1ZXN0LCBs
aWJ4bF9fZGRvbWFpbl9ndWVzdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5leHQpOwog
ICAgICAgICBMT0dEKERFQlVHLCBkZ3Vlc3QtPmRvbWlkLCAiUmVtb3ZlZCBkb21haW4gZnJvbSB0
aGUgbGlzdCBvZiBhY3RpdmUgZ3Vlc3RzIik7CkBAIC0xNTczLDkgKzE1NzIsNiBAQCBzdGF0aWMg
aW50IGFkZF9kZXZpY2UobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fYW8gKmFvLAogICAgIHN3aXRj
aChkZXYtPmJhY2tlbmRfa2luZCkgewogICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZCRDoK
ICAgICBjYXNlIExJQlhMX19ERVZJQ0VfS0lORF9WSUY6Ci0gICAgICAgIGlmIChkZXYtPmJhY2tl
bmRfa2luZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfVkJEKSBkZ3Vlc3QtPm51bV92YmRzKys7Ci0g
ICAgICAgIGlmIChkZXYtPmJhY2tlbmRfa2luZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfVklGKSBk
Z3Vlc3QtPm51bV92aWZzKys7Ci0KICAgICAgICAgR0NORVcoYW9kZXYpOwogICAgICAgICBsaWJ4
bF9fcHJlcGFyZV9hb19kZXZpY2UoYW8sIGFvZGV2KTsKICAgICAgICAgLyoKQEAgLTE2MTksMTEg
KzE2MTUsMTEgQEAgc3RhdGljIGludCByZW1vdmVfZGV2aWNlKGxpYnhsX19lZ2MgKmVnYywgbGli
eGxfX2FvICphbywKICAgICBpbnQgcmMgPSAwOwogCiAgICAgc3dpdGNoKGRkZXYtPmRldi0+YmFj
a2VuZF9raW5kKSB7CisgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRfVkRJU1BMOgorICAgIGNh
c2UgTElCWExfX0RFVklDRV9LSU5EX1ZTTkQ6CisgICAgY2FzZSBMSUJYTF9fREVWSUNFX0tJTkRf
VklOUFVUOgogICAgIGNhc2UgTElCWExfX0RFVklDRV9LSU5EX1ZCRDoKICAgICBjYXNlIExJQlhM
X19ERVZJQ0VfS0lORF9WSUY6Ci0gICAgICAgIGlmIChkZXYtPmJhY2tlbmRfa2luZCA9PSBMSUJY
TF9fREVWSUNFX0tJTkRfVkJEKSBkZ3Vlc3QtPm51bV92YmRzLS07Ci0gICAgICAgIGlmIChkZXYt
PmJhY2tlbmRfa2luZCA9PSBMSUJYTF9fREVWSUNFX0tJTkRfVklGKSBkZ3Vlc3QtPm51bV92aWZz
LS07Ci0KICAgICAgICAgR0NORVcoYW9kZXYpOwogICAgICAgICBsaWJ4bF9fcHJlcGFyZV9hb19k
ZXZpY2UoYW8sIGFvZGV2KTsKICAgICAgICAgLyoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
