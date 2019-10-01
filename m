Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF2C31AA
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:42:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFYv-0004r5-2C; Tue, 01 Oct 2019 10:39:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XqjC=X2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFFYt-0004r0-Cd
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:39:19 +0000
X-Inumbo-ID: b889b3ee-e437-11e9-97fb-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id b889b3ee-e437-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926359;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=F5HWKwwzcmxCMXkLVs2SsKLkI/jq074GRTNmWxe7ur8=;
 b=JYFdqg6kSq50knYAOARdbn3f2L9nvprOfxTqE/cE+hzI318Qm+PdIs41
 MtX8J993iHJobtIH24vCYKUMH/hgcmCmaXhsho09R0Y5ydW6W7VQtCQ8z
 APaYLD0RizOuh7S5a9o01MibifZQd4M5rPiqpV25JLcDUQna0/XRWP34P o=;
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
IronPort-SDR: jyQqejMKpq//aR1Fvlc+bmOthVe71I3LbV6iKGhlhqbZNEHAf1pcTD7nUo7Et2gngI9XjiuitL
 bmV4sT5GHRCxCY5tuGM+F2YfHUCNiP08It2zs8HNtQjddovki0ujyz3PRlMeNRcjEQAud20WMc
 8HGMx9jt1Eto79jgj7Asvz1wqolp+XtN3NueTKpp2sBk7ikQiAewEXwevVjTZ8JTv9aS6huQ0s
 ElNMyBLTehtWhgYIdkT7Gf6/6BC/eMH8SANSLH61wCUF9K0gTOH4inkvgwATri1++IFQOy5qp5
 BaM=
X-SBRS: 2.7
X-MesageID: 6303989
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6303989"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23955.11471.728957.434428@mariner.uk.xensource.com>
Date: Tue, 1 Oct 2019 11:39:11 +0100
To: Paul Durrant <paul.durrant@citrix.com>
In-Reply-To: <20191001091214.3287-1-paul.durrant@citrix.com>
References: <20191001091214.3287-1-paul.durrant@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate
 default for passthrough...
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSC1mb3ItNC4xM10gbGlieGw6IGNob29zZSBhbiBh
cHByb3ByaWF0ZSBkZWZhdWx0IGZvciBwYXNzdGhyb3VnaC4uLiIpOgo+IC4uLmlmIHRoZXJlIGlz
IG5vIElPTU1VIG9yIGl0IGlzIGdsb2JhbGx5IGRpc2FibGVkLgo+IAo+IFdpdGhvdXQgdGhpcyBw
YXRjaCwgdGhlIGZvbGxvd2luZyBhc3NlcnRpb24gbWF5IGJlIGhpdDoKPiAKPiB4bDogbGlieGxf
Y3JlYXRlLmM6NTg5OiBsaWJ4bF9fZG9tYWluX21ha2U6IEFzc2VydGlvbiBgaW5mby0+cGFzc3Ro
cm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRCcgZmFpbGVkLgo+IAo+IFRoaXMgaXMg
YmVjYXVzZSBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoKSBjdXJyZW50bHkg
b25seSBzZXRzCj4gYW4gYXBwcm9wcmlhdGUgdmFsdWUgZm9yICdwYXNzdGhyb3VnaCcgaW4gdGhl
IGNhc2UgdGhhdCAnY2FwX2h2bV9kaXJlY3RpbycKPiBpcyB0cnVlLCB3aGljaCBpcyBub3QgdGhl
IGNhc2UgdW5sZXNzIGFuIElPTU1VIGlzIHByZXNlbnQgYW5kIGVuYWJsZWQgaW4KPiB0aGUgc3lz
dGVtLiBUaGlzIGlzIG5vcm1hbGx5IG1hc2tlZCBieSB4bCBjaG9vc2luZyBhIGRlZmF1bHQgdmFs
dWUsIGJ1dAo+IHRoYXQgd2lsbCBub3QgaGFwcGVuIGlmIHhsIGlzIG5vdCB1c2VkIChlLmcuIHdo
ZW4gdXNpbmcgbGlidmlydCkgb3Igd2hlbgo+IGEgc3R1YiBkb21haW4gaXMgYmVpbmcgY3JlYXRl
ZC4KCkl0J3Mgd2VpcmQgdGhhdCBhZnRlciB0aGlzIHBhdGNoICJlbmFibGVkIiBjYW4gbWVhbiBE
SVNBQkxFRC4gIFN1cmVseQppZiB5b3Ugc2F5IGBwYXNzdGhyb3VnaD0iZW5hYmxlZCInIGFuZCB0
aGUgaG9zdCBoYXMgbm8gUFQgc3VwcG9ydCAoZWcKaXQncyBkaXNhYmxlZCBpbiB0aGUgYmlvcykg
aXQgc2hvdWxkIGZhaWwgPwoKTm9ybWFsbHkgbGlieGwgY29uZmlnIG9wdGlvbnMgaGF2ZSBhbiAi
dW5rbm93biIgb3IgImRlZmF1bHQiIG9wdGlvbi4KCkFsc28gaXQgaXMgYW5vbWFsb3VzIHRoYXQg
eGwgaXMgZG9pbmcgdGhlIGNvbXBsZXggd29yayBvZiBjaG9vc2luZyBhCmRlZmF1bHQuICBJIHRo
aW5rIGFsbCB0aGUgY29tcGxleCBjb2RlCgorICAgIHN3aXRjaCAoY19pbmZvLT5wYXNzdGhyb3Vn
aCkgeworICAgIGNhc2UgTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRDoKCmluIHhsX3BhcnNlLmMg
c2hvdWxkIGJlIGluIGxpYnhsLiAgKFNvbWUgb2YgaXQgaXMgdGhlcmUgYWxyZWFkeS4pCgpJJ20g
c29ycnkgdGhhdCBJIHdhc24ndCBkaWRuJ3QgcmV2aWV3IGJhYmRlNDdhM2ZlZC4uLgoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
