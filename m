Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EE13DFCE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:19:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7p0-0001Pk-Vk; Thu, 16 Jan 2020 16:16:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1k4+=3F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1is7oy-0001Pd-Uf
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:16:36 +0000
X-Inumbo-ID: 8c4493ec-387b-11ea-a2eb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c4493ec-387b-11ea-a2eb-bc764e2007e4;
 Thu, 16 Jan 2020 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579191387;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4BupgUYZn9/3jY5VsP8g5Hczs5rLTvBfOSbmsX5r+Gw=;
 b=JinpAtbrin3uV1ej9MYutQGYdV9us+dRjRnqcIb5xO7D9Affwy7BADQZ
 RvvpcaiEzY/mmaxGda/LQ0T9ryYyyyNFLFkIyAr1Yu4fgnmvqa5+HGJIR
 XW3ZpoKsEBKppwRe+uhuZKIgKxvuKpN6sBU7ArWVL7K9HdnFUMoW4EktO A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 72WNFQ/b2uzURPdA+juN5T+BAZ2wRekQsQSMQ6WnezhB8qOhkHghJcxsFz0gsNh6dWeX5WeY6E
 n9K3O8InYE/9QBGPXt7Ld7/VIusuZO8vhrNAZ4C0Hblh7tUChFD1sdsxllwq4TetyGWgDCls7g
 /WvQH54gXsHENfXPRwaFYDdUMrpwwdQDLQnyo9OFt6eRIDp2FH77AICekKu2k8FRSq/rHpn/PP
 VVRTDzikcWeZNofAQPCxOlUn0XZfhVP3ACy6WRiQtjxKpHdq28lU7O/dGu+3SBUsJ8hNFpRH3k
 /As=
X-SBRS: 2.7
X-MesageID: 11617165
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,326,1574139600"; d="scan'208";a="11617165"
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <40176a33-924e-8e81-7231-1b8df8b5e69f@citrix.com>
Date: Thu, 16 Jan 2020 16:16:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/sm{e,
 a}p: do not enable SMEP/SMAP in PV shim by default on AMD
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDEvMjAyMCAxNjowMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gRHVlIHRvIEFNRCBh
bmQgSHlnb24gYmVpbmcgdW5hYmxlIHRvIHNlbGVjdGl2ZWx5IHRyYXAgQ1I0IGJpdCBtb2RpZmlj
YXRpb25zCj4gcnVubmluZyAzMi1iaXQgUFYgZ3Vlc3QgaW5zaWRlIFBWIHNoaW0gY29tZXMgd2l0
aCBzaWduaWZpY2FudCBwZXJmb3JtYW5jZQo+IGhpdC4gTW9yZW92ZXIsIGZvciBTTUVQIGluIHBh
cnRpY3VsYXIgZXZlcnkgdGltZSBDUjQuU01FUCBjaGFuZ2VzIG9uIGNvbnRleHQKPiBzd2l0Y2gg
dG8vZnJvbSAzMi1iaXQgUFYgZ3Vlc3QsIGl0IGdldHMgdHJhcHBlZCBieSBMMCBYZW4gd2hpY2gg
dGhlbgo+IHRyaWVzIHRvIHBlcmZvcm0gZ2xvYmFsIFRMQiBpbnZhbGlkYXRpb24gZm9yIFBWIHNo
aW0gZG9tYWluLiBUaGlzIHVzdWFsbHkKPiByZXN1bHRzIGluIGV2ZW50dWFsIGhhbmcgb2YgYSBQ
ViBzaGltIHdpdGggYXQgbGVhc3Qgc2V2ZXJhbCB2Q1BVcy4KPgo+IFNpbmNlIHRoZSBvdmVyYWxs
IHNlY3VyaXR5IHJpc2sgaXMgZ2VuZXJhbGx5IGxvd2VyIGZvciBzaGltIFhlbiBhcyBpdCBiZWlu
Zwo+IHRoZXJlIG1vcmUgb2YgYSBkZWZlbnNlLWluLWRlcHRoIG1lY2hhbmlzbSwgY2hvb3NlIHRv
IGRpc2FibGUgU01FUC9TTUFQIGluCj4gaXQgYnkgZGVmYXVsdCBvbiBBTUQgYW5kIEh5Z29uIHVu
bGVzcyBhIHVzZXIgY2hvc2Ugb3RoZXJ3aXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gSSdtIGEgbGl0dGxlIGJp
dCBvbiB0aGUgZmVuY2Ugd2l0aCB0aGlzIG9uZS4gV2UncmUgaGF2aW5nIHRoZSBzYW1lIGlzc3Vl
IHdpdGgKPiBnZW5lcmFsIG5lc3RlZCB2aXJ0IGJ1dCBJJ20gbm90IGluY2xpbmVkIHRvIHRyYWRl
IHNlY3VyaXR5IGZvciBhIHVzZXIgaW4KPiBnZW5lcmFsIGNhc2UuIERpc2FibGluZyBpdCBieSBk
ZWZhdWx0IGZvciBQViBzaGltIG9ubHkgc2VlbXMgcmF0aGVyIGlub2N1b3VzCj4gZHVlIHRvIHRo
ZSB1c2UgY2FzZSByZXN0cmljaW9uLiBJJ2QgbGlrZSB0byBoZWFyIG1vcmUgb3BpbmlvbnMuCgpT
byBldmVyeW9uZSBvbiB0aGUgbGlzdCBpcyB1cCB0byBkYXRlIHdpdGggdGhlIGRpc2N1c3Npb24g
d2UgaGFkIElSTC4KClNNRVAvU01BUCBhcmUgZGVmZW5jZSBpbiBkZXB0aCBtZWFzdXJlcy7CoCBX
ZSBzdXBwb3J0IHJ1bm5pbmcgb24gaGFyZHdhcmUKd2l0aG91dCB0aGVzZSBmZWF0dXJlcywgYW5k
IHRoZSBvdmVyYWxsIHJlc3VsdCBpcyB0aGUgc2FtZSwgc2VjdXJpdHkgd2lzZS4KCkluIHRoZSBQ
ViBTaGltIGNhc2UsIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgZ3Vlc3QgYW5kIG5vdGhpbmcKaW50
ZXJlc3RpbmcgaW4gWGVuLCBkYXRhIHdpc2UuwqAgV2Ugc3BlY2lmaWNhbGx5IGRvIG5vdCBoYXZl
IHRoZSByaXNrIG9mCnNpZGV3YXlzIGRhdGEgbGVha2FnZSBmcm9tIG90aGVyIGd1ZXN0cyB0byBi
ZSB3b3JyaWVkIGFib3V0LgoKV2UgZG8gaG93ZXZlciBjYXJlIGZvciBwZXJmb3JtYW5jZSwgYW5k
IG5vdCB0YWtpbmcgYSBWTUV4aXQgb24gZXZlcnkKU1lTQ0FMTC9JbnRlcnJ1cHQvRXhjZXB0aW9u
IG1ha2VzIGEgbWFzc2l2ZSBkaWZmZXJlbmNlIG92ZXJhbGwuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
