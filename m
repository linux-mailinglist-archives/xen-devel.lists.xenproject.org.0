Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E3EC4A47
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:12:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFae8-0005ko-ML; Wed, 02 Oct 2019 09:10:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G8yu=X3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iFae6-0005ki-M9
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:10:06 +0000
X-Inumbo-ID: 6c79ccba-e4f4-11e9-8628-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 6c79ccba-e4f4-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 09:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570007405;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=623LdmPzqrnvbrrTgfmjDHnBV6T0xY1aF+FHWUfNah4=;
 b=Zzd0qbKptiv3bUmcU9LEVIvkx2/zB7Ek+2GzdpdnSU3UWWXCvO5erd1e
 ET5Tn+oDGaySwtrRoms0YJiZP/d20pymOwOtW/oRodRspUXQFPdqAoQta
 7R0ZiTMcJ2Cv7MxojOWU2rE50cmsKhzJZBrz6jqyBYzghp5ReXNTBFYz7 E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kZRQkOuxZdAD18O/QC2y8KsJc004i81/9j1fk4LXebND4RJik2Xzzcv1Yay8Dwa7hburhzWwqC
 zeGBWDCD0C0rCbUzZ6UL8Dk79jVjcFoETPhGUzXC3JLmYfFr47b/+OkS7lI/stwrhV3GNuj2Sm
 ZKXzxonv/7suHHxjkikMWP/B0zKSl8u9SQP4hqS3LsmLd/xD35RfadioNwgPtGzDtfx3RdJQ5y
 94oyD0bPwJVHNg5yGUximjtESlDCpbbjpFFx2B+1hTv/PDotI+iG0IAcuLMor3ymAau4P24pli
 Ips=
X-SBRS: 2.7
X-MesageID: 6598310
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,573,1559534400"; 
   d="scan'208";a="6598310"
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
References: <20191001151159.861-1-paul.durrant@citrix.com>
 <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9ee3496a-66c6-f031-ca51-9dbe19bc5ead@citrix.com>
Date: Wed, 2 Oct 2019 10:10:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2857a023-87ed-8220-7b22-51f1048f9de6@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMTAvMjAxOSAwOTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDEuMTAuMjAxOSAx
NzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBOb3cgdGhhdCB4bC5jZmcgaGFzIGFuIG9wdGlv
biB0byBleHBsaWNpdGx5IGVuYWJsZSBJT01NVSBtYXBwaW5ncyBmb3IgYQo+PiBkb21haW4sIG1p
Z3JhdGlvbiBtYXkgYmUgbmVlZGxlc3NseSB2ZXRvZWQgZHVlIHRvIHRoZSBjaGVjayBvZgo+PiBp
c19pb21tdV9lbmFibGVkKCkgaW4gcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoKS4KPj4gVGhlcmUg
aXMgYWN0dWFsbHkgbm8gbmVlZCB0byBwcmV2ZW50IGxvZ2RpcnR5IGZyb20gYmVpbmcgZW5hYmxl
ZCB1bmxlc3MKPj4gZGV2aWNlcyBhcmUgYXNzaWduZWQgdG8gYSBkb21haW4gYW5kIHRoYXQgZG9t
YWluIGlzIHNoYXJpbmcgSEFQIG1hcHBpbmdzCj4+IHdpdGggdGhlIElPTU1VIChpbiB3aGljaCBj
YXNlIGRpc2FibGluZyB3cml0ZSBwZXJtaXNzaW9ucyBpbiB0aGUgUDJNIG1heQo+PiBjYXVzZSBE
TUEgZmF1bHRzKS4gSXQgaXMgcXVpdGUgcG9zc2libGUgdGhhdCBzb21lIGFzc2lnbmVkIGRldmlj
ZXMgbWF5Cj4+IHByb3ZpZGUgaW5mb3JtYXRpb24gYWJvdXQgd2hpY2ggcGFnZXMgbWF5IGhhdmUg
YmVlbiBkaXJ0aWVkIGJ5IERNQSB2aWEKPj4gYW4gQVBJIGV4cG9ydGVkIGJ5IHRoZWlyIG1hbmFn
aW5nIGVtdWxhdG9yLiBUaHVzIFhlbidzIGxvZ2RpcnR5IG1hcCBpcyBvbmx5Cj4+IG9uZSBzb3Vy
Y2Ugb2YgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgYXZhaWxhYmxlIHRvIHRoZSB0b29sc3RhY2sg
d2hlbgo+PiBwZXJmb3JtaW5nIGEgbWlncmF0aW9uIGFuZCBoZW5jZSBpdCBpcyB0aGUgdG9vbHN0
YWNrIHRoYXQgaXMgYmVzdCBwbGFjZWQKPj4gdG8gZGVjaWRlIHVuZGVyIHdoYXQgY2lyY3Vtc3Rh
bmNlcyBpdCBjYW4gYmUgcGVyZm9ybWVkLCBub3QgdGhlIGh5cGVydmlzb3IuCj4gV2hpbGUgSSdt
IGhhcHB5IGFib3V0IHRoZSBleHRlbmRlZCBkZXNjcmlwdGlvbiwgaXQncyBzdGlsbCB3cml0dGVu
IGluCj4gYSB3YXkgc3VnZ2VzdGluZyB0aGF0IHRoaXMgaXMgdGhlIG9ubHkgcG9zc2libGUgd2F5
IG9mIHZpZXdpbmcgdGhpbmdzLgo+IEFzIGV4cHJlc3NlZCBieSBHZW9yZ2UgYW5kIG1lLCBwdXR0
aW5nIHRoZSBoeXBlcnZpc29yIGluIGEgcG9zaXRpb24gdG8KPiBiZSBhYmxlIHRvIGp1ZGdlIGlz
IGF0IGxlYXN0IGFuIGFsdGVybmF0aXZlIHdvcnRoIGNvbnNpZGVyaW5nLgoKTm8sIGZvciBleGFj
dGx5IHRoZSBzYW1lIHJlYXNvbiBhcyBJJ20gcHVyZ2luZyB0aGUgZGlzYWJsZV9taWdyYXRlIGZs
YWcuCgpUaGlzIGlzIHRvdGFsbHkgYmFja3dhcmRzIHRoaW5raW5nLCBiZWNhdXNlIHRoZSBjaGVj
ayBpcyBpbiB0aGUgd3JvbmcgcGxhY2UuCgpUaGVyZSByZWFsbHkgYXJlIGNhc2VzIHdoZXJlIHRo
ZSB0b29sc3RhY2ssICphbmQgb25seSogdGhlIHRvb2xzdGFjayBpcwppbiBhIHBvc2l0aW9uIHRv
IGRldGVybWluZSBtaWdyYXRpb24gc2FmZXR5LsKgIFdoZW4gaXQgY29tZXMgdG8KZGlzYWJsZV9t
aWdyYXRlLCB0aGUgYXJlYSB1bmRlciBhcmd1bWVudCBpcyB0aGUgSVRTQyBmbGFnLCB3aGljaCAq
aXMqCnNhZmUgdG8gb2ZmZXIgb24gbWlncmF0ZSBmb3IgdmlyaWRpYW4gZ3Vlc3RzIHdoaWNoIGFy
ZSBrbm93biB0byB1c2UKcmVmZXJlbmNlX3RzYywgb3IgaWYgdGhlIGRlc3RpbmF0aW9uIGhhcmR3
YXJlIHN1cHBvcnRzIHRzYyBzY2FsaW5nLsKgCihIaWxhcmlvdXNseSwgbm90aGluZywgbm90IGV2
ZW4gdGhlIHRvb2xzdGFjaywgcHJvaGliaXRzIG1pZ3JhdGlvbiBiYXNlZApvbiBYZW4ncyBuby1t
aWdyYXRlIGZsYWcsIGJlY2F1c2UgaXRzIGEgd3JpdGUtb25seSBmaWVsZCB3aGljaCBjYW4ndCBi
ZQpyZXRyaWV2ZWQgYnkgdGhlIHRvb2xzLikKClRoZSB0d28gb3B0aW9ucyBhcmU6CgoxKSBOZXcg
aHlwZXJjYWxsLApET01DVExfdGhlX3Rvb2xzdGFja19rbm93c193dGZfaXRzX2RvaW5nX3NvX2xl
dF90aGVfZG9pbWFpbl9taWdyYXRlLAp3aGljaCBkaXNhYmxlcyB0aGUgdmV0b3MsCgpvcgoKMikg
RGVsZXRlIHRoZSBlcnJvbmVvdXMgdmV0b3MsIGFuZCB0cnVzdCB0aGF0IHRoZSB0b29sc3RhY2sg
a25vd3Mgd2hhdAppdCBpcyBkb2luZywgYW5kIHdpbGwgb25seSBpbml0aWF0ZSBhIG1pZ3JhdGUg
aW4gc2FmZSBzaXR1YXRpb25zLgoKT3B0aW9uIDIgaGFzIHRoZSBzYWZldHkgY2hlY2tzIHBlcmZv
bWVkIGF0IHRoZSBsZXZlbCB3aGljaCBpcyBhY3R1YWxseQpjYXBhYmxlIG9mIGNhbGN1bGF0aW5n
IHRoZSByZXN1bHRzIGNvcnJlY3RseS4KCk9uZSBvZiB0aGVzZSBvcHRpb25zIGlzIHN1YnN0YW50
aWFsbHkgbGVzcyBib25lLWhlYWRlZCB0aGFuIHRoZSBvdGhlci4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
