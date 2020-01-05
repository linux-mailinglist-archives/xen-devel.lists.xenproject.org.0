Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B721307C8
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 12:40:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io4DE-0001zM-CV; Sun, 05 Jan 2020 11:36:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BhB7=22=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1io4DD-0001zH-5O
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 11:36:51 +0000
X-Inumbo-ID: a41454dc-2faf-11ea-88e7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a41454dc-2faf-11ea-88e7-bc764e2007e4;
 Sun, 05 Jan 2020 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578224202;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DoFVVmiFsq8maF6Dha6Qg8iC7kAgYUjFGH6bs9ARUpE=;
 b=WnWckLB5DRCp1U87wgURFNREK6KDy4R1P8Tvi9dfw4kbuP5+6HrfhPF9
 axBi7uVrW0mz3f4P1FXAn4kwW2iV8cH5zt939LS9HXXX00E7kG6kDn+7R
 IZshHg6HYzdh48pQMI8oCBxWA79MaEKztQKpPFq12C0e+ffGJOw2Kf/ZQ E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4vPAJN504p3Cw2F6c8xqqZmIZ0IOC3x0jUTZFbtAVsu4+3po2EjFygm589CSKEHsnMYb+zKBVF
 xP6+VE33dI8AKHXi/ITGIFMknrU4tZd+1buA8FWKDczy0JDRNUQ0Cp8rhuOsMo4rScdNtVbZt5
 UVUsnqwgFtciA9Uct2yrQjTwujHV+rXnHAyDuD+voH0Kp3MjE/52onQ2nELj7wPDm9dP8Nj5Zd
 lOT4kx2qOzy5uLQHYOiak0tHlKgdbn/dKTsEDB/qdpUhe+8NlwXSeSZPC4nBUsaxe50KOp8lMX
 xdg=
X-SBRS: 2.7
X-MesageID: 10619090
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,398,1571716800"; d="scan'208";a="10619090"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191126100801.124844-1-wipawel@amazon.de>
 <20191126100801.124844-8-wipawel@amazon.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <355ad943-8d05-d8fa-768f-2707630a7299@citrix.com>
Date: Sun, 5 Jan 2020 11:36:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126100801.124844-8-wipawel@amazon.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 07/12] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTEvMjAxOSAxMDowNywgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gQEAgLTEy
NzQsNiArMTI5Nyw5IEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9kb19hY3Rpb24odm9pZCkKPiAg
ICAgICAgICBlbHNlCj4gICAgICAgICAgICAgIHJjID0gYXBwbHlfcGF5bG9hZChkYXRhKTsKPiAg
Cj4gKyAgICAgICAgaWYgKCAhd2FzX2FjdGlvbl9jb25zaXN0ZW50KGRhdGEsIHJjID8gTElWRVBB
VENIX0ZVTkNfTk9UX0FQUExJRUQgOiBMSVZFUEFUQ0hfRlVOQ19BUFBMSUVEKSApCj4gKyAgICAg
ICAgICAgIHBhbmljKCJsaXZlcGF0Y2g6IHBhcnRpYWxseSBhcHBsaWVkIHBheWxvYWQgJyVzJyFc
biIsIGRhdGEtPm5hbWUpOwo+ICsKPiAgICAgICAgICBpZiAoIHJjID09IDAgKQo+ICAgICAgICAg
ICAgICBhcHBseV9wYXlsb2FkX3RhaWwoZGF0YSk7Cj4gICAgICAgICAgYnJlYWs7Cj4gQEAgLTEy
ODgsNiArMTMxNCw5IEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9kb19hY3Rpb24odm9pZCkKPiAg
ICAgICAgICBlbHNlCj4gICAgICAgICAgICAgIHJjID0gcmV2ZXJ0X3BheWxvYWQoZGF0YSk7Cj4g
IAo+ICsgICAgICAgIGlmICggIXdhc19hY3Rpb25fY29uc2lzdGVudChkYXRhLCByYyA/IExJVkVQ
QVRDSF9GVU5DX0FQUExJRUQgOiBMSVZFUEFUQ0hfRlVOQ19OT1RfQVBQTElFRCkgKQo+ICsgICAg
ICAgICAgICBwYW5pYygibGl2ZXBhdGNoOiBwYXJ0aWFsbHkgcmV2ZXJ0ZWQgcGF5bG9hZCAnJXMn
IVxuIiwgZGF0YS0+bmFtZSk7Cj4gKwo+ICAgICAgICAgIGlmICggcmMgPT0gMCApCj4gICAgICAg
ICAgICAgIHJldmVydF9wYXlsb2FkX3RhaWwoZGF0YSk7Cj4gICAgICAgICAgYnJlYWs7Cj4gQEAg
LTEzMDksNiArMTMzOCw5IEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9kb19hY3Rpb24odm9pZCkK
PiAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgb3RoZXItPnJjID0gcmV2ZXJ0
X3BheWxvYWQob3RoZXIpOwo+ICAKPiArICAgICAgICAgICAgaWYgKCAhd2FzX2FjdGlvbl9jb25z
aXN0ZW50KG90aGVyLCByYyA/IExJVkVQQVRDSF9GVU5DX0FQUExJRUQgOiBMSVZFUEFUQ0hfRlVO
Q19OT1RfQVBQTElFRCkgKQo+ICsgICAgICAgICAgICAgICAgcGFuaWMoImxpdmVwYXRjaDogcGFy
dGlhbGx5IHJldmVydGVkIHBheWxvYWQgJyVzJyFcbiIsIG90aGVyLT5uYW1lKTsKPiArCj4gICAg
ICAgICAgICAgIGlmICggb3RoZXItPnJjID09IDAgKQo+ICAgICAgICAgICAgICAgICAgcmV2ZXJ0
X3BheWxvYWRfdGFpbChvdGhlcik7CgpDb3Zlcml0eSBoaWdobGlnaHRzIHRoYXQgdGhpcyBjb250
YWlucyBkZWFkIGNvZGUuCgpUaGUgTElWRVBBVENIX0FDVElPTl9SRVBMQUNFIGNhc2UsIHVubGlr
ZSBhbGwgb3RoZXJzLCB1c2VzIG90aGVyLT5yYywKd2hpY2ggbWVhbnMgdGhlIHJjID8gOiBjaGVj
ayB3aWxsIGFsd2F5cyBwYXNzIExJVkVQQVRDSF9GVU5DX0FQUExJRUQKaW50byB3YXNfYWN0aW9u
X2NvbnNpc3RlbnQoKSwgZHVlIHRvIHRoZSByYyA9IDAgYXQgdGhlIGhlYWQgb2YgdGhlIGNhc2UK
YmxvY2suCgpJZiB0aGlzIHdlcmUgdGhlIG9ubHkgcHJvYmxlbSwgc3dpdGNoaW5nIHJjIHRvIG90
aGVyLT5yYyBtaWdodCBiZSBvaywKYnV0IHRoZXJlIGxvb2sgdG8gYmUgb3RoZXIgY29uZnVzaW9u
cyBpbiB0aGUgc3Vycm91bmRpbmcgY29kZS7CoCBXb3VsZAp5b3UgbWluZCBsb29raW5nIG92ZXIg
dGhlIHdob2xlIGJsb2NrIG9mIGNvZGUgZm9yIGNvcnJlY3QgZXJyb3IgaGFuZGxpbmc/CgpGb3Ig
YW55IHJlc3VsdGluZyBwYXRjaCwgdGhlIENvdmVyaXR5IElEIGlzIDE0NTc0NjcKCn5BbmRyZXcK
Cj4gICAgICAgICAgICAgIGVsc2UKPiBAQCAtMTMyOSw2ICsxMzYxLDkgQEAgc3RhdGljIHZvaWQg
bGl2ZXBhdGNoX2RvX2FjdGlvbih2b2lkKQo+ICAgICAgICAgICAgICBlbHNlCj4gICAgICAgICAg
ICAgICAgICByYyA9IGFwcGx5X3BheWxvYWQoZGF0YSk7Cj4gIAo+ICsgICAgICAgICAgICBpZiAo
ICF3YXNfYWN0aW9uX2NvbnNpc3RlbnQoZGF0YSwgcmMgPyBMSVZFUEFUQ0hfRlVOQ19OT1RfQVBQ
TElFRCA6IExJVkVQQVRDSF9GVU5DX0FQUExJRUQpICkKPiArICAgICAgICAgICAgICAgIHBhbmlj
KCJsaXZlcGF0Y2g6IHBhcnRpYWxseSBhcHBsaWVkIHBheWxvYWQgJyVzJyFcbiIsIGRhdGEtPm5h
bWUpOwo+ICsKPiAgICAgICAgICAgICAgaWYgKCByYyA9PSAwICkKPiAgICAgICAgICAgICAgICAg
IGFwcGx5X3BheWxvYWRfdGFpbChkYXRhKTsKPiAgICAgICAgICB9Cj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
