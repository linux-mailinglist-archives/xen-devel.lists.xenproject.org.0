Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886EC16FB8F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:03:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6tT1-0008Ss-S5; Wed, 26 Feb 2020 09:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j6tT0-0008Sn-IL
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 09:58:58 +0000
X-Inumbo-ID: 9ac247ca-587e-11ea-aba8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ac247ca-587e-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582711138;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vGkB4QKJjbOLTiaVX6IQkWa3kolmxYhmfv3H6hueXCo=;
 b=VygwkO9vVGje+6PDvpx1CiGirfHmsRUvIwV1QBnQ8819TgbPQQuz5tdZ
 NF3kRV9vBXlES9ZvqcAbCUb3W5q4VSZhHsBW+cQjEWQ02yK9p2tEaRyep
 h2TDT24U0Ps5EHLzLaAOx4iPHuaoXmsjJsvGNP+Y2YavnnXym/iciK0rO Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OHzENt7kVu/EGM1PzgJY8GbFzslCgSZ72VRkdMM7TMF5Gd/xGN+2pnLvdFgkk0ROj9XcU4S/e+
 dty1XAXsbq7e/uNyoA0d7/NGicDAAWKtiUKZpPZaQ01yLFEJvXcDHmG0FbUz18oQd+MnrtscyH
 B5ZPG3H4WSDA8va1tWKqVwlHhOnKyX7VcOUUGFGc35Uw7QGp/5Xsi37/jvX9q6VST/9yJp6ge9
 FzdqFzOjt17UgVgDlCh4lBF4ete/N8Ir/E+r4HY4QWoYilC6+LP7R3wFR+o+R5Rx1FNDAifbUO
 aP8=
X-SBRS: 2.7
X-MesageID: 13008803
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13008803"
To: Jan Beulich <jbeulich@suse.com>
References: <20200225173133.3632-1-andrew.cooper3@citrix.com>
 <01fc1f0d-3889-32d0-de38-187a7d12f67d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f6517884-a20d-60ba-59e7-83ce7017f949@citrix.com>
Date: Wed, 26 Feb 2020 09:58:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <01fc1f0d-3889-32d0-de38-187a7d12f67d@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/sysctl: Don't return cpu policy data
 for compiled-out support
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDIvMjAyMCAwOTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMDIuMjAyMCAx
ODozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gUG9saWN5IG9iamVjdHMgYXJlbid0IHRpbnks
IGFuZCB0aGUgZGVyaXZhdGlvbiBsb2dpYyBpc24ndCB0cml2aWFsLiAgV2UgYXJlCj4+IGFib3V0
IHRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2YgcG9saWN5IG9iamVjdHMsIHNvIHRha2UgdGhpcyBv
cHBvcnR1bml0eSB0bwo+PiBkcm9wIGxvZ2ljIGFuZCBzdG9yYWdlIHNwYWNlIGJhc2VkIG9uIENP
TkZJR197UFYsSFZNfS4KPiBJdCBkb2Vzbid0IGxvb2sgYXMgaWYgeW91IHdlcmUgZHJvcHBpbmcg
ZWl0aGVyIGxvZ2ljIG9yIHN0b3JhZ2Ugc3BhY2UuIFdpdGgKPiB0aGlzIGFzcGVjdCB0YWtlbiBj
YXJlIG9mIChieSBhZGp1c3Rpbmcgd29yZGluZywgb3IgYnkgY2xhcmlmaWNhdGlvbiBvZiB3aGF0
Cj4gaXMgbWVhbnQpIC4uLgo+Cj4+IFN0YXJ0IGJ5CgpUaGF0IGlzIHRoaXMgaXMgaGVyZSB0byBz
aWduaWZ5LgoKTm8gbG9naWMgb3Igc3RvcmFnZSBzcGFjZSBjYW4gYmUgZHJvcHBlZCB1bnRpbCBz
b21lICNpZmRlZi1hcnkgaXMKc3ByaW5rbGVkIGFyb3VuZCBjcHVpZC5jIGFuZCBtc3IuYywgYnV0
IEkgY2FuJ3QgZG8gYW55IG9mIHRoYXQgd2hpbGUKdGhlcmUgYXJlIHVuZ3VhcmRlZCBleHRlcm5h
bCByZWZlcmVuY2VzIHRvIHRoZSBvYmplY3RzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
