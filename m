Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A42ABBF5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:13:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Fs6-0004fY-9A; Fri, 06 Sep 2019 15:09:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6Fs5-0004fT-BE
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:09:57 +0000
X-Inumbo-ID: 61880650-d0b8-11e9-abf6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61880650-d0b8-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567782595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=s5bFhWkNjV9sjFKFZO6lPxQVwy+d8XxV+xe07YXOt0A=;
 b=UnsQ02GDy+gMV0uHFdOpPvVstrfHT65TCwXfhBVXieQPnwa3qqBURJZa
 MbZ2S9uncNOS70nQVV9VmPZyB8PHT+Xj5Zo5R7ADOq4AK18gQPWzU/dL7
 ls08A2ZDaQjQpIpuHPBwakUaZAjsKuFR2v7iFOR3tsuJjo6MY0HkTvDtU o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pgfuchGab97p+JtLr5mytQnldlZfGrvVvnPD2UL6tSqsIiKWX8hFRP7K/hvus0gvJHOQ4XyPFs
 gjMJl8aXyg3myi83Xffae4qRZHAN5Pjazi2w3qAA/wMIKJKkyb8n6UZW53mdCFYcSwK8tGRRcN
 389z4J3ZJ9OlKAd/QH+jicQEj/nKw+Fj3EeTIwsjVcYAOtdXkqVpZFr2cPW8Z6JtbEgF6RagF6
 QEhkE+b9OF0WRAy/UHuc7SMqWbLhoAMsJMPr1F899Yj5rHll6HOZnZMJS1vmHyHTDM8Wg2W8bn
 dNk=
X-SBRS: 2.7
X-MesageID: 5473391
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5473391"
Date: Fri, 6 Sep 2019 17:09:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20190906150943.byjgvxrpbhn6ia6i@Air-de-Roger>
References: <cover.1567620587.git.lars.kurth@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1567620587.git.lars.kurth@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/2] Code of Conduct (based on Contributor
 Covenant v1.4)
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
Cc: xen-api@lists.xenproject.org, minios-devel@lists.xenproject.org,
 committers@xenproject.org, mirageos-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDc6MTI6MTZQTSArMDEwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBUaGlzIHNlcmllcyBwcm9wb3NlcyBhIGNvbmNyZXRlIHZlcnNpb24gb2YgdGhlIFhlbiBQ
cm9qZWN0Cj4gQ29DIGJhc2VkIG9uIHYxLjQgb2YgdGhlIENvbnRyaWJ1dG9yIENvdmVuYW50LiBT
ZWUgWzFdCj4gCj4gSXQgYWxzbyByZWZsZWN0cyB0aGUgZGlzY3Vzc2lvbiBpbiBbMl0gYW5kIHNv
bWUgcHJpdmF0ZQo+IGRpc2N1c3Npb25zIG9uIElSQyB0byBpZGVudGlmeSBpbml0aWFsIG1lbWJl
cnMgb2YgdGhlIFhlbgo+IFByb2plY3TigJlzIENvQyB0ZWFtLgo+IAo+IEZvciBjb252ZW5lbmNl
IG9mIHJldmlldyBhbmQgaW4gbGluZSB3aXRoIG90aGVyIHBvbGljeSBkb2N1bWVudHMKPiBJIGNy
ZWF0ZWQgYSBnaXQgcmVwb3NpdG9yeSBhdCBbM10uIFRoaXMgc2VyaWVzIGNhbiBiZSBmb3VuZCBh
dCBbNV0uCj4gCj4gVGhlIHNlcmllcyBpcyBpbmNvbXBsZXRlIGluIHRoYXQgaXQgZG9lcyBub3Qg
eWV0IGNvbnRhaW4gdGhlIGRvY3VtZW50Cj4gb24gcG9zaXRpdmUgYmVoYXZpb3I6IHRoaXMgd2ls
bCBiZSBiYXNlZCBvbiBbNF0uIE15IGludGVudGlvbiBpcyB0bwo+IHVzZSBhIGxpZ2h0d2lnaHQg
cHJvY2VzcyBiYXNlZCBvbgo+ICogRG9jdW1lbnRhdGlvbiB0byBzZXQgZXhwZWN0YXRpb25zLCBz
aGFyZSB0aXBzIGFuZCBiZXN0IHByYWN0aWNlcyAtIHdpdGggdGhlCj4gaG9wZSB0aGF0IHBlb3Bs
ZSBpbiB0aGUgY29tbXVuaXR5IHJlZmxlY3Qgb2NjYXNpb25hbGx5IG9uIGhvdyB0aGV5IGFyZSBk
b2luZwo+IGFnYWluc3QgdGhlc2UgKG9yIGFyZSBtYXliZSBwcm9tcHRlZCBieSBwZWVycyB0byBk
byBzbykKPiAqIEEgc2FmZSBiYWNrLWNoYW5uZWwgdG8gYXNrIGZvciBhZHZpY2Ugd2hlbiBhIGNv
bnZlcnNhdGlvbiBiZWNvbWVzIGluZWZmaWNpZW50LAo+IHVuYWN0aW9uYWJsZSwgaXMgdW5mcmll
bmRseSwgLi4uIHdpdGggYSB2aWV3IHRvIHJlY292ZXIgaXQKPiAqIEFyYml0cmF0aW9uIGluIGNh
c2VzIHdoZXJlIHRoZXJlIGlzIHNvbWUgZnJpY3Rpb24gYW1vbmdzdCBwYXJ0aWNpcGFudHMgaW4g
YQo+IGRpc2N1c3Npb24sIHdoaWNoIHdhcyBub3QgcmVzb2x2YWJsZSBieSBhbnkgb2YgdGhlIGJl
Zm9yZS4gQWZ0ZXIgYWxsLCB3aGVuIHRoaXMKPiBoYXBwZW5zIHRoZXJlIGlzIGEgcmlzayB0aGF0
IGEgd29ya2luZyByZWxhdGlvbnNoaXAgZ2V0cyBuZWdhdGl2ZWx5IGltcGFjdGVkLiBJdAo+IGlz
IGFjdHVhbGx5IGluIHRoZSBpbnRlcmVzdCBvZiBlYWNoIHBhcnRpY2lwYW50IHRvIGltcHJvdmUg
dG8gYXZvaWQgZnJpY3Rpb24sCj4gc3RyZXNzLCBldGMuCj4gCj4gSSBob3BlIHRoYXQgd2UgY2Fu
IGFwcHJvdmUgdGhlIHNlcmllcyB3aXRob3V0IHRoZSBmaXJzdCBwYXJ0LCBidXQgSSBkbyBub3Qg
bWluZAo+IGlmIHBlb3BsZSBmZWVsIHRoaXMgbmVlZHMgdG8gYmUgZG9uZSBpbiBvbmUgZ28uCgpU
aGUgY3VycmVudCBkb2N1bWVudCBMR1RNLCBJIGp1c3QgaGF2ZSBvbmUgc3R5bGUgbml0LgoKVGhh
bmtzIGZvciBkb2luZyB0aGlzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
