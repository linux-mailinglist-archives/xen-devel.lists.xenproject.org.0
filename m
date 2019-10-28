Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EEAE705A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:28:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP39S-0004pa-6N; Mon, 28 Oct 2019 11:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP39Q-0004pU-N1
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:25:32 +0000
X-Inumbo-ID: a66eabee-f975-11e9-beca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a66eabee-f975-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572261932;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=G4tUOpGo9AdILIGPQJ7wrOIOeOQ8aFnGyzV4vLsuKrE=;
 b=IkKjYW0lKv49q6pUGDboQz/FkwWub7JZMJ/gzPeWgSKfwqKwHunPY788
 tA2w6dJBJxKNgkd8/K/khUH+UOC0YAgGeidRFpHjs8buxEwogdyCuh5r+
 8rJn+lX7X5DXUbxOvwJJfyQ7eLXxaQT/7zt6bOd3W23AQv0C0HhnSiAvf M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wcMV2sTY2B0rTYllVlmIjFebqRVikq/0d8bePJvlMZBCKqxriC8WFhPQQr7IS8yAkp561w0FNM
 8LvwfNTNf9uZjJEGJNN13aGP0nShFXpPVSG8Lo1VwASplOOOOtPWKOaRordXc0ywE5xCUDXHLN
 243MdR+PFUz04iozBpWDhJu72fUb1/c7slAUz3GnBnhVtEmDPqjXrp6GH16RuQE/N/LXCVEm3H
 8ZRS1ictZynast2Vgj4dPvR6ACsPEwGZ57vpgcsIMRTF6dQrF0yGxSMEqKf3AkuWHszkqiYVwT
 BtA=
X-SBRS: 2.7
X-MesageID: 7495438
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7495438"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23990.53286.572469.441064@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 11:25:26 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191025170505.2834957-1-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 0/4] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuICBUaGFua3MgZm9yIHRhY2tsaW5nIHRoaXMgc3dhbXAuICBBbGwgdmVyeSB1bmZvcnR1bmF0
ZS4KCkFudGhvbnkgUEVSQVJEIHdyaXRlcyAoIltSRkMgWEVOIFBBVENIIGZvci00LjEzIDAvNF0g
Rml4OiBsaWJ4bCB3b3JrYXJvdW5kLCBtdWx0aXBsZSBjb25uZWN0aW9uIHRvIHNpbmdsZSBRTVAg
c29ja2V0Iik6Cj4gQWx0ZXJuYXRpdmVseSB0byB0aGlzIGNyYXppbmVzcywgaXQgbWlnaHQgYmUg
cG9zc2libGUgdG8gaW5jcmVhc2UKPiB0aGUgYGJhY2tsb2cnIHZhbHVlIGJ5IGhhdmluZyBsaWJ4
bCBvcGVuaW5nIHRoZSBRTVAgc29ja2V0IG9uIGJlaGFsZgo+IG9mIFFFTVUuIEJ1dCB0aGlzIGlz
IG9ubHkgcG9zc2libGUgd2l0aCBhIHJlY2VudCB2ZXJzaW9uIG9mIFFFTVUKPiAoMi4xMiBvciBu
ZXdlciwgcmVsZWFzZWQgaW4gQXByIDIwMTgsIG9yIHFlbXUteGVuLTQuMTIgb3IgbmV3ZXIpLiBJ
dAo+IHdvdWxkIGludm9sdmUgdG8gZGlzY292ZXIgUUVNVSdzIGNhcGFiaWxpdHkgYmVmb3JlIHdl
IHN0YXJ0IHRoZSBETSwKPiB3aGljaCBsaWJ4bCBpc24ndCBjYXBhYmxlIHlldC4KCkkgaGF2ZSBh
biBhbmNpZW50IHVuYXBwbGllZCBwYXRjaCBzb21ld2hlcmUgd2hpY2ggcnVucyBxZW11IC0taGVs
cAphbmQgZ3JlcHMgdGhlIG91dHB1dC4gIElmIHlvdSB3b3VsZCBsaWtlLCBJIGNhbiBkaWcgaXQg
b3V0LgoKQnV0IG9uZSBwcm9ibGVtIHdpdGggdGhhdCBhcHByb2FjaCBpcyB0aGlzOiB3aXRob3V0
IHRoYXQgZmVhdHVyZSBpbgpxZW11LCB3aGF0IHdvdWxkIHdlIGRvID8gIExpdmUgd2l0aCB0aGUg
YnVnIHdoZXJlIGRvbWFpbiBjcmVhdGlvbgpmYWlscyA/ICBCb2RnZSBpdCBieSBzZXJpYWxpc2lu
ZyB3aXRoaW4gZG9tYWluIGNyZWF0ZSAoYXdrd2FyZGF0aW5nCnRoZSBjb2RlKSA/CgpJIGhhdmUg
c29tZSBvdGhlciBzdWdnZXN0aW9ucyB3aGljaCBvdWdodCB0byBiZSBjb25zaWRlcmVkOgoKCjEu
IFNlbmQgYSBwYXRjaCB0byBxZW11IHVwc3RyZWFtIHRvIGFsbG93IHNwZWNpZnlpbmcgdGhlIHNv
Y2tldCBsaXN0ZW4KcXVldWUuCgoxKGEpIEV4cGVjdCBkaXN0cm9zIHRvIGFwcGx5IHRoYXQgcGF0
Y2ggdG8gb2xkZXIgcWVtdXMsIGlmIHRoZXkgc2hpcApvbGRlciBxZW11cy4gIEhhdmUgbGlieGwg
dW5jb25kaXRpb25hbGx5IHNwZWNpZnkgdGhhdCBhcmd1bWVudC4KCjEoYikgZ3JlcCB0aGUgaGVs
cCBvdXRwdXQgKGFzIEkgcHJvcG9zZSBhYm92ZSkgYW5kIGlmIHRoZSBwYXRjaCBpcyBub3QKcHJl
c2VudCwgdXNlIExEX1BSRUxPQUQgdG8gd3JhcCBsaXN0ZW4oMikuCgoKMi4gU2VuZCBhIHBhdGNo
IHRvIHFlbXUgdXBzdHJlYW0gdG8gY2hhbmdlIHRoZSBmaXhlZCBxdWV1ZSBsZW5ndGggZnJvbQox
IHRvIDEwMDAwLiAgRXhwZWN0IGRpc3Ryb3MgdG8gYXBwbHkgdGhhdCBwYXRjaCB0byBvbGRlciBx
ZW11cyAoZXZlbiwKcGVyaGFwcywgaWYgaXQgaXMgbm90IGFjY2VwdGVkIHVwc3RyZWFtISkgIENo
YW5nZSBsaWJ4bCB0byBkZXRlY3QKRUFHQUlOIGZyb20gcW1wIGNvbm5lY3QoKSBhbmQgcHJpbnQg
YSBtZXNzYWdlIGV4cGxhaW5pbmcgd2hhdCBwYXRjaCBpcwptaXNzaW5nLgoKClNpbmNlIHlvdSBo
YXZlIHByb3ZpZGVkIGFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmb3JrL2xvY2sgc3RyYXRlZ3ks
CkknbGwgbm93IGdvIGFuZCBkbyBhIGRldGFpbGVkIHJldmlldyBvZiB0aGF0LgoKVGhhbmtzLApJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
