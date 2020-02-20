Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1B165EB2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:26:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4loG-000592-9u; Thu, 20 Feb 2020 13:24:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4loE-00058w-Tr
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:24:06 +0000
X-Inumbo-ID: 44fd0e5e-53e4-11ea-b0fd-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 44fd0e5e-53e4-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582205046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OimKndY8Wc6V5KKVZusL/KwxwNRq09ftVTZGs3QdCTA=;
 b=QgxgbI7uYY4hplwqMVay8EnpBGv7xhQ1bPsUGdKy8gtZ5Tk4sh5cwTTcpIBpO970lDejnu
 nI1HWk2SqXuvbmOx577t0FdDWJDSikpmJFbwRWjDLJBTzok2r2uL+vx6o7HOmf7spoRmcG
 dClPXFroOWqrpifLz7G11enV8H2UzAI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-pIWnynjrPmWhohmfrnTn7g-1; Thu, 20 Feb 2020 08:24:04 -0500
X-MC-Unique: pIWnynjrPmWhohmfrnTn7g-1
Received: by mail-ed1-f72.google.com with SMTP id d21so2697181edy.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MHg/5UrUaWqOGPMbBFxMDVDMQH9eo1mTFc5tISJLXMw=;
 b=MQqd2/s02bFrLHMpoFApoibwxwisr2uvuVPqTgLc3ovXPjbmVueKuw4/7Lymu/V2im
 lj8gjFOhgrh9FrBlqvp2VZtCP3o/h3s5cL6pdTaQGWXxxr0HPnuXc4ay88ptqdt97xlo
 FRzvh+Njzc9I2aXk2jw4gGGEZdONFceXHpfb4YCFEmN+IwKV9AFIkQLj0qgxY7tdnHpj
 k7olLS0gzXkKfhwhjuUT1jJdO0kEp4ITFhSeOv3JtCbrGRBNvNV3HNZUPTYP/MqWbfsM
 ChdzUkgbhjTPKxdP9NsrQ3BpDjuUXUHWz1mLSuYffuh3pIzzvEtI0532S7w62h6UOek4
 8zIg==
X-Gm-Message-State: APjAAAVnXyUCsnkdzcZAsujdhRHWVFHUlR5lIFEgccu/cPbxHk5FIc+d
 i8ZjvNeOJ9z/ZQ60dHisEqZhB0dMXkeRadSqrlQPP9yMrJou62CP/3N+l+by0PIwtDYhJl5nGQg
 qVYZU+c+f3RjjGsheOraoHTff+MA=
X-Received: by 2002:a50:fc05:: with SMTP id i5mr29170792edr.343.1582205042921; 
 Thu, 20 Feb 2020 05:24:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqznBcBibxmOR37VsiYJJjL+jelcdk8lkiHN5SpgVrHqzRKo/B7Z+Qf6ZCdlOSA+ufQfA3o7ew==
X-Received: by 2002:a50:fc05:: with SMTP id i5mr29170765edr.343.1582205042706; 
 Thu, 20 Feb 2020 05:24:02 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id l11sm99933edi.28.2020.02.20.05.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 05:24:02 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-4-philmd@redhat.com>
 <fce0956e-e542-e8a5-bd02-a7941a9db627@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <34fc1b00-4e95-6235-3e82-294b572a209b@redhat.com>
Date: Thu, 20 Feb 2020 14:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fce0956e-e542-e8a5-bd02-a7941a9db627@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Xen-devel] [PATCH v3 03/20] exec: Let qemu_ram_*() functions
 take a const pointer argument
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
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8yMC8yMCAyOjIxIFBNLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+IE9uIDIwLzAyLzIwIDE0
OjA1LCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gICBpbmNs
dWRlL2V4ZWMvY3B1LWNvbW1vbi5oICAgICB8IDYgKysrLS0tCj4+ICAgaW5jbHVkZS9zeXNlbXUv
eGVuLW1hcGNhY2hlLmggfCA0ICsrLS0KPj4gICBleGVjLmMgICAgICAgICAgICAgICAgICAgICAg
ICB8IDggKysrKy0tLS0KPj4gICBody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYyAgICB8IDIgKy0K
Pj4gICA0IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaCBiL2luY2x1ZGUvZXhl
Yy9jcHUtY29tbW9uLmgKPj4gaW5kZXggODE3NTNiYmIzNC4uMDVhYzFhNWQ2OSAxMDA2NDQKPj4g
LS0tIGEvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaAo+PiArKysgYi9pbmNsdWRlL2V4ZWMvY3B1
LWNvbW1vbi5oCj4+IEBAIC00OCwxMSArNDgsMTEgQEAgdHlwZWRlZiB1aW50MzJfdCBDUFVSZWFk
TWVtb3J5RnVuYyh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyKTsKPj4gICAKPj4gICB2b2lkIHFl
bXVfcmFtX3JlbWFwKHJhbV9hZGRyX3QgYWRkciwgcmFtX2FkZHJfdCBsZW5ndGgpOwo+PiAgIC8q
IFRoaXMgc2hvdWxkIG5vdCBiZSB1c2VkIGJ5IGRldmljZXMuICAqLwo+PiAtcmFtX2FkZHJfdCBx
ZW11X3JhbV9hZGRyX2Zyb21faG9zdCh2b2lkICpwdHIpOwo+PiArcmFtX2FkZHJfdCBxZW11X3Jh
bV9hZGRyX2Zyb21faG9zdChjb25zdCB2b2lkICpwdHIpOwo+IAo+IFRoaXMgaXMgYSBiaXQgdWds
eSwgYmVjYXVzZSB0aGUgcG9pbnRlciBfY2FuXyBiZSBtb2RpZmllZCB2aWEKPiBxZW11X21hcF9y
YW1fcHRyLgoKT0suCgo+IElzIHRoaXMgbmVlZGVkIGZvciB0aGUgcmVzdCBvZiB0aGUgc2VyaWVz
IHRvIGFwcGx5PwoKTm8hCgo+IFBhb2xvCj4gCj4+ICAgUkFNQmxvY2sgKnFlbXVfcmFtX2Jsb2Nr
X2J5X25hbWUoY29uc3QgY2hhciAqbmFtZSk7Cj4+IC1SQU1CbG9jayAqcWVtdV9yYW1fYmxvY2tf
ZnJvbV9ob3N0KHZvaWQgKnB0ciwgYm9vbCByb3VuZF9vZmZzZXQsCj4+ICtSQU1CbG9jayAqcWVt
dV9yYW1fYmxvY2tfZnJvbV9ob3N0KGNvbnN0IHZvaWQgKnB0ciwgYm9vbCByb3VuZF9vZmZzZXQs
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90ICpvZmZz
ZXQpOwo+PiAtcmFtX2FkZHJfdCBxZW11X3JhbV9ibG9ja19ob3N0X29mZnNldChSQU1CbG9jayAq
cmIsIHZvaWQgKmhvc3QpOwo+PiArcmFtX2FkZHJfdCBxZW11X3JhbV9ibG9ja19ob3N0X29mZnNl
dChSQU1CbG9jayAqcmIsIGNvbnN0IHZvaWQgKmhvc3QpOwo+PiAgIHZvaWQgcWVtdV9yYW1fc2V0
X2lkc3RyKFJBTUJsb2NrICpibG9jaywgY29uc3QgY2hhciAqbmFtZSwgRGV2aWNlU3RhdGUgKmRl
dik7Cj4+ICAgdm9pZCBxZW11X3JhbV91bnNldF9pZHN0cihSQU1CbG9jayAqYmxvY2spOwo+PiAg
IGNvbnN0IGNoYXIgKnFlbXVfcmFtX2dldF9pZHN0cihSQU1CbG9jayAqcmIpOwo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zeXNlbXUveGVuLW1hcGNhY2hlLmggYi9pbmNsdWRlL3N5c2VtdS94ZW4t
bWFwY2FjaGUuaAo+PiBpbmRleCBjOGU3YzJmNmNmLi44MWU5YWEyZmE2IDEwMDY0NAo+PiAtLS0g
YS9pbmNsdWRlL3N5c2VtdS94ZW4tbWFwY2FjaGUuaAo+PiArKysgYi9pbmNsdWRlL3N5c2VtdS94
ZW4tbWFwY2FjaGUuaAo+PiBAQCAtMTksNyArMTksNyBAQCB2b2lkIHhlbl9tYXBfY2FjaGVfaW5p
dChwaHlzX29mZnNldF90b19nYWRkcl90IGYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqb3BhcXVlKTsKPj4gICB1aW50OF90ICp4ZW5fbWFwX2NhY2hlKGh3YWRkciBwaHlzX2Fk
ZHIsIGh3YWRkciBzaXplLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBsb2Nr
LCBib29sIGRtYSk7Cj4+IC1yYW1fYWRkcl90IHhlbl9yYW1fYWRkcl9mcm9tX21hcGNhY2hlKHZv
aWQgKnB0cik7Cj4+ICtyYW1fYWRkcl90IHhlbl9yYW1fYWRkcl9mcm9tX21hcGNhY2hlKGNvbnN0
IHZvaWQgKnB0cik7Cj4+ICAgdm9pZCB4ZW5faW52YWxpZGF0ZV9tYXBfY2FjaGVfZW50cnkodWlu
dDhfdCAqYnVmZmVyKTsKPj4gICB2b2lkIHhlbl9pbnZhbGlkYXRlX21hcF9jYWNoZSh2b2lkKTsK
Pj4gICB1aW50OF90ICp4ZW5fcmVwbGFjZV9jYWNoZV9lbnRyeShod2FkZHIgb2xkX3BoeXNfYWRk
ciwKPj4gQEAgLTQwLDcgKzQwLDcgQEAgc3RhdGljIGlubGluZSB1aW50OF90ICp4ZW5fbWFwX2Nh
Y2hlKGh3YWRkciBwaHlzX2FkZHIsCj4+ICAgICAgIGFib3J0KCk7Cj4+ICAgfQo+PiAgIAo+PiAt
c3RhdGljIGlubGluZSByYW1fYWRkcl90IHhlbl9yYW1fYWRkcl9mcm9tX21hcGNhY2hlKHZvaWQg
KnB0cikKPj4gK3N0YXRpYyBpbmxpbmUgcmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBj
YWNoZShjb25zdCB2b2lkICpwdHIpCj4+ICAgewo+PiAgICAgICBhYm9ydCgpOwo+PiAgIH0KPj4g
ZGlmZiAtLWdpdCBhL2V4ZWMuYyBiL2V4ZWMuYwo+PiBpbmRleCA4ZTljYzNiNDdjLi4wMmI0ZTZl
YTQxIDEwMDY0NAo+PiAtLS0gYS9leGVjLmMKPj4gKysrIGIvZXhlYy5jCj4+IEBAIC0yNjE0LDcg
KzI2MTQsNyBAQCBzdGF0aWMgdm9pZCAqcWVtdV9yYW1fcHRyX2xlbmd0aChSQU1CbG9jayAqcmFt
X2Jsb2NrLCByYW1fYWRkcl90IGFkZHIsCj4+ICAgfQo+PiAgIAo+PiAgIC8qIFJldHVybiB0aGUg
b2Zmc2V0IG9mIGEgaG9zdHBvaW50ZXIgd2l0aGluIGEgcmFtYmxvY2sgKi8KPj4gLXJhbV9hZGRy
X3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxvY2sgKnJiLCB2b2lkICpob3N0KQo+
PiArcmFtX2FkZHJfdCBxZW11X3JhbV9ibG9ja19ob3N0X29mZnNldChSQU1CbG9jayAqcmIsIGNv
bnN0IHZvaWQgKmhvc3QpCj4+ICAgewo+PiAgICAgICByYW1fYWRkcl90IHJlcyA9ICh1aW50OF90
ICopaG9zdCAtICh1aW50OF90ICopcmItPmhvc3Q7Cj4+ICAgICAgIGFzc2VydCgodWludHB0cl90
KWhvc3QgPj0gKHVpbnRwdHJfdClyYi0+aG9zdCk7Cj4+IEBAIC0yNjQwLDExICsyNjQwLDExIEBA
IHJhbV9hZGRyX3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxvY2sgKnJiLCB2b2lk
ICpob3N0KQo+PiAgICAqIHBvaW50ZXIsIHN1Y2ggYXMgYSByZWZlcmVuY2UgdG8gdGhlIHJlZ2lv
biB0aGF0IGluY2x1ZGVzIHRoZSBpbmNvbWluZwo+PiAgICAqIHJhbV9hZGRyX3QuCj4+ICAgICov
Cj4+IC1SQU1CbG9jayAqcWVtdV9yYW1fYmxvY2tfZnJvbV9ob3N0KHZvaWQgKnB0ciwgYm9vbCBy
b3VuZF9vZmZzZXQsCj4+ICtSQU1CbG9jayAqcWVtdV9yYW1fYmxvY2tfZnJvbV9ob3N0KGNvbnN0
IHZvaWQgKnB0ciwgYm9vbCByb3VuZF9vZmZzZXQsCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByYW1fYWRkcl90ICpvZmZzZXQpCj4+ICAgewo+PiAgICAgICBSQU1CbG9j
ayAqYmxvY2s7Cj4+IC0gICAgdWludDhfdCAqaG9zdCA9IHB0cjsKPj4gKyAgICBjb25zdCB1aW50
OF90ICpob3N0ID0gcHRyOwo+PiAgIAo+PiAgICAgICBpZiAoeGVuX2VuYWJsZWQoKSkgewo+PiAg
ICAgICAgICAgcmFtX2FkZHJfdCByYW1fYWRkcjsKPj4gQEAgLTI3MDUsNyArMjcwNSw3IEBAIFJB
TUJsb2NrICpxZW11X3JhbV9ibG9ja19ieV9uYW1lKGNvbnN0IGNoYXIgKm5hbWUpCj4+ICAgCj4+
ICAgLyogU29tZSBvZiB0aGUgc29mdG1tdSByb3V0aW5lcyBuZWVkIHRvIHRyYW5zbGF0ZSBmcm9t
IGEgaG9zdCBwb2ludGVyCj4+ICAgICAgKHR5cGljYWxseSBhIFRMQiBlbnRyeSkgYmFjayB0byBh
IHJhbSBvZmZzZXQuICAqLwo+PiAtcmFtX2FkZHJfdCBxZW11X3JhbV9hZGRyX2Zyb21faG9zdCh2
b2lkICpwdHIpCj4+ICtyYW1fYWRkcl90IHFlbXVfcmFtX2FkZHJfZnJvbV9ob3N0KGNvbnN0IHZv
aWQgKnB0cikKPj4gICB7Cj4+ICAgICAgIFJBTUJsb2NrICpibG9jazsKPj4gICAgICAgcmFtX2Fk
ZHJfdCBvZmZzZXQ7Cj4+IGRpZmYgLS1naXQgYS9ody9pMzg2L3hlbi94ZW4tbWFwY2FjaGUuYyBi
L2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4+IGluZGV4IDViMTIwZWQ0NGIuLjQzMmFkMzM1
NGQgMTAwNjQ0Cj4+IC0tLSBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4+ICsrKyBiL2h3
L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCj4+IEBAIC0zNjMsNyArMzYzLDcgQEAgdWludDhfdCAq
eGVuX21hcF9jYWNoZShod2FkZHIgcGh5c19hZGRyLCBod2FkZHIgc2l6ZSwKPj4gICAgICAgcmV0
dXJuIHA7Cj4+ICAgfQo+PiAgIAo+PiAtcmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBj
YWNoZSh2b2lkICpwdHIpCj4+ICtyYW1fYWRkcl90IHhlbl9yYW1fYWRkcl9mcm9tX21hcGNhY2hl
KGNvbnN0IHZvaWQgKnB0cikKPj4gICB7Cj4+ICAgICAgIE1hcENhY2hlRW50cnkgKmVudHJ5ID0g
TlVMTDsKPj4gICAgICAgTWFwQ2FjaGVSZXYgKnJldmVudHJ5Owo+Pgo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
