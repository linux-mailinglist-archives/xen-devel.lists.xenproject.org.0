Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07661120680
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:01:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpwW-0006rV-Hx; Mon, 16 Dec 2019 12:57:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igpwU-0006rN-UB
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:57:42 +0000
X-Inumbo-ID: a4c74c56-2003-11ea-939e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4c74c56-2003-11ea-939e-12813bfff9fa;
 Mon, 16 Dec 2019 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576501061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kOyuAqOvIppN0612SiR3IIxhbjN0zIxv011MacyOXG4=;
 b=JpOrgLlPPUGhqUvANwEGuBnAiKmbm6f9kO1cDm4L4GNIgBka9RjMEZVu
 cWg3Ds8/lZZXQ2os3HHnja7T2TV3hFOLVbBqMzJcnNJh9pEIf0uNUPRRk
 cpVJn+7PFn5qAzTgXAZV6EeaT3IiZyfdiZxRP9Q0bNW+5qz/wLes/H4yd k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X+KDfXtj8GP+K6qdejNuEzuxCpe/JovROFP0ivXrLtaGUAKl9O8LPnKmhW9ExobHj4pJW277Jt
 lGI4OVES4LxWsu3jcZEKoNk8xCf74uocmxUD3kX3KiMPQQr2UCCY/7d2Z9+dKGr7qzcKd6hr/F
 p2mSMdh19zsE30zQ3ozeL1oNO/vjNDpmlJ3Zq0tipaP/4RYl+E5+YKPrCSGoidVBxSVb6cAnSG
 9+WlEExwH6ArzsSaJjZEnUes90vcbOGX3VSUHbpl6nZBmNIUzgjPSSYre0ew8c59LFWW6SN+iL
 U60=
X-SBRS: 2.7
X-MesageID: 10076839
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; d="scan'208";a="10076839"
Date: Mon, 16 Dec 2019 13:57:34 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20191216125734.GP11756@Air-de-Roger>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
 <20191216100058.GM11756@Air-de-Roger>
 <65efcbf8-e9f9-385c-903d-895f21d08132@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65efcbf8-e9f9-385c-903d-895f21d08132@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMTI6NTM6NDBQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTYvMTIvMjAxOSAxMDowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
IE9uIEZyaSwgRGVjIDEzLCAyMDE5IGF0IDEwOjQ4OjAyUE0gKzAwMDAsIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+ID4gSSdtIG5vdCBzdXJlIGlmIHRoZSBmb2xsb3dpbmcgd291bGQgYmUgc2xpZ2h0
bHkgYmV0dGVyIHBlcmZvcm1hbmNlCj4gPiB3aXNlOgo+ID4gCj4gPiBkbyB7Cj4gPiAgICAgb2xk
ID0gZC0+YXJjaC52dHNjX2xhc3Q7Cj4gPiAgICAgaWYgKCBkLT5hcmNoLnZ0c2NfbGFzdCA+PSBu
b3cgKQo+ID4gICAgIHsKPiA+ICAgICAgICAgbmV3ID0gYXRvbWljX2luY19yZXR1cm4oJmQtPmFy
Y2gudnRzY19sYXN0KTsKPiA+ICAgICAgICAgYnJlYWs7Cj4gPiAgICAgfQo+ID4gICAgIGVsc2UK
PiA+ICAgICAgICAgbmV3ID0gbm93Owo+ID4gfSB3aGlsZSAoIGNtcHhjaGcoJmQtPmFyY2gudnRz
Y19sYXN0LCBvbGQsIG5ldykgIT0gb2xkICk7Cj4gPiAKPiA+IEluIGFueSBjYXNlIEknbSBmaW5l
IHdpdGggeW91ciB2ZXJzaW9uIHVzaW5nIGNtcHhjaGcgZXhjbHVzaXZlbHkuCj4gCj4gVGhhdCBj
b3VsZCBiZSBtYXJnaW5hbGx5IGJldHRlciAoa25vd2luZyB0aGF0IGF0b21pYyBpbmNyZW1lbnQg
dXN1YWxseSBwZXJmb3Jtcwo+IGJldHRlciB0aGFuIGNtcHhjaGcpIGJ1dCBpdCB0b29rIG1lIHNv
bWUgdGltZSB0byB3b3JrIG91dCB0aGVyZSBpcyBubyBoaWRkZW4KPiByYWNlIGhlcmUuIEknZCBy
ZXF1ZXN0IGEgdGhpcmQgb3BpbmlvbiBvbiB0aGUgbWF0dGVyIGlmIGl0J3Mgd29ydGggY2hhbmdp
bmcuCgpBbnl3YXksIHlvdXIgcHJvcG9zZWQgYXBwcm9hY2ggdXNpbmcgY21weGNoZyBpcyBmaW5l
IElNTywgd2UgY2FuIGxlYXZlCnRoZSBhdG9taWMgaW5jcmVtZW50IGZvciBhIGZ1cnRoZXIgaW1w
cm92ZW1lbnQgaWYgdGhlcmUncyBhIG5lZWQgZm9yCml0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
