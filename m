Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBBAFDE0D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:38:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVapS-0008Kn-GG; Fri, 15 Nov 2019 12:35:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVapR-0008Ki-3u
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:35:57 +0000
X-Inumbo-ID: 78129e26-07a4-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78129e26-07a4-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573821356;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GhWOjpETSaDDehNdVNk5bqiUFqfpqqAhi54xEI/ZdkY=;
 b=PgJRaw5eBD8PvAIn8cAXG1IZk/byEGsqKobWrdzl2/Ek9fIkfbn+oZoZ
 rXbnshUypKTObv+/3RPAwy3aKZzS1slonZvWD4eIIcbdTD1vp5B5MGaeX
 uGz+gNWgLUZQ8NtqrsZ9GaGCJvZKPi9+5LvRmK2Y7EwCUujWCemOABryO U=;
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
IronPort-SDR: rMpWdEML26nf8DVy+UUwJguKY4KQCOlQxXyOzY5lNhkox5U4RR4l4BrNQpqP1xgRiCuQ9GSZg/
 tYsC7ca+iahqGdi8ADPQpkd6PPgKYVwW2Rt9qcNWZa6B5G27RpRtiw4lF697Jl3qhvGJ2h7mx8
 CZfKkGqpIcdyPbmQYT1dwNVduBrIlqRwlcwSKDaONE2iu+9zIj6LTExnHW8WRtjQdw/0tCH164
 Nw60fwOhycdUozPGCethJKMcJlhzN3og2RSve4JjeHKK2oeQ7lH/akj0QIp4KjDNEt+YDB5mkp
 PrA=
X-SBRS: 2.7
X-MesageID: 8735074
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8735074"
To: Jan Beulich <jbeulich@suse.com>
References: <f70aa2a5-66f8-6915-c4a4-b1f701fe143c@suse.com>
 <8e004584-e45c-3989-2c7c-fd867122c7b3@citrix.com>
 <e254f63a-a35d-7f2a-5b4d-90d518f20fce@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b3b32bf1-c3ef-2c9d-3abc-0f7b30caadd3@citrix.com>
Date: Fri, 15 Nov 2019 12:35:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e254f63a-a35d-7f2a-5b4d-90d518f20fce@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/cpuidle: correct Cannon Lake residency
 MSRs
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTEvMjAxOSAwOTozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMTEuMjAxOSAy
MDoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTQvMTEvMjAxOSAxNToyMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBBcyBwZXIgU0RNIHJldiAwNzEgQ2Fubm9uIExha2UgaGFzCj4+PiAt
IG5vIENDMyByZXNpZGVuY3kgTVNSIGF0IDNGQywKPj4+IC0gYSBDQzEgcmVzaWRlbmN5IE1TUiBh
ciA2NjAgKGxpa2UgdmFyaW91cyBBdG9tcyksCj4+PiAtIGEgdXNlbGVzcyAoYWx3YXlzIHplcm8p
IENDMyByZXNpZGVuY3kgTVNSIGF0IDY2Mi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFVzaW5nIHRoZSBNU1IgY3Jvc3Mg
cmVmZXJlbmNlIGluIHRoZSBzYW1lIFNETSByZXZpc2lvbiBvbmUgbWlnaHQgZXZlbgo+Pj4gZ2V0
IHRoZSBpbXByZXNzaW9uIHRoYXQgZnVydGhlciBNU1JzIGFyZSB1bmF2YWlsYWJsZSwgYnV0IG5l
d2VyIENQVXMKPj4+IGRvbid0IGFwcGVhciB0byBiZSBjb25zaXN0ZW50bHkgbGlzdGVkIHRoZXJl
IGF0IGFsbCwgc28gbWF5IHJhdGhlciBiZSBhCj4+PiBkb2Mgc2hvcnRjb21pbmcuIEkndmUgcG9p
bnRlZCB0aGlzIG91dCB0byBJbnRlbCwgYnV0IEknbSBub3QgZXhwZWN0aW5nCj4+PiBzd2lmdCBm
ZWVkYmFjay4KPj4gV2UgbWlnaHQgY29uc2lkZXIgZHJvcHBpbmcgQ2Fubm9uIExha2UuwqAgSXQg
ZGlkIHNoaXAgMSBsaW1pdGVkLXJlbGVhc2UKPj4gcGFydHMsIGJ1dCBvbmx5IGZvciBsYXB0b3Av
dGFibGV0IFNLVXMsIGFuZCB0aGVyZSBpcyBhIHJlYXNvbiB3aHkgaXQgaGFzCj4+IGJlZW4gdG90
YWxseSBkaXNjb250aW51ZWQuCj4gSG93IHdvdWxkIHlvdSBlbnZpc2lvbiAiZHJvcHBpbmciIHRv
IGxvb2sgbGlrZTogRG8geW91IG1lYW4ganVzdCB0bwo+IHJlbW92ZSB0aGUgY2FzZSBsYWJlbCBo
ZXJlIChhbmQgcGVyaGFwcyBzaW1pbGFyIG9uZXMgZWxzZXdoZXJlKSwgb3IKPiBvdXRyaWdodCBy
ZWZ1c2UgYm9vdGluZyBvbiBpdD8KCkp1c3QgZHJvcHBpbmcgdGhlIGNhc2UgbGFiZWxzLsKgIE5v
IHBvaW50IGdvaW5nIG91dCBvZiB0aGUgd2F5IHRvCnByb2hpYml0IGJvb3RpbmcgYXMsIGV2ZW4g
d2l0aCB0aGVzZSBkcm9wcGVkLCB0aGUgcmVzdWx0IHdvdWxkIGJlCmdlbmVyYWxseSB1c2FibGUu
Cgo+IEluIGJvdGggY2FzZXMgaWYgSSB3ZXJlIHRvIHN1Ym1pdCBzdWNoIGEgY2hhbmdlIEknbSBh
ZnJhaWQgSSdkIHdhbnQKPiB0byBiZSBhIGxpdHRsZSBsZXNzIHZhZ3VlIGluIHRoZSBkZXNjcmlw
dGlvbiB0aGFuIHRvIGp1c3Qgc2F5ICJ0aGVyZQo+IGlzIGEgcmVhc29uIHdoeSBpdCBoYXMgYmVl
biB0b3RhbGx5IGRpc2NvbnRpbnVlZCIuCgpJdHMgbm90IHJlYWxseSBhIHNlY3JldC7CoCBJdCB3
YXMgYW4gZXhwZXJpbWVudCB3aXRoIGEgMTBubSBsaXRob2dyYXBoeQpwcm9jZXNzIHdoaWNoIGRp
ZG4ndCBwYW4gb3V0LsKgIEl0IGhhcyBiZWVuIGZvcm1hbGx5IGRpc2NvbnRpbnVlZC4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
