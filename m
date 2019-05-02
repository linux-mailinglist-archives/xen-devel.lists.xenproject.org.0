Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C6124DE
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 00:57:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMKb9-0002Rg-4E; Thu, 02 May 2019 22:54:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o+so=TC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hMKb7-0002Rb-Ua
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:54:37 +0000
X-Inumbo-ID: 42548909-6d2d-11e9-843c-bc764e045a96
Received: from mail-it1-f195.google.com (unknown [209.85.166.195])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42548909-6d2d-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 22:54:36 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id l140so6363810itb.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 15:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zad7UzS0oSrKwD0UNNX35x5OxLouSQ7/e9qF9sRHK3w=;
 b=PRtUfyjsST3AGWIT4bmxhg15frocn82Fr85ACneaZciWhtDru8dVYYuQZt8ufjSot7
 9XZBEuSGaYBTOaEFAUTq+M4HVHd5jTIp4s5N41vtlSiMpU7vzTdFCC1csunSRNnXIVbL
 zRy8ZJ5WF45uSNFcFBQG+2wHMfEuGx8iJWw4V67oTA9Wl/EceqawgUS8GBewFNo+eFnR
 n5MqLyCLZd5RQ7c37cjIeCGnGntCRAXSTKCjwDnPN5flVRMBR55qTVMtd5SB8R4g+3FG
 zkWHpjcYCdEEqS+/u5en5MsZDBv8EGbBIS+DgHr94uQo3cyse6UsWsv3tmcJ+t4OXQIi
 RpgQ==
X-Gm-Message-State: APjAAAUNx//Dq2f2Aiw/MSmmKvzmpJJkUx79Vspf/+FjxqkvHg4flU6Y
 MROO0eet3DFiPUeKr5AMW7Oh14vb
X-Google-Smtp-Source: APXvYqwG4qy69OE+8tMltb2lDDNYi0zykIrPmM5h7BMJE34R0/3zkcs/2CPvOUlBQP/B6B0yLyNGXw==
X-Received: by 2002:a24:1a4e:: with SMTP id 75mr4246720iti.131.1556837675985; 
 Thu, 02 May 2019 15:54:35 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id d4sm182121ioh.35.2019.05.02.15.54.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 15:54:34 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 16:54:30 -0600
Message-Id: <20190502225430.5565-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVjZWl2aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRyb3NwZWN0aW5nIDMyLWJp
dCBXaW5kb3dzIHdoZW4gdGhlCmV2ZW50IGJlaW5nIHRyYXBwZWQgaGFwcGVuZWQgd2hpbGUgaW4g
cmluZzMuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5j
b20+CkNjOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkNjOiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6IFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQp2MjogYWRkIGdkdHIgbGltaXQKdjM6IHVzZSB1
aW50MzJfdCB0byBmaXQgdGhlIDIwIGJpdHMKLS0tCiB4ZW4vYXJjaC94ODYvdm1fZXZlbnQuYyAg
ICAgICB8IDYgKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCB8IDUgKysrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMK
aW5kZXggNTFjMzQ5M2IxZC4uNTJjMmE3MWZhMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Zt
X2V2ZW50LmMKKysrIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKQEAgLTE3OSw2ICsxNzksMTEg
QEAgc3RhdGljIHZvaWQgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKGVudW0geDg2X3Nl
Z21lbnQgc2VnbWVudCwKICAgICAgICAgcmVnLT5lc19zZWwgPSBzZWcuc2VsOwogICAgICAgICBi
cmVhazsKIAorICAgIGNhc2UgeDg2X3NlZ19nZHRyOgorICAgICAgICByZWctPmdkdHJfYmFzZSA9
IHNlZy5iYXNlOworICAgICAgICByZWctPmdkdHJfbGltaXQgPSBzZWcubGltaXQ7CisgICAgICAg
IGJyZWFrOworCiAgICAgZGVmYXVsdDoKICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CiAg
ICAgfQpAQCAtMjM4LDYgKzI0Myw3IEBAIHZvaWQgdm1fZXZlbnRfZmlsbF9yZWdzKHZtX2V2ZW50
X3JlcXVlc3RfdCAqcmVxKQogICAgIHZtX2V2ZW50X3BhY2tfc2VnbWVudF9yZWdpc3Rlcih4ODZf
c2VnX3NzLCAmcmVxLT5kYXRhLnJlZ3MueDg2KTsKICAgICB2bV9ldmVudF9wYWNrX3NlZ21lbnRf
cmVnaXN0ZXIoeDg2X3NlZ19kcywgJnJlcS0+ZGF0YS5yZWdzLng4Nik7CiAgICAgdm1fZXZlbnRf
cGFja19zZWdtZW50X3JlZ2lzdGVyKHg4Nl9zZWdfZXMsICZyZXEtPmRhdGEucmVncy54ODYpOwor
ICAgIHZtX2V2ZW50X3BhY2tfc2VnbWVudF9yZWdpc3Rlcih4ODZfc2VnX2dkdHIsICZyZXEtPmRh
dGEucmVncy54ODYpOwogCiAgICAgcmVxLT5kYXRhLnJlZ3MueDg2LnNoYWRvd19ncyA9IGN0eHQu
c2hhZG93X2dzOwogICAgIHJlcS0+ZGF0YS5yZWdzLng4Ni5kcjYgPSBjdHh0LmRyNjsKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oIGIveGVuL2luY2x1ZGUvcHVibGlj
L3ZtX2V2ZW50LmgKaW5kZXggYjJiYWZjMGQ3Ny4uNDQ4YzdkNWFiOSAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2
ZW50LmgKQEAgLTI5LDcgKzI5LDcgQEAKIAogI2luY2x1ZGUgInhlbi5oIgogCi0jZGVmaW5lIFZN
X0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMDQKKyNkZWZpbmUgVk1fRVZFTlRfSU5U
RVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAwNQogCiAjaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZp
bmVkKF9fWEVOX1RPT0xTX18pCiAKQEAgLTE5OCw2ICsxOTgsNyBAQCBzdHJ1Y3Qgdm1fZXZlbnRf
cmVnc194ODYgewogICAgIHVpbnQ2NF90IG1zcl9lZmVyOwogICAgIHVpbnQ2NF90IG1zcl9zdGFy
OwogICAgIHVpbnQ2NF90IG1zcl9sc3RhcjsKKyAgICB1aW50NjRfdCBnZHRyX2Jhc2U7CiAgICAg
dWludDMyX3QgY3NfYmFzZTsKICAgICB1aW50MzJfdCBzc19iYXNlOwogICAgIHVpbnQzMl90IGRz
X2Jhc2U7CkBAIC0yMTEsMTMgKzIxMiwxMyBAQCBzdHJ1Y3Qgdm1fZXZlbnRfcmVnc194ODYgewog
ICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0b3JfcmVnIGZzOwogICAgIHN0cnVjdCB2bV9l
dmVudF94ODZfc2VsZWN0b3JfcmVnIGdzOwogICAgIHVpbnQ2NF90IHNoYWRvd19nczsKKyAgICB1
aW50MzJfdCBnZHRyX2xpbWl0OwogICAgIHVpbnQxNl90IGNzX3NlbDsKICAgICB1aW50MTZfdCBz
c19zZWw7CiAgICAgdWludDE2X3QgZHNfc2VsOwogICAgIHVpbnQxNl90IGVzX3NlbDsKICAgICB1
aW50MTZfdCBmc19zZWw7CiAgICAgdWludDE2X3QgZ3Nfc2VsOwotICAgIHVpbnQzMl90IF9wYWQ7
CiB9OwogCiAvKgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
