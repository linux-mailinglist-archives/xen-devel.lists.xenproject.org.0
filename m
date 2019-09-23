Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEAEBB203
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:13:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLHn-0006oA-Bo; Mon, 23 Sep 2019 10:09:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLHm-0006o5-99
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:09:38 +0000
X-Inumbo-ID: 3f96f8aa-ddea-11e9-978d-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f96f8aa-ddea-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so8597347wmi.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxSmSyH8rh0b6FSX+opTdkwSk+odZPTYcviyJsiQBDI=;
 b=T/ztLkOaWk5DOP/HdR1pMS/KY/JiEC5faXhJ95RK7uCOFeP3iiM09oivMfJBmjqPek
 So+bjbmsL3+ZCO/LpSdD3PqAzYz+PiccgXjaRrQn9KQ86BwOURkvT4/wsESV7eYo69ze
 tDwKoI5C6zbRWN7eXQUvoAATClhkxtmGAIx05xije+M7DkX8yyCO/zyoJK5CsCYhlkof
 uUBCFlCt5SFLXHI3nn9xtzl0X3Vqd/6cxzVPRngdbDBFTQpzxc3bXX1u4gUSLQIjttb8
 l+8tKq/LTLVwGxY4Lvtt4vP7n/a86wqYNHtT+3KOwqwkutcQSwq/HHS/rxHT9DMYdvpc
 40eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zxSmSyH8rh0b6FSX+opTdkwSk+odZPTYcviyJsiQBDI=;
 b=uN8G9t9sgNAsvrDGDw38v6PpCq7n/5bcqZjT8DBKVdzFHYpkkYSHA+NXdiWFxQoCWH
 xb72bB/wkBWHmyuf+f/oa8uSEfsE4C0KIKWEGStwO9W3WDVIo1GFTOu9bEBvR6jEsPRk
 2JGds0yWu54TedtrFPVSlO6J4L7OgQO1mCeVc6TpRBTnyT1az2H6d+YjcTdCiHguI8vO
 DgwWiIohux2cV5V03yWk/9nXOB9R/3Rar1mWha5P4ecq2l2Ew55dKW/zk/y6J+h/uILv
 RIYsWoBEw78cT6d31KizjJ2QEPE5PA8vz5TKgK/VR33oGghbISnS7tEKTZiOWfVtlJ2Z
 H2Ig==
X-Gm-Message-State: APjAAAWPFzE0ZTPaBQhjbvvxmQp8kFUZ0YTHDWBGfTkOERzKEr7RM2Aj
 fPfcZHrui27wMMUb2vXAxvk77FEM
X-Google-Smtp-Source: APXvYqxrWgOIFpmGp2CUhqpkte/gY4bduvMv4pczj5/J0KOej7DnG3fE2ORvwzAM0H7x91TLL3t2tQ==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr13119868wme.55.1569233376576; 
 Mon, 23 Sep 2019 03:09:36 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:36 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:23 +0100
Message-Id: <20190923100931.29670-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpJbiBjYXNlIHlvdSdyZSB3b25kZXJpbmcsIEkgY2FuIGFscmVhZHkgcnVuIGEgZnVs
bHkgZmxlZGdlZCBYZW4gc3lzdGVtIG9uCkh5cGVyLVYgd2l0aCBlbXVsYXRlZCBkaXNrIGFuZCBu
ZXR3b3JrLgoKVGhpcyBpcyB0aGUgdmVyeSBmaXJzdCBzdGFnZSBmb3IgcG9ydGluZyBYZW4gdG8g
cnVuIG9uIEh5cGVyLVYgd2l0aCBhbGwgdGhlCmdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIu
ICBXaXRoIHRoaXMgc2VyaWVzLCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKSHlwZXItViBh
bmQgcHJpbnRzIG91dCBhIG1lc3NhZ2UuICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0IHRoZSBk
aXJlY3RvcnkKc3RydWN0dXJlIGFuZCBrY29uZmlnIG9wdGlvbnMgYWdyZWVkIHVwb24uCgpUaGVy
ZSBhcmUgdHdvIG1ham9yIGFyZWFzIHRvIGJlIHdvcmtlZCBvbjoKICAqIE1ha2UgRG9tMCBhYmxl
IHRvIHVzZSBIeXBlci1WJ3Mgc3ludGhldGljIGRldmljZXMuCiAgKiBNYWtlIFhlbiB1c2Ugb2Yg
dGhlIHN5bnRoZXRpYyB0aW1lciwgcmVmZXJlbmNlIFRTQyBhbmQgZW5saWdodGVubWVudCBWTUNT
CiAgICBhbmQgb3RoZXIgaW50ZXJmYWNlcy4KClRoZXkgYXJlbid0IHRyaXZpYWwsIGFuZCB0aW1l
IGNhbiBiZSBzY2FyY2Ugb24gbXkgc2lkZSwgc28gSSBpbnRlbmQgdG8gcG9zdApwYXRjaGVzIHBp
ZWNlIG1lYWwgd2hlbiB0aGV5IGFyZSByZWFkeS4KClF1ZXN0aW9ucyBhbmQgY29tbWVudHMgYXJl
IHdlbGNvbWUuCgpUaGFua3MsCldlaS4KCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ2M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKV2VpIExpdSAoOCk6CiAgeDg2OiBpbnRyb2R1Y2UgQ09ORklHX0dVRVNUIGFuZCBtb3Zl
IGNvZGUKICB4ODY6IGluY2x1ZGUgYXNtX2RlZm5zLmggZGlyZWN0bHkgaW4gaHlwZXJjYWxsLmgK
ICB4ODY6IGRyb3AgaHlwZXJ2aXNvcl9jcHVpZF9iYXNlCiAgeDg2OiBmYWN0b3Igb3V0IHhlbiB2
YXJpYW50cyBmb3IgaHlwZXJ2aXNvciBzZXR1cCBjb2RlCiAgeDg2OiBmYWN0b3Igb3V0IGh5cGVy
dmlzb3IgYWdub3N0aWMgY29kZQogIHg4NjogbWFrZSBwcm9iZV94ZW4gcmV0dXJuIGJvb2xlYW4g
dmFsdWUKICB4ODY6IGludHJvZHVjZSBDT05GSUdfSFlQRVJWIGFuZCBoeXBlcnYgZGlyZWN0b3J5
CiAgeDg2OiBiZSBtb3JlIHZlcmJvc2Ugd2hlbiBydW5uaW5nIG5lc3RlZAoKIHhlbi9hcmNoL3g4
Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArKwogeGVuL2FyY2gveDg2
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYv
Z3Vlc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCiB4ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jICAgICAgICAgICAgfCAgNjMgKysrKysrKysrKwogeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgICAgICAgIHwgMTE2ICsrKysrKysrKysrKysr
KysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICA0
ICsKIHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vaHlwZXJjYWxsX3BhZ2UuUyB8ICAgMAog
eGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9wdmgtYm9vdC5jICAgICAgIHwgICAwCiB4ZW4v
YXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCAgNzMgKystLS0tLS0t
LS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsr
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmggICAgICAgICAgICAgICAgICAgfCAgIDIgKwog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCAgICAgICAgIHwgICAyICsKIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICAgICAgICB8ICA0OCArKysrKysr
KwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggICAgICAgIHwgIDU4ICsr
KysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCAgICAgICAgICAgICAgIHwg
IDIzICstLS0KIDE3IGZpbGVzIGNoYW5nZWQsIDMzNyBpbnNlcnRpb25zKCspLCA4NyBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2Vm
aWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL01ha2VmaWxlCiByZW5hbWUg
eGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5TICgxMDAlKQogcmVu
YW1lIHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vcHZoLWJvb3QuYyAoMTAwJSkKIHJlbmFt
ZSB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICg4MCUpCiBjcmVhdGUgbW9kZSAx
MDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCgotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
