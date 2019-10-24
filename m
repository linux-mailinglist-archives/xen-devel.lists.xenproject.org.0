Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E4E2B28
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 09:32:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNXYM-0004g6-E8; Thu, 24 Oct 2019 07:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WsUZ=YR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNXYL-0004g1-56
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 07:29:01 +0000
X-Inumbo-ID: f097a8a5-f62f-11e9-9497-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f097a8a5-f62f-11e9-9497-12813bfff9fa;
 Thu, 24 Oct 2019 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571902137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CVqAC1SF3nBA3tpjNecC7eJSBd+nEUeiPeT9DeJrbGA=;
 b=AmJZUfBF8Fy8NX8PwLXpvQl6kP+k7zcEN5w68b89GQUnlFnd9V2piHTh
 yhWyLtjpoZR+b/FLg9TKWFjaTF5gHFSMD5JArmqi02mKj7+OE7fliK1Fv
 FwfPvxtj+B2NO1R1YlrFHaBhV6PCgKp3p7GNe+KUFongos9MPOncKSCGQ s=;
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
IronPort-SDR: rWDdlECrvWmzttjKuQHIbR/BwQXd1U+1ChiXtZHNjAiWqjGr+HhCfqb4VsSg8eZci6i3syKAKt
 0TOugar7FQNW0HuughQGIgU7op/FZxvW8HkYINOpiviWpLi5FOfY3xJmJGJmjXQeKU4kyikNpj
 XtFwpOG5/Xhq/vU1Dcrn9EhvNVqTy9GcV9ZLVD68eo7ZLX9v3wibPjGdcqTzex+EZvvN9hSjhZ
 n5VrOi7cU61BCSXX1DcLh8xbiZ8ek9MOeFVk7GHpA2qD7+peL5IeMav8NEEkMo8XVZH//avR/I
 9EY=
X-SBRS: 2.7
X-MesageID: 7808538
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,223,1569297600"; 
   d="scan'208";a="7808538"
Date: Thu, 24 Oct 2019 09:28:47 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191024072847.GU17494@Air-de-Roger>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDk6MTM6MTRBTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyNC4xMC4xOSAwODo0Nywgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+
ID4gZmxpZ2h0IDE0MzA2MSB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPiA+IGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDMwNjEvCj4gPiAKPiA+IFJl
Z3Jlc3Npb25zIDotKAo+ID4gCj4gPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+
ID4gICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhz
bSAgICA8am9iIHN0YXR1cz4gICBicm9rZW4KPiA+ICAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11
dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14c20gNCBob3N0LWluc3RhbGwoNCkgYnJva2VuIFJF
R1IuIHZzLiAxNDI3NTAKPiAKPiBXaHkgaXMgTGludXgga2VybmVsIDUuNC4wLXJjNCBiZWluZyB1
c2VkIGZvciB0ZXN0aW5nIHhlbi11bnN0YWJsZSBoZXJlPwo+IE9yIGFtIEkgcmVhZGluZyB0aGUg
bG9ncyB3cm9uZz8KCkFGQUlDVCB3aGF0J3Mgb24gdGhlIHNlcmlhbCBsb2cgaXMgdGhlIG91dHB1
dCBmcm9tIHRoZSBwcmV2aW91cyBqb2Igb24KdGhhdCBib3gsIGFjY29yZGluZyB0byB0aGUgb3Nz
dGVzdCBsb2c6Cgpzc2g6IGNvbm5lY3QgdG8gaG9zdCAxNzIuMTYuMTQ0LjQxIHBvcnQgMjI6IE5v
IHJvdXRlIHRvIGhvc3QKMjAxOS0xMC0yMyAyMzoxNjo1OSBaIGNvbW1hbmQgbm9uemVybyB3YWl0
c3RhdHVzIDY1MjgwOiB0aW1lb3V0IDYwIHNzaCAtbyBTdHJpY3RIb3N0S2V5Q2hlY2tpbmc9bm8g
LW8gQmF0Y2hNb2RlPXllcyAtbyBDb25uZWN0VGltZW91dD0xMDAgLW8gU2VydmVyQWxpdmVJbnRl
cnZhbD0xMDAgLW8gUGFzc3dvcmRBdXRoZW50aWNhdGlvbj1ubyAtbyBDaGFsbGVuZ2VSZXNwb25z
ZUF1dGhlbnRpY2F0aW9uPW5vIC1vIFVzZXJLbm93bkhvc3RzRmlsZT10bXAvdC5rbm93bl9ob3N0
c18xNDMwNjEudGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2
NC14c20gcm9vdEAxNzIuMTYuMTQ0LjQxICBzZXQgLWUKIHR5cGUgcmVib290CiBleGVjID4+L3Zh
ci9sb2cvb3NzdGVzdC1yZWJvb3QubG9nCiBkYXRlCiBleGVjIDwvZGV2L251bGwgMj4mMQogc2V0
IC14CiAoCiAgICBzZXQgK2UKICAgIHNsZWVwIDUKICAgIHJlYm9vdCAtZiAtbiAtZCAgICMgTGlu
dXggc3lzdmluaXQvc3lzdGVtZAogICAgcmVib290IC1ucSAgICAgICAgIyBGcmVlQlNEIChyZWpl
Y3RzIGFib3ZlIGR1ZSB0byAtZikKICkmCiAKMjAxOS0xMC0yMyAyMzoxNjo1OSBaIHBvd2VyOiBm
YWlsZWQgdG8gcmVib290ICh1c2luZyBTU0gpOiBzdGF0dXMgNjUyODAgYXQgT3NzdGVzdC9UZXN0
U3VwcG9ydC5wbSBsaW5lIDU1MC4KIAoyMDE5LTEwLTIzIDIzOjE2OjU5IFogcG93ZXI6IHRyeWlu
ZyB0byByZWJvb3QgaXRhbGlhMSAodXNpbmcgUERVKSAKMjAxOS0xMC0yMyAyMzoxNjo1OSBaIHBv
d2VyOiBzZXR0aW5nIDAgKHVzaW5nIFBEVSkgZm9yIGl0YWxpYTEgCndhczogcGR1LW1zdyBwZHUy
OiAjMTIgIk91dGxldCAxMiIgPSBvbgpub3c6IHBkdS1tc3cgcGR1MjogIzEyICJPdXRsZXQgMTIi
ID0gb24KMjAxOS0xMC0yMyAyMzoxNjo1OSBaIHVzaW5nIHBlcnNpc3RlbnQtbmV0LWdlbmVyYXRv
cjogY3AgLWRSIG92ZXJsYXktcGVyc2lzdGVudC1uZXQvLiB0bXAvdC5pdGFsaWExLmluaXRyZC5k
Ly4gCjIwMTktMTAtMjMgMjM6MTY6NTkgWiBGb3JjaW5nIGludGVyZmFjZSBhdXRvIAp0bXAvdC5p
dGFsaWExLmluaXRyZC5jcGlvOgkgNjUuNyUgLS0gcmVwbGFjZWQgd2l0aCB0bXAvdC5pdGFsaWEx
LmluaXRyZC5jcGlvLmd6CjIwMTktMTAtMjMgMjM6MTY6NTkgWiB1c2luZyBpbml0cmRzOiAvaG9t
ZS90ZnRwLy9vc3N0ZXN0L2RlYmlhbi1pbnN0YWxsZXIvYW1kNjQvMjAxOS0wOS0xMC1zdHJldGNo
L2luaXRyZC5neiB0bXAvdC5pdGFsaWExLmluaXRyZC5jcGlvLmd6IAoyMDE5LTEwLTIzIDIzOjE2
OjU5IFogd3JvdGUgL2hvbWUvdGZ0cC8vaXRhbGlhMS9weGVsaW51eC5jZmcgKHN0YXNoZWQgYXMg
aXRhbGlhMS1uZXRib290LmNmZysxKSAKMjAxOS0xMC0yMyAyMzoxNjo1OSBaIHBvd2VyLWN5Y2xl
OiB3YWl0aW5nIDVzIAoyMDE5LTEwLTIzIDIzOjE3OjA0IFogcG93ZXI6IHNldHRpbmcgMSAodXNp
bmcgUERVKSBmb3IgaXRhbGlhMSAKd2FzOiBwZHUtbXN3IHBkdTI6ICMxMiAiT3V0bGV0IDEyIiA9
IG9mZgpub3c6IHBkdS1tc3cgcGR1MjogIzEyICJPdXRsZXQgMTIiID0gb2ZmCjIwMTktMTAtMjMg
MjM6MTc6MDQgWiBmZXRjaCBpdGFsaWExX3ByZXNlZWQ6IHdhaXRpbmcgMzUwcy4uLiAKMjAxOS0x
MC0yMyAyMzoxNzowNCBaIGZldGNoIGl0YWxpYTFfcHJlc2VlZDogKG5vbmUpICh3YWl0aW5nKSAu
Li4gCi4uLgoyMDE5LTEwLTIzIDIzOjIyOjU1IFogRkFJTFVSRTogZmV0Y2ggaXRhbGlhMV9wcmVz
ZWVkOiB3YWl0IHRpbWVkIG91dDogKG5vbmUpLiAKMjAxOS0xMC0yMyAyMzoyMjo1NSBaIHBvd2Vy
OiBmYWlsZWQgdG8gcmVib290ICh1c2luZyBQRFUpOiBmYWlsdXJlOiBmZXRjaCBpdGFsaWExX3By
ZXNlZWQ6IHdhaXQgdGltZWQgb3V0OiAobm9uZSkuCiAKcG93ZXI6IGFsbCBhcHByb2FjaGVzIHRv
IHJlYm9vdGluZyBpdGFsaWExIGZhaWxlZCEKCkl0IHNlZW1zIGxpa2Ugb3NzdGVzdCBmYWlsZWQg
dG8gcmVib290IHRoZSBib3gsIGFkZGluZyBJYW4gZm9yIG1vcmUKaW5wdXQsIGJ1dCBJIGd1ZXNz
IHRoZSBib3ggY2FuIGJlIHVuYmxlc3NlZCB1bnRpbCB0aGlzIGlzIHNvcnRlZCBvdXQuCgpSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
