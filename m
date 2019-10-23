Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E5E1B9A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 14:59:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGBE-00055N-11; Wed, 23 Oct 2019 12:56:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVcx=YQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNGBC-00055I-Eu
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 12:55:58 +0000
X-Inumbo-ID: 73cc888b-f594-11e9-947c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73cc888b-f594-11e9-947c-12813bfff9fa;
 Wed, 23 Oct 2019 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rbo5HHh16TTdZkELlWK0LjN1kHl72uqFTzUquF4Fdwo=;
 b=Nkxr7IJ8R55cjOt5gdd1C7kqHoMiaroHkOh4UuaasqpQ8os7wJPmoYMG
 bT2YGn81ImHNW5OKqm+W3AlXTLnL4j8kKl6up+aR6oFi3whIkMW3vACMy
 FtWz6DDeDvFLkN5nzif9rOITqS2vUakJM0m7Wg4AcCdf0qncQ3LMwS8Xb U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WlHt4VrwC8M15DE/XjLSdJwcTdfZNPD0mJn7h0V3XfOn4BQgLGqQTxEbdORddv1n3xZ4N7niKG
 RxAiE7j9l99+CFU3xB3NkLiNMWwbFJXLWbckwA0I+wCbrhcBz6t502x/cXSX9nqdrlw0OunDlW
 08sUcdZvpZXNTO+FHkJjpCDIKf43FtBH06+Cx4F1adnoynEt8HpvG19m/c6IbfahyGuLKOUp93
 8x8C4gL8KfA+BFb/4QkI3w5vTNvNs9xUtQIhcSSiofb2Y2y4Lst4tyVgLVLXox4z4RXhAt7dMo
 a+0=
X-SBRS: 2.7
X-MesageID: 7316215
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7316215"
Date: Wed, 23 Oct 2019 14:55:48 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191023125548.GS17494@Air-de-Roger>
References: <20191023121209.4814-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023121209.4814-1-jgross@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/pvhsim: fix cpu onlining
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDI6MTI6MDlQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBTaW5jZSBjb21taXQgOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46IGxldCB2Y3B1X2NyZWF0
ZSgpIHNlbGVjdCBwcm9jZXNzb3IiKQo+IHRoZSBpbml0aWFsIHByb2Nlc3NvciBmb3IgYWxsIHB2
LXNoaW0gdmNwdXMgd2lsbCBiZSAwLCBhcyBubyBvdGhlciBjcHVzCj4gYXJlIG9ubGluZSB3aGVu
IHRoZSB2Y3B1cyBhcmUgY3JlYXRlZC4gQmVmb3JlIHRoYXQgY29tbWl0IHRoZSB2Y3B1cwo+IHdv
dWxkIGhhdmUgcHJvY2Vzc29ycyBzZXQgbm90IGJlaW5nIG9ubGluZSB5ZXQsIHdoaWNoIHdvcmtl
ZCBqdXN0IGJ5Cj4gY2hhbmNlLgo+IAo+IFdoZW4gdGhlIHB2LXNoaW0gdmNwdSBiZWNvbWVzIGFj
dGl2ZSBpdCB3aWxsIGhhdmUgYSBoYXJkIGFmZmluaXR5Cj4gbm90IG1hdGNoaW5nIGl0cyBpbml0
aWFsIHByb2Nlc3NvciBhc3NpZ25tZW50IGxlYWRpbmcgdG8gZmFpbGluZwo+IEFTU0VSVCgpcyBv
ciBvdGhlciBwcm9ibGVtcyBkZXBlbmRpbmcgb24gdGhlIHNlbGVjdGVkIHNjaGVkdWxlci4KPiAK
PiBGaXggdGhhdCBieSBkb2luZyB0aGUgYWZmaW5pdHkgc2V0dGluZyBhZnRlciBvbmxpbmluZyB0
aGUgY3B1IGJ1dAo+IGJlZm9yZSB0YWtpbmcgdGhlIHZjcHUgdXAuIEZvciB2Y3B1IDAgdGhpcyBp
cyBzdGlsbCBpbgo+IHNjaGVkX3NldHVwX2RvbTBfdmNwdXMoKSwgZm9yIHRoZSBvdGhlciB2Y3B1
cyBzZXR0aW5nIHRoZSBhZmZpbml0eQo+IHRoZXJlIGNhbiBiZSBkcm9wcGVkLgo+IAo+IEZpeGVz
OiA4ZDNjMzI2ZjY3NTZkMSAoInhlbjogbGV0IHZjcHVfY3JlYXRlKCkgc2VsZWN0IHByb2Nlc3Nv
ciIpCj4gUmVwb3J0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNv
bT4KPiBUZXN0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
