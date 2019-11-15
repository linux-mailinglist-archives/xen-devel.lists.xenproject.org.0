Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A221BFE126
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:26:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdS4-0004UX-2O; Fri, 15 Nov 2019 15:24:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVdS2-0004UN-Ko
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:23:58 +0000
X-Inumbo-ID: f0beac22-07bb-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0beac22-07bb-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573831437;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=JXFw6RY+uE0aGrmMNKiMQv81SSUBLS8f+j59urg0lIQ=;
 b=IaQaIx/rnYyYINNnbYLoOOSEMOvWhYL8IJNryfwdaqBNkvmnopZ7SMv3
 TpI5nyhDIiNDjplDtbWq6J3Q+oU2+xZVsN3NIV9D7mEJUL714NzBwRfSK
 Z80LjLs8DsRtDqvOsorp/T7NK2zVgyS0clDLl5Tlf79DDx71jwinzOG9B w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rtWgzONCXWGxgcnN3b+p4qcszI0WcPKEYtar5cJ7HV1QMJsbzECEBaDMXkT12dk9IZ7XTBDexk
 ZmiemEph853JIXmP+LUv5rQh3wLUb6le1Avt7SLes7vorQJh/OaEFekFwotkd/2FCCe4bt2FVD
 Db1cZU9ijs0ZdYe8k27b6Dkh13y8Zcss55mJ//5QsXuDhOMQxmv54oZoDrNSI/rFc/7P8r58im
 hLimwthX/hjHPbKyzVkQkjq+V5r4CF5Hjsz9eNzJxPPqJe0few7Fm3XB3wAhJvCW1ErYKtBdoE
 +vg=
X-SBRS: 2.7
X-MesageID: 8924894
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8924894"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
 <0f27d518-e6c4-a728-e59d-237acc92d493@suse.com>
 <0ec711d3-90d4-5fa0-7f16-8bf1ac8dc0ca@citrix.com>
 <f6c3a7dc-e42f-36ab-7905-75e34c5158bf@suse.com>
 <69319c0a-b064-5cb9-664c-7e7fe7eb1c3e@citrix.com>
 <b06aa658-7dea-bc6e-1488-362403f42790@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <e059f1dd-aa03-ad7e-9306-3627e0949057@citrix.com>
Date: Fri, 15 Nov 2019 15:23:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b06aa658-7dea-bc6e-1488-362403f42790@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 IanJackson <ian.jackson@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMjo1OSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8xMS8yMDE5
IDE0OjU1LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+ICsgICAgICAgICAgICBwLT5iYXNpYy5o
dHQgPSBmYWxzZTsKPj4+IEkgdGhpbmsgZXZlcnl0aGluZyBiZWxvdyBoZXJlIGluZGVlZCBzaW1w
bHkgdW5kb2VzIHdoYXQgc2FpZCBvbGQKPj4+IGNvbW1pdCBkaWQsIGJ1dCBJIGNhbid0IG1hdGNo
IHVwIHRoaXMgb25lLiBBbmQgdG9nZXRoZXIgd2l0aCB0aGUKPj4+IHF1ZXN0aW9uIG9mIHdoZXRo
ZXIgaW5zdGVhZCBsZWF2aW5nIGl0IGFsb25lLCBjbXBfbGVnYWN5IHRoZW4KPj4+IHdvdWxkIGhh
dmUgdGhlIHNhbWUgcXVlc3Rpb24gcmFpc2VkLgo+PiBUaGlzIGlzIGJhc2VkIG9uIGEgWGVuU2Vy
dmVyIHBhdGNoIHdoaWNoIHJldmVydHMgdGhlIGVudGlyZSBjb21taXQsIGFuZAo+PiBoYXMgYmVl
biBtYWludGFpbmVkIGluIHRoZSBwYXRjaHF1ZXVlIHNpbmNlIHRoZSBjb21taXQgbWFkZSBpdCB1
cHN0cmVhbSwKPj4gQUZBSUNULiAgU28gSSdsbCBsZXQgc29tZW9uZSBmcm9tIHRoYXQgdGVhbSBj
b21tZW50IG9uIHRoZSB3aGVyZWZvcmVzOwo+PiBidXQgYXMgSSBzYWlkLCBpdCdzIGJ5IGZhciB0
aGUgYmVzdCB0ZXN0ZWQgb3B0aW9uIHdlJ3JlIGdvaW5nIHRvIGdldC4KPiAKPiBZZXMuwqAgSXQg
aXMgYSByZXZlcnQgb2YgYy9zIGNhMmVlZTkyZGY0NCAoWGVuIDMuNCwgYW5kIG1haW50YWluZWQK
PiBmb3J3YXJkcyB1bnRpbCBub3cpIGJlY2F1c2UgaXQgYnJva2UgbWlncmF0aW9uIGFjcm9zcyB0
aGF0IGNoYW5nZXNldC4KPiAKPiBJdCBpcyBhbHNvIHRoaXMgZXhhY3QgdmVyc2lvbiBvZiB0aGUg
cmV2ZXJ0IHdoaWNoIGhhcyBiZWVuIHRlc3RlZCBhbmQKPiBjb25maXJtZWQgdG8gZml4IHRoZSBS
eXplbiAzeHh4IGZpeGVzLgo+IAo+IEEgc2VwYXJhdGUgZXhwZXJpbWVudCB0cmllZCBwbGF5aW5n
IHdpdGggb25seSB0aGUgZmxhZ3MsIHZpYQo+IGNwdWlkPSJob3N0Omh0dD0wLGNtcF9sZWdhY3k9
MSIgYW5kIHRoaXMgZGlkIG5vdCByZXNvbHZlIHRoZSBjcmFzaGVzLgoKSXMgdGhhdCBiZWNhdXNl
IHRoZSAicmV2ZXJ0IiAgc3RpbGwgY2xlYXJzIGNtcF9sZWdhY3ksIHJhdGhlciB0aGFuCnNldHRp
bmcgaXQgdG8gMT8KCkkgdGhpbmsgd2hhdCBKYW4gd2FzIGdldHRpbmcgYXQgd2FzIHRoYXQgY2Ey
ZWVlOTJkZjQ0ICpzZXRzKiBodHQgYW5kCipjbGVhcnMqIGNtcF9sZWdhY3ksIGJ1dCBwcmV2aW91
cyB0byB0aGF0IGNvbW1pdCwgaHR0IGFuZCBjbXBfbGVnYWN5CndlcmVuJ3QgY2hhbmdlZCwgdGhl
eSB3ZXJlIHNpbXBseSBsZWZ0IGFsb25lLiAgV2hlbiByZXZlcnRpbmcgdGhpcwpwYXRjaCwgd2h5
IGRvIHdlIG5vdCBzaW1wbHkgbGVhdmUgaXQgYWxvbmUsIGFzIHdhcyBkb25lIGJlZm9yZSwgcmF0
aGVyCnRoYW4gYWN0aXZlbHkgY2xlYXJpbmcgdGhlbT8KCkkgdGhpbmsgaXQncyBhIGdvb2QgcXVl
c3Rpb24gdG8gYXNrLCBidXQgdW5sZXNzIHRoZXJlIGlzIGEga25vd24gaXNzdWUKd2l0aCB3aGF0
IHRoZSBwYXRjaCBkb2VzLCBJIHRoaW5rIGl0J3MgZmFyIGxlc3Mgcmlza3kganVzdCB0byB0YWtl
IHRoZQp2ZXJzaW9uIHdoaWNoIGhhcyBiZWVuIHRlc3RlZC4KCiAtR2VvcmdlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
