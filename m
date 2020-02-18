Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE87162B8E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 18:08:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j46KF-0000vm-7D; Tue, 18 Feb 2020 17:06:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/79L=4G=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j46KD-0000vh-Me
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 17:06:21 +0000
X-Inumbo-ID: fbbcbb46-5270-11ea-aa99-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbbcbb46-5270-11ea-aa99-bc764e2007e4;
 Tue, 18 Feb 2020 17:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582045580;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/a3AIYa0zkoQQ2ytUrSItnR/hNLPH4sjI7f9b7YFi/M=;
 b=BWAo+CXhvYRzFHG77FO4H055an0Ghksf2sSQI7wfrl9rP9FC9Kglypvi
 AgD/JYQnvWnJylx7VJVM9IV5v/AEOQ//k3F9p4KkEuDJHPVSDHZlzcLd3
 Hq0xFxWUZFzoEPY04KQCIeckUs93ZIm3GBRTPoio9Srdm9hssCEElDteV w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NxGVt+CiGTshZeYm9phMIr0qDSMDRDnCpgqRwhFvaN0UYqkjTo+Ymlo1Fz8fgtVBvQNyvSS3dU
 ZrRtIN/0UCXyzH5FPiBCZzNUM+lXNlioC+gvmBUBlOXgHoaBd9qtjyXtB9YkrE0nsF93xWWfh7
 zChvWuoknwqW1AVonHuqHrxHll+8V53N/L94YiadZhMUMzH/Vq6nwRKPLiXesZAI/pssYJkMhV
 I3gR1qFeaUpH7zindjQVtjqBZr3OCbEFea8JPGVvKj5KiAnP9usrO1858rZcfA0vYdi5sBxjdf
 S2M=
X-SBRS: 2.7
X-MesageID: 13257347
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="13257347"
To: Jan Beulich <jbeulich@suse.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
 <05c12542-950c-226a-aba5-f0346a5ff180@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <673c8202-2733-c816-634e-dc6be2c99581@citrix.com>
Date: Tue, 18 Feb 2020 17:06:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <05c12542-950c-226a-aba5-f0346a5ff180@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxNzowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMTIuMjAxOSAy
MjozOSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IFNpbWlsYXJseSB0byBQViB2VFNDIGVtdWxh
dGlvbiwgb3B0aW1pemUgSFZNIHNpZGUgZm9yIGNvbnNpc3RlbmN5Cj4+IGFuZCBzY2FsYWJpbGl0
eSBieSBkcm9wcGluZyBhIHNwaW5sb2NrIHByb3RlY3RpbmcgYSBzaW5nbGUgdmFyaWFibGUuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXgu
Y29tPgo+IAo+IFNlZWluZyB0aGF0IHlvdSBkaWRuJ3QgcmVwbHkgdG8gbXkgY29tbWVudCBzZW50
IG9uIERlYyAyM3JkLAo+IEknbSBnb2luZyB0byBkcm9wIHRoaXMgcGF0Y2ggbm93IGZyb20gbXkg
dG8tYmUtZGVhbHQtd2l0aAo+IGZvbGRlci4gWW91IGNhbiBhbHdheXMgcmUtc3VibWl0LgoKSSBk
aWRuJ3QgcmVjZWl2ZSBhbnl0aGluZy4gVGhpcyBpcyBsaXRlcmFsbHkgdGhlIGZpcnN0IHJlcGx5
IG9uIHRoZSB0aHJlYWQuClRoaXMgcGF0Y2ggd2Fzbid0IHRlcnJpYmx5IGltcG9ydGFudCBzbyBJ
IGRpZG4ndCBjaGFzZS4KQ291bGQgeW91IHJlc2VuZCB5b3VyIGNvbW1lbnQ/CgpJZ29yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
