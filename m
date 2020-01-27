Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A314A978
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:11:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8o9-00075q-EX; Mon, 27 Jan 2020 18:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEJ2=3Q=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iw8o8-00075l-HK
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:08:20 +0000
X-Inumbo-ID: ff632fca-412f-11ea-acc1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff632fca-412f-11ea-acc1-bc764e2007e4;
 Mon, 27 Jan 2020 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580148499;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Oy2zC13FeCtA1rgL+m4u/n83fOGIFhBkI0IWACDAnPI=;
 b=NbdOq3JOyc8sBDObu2yr/q1K3rRV1T6GqfEIXYd+lGN8SKXxWVAlttJA
 K/oNrDSRIt/masmmO1ieLNy30Mai5TMQxuq2ITM0x6Fg04izSqKeNcMm9
 6zJFfiSDSKdHU0FdX3W4NP4lYHgxK1f3V6YBwwwvBhDzXADf0UYJJ2yvP g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YcQl5qKjNKruQS2TZsZVXr0e+I5YsyDdejKjTA9Tw1RFT9tKyQ5lPN/f/a2W/lzxZloXTqZXEV
 L4V/2JYz3wtjUiR+1Ltz23G9ospFOnRSb7/E7vAZAAW6Wi02BaysmGMXvxyCQ6UXupOX1arOIP
 Dck7gWzaKoSWXxb2McXlE1iOo1K61By8WiwuJCq3nGoGKwJgwihyGyCAZ3ZLXQLS2aSln9+tXR
 elaFKDg1TXs7NfqDlwryx/uldI2dw/4o10iGhnaGZtJYWHf4AdXBYM31HaN8XGHETqHZfNnIzE
 CIU=
X-SBRS: 2.7
X-MesageID: 11875911
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11875911"
To: Nick Rosbrook <rosbrookn@gmail.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-8-george.dunlap@citrix.com>
 <CAEBZRSc_+G6itzyNGMd7GO5eC6aOZ3zE7vopQmTiQ5CnG+6VYw@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwA==
Message-ID: <4db0f4fa-98db-33d6-5be5-f6ea59096166@citrix.com>
Date: Mon, 27 Jan 2020 18:08:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEBZRSc_+G6itzyNGMd7GO5eC6aOZ3zE7vopQmTiQ5CnG+6VYw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 8/8] RFC: Sketch constructors,
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yNC8yMCA3OjMyIFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+IFNvcnJ5IGZvciB0aGUg
bGF0ZSByZXBseSBvbiB0aGlzIG9uZS4KPiAKPj4gK2Z1bmMgTmV3RG9tYWluQ29uZmlnKHQgRG9t
YWluVHlwZSkgKCpEb21haW5Db25maWcsIGVycm9yKSB7Cj4+ICsgICAgICAgdmFyIGNjb25maWcg
Qy5saWJ4bF9kb21haW5fY29uZmlnCj4+ICsKPj4gKyAgICAgICBDLmxpYnhsX2RvbWFpbl9jb25m
aWdfaW5pdCgmY2NvbmZpZykKPj4gKyAgICAgICBDLmxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2lu
aXRfdHlwZSgmY2NvbmZpZy5iX2luZm8sIEMubGlieGxfZG9tYWluX3R5cGUodCkpCj4+ICsKPj4g
KyAgICAgICBnY29uZmlnIDo9ICZEb21haW5Db25maWd7fQo+PiArICAgICAgIGVyciA6PSBnY29u
ZmlnLmZyb21DKCZjY29uZmlnKQo+PiArICAgICAgIGlmIGVyciAhPSBuaWwgewo+PiArICAgICAg
ICAgICAgICAgcmV0dXJuIG5pbCwgZXJyCj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgcmV0
dXJuIGdjb25maWcsIG5pbAo+PiArfQo+IAo+IEkgdGhpbmsgdGhpcyBpcyBzdWZmaWNpZW50IGZv
ciB0aGUgIk5ldyIgZnVuY3Rpb25zOyBzaW1wbGUgaXMgcHJvYmFibHkKPiBiZXR0ZXIgaGVyZS4g
SSBhcHByZWNpYXRlIHRoZSBpZGVhIG9mIHRoZSBgcG9wdWxhdGUgZnVuY2AgYXBwcm9hY2ggeW91
Cj4gbWVudGlvbmVkIGluIGFub3RoZXIgZW1haWwsIGJ1dCBJIHRoaW5rIGluIHByYWN0aWNlIHBl
b3BsZSB3aWxsIHdhbnQKPiB0byBsZXZlcmFnZSBlbmNvZGluZy9qc29uIG9yIG90aGVyd2lzZSB0
byB1bm1hcnNoYWwgc29tZSBkYXRhIGludG8gYQo+IERvbWFpbkNvbmZpZyBldGMuIE9yLCB3ZSB3
b3VsZCBob3BlZnVsbHkgYmUgYWJsZSB0byB1bm1hcnNoYWwgYW4KPiB4bC5jZmcuIEFsbCB0aGF0
IGlzIHRvIHNheSwgSSB0aGluayB0aGUgYXBwcm9hY2ggeW91IGhhdmUgc2hvd24gaGVyZQo+IGdp
dmVzIHVzIGFuZCBwYWNrYWdlIHVzZXJzIHRoZSBtb3N0IGZsZXhpYmlsaXR5LgoKSSB0aGluayBt
YXJzaGFsaW5nIGFuZCB1bm1hcnNoYWxsaW5nIHNob3VsZCBiZSBmaW5lLCAqYXMgbG9uZyBhcyog
dGhlCnN0cnVjdHVyZSBiZWluZyB1bm1hcnNoYWxsZWQgYWN0dWFsbHkgd2VudCB0aHJvdWdoIHRo
ZQpsaWJ4bF88dHlwZT5faW5pdCgpIGZ1bmN0aW9uIGZpcnN0LgoKSW4gZmFjdCwgSSB3YXMga2lj
a2luZyBhcm91bmQgdGhlIGlkZWEgb2YgYWRkaW5nIGEgbm9uLWV4cG9ydGVkIGZpZWxkIHRvCmFs
bCB0aGUgZ2VuZXJhdGVkIHN0cnVjdHMgLS0gbWF5YmUgImJvb2wgaW5pdGFsaXplZCIgLS0gYW5k
IGhhdmluZyB0aGUKLmZyb21DKCkgbWV0aG9kcyBzZXQgdGhpcyB0byAndHJ1ZScsIGFuZCB0aGUg
LnRvQygpIG1ldGhvZHMgcmV0dXJuIGFuCmVycm9yIGlmIGl0IHdhc24ndCBzZXQuICBCdXQgdGhl
biB3ZSdkIG5lZWQgdG8gd3JpdGUgY3VzdG9tIEpTT04KbWFyc2hhbGxlcnMgdG8gaGFuZGxlIHRo
ZXNlLgoKSSdtIG5vdCBwZXJzb25hbGx5IHZlcnkgaW50ZXJlc3RlZCBpbiBwYXJzaW5nIHhsLmNm
ZyBmaWxlcywgYnV0IGxpYnhsCmhhcyBsaWJyYXJ5IGZ1bmN0aW9ucyB0byBkbyB0aGF0LCBzbyBp
dCBzaG91bGQgYmUgc29tZXRoaW5nIHZlcnkgZWFzeSB0bwphZGQgaWYgeW91IHdhbnQuICAoQWx0
aG91Z2ggaW4gZmFjdCwgaXQgbG9va3MgbGlrZSBhIGxvdCBvZiB0aGUgY29kZSB0bwphY3R1YWxs
eSBpbnRlcnByZXQgdGhlIHJlc3VsdHMgb2YgdGhlIHBhcnNpbmcgaXMgaW4geGw7IHdlIG1pZ2h0
IHdhbnQgdG8Kc2VlIGFib3V0IG1vdmluZyBzb21lIG9mIHRoYXQgZnVuY3Rpb25hbGl0eSBpbnRv
IGxpYnhsdS4pCgo+IElmIHdlIHN0aWNrIHdpdGggdGhpcyBvdXRsaW5lIGZvciBjb25zdHJ1Y3Rv
cnMsIHRoZXkgd2lsbCBiZSBlYXN5IHRvCj4gZ2VuZXJhdGUuIEknbSBoYXBweSB0byB3b3JrIG9u
IHRoYXQsIHVubGVzcyB5b3Ugd2VyZSBhbHJlYWR5IHBsYW5uaW5nCj4gb24gaXQuCgpJJ20gYWZy
YWlkIG15IDEgZGF5IGEgd2VlayBvZiBjb2RpbmcgaXMgZ29pbmcgdG8gaGF2ZSB0byBiZSBkaXZl
cnRlZCB0bwpzb21ldGhpbmcgZWxzZSBmb3IgYSBtb250aCBvciBzbzsgc28gcGxlYXNlIGdvIGFo
ZWFkIGlmIHlvdSBoYXZlIHRoZSB0aW1lLgoKQXMgZmFyIGFzIGZ1cnRoZXIgc3RlcHMgLS0gZG8g
eW91IGhhdmUgYSBjbGVhciBpZGVhIHdoYXQga2luZCBvZgpmdW5jdGlvbmFsaXR5IHlvdSdkIGxp
a2UgdG8gc2VlIHBvc3NpYmxlIGJ5IHRoZSB0aW1lIG9mIHRoZSBmZWF0dXJlCmZyZWV6ZSAocHJv
YmFibHkgaW4gTWF5KT8gIERvIHlvdSBoYXZlIHBsYW5zIHRvIHVzZSB0aGVzZSBiaW5kaW5ncwp5
b3Vyc2VsZiwgYW5kIGlmIHNvLCBob3c/CgpGb3IgbXkgcGFydCwgSSB3YW50IHRvIHN0YXJ0IGFu
ZCByZWFwIGd1ZXN0cy4gIFRoZSBsYXR0ZXIgd2lsbCByZXF1aXJlCmFkZGluZyBldmVudCBjYWxs
YmFjayBmdW5jdGlvbmFsaXR5IHdoaWNoIHdpbGwgcmVxdWlyZSBtb3JlIHRob3VnaHQgKGFuZApw
ZXJoYXBzIGV4cG9zZSBtb3JlIGxpYnhsIGlzc3VlcykuICBCdXQgSSBkb24ndCB5ZXQgaGF2ZSBh
IGNsZWFyIHRhcmdldApiZXlvbmQgdGhhdC4KClJlIGZ1bmN0aW9uIGNhbGxzIC0tIGRvIHdlIHdh
bnQgdG8ganVzdCBtYW51YWxseSBkdXBsaWNhdGUgdGhlbSBhcwpuZWVkZWQsIG9yIHRyeSB0byBn
ZXQgc29tZSBzb3J0IG9mIElETCBzdXBwb3J0PwoKT3RoZXIgd29yayBpdGVtcyBpbmNsdWRlOgoK
KiBtb2RpZnlpbmcgY29uZmlndXJlIHRvIGRldGVjdCB0aGUgYXZhaWxhYmlsaXR5IG9mIGdvIGFu
ZCBlbmFibGUgdGhlCmJpbmRpbmdzIGlmIGl0J3MgYXZhaWxhYmxlCgoqIEVuYWJsaW5nIGdvIGJ1
aWxkIHRlc3RpbmcgaW4gdGhlIGdpdGxhYiBDSSBsb29wCgoqIE1ha2luZyBgZ28gZ2V0YCB3b3Jr
LCB3aGljaCBtaWdodCBpbnZvbHZlIGhhdmluZyBjb2RlIHRvIHB1c2gKcG9zdC1nZW5lcmF0ZWQg
Y29kZSB0byBhIHJlcG8gYW5kIHRhZ2dpbmcgYXMgYXBwcm9wcmlhdGUKCiAtR2VvcmdlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
