Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23612CA6A
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOf-0000DK-NR; Sun, 29 Dec 2019 18:34:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOe-0000CJ-5K
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:36 +0000
X-Inumbo-ID: c8ce5a2a-2a69-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8ce5a2a-2a69-11ea-88e7-bc764e2007e4;
 Sun, 29 Dec 2019 18:34:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b19so12372785wmj.4
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3d0oAYCyKACs7Jy203uplvN0cNjl3u8rMIY3VL6ToB4=;
 b=Sd5UeMLWT/ULhIt8rsmXOfpj1l/hPLNOYGjd7XhnZ65OnTkhbxpsScWPgkWybcN6CK
 tU/eTPQkjAnLHePBhkZqSLBN0TDaqmC7e+mjgbWNHyJ/2SbRnwq0TZoDtXSsXonz9IEt
 vX6u06amFCuiYqHY2waJ0+7Q9xFruNt2z1GSR5gH1f6EEoDeTIWCyHIa/DLY6b5N51Y9
 Qa81e4c+m14uHpU0+cqMYmhC9y4GYbgtirmSFr8VOdMROw4SWcZamUctlPP8Bqnrtkb5
 3+e9x3B3murU62Ht3bObs12QElYJOyE7Ts8ZllFSDyUDzLjwPJ6V2HL/KVfzH2IlkoxJ
 oHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3d0oAYCyKACs7Jy203uplvN0cNjl3u8rMIY3VL6ToB4=;
 b=axaCYO08On3duYJAC4916xkOEuTTxeyyUzurSzk/6/JBbM0uaZ+pHU3Vl6WNP/7uHn
 wnBrT9RDQTZsKjcS+BklyXPYbuXc1pQ93XeMoOZdON5QWNDyzWfcRaSR65AQmNyyqtpx
 AGDYe1vYf5WXH19EzCH5ptD/DGWNCE0Vm2QG7jqsXf702Av43nLWO3ihN9eUPzlaSFaG
 j4s6jBRvNPYbEfCcQrLPsPG5OpvaFchmQrBQs37MYw513nWaxaKde5A6WFoNG8sTQubt
 ygDa8s0KtyCS5q1BTuFg+JEtf7isqrALF+u2yGWOv6klCL4eQ2HhvV/9iwNVaU4VjwFM
 lWfw==
X-Gm-Message-State: APjAAAVoR59zAhou2/F4N5MOS/d/Ul4mFoTKCXPm2dZvcytULgk/8cTI
 eh8MW+Wh+XwsxCtvhqaR4xLJsVwC/Gw=
X-Google-Smtp-Source: APXvYqyrf/tgheg5khGn4qrLjdxD4PqIp9ePYibVwAtbgqUC8fVlrdP0wLyJAoQCOpH/YXW+MITFfw==
X-Received: by 2002:a7b:cfc2:: with SMTP id f2mr28916093wmm.44.1577644441234; 
 Sun, 29 Dec 2019 10:34:01 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:34:00 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:41 +0000
Message-Id: <20191229183341.14877-9-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 8/8] x86/hyperv: setup VP assist page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBz
b21lIGJpdHMgaW4KdGhhdCBwYWdlIHN1Y2ggdGhhdCBMMSBndWVzdCBjYW4gbWFrZSBoeXBlcmNh
bGxzIGRpcmVjdGx5IHRvIEwwIEh5cGVyLVYuCgpQcmVlbXB0aXZlbHkgc3BsaXQgb3V0IHNldF92
cF9hc3Npc3QgcGFnZSB3aGljaCB3aWxsIGJlIHVzZWQgaW4gdGhlIHJlc3VtZQpwYXRoLgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5k
ZXggZGEzYThjZDg1ZC4uYTg4YjlhZTZkOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
CkBAIC0zMCw2ICszMCw3IEBAIHZvaWQgKmh2X2h5cGVyY2FsbDsKIHN0YXRpYyBzdHJ1Y3QgcGFn
ZV9pbmZvICpodl9oeXBlcmNhbGxfcGFnZTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0
cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9wY3B1X2lucHV0X2FyZyk7CiBERUZJTkVfUEVSX0NQ
VV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKK0RFRklORV9QRVJfQ1BV
X1JFQURfTU9TVExZKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl92cF9hc3Npc3QpOwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wczsKIGNvbnN0IHN0cnVjdCBoeXBl
cnZpc29yX29wcyAqX19pbml0IGh5cGVydl9wcm9iZSh2b2lkKQpAQCAtMTI1LDE3ICsxMjYsNTEg
QEAgc3RhdGljIHZvaWQgc2V0dXBfdnBfaW5kZXgodm9pZCkKICAgICB0aGlzX2NwdShodl92cF9p
bmRleCkgPSB2cF9pbmRleF9tc3I7CiB9CiAKK3N0YXRpYyB2b2lkIHNldF92cF9hc3Npc3Qodm9p
ZCkKK3sKKyAgICB1aW50NjRfdCB2YWwgPSBwYWRkcl90b19wZm4odGhpc19jcHUoaHZfdnBfYXNz
aXN0KS5tYWRkcik7CisKKyAgICB2YWwgPSAodmFsIDw8IEhWX1g2NF9NU1JfVlBfQVNTSVNUX1BB
R0VfQUREUkVTU19TSElGVCkgfAorICAgICAgICBIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFX0VO
QUJMRTsKKworICAgIHdybXNybChIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFLCB2YWwpOworfQor
CitzdGF0aWMgdm9pZCBzZXR1cF92cF9hc3Npc3Qodm9pZCkKK3sKKyAgICBzdHJ1Y3QgcGFnZV9p
bmZvICpwZzsKKyAgICB2b2lkICptYXBwaW5nOworICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBf
cHJvY2Vzc29yX2lkKCk7CisKKyAgICBwZyA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsK
KyAgICBpZiAoICFwZyApCisgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgdnBfYXNz
aXN0IHBhZ2UgZm9yICV1XG4iLCBjcHUpOworCisgICAgbWFwcGluZyA9IF9fbWFwX2RvbWFpbl9w
YWdlX2dsb2JhbChwZyk7CisgICAgaWYgKCAhbWFwcGluZyApCisgICAgICAgIHBhbmljKCJGYWls
ZWQgdG8gbWFwIHZwX2Fzc2lzdCBwYWdlIGZvciAldVxuIiwgY3B1KTsKKworICAgIGNsZWFyX3Bh
Z2UobWFwcGluZyk7CisKKyAgICB0aGlzX2NwdShodl92cF9hc3Npc3QpLm1hZGRyID0gcGFnZV90
b19tYWRkcihwZyk7CisgICAgdGhpc19jcHUoaHZfdnBfYXNzaXN0KS5tYXBwaW5nID0gbWFwcGlu
ZzsKKworICAgIHNldF92cF9hc3Npc3QoKTsKK30KKwogc3RhdGljIHZvaWQgX19pbml0IHNldHVw
KHZvaWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKICAgICBzZXR1cF9oeXBlcmNh
bGxfcGNwdV9hcmcoKTsKICAgICBzZXR1cF92cF9pbmRleCgpOworICAgIHNldHVwX3ZwX2Fzc2lz
dCgpOwogfQogCiBzdGF0aWMgdm9pZCBhcF9zZXR1cCh2b2lkKQogewogICAgIHNldHVwX2h5cGVy
Y2FsbF9wY3B1X2FyZygpOwogICAgIHNldHVwX3ZwX2luZGV4KCk7CisgICAgc2V0dXBfdnBfYXNz
aXN0KCk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKaW5kZXggNGI2MzU4MjlmMy4uOTE3ZjRlMDJjMiAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAorKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCkBAIC03MSw2ICs3MSw3IEBAIHN0cnVjdCBo
eXBlcnZfcGNwdV9wYWdlIHsKIH07CiBERUNMQVJFX1BFUl9DUFUoc3RydWN0IGh5cGVydl9wY3B1
X3BhZ2UsIGh2X3BjcHVfaW5wdXRfYXJnKTsKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQs
IGh2X3ZwX2luZGV4KTsKK0RFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSwg
aHZfdnBfYXNzaXN0KTsKIAogY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpoeXBlcnZfcHJv
YmUodm9pZCk7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
