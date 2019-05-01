Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD331106D
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 01:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLz1M-00022G-Sx; Wed, 01 May 2019 23:52:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9NrI=TB=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hLz1K-00022A-Le
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 23:52:14 +0000
X-Inumbo-ID: 23f5124b-6c6c-11e9-843c-bc764e045a96
Received: from mail-io1-f65.google.com (unknown [209.85.166.65])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 23f5124b-6c6c-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 23:52:12 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v9so465132iol.10
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 16:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cf6vKFNwGM0PHmy+EJAYnp49+CosnrTWDO07bloEDYc=;
 b=rDGocOHoMdaJim0F8AEvP0zel11S5xHPUWPIiyhxiGZV0b1slN+Sen7G4qjEgMmqBM
 /zvTC5mDjWJzkEMHp+5MiHlorHrdIA886m4VTXMIpC429VK5HfC4F58SiBqzLRd/jhj5
 IRjxC1p/WGG5m0vY8oTQiLG+zurtRlrhUQVoRmxudsTw4Fi19CmE996Rdt2IKIxAZGaw
 QN2VE1Wo0CBJFtw7Yn+AboW9USZHR5Z25fo25Makc/2bMz5XHpQL/CsfRAoWbSPMFzmJ
 jTc7kHiVYLQJWfkpMp0ABoxAP3DiQK31mCR369VtAT68Lt/pdPDcFzfsOWfJ2vHV1Cq4
 7LhQ==
X-Gm-Message-State: APjAAAU2RQBP8dDpRNtpS/iVzxVBpxxVjlkYV4xQ91V40A0/Vjg5uE5F
 kzuZEQo8BbGVrv3BRNUNi5hqDD6p
X-Google-Smtp-Source: APXvYqx9VbgalZWpr7I0fe7Z4g4J8FG6dnni8Tg5ov5NBWVn7OXLMZwnvbAnxqdjcv5+XZlAfMcg9g==
X-Received: by 2002:a6b:b7c2:: with SMTP id h185mr390145iof.263.1556754732111; 
 Wed, 01 May 2019 16:52:12 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id l20sm8384034ioh.83.2019.05.01.16.52.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 May 2019 16:52:10 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  1 May 2019 17:52:03 -0600
Message-Id: <20190501235203.1179-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow value
 for current vCPU
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
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZSBnc19zaGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hlbiB0aGUgdkNQ
VSBpcyBiZWluZyBzY2hlZHVsZWQKb3V0IGJ5IFhlbi4gUmVwb3J0aW5nIHRoaXMgKHVzdWFsbHkp
IHN0YWxlIHZhbHVlIHRocm91Z2ggdm1fZXZlbnQgaXMgaW5jb3JyZWN0LApzaW5jZSBpdCBkb2Vz
bid0IHJlcHJlc2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRo
ZSBldmVudAp3YXMgcmVjb3JkZWQuIFRoaXMgcHJldmVudHMgdm1fZXZlbnQgc3Vic2NyaWJlcnMg
ZnJvbSBjb3JyZWN0bHkgZmluZGluZyBrZXJuZWwKc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hl
biBpdCBpcyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgoKUmVmcmVzaCBzaGFkb3dfZ3MgdmFsdWUg
d2hlbiB0aGUgY29udGV4dCBiZWluZyBzYXZlZCBpcyBmb3IgdGhlIGN1cnJlbnQgdkNQVS4KClNp
Z25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KQ2M6IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KQ2M6IEp1biBOYWthamlt
YSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0K
djI6IG1vdmUgZml4IHRvIGh2bSBzbyB2bV9ldmVudCBkb2Vzbid0IGhhdmUgdG8ga25vdyBzcGVj
aWZpY3MKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCmluZGV4IDI4M2ViN2IzNGQuLjUx
NTRlY2MyYTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC03NzksMTIgKzc3OSwxNyBAQCBzdGF0aWMgdm9p
ZCB2bXhfbG9hZF9jcHVfc3RhdGUoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpk
YXRhKQogCiBzdGF0aWMgdm9pZCB2bXhfc2F2ZV92bWNzX2N0eHQoc3RydWN0IHZjcHUgKnYsIHN0
cnVjdCBodm1faHdfY3B1ICpjdHh0KQogeworICAgIGlmICggdiA9PSBjdXJyZW50ICkKKyAgICAg
ICAgdm14X3NhdmVfZ3Vlc3RfbXNycyh2KTsKKwogICAgIHZteF9zYXZlX2NwdV9zdGF0ZSh2LCBj
dHh0KTsKICAgICB2bXhfdm1jc19zYXZlKHYsIGN0eHQpOwogfQogCiBzdGF0aWMgaW50IHZteF9s
b2FkX3ZtY3NfY3R4dChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmN0eHQpCiB7
CisgICAgQVNTRVJUKHYgIT0gY3VycmVudCk7CisKICAgICB2bXhfbG9hZF9jcHVfc3RhdGUodiwg
Y3R4dCk7CiAKICAgICBpZiAoIHZteF92bWNzX3Jlc3RvcmUodiwgY3R4dCkgKQotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
