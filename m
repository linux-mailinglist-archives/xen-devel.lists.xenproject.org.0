Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6AAFDD28
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:14:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVaSg-0005cm-Vy; Fri, 15 Nov 2019 12:12:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cCEn=ZH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iVaSe-0005cW-RF
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:12:24 +0000
X-Inumbo-ID: 2e540408-07a1-11ea-9631-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e540408-07a1-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573819943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3fUY2aoI2o1ykJixjZU3Mdg1WEr8c5kRf2L3SttGzBE=;
 b=hBv3sRD6ZRCDY0JBIQpYwLTj4O0fYRwu5yDwFBukiLL2flnsZly5wwyO
 wqDLoaAX5AJSap1UWewrJK+DQz3NWy9Yfk86QFe4LddGnSTDDwCH+51Gc
 g1+01ZJ+ztYqKy5nFzWlgCHtiqVMT2VXtRhYuagnedJ2z7ogdtQqmTWpK M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RGspuBR9UE85RyFdWanINf0ezngMm50kQ2yE/ghvmwWUzjdodDnd6FHZnuQFAy2OvAwSfVOPj+
 k2aRcEmzT2CTEKfOt5R8TP/AYLr0lo7PaS6ktYlydS3jugt161ky51jk8NYaOfuqbCJuogxgGI
 4emm/6IXH7ybxxOztLlf7gMPSjjmHVU5e/dm1UExPcJw87psCiVWVNG43/lapfZAYrjsaEjmUu
 uzUw3gqiz2Jck+ijvkMWhOzyETiPaePeGJx9jw63PmTnBU4KzvGlnd0Fp4vNkW2jnexgkZtBBL
 jR4=
X-SBRS: 2.7
X-MesageID: 8913910
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8913910"
Date: Fri, 15 Nov 2019 12:12:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191115121221.GB1425@perard.uk.xensource.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
 <3bbbd382-465b-6169-f8b3-936cd71d222f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bbbd382-465b-6169-f8b3-936cd71d222f@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTE6MDY6MjdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTQuMTEuMjAxOSAxOTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBXaXRo
ICQoVEFSR0VUKS5lZmkgZGVwZW5kaW5nIG9uIGVmaS9yZWxvY3MtZHVtbXkubywgYXJjaC94ODYv
TWFrZWZpbGUKPiA+IHdpbGwgYXR0ZW1wdCB0byBidWlsZCB0aGF0IG9iamVjdC4gVGhpcyByZXN1
bHQgaW4gdGhlIGRlcGVuZGVuY3kgZmlsZQo+ID4gYmVlbiBnZW5lcmF0ZWQgd2l0aCByZWxvY3Mt
ZHVtbXkubyBkZXBlbmRpbmcgb24gZWZpL3JlbG9jcy1kdW1teS5vLgo+IAo+IEkgY2Fubm90IGNv
bmZpcm0gdGhpcywgd2hhdCBJIHNlZSBpcwo+IAo+IGVmaS9yZWxvY3MtZHVtbXkubzogZWZpL3Jl
bG9jcy1kdW1teS5TIFwKPiAgLi4uCgoKSSd2ZSB3cml0dGVuIHRoZSBjb21taXQgbWVzc2FnZSBi
YXNlIG9uIGZldyBldmlkZW5jZXMsIGJ1dCBJIGRvbid0IGtub3cKaWYgdGhlIHJhY2UgY29tZXMg
ZnJvbSB0cnlpbmcgdG8gYnVpbGQgJChUQVJHRVQpLmVmaS4gSGVyZSBpcyB3aGF0IEkKaGF2ZToK
CiMgQnVpbGRpbmcgWGVuIHdpdGggbWFrZSAtajggYWZ0ZXIgZ2l0IGNsZWFuCm1ha2VbM106ICoq
KiBObyBydWxlIHRvIG1ha2UgdGFyZ2V0ICdlZmkvcmVsb2NzLWR1bW15LlMnLCBuZWVkZWQgYnkg
J3JlbG9jcy1kdW1teS5vJy4KJCBoZWFkIC0xIGFyY2gveDg2L2VmaS8ucmVsb2NzLWR1bW15Lm8u
ZApyZWxvY3MtZHVtbXkubzogZWZpL3JlbG9jcy1kdW1teS5TIFwKCmFyY2gveDg2Ly5yZWxvY3Mt
ZHVtbXkuby5kIGRvZXNuJ3QgZXhpc3QuCgpsb29raW5nIGJhY2sgYXQgdGhlIG1ha2Ugb3V0cHV0
LCByZWxvY3MtZHVtbXkgd2FzIGJ1aWx0IHdpdGg6CmdjYyAtRF9fQVNTRU1CTFlfXyAtbTY0IC1E
QlVJTERfSUQgLWZuby1zdHJpY3QtYWxpYXNpbmcgLVdhbGwgLVdzdHJpY3QtcHJvdG90eXBlcyAt
V2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxl
IC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVkZWZzIC1PMSAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciAt
bm9zdGRpbmMgLWZuby1idWlsdGluIC1mbm8tY29tbW9uIC1XZXJyb3IgLVdyZWR1bmRhbnQtZGVj
bHMgLVduby1wb2ludGVyLWFyaXRoIC1XdmxhIC1waXBlIC1EX19YRU5fXyAtaW5jbHVkZSAvbG9j
YWwvaG9tZS9zaGVlcC93b3JrL3hlbi94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmggJy1EX19PQkpF
Q1RfRklMRV9fPSJlZmkvcmVsb2NzLWR1bW15Lm8iJyAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0
ZSAtZyAtTU1EIC1NRiBlZmkvLnJlbG9jcy1kdW1teS5vLmQgLURYRU5fQlVJTERfRUZJIC1JL2xv
Y2FsL2hvbWUvc2hlZXAvd29yay94ZW4veGVuL2luY2x1ZGUgLUkvbG9jYWwvaG9tZS9zaGVlcC93
b3JrL3hlbi94ZW4vaW5jbHVkZS9hc20teDg2L21hY2gtZ2VuZXJpYyAtSS9sb2NhbC9ob21lL3No
ZWVwL3dvcmsveGVuL3hlbi9pbmNsdWRlL2FzbS14ODYvbWFjaC1kZWZhdWx0IC1EWEVOX0lNR19P
RkZTRVQ9MHgyMDAwMDAgJy1EX19PQkpFQ1RfTEFCRUxfXz1hcmNoJHg4NiRlZmkkcmVsb2NzX2R1
bW15Lm8nIC1tc29mdC1mbG9hdCAtZm5vLXN0YWNrLXByb3RlY3RvciAtZm5vLWV4Y2VwdGlvbnMg
LVduZXN0ZWQtZXh0ZXJucyAtREhBVkVfQVNfVk1YIC1ESEFWRV9BU19TU0U0XzIgLURIQVZFX0FT
X0VQVCAtREhBVkVfQVNfUkRSQU5EIC1ESEFWRV9BU19GU0dTQkFTRSAtREhBVkVfQVNfWFNBVkVP
UFQgLURIQVZFX0FTX1JEU0VFRCAtREhBVkVfQVNfQ0xXQiAtVV9fT0JKRUNUX0xBQkVMX18gLURI
QVZFX0FTX1FVT1RFRF9TWU0gJy1EX19PQkpFQ1RfTEFCRUxfXz1hcmNoL3g4Ni9lZmkvcmVsb2Nz
LWR1bW15Lm8nIC1ESEFWRV9BU19JTlZQQ0lEIC1ESEFWRV9BU19ORUdBVElWRV9UUlVFIC1ESEFW
RV9BU19OT1BTX0RJUkVDVElWRSAtbW5vLXJlZC16b25lIC1mcGljIC1mbm8tYXN5bmNocm9ub3Vz
LXVud2luZC10YWJsZXMgLW1uby1zc2UgLW1za2lwLXJheC1zZXR1cCAtREdDQ19IQVNfVklTSUJJ
TElUWV9BVFRSSUJVVEUgLW1pbmRpcmVjdC1icmFuY2g9dGh1bmstZXh0ZXJuIC1taW5kaXJlY3Qt
YnJhbmNoLXJlZ2lzdGVyIC1EQ09ORklHX0lORElSRUNUX1RIVU5LIC1mbm8tanVtcC10YWJsZXMg
LW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MyAtV2EsLUkvbG9jYWwvaG9tZS9zaGVlcC93b3Jr
L3hlbi94ZW4vaW5jbHVkZSAtREJVSUxEX0lEX0VGSSAtYyBlZmkvcmVsb2NzLWR1bW15LlMgLW8g
ZWZpL3JlbG9jcy1kdW1teS5vCgokIGdjYyAtLXZlcnNpb24KZ2NjIChHQ0MpIDkuMi4wCgpJJ20g
Z3Vlc3NpbmcgdGhhdCBnY2MgYmVoYXZlIGRpZmZlcmVudGx5IGJldHdlZW4gYm90aCBvdXIgc3lz
dGVtPwpPbiBtaW5lLCBgbWFuIGdjY2Agc2VlbXMgdG8gaW1wbHkgdGhlcmUncyBub3RoaW5nIHdy
b25nIG9uIG15IHN5c3RlbS4KSWYgd2Ugd2FudCBnY2MgdG8gcHJvZHVjZSAiZWZpL3JlbG9jLWR1
bW15Lm86IC4uIiBvbiBteSBzeXN0ZW0sIEkgdGhpbmsKd2Ugd291bGQgbmVlZCB0byBhZGQgdGhl
IC1NVCBvciAtTVEgb3B0aW9uIHRvIHRoZSBjZmxhZ3MuCgpDaGVlcnMsCgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
