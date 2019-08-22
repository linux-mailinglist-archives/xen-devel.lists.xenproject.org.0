Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5C98C8C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 09:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0hiN-0007OT-Ht; Thu, 22 Aug 2019 07:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng0H=WS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0hiM-0007OO-LQ
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 07:40:58 +0000
X-Inumbo-ID: 2dab65a2-c4b0-11e9-ac23-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dab65a2-c4b0-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 07:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566459658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7qRTvpYQkGnaDHDQXW+JfemmeOOjKOaQLeRD1V0Nal8=;
 b=UVLqTW14UmEerIOKKWppm9e4IDJE+30Jd+Wp8m7uSlmpfipGCGGSbQ5K
 4zQJ+uCBc6h5r39y4WIDDjG06wKP1riEcnVtx3JLTsOWljoC/wXN9gYxf
 WRfHzBSno09Mh43SywUrkk43RJF/W5/wwu020jq87BqY6k+7fXjJzmLv3 U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NYUjVTuhwI/IzPqV1vfFWZzTOdSn3F/UGfbCsNS4YNPBUG2egP+6o0d+K43sryY7NwLGsrqCtU
 V5GRDUI+svtbX4w4R2/bR2+pgT+A0/+tWrZEsobTJomGq1t6Lp7DdBGbzfe2v0mJpgGGTkygJz
 fvgMc8NDbzgEEstlw41Twemuuj48p73coiiMl5+5qT5txtbKF5zkX+4xwah2yg77Egh5ayiM28
 ErghhpY06ewM+edvBUU9O1I/q/+ZHEfeH0DXVmqUM+FoeUcDdDJ3ynXd1jnA7Z9CZ0WFjcjkVW
 2yI=
X-SBRS: 2.7
X-MesageID: 4583941
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,415,1559534400"; 
   d="scan'208";a="4583941"
Date: Thu, 22 Aug 2019 09:40:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822074050.vg2pmxl662d34nat@Air-de-Roger>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-4-roger.pau@citrix.com>
 <9428742b49454a0782a618dc246b9a56@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9428742b49454a0782a618dc246b9a56@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/7] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDY6Mjk6MDRQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1
OQo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+ID4gU3ViamVjdDogW1BBVENIIDMvN10gaW9yZXE6IGFsbG93IGRpc3BhdGNoaW5nIGlvcmVx
cyB0byBpbnRlcm5hbCBzZXJ2ZXJzCj4gPiAKPiA+IEludGVybmFsIGlvcmVxIHNlcnZlcnMgYXJl
IGFsd2F5cyBwcm9jZXNzZWQgZmlyc3QsIGFuZCBpb3JlcXMgYXJlCj4gPiBkaXNwYXRjaGVkIGJ5
IGNhbGxpbmcgdGhlIGhhbmRsZXIgZnVuY3Rpb24uIElmIG5vIGludGVybmFsIHNlcnZlcnMgaGF2
ZQo+ID4gcmVnaXN0ZXJlZCBmb3IgYW4gaW9yZXEgaXQncyB0aGVuIGZvcndhcmRlZCB0byBleHRl
cm5hbCBjYWxsZXJzLgo+IAo+IERpc3RpbmN0IGlkIHJhbmdlcyB3b3VsZCBoZWxwIGhlcmUuLi4g
SW50ZXJuYWwgaWRzIGNvdWxkIGJlIHdhbGtlZCBmaXJzdCwgdGhlbiBleHRlcm5hbC4gSWYgdGhl
cmUncyBubyBwb3NzaWJpbGl0eSBvZiBpbnRlcmxlYXZpbmcgdGhlbiB5b3UgZG9uJ3QgbmVlZCB0
aGUgcmV0cnkuCgpTbyBpZiBpbnRlcm5hbCB2cyBleHRlcm5hbCBpcyBrZXllZCBvbiB0aGUgSUQg
dGhlbiB3ZSB3b3VsZCBlbmQgdXAKd2l0aCB0d28gZGlmZmVyZW50IGFycmF5cyBpbiBodm1fZG9t
YWluLCBvbmUgZm9yIGludGVybmFsIGFuZCBvbmUgZm9yCmV4dGVybmFsIGlvcmVxIHNlcnZlcnMu
CgpNYXliZSBpbnN0ZWFkIG9mIG15IHByZXZpb3VzIHN1Z2dlc3Rpb24gaXQgd291bGQgYmUgYmV0
dGVyIHRvIGp1c3QKZGVmaW5lIGNvbnNlY3V0aXZlIHJhbmdlcyBmb3IgZXh0ZXJuYWwgYW5kIGlu
dGVybmFsIHNlcnZlcnMsIGxpa2U6CgojZGVmaW5lIE1BWF9OUl9FWFRFUk5BTF9JT1JFUV9TRVJW
RVJTIDgKI2RlZmluZSBNQVhfTlJfSU5URVJOQUxfSU9SRVFfU0VSVkVSUyAxCiNkZWZpbmUgTUFY
X05SX0lPUkVRX1NFUlZFUlMgXAogICAgKE1BWF9OUl9FWFRFUk5BTF9JT1JFUV9TRVJWRVJTICsg
TUFYX05SX0lOVEVSTkFMX0lPUkVRX1NFUlZFUlMpCgojZGVmaW5lIEZPUl9FQUNIX0lPUkVRX1NF
UlZFUihkLCBpZCwgcykgXAogICAgZm9yICggKGlkKSA9IE1BWF9OUl9JT1JFUV9TRVJWRVJTICog
MjsgKGlkKSAhPSAwOyApIFwKICAgICAgICBpZiAoICEocyA9IEdFVF9JT1JFUV9TRVJWRVIoZCwg
LS0oaWQpKSkgKSBcCiAgICAgICAgICAgIGNvbnRpbnVlOyBcCiAgICAgICAgZWxzZQoKI2RlZmlu
ZSBGT1JfRUFDSF9JTlRFUk5BTF9JT1JFUV9TRVJWRVIoZCwgaWQsIHMpIFwKICAgIGZvciAoIChp
ZCkgPSBNQVhfTlJfSU9SRVFfU0VSVkVSUzsgKGlkKSA+IE1BWF9OUl9JTlRFUk5BTF9JT1JFUV9T
RVJWRVJTICYmIChpZCkgIT0gMDsgKSBcCiAgICAgICAgaWYgKCAhKHMgPSBHRVRfSU9SRVFfU0VS
VkVSKGQsIC0tKGlkKSkpICkgXAogICAgICAgICAgICBjb250aW51ZTsgXAogICAgICAgIGVsc2UK
CiNkZWZpbmUgRk9SX0VBQ0hfRVhURVJOQUxfSU9SRVFfU0VSVkVSKGQsIGlkLCBzKSBcCiAgICBm
b3IgKCAoaWQpID0gTUFYX05SX0lOVEVSTkFMX0lPUkVRX1NFUlZFUlM7IChpZCkgIT0gMDsgKSBc
CiAgICAgICAgaWYgKCAhKHMgPSBHRVRfSU9SRVFfU0VSVkVSKGQsIC0tKGlkKSkpICkgXAogICAg
ICAgICAgICBjb250aW51ZTsgXAogICAgICAgIGVsc2UKClRoYXQgd291bGQgYWxzbyBmb3JjZSBG
T1JfRUFDSF9JT1JFUV9TRVJWRVIgdG8gYWx3YXlzIHByb2Nlc3MgaW50ZXJuYWwKaW9yZXEgc2Vy
dmVycyBmaXJzdC4KCldlIGNvdWxkIGV2ZW4gaGF2ZSBzb21ldGhpbmcgbGlrZToKCnVuaW9uIHsK
ICAgIHN0cnVjdCB7CiAgICAgICAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKmV4dGVybmFsX3Nl
cnZlcltNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSU107CiAgICAgICAgc3RydWN0IGh2bV9p
b3JlcV9zZXJ2ZXIgKmludGVybmFsX3NlcnZlcltNQVhfTlJfSU5URVJOQUxfSU9SRVFfU0VSVkVS
U107CiAgICB9CiAgICBzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqc2VydmVyW01BWF9OUl9JT1JF
UV9TRVJWRVJTXTsKfQoKSW4gb3JkZXIgdG8gc3BsaXQgdGhlIGFycmF5cyBpZiByZXF1aXJlZC4K
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
