Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45058165EAB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:24:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4llx-0004yH-NW; Thu, 20 Feb 2020 13:21:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CM6a=4I=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1j4llw-0004yC-Cu
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:21:44 +0000
X-Inumbo-ID: efe7a5c8-53e3-11ea-8527-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id efe7a5c8-53e3-11ea-8527-12813bfff9fa;
 Thu, 20 Feb 2020 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582204903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S4PJnWfahZa1TNC6+g1IhMFCY1W/sixaIQI4WNkTwR8=;
 b=J6gPmvlEcAYYGB7M6Me9KtlP+OJsJz3Ir8MvgOQVGFpL5laD/vBg5mTJv67l+4erZ0CkN2
 m6aegXauLyCAdQWW8ZhyAHhvGZA1ObzLh9jJWUtzJTFrKVqg11x+fPYqn1vd10AOV6v4tu
 cjOX/e0T3UY+62J339+YPDrSJKJoCsQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-oCmgC4lxOxCWvrsZsAwsTA-1; Thu, 20 Feb 2020 08:21:41 -0500
Received: by mail-wm1-f71.google.com with SMTP id f207so590083wme.6
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fOoSsSz7tsTUHvX+UaUO6G7U94kDGpWqoCWwnJ/CO0=;
 b=JQL0xrnT4jzbe/1vIYJ0Vhb6H2Tyu0915HvInpz6+KkhudZIJT6onGsv7Gp49W7+oE
 6R5Xx1P7MCfq1P1MwheGrvEEZ1JsjyTCrgbJ3Eb7MnkYmnjK7rvfMM8DAv3tAP5wNlS8
 KyYvl5I2l605x3fkqasbrb0kTM5xyvC4lOzfkCo+r/kIW3h6YGAoInFngLChYMTL6D/P
 blAt73OdWe5+yxGl8aeDMH1ieeo8lhNCmDEHIW1tw2pPx/YyQr5tmbBtmvZRSV/TU64O
 cilhjwTZ+Ww1fU9SCA+HbrSL2EvSTHNyxNfdtkuWDcFCKY4cj9rF8zUNfeDNEG7I67rq
 zRPw==
X-Gm-Message-State: APjAAAVqbQCl534EG3O+wB3gVNii90CmPfhYqx0PFg43RV7A49A1mn75
 krU1l1EMrAXT2/1DsyN+onUiexZ38CxTEhO0ezrYH3/CuG0MDDZ9XNrNu3dqLmhmprBrDlYrmf2
 820r9MVb8k2yOGRktbXPnc6U/ZGs=
X-Received: by 2002:a7b:ca49:: with SMTP id m9mr4782590wml.50.1582204900626;
 Thu, 20 Feb 2020 05:21:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzKxcQLqflxe9qCIU9rTsjyGiEk6CQgzPBe/H4AxjLFCiLPx9wCf3WQ03jwpKNmMAnM1bKEcw==
X-Received: by 2002:a7b:ca49:: with SMTP id m9mr4782560wml.50.1582204900358;
 Thu, 20 Feb 2020 05:21:40 -0800 (PST)
Received: from [10.201.49.12] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id i2sm4415838wmb.28.2020.02.20.05.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 05:21:39 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200220130548.29974-1-philmd@redhat.com>
 <20200220130548.29974-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fce0956e-e542-e8a5-bd02-a7941a9db627@redhat.com>
Date: Thu, 20 Feb 2020 14:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200220130548.29974-4-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: oCmgC4lxOxCWvrsZsAwsTA-1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDIvMjAgMTQ6MDUsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IFNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KPiAt
LS0KPiAgaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaCAgICAgfCA2ICsrKy0tLQo+ICBpbmNsdWRl
L3N5c2VtdS94ZW4tbWFwY2FjaGUuaCB8IDQgKystLQo+ICBleGVjLmMgICAgICAgICAgICAgICAg
ICAgICAgICB8IDggKysrKy0tLS0KPiAgaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMgICAgfCAy
ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmggYi9pbmNsdWRlL2V4
ZWMvY3B1LWNvbW1vbi5oCj4gaW5kZXggODE3NTNiYmIzNC4uMDVhYzFhNWQ2OSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2V4ZWMvY3B1LWNvbW1vbi5oCj4gKysrIGIvaW5jbHVkZS9leGVjL2NwdS1j
b21tb24uaAo+IEBAIC00OCwxMSArNDgsMTEgQEAgdHlwZWRlZiB1aW50MzJfdCBDUFVSZWFkTWVt
b3J5RnVuYyh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyKTsKPiAgCj4gIHZvaWQgcWVtdV9yYW1f
cmVtYXAocmFtX2FkZHJfdCBhZGRyLCByYW1fYWRkcl90IGxlbmd0aCk7Cj4gIC8qIFRoaXMgc2hv
dWxkIG5vdCBiZSB1c2VkIGJ5IGRldmljZXMuICAqLwo+IC1yYW1fYWRkcl90IHFlbXVfcmFtX2Fk
ZHJfZnJvbV9ob3N0KHZvaWQgKnB0cik7Cj4gK3JhbV9hZGRyX3QgcWVtdV9yYW1fYWRkcl9mcm9t
X2hvc3QoY29uc3Qgdm9pZCAqcHRyKTsKClRoaXMgaXMgYSBiaXQgdWdseSwgYmVjYXVzZSB0aGUg
cG9pbnRlciBfY2FuXyBiZSBtb2RpZmllZCB2aWEKcWVtdV9tYXBfcmFtX3B0ci4gIElzIHRoaXMg
bmVlZGVkIGZvciB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIHRvIGFwcGx5PwoKUGFvbG8KCj4gIFJB
TUJsb2NrICpxZW11X3JhbV9ibG9ja19ieV9uYW1lKGNvbnN0IGNoYXIgKm5hbWUpOwo+IC1SQU1C
bG9jayAqcWVtdV9yYW1fYmxvY2tfZnJvbV9ob3N0KHZvaWQgKnB0ciwgYm9vbCByb3VuZF9vZmZz
ZXQsCj4gK1JBTUJsb2NrICpxZW11X3JhbV9ibG9ja19mcm9tX2hvc3QoY29uc3Qgdm9pZCAqcHRy
LCBib29sIHJvdW5kX29mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByYW1fYWRkcl90ICpvZmZzZXQpOwo+IC1yYW1fYWRkcl90IHFlbXVfcmFtX2Jsb2NrX2hvc3Rf
b2Zmc2V0KFJBTUJsb2NrICpyYiwgdm9pZCAqaG9zdCk7Cj4gK3JhbV9hZGRyX3QgcWVtdV9yYW1f
YmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxvY2sgKnJiLCBjb25zdCB2b2lkICpob3N0KTsKPiAgdm9p
ZCBxZW11X3JhbV9zZXRfaWRzdHIoUkFNQmxvY2sgKmJsb2NrLCBjb25zdCBjaGFyICpuYW1lLCBE
ZXZpY2VTdGF0ZSAqZGV2KTsKPiAgdm9pZCBxZW11X3JhbV91bnNldF9pZHN0cihSQU1CbG9jayAq
YmxvY2spOwo+ICBjb25zdCBjaGFyICpxZW11X3JhbV9nZXRfaWRzdHIoUkFNQmxvY2sgKnJiKTsK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zeXNlbXUveGVuLW1hcGNhY2hlLmggYi9pbmNsdWRlL3N5
c2VtdS94ZW4tbWFwY2FjaGUuaAo+IGluZGV4IGM4ZTdjMmY2Y2YuLjgxZTlhYTJmYTYgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9zeXNlbXUveGVuLW1hcGNhY2hlLmgKPiArKysgYi9pbmNsdWRlL3N5
c2VtdS94ZW4tbWFwY2FjaGUuaAo+IEBAIC0xOSw3ICsxOSw3IEBAIHZvaWQgeGVuX21hcF9jYWNo
ZV9pbml0KHBoeXNfb2Zmc2V0X3RvX2dhZGRyX3QgZiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqb3BhcXVlKTsKPiAgdWludDhfdCAqeGVuX21hcF9jYWNoZShod2FkZHIgcGh5c19h
ZGRyLCBod2FkZHIgc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGxvY2ss
IGJvb2wgZG1hKTsKPiAtcmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBjYWNoZSh2b2lk
ICpwdHIpOwo+ICtyYW1fYWRkcl90IHhlbl9yYW1fYWRkcl9mcm9tX21hcGNhY2hlKGNvbnN0IHZv
aWQgKnB0cik7Cj4gIHZvaWQgeGVuX2ludmFsaWRhdGVfbWFwX2NhY2hlX2VudHJ5KHVpbnQ4X3Qg
KmJ1ZmZlcik7Cj4gIHZvaWQgeGVuX2ludmFsaWRhdGVfbWFwX2NhY2hlKHZvaWQpOwo+ICB1aW50
OF90ICp4ZW5fcmVwbGFjZV9jYWNoZV9lbnRyeShod2FkZHIgb2xkX3BoeXNfYWRkciwKPiBAQCAt
NDAsNyArNDAsNyBAQCBzdGF0aWMgaW5saW5lIHVpbnQ4X3QgKnhlbl9tYXBfY2FjaGUoaHdhZGRy
IHBoeXNfYWRkciwKPiAgICAgIGFib3J0KCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbmxpbmUgcmFt
X2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBjYWNoZSh2b2lkICpwdHIpCj4gK3N0YXRpYyBp
bmxpbmUgcmFtX2FkZHJfdCB4ZW5fcmFtX2FkZHJfZnJvbV9tYXBjYWNoZShjb25zdCB2b2lkICpw
dHIpCj4gIHsKPiAgICAgIGFib3J0KCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZXhlYy5jIGIvZXhl
Yy5jCj4gaW5kZXggOGU5Y2MzYjQ3Yy4uMDJiNGU2ZWE0MSAxMDA2NDQKPiAtLS0gYS9leGVjLmMK
PiArKysgYi9leGVjLmMKPiBAQCAtMjYxNCw3ICsyNjE0LDcgQEAgc3RhdGljIHZvaWQgKnFlbXVf
cmFtX3B0cl9sZW5ndGgoUkFNQmxvY2sgKnJhbV9ibG9jaywgcmFtX2FkZHJfdCBhZGRyLAo+ICB9
Cj4gIAo+ICAvKiBSZXR1cm4gdGhlIG9mZnNldCBvZiBhIGhvc3Rwb2ludGVyIHdpdGhpbiBhIHJh
bWJsb2NrICovCj4gLXJhbV9hZGRyX3QgcWVtdV9yYW1fYmxvY2tfaG9zdF9vZmZzZXQoUkFNQmxv
Y2sgKnJiLCB2b2lkICpob3N0KQo+ICtyYW1fYWRkcl90IHFlbXVfcmFtX2Jsb2NrX2hvc3Rfb2Zm
c2V0KFJBTUJsb2NrICpyYiwgY29uc3Qgdm9pZCAqaG9zdCkKPiAgewo+ICAgICAgcmFtX2FkZHJf
dCByZXMgPSAodWludDhfdCAqKWhvc3QgLSAodWludDhfdCAqKXJiLT5ob3N0Owo+ICAgICAgYXNz
ZXJ0KCh1aW50cHRyX3QpaG9zdCA+PSAodWludHB0cl90KXJiLT5ob3N0KTsKPiBAQCAtMjY0MCwx
MSArMjY0MCwxMSBAQCByYW1fYWRkcl90IHFlbXVfcmFtX2Jsb2NrX2hvc3Rfb2Zmc2V0KFJBTUJs
b2NrICpyYiwgdm9pZCAqaG9zdCkKPiAgICogcG9pbnRlciwgc3VjaCBhcyBhIHJlZmVyZW5jZSB0
byB0aGUgcmVnaW9uIHRoYXQgaW5jbHVkZXMgdGhlIGluY29taW5nCj4gICAqIHJhbV9hZGRyX3Qu
Cj4gICAqLwo+IC1SQU1CbG9jayAqcWVtdV9yYW1fYmxvY2tfZnJvbV9ob3N0KHZvaWQgKnB0ciwg
Ym9vbCByb3VuZF9vZmZzZXQsCj4gK1JBTUJsb2NrICpxZW11X3JhbV9ibG9ja19mcm9tX2hvc3Qo
Y29uc3Qgdm9pZCAqcHRyLCBib29sIHJvdW5kX29mZnNldCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByYW1fYWRkcl90ICpvZmZzZXQpCj4gIHsKPiAgICAgIFJBTUJsb2Nr
ICpibG9jazsKPiAtICAgIHVpbnQ4X3QgKmhvc3QgPSBwdHI7Cj4gKyAgICBjb25zdCB1aW50OF90
ICpob3N0ID0gcHRyOwo+ICAKPiAgICAgIGlmICh4ZW5fZW5hYmxlZCgpKSB7Cj4gICAgICAgICAg
cmFtX2FkZHJfdCByYW1fYWRkcjsKPiBAQCAtMjcwNSw3ICsyNzA1LDcgQEAgUkFNQmxvY2sgKnFl
bXVfcmFtX2Jsb2NrX2J5X25hbWUoY29uc3QgY2hhciAqbmFtZSkKPiAgCj4gIC8qIFNvbWUgb2Yg
dGhlIHNvZnRtbXUgcm91dGluZXMgbmVlZCB0byB0cmFuc2xhdGUgZnJvbSBhIGhvc3QgcG9pbnRl
cgo+ICAgICAodHlwaWNhbGx5IGEgVExCIGVudHJ5KSBiYWNrIHRvIGEgcmFtIG9mZnNldC4gICov
Cj4gLXJhbV9hZGRyX3QgcWVtdV9yYW1fYWRkcl9mcm9tX2hvc3Qodm9pZCAqcHRyKQo+ICtyYW1f
YWRkcl90IHFlbXVfcmFtX2FkZHJfZnJvbV9ob3N0KGNvbnN0IHZvaWQgKnB0cikKPiAgewo+ICAg
ICAgUkFNQmxvY2sgKmJsb2NrOwo+ICAgICAgcmFtX2FkZHJfdCBvZmZzZXQ7Cj4gZGlmZiAtLWdp
dCBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jIGIvaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hl
LmMKPiBpbmRleCA1YjEyMGVkNDRiLi40MzJhZDMzNTRkIDEwMDY0NAo+IC0tLSBhL2h3L2kzODYv
eGVuL3hlbi1tYXBjYWNoZS5jCj4gKysrIGIvaHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMKPiBA
QCAtMzYzLDcgKzM2Myw3IEBAIHVpbnQ4X3QgKnhlbl9tYXBfY2FjaGUoaHdhZGRyIHBoeXNfYWRk
ciwgaHdhZGRyIHNpemUsCj4gICAgICByZXR1cm4gcDsKPiAgfQo+ICAKPiAtcmFtX2FkZHJfdCB4
ZW5fcmFtX2FkZHJfZnJvbV9tYXBjYWNoZSh2b2lkICpwdHIpCj4gK3JhbV9hZGRyX3QgeGVuX3Jh
bV9hZGRyX2Zyb21fbWFwY2FjaGUoY29uc3Qgdm9pZCAqcHRyKQo+ICB7Cj4gICAgICBNYXBDYWNo
ZUVudHJ5ICplbnRyeSA9IE5VTEw7Cj4gICAgICBNYXBDYWNoZVJldiAqcmV2ZW50cnk7Cj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
