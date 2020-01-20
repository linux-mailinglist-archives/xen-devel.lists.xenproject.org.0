Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A58142F51
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:10:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZae-0004Yc-L2; Mon, 20 Jan 2020 16:07:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itZad-0004YX-3P
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:07:47 +0000
X-Inumbo-ID: fcb53b6a-3b9e-11ea-b999-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcb53b6a-3b9e-11ea-b999-12813bfff9fa;
 Mon, 20 Jan 2020 16:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579536462;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=s1sFuZddGPVNYUkJXo1/TaWwRYxWwU8dvl0Xb5uif0E=;
 b=gG/6sKhqxZ292hDi/76oBa/db0O8sGXbkDY0ksWtdpLj0OtpVquVRCln
 BQ3bVk33AP6ZsBU0zZZUx5M5WetUa2oWou+Z8ptcCNYzJyZdjJRrhwQmw
 uIkMBNUIIhdvd118l8ZtlPNccPvtnKlumTfm7yKaQURplDPX2kteP8xDF Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hSLOptH/r7EOwB9t0M60UwLMOWcLVcXW/BvHg1iauLD511FGPM8ACsWP+0XA8oloyRAEHD2UrX
 2w/OfdFEhwQhgpwqsXmm+IK+jH8vuanc4aArl9SLXyphpuQ1rTncDXD2E6Q2hkHZUUpQCdQD1K
 ozn5y9mMIIgd4QLIqKQcbS37/yMFEMkJQ2pPsQ/1xVJU7h5KvqJpKWULVIFenvWCcwIec74CXk
 +dtg2IOdmVSvaKHleFglsHqh0v+DHJNgQLHwqWauvOz44OJEYvF9L04ddo0jBbbE2QfT6Yd0Ck
 uUc=
X-SBRS: 2.7
X-MesageID: 11760483
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11760483"
Date: Mon, 20 Jan 2020 16:07:32 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120160732.GC11756@Air-de-Roger>
References: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDQ6NDI6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hlbiBwYXNzZWQgYSBub24tTlVMTCBwZGV2LCB0aGUgZnVuY3Rpb24gZG9lcyBhbiBv
d25lciBjaGVjayB3aGVuIGl0Cj4gZmluZHMgYW4gYWxyZWFkeSBleGlzdGluZyBjb250ZXh0IG1h
cHBpbmcuIEJyaWRnZXMsIGhvd2V2ZXIsIGRvbid0IGdldAo+IHBhc3NlZCB0aHJvdWdoIHRvIGd1
ZXN0cywgYW5kIGhlbmNlIHRoZWlyIG93bmVyIGlzIGFsd2F5cyBnb2luZyB0byBiZQo+IERvbTAs
IGxlYWRpbmcgdG8gdGhlIGFzc2lnbWVudCBvZiBhbGwgYnV0IG9uZSBvZiB0aGUgZnVuY3Rpb24g
b2YgbXVsdGktCj4gZnVuY3Rpb24gUENJIGRldmljZXMgYmVoaW5kIGJyaWRnZXMgdG8gZmFpbC4K
PiAKPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0Bp
bnZpc2libGV0aGluZ3NsYWIuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2MjogQWRkIGNvbW1lbnRzLgo+IC0tLQo+IE5vdGU6IFRo
aXMgd2FzIHJlcG9ydGVkIGFzIGFuIGFwcGFyZW50IHJlZ3Jlc3Npb24gZnJvbSBYU0EtMzAyIC8g
LTMwNi4KPiAgICAgICBTbyBmYXIgSSBoYXZlbid0IGJlZW4gYWJsZSB0byBmaWd1cmUgb3V0IGhv
dyB0aGUgY29kZSB3b3VsZCBoYXZlCj4gICAgICAgd29ya2VkIGJlZm9yZSwgaS5lLiB0byBtZSBp
dCBsb29rcyBsaWtlIGEgcHJlLWV4aXN0aW5nIHByb2JsZW0uCj4gICAgICAgVGhpcyBsZWF2ZXMg
dGhlIHJpc2sgb2YgdGhlIGNoYW5nZSBoZXJlIHBhcGVyaW5nIG92ZXIgYW5vdGhlcgo+ICAgICAg
IGlzc3VlLgo+IAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMTQ5MywxOCAr
MTQ5MywyOCBAQCBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X21hcHBpbmcoc3RydWN0Cj4gICAg
ICAgICAgaWYgKCBmaW5kX3Vwc3RyZWFtX2JyaWRnZShzZWcsICZidXMsICZkZXZmbiwgJnNlY2J1
cykgPCAxICkKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gIAo+ICsgICAgICAgIC8qCj4gKyAgICAg
ICAgICogTWFwcGluZyBhIGJyaWRnZSBzaG91bGQsIGlmIGFueXRoaW5nLCBwYXNzIHRoZSBzdHJ1
Y3QgcGNpX2RldiBvZgo+ICsgICAgICAgICAqIHRoYXQgYnJpZGdlLiBTaW5jZSBicmlkZ2VzIGRv
bid0IG5vcm1hbGx5IGdldCBhc3NpZ25lZCB0byBndWVzdHMsCj4gKyAgICAgICAgICogdGhlaXIg
b3duZXIgd291bGQgYmUgdGhlIHdyb25nIG9uZS4gUGFzcyBOVUxMIGluc3RlYWQuCj4gKyAgICAg
ICAgICovCj4gICAgICAgICAgcmV0ID0gZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoZG9tYWlu
LCBkcmhkLT5pb21tdSwgYnVzLCBkZXZmbiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBidXMsIGRldmZuKSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7Cj4gIAo+ICAgICAgICAgIC8q
Cj4gICAgICAgICAgICogRGV2aWNlcyBiZWhpbmQgUENJZS10by1QQ0kvUENJeCBicmlkZ2UgbWF5
IGdlbmVyYXRlIGRpZmZlcmVudAo+ICAgICAgICAgICAqIHJlcXVlc3Rlci1pZC4gSXQgbWF5IG9y
aWdpbmF0ZSBmcm9tIGRldmZuPTAgb24gdGhlIHNlY29uZGFyeSBidXMKPiAgICAgICAgICAgKiBi
ZWhpbmQgdGhlIGJyaWRnZS4gTWFwIHRoYXQgaWQgYXMgd2VsbCBpZiB3ZSBkaWRuJ3QgYWxyZWFk
eS4KPiArICAgICAgICAgKgo+ICsgICAgICAgICAqIFNvbWV3aGF0IHNpbWlsYXIgYXMgZm9yIGJy
aWRnZXMsIHdlIGRvbid0IHdhbnQgdG8gcGFzcyBhIHN0cnVjdAo+ICsgICAgICAgICAqIHBjaV9k
ZXYgaGVyZSAtIHRoZXJlIG1heSBub3QgZXZlbiBleGlzdCBvbmUgZm9yIHRoaXMgKHNlY2J1cyww
LDApCj4gKyAgICAgICAgICogdHVwbGUuIElmIHRoZXJlIGlzIG9uZSwgd2l0aG91dCBwcm9wZXJs
eSB3b3JraW5nIGRldmljZSBncm91cHMgaXQKPiArICAgICAgICAgKiBtYXkgYWdhaW4gbm90IGhh
dmUgdGhlIGNvcnJlY3Qgb3duZXIuCj4gICAgICAgICAgICovCj4gICAgICAgICAgaWYgKCAhcmV0
ICYmIHBkZXZfdHlwZShzZWcsIGJ1cywgZGV2Zm4pID09IERFVl9UWVBFX1BDSWUyUENJX0JSSURH
RSAmJgo+ICAgICAgICAgICAgICAgKHNlY2J1cyAhPSBwZGV2LT5idXMgfHwgcGRldi0+ZGV2Zm4g
IT0gMCkgKQo+ICAgICAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9tYXBwaW5nX29uZShk
b21haW4sIGRyaGQtPmlvbW11LCBzZWNidXMsIDAsCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBjaV9nZXRfcGRldihzZWcsIHNlY2J1cywgMCkpOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsKCklzbid0
IGl0IGRhbmdlcm91cyB0byBtYXAgdGhpcyBkZXZpY2UgdG8gdGhlIGd1ZXN0LCBhbmQgdGhhdCBt
dWx0aXBsZQpndWVzdHMgbWlnaHQgZW5kIHVwIHdpdGggdGhlIHNhbWUgZGV2aWNlIG1hcHBlZD8K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
