Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC12DC275
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 12:15:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLPGF-00044o-CK; Fri, 18 Oct 2019 10:13:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLPGD-00044j-Hi
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 10:13:29 +0000
X-Inumbo-ID: edd1f859-f18f-11e9-93dd-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edd1f859-f18f-11e9-93dd-12813bfff9fa;
 Fri, 18 Oct 2019 10:13:28 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E9B018E582
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 10:13:27 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id j2so2394665wrg.19
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 03:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TtpeVOU0CB3Z5Pi14TfQb3eoNoka1C+7OsdVoDAEyJQ=;
 b=NuGrq96MOoMsKjfkvw5BR601csHdFqmpsyFZ2rTNNHCEwYWraHhFVjTiB6a9aU6KZo
 YUM7UoYnb1ss7p3V1KjHrpMhDkNPO+SYSGHExBBrxaMdybzyzIKhyy2YVrP8gtmdwhjk
 7yKRSXinJJkndBhGadx+eANOOor/y6iB+7qc69SWzE558tDRas1G+pJ64lgzOgKXlDDW
 s3SAJreyS0O8cqzPttGLhUT7RDh1+nEdcIisj7FP1PIGFE/3R03XQQfdflY89Pn+0pKT
 JDy3g6c6qf3gHnsL9E5W4udiWebiQ6Fayj25rzICGaDe1hMZdcnVmEgdTtFKt7Ly/oC8
 sTvw==
X-Gm-Message-State: APjAAAVL8tBEt9wixYUCm2hW0p4d/vVRayfqkFSYuMDD8PVLdoL4npyf
 JWQ7ii8qUhft5LKNOdD8fhJOI3+2OYVD7j2QIl6BfOL3qKqUXVjhelgHbQMBTPTV/6Rbu28efl8
 KXMWgtkixanfAyzAdz+vMBbjdfIw=
X-Received: by 2002:adf:f342:: with SMTP id e2mr7526506wrp.61.1571393606556;
 Fri, 18 Oct 2019 03:13:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+3NzNQn9FvsIQOtta1OOWdkuNxGj4MR/rBLllahR05nKUHca1ThqhXDg1PMLWRrtb4OsFgQ==
X-Received: by 2002:adf:f342:: with SMTP id e2mr7526470wrp.61.1571393606316;
 Fri, 18 Oct 2019 03:13:26 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id y3sm9244642wro.36.2019.10.18.03.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 03:13:25 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-27-philmd@redhat.com>
 <CAL1e-=jVr+idQKNdOGSrODeq7XU-0JcCFTwapqk9-JvAKxk6Pw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e149d24f-8d77-4126-8fc8-012b114dfe37@redhat.com>
Date: Fri, 18 Oct 2019 12:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=jVr+idQKNdOGSrODeq7XU-0JcCFTwapqk9-JvAKxk6Pw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 26/32] hw/pci-host/piix: Move RCR_IOPORT
 register definition
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTgvMTkgMTE6MTkgQU0sIEFsZWtzYW5kYXIgTWFya292aWMgd3JvdGU6Cj4gT24gVHVl
c2RheSwgT2N0b2JlciAxNSwgMjAxOSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBy
ZWRoYXQuY29tIAo+IDxtYWlsdG86cGhpbG1kQHJlZGhhdC5jb20+PiB3cm90ZToKPiAKPiAgICAg
RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZyA8bWFpbHRvOmY0
YnVnQGFtc2F0Lm9yZz4+Cj4gCj4gICAgIFRoZSBSQ1JfSU9QT1JUIHJlZ2lzdGVyIGJlbG9uZ3Mg
dG8gdGhlIFBJSVggY2hpcHNldC4KPiAgICAgTW92ZSB0aGUgZGVmaW5pdGlvbiB0byAicGlpeC5o
Ii4KPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxt
ZEByZWRoYXQuY29tCj4gICAgIDxtYWlsdG86cGhpbG1kQHJlZGhhdC5jb20+Pgo+ICAgICAtLS0K
PiAgICAgIMKgaHcvcGNpLWhvc3QvcGlpeC5jwqAgwqAgwqAgwqAgwqAgwqAgfCAxICsKPiAgICAg
IMKgaW5jbHVkZS9ody9pMzg2L3BjLmjCoCDCoCDCoCDCoCDCoCB8IDYgLS0tLS0tCj4gICAgICDC
oGluY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oIHwgNiArKysrKysKPiAgICAgIMKgMyBmaWxl
cyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gCj4gRG9lcyBp
dCBtYWtlIHNlbnNlIHRvIGFkZCBwcmVmaXggUElJWF8gb3IgYSBzaW1pbGFyIG9uZSB0byB0aGUg
cmVnaXN0ZXIgCj4gbmFtZT8KCkdvb2QgaWRlYSwgaXQgd2lsbCBtYWtlIHRoZSBjb21tZW50IGlu
IGh3L2kzODYvYWNwaS1idWlsZC5jOjIxMyBjbGVhbmVyOgoKICAgICAvKiBUaGUgYWJvdmUgbmVl
ZCBub3QgYmUgY29uZGl0aW9uYWwgb24gbWFjaGluZSB0eXBlIGJlY2F1c2UgdGhlIApyZXNldCBw
b3J0CiAgICAgICogaGFwcGVucyB0byBiZSB0aGUgc2FtZSBvbiBQSUlYIChwYykgYW5kIElDSDkg
KHEzNSkuICovCiAgICAgUUVNVV9CVUlMRF9CVUdfT04oSUNIOV9SU1RfQ05UX0lPUE9SVCAhPSBS
Q1JfSU9QT1JUKTsKCj4gCj4gSW4gYW55IGNhc2U6Cj4gCj4gUmV2aWV3ZWQtYnk6IEFsZWtzYW5k
YXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20gCj4gPG1haWx0bzphbWFya292aWNA
d2F2ZWNvbXAuY29tPj4KClRoYW5rcyEKCj4gCj4gICAgIGRpZmYgLS1naXQgYS9ody9wY2ktaG9z
dC9waWl4LmMgYi9ody9wY2ktaG9zdC9waWl4LmMKPiAgICAgaW5kZXggMzI5MjcwM2RlNy4uMzc3
MDU3NWMxYSAxMDA2NDQKPiAgICAgLS0tIGEvaHcvcGNpLWhvc3QvcGlpeC5jCj4gICAgICsrKyBi
L2h3L3BjaS1ob3N0L3BpaXguYwo+ICAgICBAQCAtMjcsNiArMjcsNyBAQAo+ICAgICAgwqAjaW5j
bHVkZSAiaHcvaXJxLmgiCj4gICAgICDCoCNpbmNsdWRlICJody9wY2kvcGNpLmgiCj4gICAgICDC
oCNpbmNsdWRlICJody9wY2kvcGNpX2hvc3QuaCIKPiAgICAgKyNpbmNsdWRlICJody9zb3V0aGJy
aWRnZS9waWl4LmgiCj4gICAgICDCoCNpbmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMuaCIKPiAg
ICAgIMKgI2luY2x1ZGUgImh3L2lzYS9pc2EuaCIKPiAgICAgIMKgI2luY2x1ZGUgImh3L3N5c2J1
cy5oIgo+ICAgICBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3
L2kzODYvcGMuaAo+ICAgICBpbmRleCAxODMzMjZkOWZlLi4xYzIwYjk2NTcxIDEwMDY0NAo+ICAg
ICAtLS0gYS9pbmNsdWRlL2h3L2kzODYvcGMuaAo+ICAgICArKysgYi9pbmNsdWRlL2h3L2kzODYv
cGMuaAo+ICAgICBAQCAtMjU3LDEyICsyNTcsNiBAQCB0eXBlZGVmIHN0cnVjdCBQQ0lJNDQwRlhT
dGF0ZSBQQ0lJNDQwRlhTdGF0ZTsKPiAKPiAgICAgIMKgI2RlZmluZSBUWVBFX0lHRF9QQVNTVEhS
T1VHSF9JNDQwRlhfUENJX0RFVklDRQo+ICAgICAiaWdkLXBhc3N0aHJvdWdoLWk0NDBGWCIKPiAK
PiAgICAgLS8qCj4gICAgIC0gKiBSZXNldCBDb250cm9sIFJlZ2lzdGVyOiBQQ0ktYWNjZXNzaWJs
ZSBJU0EtQ29tcGF0aWJsZSBSZWdpc3Rlcgo+ICAgICBhdCBhZGRyZXNzCj4gICAgIC0gKiAweGNm
OSwgcHJvdmlkZWQgYnkgdGhlIFBDSS9JU0EgYnJpZGdlIChQSUlYMyBQQ0kgZnVuY3Rpb24gMCwK
PiAgICAgODA4Njo3MDAwKS4KPiAgICAgLSAqLwo+ICAgICAtI2RlZmluZSBSQ1JfSU9QT1JUIDB4
Y2Y5Cj4gICAgIC0KPiAgICAgIMKgUENJQnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0
X3R5cGUsIGNvbnN0IGNoYXIgKnBjaV90eXBlLAo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBQQ0lJNDQwRlhTdGF0ZSAqKnBpNDQwZnhfc3RhdGUsIGludCAqcGlpeF9kZXZm
biwKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgSVNBQnVzICoqaXNhX2J1
cywgcWVtdV9pcnEgKnBpYywKPiAgICAgZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvc291dGhicmlk
Z2UvcGlpeC5oCj4gICAgIGIvaW5jbHVkZS9ody9zb3V0aGJyaWRnZS9waWl4LmgKPiAgICAgaW5k
ZXggYWRkMzUyNDU2Yi4uNzllYmUwMDg5YiAxMDA2NDQKPiAgICAgLS0tIGEvaW5jbHVkZS9ody9z
b3V0aGJyaWRnZS9waWl4LmgKPiAgICAgKysrIGIvaW5jbHVkZS9ody9zb3V0aGJyaWRnZS9waWl4
LmgKPiAgICAgQEAgLTE4LDYgKzE4LDEyIEBAIEkyQ0J1cyAqcGlpeDRfcG1faW5pdChQQ0lCdXMg
KmJ1cywgaW50IGRldmZuLAo+ICAgICB1aW50MzJfdCBzbWJfaW9fYmFzZSwKPiAgICAgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcWVtdV9pcnEgc2NpX2lycSwgcWVtdV9pcnEg
c21pX2lycSwKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50IHNt
bV9lbmFibGVkLCBEZXZpY2VTdGF0ZSAqKnBpaXg0X3BtKTsKPiAKPiAgICAgKy8qCj4gICAgICsg
KiBSZXNldCBDb250cm9sIFJlZ2lzdGVyOiBQQ0ktYWNjZXNzaWJsZSBJU0EtQ29tcGF0aWJsZSBS
ZWdpc3Rlcgo+ICAgICBhdCBhZGRyZXNzCj4gICAgICsgKiAweGNmOSwgcHJvdmlkZWQgYnkgdGhl
IFBDSS9JU0EgYnJpZGdlIChQSUlYMyBQQ0kgZnVuY3Rpb24gMCwKPiAgICAgODA4Njo3MDAwKS4K
PiAgICAgKyAqLwo+ICAgICArI2RlZmluZSBSQ1JfSU9QT1JUIDB4Y2Y5Cj4gICAgICsKPiAgICAg
IMKgZXh0ZXJuIFBDSURldmljZSAqcGlpeDRfZGV2Owo+IAo+ICAgICAgwqBEZXZpY2VTdGF0ZSAq
cGlpeDRfY3JlYXRlKFBDSUJ1cyAqcGNpX2J1cywgSVNBQnVzICoqaXNhX2J1cywKPiAgICAgLS0g
Cj4gICAgIDIuMjEuMAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
