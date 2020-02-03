Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3A4150E6F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:13:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyfEh-0005Kc-93; Mon, 03 Feb 2020 17:10:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=maG7=3X=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iyfEe-0005KX-SB
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:10:08 +0000
X-Inumbo-ID: 07044cf0-46a8-11ea-8e7b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07044cf0-46a8-11ea-8e7b-12813bfff9fa;
 Mon, 03 Feb 2020 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580749808;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LtYiq6bBO6/4FftThl6R8Q7DtYPMzXTMLhG3CQNNncc=;
 b=cA9xbn21U7fNFjvQBOI7xR7wkFi1Gb6tnNRMQ0N7pp7ng3eIsIovFuPM
 j8GtWnE/GG57l4j2514Df+bDScbWjnMQZKR0dlhJCS5rKb7pWaV1HRA4Q
 JxqQYOl54TJH7x44Xg+zyW5Cjfxtn1SsU5VUlVF3nCij8YnsJw23PK2UC Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uIpKPnBNfKXRcSV2aq1t3i0aDm1spxDUtYrUqKw75at3LUIFHdisxmUJrDu7igzidJrBtvPrLt
 Ku7HkaelteecTEqLuBU+FRKzqtLPPj5/vgpVef91rObh02xvUWosXwz04G/w1Z2+C9nVfDMFOF
 fvOT7rZzAH8NW+fNK8TvBUUpBGDutuhYeaIwkfp89ggAbxgxu4ZqkbLrzqZpvSZzr+o0Q3RHSJ
 UkgXnLLMw2K1+jIc1YQEOm62M/5O7kbkYTpawn/QBDiEcgO6txRYAog9JL6xO6Y2QIkzdJMthO
 UHo=
X-SBRS: 2.7
X-MesageID: 11872771
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="11872771"
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200203165812.21089-1-julien@xen.org>
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
Message-ID: <c39dd542-1748-066e-399f-dc110ac11e19@citrix.com>
Date: Mon, 3 Feb 2020 17:10:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200203165812.21089-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of
 the P2M
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8zLzIwIDQ6NTggUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiBGcm9tOiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgo+IAo+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aHkg
dGhlIHNsb3QgMCBvZiBlYWNoIHAybSBzaG91bGQgYmUgcG9wdWxhdGVkCj4gd2l0aCBlbXB0eSBw
YWdlLXRhYmxlcy4gVGhlIGNvbW1pdCBpbnRyb2R1Y2luZyBpdCA3NTlhZjhlMzgwMCAiW0hWTV0K
PiBGaXggNjQtYml0IEhWTSBkb21haW4gY3JlYXRpb24uIiBkb2VzIG5vdCBjb250YWluIG1lYW5p
bmdmdWwKPiBleHBsYW5hdGlvbiBleGNlcHQgdGhhdCBpdCB3YXMgbmVjZXNzYXJ5IGZvciBzaGFk
b3cuCgpUaW0sIGFueSBpZGVhcyBoZXJlPwoKPiBBcyB3ZSBkb24ndCBzZWVtIHRvIGhhdmUgYSBn
b29kIGV4cGxhbmF0aW9uIHdoeSB0aGlzIGlzIHRoZXJlLCBkcm9wIHRoZQo+IGNvZGUgY29tcGxl
dGVseS4KPiAKPiBUaGlzIHdhcyB0ZXN0ZWQgYnkgc3VjY2Vzc2Z1bGx5IGJvb3RpbmcgYSBIVk0g
d2l0aCBzaGFkb3cgZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPgo+IAo+IC0tLQo+IAo+IEkgZG9uJ3Qga25vdyBmb3Igc3VyZSBpZiB0
aGlzIGlzIGdvaW5nIHRvIGJyZWFrIGEgc2V0dXAuIEkgaGF2ZSB0cmllZAo+IEhWTSBndWVzdCB3
aXRoIGhhcD17MCwgMX0gd2l0aG91dCBhbnkgdHJvdWJsZS4gSSBhbSBoYXBweSB0byB0cnkgbW9y
ZQo+IHNldHVwIGlmIHlvdSBoYXZlIGFueSBpbiBtaW5kLgo+IAo+IElmIHRoaXMgYnJlYWsgYSBz
ZXR1cCwgdGhlbiBwbGVhc2UgZGVzY3JpYmUgdGhlIHNldHVwIGFuZCBJIHdpbGwgc2VuZCBhCj4g
ZG9jdW1lbnRhdGlvbiBwYXRjaCBpbnN0ZWFkLgoKVGhpcyBpcyBhIHNvbWV3aGF0IHJpc2t5IHN0
cmF0ZWd5LiAgT3RoZXIgdGhhbiBjb2RlIGNsZWFuLXVwLCBpcyB0aGVyZQphbnkgYWR2YW50YWdl
IHRvIHJlbW92aW5nIHRoaXMgY29kZSBhdCB0aGUgbW9tZW50PwoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
