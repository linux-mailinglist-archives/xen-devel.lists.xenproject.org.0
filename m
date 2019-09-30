Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35E3C2575
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 18:52:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEysD-0000JA-Nf; Mon, 30 Sep 2019 16:50:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jhqc=XZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iEysC-0000J3-CZ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 16:50:08 +0000
X-Inumbo-ID: 5b869954-e3a2-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 5b869954-e3a2-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569862208;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=uDb7wIjT3yN5iqmuH7E7UNgkwiXRYM1uRiii4YkRAhQ=;
 b=Xh1KTgWkTPwFW18E2lEpNdzMANNrQJT/0xYcC2bIoU9OBNxaetBSxoEC
 gsc6+MUj8Gr9xKnve4EA0v7Rmmn3QekZDsXQg19kadZsZGA+//krfl6U6
 YMfjFQjy/mpv7ACPh2w36n5K5WZPR8JIai6jQPftGd0r/pqJQQnMZ9onv o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SWRAYTBhAitBLDVvEIPoC/o5m0fG/vGm5D3yK4HbV/VapmTOFTDWtl000skjFAK4aA/BANIXa4
 OOLS2NoNdDAroiTjpsQjLzzVGptTdGkdeYcVJ6OSRIuXokN4cZkUwGgOBA9tJBc9CXh3pbc1r0
 775NzlWsDlwool8a46yelvnp0R+LaEBKm2rDDkM6TlPTNIk4ewxmA121HV9GpvHDir/8hiW270
 eBPOtqM2xzDpvgP9livvYxDAu5YaaqLM80OeckoAFA77gsy0rwYALR/etGJV+2Z8mc0rLy8tDG
 pcM=
X-SBRS: 2.7
X-MesageID: 6269394
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6269394"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23954.12855.72240.92310@mariner.uk.xensource.com>
Date: Mon, 30 Sep 2019 17:49:59 +0100
To: Olaf Hering <olaf@aepfle.de>
In-Reply-To: <20190924171910.5ff75b9a.olaf@aepfle.de>
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-3-olaf@aepfle.de>
 <23946.9142.652599.628334@mariner.uk.xensource.com>
 <23946.9607.887344.235099@mariner.uk.xensource.com>
 <20190924171910.5ff75b9a.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc
 to libexec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xhZiBIZXJpbmcgd3JpdGVzICgiUmU6IFtQQVRDSCBSRVNFTkQgdjEgMi84XSB0b29sczogbW92
ZSBzY3JpcHRzIGZyb20gZXRjIHRvIGxpYmV4ZWMiKToKPiBBbSBUdWUsIDI0IFNlcCAyMDE5IDE1
OjE3OjQzICswMTAwCj4gc2NocmllYiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNv
bT46Cj4gPiBJIHRoaW5rIHRoZSBhYmlsaXR5IG9mIHRoZSBhZG1pbiB0byBlZGl0IHRoZXNlIHNj
cmlwdHMgaXMgaW1wb3J0YW50IGFuZCBJIGhhdmUgdXNlZCBpdCBteXNlbGYgaW4gdGhlIHBhc3Qu
IAo+IAo+IFNpbmNlIHRoZXkgYXJlIHNjcmlwdHMsIHRoZXkgY2FuIGJlIGVkaXRlZCBpbiBhbnkg
bG9jYXRpb24uIFRvIG1lIGl0IGlzIG5vdCBjbGVhciB3aGF0IHRoZSBjYXNlIHdvdWxkIGJlIHRv
IGRpdmVyZ2UgZnJvbSB0aGUgdmVuZG9yIHByb3ZpZGVkIHZhcmlhbnQuCgpFZGl0aW5nIGZpbGVz
IGluIC91c3IgaXMgbm90IHJlYWxseSBhIGdvb2QgaWRlYS4gIFRoZXkgd2lsbCBiZQpvdmVyd3Jp
dHRlbiBieSBlZyBzZWN1cml0eSB1cGRhdGVzLgoKPiBJTU8gdGhlc2UgYXJlIHBhcnQgb2YgdGhl
IFhlbiB0b29scywgdGhlcmUgaXMgbm90aGluZyB0byBjb25maWd1cmUgaW4gdGhlc2Ugc2NyaXB0
cy4gSWYgZm9yIHdoYXRldmVyIHJlYXNvbiB0aGUgbG9jYWwgYWRtaW4gbXVzdCBydW4gaGlzIG93
biB2YXJpYW50LCBhdCBsZWFzdCBmb3IgZGlzaz0gYW5kIHZpZj0gdGhlIGxvY2F0aW9uIGNhbiBi
ZSBjaGFuZ2VkIHdpdGggJ3NjcmlwdD0nLgoKQXMgSSBzYXkgSSBoYXZlIG9uIG9jY2FzaW9uIHdh
bnRlZCB0byBlZGl0IHRoZXNlIHRvIHdvcmsgYXJvdW5kIGJ1Z3MKb3IgZG8gc3RyYW5nZSB0aGlu
Z3MuICBJIGRvbid0IHRoaW5rIHRha2luZyBhIGNvcHkgb2YgdGhlIHNjcmlwdCBhbmQKZWRpdGlu
ZyB0aGF0IGlzIGEgYmV0dGVyIGlkZWEgdGhhbiB0cmVhdGluZyB0aGUgc2NyaXB0IGFzIGEKY29u
ZmlndXJhdGlvbiBmaWxlLgoKPiBJJ20gc3VyZSB0aGV5IGFyZSBpbiAvZXRjIGJlY2F1c2UgaW4g
dGhlIGVhcmx5IGRheXMgb2YgWGVuIHRoZXJlIHdhcyBhIGhvcGUgdGhlIGxvY2FsIGFkbWluIHdv
dWxkIGRvIGFsbCB0aGUgd29yayB0byBjb25uZWN0IGJhY2tlbmRzIGFuZCBmcm9udGVuZHMgaW4g
YSB3YXkgaGUgbGlrZXMuIEkgdGhpbmsgdGhpcyBpcyBub3QgdHJ1ZSBzaW5jZSBtb3JlIHRoYW4g
YSBkZWNhZGUsIHRoZSBzY3JpcHRzIGFyZSBhbHdheXMgdGllZCB0byB0aGUgdG9vbHMgdmVyc2lv
bi4gVGhlIEFQSSBpcyBub3cgbWF0dXJlIHNpbmNlIGEgd2hpbGUsIHRoZXJlIGFyZSB2ZXJ5IGZl
dyBjaGFuZ2VzIGluIHRoZSBwYXN0IHllYXJzLgoKVGhlIHNjcmlwdHMgYXJlIG5vdCAidGllZCB0
byB0aGUgdG9vbHMgdmVyc2lvbiIuICBUaGV5IGFyZSBzaGlwcGVkCndpdGggdGhlIHRvb2xzLCBz
dXJlLCBidXQgd2UgaGF2ZSBtYWludGFpbmVkIHRoZSBpbnRlcmZhY2UuICBUaGVyZSBhcmUKZXZl
biBvdXQtb2YtdHJlZSBzY3JpcHRzLiAgKEkgdGhpbmsgaXNjc2kgaGFzIG9uZSwgZm9yIGV4YW1w
bGUuKQoKVGhleSBhcmUgaW4gL2V0YyBmb3IgdGhlIHNhbWUgcmVhc29uIGFzIGJvb3Qgc2NyaXB0
cywgZGhjbGllbnQgaG9va3MsCmFuZCBzbyBvbiwgYXJlIGluIC9ldGMuCgpJYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
