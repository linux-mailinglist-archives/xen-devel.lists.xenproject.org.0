Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD78CB8B7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 12:57:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGLEh-0002Gw-2F; Fri, 04 Oct 2019 10:54:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=obQ/=X5=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iGLEe-0002Gr-St
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 10:54:56 +0000
X-Inumbo-ID: 65f671de-e695-11e9-9749-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65f671de-e695-11e9-9749-12813bfff9fa;
 Fri, 04 Oct 2019 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570186496;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vizT7Ep+cAlT5qa1rDgC6wyYluu50w6QsC4chioPRhs=;
 b=cZV7l1SSjwPsaemG3dri5TwqJDPwoMUizJGGBd//J8dObSUgMClUnvh8
 aG0LlNxkqUEbYcLHIUplmoEo4NHfuZ4GkE70vKtoHD9LTQh+87tXZ+5UG
 malNzFCOfvAItXBcaefUfaTjw7GJu/iM3ujSRnAxT2eQcobyM1GZ0vc5X Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZFBojU95zSdDwxvkBNK2yQ6nMP58XOWjLzg7BTN6YnwIu/j1Rlsb03o+/rQd7inob/0WSMYg94
 AFGXM/0si2qfc0h8tXVRewsJx63lIcdRjesAgnxtno0X1yHlyHR5xveVM2UoSn6SK1fqNFxNAp
 NpjI+8mYkAAAvZ5A/oPWzo+/A3AChNIa0XXHjJt4I/eKLltJH37ErESXQgu8mi/Cktvk+TvmFG
 Bcc6FXaLF61Ibfg1brIx1tSdBi62fx+HNvxQhpkoMnQNU1wvkenl3xJjLkQgQxdT4dDappQqYR
 fxg=
X-SBRS: 2.7
X-MesageID: 6469364
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6469364"
To: Jan Beulich <jbeulich@suse.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-2-git-send-email-igor.druzhinin@citrix.com>
 <dde9c6fd-8043-cbc5-ab06-d6e238ad0e38@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <a19291d4-1eb0-e479-f9a7-bd442a1649dc@citrix.com>
Date: Fri, 4 Oct 2019 11:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dde9c6fd-8043-cbc5-ab06-d6e238ad0e38@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] efi/boot: fix set_color function
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTAvMjAxOSAxMTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMTAuMjAxOSAx
NTo0OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0gMCBpcyBhIHBvc3NpYmxlIGFuZCBhbGxv
d2VkIHZhbHVlIGZvciBhIGNvbG9yIG1hc2sgYWNjcm9kaW5nIHRvCj4+ICAgVUVGSSBTcGVjIDIu
NiAoMTEuOSkgZXNwZWNpYWxseSBmb3IgcmVzZXJ2ZWQgbWFzawo+IAo+IEhtbSwgbG9va2luZyBh
dCAyLjggKHdoZXJlIGl0J3Mgc2VjdGlvbiAxMi45LCB3aGljaCBpbiB0dXJuIGlzIHdoeQo+IHNl
Y3Rpb24gdGl0bGVzIHdvdWxkIGJlIG1vcmUgaGVscGZ1bCBpbiBzdWNoIHJlZmVyZW5jZXMpIEkg
Y2FuJ3QKPiBzZWUgdGhlIGNhc2UgYmVpbmcgbWVudGlvbmVkIGV4cGxpY2l0bHkuIEkgY2FuIGFj
Y2VwdCB0aGF0Cj4gUmVzZXJ2ZWRNYXNrIG1pZ2h0IGJlIHplcm8sIGJ1dCB0aGVuIEknZCBwcmVm
ZXIgdG8gaGFuZGxlIHRoYXQKPiBjYXNlIGluIHRoZSBjYWxsZXIsIHJhdGhlciB0aGFuIGFsbG93
aW5nIHplcm8gYWxzbyBmb3IgdGhlIHRocmVlCj4gY29sb3JzLgoKIklmIGEgYml0IGlzIHNldCBp
biBSZWRNYXNrLCBHcmVlbk1hc2ssIG9yIEJsdWVNYXNrIHRoZW4gdGhvc2UgYml0cyBvZgp0aGUg
cGl4ZWwgcmVwcmVzZW50IHRoZSBjb3JyZXNwb25kaW5nIGNvbG9yLiIgLSAiSWYgYSBiaXQgaXMg
c2V0Li4uIgppbXBsaWVzIGl0IG1pZ2h0IG5vdCBiZSBzZXQuIE5vdGhpbmcgcHJldmVudHMgbWFz
ayBmb3IgdGhlIGNvbG9ycyBiZSAwCmFzIHdlbGwuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
