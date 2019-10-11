Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D313D3CBD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 11:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIrWn-0004f8-Qu; Fri, 11 Oct 2019 09:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8hDA=YE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iIrWm-0004f3-KM
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 09:48:04 +0000
X-Inumbo-ID: 37c29e2e-ec0c-11e9-bbab-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37c29e2e-ec0c-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 09:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570787283;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6yWRevTjleJEVXJpjfS3qTBwigkuCjJLeuNgphBVcRY=;
 b=cD6HKzKPmfCuS4cklQST9x2xmV/5hrZ4BRCWgnf1WOcXzzEQyOL8L8dg
 UiUBEIfPfROfcwlPokPdzMvf4gNFNP4wD5AEIQbD0kFYc+mF6zDSVNT7k
 C+ZSnDvhm74wV8ko+qgsBArtCj24FPmQG6VMumZfWMOVs+vr/NVmiIfgo o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wQRPOs2brIagUlnm7JpNrpUNsKmcmnBSyOOyWgtBciAxx0//A73MdtnleCnqXqiEVE9WS8Wwcu
 aHlSeDLZoDeSOl4NG56iiqGExa+yajI3M2K/n4Kepqtp5XBFVkPN7sACddHVOj/cissK0Jk94E
 brJ/S3ZxrkvriyC/8FXMNk6pPHj0q6fvnxfidhKd3OSliUocJ4kFM2/EchGxYPfE4bflRpOdgI
 aylnquXVff+HSm3k8OeJZTrnyCzK6VWQNZL1fO0vTa9eKZkdSo2L0laiUFRqLmHSkqDb+GMoP9
 Wac=
X-SBRS: 2.7
X-MesageID: 7150914
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,283,1566878400"; 
   d="scan'208";a="7150914"
To: Ian Jackson <ian.jackson@eu.citrix.com>, <xen-devel@lists.xenproject.org>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <17defd97-e6b8-761e-0bd8-0aa0a2de7bed@citrix.com>
Date: Fri, 11 Oct 2019 10:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010151111.22125-10-ian.jackson@eu.citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Paul
 Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTAvMjAxOSAxNjoxMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBp
bmRleCA2OTk3MWM5N2I2Li5mY2NiNmE2MjcxIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAtOTY4
LDYgKzk1Nyw1MCBAQCBpbnQgbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4bF9f
Z2MgKmdjLAo+ICAgICAgICAgIGdvdG8gZXJyb3Jfb3V0Owo+ICAgICAgfQo+ICAKPiArICAgIGJv
b2wgbmVlZF9wdCA9IGRfY29uZmlnLT5udW1fcGNpZGV2cyB8fCBkX2NvbmZpZy0+bnVtX2R0ZGV2
czsKPiArICAgIGlmIChjX2luZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1VO
S05PV04pIHsKPiArICAgICAgICBjX2luZm8tPnBhc3N0aHJvdWdoID0gbmVlZF9wdAo+ICsgICAg
ICAgICAgICA/IExJQlhMX1BBU1NUSFJPVUdIX0VOQUJMRUQgOiBMSUJYTF9QQVNTVEhST1VHSF9E
SVNBQkxFRDsKPiArICAgIH0KPiArCj4gKyAgICBib29sIGlvbW11X2VuYWJsZWQgPSBwaHlzaW5m
by5jYXBfaHZtX2RpcmVjdGlvOwo+ICsgICAgaWYgKGNfaW5mby0+cGFzc3Rocm91Z2ggIT0gTElC
WExfUEFTU1RIUk9VR0hfRElTQUJMRUQgJiYgIWlvbW11X2VuYWJsZWQpIHsKPiArICAgICAgICBM
T0dEKEVSUk9SLCBkb21pZCwKPiArICAgICAgICAgICAgICJFUlJPUjogcGFzc3Rocm91Z2ggbm90
IHN1cHBvcnRlZCBvbiB0aGlzIHBsYXRmb3JtXG4iKTsKPiArICAgICAgICByZXQgPSBFUlJPUl9J
TlZBTDsKPiArICAgICAgICBnb3RvIGVycm9yX291dDsKPiArICAgIH0KPiArCj4gKyAgICBpZiAo
Y19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJYTF9QQVNTVEhST1VHSF9ESVNBQkxFRCAmJiBuZWVk
X3B0KSB7Cj4gKyAgICAgICAgTE9HRChFUlJPUiwgZG9taWQsCj4gKyAgICAgICAgICAgICAicGFz
c3Rocm91Z2ggZGlzYWJsZWQgYnV0IGRldmljZXMgYXJlIHNwZWNpZmllZCIpOwoKVGhpcyBpcyB0
aGUgb25seSBsb2cgbWVzc2FnZSB3aGljaCBpc24ndCBwcmVmaXhlZCB3aXRoIEVSUk9SOgoKPiAr
ICAgICAgICByZXQgPSBFUlJPUl9JTlZBTDsKPiArICAgICAgICBnb3RvIGVycm9yX291dDsKPiAr
ICAgIH0KPiArCj4gKyAgICBjb25zdCBjaGFyICp3aHlub3RfcHRfc2hhcmUgPQo+ICsgICAgICAg
IGNfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QViA/ICJub3QgdmFsaWQgZm9yIFBW
IGRvbWFpbiIgOgo+ICsgICAgICAgICFwaHlzaW5mby5jYXBfaW9tbXVfaGFwX3B0X3NoYXJlID8g
Im5vdCBzdXBwb3J0ZWQgb24gdGhpcyBwbGF0Zm9ybSIgOgo+ICsgICAgICAgIE5VTEw7CgpUaGlz
IGlzIGEgbGl0dGxlIG1vcmUgY29tcGxpY2F0ZWQuCgpGb3IgQVJNLCBkb2Vzbid0IGxpYnhsIHRy
ZWF0IGd1ZXN0cyBhcyBQViwgb3IgaGFzIHRoYXQgYmVlbiBmaXhlZCBub3c/wqAKQVJNJ3Mgb25s
eSBwYXNzdGhyb3VnaCBtb2RlIGlzIFBUX1NIQVJFLgoKT24geDg2IGZvciBQVkgsIHBhc3N0aHJv
dWdoIGRvZXNuJ3Qgd29yayB5ZXQuwqAgVGhpcyBtYXkgbm90IGJlIGFuCmFyZ3VtZW50IGFnYWlu
c3QgY29uc3RydWN0aW5nIHRoZSBndWVzdCBzdWl0YWJseSwgYnV0IHdlIHNob3VsZCBjaGVjawp0
aGF0IHRoaW5ncyBkb24ndCBleHBsb2RlIGluIG5ldyBhbmQgaW50ZXJlc3Rpbmcgd2F5cyBmcm9t
IHRoaXMgY2hhbmdlLgoKRm9yIHg4NiBIVk0sIFBUX1NIQVJFIGlzIG9ubHkgYXZhaWxhYmxlIGZv
ciBIQVAgZ3Vlc3RzLCBzbyBzaGFkb3cgZ3Vlc3RzCm11c3QgdXNlIFBUX1NZTkMuCgoKPiArCj4g
KyAgICBpZiAoY19pbmZvLT5wYXNzdGhyb3VnaCA9PSBMSUJYTF9QQVNTVEhST1VHSF9FTkFCTEVE
KSB7Cj4gKyAgICAgICAgYXNzZXJ0KGlvbW11X2VuYWJsZWQpOwo+ICsgICAgICAgIGNfaW5mby0+
cGFzc3Rocm91Z2ggPSB3aHlub3RfcHRfc2hhcmUKPiArICAgICAgICAgICAgPyBMSUJYTF9QQVNT
VEhST1VHSF9TWU5DX1BUIDogTElCWExfUEFTU1RIUk9VR0hfU0hBUkVfUFQ7Cj4gKyAgICB9Cj4g
Kwo+ICsgICAgaWYgKGNfaW5mby0+cGFzc3Rocm91Z2ggPT0gTElCWExfUEFTU1RIUk9VR0hfU0hB
UkVfUFQgJiYgd2h5bm90X3B0X3NoYXJlKSB7Cj4gKyAgICAgICAgTE9HRChFUlJPUiwgZG9taWQs
Cj4gKyAgICAgICAgICAgICAiRVJST1I6IHBhc3N0aHJvdWdoPVwic2hhcmVfcHRcIiAlc1xuIiwK
PiArICAgICAgICAgICAgIHdoeW5vdF9wdF9zaGFyZSk7Cj4gKyAgICAgICAgcmV0ID0gRVJST1Jf
SU5WQUw7Cj4gKyAgICAgICAgZ290byBlcnJvcl9vdXQ7Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyog
QW4gZXhwbGljaXQgc2V0dGluZyBzaG91bGQgbm93IGhhdmUgYmVlbiBjaG9zZW4gKi8KPiArICAg
IGFzc2VydChjX2luZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV04p
Owo+ICsgICAgYXNzZXJ0KGNfaW5mby0+cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hf
RU5BQkxFRCk7CgpUaGlzIGlzIGNvbmZ1c2luZy7CoCBJIHRoaW5rIGl0IHdvdWxkIGhlbHAgaWYg
Li4uCgo+ICsKPiAgICAgIC8qIElmIHRhcmdldF9tZW1rYiBpcyBzbWFsbGVyIHRoYW4gbWF4X21l
bWtiLCB0aGUgc3Vic2VxdWVudCBjYWxsCj4gICAgICAgKiB0byBsaWJ4YyB3aGVuIGJ1aWxkaW5n
IEhWTSBkb21haW4gd2lsbCBlbmFibGUgUG9EIG1vZGUuCj4gICAgICAgKi8KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMu
aWRsCj4gaW5kZXggM2FjOTQ5NGI4MC4uMjQ0MWMwYzIzMyAxMDA2NDQKPiAtLS0gYS90b29scy9s
aWJ4bC9saWJ4bF90eXBlcy5pZGwKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwK
PiBAQCAtMjY2LDggKzI2Niw5IEBAIGxpYnhsX3ZrYl9iYWNrZW5kID0gRW51bWVyYXRpb24oInZr
Yl9iYWNrZW5kIiwgWwo+ICBsaWJ4bF9wYXNzdGhyb3VnaCA9IEVudW1lcmF0aW9uKCJwYXNzdGhy
b3VnaCIsIFsKPiAgICAgICgwLCAidW5rbm93biIpLAo+ICAgICAgKDEsICJkaXNhYmxlZCIpLAo+
IC0gICAgKDIsICJzeW5jX3B0IiksCj4gLSAgICAoMywgInNoYXJlX3B0IiksCj4gKyAgICAoMiwg
ImVuYWJsZWQiKSwKPiArICAgICgzLCAic3luY19wdCIpLAo+ICsgICAgKDQsICJzaGFyZV9wdCIp
LAoKLi4uIHRoaXMgaGFkIGEgY29tbWVudCBleHBsYWluaW5nIGVuYWJsZWQgaXMganVzdCBpbnRl
cmltIHZhbHVlLgoKKDIsICJlbmFibGVkIiksICMgYmVjb21lcyB7c3luYyxzaGFyZX1fcHQgb25j
ZSBkZWZhdWx0cyBhcmUgZXZhbHVhdGVkCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
