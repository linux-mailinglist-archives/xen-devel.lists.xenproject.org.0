Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBBD2973
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 14:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIXTt-0006gU-Nu; Thu, 10 Oct 2019 12:23:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U9SU=YD=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iIXTs-0006gP-LG
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 12:23:44 +0000
X-Inumbo-ID: cb46afc8-eb58-11e9-9bee-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb46afc8-eb58-11e9-9bee-bc764e2007e4;
 Thu, 10 Oct 2019 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570710222;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fPAPekFUulkcmP0+1ez5x/XtV33DFyBHT4u+Q8gca64=;
 b=MMTOTqDIn/tHZTNrVVRsWtLt+wF2vBfB99Rl2NQHGhOfccbC9m84/hr2
 Qb7acNrYu9uKKyIQzmwGE9tb0/Sw076DHwYXST+cAaG+s7EQqOob4tzym
 Rh/VnMXdIlRPo2UM2J6vG6BRm/6FPM63R1Nqyh67RyXBf92AANg/iHASu o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PdPLyItKj4OqMWQ3sbFe39dDUEmx5JoRAOuhRMQeF/ufq+/z7U5R63fBSo+bOOCe1jCF3KEDuV
 UMoOzpUrsi3rOBMDQT8MCgE8m4ILcxQlOV7XDH6CVn76aES4VIdNy8v+s7vszunRu9/FAJDsOb
 e61wT6AD07771Rr0ZtGNgZSducQEwUlP/ed+Pduf+ofHa07x6im4tiByTo/CwL37YVNtWnfwwC
 c9QHluamPumyIPGiakRNyz5oF7wDNSdpr+j4kgGjb9cEqMl0ahre9L3kGOdYazH5Dy51qgIGiq
 pro=
X-SBRS: 2.7
X-MesageID: 6709362
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6709362"
To: Jan Beulich <jbeulich@suse.com>
References: <1570653603-9889-1-git-send-email-igor.druzhinin@citrix.com>
 <1570653603-9889-3-git-send-email-igor.druzhinin@citrix.com>
 <4f9287bd-1cdf-915b-2d8e-7fb7adbe3f1a@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3cda07ed-b685-2fcb-a6b4-04ac5d5c56b8@citrix.com>
Date: Thu, 10 Oct 2019 13:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4f9287bd-1cdf-915b-2d8e-7fb7adbe3f1a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/3] x86/efi: properly handle 0
 in pixel reserved bitmask
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTAvMjAxOSAwODoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMTAuMjAxOSAy
Mjo0MCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZp
LWJvb3QuaAo+PiArKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKPj4gQEAgLTUyOCw5
ICs1MjgsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9hcmNoX3ZpZGVvX2luaXQoRUZJX0dS
QVBISUNTX09VVFBVVF9QUk9UT0NPTCAqZ29wLAo+PiAgICAgICAgICBicHAgPSBzZXRfY29sb3Io
bW9kZV9pbmZvLT5QaXhlbEluZm9ybWF0aW9uLkJsdWVNYXNrLCBicHAsCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAmdmdhX2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLmJsdWVfcG9zLAo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgJnZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5ibHVl
X3NpemUpOwo+PiAtICAgICAgICBicHAgPSBzZXRfY29sb3IobW9kZV9pbmZvLT5QaXhlbEluZm9y
bWF0aW9uLlJlc2VydmVkTWFzaywgYnBwLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgJnZn
YV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5yc3ZkX3BvcywKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICZ2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9zaXplKTsKPj4gKyAgICAg
ICAgaWYgKCAhbW9kZV9pbmZvLT5QaXhlbEluZm9ybWF0aW9uLlJlc2VydmVkTWFzayApCj4+ICsg
ICAgICAgIHsKPj4gKyAgICAgICAgICAgIHZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5yc3Zk
X3BvcyA9IDA7Cj4+ICsgICAgICAgICAgICB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2
ZF9zaXplID0gMDsKPj4gKyAgICAgICAgfQo+PiArICAgICAgICBlbHNlCj4+ICsgICAgICAgICAg
ICBicHAgPSBzZXRfY29sb3IobW9kZV9pbmZvLT5QaXhlbEluZm9ybWF0aW9uLlJlc2VydmVkTWFz
aywgYnBwLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ2Z2FfY29uc29sZV9pbmZv
LnUudmVzYV9sZmIucnN2ZF9wb3MsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnZn
YV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5yc3ZkX3NpemUpOwo+IAo+IFdoeSBub3Qgc2ltcGx5
Cj4gCj4gICAgICAgICBpZiAoIG1vZGVfaW5mby0+UGl4ZWxJbmZvcm1hdGlvbi5SZXNlcnZlZE1h
c2sgKQo+ICAgICAgICAgICAgIGJwcCA9IHNldF9jb2xvcihtb2RlX2luZm8tPlBpeGVsSW5mb3Jt
YXRpb24uUmVzZXJ2ZWRNYXNrLCBicHAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ2
Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9wb3MsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICZ2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIucnN2ZF9zaXplKTsKPiAKPiA/
IFRoZXJlJ3Mgbm90aGluZyBJIGNhbiBzZWUgd2hpY2ggbWlnaHQgaGF2ZSBjaGFuZ2VkCj4gdmdh
X2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLnJzdmRfe3BvcyxzaXplfSBmcm9tIGl0cyB6ZXJvLWlu
aXRpYWxpemVkCj4gdmFsdWUuIFdpdGggdGhpcyBhZGp1c3RtZW50ICh3aGljaCBjb3VsZCBiZSBk
b25lIHdoaWxlIGNvbW1pdHRpbmcpIG9yCj4gd2l0aCBhIHJlYXNvbiBzdXBwbGllZCBmb3IgdGhl
IG1vcmUgY29tcGxleCBjb2RlCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiAKCkRpZG4ndCBub3RpY2UgaXQgd2FzIGFjdHVhbGx5IHN0YXRpY2FsbHkgemVy
by1pbml0aWFsaXplZC4gUGVyZmVjdGx5CmZpbmUgd2l0aCB0aGUgc3VnZ2VzdGVkIGNoYW5nZS4K
Cklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
