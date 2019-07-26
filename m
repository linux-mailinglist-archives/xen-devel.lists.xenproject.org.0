Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D476BEA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:45:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1QI-0005nS-Pt; Fri, 26 Jul 2019 14:42:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr1QH-0005nM-82
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:42:17 +0000
X-Inumbo-ID: 8fdbd574-afb3-11e9-8980-bc764e045a96
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8fdbd574-afb3-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:42:16 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id q22so105223827iog.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h36ZytJwQOAWf3GvDCtYV/lbW3HBVsHQmdHfmirK3xE=;
 b=bCFEKK0B2ta/4CRmGX0H8h9LvtBEPMgTNQeVXB7Ls68FcZ7v5ogvOzLVAu860lgsib
 iGdXLxrZl1LHq2mVHbjctuOfU/74INYAUxuac7xo4E/vLc4LnalQ66tsS4Zaf1X32XeC
 UMvJ4KVylJs8TxWkem+9gon/nvt8jtogzzw8+6WoIaEhfw09THx9aD/F6N6rQXpNdnRC
 c9E2gANfx7Ky+FzqbKuwtHj0hRnR6wDNdDKxaBTs4g6CxExCiDVi5va2imdMjkjF7sQj
 dONpWj9fqLYZjMCIhM80paHv+IqkfJiC53RR43PUcfrwKa3k6A/Dy7EOXd7fI2IEkQmg
 GegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h36ZytJwQOAWf3GvDCtYV/lbW3HBVsHQmdHfmirK3xE=;
 b=uGKvLSUYe5EyiQu+S5I0752lu4fYBnJ5CpWTvsIs119O/Qg5JqQIe1ZV5GfZJISG8u
 kq4cw+RnNDbPkiyv9P3SyKq1Lnk4uGvbEUeryUPMz/Vak4QOo7qx7BuM69ZZFyz++eDq
 igtv0qeezI4olEMQpUB4t2kPfUlLguM4S2Lz7V0ps7Uo4N/kPrOBcfeEJR1hexgYb5U3
 8GyJ+19JM25k7Hf+VqdJ3jyiVkPcD+CvQ4vcMKB2paV9UqYxvb8n6sDJsyAoriFRtAOT
 QBP6qer0WVc++VG/txr4l8TAhJtT6tvafZIlPkqZvoeA2BoIIOWDVxkjymjAC0pvJ2ob
 pKnw==
X-Gm-Message-State: APjAAAXqGBcd6HR+Rs2jGuujHM3zSKGMK/d5NvST7MgVdQYNXijP+KyB
 IRCLs4oHYC+KG0jCXLRIxfRAjzHzV7NpkAb8e8I=
X-Google-Smtp-Source: APXvYqxzjdt7vSfcH/ndW9hxnst1aJPoNvY9/yjwFRcS/bowo70gQWuU71vjf2kKjP30HOXpzguOfhQdQc1UclgyxQk=
X-Received: by 2002:a5e:9506:: with SMTP id r6mr22956241ioj.219.1564152135546; 
 Fri, 26 Jul 2019 07:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <642271a1-d9ca-adfc-c06b-cd05d266e53c@suse.com>
In-Reply-To: <642271a1-d9ca-adfc-c06b-cd05d266e53c@suse.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:42:04 +0300
Message-ID: <CAOcoXZZr+54R2i_aPNWDVXCoMxf5+ZZi=c4vthxaqa95_SP5Ww@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>, Lars Kurth <lars.kurth.xen@gmail.com>, 
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxsLAoKT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNjoxNiBQTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNjo0MywgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gLS0tIGEvQ09ESU5HX1NUWUxFCj4gPiArKysgYi9DT0RJTkdfU1RZ
TEUKPiA+IEBAIC02MCw4ICs2MCw4IEBAIEJyYWNpbmcKPiA+ICAgLS0tLS0tLQo+ID4KPiA+ICAg
QnJhY2VzICgneycgYW5kICd9JykgYXJlIHVzdWFsbHkgcGxhY2VkIG9uIGEgbGluZSBvZiB0aGVp
ciBvd24sIGV4Y2VwdAo+ID4gLWZvciB0aGUgZG8vd2hpbGUgbG9vcC4gIFRoaXMgaXMgdW5saWtl
IHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUgYW5kCj4gPiAtdW5saWtlIEsmUi4gIGRvL3doaWxlIGxv
b3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46Cj4gPiArZm9yIHRoZSB3aGlsZS1wYXJ0IG9mIGRv
L3doaWxlIGxvb3BzLiAgVGhpcyBpcyB1bmxpa2UgdGhlIExpbnV4IGNvZGluZyBzdHlsZQo+ID4g
K2FuZCB1bmxpa2UgSyZSLiAgZG8vd2hpbGUgbG9vcHMgYXJlIGFuIGV4Y2VwdGlvbi4gZS5nLjoK
PiA+Cj4gPiAgIGlmICggY29uZGl0aW9uICkKPiA+ICAgewo+ID4gQEAgLTc3LDcgKzc3LDggQEAg
d2hpbGUgKCBjb25kaXRpb24gKQo+ID4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gPiAgIH0KPiA+
Cj4gPiAtZG8gewo+ID4gK2RvCj4gPiArewo+ID4gICAgICAgLyogRG8gc3R1ZmYuICovCj4gPiAg
IH0gd2hpbGUgKCBjb25kaXRpb24gKTsKPgo+IEkgZGlzYWdyZWUgd2l0aCB0aGlzIGNoYW5nZTog
VGhlcmUncyBhIGxhcmdlIG51bWJlciBvZiAoY29ycmVjdCBhcwo+IHBlciB0aGUgdGV4dCBwcmlv
ciB0byB5b3VyIGNoYW5nZSkgaW5zdGFuY2VzLCBhbmQgc2luY2UgdGhlcmUncwo+IG5vdGhpbmcg
YWZmZWN0aW5nIHRoZSBsZW5ndGggb2Ygc3VjaCBsaW5lcyBhdm9pZGluZyB0aGUgZXh0cmEgbGlu
ZQo+IGlzIHF1aXRlIGRlc2lyYWJsZSBpbW8uCj4KClBsZWFzZSBiZSBhd2FyZSB0aGF0ICd4ZW4g
bW9kaWZpZWQnIGNsYW5nLWZvcm1hdCBzdXBwb3J0cyBzdWNoCidkby93aGlsZScgYnJhY2VzIGV4
Y2VwdGlvbi4KSXQgaGFzIGJlZW4gdGVzdGVkIHByZXZpb3VzbHkgYW5kIHdvcmtzIHdlbGwuCgpU
aGFua3MKCj4gSmFuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
