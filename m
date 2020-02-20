Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D05C165E58
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXy-000201-2a; Thu, 20 Feb 2020 13:07:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXw-0001yq-63
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:07:16 +0000
X-Inumbo-ID: e423bf78-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e423bf78-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MwD83MRmvk9U4szTuvQnf8dMN/lBsu/ps/CgrjG/jog=;
 b=AuITvZ+Nps5lmurVgIAuEObN9X8ceztUdaRkZpru/lLXOBxm1f9lGBGEHWQVJid4YwYt6f
 Op+Gw4w8tMqRFEI5kik/IQFOO5NdP0WZ1MvYP5WtTL4M/HreQd3vPkuoZumUZOFXss083r
 eVxbF5mMKvt4hVaL4ejwM3mG/z+v1V0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-3gVD0Ri_Pwq1CUcNrF41AQ-1; Thu, 20 Feb 2020 08:07:03 -0500
Received: by mail-wm1-f70.google.com with SMTP id t17so798525wmi.7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3GOpiWMITxx9TtgKrEdUBt5MYBhcyKxmOeh0GtNqL3Q=;
 b=FKoE2FsIvp80yLNMmPbmDB0Rk9ruNhTZGR7ztbAaZZIyybTW28z1QgY1qljk1bs+eA
 CIJ8OMzL99GmpxqZCgXNLlS/STz69FFplLYwb7xp6M5yFKHHfSbq6nkpeiCcIXttdrK3
 Er1RxtQ1tWucyEjTXRRKorwwjJyWb7dquseJE+5ST/2zjuVhxRuCElCcRWj8+5bSa5+r
 zRfANjaYw04ZcU6qx8lNnV5uSo/djiDkT9mg8llphW9VAKsWCo/0JYyZCOASXqSm6rhh
 +6B1SV8Lj/YWDRZLuB0FQwx47oIkwUt1tRRMCDgpCZxenW4xWpTHAm/PWa704jmReuzI
 bBkA==
X-Gm-Message-State: APjAAAXwCjF2vHxGxjKYYlrKI4C1m+9Shab9JQUT/jBj/hCpHKu2Tq1M
 7J8RbJvoh5yCaNyZIYWf7hOiqXHK5I43RlIqTuk6RTQMdaFVdXVKzl2mGMbqZS4+5f9Q0ttuMjf
 Nc9RZrJpRxS8zj1lSgb2Fp6jGNEQ=
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr4438680wme.28.1582204021859; 
 Thu, 20 Feb 2020 05:07:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5fs9il9OncKFrjhrarKjFKFUysaRlKljcdDwQycfDDjjbJaA7nUH+Kd8+rszknwLmOaxWsA==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr4438660wme.28.1582204021604; 
 Thu, 20 Feb 2020 05:07:01 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:07:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:46 +0100
Message-Id: <20200220130548.29974-19-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: 3gVD0Ri_Pwq1CUcNrF41AQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 18/20] exec: Let cpu_[physical]_memory API
 use a boolean 'is_write' argument
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlICdpc193cml0ZScgYXJndW1lbnQgaXMgZWl0aGVyIDAgb3IgMS4KQ29udmVydCBpdCB0byBh
IGJvb2xlYW4gdHlwZS4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2V4ZWMvY3B1LWFsbC5oICAgIHwgIDIgKy0K
IGluY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmggfCAgNiArKystLS0KIGV4ZWMuYyAgICAgICAgICAg
ICAgICAgICAgfCAxMCArKysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oIGIv
aW5jbHVkZS9leGVjL2NwdS1hbGwuaAppbmRleCA0OWU5NmNhYTNmLi40OTM4NGJiNjZhIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oCisrKyBiL2luY2x1ZGUvZXhlYy9jcHUtYWxs
LmgKQEAgLTM4OCw3ICszODgsNyBAQCB2b2lkIGR1bXBfb3Bjb3VudF9pbmZvKHZvaWQpOwogI2Vu
ZGlmIC8qICFDT05GSUdfVVNFUl9PTkxZICovCiAKIGludCBjcHVfbWVtb3J5X3J3X2RlYnVnKENQ
VVN0YXRlICpjcHUsIHRhcmdldF91bG9uZyBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqcHRyLCB0YXJnZXRfdWxvbmcgbGVuLCBpbnQgaXNfd3JpdGUpOworICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAqcHRyLCB0YXJnZXRfdWxvbmcgbGVuLCBib29sIGlzX3dyaXRlKTsK
IAogaW50IGNwdV9leGVjKENQVVN0YXRlICpjcHUpOwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2V4
ZWMvY3B1LWNvbW1vbi5oIGIvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaAppbmRleCAxNjVmOGZi
NjIxLi42YmZlMjAxNzc5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2V4ZWMvY3B1LWNvbW1vbi5oCisr
KyBiL2luY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmgKQEAgLTcwLDcgKzcwLDcgQEAgc2l6ZV90IHFl
bXVfcmFtX3BhZ2VzaXplKFJBTUJsb2NrICpibG9jayk7CiBzaXplX3QgcWVtdV9yYW1fcGFnZXNp
emVfbGFyZ2VzdCh2b2lkKTsKIAogdm9pZCBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KGh3YWRkciBh
ZGRyLCB2b2lkICpidWYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdhZGRyIGxlbiwg
aW50IGlzX3dyaXRlKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVuLCBi
b29sIGlzX3dyaXRlKTsKIHN0YXRpYyBpbmxpbmUgdm9pZCBjcHVfcGh5c2ljYWxfbWVtb3J5X3Jl
YWQoaHdhZGRyIGFkZHIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmJ1ZiwgaHdhZGRyIGxlbikKIHsKQEAgLTgzLDkgKzgzLDkgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGNwdV9waHlzaWNhbF9tZW1vcnlfd3JpdGUoaHdhZGRyIGFkZHIsCiB9CiB2b2lk
ICpjcHVfcGh5c2ljYWxfbWVtb3J5X21hcChod2FkZHIgYWRkciwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGh3YWRkciAqcGxlbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCBpc193cml0ZSk7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGlzX3dy
aXRlKTsKIHZvaWQgY3B1X3BoeXNpY2FsX21lbW9yeV91bm1hcCh2b2lkICpidWZmZXIsIGh3YWRk
ciBsZW4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGlzX3dyaXRlLCBod2Fk
ZHIgYWNjZXNzX2xlbik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpc193
cml0ZSwgaHdhZGRyIGFjY2Vzc19sZW4pOwogdm9pZCBjcHVfcmVnaXN0ZXJfbWFwX2NsaWVudChR
RU1VQkggKmJoKTsKIHZvaWQgY3B1X3VucmVnaXN0ZXJfbWFwX2NsaWVudChRRU1VQkggKmJoKTsK
IApkaWZmIC0tZ2l0IGEvZXhlYy5jIGIvZXhlYy5jCmluZGV4IGI3OTkxOWE0ZjcuLjZjMzliNDMx
NTUgMTAwNjQ0Ci0tLSBhL2V4ZWMuYworKysgYi9leGVjLmMKQEAgLTMwMTksNyArMzAxOSw3IEBA
IE1lbW9yeVJlZ2lvbiAqZ2V0X3N5c3RlbV9pbyh2b2lkKQogLyogcGh5c2ljYWwgbWVtb3J5IGFj
Y2VzcyAoc2xvdyB2ZXJzaW9uLCBtYWlubHkgZm9yIGRlYnVnKSAqLwogI2lmIGRlZmluZWQoQ09O
RklHX1VTRVJfT05MWSkKIGludCBjcHVfbWVtb3J5X3J3X2RlYnVnKENQVVN0YXRlICpjcHUsIHRh
cmdldF91bG9uZyBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqcHRyLCB0YXJn
ZXRfdWxvbmcgbGVuLCBpbnQgaXNfd3JpdGUpCisgICAgICAgICAgICAgICAgICAgICAgICB2b2lk
ICpwdHIsIHRhcmdldF91bG9uZyBsZW4sIGJvb2wgaXNfd3JpdGUpCiB7CiAgICAgaW50IGZsYWdz
OwogICAgIHRhcmdldF91bG9uZyBsLCBwYWdlOwpAQCAtMzMxMyw3ICszMzEzLDcgQEAgTWVtVHhS
ZXN1bHQgYWRkcmVzc19zcGFjZV9ydyhBZGRyZXNzU3BhY2UgKmFzLCBod2FkZHIgYWRkciwgTWVt
VHhBdHRycyBhdHRycywKIH0KIAogdm9pZCBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KGh3YWRkciBh
ZGRyLCB2b2lkICpidWYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdhZGRyIGxlbiwg
aW50IGlzX3dyaXRlKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh3YWRkciBsZW4sIGJv
b2wgaXNfd3JpdGUpCiB7CiAgICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1v
cnksIGFkZHIsIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsCiAgICAgICAgICAgICAgICAgICAgICBi
dWYsIGxlbiwgaXNfd3JpdGUpOwpAQCAtMzYzMiwxNCArMzYzMiwxNCBAQCB2b2lkIGFkZHJlc3Nf
c3BhY2VfdW5tYXAoQWRkcmVzc1NwYWNlICphcywgdm9pZCAqYnVmZmVyLCBod2FkZHIgbGVuLAog
CiB2b2lkICpjcHVfcGh5c2ljYWxfbWVtb3J5X21hcChod2FkZHIgYWRkciwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGh3YWRkciAqcGxlbiwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGludCBpc193cml0ZSkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wg
aXNfd3JpdGUpCiB7CiAgICAgcmV0dXJuIGFkZHJlc3Nfc3BhY2VfbWFwKCZhZGRyZXNzX3NwYWNl
X21lbW9yeSwgYWRkciwgcGxlbiwgaXNfd3JpdGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQpOwogfQogCiB2b2lkIGNwdV9waHlzaWNhbF9tZW1v
cnlfdW5tYXAodm9pZCAqYnVmZmVyLCBod2FkZHIgbGVuLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCBpc193cml0ZSwgaHdhZGRyIGFjY2Vzc19sZW4pCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm9vbCBpc193cml0ZSwgaHdhZGRyIGFjY2Vzc19sZW4pCiB7CiAg
ICAgcmV0dXJuIGFkZHJlc3Nfc3BhY2VfdW5tYXAoJmFkZHJlc3Nfc3BhY2VfbWVtb3J5LCBidWZm
ZXIsIGxlbiwgaXNfd3JpdGUsIGFjY2Vzc19sZW4pOwogfQpAQCAtMzc5MCw3ICszNzkwLDcgQEAg
YWRkcmVzc19zcGFjZV93cml0ZV9jYWNoZWRfc2xvdyhNZW1vcnlSZWdpb25DYWNoZSAqY2FjaGUs
IGh3YWRkciBhZGRyLAogCiAvKiB2aXJ0dWFsIG1lbW9yeSBhY2Nlc3MgZm9yIGRlYnVnIChpbmNs
dWRlcyB3cml0aW5nIHRvIFJPTSkgKi8KIGludCBjcHVfbWVtb3J5X3J3X2RlYnVnKENQVVN0YXRl
ICpjcHUsIHRhcmdldF91bG9uZyBhZGRyLAotICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
cHRyLCB0YXJnZXRfdWxvbmcgbGVuLCBpbnQgaXNfd3JpdGUpCisgICAgICAgICAgICAgICAgICAg
ICAgICB2b2lkICpwdHIsIHRhcmdldF91bG9uZyBsZW4sIGJvb2wgaXNfd3JpdGUpCiB7CiAgICAg
aHdhZGRyIHBoeXNfYWRkcjsKICAgICB0YXJnZXRfdWxvbmcgbCwgcGFnZTsKLS0gCjIuMjEuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
