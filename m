Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE31831A9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 14:35:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCNx2-0001M9-Jc; Thu, 12 Mar 2020 13:32:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCNx0-0001M4-Lf
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 13:32:38 +0000
X-Inumbo-ID: effcee14-6465-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id effcee14-6465-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584019957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/mKfT8PHcxdJ519J0CXmk129hfL/wvfZ1mtrYbPVYhQ=;
 b=OCi4Htb0cqC0VLy8RcZyyernQZ3alhQvXzbM7wKisGJgb8UEkwUMrwHk
 Pz2WSm1uEw5KZCRQ//aWFdNlMiemUFJWyxRgMLsm/gwK6lilxIUCjIqLb
 4PP1iu0koGgkfPECUv4yKya4Q3jYOlOzbHmFbQT0nGdIjTd/DNugULMNj k=;
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
IronPort-SDR: DSnxiwTBLc/yPiYb4UtWh3Fx6Cx1nugvzD6SAfD6HUz1njXRg2XDtph+t0zdmPT75nY6sQ9aJr
 xlBvNsxZHAWMFiM3HL7mkl7V288gbwq3YbOrQ9M4+rM/8XxRagI0q1Q+2eMHU0QudWGrJSVyd6
 6aX/KBzWfpQK/e2Sy9frqDXhEYj1uN3pUT/sjHSkE/pVx/cJraXGaFeZKzhc0/BpST7y6agRme
 QQpJQkkACtuRQBV9vbr3FyZDryzGy2MxCKCPGw5hXfHS8dUlOJGOnL7YCz/zTORokNJ7j1FPrH
 0qk=
X-SBRS: 2.7
X-MesageID: 14470898
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14470898"
Date: Thu, 12 Mar 2020 14:32:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200312133227.GI24458@Air-de-Roger.citrite.net>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
 <2ad6f0e6-60ed-572f-18f5-1c701d3c9495@suse.com>
 <00989506-75dc-62dc-6de9-0920c6e8f114@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00989506-75dc-62dc-6de9-0920c6e8f114@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMTI6MjE6MjlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8wMy8yMDIwIDA5OjIxLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDEx
LjAzLjIwMjAgMTk6MzQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4gYy9zIGM0Nzk4NGFhYmVh
ZCAibnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9yIE1TUiBiaXRtYXBzIiBpbnRyb2R1Y2VkIGEg
dXNlIG9mCj4gPj4gbWFwX2RvbWFpbl9wYWdlKCkgd2hpY2ggbWF5IGdldCB1c2VkIGluIHRoZSBt
aWRkbGUgb2YgY29udGV4dCBzd2l0Y2guCj4gPj4KPiA+PiBUaGlzIGlzIG5vdCBzYWZlLCBhbmQg
Y2F1c2VzIFhlbiB0byBkZWFkbG9jayBvbiB0aGUgbWFwY2FjaGUgbG9jazoKPiA+Pgo+ID4+ICAg
KFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4gPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmQ2YWU+
XSBSIF9zcGluX2xvY2srMHgzNC8weDVlCj4gPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjE5
ZDc+XSBGIG1hcF9kb21haW5fcGFnZSsweDI1MC8weDUyNwo+ID4+ICAgKFhFTikgICAgWzxmZmZm
ODJkMDgwMzU2MzMyPl0gRiBkb19wYWdlX2ZhdWx0KzB4NDIwLzB4NzgwCj4gPj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODAzOGRhM2Q+XSBGIHg4Nl82NC9lbnRyeS5TI2hhbmRsZV9leGNlcHRpb25f
c2F2ZWQrMHg2OC8weDk0Cj4gPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMTcyOWY+XSBGIF9f
ZmluZF9uZXh0X3plcm9fYml0KzB4MjgvMHg2OQo+ID4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgw
MzIxYTRkPl0gRiBtYXBfZG9tYWluX3BhZ2UrMHgyYzYvMHg1MjcKPiA+PiAgIChYRU4pICAgIFs8
ZmZmZjgyZDA4MDI5ZWViMj5dIEYgbnZteF91cGRhdGVfZXhlY19jb250cm9sKzB4MWQ3LzB4MzIz
Cj4gPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyOTlmNWE+XSBGIHZteF91cGRhdGVfY3B1X2V4
ZWNfY29udHJvbCsweDIzLzB4NDAKPiA+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI5YTNmNz5d
IEYgYXJjaC94ODYvaHZtL3ZteC92bXguYyN2bXhfY3R4dF9zd2l0Y2hfZnJvbSsweGI3LzB4MTIx
Cj4gPj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMWQ3OTY+XSBGIGFyY2gveDg2L2RvbWFpbi5j
I19fY29udGV4dF9zd2l0Y2grMHgxMjQvMHg0YTkKPiA+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4
MDMyMDkyNT5dIEYgY29udGV4dF9zd2l0Y2grMHgxNTQvMHg2MmMKPiA+PiAgIChYRU4pICAgIFs8
ZmZmZjgyZDA4MDI1MmYzZT5dIEYgY29tbW9uL3NjaGVkL2NvcmUuYyNzY2hlZF9jb250ZXh0X3N3
aXRjaCsweDE2YS8weDE3NQo+ID4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjUzODc3Pl0gRiBj
b21tb24vc2NoZWQvY29yZS5jI3NjaGVkdWxlKzB4MmFkLzB4MmJjCj4gPj4gICAoWEVOKSAgICBb
PGZmZmY4MmQwODAyMmNjOTc+XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4Yjcv
MHhjOAo+ID4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjJjZDM4Pl0gRiBkb19zb2Z0aXJxKzB4
MTgvMHgxYQo+ID4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMmEyZmJiPl0gRiB2bXhfYXNtX2Rv
X3ZtZW50cnkrMHgyYi8weDMwCj4gPj4KPiA+PiBDb252ZXJ0IHRoZSBkb21oZWFwIHBhZ2UgaW50
byBiZWluZyBhIHhlbmhlYXAgcGFnZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4KPiA+PiBJIHN1c3BlY3QgdGhpcyBpcyB0aGUg
bm90LXF1aXRlLWNvbnNpc3RlbnQtZW5vdWdoLXRvLWJpc2VjdCBpc3N1ZSB3aGljaAo+ID4+IE9T
U1Rlc3QgaXMgaGl0dGluZyBhbmQgaW50ZXJmZXJpbmcgd2l0aCBwdXNoZXMgdG8gbWFzdGVyLgo+
ID4gSGF2aW5nIGxvb2tlZCBhdCBhIG51bWJlciBvZiAoYWxiZWl0IG5vdCBhbGwpIGZhaWx1cmVz
LCBJIGRvbid0Cj4gPiB0aGluayBJJ3ZlIHNlZW4gYW55IHNpZ24gb2YgYSBjcmFzaCBsaWtlIHRo
ZSBvbmUgYWJvdmUuIERvIHlvdQo+ID4gdGhpbmsgdGhlcmUgYXJlIG1vcmUgc3VidGxlIG1hbmlm
ZXN0YXRpb25zIG9mIHRoZSBpc3N1ZT8KPiAKPiBUaGlzIHN0YWNrIHRyYWNlIHdhcyBwcm9kdWNl
ZCBieSBhbiBOTUkgd2F0Y2hkb2cgdGltZW91dCwgYW5kIEkgdGhvdWdodAo+IE9TU1Rlc3QgZGlk
bid0LCBidXQgSSBzZWUgSSdtIHdyb25nLgo+IAo+IEluIHdoaWNoIGNhc2UgdGhpcyBwcm9iYWJs
eSBpc24ndCB3YW50IE9TU1Rlc3QgaXMgc2VlaW5nLCBidXQgaXQgaXMgYQo+IGdlbnVpbmUgaXNz
dWUuCgpvc3N0ZXN0IGlzc3VlIElJUkMgd2FzIEwxIFhlbiBoaXR0aW5nIEFTU0VSVCghc3AgfHwg
KHBlb2lbc3AgLQoxXS52ZWN0b3IgPCB2ZWN0b3IpKSBpbiBkb19JUlFfZ3Vlc3QsIHdoaWNoIHNl
ZW1zIHRvIG1lYW4gTDAgWGVuCmluamVjdHMgaW50ZXJydXB0cyB0d2ljZSBvciBzb21lIHN1Y2g/
CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
