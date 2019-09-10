Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA9AE74E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 11:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7cjV-000403-LX; Tue, 10 Sep 2019 09:46:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I4Uw=XF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i7cjU-0003zv-2o
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 09:46:44 +0000
X-Inumbo-ID: e48df2d6-d3af-11e9-ac1a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e48df2d6-d3af-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568108802;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8E5RL8X5WeajVCnn5vq1+mxTjPqDjazWxoob9NeNGNE=;
 b=AynZNtV2TGf8zh0UbW4eQb82KnI+o9AX/AKmzM4cPLxz2OSyjB82qNVB
 nixrNHLxBQHFCgVU4tDmkjGQbUBzf+SY1UIBHd3LsY0JQxVhpHHgHPJXS
 aeJO5K0eL3GdyzqgbGQ9OeKCSm4eE+Q+NE4t3w7MZr7eT4Pa29P5GMd7o c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AgY4YBa9SZqZDb2XZGfDW/N/bNhCxk6gnc2o2rZCbMaDE3QDyLj0qR8AcffIrNjy3l47IcJjCJ
 91YXehax9cFUWunmd/Pz0pRv3xtClo5f0V6h4T6tNLJKVz8gdGw0hvY4tfScQ9uGDkGrTb3lPd
 jVEIW6+6VXkyyzp6qeZXEAO668ZXtQkp/lanCnBB+8PbjgMffgZhu/vgbRBYC3VykCrFAiUV94
 X4OrxJH8BO0gmRkbvG4dkC3bW5UKNSy96+8lyfDkmj3cELv/B+rTFmV0J3pE+unFjDxCdUe0z4
 Lws=
X-SBRS: 2.7
X-MesageID: 5411591
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5411591"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
Date: Tue, 10 Sep 2019 10:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAwMjo0NywgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvOS8xOSA1
OjQ4IFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gMDkvMDkvMjAxOSAyMDoxOSwgQm9y
aXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gOS84LzE5IDc6MzcgUE0sIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+Pj4+IE9uIDA5LzA5LzIwMTkgMDA6MzAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToK
Pj4+Pj4gT24gOS84LzE5IDU6MTEgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+Pj4gT24g
MDgvMDkvMjAxOSAxOToyOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4+IFdvdWxkIGl0
IGJlIHBvc3NpYmxlIGZvciB1cyB0byBwYXJzZSBNQ0ZHIG91cnNlbHZlcyBpbiBwY2lfeGVuX2lu
aXQoKT8gSQo+Pj4+Pj4+IHJlYWxpemUgdGhhdCB3ZSdkIGJlIGRvaW5nIHRoaXMgdHdpY2UgKG9y
IG1heWJlIGV2ZW4gdGhyZWUgdGltZXMgc2luY2UKPj4+Pj4+PiBhcHBhcmVudGx5IGJvdGggcGNp
X2FyY2hfaW5pdCgpwqAgYW5kIGFjcGlfaW5pKCkgZG8gaXQpLgo+Pj4+Pj4+Cj4+Pj4+PiBJIGRv
bid0IHRoaW5lIGl0IG1ha2VzIHNlbnNlOgo+Pj4+Pj4gYSkgaXQgbmVlZHMgdG8gYmUgZG9uZSBh
ZnRlciBBQ1BJIGlzIGluaXRpYWxpemVkIHNpbmNlIHdlIG5lZWQgdG8gcGFyc2UKPj4+Pj4+IGl0
IHRvIGZpZ3VyZSBvdXQgdGhlIGV4YWN0IHJlc2VydmVkIHJlZ2lvbiAtIHRoYXQncyB3aHkgaXQn
cyBjdXJyZW50bHkKPj4+Pj4+IGRvbmUgaW4gYWNwaV9pbml0KCkgKHNlZSBjb21taXQgbWVzc2Fn
ZSBmb3IgdGhlIHJlYXNvbnMgd2h5KQo+Pj4+PiBIbW0uLi4gV2Ugc2hvdWxkIGJlIGFibGUgdG8g
cGFyc2UgQUNQSSB0YWJsZXMgYnkgdGhlIHRpbWUKPj4+Pj4gcGNpX2FyY2hfaW5pdCgpIGlzIGNh
bGxlZC4gSW4gZmFjdCwgaWYgeW91IGxvb2sgYXQKPj4+Pj4gcGNpX21tY2ZnX2Vhcmx5X2luaXQo
KSB5b3Ugd2lsbCBzZWUgdGhhdCBpdCBkb2VzIGp1c3QgdGhhdC4KPj4+Pj4KPj4+PiBUaGUgcG9p
bnQgaXMgbm90IHRvIHBhcnNlIE1DRkcgYWZ0ZXIgYWNwaV9pbml0IGJ1dCB0byBwYXJzZSBEU0RU
IGZvcgo+Pj4+IHJlc2VydmVkIHJlc291cmNlIHdoaWNoIGNvdWxkIGJlIGRvbmUgb25seSBhZnRl
ciBBQ1BJIGluaXRpYWxpemF0aW9uLgo+Pj4gT0ssIEkgdGhpbmsgSSB1bmRlcnN0YW5kIG5vdyB3
aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIC0tLSB5b3UgYXJlCj4+PiBlc3NlbnRpYWxseSB0cnlp
bmcgdG8gYWNjb3VudCBmb3IgdGhlIHJhbmdlIGluc2VydGVkIGJ5Cj4+PiBzZXR1cF9tY2ZnX21h
cCgpLCByaWdodD8KPj4+Cj4+IEFjdHVhbGx5LCBwY2lfbW1jZmdfbGF0ZV9pbml0KCkgdGhhdCdz
IGNhbGxlZCBvdXQgb2YgYWNwaV9pbml0KCkgLQo+PiB0aGF0J3Mgd2hlcmUgTUNGRyBhcmVhcyBh
cmUgcHJvcGVybHkgc2l6ZWQuIAo+IAo+IHBjaV9tbWNmZ19sYXRlX2luaXQoKSByZWFkcyB0aGUg
KHN0YXRpYykgTUNGRywgd2hpY2ggZG9lc24ndCBuZWVkIERTRFQgcGFyc2luZywgZG9lcyBpdD8g
c2V0dXBfbWNmZ19tYXAoKSBPVE9IIGRvZXMgbmVlZCBpdCBhcyBpdCB1c2VzIGRhdGEgZnJvbSBf
Q0JBIChvciBpcyBpdCBfQ1JTPyksIGFuZCBJIHRoaW5rIHRoYXQncyB3aHkgd2UgY2FuJ3QgcGFy
c2UgTUNGRyBwcmlvciB0byBhY3BpX2luaXQoKS4gU28gd2hhdCBJIHNhaWQgYWJvdmUgaW5kZWVk
IHdvbid0IHdvcmsuCj4gCgpObywgaXQgdXNlcyBpc19hY3BpX3Jlc2VydmVkKCkgKGl0J3MgY2Fs
bGVkIGluZGlyZWN0bHkgc28gbWlnaHQgYmUgd2VsbApoaWRkZW4pIHRvIHBhcnNlIERTRFQgdG8g
ZmluZCBhIHJlc2VydmVkIHJlc291cmNlIGluIGl0IGFuZCBzaXplIE1DRkcKYXJlYSBhY2NvcmRp
bmdseS4gc2V0dXBfbWNmZ19tYXAoKSBpcyBjYWxsZWQgZm9yIGV2ZXJ5IHJvb3QgYnVzCmRpc2Nv
dmVyZWQgYW5kIGluZGVlZCB0cmllcyB0byBldmFsdWF0ZSBfQ0JBIGJ1dCBhdCB0aGlzIHBvaW50
CnBjaV9tbWNmZ19sYXRlX2luaXQoKSBoYXMgYWxyZWFkeSBmaW5pc2hlZCBNQ0ZHIHJlZ2lzdHJh
dGlvbiBmb3IgZXZlcnkKY29sZC1wbHVnZ2VkIGJ1cyAod2hpY2ggaW5mb3JtYXRpb24gaXMgZGVz
Y3JpYmVkIGluIE1DRkcgdGFibGUpIHNvIHRob3NlCmNhbGxzIGFyZSBkdW1teS4KCj4+IHNldHVw
X21jZmdfbWFwKCkgaXMgbW9zdGx5Cj4+IGZvciBidXMgaG90cGx1ZyB3aGVyZSBNQ0ZHIGFyZWEg
aXMgZGlzY292ZXJlZCBieSBldmFsdWF0aW5nIF9DQkEgbWV0aG9kOwo+PiBmb3IgY29sZC1wbHVn
Z2VkIGJ1c2VzIGl0IGp1c3QgY29uZmlybXMgdGhhdCBNQ0ZHIGFyZWEgaXMgYWxyZWFkeQo+PiBy
ZWdpc3RlcmVkIGJlY2F1c2UgaXQgaXMgbWFuZGF0ZWQgZm9yIHRoZW0gdG8gYmUgaW4gTUNGRyB0
YWJsZSBhdCBib290IHRpbWUuCj4+Cj4+PiBUaGUgb3RoZXIgcXVlc3Rpb24gSSBoYXZlIGlzIHdo
eSB5b3UgdGhpbmsgaXQncyB3b3J0aCBrZWVwaW5nCj4+PiB4ZW5fbWNmZ19sYXRlKCkgYXMgYSBs
YXRlIGluaXRjYWxsLiBIb3cgY291bGQgTUNGRyBpbmZvIGJlIHVwZGF0ZWQKPj4+IGJldHdlZW4g
YWNwaV9pbml0KCkgYW5kIGxhdGVfaW5pdGNhbGxzIGJlaW5nIHJ1bj8gSSdkIHRoaW5rIGl0IGNh
biBvbmx5Cj4+PiBoYXBwZW4gd2hlbiBhIG5ldyBkZXZpY2UgaXMgaG90cGx1Z2dlZC4KPj4+Cj4+
IEl0IHdhcyBhIHByZWNhdXRpb24gYWdhaW5zdCBzZXR1cF9tY2ZnX21hcCgpIGNhbGxzIHRoYXQg
bWlnaHQgYWRkIG5ldwo+PiBhcmVhcyB0aGF0IGFyZSBub3QgaW4gTUNGRyB0YWJsZSBidXQgZm9y
IHNvbWUgcmVhc29uIGhhdmUgX0NCQSBtZXRob2QuCj4+IEl0J3Mgb2J2aW91c2x5IGEgImZpcm13
YXJlIGlzIGJyb2tlbiIgc2NlbmFyaW8gc28gSSBkb24ndCBoYXZlIHN0cm9uZwo+PiBmZWVsaW5n
cyB0byBrZWVwIGl0IGhlcmUuIFdpbGwgcHJlZmVyIHRvIHJlbW92ZSBpbiB2MiBpZiB5b3Ugd2Fu
dC4KPiAKPiBJc24ndCBzZXR1cF9tY2ZnX21hcCgpIGNhbGxlZCBiZWZvcmUgdGhlIGZpcnN0IHhl
bl9hZGRfZGV2aWNlKCkgd2hpY2ggaXMgd2hlcmUgeW91IGFyZSBjYWxsaW5nIHhlbl9tY2ZnX2xh
dGUoKT8KPiAKCnNldHVwX21jZmdfbWFwKCkgY2FsbHMgYXJlIGRvbmUgaW4gb3JkZXIgb2Ygcm9v
dCBidXMgZGlzY292ZXJ5IHdoaWNoCmhhcHBlbnMgKmFmdGVyKiB0aGUgcHJldmlvdXMgcm9vdCBi
dXMgaGFzIGJlZW4gZW51bWVyYXRlZC4gU28gdGhlIG9yZGVyCmlzOiBjYWxsIHNldHVwX21jZmdf
bWFwKCkgZm9yIHJvb3QgYnVzIDAsIGZpbmQgdGhhdApwY2lfbW1jZmdfbGF0ZV9pbml0KCkgaGFz
IGZpbmlzaGVkIE1DRkcgYXJlYSByZWdpc3RyYXRpb24sIHBlcmZvcm0gUENJCmVudW1lcmF0aW9u
IG9mIGJ1cyAwLCBjYWxsIHhlbl9hZGRfZGV2aWNlKCkgZm9yIGV2ZXJ5IGRldmljZSB0aGVyZSwg
Y2FsbApzZXR1cF9tY2ZnX21hcCgpIGZvciByb290IGJ1cyBYLCBldGMuCgpJZ29yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
