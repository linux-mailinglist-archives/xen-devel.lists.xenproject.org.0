Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FF107720
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 19:15:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYDMe-0004DM-RT; Fri, 22 Nov 2019 18:09:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QBRl=ZO=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1iYDMd-0004DF-Kr
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 18:09:03 +0000
X-Inumbo-ID: 29b98726-0d53-11ea-b678-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29b98726-0d53-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 18:09:02 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f7so6828532edq.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2019 10:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6XC7J01vfzbdcFbMru7vbbiLAH9ENIVdi6cTObx3yFw=;
 b=qK6oSOp1Rd1Y6K36IsgEQdzeq4nuAegkbWPNN9azVKEnpXTNEy7tdc2qIeCaPOZ1e2
 77utjzNmsqRk4CjFfWmrPqlfWOnjjRDtRjYI8PMcCHhISk00gRj/2izwiE68N1/8O009
 5okIatwIThBwONTX3yxOJBnNy1rLql1BEusUkgeRtOah5XmaBM/W866HiaK0iVhIaJM5
 ou7i3GGVWFWc0/H4fbHKwWiZPaSEl4TSgcEAO3bMJiVhExQmVBos6/u5db0T4Ini1xhB
 WzLo7wSQVMEdAEw72ZaBAGl24OAUJ4iIwrXV6BCxtskuIbNpA6tzAAJQzr1xfFvZJphD
 Oi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6XC7J01vfzbdcFbMru7vbbiLAH9ENIVdi6cTObx3yFw=;
 b=q5gl5iwiMufSK221XZaYkmgjolVtCM7H0uOBbnCtWIhY1CMPIfvfmOnUL/pkUScYek
 zHux+Uh6ovxFhjyptM+W2/FL2+vc8WFwZecbfBC39tfxtAaF7zMJ0sarEZAYlE/Rb7/G
 tAt6cOjgaJ/jhoVhSkPUZv15dsQVUpanYz8DaCsw2OtXMPzPGJsjJzXxbmLnT5leERKy
 v8uXQGz02gIF0C/L9gWXXSKxEH5+WLdm/QtHdthwaPPV68rngOXZMPMVg8/P24TXjkGb
 PNFG/L7+OHxlDwx8YfVAS4a9iWiGtBuyLh4v78uuxQmoT6LoyO2nqULYIouKKw7fRhB0
 cyEA==
X-Gm-Message-State: APjAAAUhZo9bUpRmyMhYwBd30lUw1doArkNjT6pKyfmbSVLBCHAG0kXr
 kgG2T5Ftya16AHq9qHWcwuhuxJ4EEbBWIXNdF34=
X-Google-Smtp-Source: APXvYqwHM12AXTOeEX1w22ZiWjuYqYNavB9ZTJUEwSIdaMO/WbJhu05YYbeD4LId0PC/bQIPp9U4fBnusmJJyeeZC/c=
X-Received: by 2002:a17:906:4e48:: with SMTP id
 g8mr23081727ejw.67.1574446141776; 
 Fri, 22 Nov 2019 10:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20191122175400.4001-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191122175400.4001-1-andrew.cooper3@citrix.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 22 Nov 2019 18:08:50 +0000
Message-ID: <CAFLBxZYgiGMXJvrOLY-+MktM=gQgTv1R7-Y6ccR6LgvrYjacdA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vvmx: Fix livelock with
 XSA-304 fix
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgNTo1NSBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IEl0IHR1cm5zIG91dCB0aGF0IHRoZSBYU0EtMzA0
IC8gQ1ZFLTIwMTgtMTIyMDcgZml4IG9mIGRpc2FibGluZyBleGVjdXRhYmxlCj4gc3VwZXJwYWdl
cyBkb2Vzbid0IHdvcmsgd2VsbCB3aXRoIHRoZSBuZXN0ZWQgcDJtIGNvZGUuCj4KPiBOZXN0ZWQg
dmlydCBpcyBleHBlcmltZW50YWwgYW5kIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQsIGJ1dCBpcyB1
c2VmdWwgZm9yCj4gZGV2ZWxvcG1lbnQgcHVycG9zZXMuICBJbiBvcmRlciB0byBub3QgcmVncmVz
cyB0aGUgc3RhdHVzIHF1bywgZGlzYWJsZSB0aGUKPiBYU0EtMzA0IHdvcmthcm91bmQgdW50aWwg
dGhlIG5lc3RlZCBwMm0gY29kZSBjYW4gYmUgaW1wcm92ZWQuCj4KPiBJbnRyb2R1Y2UgYSBwZXIt
ZG9tYWluIGV4ZWNfc3AgY29udHJvbCBhbmQgc2V0IGl0IGJhc2VkIG9uIHRoZSBjdXJyZW50Cj4g
b3B0X2VwdF9leGVjX3NwIHNldHRpbmcuICBUYWtlIHRoZSBvcHBvdHVuaXR5IHRvIG9taXQgYSBQ
VkggaGFyZHdhcmUgZG9tYWluCj4gZnJvbSB0aGUgcGVyZm9ybWFuY2UgaGl0LCBiZWNhdXNlIGl0
IGlzIGFscmVhZHkgcGVybWl0dGVkIHRvIERvUyB0aGUgc3lzdGVtIGluCj4gc3VjaCB3YXlzIGFz
IGlzc3VpbmcgYSByZWJvb3QuCj4KPiBXaGVuIG5lc3RlZCB2aXJ0IGlzIGVuYWJsZWQgb24gYSBk
b21haW4sIGZvcmNlIGl0IHRvIHVzaW5nIGV4ZWN1dGFibGUKPiBzdXBlcnBhZ2VzIGFuZCByZWJ1
aWxkIHRoZSBwMm0uCj4KPiBIYXZpbmcgdGhlIHNldHRpbmcgcGVyLWRvbWFpbiBpbnZvbHZlcyBy
ZWFycmFuZ2luZyB0aGUgaW50ZXJuYWxzIG9mCj4gcGFyc2VfZXB0X3BhcmFtX3J1bnRpbWUoKSBi
dXQgaXQgc3RpbGwgcmV0YWlucyB0aGUgc2FtZSBvdmVyYWxsIHNlbWFudGljcyAtCj4gZm9yIGVh
Y2ggYXBwbGljYWJsZSBkb21haW4gd2hvc2Ugc2V0dGluZyBuZWVkcyB0byBjaGFuZ2UsIHJlYnVp
bGQgdGhlIHAybS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
PiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jICAgICAgICB8IDMxICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAg
ICAgICB8ICA2ICsrKysrKwo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgICAgICAgIHwg
MTMgKysrKysrKysrKysrKwo+ICB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jICAgICAgICAgIHwg
IDIgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaCB8ICA2ICsrKysrKwo+
ICA1IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdm1jcy5jCj4gaW5kZXggNDc3Yzk2ODQwOS4uZjEwZjZiNzhlYyAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bWNzLmMKPiBAQCAtMzEsNiArMzEsNyBAQAo+ICAjaW5jbHVkZSA8YXNtL3hzdGF0ZS5oPgo+
ICAjaW5jbHVkZSA8YXNtL2h2bS9odm0uaD4KPiAgI2luY2x1ZGUgPGFzbS9odm0vaW8uaD4KPiAr
I2luY2x1ZGUgPGFzbS9odm0vbmVzdGVkaHZtLmg+Cj4gICNpbmNsdWRlIDxhc20vaHZtL3N1cHBv
cnQuaD4KPiAgI2luY2x1ZGUgPGFzbS9odm0vdm14L3ZteC5oPgo+ICAjaW5jbHVkZSA8YXNtL2h2
bS92bXgvdnZteC5oPgo+IEBAIC05Nyw2ICs5OCw3IEBAIGN1c3RvbV9wYXJhbSgiZXB0IiwgcGFy
c2VfZXB0X3BhcmFtKTsKPgo+ICBzdGF0aWMgaW50IHBhcnNlX2VwdF9wYXJhbV9ydW50aW1lKGNv
bnN0IGNoYXIgKnMpCj4gIHsKPiArICAgIHN0cnVjdCBkb21haW4gKmQ7Cj4gICAgICBpbnQgdmFs
Owo+Cj4gICAgICBpZiAoICFjcHVfaGFzX3ZteF9lcHQgfHwgIWh2bV9mdW5jcy5oYXBfc3VwcG9y
dGVkIHx8Cj4gQEAgLTExMCwxOCArMTEyLDMxIEBAIHN0YXRpYyBpbnQgcGFyc2VfZXB0X3BhcmFt
X3J1bnRpbWUoY29uc3QgY2hhciAqcykKPiAgICAgIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4o
ImV4ZWMtc3AiLCBzLCBOVUxMKSkgPCAwICkKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+
IC0gICAgaWYgKCB2YWwgIT0gb3B0X2VwdF9leGVjX3NwICkKPiArICAgIG9wdF9lcHRfZXhlY19z
cCA9IHZhbDsKPiArCj4gKyAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7Cj4g
KyAgICBmb3JfZWFjaF9kb21haW4gKCBkICkKPiAgICAgIHsKPiAtICAgICAgICBzdHJ1Y3QgZG9t
YWluICpkOwo+ICsgICAgICAgIC8qIFBWLCBvciBIVk0gU2hhZG93IGRvbWFpbj8gIE5vdCBhcHBs
aWNhYmxlLiAqLwo+ICsgICAgICAgIGlmICggIXBhZ2luZ19tb2RlX2hhcChkKSApCj4gKyAgICAg
ICAgICAgIGNvbnRpbnVlOwo+Cj4gLSAgICAgICAgb3B0X2VwdF9leGVjX3NwID0gdmFsOwo+ICsg
ICAgICAgIC8qIEhhcmR3YXJlIGRvbWFpbj8gTm90IGFwcGxpY2FibGUuICovCj4gKyAgICAgICAg
aWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPgo+
IC0gICAgICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKPiAtICAgICAgICBm
b3JfZWFjaF9kb21haW4gKCBkICkKPiAtICAgICAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV9oYXAo
ZCkgKQo+IC0gICAgICAgICAgICAgICAgcDJtX2NoYW5nZV9lbnRyeV90eXBlX2dsb2JhbChkLCBw
Mm1fcmFtX3J3LCBwMm1fcmFtX3J3KTsKPiAtICAgICAgICByY3VfcmVhZF91bmxvY2soJmRvbWxp
c3RfcmVhZF9sb2NrKTsKPiArICAgICAgICAvKiBOZXN0ZWQgVmlydD8gIEJyb2tlbiBhbmQgZXhl
Y19zcCBmb3JjZWQgb24gdG8gYXZvaWQgbGl2ZWxvY2tzLiAqLwo+ICsgICAgICAgIGlmICggbmVz
dGVkaHZtX2VuYWJsZWQoZCkgKQo+ICsgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAg
ICAgLyogU2V0dGluZyBhbHJlYWR5IG1hdGNoZXM/ICBObyBuZWVkIHRvIHJlYnVpbGQgdGhlIHAy
bS4gKi8KPiArICAgICAgICBpZiAoIGQtPmFyY2guaHZtLnZteC5leGVjX3NwID09IHZhbCApCj4g
KyAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICBkLT5hcmNoLmh2bS52bXguZXhl
Y19zcCA9IHZhbDsKPiArICAgICAgICBwMm1fY2hhbmdlX2VudHJ5X3R5cGVfZ2xvYmFsKGQsIHAy
bV9yYW1fcncsIHAybV9yYW1fcncpOwo+ICAgICAgfQo+ICsgICAgcmN1X3JlYWRfdW5sb2NrKCZk
b21saXN0X3JlYWRfbG9jayk7Cj4KPiAgICAgIHByaW50aygiVk1YOiBFUFQgZXhlY3V0YWJsZSBz
dXBlcnBhZ2VzICVzYWJsZWRcbiIsCj4gICAgICAgICAgICAgdmFsID8gImVuIiA6ICJkaXMiKTsK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYwo+IGluZGV4IDZhNWVlYjVjMTMuLmE3MWRmNzFiYzEgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYwo+IEBAIC00MDQsNiArNDA0LDEyIEBAIHN0YXRpYyBpbnQgdm14X2RvbWFpbl9pbml0
aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpCj4KPiAgICAgIGQtPmFyY2guY3R4dF9zd2l0Y2ggPSAm
Y3N3Owo+Cj4gKyAgICAvKgo+ICsgICAgICogV29yayBhcm91bmQgQ1ZFLTIwMTgtMTIyMDc/ICBU
aGUgaGFyZHdhcmUgZG9tYWluIGlzIGFscmVhZHkgcGVybWl0dGVkCj4gKyAgICAgKiB0byByZWJv
b3QgdGhlIHN5c3RlbSwgc28gZG9lc24ndCBuZWVkIG1pdGlnYXRpbmcgYWdhaW5zdCBEb1Mncy4K
PiArICAgICAqLwo+ICsgICAgZC0+YXJjaC5odm0udm14LmV4ZWNfc3AgPSBpc19oYXJkd2FyZV9k
b21haW4oZCkgfHwgb3B0X2VwdF9leGVjX3NwOwo+ICsKPiAgICAgIGlmICggIWhhc192bGFwaWMo
ZCkgKQo+ICAgICAgICAgIHJldHVybiAwOwo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9o
dm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+IGluZGV4IDY2OTZi
ZDYyNDAuLjVkZDAwZTExYjUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCj4gQEAgLTYzLDEwICs2Mywy
MyBAQCB2b2lkIG52bXhfY3B1X2RlYWQodW5zaWduZWQgaW50IGNwdSkKPgo+ICBpbnQgbnZteF92
Y3B1X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCj4gIHsKPiArICAgIHN0cnVjdCBkb21haW4g
KmQgPSB2LT5kb21haW47Cj4gICAgICBzdHJ1Y3QgbmVzdGVkdm14ICpudm14ID0gJnZjcHVfMl9u
dm14KHYpOwo+ICAgICAgc3RydWN0IG5lc3RlZHZjcHUgKm52Y3B1ID0gJnZjcHVfbmVzdGVkaHZt
KHYpOwo+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBhbGxvY19kb21oZWFwX3BhZ2UoTlVM
TCwgMCk7Cj4KPiArICAgIC8qCj4gKyAgICAgKiBHcm9zcyBib2RnZS4gIFRoZSBuZXN0ZWQgcDJt
IGxvZ2ljIGNhbid0IGNvcGUgd2l0aCB0aGUgQ1ZFLTIwMTgtMTIyMDcKPiArICAgICAqIHdvcmth
cm91bmQgb2YgdXNpbmcgTlggRVBUIHN1cGVycGFnZXMsIGFuZCBsaXZlbG9ja3MuICBOZXN0ZWQg
SFZNIGlzbid0Cj4gKyAgICAgKiBzZWN1cml0eSBzdXBwb3J0ZWQsIHNvIGRpc2FibGUgdGhlIHdv
cmthcm91bmQgdW50aWwgdGhlIG5lc3RlZCBwMm0KPiArICAgICAqIGxvZ2ljIGNhbiBiZSBpbXBy
b3ZlZC4KPiArICAgICAqLwo+ICsgICAgaWYgKCAhZC0+YXJjaC5odm0udm14LmV4ZWNfc3AgKQo+
ICsgICAgewo+ICsgICAgICAgIGQtPmFyY2guaHZtLnZteC5leGVjX3NwID0gdHJ1ZTsKPiArICAg
ICAgICBwMm1fY2hhbmdlX2VudHJ5X3R5cGVfZ2xvYmFsKGQsIHAybV9yYW1fcncsIHAybV9yYW1f
cncpOwoKVGhlcmUgd2Fzbid0IGFuIGlzc3VlIHdpdGggbmVzdGVkIGd1ZXN0cyBoYXZpbmcgdG8g
ZGVhbCB3aXRoIHRoZQpjaGFuZ2VkIGVudHJ5IHR5cGU/CgpBc3N1bWluZyB0aGUgYW5zd2VyIHRv
IHRoYXQgaXMgIm5vIjoKCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
