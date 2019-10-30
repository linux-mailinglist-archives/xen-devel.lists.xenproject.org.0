Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D1E9ADB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 12:34:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPmCF-0003jC-Qm; Wed, 30 Oct 2019 11:31:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPmCD-0003j7-MO
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 11:31:25 +0000
X-Inumbo-ID: cbb451bc-fb08-11e9-9521-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbb451bc-fb08-11e9-9521-12813bfff9fa;
 Wed, 30 Oct 2019 11:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572435082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e4XXfMhjzkeXTTC/KL93nJwEe/oT3fRXJCJ0LBCJFsw=;
 b=OIL0DXyHBMCMlU8c/kwSrMs2KwoXoMBIp+RAbnnp+kERJEaAqceX5JYz
 xnRVW77bNsCOkTKlT3VzewkscEfd1GwQEyl4cSscRDeWJqvW18Pzf49Ni
 klZ0qQj6/dky8dt7WUp1uBFIrAt6jpYZpn4DvPK4/098cW6rzF/joEogS s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RGQ6j1ampaSQxLorejkH17tNjAtUahxVoKzjbsDUIRA1/FGjTT6yMd8wzT9WtjaeHOYD4N2442
 XN4929wkNYulnNEy+hkl+O3ZeKArzPRbcwAJrOej/2SMz/3oHhytYCng2vwPRX6z45DPr+92+X
 GHiTwv2eBj9N4AipmhRZ9Bs92Zja9rSSJacnC6I8gCzrxpnb3U3v1/cOI10bGuxzi+z2ND1Xra
 jlm8KlvpiPYIkZxjx3iXzh8hBwcf4hIRpHLTea4ABalfS14OxHkykT1S5Tfse/1UKoPDMwgraR
 5p4=
X-SBRS: 2.7
X-MesageID: 7612942
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="7612942"
Date: Wed, 30 Oct 2019 11:31:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191030113112.GE2381@perard.uk.xensource.com>
References: <23992.24295.523533.643279@mariner.uk.xensource.com>
 <20191029155436.14376-5-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029155436.14376-5-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 4/4] libxl: gentypes:
 initialise array elements in json
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDM6NTQ6MzZQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5IGIvdG9vbHMvbGlieGwv
Z2VudHlwZXMucHkKPiBpbmRleCAxMjQyODVjZDY2Li5jNzQ0NDVmMTZlIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL2xpYnhsL2dlbnR5cGVzLnB5Cj4gKysrIGIvdG9vbHMvbGlieGwvZ2VudHlwZXMucHkK
PiBAQCAtNDYxLDYgKzQ2MSwxMCBAQCBkZWYgbGlieGxfQ190eXBlX3BhcnNlX2pzb24odHksIHcs
IHYsIGluZGVudCA9ICIgICAgIiwgcGFyZW50ID0gTm9uZSwgZGlzY3JpbWluYQo+ICAgICAgICAg
IHMgKz0gIiAgICAgICAgZ290byBvdXQ7XG4iCj4gICAgICAgICAgcyArPSAiICAgIH1cbiIKPiAg
ICAgICAgICBzICs9ICIgICAgZm9yIChpPTA7ICh0PWxpYnhsX19qc29uX2FycmF5X2dldCh4LGkp
KTsgaSsrKSB7XG4iCj4gKyAgICAgICAgcyArPSBsaWJ4bF9DX3R5cGVfZG9faW5pdCh0eS5lbGVt
X3R5cGUsCj4gKyAgICAgICAgICAgICAgICAgICAgbGFtYmRhKGJ5KTogKCImIiBpZiBieSA9PSBp
ZGwuUEFTU19CWV9SRUZFUkVOQ0UgZWxzZSAiIikrCgpUaGUgc3ludGF4IGZvciB1c2luZyBgbGFt
YmRhJyBpcyB3aXRob3V0ICIoKSIgZm9yIHRoZSBsaXN0IG9mIHBhcmFtZXRlcnMuCnB5dGhvbjMg
Y29tcGxhaW5zIGFib3V0IGl0LgoKV2l0aCB0aGF0IGZpeDoKQWNrZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoIiVzW2ldIiAlIHYpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbmVlZF96ZXJvPUZhbHNlLCBpbmRlbnQ9aW5kZW50KyIgICAgIikKPiAgICAgICAgICBz
ICs9IGxpYnhsX0NfdHlwZV9wYXJzZV9qc29uKHR5LmVsZW1fdHlwZSwgInQiLCB2KyJbaV0iLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5kZW50ICsgIiAgICAiLCBw
YXJlbnQpCj4gICAgICAgICAgcyArPSAiICAgIH1cbiIKClRoYW5rcywKCi0tIApBbnRob255IFBF
UkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
