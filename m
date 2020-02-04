Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07C151D71
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0GF-0001FF-RM; Tue, 04 Feb 2020 15:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0GE-0001F2-8x
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:10 +0000
X-Inumbo-ID: 348737a2-4764-11ea-8396-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 348737a2-4764-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so3805495wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fqANxVLhM2I9zrhppkMQYTW4mO2FrIkIERz5fgKt3g8=;
 b=qUrvFbbiAPTxE5wefhRZpzQauR07HUTX/XdtyBrriRS0+e1Tgr0lgTlJXxY5Aql+bE
 LOGhODfxJGkfLVAF0ZzZZRDhFd9npZKKzP9UDzbynFsW996CKSrhpp7QaGNA4fMZaYr3
 rdNH30adXkUfihhvYwIDVynOo1aOsJ0omNhJhSYYne5+WqrWZCzppXDdC9s5vDZy1JLi
 FzxjxzNfcBN/En1wNFQasWM6y1HWugKfiC9LuyrYD3mYfPT2/xGKGQF5PDKcNLCBOsyn
 to8NmiIk1kSfzy0sLdD3Gg8I1ygw4VuZ8sipF6mSNehLM+ar7rwakRj/QdJBtGk3SkwG
 AO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fqANxVLhM2I9zrhppkMQYTW4mO2FrIkIERz5fgKt3g8=;
 b=Z59mjasennfqHhDKs1FL7eRrudNqQ7Xxv7Dt6ER3LdhCcXXK2nzG3fzlEYjkKp4fIL
 UBWCe/xA1ff7BnOvAgV87bJPTnZYWnZT/SmVGfLzeC6H9HvGS0xDLyXzF8boySVCG5AH
 JvmgiZs0Qc3dB5VeBA4bti5H8TW2Vo7CIgLWsIBNFNdDr/d5SnSGVbnEO77TbkzUTcWZ
 sODVjL/MRq5VmFX0tCbEo5/wjni/qkT4PcZ6F87xeJ0J4hswR/DF2dGG93XL//RfaZId
 s9fluJTu6JS/ihKUq6gMBb1AHmBDpckmsepj28qYMkQKNuNSql9mwLdUrw0aZtmrpw41
 5YLA==
X-Gm-Message-State: APjAAAWCjULicW2rR1cYKZ1H1HyvyoKFI89v9sNg3Yrhfa1dQHAygfVM
 Uk0n69jnm6wihmpCro/Kl7+iTb/7oQo=
X-Google-Smtp-Source: APXvYqxtwiTmzJtWJRjCVBxLAoNs5qdtOX86pGXVQ55er46q1XqW2oa9Cc0HeDZgb0UY4lD2l16Lqw==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr6368542wma.8.1580830628612;
 Tue, 04 Feb 2020 07:37:08 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:07 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:36:54 +0000
Message-Id: <20200204153704.15934-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 00/10] More Hyper-V infrastructures
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJlaXMgaW1wbGVtZW50cyBzZXZlcmFsIGltcG9ydGFudCBmdW5jdGlvbmFs
aXRpZXMgdG8gcnVuClhlbiBvbiB0b3Agb2YgSHlwZXItVi4gU2VlIGluZGl2aWR1YWwgcGF0Y2hl
cyBmb3IgbW9yZSBkZXRhaWxzLgoKSSd2ZSBjaGVja2VkIHRoZSBhc3NlbWJseSBjb2RlIGFzIHdl
bGwgYXMgcHV0dGluZyBpbiBhIHRlc3QgcGF0Y2ggdG8KbWFrZSBzdXJlIHRoZSBoeXBlcmNhbGwg
aW50ZXJmYWNlIGlzIGltcGxlbWVudGVkIGNvcnJlY3RseS4KCldlaS4KCkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jv
c29mdC5jb20+CkNjOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpXZWkgTGl1
ICgxMCk6CiAgeDg2L2h5cGVydmlzb3I6IG1ha2UgaHlwZXJ2aXNvcl9hcF9zZXR1cCByZXR1cm4g
YW4gZXJyb3IgY29kZQogIHg4Ni9zbXA6IGRvbid0IG9ubGluZSBjcHUgaWYgaHlwZXJ2aXNvcl9h
cF9zZXR1cCBmYWlscwogIHg4NjogcHJvdmlkZSBleGVjdXRhYmxlIGZpeG1hcCBmYWNpbGl0eQog
IHg4Ni9oeXBlcnZpc29yOiBwcm92aWRlIGh5cGVydmlzb3JfZml4dXBfZTgyMAogIHg4Ni9oeXBl
cnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlCiAgeDg2L2h5cGVydjogcHJvdmlkZSBIeXBlci1WIGh5
cGVyY2FsbCBmdW5jdGlvbnMKICBETyBOT1QgQVBQTFk6IHg4Ni9oeXBlcnY6IGlzc3VlIGFuIGh5
cGVyY2FsbAogIHg4Ni9oeXBlcnY6IHByb3ZpZGUgcGVyY3B1IGh5cGVyY2FsbCBpbnB1dCBwYWdl
CiAgeDg2L2h5cGVydjogcmV0cmlldmUgdnBfaW5kZXggZnJvbSBIeXBlci1WCiAgeDg2L2h5cGVy
djogc2V0dXAgVlAgYXNzaXN0IHBhZ2UKCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICAgICAgICAgICAg
ICAgfCAgMTUgKystCiB4ZW4vYXJjaC94ODYvZTgyMC5jICAgICAgICAgICAgICAgICAgICAgIHwg
ICA0ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgIHwgMTU0ICsr
KysrKysrKysrKysrKysrKysrKystCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUu
aCAgICAgIHwgIDMxICsrKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgICAg
ICAgIHwgIDEyICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAgICAgIHwg
IDY1ICsrKysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYyAgICAgICAgICAgICAgICAg
fCAgIDMgKy0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQg
KystCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jICAgICAgICAgICAgICAgICAgIHwgIDEyICstCiB4
ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgICAgICAgICAgIHwgICA1ICsKIHhlbi9pbmNs
dWRlL2FzbS14ODYvYXNtX2RlZm5zLmggICAgICAgICAgfCAgIDUgKwogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9jb25maWcuaCAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9m
aXhtYXAuaCAgICAgICAgICAgICB8ICAyNCArKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydi1oY2FsbC5oIHwgIDk3ICsrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2d1ZXN0L2h5cGVydi10bGZzLmggIHwgICA1ICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydi5oICAgICAgIHwgICAzICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5oICAgfCAgMTIgKy0KIDE4IGZpbGVzIGNoYW5nZWQsIDQxOSBpbnNlcnRpb25zKCspLCA0
NSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3ByaXZhdGUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2LWhjYWxsLmgKCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
