Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9D18AE7
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:43:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjGs-0005Hy-QT; Thu, 09 May 2019 13:39:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pukc=TJ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hOjGq-0005Ht-Qw
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:39:36 +0000
X-Inumbo-ID: e1fa39d8-725f-11e9-8980-bc764e045a96
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1fa39d8-725f-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:39:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l2so3102144wrb.9
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NNVpOnbDsYCGu6DMxWPC++63cIjd50CrjaIUUzi7pE8=;
 b=T64MaVh1SNmUFN734jjaFdxHaUy3c/wnqdCvQsRX4Xtj8N8RMbF/d3Pm9ZeRAnBKPd
 PRsbKCMiLmWaj1LFPKp7KIhUj37W/Ww6etASsXpEsWiyEcMXLaMIpfofaRmCWGMsZiEv
 0hXBgDqJ41UWd9N3ad68BRM5kwLyqNbnMLMn28iDI84nX7RM30h5DoSb2+yPr3HbK53h
 bIVTQ0/Qyg3sjP1TfFpaAFaNRuCO/DNmJXCWMlalQXvQnr/deRtL+HdbXg8vmT+grScB
 r4HfzAzdImZtMN2vaN4zuU830M4QKfaD8E3Mpbla4p5/QYHw6qGuMMl9qLkbdBEOKaqb
 cq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NNVpOnbDsYCGu6DMxWPC++63cIjd50CrjaIUUzi7pE8=;
 b=jns2lu8NxfNaLKNu07sOwU8/OoegBEysyKinb+GrhKCR+7ri3BOCA6/TLuYNjJAwDY
 WT9Qr29pE/rlPGE7jSMWp04jCuJ5CCmI7IvhqK+9v//ItSIzn2fRw508F6gbvClyfgSQ
 ZPHv3AcGi1EWa64iJ5FamkyHwgM/SeWX4kbLJkudTVuvyYwutSRxlU/DTcBWM1P9gdr1
 Rkq43SjSiIchxRzp520OFs+0vEH003Dy4vuNKSmPArhOnnDY/3Is1WHcRMX41Zdfc0Dr
 b2VO38oR199WUywnSyXODnGoSYT3XRBXwcekiPNJuWmQoMNHCE0HW/a0fziz6IN1euIg
 BFlg==
X-Gm-Message-State: APjAAAXVHOMZnhXKVspKo2aoD/fp1TD3LNi09Bg1ZwPj9Nkkv8R8lzIB
 iWfOxeBEPPEuO1eirn/OvTfODDAbzhzyWQ93ntvugCDNP9s=
X-Google-Smtp-Source: APXvYqzoXgmBljOlQaRBr/Vhjy4fQck3tE4bgowRNjjST3He68n9qT4CGpZu2TVuSb8p55Lvk3FJCTG+EkVVuK9DbqY=
X-Received: by 2002:a5d:4e4f:: with SMTP id r15mr3055038wrt.157.1557409174254; 
 Thu, 09 May 2019 06:39:34 -0700 (PDT)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 9 May 2019 07:38:56 -0600
Message-ID: <CABfawhkp2rODvh1j6AvEEEgc=EheM53sVprRiZWrhHcQ8Ve_+w@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] Altp2m use with PML can deadlock Xen
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLApJJ20gaW52ZXN0aWdhdGluZyBhbiBpc3N1ZSB3aXRoIGFsdHAybSB0aGF0IGNhbiBl
YXNpbHkgYmUgcmVwcm9kdWNlZAphbmQgbGVhZHMgdG8gYSBoeXBlcnZpc29yIGRlYWRsb2NrIHdo
ZW4gUE1MIGlzIGF2YWlsYWJsZSBpbiBoYXJkd2FyZS4KSSBoYXZlbid0IGJlZW4gYWJsZSB0byB0
cmFjZSBkb3duIHdoZXJlIHRoZSBhY3R1YWwgZGVhZGxvY2sgb2NjdXJzLgoKVGhlIHByb2JsZW0g
c2VlbSB0byBzdGVtIGZyb20gaHZtL3ZteC92bWNzLmM6dm14X3ZjcHVfZmx1c2hfcG1sX2J1ZmZl
cgp0aGF0IGNhbGxzIHAybV9jaGFuZ2VfdHlwZV9vbmUgb24gYWxsIGdmbnMgdGhhdCB3ZXJlIHJl
Y29yZGVkIHRoZSBQTUwKYnVmZmVyLiBUaGUgcHJvYmxlbSBvY2N1cnMgd2hlbiB0aGUgUE1MIGJ1
ZmZlciBmdWxsIHZtZXhpdCBoYXBwZW5zCndoaWxlIHRoZSBhY3RpdmUgcDJtIGlzIGFuIGFsdHAy
bS4gU3dpdGNoaW5nICBwMm1fY2hhbmdlX3R5cGVfb25lIHRvCndvcmsgd2l0aCB0aGUgYWx0cDJt
IGluc3RlYWQgb2YgdGhlIGhvc3RwMm0gaG93ZXZlciByZXN1bHRzIGluIEVQVAptaXNjb25maWd1
cmF0aW9uIGNyYXNoZXMuCgpBZGRpbmcgdG8gdGhlIGlzc3VlIGlzIHRoYXQgaXQgc2VlbSB0byBv
bmx5IG9jY3VyIHdoZW4gdGhlIGFsdHAybSBoYXMKcmVtYXBwZWQgR0ZOcy4gU2luY2UgUE1MIHJl
Y29yZHMgZW50cmllcyBiYXNlZCBvbiBHRk4gbGVhZHMgbWUgdG8KcXVlc3Rpb24gd2hldGhlciBp
dCBpcyBzYWZlIGF0IGFsbCB0byB1c2UgUE1MIHdoZW4gYWx0cDJtIGlzIHVzZWQgd2l0aApHRk4g
cmVtYXBwaW5nLiBIb3dldmVyLCBBRkFJQ1QgdGhlIEdGTnMgaW4gdGhlIFBNTCBidWZmZXIgYXJl
IG5vdCB0aGUKcmVtYXBwZWQgR0ZOcyBhbmQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0IHNo
b3VsZCBiZSBzYWZlIGFzIGxvbmcKYXMgdGhlIEdGTnMgYmVpbmcgdHJhY2tlZCBieSBQTUwgYXJl
IG5ldmVyIHRoZSByZW1hcHBlZCBHRk5zLgoKQm9vdGluZyBYZW4gd2l0aCBlcHQ9cG1sPTAgcmVz
b2x2ZXMgdGhlIGlzc3VlLgoKSWYgYW55b25lIGhhcyBhbnkgaW5zaWdodCBpbnRvIHdoYXQgbWln
aHQgYmUgaGFwcGVuaW5nLCBwbGVhc2UgbGV0IG1lIGtub3cuCgpUaGFua3MsClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
