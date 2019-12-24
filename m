Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB112A317
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 17:03:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijmbq-00061p-2b; Tue, 24 Dec 2019 16:00:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijmbo-00061k-F8
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 16:00:32 +0000
X-Inumbo-ID: 825a7b71-2666-11ea-97f4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 825a7b71-2666-11ea-97f4-12813bfff9fa;
 Tue, 24 Dec 2019 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577203231;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3IYsonmi0gLwqPnqsJXQEqbXj38pI+F0FPOL1h+vXqk=;
 b=QVXcrecjXmPpdjZESlCH7YojlzF3iiEFgktLXJcIJYmrL+FbVsHj3T3X
 X3tXABezTQzKNNwMxXu7/22KtTTvLEaKpGiYTvM0w3UH2v/cADqWcLkMa
 iP4mlUFr6ar5WVCz7v/rVvCYGT0F8pkiNIucJf+/yOspmw/MjT6j69a5k E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yyTXnPvUfyIVsidBTyjEPbecJKk8ytKARltQxUB971T1pDIJ4jUvG6tEfa9Yu2+vKPv06l0uvp
 MFhljXOIZz3WY+PTyxvJ/mexpnXVZdIMEa/12z+W7EolnplUukpLISf1Bqn7f2qbIgBJWt7pyR
 caB5EJCmg5qRDBfswHe3bObWqANvwxJ+tqXFv7HzXnG0qAboLqav386W/t07fiNs8eKHnEb1oD
 xZdHh/DU7+rw4reilX7g+2FYSktECDbvkasw/txQE+amkSek3rAGNS1snSNbFzLxJ4RvS2SKf1
 Tok=
X-SBRS: 2.7
X-MesageID: 10483956
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10483956"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191224101810.45915-1-roger.pau@citrix.com>
 <8264d39f-4f5e-e7c0-f0e0-6be23feba3c3@citrix.com>
 <20191224124258.GC11756@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <950e6538-40f4-c698-75d9-f532bccfae52@citrix.com>
Date: Tue, 24 Dec 2019 16:00:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191224124258.GC11756@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/hvm: always expose x2APIC feature in
 max HVM cpuid policy
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMTIvMjAxOSAxMjo0MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAyNCwgMjAxOSBhdCAxMjoyMzoxMlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAyNC8xMi8yMDE5IDEwOjE4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBPbiBoYXJkd2Fy
ZSB3aXRob3V0IHgyQVBJQyBzdXBwb3J0IFhlbiBlbXVsYXRlZCBsb2NhbCBBUElDIHdpbGwKPj4+
IHByb3ZpZGUgc3VjaCBtb2RlLCBhbmQgaGVuY2UgdGhlIGZlYXR1cmUgc2hvdWxkIGJlIHNldCBp
biB0aGUgbWF4aW11bQo+Pj4gSFZNIGNwdWlkIHBvbGljeS4KPj4+Cj4+PiBOb3QgZXhwb3Npbmcg
aXQgaW4gdGhlIG1heGltdW0gcG9saWN5IHJlc3VsdHMgaW4gSFZNIGRvbWFpbnMgbm90Cj4+PiBn
ZXR0aW5nIHN1Y2ggZmVhdHVyZSBleHBvc2VkIHVubGVzcyBpdCdzIGFsc28gc3VwcG9ydGVkIGJ5
IHRoZQo+Pj4gdW5kZXJseWluZyBoYXJkd2FyZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4geDJhcGljIGhhcyBuZXZlciBi
ZWVuIGV4cG9zZWQgdmlhIHRoaXMgbWVjaGFuaXNtLCBkdWUgdG8gaXRzIGVmZmVjdHMgb24KPj4g
dG9wb2xvZ3kgY2FsY3VsYXRpb25zLgo+IFdlbGwsIGl0J3MgZXhwb3NlZCBpbiBodm1fbWF4X2Nw
dWlkX3BvbGljeSBpZiBpdCdzIHByZXNlbnQgaW4gdGhlCj4gaGFyZHdhcmUuIElNTyBpdCdzIGtp
bmQgb2Ygd2VpcmQgdGhhdCB0aGUgcHJlc2VuY2Ugb2YgdGhlIHgyQVBJQyBmZWF0dXJlCj4gb24g
dGhlIG1heCBwb2xpY3kgZGVwZW5kcyBvbiB0aGUgdW5kZXJseWluZyBoYXJkd2FyZSwgd2hlbiBp
dCdzIGFsd2F5cwo+IHN1cHBvcnRlZCBieSB0aGUgZW11bGF0ZWQgdmxhcGljLgo+Cj4gSSB0aGlu
ayB4MkFQSUMgbXVzdCBlaXRoZXIgYWx3YXlzIGJlIHBhcnQgb2YgdGhlIG1heCBwb2xpY3ksIG9y
IG5ldmVyLAo+IG9yIGVsc2UgaXQncyB2ZXJ5IGVhc3kgdG8gY2F1c2UgcmVncmVzc2lvbnMgYmVj
YXVzZSBpdCdzIG5vdCBzbyBlYXN5Cj4gdG8gZmluZCBhIGJveCB3aXRob3V0IHgyQVBJQy4KCkht
bSAtIHRoaXMgZG9lcyBoaWdobGlnaHQgdGhlIGluY29uc2lzdGVuY3kgaW4gdGhlIGV4aXN0aW5n
IGxvZ2ljLsKgIEknbQpub3Qgb3Zlcmx5IHN1cnByaXNlZCAtIHRoaXMgaXMgYSByZW1uYW50IG9m
IHRoZSBvbGQgbW9kZWwgd2hpY2ggaGFzbid0CmJlZW4gcmV3cml0dGVuIHlldC4KCj4KPj4gSXQg
aGFzIGhvd2V2ZXIgYWx3YXlzIGJlZW4gZG93biB0byB0aGUgdG9vbHN0YWNrIHRvIG9wdCBpbiwg
YW5kIFhlbgo+PiBwZXJtaXRzIHRoaXMgdmlhIHJlY2FsY3VsYXRlX2NwdWlkX3BvbGljeSgpLCBv
biB0aGUgZXhwZWN0YXRpb24gdGhhdCB0aGUKPj4gdG9vbHN0YWNrIGtuZXcgd2hhdCBpdCB3YXMg
ZG9pbmcgV1JUIHRvcG9sb2d5IChhbGwgZXZpZGVuY2UgYWN0dWFsbHkgdG8KPj4gdGhlIGNvbnRy
YXJ5KS4KPiBIbSwgSSBjYW4gdHJ5IHRvIGZvcmNlIHRoZSBzZXR0aW5nIGluIGxpYnhjLgo+Cj4+
IElmIHdlJ3JlIHNlZWluZyBhIHJlY2VudCBjaGFuZ2UgaW4gYmVoYXZpb3VyLCB0aGVuIGl0IHdp
bGwgYmUgZnJvbSBsaWJ4Yy4KPiBJSVJDIHgyQVBJQyB3YXMgYWx3YXlzIGV4cG9zZWQgdG8gSFZN
IGd1ZXN0cyByZWdhcmRsZXNzIG9mIHRoZQo+IHVuZGVybHlpbmcgaGFyZHdhcmUgc3VwcG9ydC4K
CkkgaGF2ZSBhIHN1c3BpY2lvbiB0aGF0IHRoaXMgbWF5IGhhdmUgYmVlbiBicm9rZW4gYnkgYy9z
IDNlMGM4MjcyZiBpbgoyMDE1Li4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
