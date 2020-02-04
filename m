Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E457151BEB
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 15:14:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyywK-00021I-HC; Tue, 04 Feb 2020 14:12:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iyywJ-00021B-Ul
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 14:12:32 +0000
X-Inumbo-ID: 617a1718-4758-11ea-8f57-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 617a1718-4758-11ea-8f57-12813bfff9fa;
 Tue, 04 Feb 2020 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580825551;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EfLXsThei/0Tj7iJiYN/C13jlFglQvd1xhVLLaRi9bg=;
 b=h4OLkyKxh0pmuioB6gBwoJhvRq/S2B0wUjaAmp+Bf77hIru+QlvSDkyq
 p9Ryh3V2Oixia6kURH/lXFuyc2wADkvS6eSOdwqMltKADUiMYpO4/7FKK
 K9dGxvyDINFG10wvIrrU13M6RBvrHe4tFdOcDA9przA+lf6TspUTKrROO E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mU04Myi5G16wtg/G2sgVElPe/hxoo6RT6nd7kF3x++SU08G+IXW+pWSzUHXa78BY7hpA0bjijm
 W7XeoQ6V6faQqxlWkvL/MtfR2bMaoAqTh5HLwX7EzO+wSmKkHjsTQzxAHjmSIRt1s0xGUf15F/
 Vx6PN2SbeX5YmKcMt9lN1TqGlcq0a6itUTTDGceAELVAzcYrpPHXi0RCSZhVnm57bQkPweeZ5N
 IG/ZaAMRjW8/abq0pSmSqHtxjZ23Nm5VRZYqhrxNe2i6nsyBzRKPSYCdyYfNK54uzhcZPrM8WQ
 Kd0=
X-SBRS: 2.7
X-MesageID: 12088777
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12088777"
To: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <3936e4e4-f424-20b9-07d2-3a16433f65ae@citrix.com>
 <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <4c655f6c-3ffd-db48-0d7f-e5e44765a259@citrix.com>
Date: Tue, 4 Feb 2020 14:12:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDIvMjAyMCAxNDowNywgRGlldG1hciBIYWhuIHdyb3RlOgo+IEFtIEZyZWl0YWcsIDMx
LiBKYW51YXIgMjAyMCwgMjI6NTk6MTkgQ0VUIHNjaHJpZWIgSWdvciBEcnV6aGluaW46Cj4+IE9u
IDMwLzAxLzIwMjAgMTM6MDMsIERpZXRtYXIgSGFobiB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IHdl
IHVzZSBTTEVTMTIgd2l0aCBrZXJuZWwtZGVmYXVsdC00LjEyLjE0LTk1LjQ1LjEueDg2XzY0IGFu
ZCAKPj4+IHhlbi00LjExLjNfMDItMi4yMC4xLng4Nl82NAo+Pj4KPj4+IFRoZSBkdW1wIGtlcm5l
bCBkb2Vzbid0IHN0YXJ0IGFmdGVyICJlY2hvIGMgPiAvcHJvYy9zeXNycV90cmlnZ2VyIi4KPj4+
IExhc3QgbWVzc2FnZXMgb24gY29uc29sZSBhcmU6Cj4+PiBbICAzODUuNzE3NTMyXSBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uCj4+PiBbICAzODUuNzM0NTY1XSBL
ZXJuZWwgT2Zmc2V0OiBkaXNhYmxlZAo+Pj4gKFhFTikgSGFyZHdhcmUgRG9tMCBjcmFzaGVkOiBF
eGVjdXRpbmcga2V4ZWMgaW1hZ2Ugb24gY3B1NTgKPj4+IChYRU4pIFNob3QgZG93biBhbGwgQ1BV
cwo+Pj4KPj4+IEFmdGVyIGEgc2hvcnQgdGltZSBhIHJlYm9vdCBpcyBpbml0aWF0ZWQuCj4+PiBX
aXRob3V0IHhlbiB0aGUga2R1bXAgd29ya3MuCj4+Pgo+Pj4gV2Ugc2VlIHRoaXMgYmVoYXZpb3Vy
IG9ubHkgb24gbmV3ZXIgaGFyZHdhcmUsIGZvciBleGFtcGxlIGEgc2VydmVyIHdpdGgKPj4+IElu
dGVsKFIpIFhlb24oUikgR29sZCA2MjQyIENQVSBAIDIuODBHSHoKPj4+Cj4+PiBJIGJ1aWx0IHRo
ZSBmcmVzaCByZWxlYXNlZCB4ZW4tNC4xMyBteXNlbGYgYW5kIHRyaWVkIGl0IGJ1dCB0aGlzIGRv
ZXNuJ3QgaGVscC4KPj4+Cj4+PiBJIHRyaWVkIHgyYXBpYz1vZmYgb24gdGhlIHhlbiBzaWRlIGFu
ZCBub3gyYXBpYyBvbiB0aGUgbGludXggc2lkZSBidXQgbm8gc3VjY2Vzcy4KPj4KPj4gU3RhcnRp
bmcgZnJvbSBYZW4gNC4xMiB3ZSBrZWVwIElPTU1VIGVuYWJsZWQgZHVyaW5nIGtleGVjIHRyYW5z
aXRpb24KPj4gd2hpY2ggcmVzb2x2ZWQgdGhlIHByb2JsZW0geW91J3JlIGRlc2NyaWJpbmcuIEJ1
dCB5b3UgYWxzbyBuZWVkIHRvIG1ha2UKPj4gc3VyZSBJT01NVSBpcyBlbmFibGVkIGluIHlvdXIg
a2V4ZWMga2VybmVsICh3aGljaCBJIHRoaW5rIGlzIG5vdyB0aGUKPj4gZGVmYXVsdCBmb3IgbW9z
dCBkaXN0cm9zKS4gWW91IGNhbiBzdGlsbCB0cnkgdG8gd29ya2Fyb3VuZCB0aGUgaXNzdWUKPj4g
eW91J3JlIHNlZWluZyBvbiA0LjExIGJ5IHVzaW5nICJpb21tdT1kb20wLXBhc3N0aG91Z2giIFhl
biBvcHRpb24uCj4gCj4gSSBhZGRlZCAiaW9tbXU9ZG9tMC1wYXNzdGhyb3VnaCIgdG8gdGhlIHhl
bi00LjExIGNvbW1hbmQgbGluZSBidXQgbm8gc3VjY2Vzcy4KPiBGdXJ0aGVyIEkgYWRkZWQgZWFy
bHlwcmludGs9Li4uIHRvIHRoZSB0aGUga2R1bXAga2VybmVsIGFuZCBJIGNvdWxkIHNlZSB0aGUK
PiBkdW1wIGtlcm5lbCBzdGFydGVkIGFuZCBvbmx5IG9uZSBtZXNzYWdlIGZyb20gZXh0cmFjdF9r
ZXJuZWwoKQo+IHdhcyBwcmludGVkLiBUaGVuIHRoZSByZWJvb3QgZm9sbG93ZWQuCj4gCj4gQmVj
YXVzZSBJJ20gbm90IHRoYXQgZmFtaWxpYXIgd2l0aCB0aGlzIHBhcnQgb2YgSSB3b3VsZCBhcHBy
ZWNpYXRlIGhpbnRzIHdoZXJlCj4gdG8gZGlnIGRlZXBlci4KCkNvdWxkIHlvdSB0cnkgdG8gZGlz
YWJsZSBJT01NVSBjb21wbGV0ZWx5IGluIGRpYWdub3N0aWMgcHVycG9zZXM6CiJpb21tdT1vZmYg
eDJhcGljPW9mZiI/IElmIHRoYXQgaGVscHMgLSBpdCdzIHN0aWxsIHRoZSBzYW1lIGlzc3VlIEkn
bQpyZWZlcnJpbmcgdG8uIENvdWxkIHlvdSBwb3N0IHlvdXIgY3VycmVudCBYZW4gY21kbGluZT8K
Cklnb3IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
