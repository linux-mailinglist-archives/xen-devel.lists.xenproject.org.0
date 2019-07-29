Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D16792C7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 20:05:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs9zM-0008Av-R3; Mon, 29 Jul 2019 18:03:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs9zL-0008Aq-Gh
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 18:03:11 +0000
X-Inumbo-ID: 1e496ccc-b22b-11e9-8cb4-dff55235a222
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e496ccc-b22b-11e9-8cb4-dff55235a222;
 Mon, 29 Jul 2019 18:03:07 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nIHGPt8sxdHdYawDcPqX4kQzrgkRZKkoNjrhwjlbJI6rkX2HTPF/jvAyIgz1IRlMPErBxYmRCM
 E2Tmr+op4hIb1oZrYHYizzjkR1fxrPUvaefiAY9DP34elZWdo+MyQfMn9ioDGArwwqowjOa80X
 l7BbXeEjzjUArAVpFLOHdluC8xw0BDAb3sal3ed5mxRgGmOXuK76bx7VkVB7JvthLYgT3yU/lW
 JFwk5nhpWO7U3/9Id8WKmdUeX80hIt0qEofzuyQ6V0cvo2/+30woEkLJFe9m+mT5TpDu9d9t+x
 6Uc=
X-SBRS: 2.7
X-MesageID: 3697001
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3697001"
To: Jan Beulich <JBeulich@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-5-andrew.cooper3@citrix.com>
 <9c5c9972-801a-e01a-171e-bcabde79eb6f@suse.com>
 <bb203e66-6edd-4edd-4f96-1fe95c1f9ccd@citrix.com>
 <f585f767-f6a0-e9ce-bbab-2183dde59e97@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <59379d7b-6add-4f34-c82e-1d8124871d9e@citrix.com>
Date: Mon, 29 Jul 2019 19:03:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f585f767-f6a0-e9ce-bbab-2183dde59e97@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
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
Cc: Juergen Gross <JGross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDcvMjAxOSAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjkuMDcuMjAxOSAx
NToyMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjkvMDcvMjAxOSAxNDowMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNi4wNy4yMDE5IDIzOjA4LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaAo+Pj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9wZXJjcHUuaAo+Pj4+IEBAIC0zLDYgKzMsMTIgQEAKPj4+PiAgICAKPj4+PiAgICAj
aW5jbHVkZSA8YXNtL3BlcmNwdS5oPgo+Pj4+ICAgIAo+Pj4+ICsjZGVmaW5lIERFQ0xBUkVfUEVS
X0NQVSh0eXBlLCBuYW1lKSBcCj4+Pj4gKyAgICBleHRlcm4gX190eXBlb2ZfXyh0eXBlKSBwZXJf
Y3B1X18gIyMgbmFtZQo+Pj4+ICsKPj4+PiArI2RlZmluZSBfX0RFRklORV9QRVJfQ1BVKGF0dHIs
IHR5cGUsIG5hbWUpIFwKPj4+PiArICAgIGF0dHIgX190eXBlb2ZfXyh0eXBlKSBwZXJfY3B1XyAj
IyBuYW1lCj4+Pj4gKwo+Pj4+ICAgIC8qCj4+Pj4gICAgICogU2VwYXJhdGUgb3V0IHRoZSB0eXBl
LCBzbyAoaW50WzNdLCBmb28pIHdvcmtzLgo+Pj4+ICAgICAqCj4+PiBCeSBtb3ZpbmcgdGhpbmdz
IGhlcmUgeW91IHJlbmRlciBzdGFsZSB0aGUgcmVtYWluZGVyIG9mIHRoZQo+Pj4gY29tbWVudCBp
biBjb250ZXh0IGFib3ZlOiBObyBwZXItYXJjaCBzeW1ib2wgbmFtZSBwcmVmaXggaXMgZ29pbmcK
Pj4+IHRvIGJlIHBvc3NpYmxlIGFueW1vcmUuIEknbSBub3QgYWdhaW5zdCBpdCwgYnV0IHRoaXMg
Y29tbWVudAo+Pj4gd291bGQgdGhlbiB3YW50IGFkanVzdGluZy4gV2hhdCdzIG5vdCBpbW1lZGlh
dGVseSBjbGVhciB0byBtZSBpcwo+Pj4gd2hldGhlciB0aGUgdHdvLXN0YWdlIGNvbmNhdGVuYXRp
b24gb2YgYW4gdW5kZXJzY29yZSBlYWNoIGlzIHRoZW4KPj4+IHN0aWxsIG5lY2Vzc2FyeS4KPj4g
WWVzIGl0IGlzIHN0aWxsIG5lY2Vzc2FyeS7CoCBTZWUgdGhlIFRTUyB0aHJlYWQgZm9yIHdoeS4K
PiBObywgdGhhdCB0aHJlYWQgZG9lc24ndCBleHBsYWluIGl0LiBGcm9tIGFuIGluaXRpYWwgbG9v
ayBJIHRoaW5rCj4gdHdvLXN0YWdlIGV4cGFuc2lvbiBpcyBzdGlsbCBuZWNlc3NhcnkKCkl0IGlz
IGFib3V0IHByZXZlbnRpbmcgJ25hbWUnIGJlaW5nIGV4cGFuZGVkLCBkdWUgdG8gdGhlIG1lc3Mg
d2l0aApjcHVtYXNrX3NjcmF0Y2gsIHdoaWNoIHJlcXVpcmVzIGEgIyMgYXQgbGVhc3QgYXQgdGhl
IHRvcCBsZXZlbC4KCkkgcGVyc29uYWxseSB0aGluayB0aGF0IGZpeGluZyBjcHVtYXNrX3NjcmF0
Y2ggaXMgdGhlIHJpZ2h0IHdheSB0byBnbywKYnV0IEkgc3BlY2lmaWNhbGx5IGRpZG4ndCB0b3Vj
aCB0aGF0IHNvIGFzIHRvIGF2b2lkIHdyZWFraW5nIGhhdm9jIHdpdGgKSnVlcmdlbidzIGNvcmUt
c2NoZWR1bGluZyBzZXJpZXMuCgo+ICwgYnV0IGl0IGNvdWxkIHRoZW4gYmUKPiBfICMjIG5hbWUg
b24gdGhlIGZpcnN0IGFuZCBwZXJfY3B1ICMjIG5hbWUgb24gdGhlIHNlY29uZCAoaS5lLgo+IG5v
IGRvdWJsZSB1bmRlcnNjb3JlIGluIHRoZSBtaWRkbGUgYW55bW9yZSkuCgpIbW0sIHByb2JhYmx5
LCBidXQuLi4KCj4gT2YgY291cnNlIHRoZXJlIG1heQo+IGJlIHJlYXNvbnMgd2h5IHdlIGFjdHVh
bGx5IF93YW50XyBhIGRvdWJsZSB1bmRlcnNjb3JlIHRoZXJlLgoKLi4uIEkgZG9uJ3QgaGF2ZSB0
aGUgZWZmb3J0IG9yIGVuZXJneSAtIGJ1dCBtb3N0IGltcG9ydGFudGx5LCB0aW1lIC0gdG8KcmV3
cml0ZSBYZW4gZnJvbSBzY3JhdGNoLgoKSWYgdGhlcmUgaXMgYSBjb25jcmV0ZSByZWFzb24gd2h5
IGRyb3BwaW5nIHRoZSBkb3VibGUgdW5kZXJzY29yZSBpcwpnb29kL25lY2Vzc2FyeS9vdGhlciwg
dGhlbiBpdCBzaG91bGQgYmUgcHJlc2VudCBhcyBpdHMgb3duIHBhdGNoLCBub3QKY3Jvd2JhcnJl
ZCBpbnRvIGFuIHVucmVsYXRlZCBjbGVhbnVwIHBhdGNoLgoKVW50aWwgdGhlbiwgdGhlIGluZXJ0
aWEgb2YgImJlY2F1c2UgaXRzIGFscmVhZHkgbGlrZSB0aGlzIiB3aW5zLgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
