Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A11803A0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:35:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhnt-0000mu-Ru; Tue, 10 Mar 2020 16:32:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBhnr-0000mi-Kq
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:32:23 +0000
X-Inumbo-ID: b7dee782-62ec-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7dee782-62ec-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 16:32:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a13so17097729edu.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=KLDPt/bMMMTN09tYDPqCkOfZ/r8NbNDD+JfxYPzd9N4=;
 b=ZuKl6RI97ioxr8aKQRFPo2k69tTORJ8Y2klgLgIzBBNweb0jiCGl2a7nwiVXedwOp+
 Dm5Ja+/XbezW0De72oWKpH8M+qrQfajVylXpG8gwqzLfibgGYV+54ppyx2z6Mk5I1SjA
 5B1+cDfikW+hY1+tgZcNXKXaS15Okce8MUFuJuezr8ji/P2zWVcyi51Ld8gm7kgrYONG
 M+3GGQVWCyrSdUChLNBFw1Iy3hMoqv7+sjq+WPoBRn6KboMHqbHglOMXq7h4JNpm5tBh
 RTRR3GRsatjxo6hbfObWVPBGLSrBTk1aw+uFVfBkcxpmVrxU8Ssa0lQGobQlWmm3IAnz
 v7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=KLDPt/bMMMTN09tYDPqCkOfZ/r8NbNDD+JfxYPzd9N4=;
 b=j8J46UqejSKpRY6DC0p8cYmvBBNVOt3GSbWiO0pMJBjvtBRJfzr8s6oZh4wYrjrJPN
 MnVPfV1CkBXLBqSblYI/dwVLVRTWXAOfiFf+kzWzXmcNQt6OzTDWfCR4fYfTUmpH1KOA
 alMc1TTrT0zDf2a0rjgAHK9SSBhbl7pFCnfC/nJweHscnVzeRILfRNHeoi1TmhHukmB4
 85o+BOiu0a6Go0F2ZLACnEJie19IEZaowU9LWzaz4vkpMESON7wLG8Q/24npHgdan9TY
 dSWqhmDdcFhQahOcvXa+omYF1qbwDKaFghqdd/jY6Z6gOZFoENe6R3P2Wpy1UsFGLZi7
 th9w==
X-Gm-Message-State: ANhLgQ2mTaa3nVEDTLwB6h9XgtxKgyYtN4GBPHlxVMiVHGsYoCbjNYMr
 6X+ugwfv7lUCpCxEROxrcqA=
X-Google-Smtp-Source: ADFU+vtstxfr1O1HeWpkQ+ahXInxd9uF/cb5IeK+udEzp513aBxGBxp/DMYroti23FKAxKwiLYCxtg==
X-Received: by 2002:aa7:d04a:: with SMTP id n10mr23648665edo.123.1583857942165; 
 Tue, 10 Mar 2020 09:32:22 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id n17sm2631010ejr.16.2020.03.10.09.32.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 09:32:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-6-paul@xen.org>
 <41a8e134-bb6e-0437-536b-48afa3fa0ac9@suse.com>
In-Reply-To: <41a8e134-bb6e-0437-536b-48afa3fa0ac9@suse.com>
Date: Tue, 10 Mar 2020 16:32:20 -0000
Message-ID: <003801d5f6f9$78fbb8b0$6af32a10$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgKCAC34AcLW2xan02mYUA==
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v5 5/6] mm: add 'is_special_page' inline
 function...
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
Reply-To: paul@xen.org
Cc: 'Tamas K Lengyel' <tamas@tklengyel.com>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAwOSBNYXJjaCAyMDIwIDEzOjI4Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT47IFRhbWFzIEsgTGVuZ3llbAo+IDx0YW1hc0B0a2xlbmd5ZWwuY29t
PjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBSb2dlciBQYXUKPiBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24KPiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBL
b25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNS82XSBtbTogYWRkICdpc19zcGVjaWFsX3Bh
Z2UnIGlubGluZSBmdW5jdGlvbi4uLgo+IAo+IE9uIDA5LjAzLjIwMjAgMTE6MjMsIHBhdWxAeGVu
Lm9yZyB3cm90ZToKPiA+IHY0Ogo+ID4gIC0gVXNlIGlubGluZSBmdW5jdGlvbiBpbnN0ZWFkIG9m
IG1hY3JvCj4gPiAgLSBBZGQgbWlzc2luZyBjb252ZXJzaW9ucyBmcm9tIGlzX3hlbl9oZWFwX3Bh
Z2UoKQo+IAo+IEFtb25nIHRoZXNlIGFsc28gb25lIGNvbnZlcnNpb24gb2YgaXNfeGVuX2hlYXBf
bWZuKCkuIEknbSBzdGlsbAo+IGN1cmlvdXMgd2h5IG90aGVycyB3b3VsZG4ndCBuZWVkIGNvbnZl
cnRpbmcgLSB0aGUgZGVzY3JpcHRpb24KPiBkb2Vzbid0IG1lbnRpb24gdGhlcmUgYXJlIG1vcmUs
IHNlZSBwMm1fYWRkX2ZvcmVpZ24oKSBmb3IgYW4KPiBleGFtcGxlIChtYXkgd2FycmFudCBpbnRy
b2R1Y3Rpb24gb2YgaXNfc3BlY2lhbF9tZm4oKSB0aGVuKS4gSXQKPiB3b3VsZCBwcm9iYWJseSBi
ZSBiZW5lZmljaWFsIGlmIHRoZSBkZXNjcmlwdGlvbiBnYXZlIHNvbWUKPiBnZW5lcmljIGNyaXRl
cmlhIGZvciBjYXNlcyB3aGVyZSBjb252ZXJzaW9uIGlzIChub3QpIG5lZWRlZC4KPiAKCk9LLiBC
YXNpY2FsbHkgaXTigJlzIHRvIGNvdmVyIHRoZSBjYXNlIHdoZXJlIGlzX3hlbl9oZWFwX3BhZ2Uo
KSBpcyB1c2VkIHRvIG1lYW4gJ2lzbid0IG5vcm1hbCBndWVzdCBtZW1vcnknLiBJJ2xsIGV4cGFu
ZCB0aGUgY29tbWl0IGNvbW1lbnQgdG8gc2F5IHRoYXQuCgo+IEJ1dCB0aGVyZSBhcmUgaXNzdWVz
IGJleW9uZCB0aGlzLCBhcyB0aGVyZSBhcmUgYWxzbyBvcGVuLWNvZGVkCj4gaW5zdGFuY2VzIG9m
IFBHQ194ZW5faGVhcCBjaGVja3MsIGFuZCB0aGF0J3MgdGhlIG90aGVyIHBvc3NpYmxlCj4gcmVn
cmVzc2lvbiBJIG5vdGljZSBmcm9tIHRoZSBBUElDIGFzc2lzdCBNRk4gcGFnZSBjb252ZXJzaW9u
Ogo+IFBvRCBjb2RlLCB0byBhdm9pZCBkb2luZyB0d28gc2VwYXJhdGUgY2hlY2tzIG9uIC0+Y291
bnRfaW5mbyBbMV0sCj4gdXNlcyB0d28gaW5zdGFuY2VzIG9mIGEgY29uc3RydWN0IGxpa2UgdGhp
cyBvbmUKPiAKPiAgICAgICAgICAgICAgIShwZy0+Y291bnRfaW5mbyAmIChQR0NfcGFnZV90YWJs
ZSB8IFBHQ194ZW5faGVhcCkpICYmCj4gCj4gKGFuZCBhZ2FpbiBJIGRpZG4ndCBkbyBhIGNvbXBs
ZXRlIGF1ZGl0IGZvciBmdXJ0aGVyCj4gb2NjdXJyZW5jZXMpLiBUaGlzIG1lYW5zIHRoZSBBUElD
IGFzc2lzdCBwYWdlIHJpZ2h0IG5vdyBtaWdodAo+IGJlIGEgY2FuZGlkYXRlIGZvciBnZXR0aW5n
IGNvbnZlcnRlZCB0byBQb0QgKHBvc3NpYmx5IG90aGVycyBvZgo+IHRoZSBjb25zdHJhaW50cyBh
Y3R1YWxseSBwcm9oaWJpdCB0aGlzLCBidXQgSSdtIG5vdCBzdXJlKS4KPiAKPiBbMV0gSSdtIHVu
Y29udmluY2VkIFBHQ19wYWdlX3RhYmxlIHBhZ2VzIGNhbiBhY3R1YWxseSBhcHBlYXIKPiB0aGVy
ZSwgc28gdGhlIG9wZW4tY29kaW5nIG1heSBpbiBmYWN0IGJlIGFuIG9wdGltaXphdGlvbiBvZgo+
IGRlYWQgY29kZS4KCk9rLCBJJ2xsIGF1ZGl0IG9jY3VycmVuY2VzIG9mIFBHQ194ZW5faGVhcC4K
CiAgUGF1bAoKPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiA+
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
KSkpKSApCj4gPiAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiY2FuJ3QgZmluZCBh
bGwgbWFwcGluZ3Mgb2YgbWZuICUiUFJJX21mbgo+ID4gLSAgICAgICAgICAgICAgICAgICAiIChn
Zm4gJSJQUklfZ2ZuIik6IGM9JWx4IHQ9JWx4IHg9JWQgaT0lZFxuIiwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgIiAoZ2ZuICUiUFJJX2dmbiIpOiBjPSVseCB0PSVseCBzPSVkIGk9JWRcbiIsCj4g
PiAgICAgICAgICAgICAgICAgICAgIG1mbl94KGdtZm4pLCBnZm5feChnZm4pLAo+ID4gICAgICAg
ICAgICAgICAgICAgICBwYWdlLT5jb3VudF9pbmZvLCBwYWdlLT51LmludXNlLnR5cGVfaW5mbywK
PiA+IC0gICAgICAgICAgICAgICAgICAgISFpc194ZW5faGVhcF9wYWdlKHBhZ2UpLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAhIWlzX3NwZWNpYWxfcGFnZShwYWdlKSwKPiAKPiBUaGUgcmVhc29u
IGZvciBtZSB0byBhc2sgdG8gc3dpdGNoIHRvIGFuIGlubGluZSBmdW5jdGlvbiB3YXMgdG8KPiBz
ZWUgdGhpcyAhISBnbyBhd2F5Lgo+IAo+IEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
