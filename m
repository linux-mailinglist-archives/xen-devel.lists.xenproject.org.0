Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64836AD0B7
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2019 23:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i74TJ-0001jj-CA; Sun, 08 Sep 2019 21:11:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LcfI=XD=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i74TI-0001je-6q
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2019 21:11:44 +0000
X-Inumbo-ID: 4166403c-d27d-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4166403c-d27d-11e9-b299-bc764e2007e4;
 Sun, 08 Sep 2019 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567977102;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=I6JRjNC6jGloUsMWw5bRRxRNOT8ykZ15S5WsOIB4YKE=;
 b=iZg9VjlqN0l9FTHfJ2bWc65tvcaFe9Jd1ZZEAzBL9twlMfy7T10kAVdd
 dW5koWnaDCVj352gLoCqJ4uCc2T8YlJLUU/XmLpq7mmkBIBLRsJerb5ZB
 gJakK15JsGxf4FVo34rzqF4pbdZisgCO6Bk8Lm2KrbZrn+R7k66V12du0 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QBSdi5HD2a9n4ngJuFf05ktyxatNog/I/LGJqyVA8tONNkpDxNeLmZlzpeB3eU+/ImS1IYCTAP
 F9WYilOHcrPTrb7yhDKN0+HX0nFZUCVjkhyjbxFX2T3VXvrKCquXYzjGlkHn+7c+JSlkUoQ2m+
 8KUoab9XGaRvNf2pONgtnzIZvVfQM3O5GPJf59RowzScX75gAXtkEeTZDCcRyOsIDr0Y6e0y+R
 2Xme73dmt1PhOuNPqeuaFxsGOmfita0GF/7Bsr3fk+90zqKEKpkmitkeyMbW92KZiZh0EvI3mi
 p0c=
X-SBRS: 2.7
X-MesageID: 5523475
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,481,1559534400"; 
   d="scan'208";a="5523475"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
Date: Sun, 8 Sep 2019 22:11:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
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

T24gMDgvMDkvMjAxOSAxOToyOCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvNi8xOSA3
OjAwIFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4KPj4gT24gMDYvMDkvMjAxOSAyMzozMCwg
Qm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4KPj4+IFdoZXJlIGlzIE1DRkcgcGFyc2VkPyBwY2lf
YXJjaF9pbml0KCk/Cj4+Pj4gSXQgaGFwcGVucyB0d2ljZToKPj4gMSkgZmlyc3QgdGltZSBlYXJs
eSBvbmUgaW4gcGNpX2FyY2hfaW5pdCgpIHRoYXQgaXMgYXJjaF9pbml0Y2FsbCAtIHRoYXQKPj4g
dGltZSBwY2lfbW1jZmdfbGlzdCB3aWxsIGJlIGZyZWVkIGltbWVkaWF0ZWx5IHRoZXJlIGJlY2F1
c2UgTUNGRyBhcmVhIGlzCj4+IG5vdCByZXNlcnZlZCBpbiBFODIwOwo+PiAyKSBzZWNvbmQgdGlt
ZSBsYXRlIG9uZSBpbiBhY3BpX2luaXQoKSB3aGljaCBpcyBzdWJzeXN0ZW1faW5pdGNhbGwgcmln
aHQKPj4gYmVmb3JlIHdoZXJlIFBDSSBlbnVtZXJhdGlvbiBzdGFydHMgLSB0aGlzIHRpbWUgQUNQ
SSB0YWJsZXMgd2lsbCBiZQo+PiBjaGVja2VkIGZvciBhIHJlc2VydmVkIHJlc291cmNlIGFuZCBw
Y2lfbW1jZmdfbGlzdCB3aWxsIGJlIGZpbmFsbHkKPj4gcG9wdWxhdGVkLgo+Pgo+PiBUaGUgcHJv
YmxlbSBpcyB0aGF0IG9uIGEgc3lzdGVtIHRoYXQgZG9lc24ndCBoYXZlIE1DRkcgYXJlYSByZXNl
cnZlZCBpbgo+PiBFODIwIHBjaV9tbWNmZ19saXN0IGlzIGVtcHR5IGJlZm9yZSBhY3BpX2luaXQo
KSBhbmQgb3VyIFBDSSBob29rcyBhcmUKPj4gY2FsbGVkIGluIHRoZSBzYW1lIHBsYWNlLiBTbyBN
Q0ZHIGlzIHN0aWxsIG5vdCBpbiB1c2UgYnkgWGVuIGF0IHRoaXMKPj4gcG9pbnQgc2luY2Ugd2Ug
aGF2ZW4ndCByZWFjaGVkIG91ciB4ZW5fbWNmZ19sYXRlKCkuCj4gCj4gCj4gV291bGQgaXQgYmUg
cG9zc2libGUgZm9yIHVzIHRvIHBhcnNlIE1DRkcgb3Vyc2VsdmVzIGluIHBjaV94ZW5faW5pdCgp
PyBJCj4gcmVhbGl6ZSB0aGF0IHdlJ2QgYmUgZG9pbmcgdGhpcyB0d2ljZSAob3IgbWF5YmUgZXZl
biB0aHJlZSB0aW1lcyBzaW5jZQo+IGFwcGFyZW50bHkgYm90aCBwY2lfYXJjaF9pbml0KCnCoCBh
bmQgYWNwaV9pbmkoKSBkbyBpdCkuCj4gCgpJIGRvbid0IHRoaW5lIGl0IG1ha2VzIHNlbnNlOgph
KSBpdCBuZWVkcyB0byBiZSBkb25lIGFmdGVyIEFDUEkgaXMgaW5pdGlhbGl6ZWQgc2luY2Ugd2Ug
bmVlZCB0byBwYXJzZQppdCB0byBmaWd1cmUgb3V0IHRoZSBleGFjdCByZXNlcnZlZCByZWdpb24g
LSB0aGF0J3Mgd2h5IGl0J3MgY3VycmVudGx5CmRvbmUgaW4gYWNwaV9pbml0KCkgKHNlZSBjb21t
aXQgbWVzc2FnZSBmb3IgdGhlIHJlYXNvbnMgd2h5KQpiKSBnaXZlbiAoYSkgd2UgY2Fubm90IGRv
IGl0IG91cnNlbHZlcyBiZWZvcmUgYWNwaV9pbml0IGFuZCBhZnRlciBpcyB0b28KbGF0ZSBhcyB3
ZSdyZSBhbHJlYWR5IHBhc3QgQUNQSSBQQ0kgZW51bWVyYXRpb24KYykgd2UnZCBoYXZlIHRvIGRv
IGl0IGluIHRoZSBzYW1lIHBsYWNlIEkgY2FsbCB4ZW5fbWNmZ19sYXRlKCkgYW5kIGl0J2QKYmUg
Y29kZSBkdXBsaWNhdGlvbiBvZiB3aGF0J3MgYWxyZWFkeSBkb25lIGJ5IHRoZSBleGlzdGluZyBj
b2RlLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
