Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D88131170
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 12:30:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioQYK-0002xE-Eh; Mon, 06 Jan 2020 11:28:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T8Is=23=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ioQYJ-0002x9-6b
 for xen-devel@lists.xen.org; Mon, 06 Jan 2020 11:28:07 +0000
X-Inumbo-ID: 9b7ec6d6-3077-11ea-aaf0-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b7ec6d6-3077-11ea-aaf0-12813bfff9fa;
 Mon, 06 Jan 2020 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578310086;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZEdUvNJxuKvzH2cMfuPMhXsdUBQXQ9QJeuSmiuc6x7I=;
 b=RmsYy1wZfHAm02lpARSUP6jJbS/pUQeku6nqx+ZxmX7bm7eKcx/qTdau
 VmgZCzJoJXLzxvLY5lJ03pVka/kABlmakUBJG9/ITVJLen+tUsA26tc0m
 XamZJnzAYmyyA3pADPZ8DjL5i1BILP6iAsGu26AnEQnx/oJCZVqwgb6rr k=;
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
IronPort-SDR: E+jQn+Rn7Fd0el6iGB3G8f4j0HCnABfXdICtqvAYDtQ4mabqE4X5hXay7mjHX3q7FvoOdL4AhL
 nyCgBG215NlsnlhuMQDxM2Qgfd4ycECiCQrX2qZH94ANSTdXXZWf4LKCjVGl3YZFSi7unkMZay
 DVlNKwPXuYNaxr8uWdrjYN8lF2fN4PCoKeYFVY0H+OcJGeZtLaQdGQZs9QqYPGvlTsyQgU600t
 /gKWY5xUDzYflpGDho+4zenJBJhaSahED1i8loYDVZGz7uwxzynRP++fBdARNESX7yN/bMeYfQ
 z+w=
X-SBRS: 2.7
X-MesageID: 11080783
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="11080783"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191217154625.31561-1-sergey.dyasli@citrix.com>
 <a5e3c4b7-40f4-017b-1154-d75f92075597@suse.com>
 <65aecab1-a1b0-f02e-be92-cda3cd37b9e5@citrix.com>
 <e997ff3e-4260-c872-0166-3885ce1a4ee1@suse.com>
 <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <d41c1d28-d582-089a-3c8e-9e7d65edc201@citrix.com>
Date: Mon, 6 Jan 2020 11:28:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2e8bc256-6e7f-ff3d-0917-c744a92cc6ac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTkvMTkgMTE6MTUgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTkvMTIvMjAx
OSAxMTozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+ICAgICBYRU5WRVJfY2hhbmdlc2V0Cj4+
Pj4+ICAgICBYRU5WRVJfY29tbWFuZGxpbmUKPj4+Pj4gICAgIFhFTlZFUl9idWlsZF9pZAo+Pj4+
Pgo+Pj4+PiBSZXR1cm4gYSBtb3JlIGN1c3RvbWVyIGZyaWVuZGx5IGVtcHR5IHN0cmluZyBpbnN0
ZWFkIG9mICI8ZGVuaWVkPiIKPj4+Pj4gd2hpY2ggd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlr
ZSBkbWlkZWNvZGUuPgo+Pj4+IEkgdGhpbmsgIjxkZW5pZWQ+IiBpcyBxdWl0ZSBmaW5lIGZvciBt
YW55IG9mIHRoZSBvcmlnaW5hbCBwdXJwb3Nlcy4KPj4+PiBNYXliZSBpdCB3b3VsZCBiZSBiZXR0
ZXIgdG8gZmlsdGVyIGZvciB0aGlzIHdoZW4gcG9wdWxhdGluZyBndWVzdAo+Pj4+IERNSSB0YWJs
ZXM/Cj4+PiBJIGRvbid0IGtub3cgaG93IERNSSB0YWJsZXMgYXJlIHBvcHVsYXRlZCwgYnV0IG5v
dGhpbmcgc3RvcHMgYSBndWVzdAo+Pj4gZnJvbSB1c2luZyB0aGVzZSBoeXBlcmNhbGxzIGRpcmVj
dGx5Lgo+PiBBbmQgdGhpcyBpcyBwcmVjaXNlbHkgdGhlIGNhc2Ugd2hlcmUgSSB0aGluayAiPGRl
bmllZD4iIGlzIGJldHRlcgo+PiB0aGFuIGFuIGVtcHR5IHN0cmluZy4KPiAKPiAiPGRlbmllZD4i
IHdhcyBhIHRlcnJpYmxlIGNob2ljZSBiYWNrIHdoZW4gaXQgd2FzIGludHJvZHVjZWQsIGFuZCBp
dHMKPiBzdGlsbCBhIHRlcnJpYmxlIGNob2ljZSB0b2RheS4KPiAKPiBUaGVzZSBhcmUgQVNDSUkg
c3RyaW5nIGZpZWxkcywgYW5kIHRoZSBlbXB0eSBzdHJpbmcgaXMgYSBwZXJmZWN0bHkgZ29vZAo+
IHN0cmluZy7CoCBOb3RoaW5nIGlzIGdvaW5nIHRvIGJyZWFrLCBiZWNhdXNlIGl0IHdvdWxkIGhh
dmUgYnJva2VuIHRoZQo+IGZpcnN0IHRpbWUgYXJvdW5kLgo+IAo+IFRoZSBlbmQgcmVzdWx0IHdp
dGhvdXQgZGVuaWVkIHNwcmF5ZWQgYWxsIG92ZXIgdGhpcyBpbnRlcmZhY2UgaXMgbXVjaAo+IGNs
ZWFuZXIgb3ZlcmFsbC4KClVuZm9ydHVuYXRlbHkgdGhpcyBtYWlsIGRvZXNuJ3QgY29udGFpbiBh
bnkgZmFjdHMgb3IgYXJndW1lbnRzLCBqdXN0CnVuc3Vic3RhbnRpYXRlZCB2YWx1ZSBqdWRnZW1l
bnRzLiAgV2hhdCdzIHNvIHRlcnJpYmxlIGFib3V0ICI8ZGVuaWVkPiIKLS0gd2hhdCBiYWQgZWZm
ZWN0IGRvZXMgaXQgaGF2ZT8gIFdoeSBpcyAiIiBiZXR0ZXIgLyBjbGVhbmVyPwoKT25lIG5lZ2F0
aXZlIGVmZmVjdCBvZiByZXR1cm5pbmcgIiIgaXMgdGhhdCBpZiB5b3UgaGF2ZSBhIHRvb2wgd2hp
Y2gKZG9lc24ndCBjaGVjayB0aGUgdmFsdWUgYnV0IGp1c3QgZHVtcHMgaXQgaW50byBhIGxvZyBz
b21ld2hlcmUsIHRoZW4gdGhlCmxvZyBqdXN0IGNvbnRhaW5zIG5vdGhpbmcgYXQgYWxsLiAgQSBs
b2cgd2hpY2ggY29udGFpbnMgIjxkZW5pZWQ+IiBtYWtlcwppdCBjbGVhciB0byB0aGUgcGVyc29u
IHJlYWRpbmcgaXQgdGhhdCBzb21ldGhpbmcgaGFzIGJlZW4gaGlkZGVuIG9uCnB1cnBvc2UuICBZ
b3UgY2FuIHRvdGFsbHkgaW1hZ2luZSBzb21lb25lIHdhc3Rpbmcgc2V2ZXJhbCBob3VycyB0cnlp
bmcKdG8gZmlndXJlIG91dCB3aHkgdGhlaXIgbG9nZ2luZyBpc24ndCB3b3JraW5nLCBvbmx5IHRv
IGRpc2NvdmVyIHRoYXQgaXQKaXMgd29ya2luZywgYnV0IHRoYXQgaXQgd2FzIGp1c3QgbG9nZ2lu
ZyBhbiBlbXB0eSBzdHJpbmcuCgpBbmQgaXMgaXQgc28gYmFkIGZvciBkbWlkZWNvZGUgdG8gcmV0
dXJuIHNvbWV0aGluZyBsaWtlICI8ZGVuaWVkPiIgaW4KdGhhdCBjYXNlPwoKIC1HZW9yZ2UKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
