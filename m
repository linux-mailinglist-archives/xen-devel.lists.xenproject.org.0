Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3DAC9E51
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 14:23:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG04U-0005EO-Hf; Thu, 03 Oct 2019 12:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cg2n=X4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iG04S-0005EJ-SL
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 12:19:00 +0000
X-Inumbo-ID: fa43c9a4-e5d7-11e9-96dc-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa43c9a4-e5d7-11e9-96dc-bc764e2007e4;
 Thu, 03 Oct 2019 12:18:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q64so2444460ljb.12
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2019 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WecBup/dAzVe+EDiiWAPMO91M368w/I1wGyvkciPjDs=;
 b=LpydnJbQHErBkRDp1UdO+b8iMJ0z4SDPFge8BHLQ9dyg1ece/iytUQK18Lcu+r/Mmx
 bjZS9pMTzuqi/uoEKH4uk65S6a3OJT9VlEPUe7Tao5inKxTCewc75cf4QsKolk7oeAyE
 Fq33Yi+ggTFr2T1Nm85/01YHS65QlNvFipSDvcF2izsylK3GiXuP5Pl1hpZPHjqPPuUx
 9GqhbeGa9E8jLx5SGUGlP5oz0GUB9S7RTx3MCrKy946M2H249bGC0uJahcWshluRjfT6
 HxlOBfq9T8t07I3V+nSX+07yyyTO0QQKY2UeiIl7kcwv80KSsnRIqYz69RNYgoe2H0W1
 LqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WecBup/dAzVe+EDiiWAPMO91M368w/I1wGyvkciPjDs=;
 b=HKWTXl73NWuNY+1NOrTgVXd39zg1cUG2IJr83UVp8bnRqRL8W5D+tu9CAYCeneSjxe
 ISQjTgpvzowigJ2cUIxj1EPMfdUbnnvOObIKjK4RSG7PAQ6hKoBBXNrH1UiEoOnqR2VS
 HlTIrBTLgldRAd9T68dISz8O4i2tcsIlee02tyTUuze/jkpfx+ZErTkHwSGELAHivAr8
 39Dp/mrCgGriOBVMWkKN9ko6nrQjdwKPpG3AEThVSWX1f24W/C8Vi31zE9j8BXoXcjQX
 lF1UBYPcp2eBEe2lcaelDUiIaIFpwnFttm/2p7JEBF/fiVwmrn6VfJFtk0WgUah8gN92
 I7Gw==
X-Gm-Message-State: APjAAAX8K9vIZhiwPp2fEScAKPCBhCtQbnSDZ6qn0icJywpqlHbdihQl
 3I2UYgpqiyK+j1ygaeRkekM=
X-Google-Smtp-Source: APXvYqxhxljUFvbWb3In9nqVrjwB8Iig9ZGP842pdTGwbzeY/gIlFmCtsgTEX/LLAyAWxAjIbnMDCg==
X-Received: by 2002:a2e:29dc:: with SMTP id p89mr6070418ljp.228.1570105138606; 
 Thu, 03 Oct 2019 05:18:58 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id f6sm419539lfl.78.2019.10.03.05.18.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 05:18:57 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
 <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
 <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
 <d43ca714-130b-091b-79db-c20d1a6da2b0@gmail.com>
 <435b4ce8-6c9c-a9d3-f5b5-b19bf68f1ab9@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <92577653-a113-9028-e267-9724079402e5@gmail.com>
Date: Thu, 3 Oct 2019 15:18:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <435b4ce8-6c9c-a9d3-f5b5-b19bf68f1ab9@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjEwLjE5IDIyOjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+IE9uIDEwLzEvMTkgNTowNyBQTSwgT2xla3NhbmRyIHdyb3RlOgo+Pgo+
PiBPbiAwMS4xMC4xOSAxODozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gT24gMDEvMTAvMjAx
OSAxNjoyNSwgT2xla3NhbmRyIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMDEuMTAuMTkgMTg6MDQsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4gPiAxLiBHaXZpbmcgdGhlIElPTU1VIHRvIERvbTAgaXMgYSBi
YWQgaWRlYS4KPgo+IFBsZWFzZSB0byB0cnkgZXhwYW5kIHlvdXIgdGhvdWdodHMgaW4gdGhlIHNh
bWUgZS1tYWlsIHdoZW4geW91IHNheSAKPiAidGhpcyBpcyBhIGJhZCBpZGVhIi4KCldlbGwsIHRo
aXMgd2FzIGEgY29uY2x1c2lvbiBJIGhhZCBnb3QgZnJvbSB0aGUgZGlzY3Vzc2lvbiBbMV0uIFNv
cnJ5IGZvciAKbm90IGJlaW5nIGNsZWFyIGhlcmUuCgoKPgo+IEJ1dCwgdGhpcyBpcyBjbGVhcmx5
IHdoYXQgaGFwcGVuIGluIGN1cnJlbnQgWGVuIHNldHVwIGlmIHRoZSBkcml2ZXIgaXMgCj4gbm90
IGVuYWJsZWQuIFdoYXQgSSB3YW50IHRvIGF2b2lkIGlzIGV4cG9zaW5nIGFuIGhhbGYgY29tcGxl
dGUgCj4gYmluZGluZ3MgdG8gdGhlIGd1ZXN0ICh5b3UgZG9uJ3Qga25vdyBob3cgaXQgd2lsbCBi
ZWhhdmUpLgo+Cj4gU28gd2UgZWl0aGVyIHJlbW92ZSBhbGwgdGhlIHByb3BlcnRpZXMgYW5kIG5v
ZGUgcmVsYXRlZCB0byB0aGUgSU9NTVVzIAo+IG9yIG5vdGhpbmcuCkkgdGhpbmssIEkgZ290IGl0
LiBPdXIgdGFyZ2V0IGlzICpub3QqIHRvIGFkZCBhIHdheSBmb3IgRG9tMCB0byB1c2UgCklPTU1V
LCBidXQgdG8gYmUgY29uc2lzdGVudCBpbiByZW1vdmluZyBJT01NVSBub2RlL21hc3RlciBkZXZp
Y2UgCnByb3BlcnRpZXMuIE5vdywgd2UgcmVtb3ZlIHRoZSBJT01NVSBub2RlIGlmIFhlbiBpZGVu
dGlmaWVzIGl0ICh0aGUgCklPTU1VIGRyaXZlciBpcyBwcmVzZW50IGluIFhlbiksCnNvIGxvb2tz
IGxpa2Ugd2UgaGF2ZSB0byByZW1vdmUgbWFzdGVyIGRldmljZSBwcm9wZXJ0aWVzIG9ubHkgaWYg
dGhpcyAKbWFzdGVyIGRldmljZSBpcyBiZWhpbmQgdGhlIElPTU1VIHdoaWNoIG5vZGUgaXMgcmVt
b3ZlZC4gVGhpcywgSSBob3BlLCAKd2lsbCBhdm9pZCBleHBvc2luZyBhbiBoYWxmIGNvbXBsZXRl
IGJpbmRpbmdzIHRvIGd1ZXN0LiBBbSBJIHJpZ2h0PwoKClsxXSAKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAwODU4Lmh0bWwK
CgotLS0tLS0tLS0tCgpJZiB5b3UgaGFwcHkgd2l0aCB0aGF0IGxvZ2ljIEkgd2lsbCBjcmFmdCBh
IHByb3BlciBwYXRjaC4KCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDY3MDIxZDkuLjZkNDVlNTUgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKQEAgLTQ4MCwxMCArNDgwLDI2IEBAIHN0YXRpYyBpbnQgX19pbml0IHdy
aXRlX3Byb3BlcnRpZXMoc3RydWN0IGRvbWFpbiAKKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2lu
Zm8sCiDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHRfcHJvcGVydHkgKnByb3AsICpzdGF0dXMgPSBO
VUxMOwogwqDCoMKgwqAgaW50IHJlcyA9IDA7CiDCoMKgwqDCoCBpbnQgaGFkX2RvbTBfYm9vdGFy
Z3MgPSAwOworwqDCoMKgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqaW9tbXVfbm9kZTsKCiDCoMKg
wqDCoCBpZiAoIGtpbmZvLT5jbWRsaW5lICYmIGtpbmZvLT5jbWRsaW5lWzBdICkKIMKgwqDCoMKg
wqDCoMKgwqAgYm9vdGFyZ3MgPSAma2luZm8tPmNtZGxpbmVbMF07CgorwqDCoMKgIC8qCivCoMKg
wqDCoCAqIElmIHdlIHNraXAgdGhlIElPTU1VIGRldmljZSB3aGVuIGNyZWF0aW5nIERUIGZvciBE
b20wIChldmVuIGlmCivCoMKgwqDCoCAqIHRoZSBJT01NVSBkZXZpY2UgaXMgbm90IHVzZWQgYnkg
WGVuKSwgd2Ugc2hvdWxkIGFsc28gc2tpcCB0aGUgSU9NTVUKK8KgwqDCoMKgICogc3BlY2lmaWMg
cHJvcGVydGllcyBvZiB0aGUgbWFzdGVyIGRldmljZSBiZWhpbmQgaXQgaW4gb3JkZXIgdG8gYXZv
aWQKK8KgwqDCoMKgICogZXhwb3NpbmcgYW4gaGFsZiBjb21wbGV0ZSBJT01NVSBiaW5kaW5ncyB0
byBEb20wLgorwqDCoMKgwqAgKiBVc2UgImlvbW11X25vZGUiIGFzIGFuIGluZGljYXRvciBvZiB0
aGUgbWFzdGVyIGRldmljZSB3aGljaCAKcHJvcGVydGllcworwqDCoMKgwqAgKiBzaG91bGQgYmUg
c2tpcHBlZC4KK8KgwqDCoMKgICovCivCoMKgwqAgaW9tbXVfbm9kZSA9IGR0X3BhcnNlX3BoYW5k
bGUobm9kZSwgImlvbW11cyIsIDApOworwqDCoMKgIGlmICggaW9tbXVfbm9kZSApCivCoMKgwqAg
eworwqDCoMKgwqDCoMKgwqAgaWYgKCBkZXZpY2VfZ2V0X2NsYXNzKGlvbW11X25vZGUpICE9IERF
VklDRV9JT01NVSApCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvbW11X25vZGUgPSBOVUxMOwor
wqDCoMKgIH0KKwogwqDCoMKgwqAgZHRfZm9yX2VhY2hfcHJvcGVydHlfbm9kZSAobm9kZSwgcHJv
cCkKIMKgwqDCoMKgIHsKIMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgdm9pZCAqcHJvcF9kYXRhID0g
cHJvcC0+dmFsdWU7CkBAIC01NDAsNiArNTU2LDE5IEBAIHN0YXRpYyBpbnQgX19pbml0IHdyaXRl
X3Byb3BlcnRpZXMoc3RydWN0IGRvbWFpbiAKKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7CiDCoMKgwqDCoMKgwqDCoMKgIH0K
CivCoMKgwqDCoMKgwqDCoCBpZiAoIGlvbW11X25vZGUgKQorwqDCoMKgwqDCoMKgwqAgeworwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBEb24ndCBleHBvc2UgSU9NTVUgc3BlY2lmaWMgcHJvcGVy
dGllcyB0byBEb20wICovCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggZHRfcHJvcGVydHlf
bmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXVzIikgKQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnRpbnVlOworCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggZHRfcHJvcGVy
dHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwIikgKQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnRpbnVlOworCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggZHRf
cHJvcGVydHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwLW1hc2siKSApCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7CivCoMKgwqDCoMKgwqDCoCB9CisKIMKg
wqDCoMKgwqDCoMKgwqAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsIHByb3AtPm5hbWUs
IHByb3BfZGF0YSwgcHJvcF9sZW4pOwoKIMKgwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgKQoKCi0t
IApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
