Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4E17BDC9
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:09:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACgN-0000bv-5G; Fri, 06 Mar 2020 13:06:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pagX=4X=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jACCU-0005Zc-KZ
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 12:35:34 +0000
X-Inumbo-ID: f8f38faa-5fa6-11ea-90c4-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8f38faa-5fa6-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 12:35:33 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a13so2314352edu.7
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=6UWT1RSksUE7g5mxBF9QjyhXzAPQnEnLcSPS3iYF6dE=;
 b=oAPtBNQ4DtQFfY0+j6HNXl3Syf2jxcstm8S5/HFXAGmhxheguI3rjkqfIzXAx8dKoh
 xADscgFLmyNnzC9tjZ32YQq6Q3DGXhsb3c8CUOL2a3uquKLc7rOzLkqp7oUFBG9Jnm9G
 IB+8pukPFZV2bNRGpVl4kSwmSoy8AXxtZ2MEXm9peJlb5HcbLY2L1BH8gb5vUVgUIozc
 UJ9heQOyWuuUpBE4i0AKQOdxMRgussEwIRXAyPj56yI3KfY1rpxmj85Af0E4opOsQi/+
 4n1ls6SQTeF8B32reuzxa4aUxouYADLgtJrsNkE3K11iECh+8LF4fTH0O+yK5X/ss0tt
 XlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=6UWT1RSksUE7g5mxBF9QjyhXzAPQnEnLcSPS3iYF6dE=;
 b=p+1/FPzK57sGwYkkwTllnlw9HMba8z0ixbFzxDV+KGxlSUtrs1TkbJJ/JzpRk82jWh
 zLgm0AfzOuE9UooHKXxd8Uftp9x/PO7R3mHcryntsw0ig5CwYds30scV3qETq1MfQZib
 PvjTJdjp1Ms+OQ5jFsNth5h+BMBK7s33WcTTgW5OwW/JAjuvTevEHv+l9Oc+C5uCTT2M
 biRc3Nhb0UrhAOHfMsvp67WpVQ+InDdbhOhhgvIeGRCeDJ31vslAISSzZgPLqETq3ubb
 PS6WB1Ab4L4Wth1ZJ+fi7NEwBM0XlbgMM8OoJAHKIAFN+OMW1kYa4Y3iJ7p934u0NMXt
 M1ug==
X-Gm-Message-State: ANhLgQ0CNFelchDjhf4wZooALJTPplR5J+8S1x0jRMNbmGzstKGU9F5V
 GZU5SX8Ur1FSFMbzrxejrgA=
X-Google-Smtp-Source: ADFU+vvA/qQjrvKzwWXQ71EpIDsTS2U+U0LIRIhAICB9mFVF8CHXCraJIVMqiqesXyL64e1FZkCxTA==
X-Received: by 2002:a05:6402:1cb6:: with SMTP id
 cz22mr2735156edb.21.1583498133066; 
 Fri, 06 Mar 2020 04:35:33 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id la8sm1474908ejb.80.2020.03.06.04.35.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 04:35:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<pdurrant@amzn.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
In-Reply-To: <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
Date: Fri, 6 Mar 2020 12:35:23 -0000
Message-ID: <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEyOvZuCAMEJD7nL/4EVPUXX19E4gITquFTAmK0nVGpXzzq0A==
Content-Language: en-gb
X-Mailman-Approved-At: Fri, 06 Mar 2020 13:06:25 +0000
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaAo+
IFNlbnQ6IDA2IE1hcmNoIDIwMjAgMTI6MjAKPiBUbzogcGR1cnJhbnRAYW16bi5jb20KPiBDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Owo+IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBQYXVsCj4gRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT47
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcAo+
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz47IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IHhlbi0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
U3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MyA1LzZdIG1tOiBhZGQgJ2lzX3NwZWNp
YWxfcGFnZScgbWFjcm8uLi4KPiAKPiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVycmFudEBhbXpu
LmNvbSB3cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiA+IEBAIC0yMDg3LDE5ICsy
MDg3LDIyIEBAIHN0YXRpYyBpbnQgc2hfcmVtb3ZlX2FsbF9tYXBwaW5ncyhzdHJ1Y3QgZG9tYWlu
ICpkLCBtZm5fdCBnbWZuLCBnZm5fdCBnZm4pCj4gPiAgICAgICAgICAgKiBUaGUgcWVtdSBoZWxw
ZXIgcHJvY2VzcyBoYXMgYW4gdW50eXBlZCBtYXBwaW5nIG9mIHRoaXMgZG9tJ3MgUkFNCj4gPiAg
ICAgICAgICAgKiBhbmQgdGhlIEhWTSByZXN0b3JlIHByb2dyYW0gdGFrZXMgYW5vdGhlci4KPiA+
ICAgICAgICAgICAqIEFsc28gYWxsb3cgb25lIHR5cGVkIHJlZmNvdW50IGZvcgo+ID4gLSAgICAg
ICAgICogLSBYZW4gaGVhcCBwYWdlcywgdG8gbWF0Y2ggc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVz
dCgpLAo+ID4gLSAgICAgICAgICogLSBpb3JlcSBzZXJ2ZXIgcGFnZXMsIHRvIG1hdGNoIHByZXBh
cmVfcmluZ19mb3JfaGVscGVyKCkuCj4gPiArICAgICAgICAgKiAtIHNwZWNpYWwgcGFnZXMsIHdo
aWNoIGFyZSBleHBsaWNpdGx5IHJlZmVyZW5jZWQgYW5kIG1hcHBlZCBieQo+ID4gKyAgICAgICAg
ICogICBYZW4uCj4gPiArICAgICAgICAgKiAtIGlvcmVxIHNlcnZlciBwYWdlcywgd2hpY2ggbWF5
IGJlIHNwZWNpYWwgcGFnZXMgb3Igbm9ybWFsCj4gPiArICAgICAgICAgKiAgIGd1ZXN0IHBhZ2Vz
IHdpdGggYW4gZXh0cmEgcmVmZXJlbmNlIHRha2VuIGJ5Cj4gPiArICAgICAgICAgKiAgIHByZXBh
cmVfcmluZ19mb3JfaGVscGVyKCkuCj4gPiAgICAgICAgICAgKi8KPiA+ICAgICAgICAgIGlmICgg
IShzaGFkb3dfbW9kZV9leHRlcm5hbChkKQo+ID4gICAgICAgICAgICAgICAgICYmIChwYWdlLT5j
b3VudF9pbmZvICYgUEdDX2NvdW50X21hc2spIDw9IDMKPiA+ICAgICAgICAgICAgICAgICAmJiAo
KHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spCj4gPiAtICAgICAgICAg
ICAgICAgICAgID09IChpc194ZW5faGVhcF9wYWdlKHBhZ2UpIHx8Cj4gPiArICAgICAgICAgICAg
ICAgICAgID09IChpc19zcGVjaWFsX3BhZ2UocGFnZSkgfHwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIChpc19odm1fZG9tYWluKGQpICYmIGlzX2lvcmVxX3NlcnZlcl9wYWdlKGQsIHBhZ2Up
KSkpKSApCj4gCj4gU2hvdWxkbid0IHlvdSBkZWxldGUgbW9zdCBvZiB0aGlzIGxpbmUsIGFmdGVy
IHRoZSBwcmV2aW91cyBwYXRjaAo+IGNvbnZlcnRlZCB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIHRv
IFBHQ19leHRyYSBvbmVzPwoKSSB0aG91Z2h0IHRoYXQgdG9vIG9yaWdpbmFsbHkgYnV0IHRoZW4g
SSByZWFsaXNlIHdlIHN0aWxsIGhhdmUgdG8gY2F0ZXIgZm9yIHRoZSAnbGVnYWN5JyBlbXVsYXRv
cnMgdGhhdCBzdGlsbCByZXF1aXJlIElPUkVRIHNlcnZlciBwYWdlcyB0byBiZSBtYXBwZWQgdGhy
b3VnaCB0aGUgcDJtLCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBub3QgYmUgUEdDX2V4dHJhIHBh
Z2VzLgoKPiAKPiA+ICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICJjYW4ndCBmaW5k
IGFsbCBtYXBwaW5ncyBvZiBtZm4gJSJQUklfbWZuCj4gPiAtICAgICAgICAgICAgICAgICAgICIg
KGdmbiAlIlBSSV9nZm4iKTogYz0lbHggdD0lbHggeD0lZCBpPSVkXG4iLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAiIChnZm4gJSJQUklfZ2ZuIik6IGM9JWx4IHQ9JWx4IHM9JWQgaT0lZFxuIiwK
PiA+ICAgICAgICAgICAgICAgICAgICAgbWZuX3goZ21mbiksIGdmbl94KGdmbiksCj4gPiAgICAg
ICAgICAgICAgICAgICAgIHBhZ2UtPmNvdW50X2luZm8sIHBhZ2UtPnUuaW51c2UudHlwZV9pbmZv
LAo+ID4gLSAgICAgICAgICAgICAgICAgICAhIWlzX3hlbl9oZWFwX3BhZ2UocGFnZSksCj4gPiAr
ICAgICAgICAgICAgICAgICAgICEhaXNfc3BlY2lhbF9wYWdlKHBhZ2UpLAo+IAo+IFRoZSAhISB3
b3VsZCBiZSBuaWNlIHRvIGdvIGF3YXkgYXQgdGhpcyBvY2Nhc2lvbjoKPiAKCk9rLgoKPiA+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+
ID4gQEAgLTI4NSw2ICsyODUsOSBAQCBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX2NvdzsKPiA+
Cj4gPiAgI2luY2x1ZGUgPGFzbS9tbS5oPgo+ID4KPiA+ICsjZGVmaW5lIGlzX3NwZWNpYWxfcGFn
ZShwYWdlKSBcCj4gPiArICAgIChpc194ZW5faGVhcF9wYWdlKHBhZ2UpIHx8ICgocGFnZSktPmNv
dW50X2luZm8gJiBQR0NfZXh0cmEpKQo+IAo+IENhbiB0aGlzIGJlY29tZSBhbiBpbmxpbmUgZnVu
Y3Rpb24gcmV0dXJuaW5nIGJvb2w/Cj4gCgpJIGd1ZXNzIHNvLiBIb3BlZnVsbHkgdGhlcmUgYXJl
IG5vIGhlYWRlciBpbmNsdXNpb24gb3JkZXJpbmdzIHRoYXQgd291bGQgYml0ZS4KCj4gQWxzbyBJ
IG5vdGljZSB0aGlzIGNvbnN0cnVjdCBpcyB1c2VkIGJ5IHg4NiBjb2RlIG9ubHkgLSBpcyB0aGVy
ZQo+IGEgcGFydGljdWxhciByZWFzb24gaXQgZG9lc24ndCBnZXQgcGxhY2VkIGluIGFuIHg4NiBo
ZWFkZXIgKGF0Cj4gbGVhc3QgZm9yIHRoZSB0aW1lIGJlaW5nKT8KPiAKClBHQ19leHRyYSBwYWdl
cyBhcmUgY29tbW9uIHNvIG1heWJlIGl0IGlzIGJldHRlciBvZmYgZGVmaW5lZCBoZXJlIHNvIGl0
IGlzIGF2YWlsYWJsZSB0byBBUk0gY29kZT8KCj4gRnVydGhlciBJIG5vdGljZSB5b3UgbmVpdGhl
ciB0YWtlIGNhcmUgb2YgaXNfeGVuX2hlYXBfbWZuKCksIG5vcgo+IGRvZXMgdGhlIGRlc2NyaXB0
aW9uIGV4cGxhaW4gd2h5IHRoYXQgd291bGQgbm90IGFsc28gbmVlZCBhdAo+IGxlYXN0IGNvbnNp
ZGVyaW5nIGNvbnZlcnNpb24uIF9zaF9wcm9wYWdhdGUoKSwgZm9yIGV4YW1wbGUsIGhhcwo+IGFu
IGluc3RhbmNlIHRoYXQgSSB0aGluayB3b3VsZCBuZWVkIGNoYW5naW5nLgo+IAoKT2s7IEknZCBz
aW1wbHkgbm90IHNwb3R0ZWQgYW55IHVzZXJzIHRoYXQgd2VyZSB2dWxuZXJhYmxlLi4uIEknbGwg
Zml4IHRoYXQgb25lIGFuZCByZS1jaGVjay4KCj4gRmluYWxseSBJIG5vdGljZSB0aGVyZSBhcmUg
dHdvIGlzX3hlbl9oZWFwX3BhZ2UoKSB1c2VzIGluIHRib290LmMsCj4gYm90aCBvZiB3aGljaCBs
b29rIGxpa2UgdGhleSBhbHNvIHdhbnQgY29udmVydGluZy4KPiAKCk9LOyBJJ2Qgc2VlbiB0aG9z
ZSBzbyBubyBpZGVhIHdoeSBJIGRpZG4ndCBkbyB0aGUgY29udmVyc2lvbi4gSSdsbCBmaXguCgog
IFBhdWwKCj4gSmFuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
