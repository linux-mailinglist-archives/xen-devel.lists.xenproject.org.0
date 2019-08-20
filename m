Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41395F84
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 15:09:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03qY-0002AP-8C; Tue, 20 Aug 2019 13:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y3HU=WQ=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i03qW-0002AK-Hu
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 13:06:44 +0000
X-Inumbo-ID: 5a7cf8a4-c34b-11e9-8bf7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a7cf8a4-c34b-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566306402;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=X1dmwOEF5C3sOEo1WsPIlTrHySAGpwRFcavCVUhdCmI=;
 b=idOiwmRMk30m/TuEXj6+UXIIjqe3skqPkfzZ6lzdJgXmsNqUDEuIf6Nu
 LFwQDiPBAoowvsLRiQoHudgDa2iHmn1mM41YQvoUGwBQ8nbj48jgTlW0n
 ruhElI2MzR12FYyiQmLBd2zgDwnJ9ZGnkmPPX9FugpCwKFPPsyGhIWz42 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: p1CUrRx/SusR4y3vzL2El59Epnc8ox0xOkHmL6j3z/euokw6K/S53ohbma7QL7dhyDyTyR+whF
 XmJj2oke+JKZ+vqKof1Xrg0oIp9JLbgK2m41Ui15y9ttr5y96hjQ+pP22cTtWmGSIDkG0tsZqT
 6bU47CXmUUdASSLLR7iH0twWK3hlz7d0EBzk6gu3TCeaKrjEfYmNVX38lgPUibOdg9cNPOgB0j
 +5CJrgDrzkYbyh15reVzdNXmgXe62iSTd7LoCa5jt7aedrxxcSyBK+g6+dv/0cXf+PZJqCxcs7
 F1U=
X-SBRS: 2.7
X-MesageID: 4714447
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4714447"
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-3-wipawel@amazon.de>
 <1b9dd799-5148-35f8-804b-64a9e71da9b4@citrix.com>
 <E6C94D0D-68EF-402C-833E-B0F4251BAA95@amazon.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <ca210544-d812-326b-0393-3badd0ef66c2@citrix.com>
Date: Tue, 20 Aug 2019 14:06:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <E6C94D0D-68EF-402C-833E-B0F4251BAA95@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools 3/4] livepatch-build: Do not
 follow every symlink for patch file
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
Cc: "Pohlack, Martin" <mpohlack@amazon.de>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yOS8xOSA0OjI0IFBNLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gCj4+IE9u
IDI5LiBBcHIgMjAxOSwgYXQgMTQ6NDAsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBj
aXRyaXguY29tPiB3cm90ZToKPj4KPj4gT24gNC84LzE5IDk6MzIgQU0sIFBhd2VsIFdpZWN6b3Jr
aWV3aWN6IHdyb3RlOgo+Pj4gSW4gc29tZSBidWlsZCBzeXN0ZW1zIHN5bWxpbmtzIG1pZ2h0IGJl
IHVzZWQgZm9yIHBhdGNoIGZpbGUgbmFtZXMKPj4+IHRvIHBvaW50IGZyb20gdGFyZ2V0IGRpcmVj
dG9yaWVzIHRvIGFjdHVhbCBwYXRjaGVzLiBGb2xsb3dpbmcgdGhvc2UKPj4+IHN5bWxpbmtzIGJy
ZWFrcyBuYW1pbmcgY29udmVudGlvbiBhcyB0aGUgcmVzdWx0aW5nIGJ1aWx0IG1vZHVsZXMKPj4+
IHdvdWxkIGJlIG5hbWVkIGFmdGVyIHRoZSBhY3R1YWwgaGFyZGxpbmsgaW5zdGVhZHMgb2YgdGhl
IHN5bWxpbmsuCj4+PiBMaXZlcGF0Y2gtYnVpbGQgb2J0YWlucyBob3RwYXRjaCBuYW1lIGZyb20g
dGhlIHBhdGNoIGZpbGUsIHNvIGl0Cj4+PiBzaG91bGQgbm90IGNhbm9uaWNhbGl6ZSB0aGUgZmls
ZSBwYXRoIHJlc29sdmluZyBhbGwgdGhlIHN5bWxpbmtzIHRvCj4+PiBub3QgbG9zZSB0aGUgb3Jp
Z2luYWwgc3ltbGluayBuYW1lLgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+Pj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxt
cG9obGFja0BhbWF6b24uZGU+Cj4+PiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVs
QGFtYXpvbi5kZT4KPj4+IFJldmlld2VkLWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFt
YXpvbi5kZT4KPj4+IC0tLQo+Pj4gICBsaXZlcGF0Y2gtYnVpbGQgfCA0ICsrKy0KPj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4gZGlmZiAtLWdp
dCBhL2xpdmVwYXRjaC1idWlsZCBiL2xpdmVwYXRjaC1idWlsZAo+Pj4gaW5kZXggYzA1N2ZhMS4u
Nzk2ODM4YyAxMDA3NTUKPj4+IC0tLSBhL2xpdmVwYXRjaC1idWlsZAo+Pj4gKysrIGIvbGl2ZXBh
dGNoLWJ1aWxkCj4+PiBAQCAtMjY1LDcgKzI2NSw5IEBAIGRvbmUKPj4+ICAgWyAteiAiJERFUEVO
RFMiIF0gJiYgZGllICJCdWlsZC1pZCBkZXBlbmRlbmN5IG5vdCBnaXZlbiIKPj4+ICAgICBTUkNE
SVI9IiQocmVhZGxpbmsgLW0gLS0gIiRzcmNhcmciKSIKPj4+IC1QQVRDSEZJTEU9IiQocmVhZGxp
bmsgLW0gLS0gIiRwYXRjaGFyZyIpIgo+Pj4gKyMgV2UgbmVlZCBhbiBhYnNvbHV0ZSBwYXRoIGJl
Y2F1c2Ugd2UgbW92ZSBhcm91bmQsIGJ1dCB3ZSBuZWVkIHRvCj4+PiArIyByZXRhaW4gdGhlIG5h
bWUgb2YgdGhlIHN5bWxpbmsgKD0gcmVhbHBhdGggLXMpCj4+PiArUEFUQ0hGSUxFPSIkKHJlYWRs
aW5rIC1mICIkKGRpcm5hbWUgIiRwYXRjaGFyZyIpIikvJChiYXNlbmFtZSAiJHBhdGNoYXJnIiki
Cj4+PiAgIENPTkZJR0ZJTEU9IiQocmVhZGxpbmsgLW0gLS0gIiRjb25maWdhcmciKSIKPj4+ICAg
T1VUUFVUPSIkKHJlYWRsaW5rIC1tIC0tICIkb3V0cHV0YXJnIikiCj4+PiAgIAo+Pgo+PiBUaGlz
IHdvcmtzLCBidXQgd291bGQgaXQgbm90IGJlIHNpbXBsZXIgdG8ganVzdCBwYXNzICRwYXRjaGFy
ZyBpbnRvIG1ha2VfcGF0Y2hfbmFtZSgpPwo+Pgo+IAo+IE5vIHN0cm9uZyBvcGluaW9uIGhlcmUs
IGJ1dCB0aGUgcmVhZGxpbmsgY2hhbmdlIGZlbHQgbGVzcyBpbnZhc2l2ZSAobm8gY2hhbmdlcyB0
byB0aGUgZXhpc3Rpbmcgc2VtYW50aWNzKS4KPiAKPiBUaGFuayB5b3UgZm9yIGxvb2tpbmcgaW50
byB0aGlzLgo+IAoKCk9LLCB0aGF0J3MgZmluZSB0aGVuLgoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFn
ZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
