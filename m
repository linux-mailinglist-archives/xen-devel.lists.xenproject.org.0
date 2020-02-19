Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66439164351
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:27:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4NSF-00021r-0o; Wed, 19 Feb 2020 11:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8+/=4H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j4NSE-00021m-39
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:23:46 +0000
X-Inumbo-ID: 4a0accfe-530a-11ea-bc8e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a0accfe-530a-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582111425;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oRqIHbRwbHEAjY8jwDQS3CsviZ2tQZdC4UG2OeiFq+g=;
 b=czg6d5KRQq0BC5UN42VzBdZqFQ7+5NTzRJ3qF0vL491oJVYgUhL2IBB0
 6WmGZxrAj912YqL3/wMsDHeo5DLWUliGkSUlwXCx1eChzUo3ZzzlYxj6F
 cYkKnau/L1cl8gPjt2KwussjYBt6R+40nAv470DN2E1N/NKXrQz+7ch5r k=;
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
IronPort-SDR: M8TiydU6e0BnBcTq8AN4hzXoFaQFr/okxdkiehY9N8XcXdjOkJDBWuryQbkJBt7G/3Po4m67Jg
 fZH+oJ7WIvcjyo3I+o8xjCYO1XkCS0kWUAMBcIHlB/2IBy6UfmY0QtannD3W/VYS/Re1ZzKj4O
 Zi+XP3F6IThnnhJbCRaYsQ8Tnx/gOBlxvleD4bu4aMNq5sqRdX79MeImujdsTdDl4vNKdyM+rA
 WplFQD2qzPsVkeJdwGZeEN2fe87xum3MYxuw79MhoZMilOxfVnOZfuiI3qDGRCcwmS5i2M/p7P
 Rwc=
X-SBRS: 2.7
X-MesageID: 13040575
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13040575"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200219111904.82092-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <02015cac-7bce-7247-9861-f0da21f86a3d@citrix.com>
Date: Wed, 19 Feb 2020 11:23:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219111904.82092-1-roger.pau@citrix.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] amd/iommu: add missing unlock in
 iommu_read_log
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
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDIvMjAyMCAxMToxOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFJlcG9ydGVkLWJ5
OiBDb3Zlcml0eQo+IENJRDogMTQ1ODYzMgoKV2UgdGVuZCB0byB1c2UganVzdCBDb3Zlcml0eS1J
RDogMTQ1ODYzMgoKPiBGaXhlczogNzA5ZDNkZGVhMmQ1ZSAoJ0FNRC9JT01NVTogQ29tbW9uIHRo
ZSAjNzMyLyM3MzMgZXJyYXRhIGhhbmRsaW5nIGluIGlvbW11X3JlYWRfbG9nKCknKQo+IFNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+
ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jIHwgMSArCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQv
aW9tbXVfaW5pdC5jCj4gaW5kZXggNGM4Njg0OGM1Mi4uZTkzYTA5MDgzMCAxMDA2NDQKPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+IEBAIC0zMzgsNiArMzM4LDcgQEAg
c3RhdGljIGludCBpb21tdV9yZWFkX2xvZyhzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwKPiAgICAg
ICAgICAgICAgewo+ICAgICAgICAgICAgICAgICAgQU1EX0lPTU1VX0RFQlVHKCJBTUQtVmk6IE5v
IGVudHJ5IHdyaXR0ZW4gdG8gJXMgTG9nXG4iLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxvZyA9PSAmaW9tbXUtPmV2ZW50X2xvZyA/ICJFdmVudCIgOiAiUFBSIik7Cj4gKyAg
ICAgICAgICAgICAgICBzcGluX3VubG9jaygmbG9nLT5sb2NrKTsKCkEgZ290byBvdXQgd291bGQg
YmUgY2xlYW5lci7CoCBDYW4gZml4IHVwIG9uIGNvbW1pdCBpZiB5b3UncmUgaGFwcHk/Cgp+QW5k
cmV3Cgo+ICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICAgICAgIH0KPiAgICAg
ICAgICAgICAgdWRlbGF5KDEpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
