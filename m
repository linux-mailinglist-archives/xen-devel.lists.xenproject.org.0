Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEE13093D
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:51:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io94z-0003qc-Pi; Sun, 05 Jan 2020 16:48:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io94y-0003pz-H4
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:48:40 +0000
X-Inumbo-ID: 2cb8ba8c-2fdb-11ea-a914-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cb8ba8c-2fdb-11ea-a914-bc764e2007e4;
 Sun, 05 Jan 2020 16:48:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c127so10348821wme.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0cjj/lBQl0c9w1vDyVAOKv50SGygVYLUy39Nar8kbQ=;
 b=qqEb8PLbYwd+C8pWU6U9Z01IXdSrrma0roIdjxBrgKgPvumCHDa1ujNwFIaKwpE9QQ
 wkWkDfwCI/jYddKFQuUoYOMk+VspFVzI0bznyhSELZ6J5nDkUtLzf2442f4JW7j1YJhc
 Ki+M9Z4ZzwJi5rcQX1jkkQQuW6zn9CsiLyRmgsZ4MmfZwb8K+QxzZOeImGZ4QOKFMPhi
 JoW25wbNgKa+4ppgyQP6Cb9z7sYt2doz+yS9Vwfp0HDmn7b9uC9BHX6Ft+96CxEjr08R
 HbgJR4osfNI1s65vyqjI9SonmiPvRGurxRZPEMPCH0YQoSOABGuyadJ4Mtfed04mcORd
 KhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z0cjj/lBQl0c9w1vDyVAOKv50SGygVYLUy39Nar8kbQ=;
 b=nfQhJJzMb0rjetfPggissXHuSq6AwCa1Y92rwm4cU/ggs2hvRXDi/xbd0QflyTgYB0
 fT2mLAeNZ1n2fwUc6aJ0hZut0pb4rDVp+6SF9w6h9vqNtqRbcaIa36Qo//cdpo+d9F8K
 6KFw2LhtN80yCbO/XkuL/TeGKpse3ozt0q2PWZSctsri5FyelfbqTJqy8Mz6E5zv4il6
 b7iDvQOR9nbFZg7L5Z77aehDOEFRydNZDXC/VkufwZPchiMRVEVZAmn0fSI+8vSAUIA1
 f2T+x8RioN6AQUugBwW2aFr3tSVgC6lPkJgFuGf125bwam2cg/aM6d6tsrWU/JLkvQ3B
 kucg==
X-Gm-Message-State: APjAAAVcKW6zLWt9+ybktgsWDjezU2LUoDji4mD9LpwECjEsFRRkTt8l
 Djk0AcrLAs/bozJhsKBDYekkyQBqV94=
X-Google-Smtp-Source: APXvYqwzJDSMmx3E/QqOTDjHNRu3BYDa6GcOcWslL6+9+unRjR45tgun0vDm11rOLWIZGvMdNYUzzw==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
 x5mr29046737wmj.72.1578242897883; 
 Sun, 05 Jan 2020 08:48:17 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y139sm20834028wmd.24.2020.01.05.08.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:48:17 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun,  5 Jan 2020 16:48:01 +0000
Message-Id: <20200105164801.26278-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200105164801.26278-1-liuwe@microsoft.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 5/5] x86/hyperv: setup VP assist page
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
b21lIGJpdHMgaW4gaXQKZm9yIGVmZmljaWVudCBuZXN0ZWQgdmlydHVhbGlzYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KdjM6CjEuIFVzZSB4
ZW5oZWFwIHBhZ2UKMi4gRHJvcCBzZXRfdnBfYXNzaXN0Cgp2MjoKMS4gVXNlIEhWX0hZUF9QQUdF
X1NISUZUIGluc3RlYWQKLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggZTVmMjU4Yzk0Ni4uMTc0ODhmOGM0MCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0yOSw2ICsyOSw3IEBAIHN0cnVjdCBtc19oeXBlcnZf
aW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIGV4dGVybiBjaGFyIGh2X2h5cGVyY2FsbF9w
YWdlW107CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3BjcHVfaW5wdXRf
YXJnKTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGludCwgaHZfdnBfaW5k
ZXgpOworREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl92cF9hc3Npc3QpOwog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wczsKIGNvbnN0IHN0cnVjdCBo
eXBlcnZpc29yX29wcyAqX19pbml0IGh5cGVydl9wcm9iZSh2b2lkKQpAQCAtMTAxLDE1ICsxMDIs
MzUgQEAgc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZvaWQpCiAgICAgdGhp
c19jcHUoaHZfdnBfaW5kZXgpID0gdnBfaW5kZXhfbXNyOwogfQogCitzdGF0aWMgdm9pZCBzZXR1
cF92cF9hc3Npc3Qodm9pZCkKK3sKKyAgICB2b2lkICptYXBwaW5nOworICAgIHVpbnQ2NF90IHZh
bDsKKworICAgIG1hcHBpbmcgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKKyAgICBpZiAoICFtYXBw
aW5nICkKKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSB2cF9hc3Npc3QgcGFnZSBm
b3IgJXVcbiIsCisgICAgICAgICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSk7CisKKyAgICBjbGVh
cl9wYWdlKG1hcHBpbmcpOworCisgICAgdGhpc19jcHUoaHZfdnBfYXNzaXN0KSA9IG1hcHBpbmc7
CisgICAgdmFsID0gKHZpcnRfdG9fbWZuKG1hcHBpbmcpIDw8IEhWX0hZUF9QQUdFX1NISUZUKQor
ICAgICAgICB8IEhWX1g2NF9NU1JfVlBfQVNTSVNUX1BBR0VfRU5BQkxFOworICAgIHdybXNybChI
Vl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFLCB2YWwpOworfQorCiBzdGF0aWMgdm9pZCBfX2luaXQg
c2V0dXAodm9pZCkKIHsKICAgICBzZXR1cF9oeXBlcmNhbGxfcGFnZSgpOwogICAgIHNldHVwX2h5
cGVyY2FsbF9wY3B1X2FyZygpOworICAgIHNldHVwX3ZwX2Fzc2lzdCgpOwogfQogCiBzdGF0aWMg
dm9pZCBhcF9zZXR1cCh2b2lkKQogewogICAgIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpOwor
ICAgIHNldHVwX3ZwX2Fzc2lzdCgpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlz
b3Jfb3BzIG9wcyA9IHsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCmluZGV4IGJhZTA2Yzhh
M2EuLjJkZGZkNTNmOGMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaApAQCAtNjcsNiAr
NjcsNyBAQCBleHRlcm4gc3RydWN0IG1zX2h5cGVydl9pbmZvIG1zX2h5cGVydjsKIAogREVDTEFS
RV9QRVJfQ1BVKHZvaWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOwogREVDTEFSRV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOworREVDTEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfdnBf
YXNzaXN0KTsKIAogY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpoeXBlcnZfcHJvYmUodm9p
ZCk7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
