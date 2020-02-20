Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1809165E50
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:09:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lXF-0001Ig-Tk; Thu, 20 Feb 2020 13:06:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lXE-0001Hf-Si
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:32 +0000
X-Inumbo-ID: cff8233f-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cff8233f-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URr7V1M6RZkd8VsYjn8QuFWcMecDXO2sKYgxZu+xFU4=;
 b=OsIXN0Kk8sqDbDcM935ySQqlm95+2CQzDzr/Tne4Evf/5+C2Yr7jkoPNaOZhMPLfQDGlGr
 tr1O7xOLulKv35dvVSMEv8lygHwCgSA3fr5u+nRE3AMTmyJR9SL3T9QMrPeQy4k82d39Rr
 VCQc8xivOE1GRLo1bSnXCxErZy0jDC8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-Kkn2CV6lM3apO8CyjjFRgA-1; Thu, 20 Feb 2020 08:06:29 -0500
Received: by mail-wr1-f71.google.com with SMTP id d15so1715401wru.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijbOoyrS9Jz9oM+Px+EP5Y3MCyoKyJq//TyCsQeLfQM=;
 b=W8o+2Iajmvt8ZNlLGwUy9Vq8Y17DLQbHlbzEWUKU4p0g/b781auO/eUiTJJzpaMjVN
 KEWs1aiQF9+QLdQ5OT7/ZArQJqZWnX/KTygiwCWaARhzzM8MLN3MuSstJB4VH09DWyqf
 ubkn1hlRGdz6Ml9VFM3YdH0hNI5me1yJz2JJJUA+99peRevVJOk8lBQiRJL2Wh9IPbtA
 sh3vjXfscFAWadko+ukpdV/o/BwHFxM7lybriJbux/PgwV/atPZ/gsFg5/APRLV9C6oO
 9J3/2RmIrGoOl1CCpI9uCmhD3KpDWoGViItO5dPbSShSwhbHDp3WBNSTeqhgZqNnN1bO
 FpQQ==
X-Gm-Message-State: APjAAAUh2LnEL6kgr5nFD8WZvAM1wQbIQmplJT3Br+/5HjyA5n89IBQU
 PUqTma/DfawOLHB7U5DCM7KvZq1kkWDhr1jk/LLpg2VwyskbuqnXZDV6/MI+mUSHOjhUqkILHXX
 8hB92aBYUJtFF6aJsLFgB+nTQHoI=
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr4786409wmi.152.1582203988197; 
 Thu, 20 Feb 2020 05:06:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZ6/a+oKytvIxV32J43VlbJoelLuLW+rm04bNrtIDR5Tp2LK/nrGilhR3sl09VB9q8vLJTrw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr4786351wmi.152.1582203987812; 
 Thu, 20 Feb 2020 05:06:27 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:06:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:37 +0100
Message-Id: <20200220130548.29974-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200220130548.29974-1-philmd@redhat.com>
References: <20200220130548.29974-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Kkn2CV6lM3apO8CyjjFRgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 09/20] exec: Let the cpu_[physical]_memory
 API use void pointer arguments
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

QXMgd2UgYXJlIG9ubHkgZGVhbGluZyB3aXRoIGEgYmxvYiBidWZmZXIsIHVzZSBhIHZvaWQgcG9p
bnRlcgphcmd1bWVudC4gVGhpcyB3aWxsIGxldCB1cyBzaW1wbGlmeSBvdGhlciBBUElzLgoKU2ln
bmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgot
LS0KIGluY2x1ZGUvZXhlYy9jcHUtYWxsLmggICAgfCAyICstCiBpbmNsdWRlL2V4ZWMvY3B1LWNv
bW1vbi5oIHwgMiArLQogZXhlYy5jICAgICAgICAgICAgICAgICAgICB8IDggKysrKystLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZXhlYy9jcHUtYWxsLmggYi9pbmNsdWRlL2V4ZWMvY3B1LWFsbC5oCmluZGV4
IGU5Njc4MWE0NTUuLjQ5ZTk2Y2FhM2YgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZXhlYy9jcHUtYWxs
LmgKKysrIGIvaW5jbHVkZS9leGVjL2NwdS1hbGwuaApAQCAtMzg4LDcgKzM4OCw3IEBAIHZvaWQg
ZHVtcF9vcGNvdW50X2luZm8odm9pZCk7CiAjZW5kaWYgLyogIUNPTkZJR19VU0VSX09OTFkgKi8K
IAogaW50IGNwdV9tZW1vcnlfcndfZGVidWcoQ1BVU3RhdGUgKmNwdSwgdGFyZ2V0X3Vsb25nIGFk
ZHIsCi0gICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90ICpidWYsIHRhcmdldF91bG9uZyBs
ZW4sIGludCBpc193cml0ZSk7CisgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpwdHIsIHRh
cmdldF91bG9uZyBsZW4sIGludCBpc193cml0ZSk7CiAKIGludCBjcHVfZXhlYyhDUFVTdGF0ZSAq
Y3B1KTsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaCBiL2luY2x1ZGUv
ZXhlYy9jcHUtY29tbW9uLmgKaW5kZXggMDVhYzFhNWQ2OS4uMTY1ZjhmYjYyMSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaAorKysgYi9pbmNsdWRlL2V4ZWMvY3B1LWNvbW1v
bi5oCkBAIC02OSw3ICs2OSw3IEBAIHZvaWQgcWVtdV9yYW1fdW5zZXRfbWlncmF0YWJsZShSQU1C
bG9jayAqcmIpOwogc2l6ZV90IHFlbXVfcmFtX3BhZ2VzaXplKFJBTUJsb2NrICpibG9jayk7CiBz
aXplX3QgcWVtdV9yYW1fcGFnZXNpemVfbGFyZ2VzdCh2b2lkKTsKIAotdm9pZCBjcHVfcGh5c2lj
YWxfbWVtb3J5X3J3KGh3YWRkciBhZGRyLCB1aW50OF90ICpidWYsCit2b2lkIGNwdV9waHlzaWNh
bF9tZW1vcnlfcncoaHdhZGRyIGFkZHIsIHZvaWQgKmJ1ZiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBod2FkZHIgbGVuLCBpbnQgaXNfd3JpdGUpOwogc3RhdGljIGlubGluZSB2b2lkIGNw
dV9waHlzaWNhbF9tZW1vcnlfcmVhZChod2FkZHIgYWRkciwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqYnVmLCBod2FkZHIgbGVuKQpkaWZmIC0tZ2l0
IGEvZXhlYy5jIGIvZXhlYy5jCmluZGV4IDFhODAxNTk5OTYuLjAxNDM3YmU2OTEgMTAwNjQ0Ci0t
LSBhL2V4ZWMuYworKysgYi9leGVjLmMKQEAgLTMwMTksMTEgKzMwMTksMTIgQEAgTWVtb3J5UmVn
aW9uICpnZXRfc3lzdGVtX2lvKHZvaWQpCiAvKiBwaHlzaWNhbCBtZW1vcnkgYWNjZXNzIChzbG93
IHZlcnNpb24sIG1haW5seSBmb3IgZGVidWcpICovCiAjaWYgZGVmaW5lZChDT05GSUdfVVNFUl9P
TkxZKQogaW50IGNwdV9tZW1vcnlfcndfZGVidWcoQ1BVU3RhdGUgKmNwdSwgdGFyZ2V0X3Vsb25n
IGFkZHIsCi0gICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90ICpidWYsIHRhcmdldF91bG9u
ZyBsZW4sIGludCBpc193cml0ZSkKKyAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnB0ciwg
dGFyZ2V0X3Vsb25nIGxlbiwgaW50IGlzX3dyaXRlKQogewogICAgIGludCBmbGFnczsKICAgICB0
YXJnZXRfdWxvbmcgbCwgcGFnZTsKICAgICB2b2lkICogcDsKKyAgICB1aW50OF90ICpidWYgPSBw
dHI7CiAKICAgICB3aGlsZSAobGVuID4gMCkgewogICAgICAgICBwYWdlID0gYWRkciAmIFRBUkdF
VF9QQUdFX01BU0s7CkBAIC0zMzExLDcgKzMzMTIsNyBAQCBNZW1UeFJlc3VsdCBhZGRyZXNzX3Nw
YWNlX3J3KEFkZHJlc3NTcGFjZSAqYXMsIGh3YWRkciBhZGRyLCBNZW1UeEF0dHJzIGF0dHJzLAog
ICAgIH0KIH0KIAotdm9pZCBjcHVfcGh5c2ljYWxfbWVtb3J5X3J3KGh3YWRkciBhZGRyLCB1aW50
OF90ICpidWYsCit2b2lkIGNwdV9waHlzaWNhbF9tZW1vcnlfcncoaHdhZGRyIGFkZHIsIHZvaWQg
KmJ1ZiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVuLCBpbnQgaXNfd3Jp
dGUpCiB7CiAgICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1vcnksIGFkZHIs
IE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsCkBAIC0zNzg5LDEwICszNzkwLDExIEBAIGFkZHJlc3Nf
c3BhY2Vfd3JpdGVfY2FjaGVkX3Nsb3coTWVtb3J5UmVnaW9uQ2FjaGUgKmNhY2hlLCBod2FkZHIg
YWRkciwKIAogLyogdmlydHVhbCBtZW1vcnkgYWNjZXNzIGZvciBkZWJ1ZyAoaW5jbHVkZXMgd3Jp
dGluZyB0byBST00pICovCiBpbnQgY3B1X21lbW9yeV9yd19kZWJ1ZyhDUFVTdGF0ZSAqY3B1LCB0
YXJnZXRfdWxvbmcgYWRkciwKLSAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgKmJ1Ziwg
dGFyZ2V0X3Vsb25nIGxlbiwgaW50IGlzX3dyaXRlKQorICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqcHRyLCB0YXJnZXRfdWxvbmcgbGVuLCBpbnQgaXNfd3JpdGUpCiB7CiAgICAgaHdhZGRy
IHBoeXNfYWRkcjsKICAgICB0YXJnZXRfdWxvbmcgbCwgcGFnZTsKKyAgICB1aW50OF90ICpidWYg
PSBwdHI7CiAKICAgICBjcHVfc3luY2hyb25pemVfc3RhdGUoY3B1KTsKICAgICB3aGlsZSAobGVu
ID4gMCkgewotLSAKMi4yMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
