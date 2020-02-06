Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E478C1543CA
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 13:10:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfxW-00049B-Ek; Thu, 06 Feb 2020 12:08:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7h88=32=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1izfxU-000495-Mu
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 12:08:36 +0000
X-Inumbo-ID: 66a35e70-48d9-11ea-af4d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66a35e70-48d9-11ea-af4d-12813bfff9fa;
 Thu, 06 Feb 2020 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580990915;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4igf4V5QJi2n8LrKvFtv/Vzj0P01hEpxXAelcc04Vkg=;
 b=LxBYnoFWSS5sdUhb54dprR2K8ICweY5I7WRaymjwZilcxkmBzDrKt+56
 HJegtBUg7I+qjTovXgAktD69xyJSIkHgGQfSpWHmy2myvkP1tOLN2e06J
 yYkaVoO82hru+vJZnfEVigNoDqtjV3gkaojBr2V7eJgeI2eR4fVhniilp 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DW8PgyMxGIPKPQyaL6EzBSHg8twaZsO0KBzQ+QUhR4iFsmLiovpMkKkWTMTM4SXjuyDh4mDQT2
 ns1dTOvFVgTsNiY4kH1xrXyO86YGshEPPWwGwBPcoYW9H6iF9vpnmdld7uxXxSBpoM1dwGYED8
 ld6/o5dfDnKozVsJXwAvXd4jfZpxHMe3Hb9PYbBsAN0lGwrmM3J/+9chBnDIc1s6kJMGOWFRa2
 CdLFEHbc2D2zJanyBWDb3p9N9g0hiPFDyYZmx3+zKbR6ZeHPmKvySJ1oJwjKtLRPuqq0CChT5F
 2qY=
X-SBRS: 2.7
X-MesageID: 12477534
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12477534"
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
Message-ID: <81beb0ad-abcd-6413-3b8e-490cd9ab12ee@citrix.com>
Date: Thu, 6 Feb 2020 12:08:32 +0000
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
 Jan Beulich <jbeulich@suse.com>,
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
b3cuCj4gCj4gQXMgd2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGEgZ29vZCBleHBsYW5hdGlvbiB3aHkg
dGhpcyBpcyB0aGVyZSwgZHJvcCB0aGUKPiBjb2RlIGNvbXBsZXRlbHkuCj4gCj4gVGhpcyB3YXMg
dGVzdGVkIGJ5IHN1Y2Nlc3NmdWxseSBib290aW5nIGEgSFZNIHdpdGggc2hhZG93IGVuYWJsZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClNp
bmNlIG5vYm9keSBrbm93cyB3aHkgaXQncyBoZXJlLCBhbmQgaXQgZG9lc24ndCBsb29rIGxpa2Ug
aXQgc2hvdWxkCmhhdmUgYW55IGVmZmVjdDoKCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
