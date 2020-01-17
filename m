Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE98140F68
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:55:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUs4-000175-RG; Fri, 17 Jan 2020 16:53:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isUs3-000170-JB
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:53:19 +0000
X-Inumbo-ID: daf1ac90-3949-11ea-b599-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daf1ac90-3949-11ea-b599-12813bfff9fa;
 Fri, 17 Jan 2020 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579279995;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=dXRrtm86BbkrTMO/+JudVwDNyeXNSQpZ5dMCo414Yhw=;
 b=KzJiFKezhOTwLBtjPbnTNVpPuOvfULc6Ck7gFPvgjpyICvPxLZKHxLKv
 JB58QNyWZNJ2VvSw5dwBqnMES0o8roOPhTI3xwHxqQorMv8HkdLs9Rsni
 lxoXnH2hffQJPD3yVTq0/CvUyKtOzi6gx68PHL2Ez2kYOSzQkV5a9/CGz A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /VmIBRCQjhgoU5S+QwWFhlrztgglHM1a6nOlD4dqQ2PCSRR6W1yroYZ6k6LPR06+Gii84+5Mlp
 Tbx3gb7wOFYyRu20dz7hHHRZwVEWLPYjcPf1rSGMQnAjO71AU56YcucnEyavuIBTqpjdPufTcH
 4kMBtr371muab6vaul1zKUzUdfUDyu3AzawEVMm/ENYsg209CfwrQy1i39X/ka+2tXnpZA8S21
 WQ3VzJUkQrZ5f3fTzVSrc3yS1vrgiu5/P9+hCO0SxTU4oA1jWjfEhTveTkVmWPRqznph/szi5o
 n1Q=
X-SBRS: 2.7
X-MesageID: 11515455
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11515455"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.58986.657686.844914@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 16:52:58 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20200117155734.1067550-7-george.dunlap@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-7-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 7/8] golang/xenlight: Notify xenlight of
 SIGCHLD
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggdjMgNy84XSBnb2xhbmcveGVubGlnaHQ6IE5v
dGlmeSB4ZW5saWdodCBvZiBTSUdDSExEIik6Cj4gbGlieGwgZm9ya3MgZXh0ZXJuYWwgcHJvY2Vz
c2VzIGFuZCB3YWl0cyBmb3IgdGhlbSB0byBjb21wbGV0ZTsgaXQKPiB0aGVyZWZvcmUgbmVlZHMg
dG8gYmUgbm90aWZpZWQgd2hlbiBjaGlsZHJlbiBleGl0Lgo+IAo+IEluIGFic2VuY2Ugb2YgaW5z
dHJ1Y3Rpb25zIHRvIHRoZSBjb250cmFyeSwgbGlieGwgc2V0cyB1cCBpdHMgb3duCj4gU0lHQ0hM
RCBoYW5kbGVycy4KPiAKPiBHb2xhbmcgYWx3YXlzIHVubWFza3MgYW5kIGhhbmRsZXMgU0lHQ0hM
RCBpdHNlbGYuICBsaWJ4bCB0aGFua2Z1bGx5Cj4gbm90aWNlcyB0aGlzIGFuZCB0aHJvd3MgYW4g
YXNzZXJ0KCkgcmF0aGVyIHRoYW4gY2xvYmJlcmluZyBTSUdDSExECj4gaGFuZGxlcnMuCj4gCj4g
VGVsbCBsaWJ4bCB0aGF0IHdlJ2xsIGJlIHJlc3BvbnNpYmxlIGZvciBnZXR0aW5nIFNJR0NITEQg
bm90aWZpY2F0aW9ucwo+IHRvIGl0LiAgQXJyYW5nZSBmb3IgYSBjaGFubmVsIGluIHRoZSBjb250
ZXh0IHRvIHJlY2VpdmUgbm90aWZpY2F0aW9ucwo+IG9uIFNJR0NITEQsIGFuZCBzZXQgdXAgYSBn
b3JvdXRpbmUgdGhhdCB3aWxsIHBhc3MgdGhlc2Ugb24gdG8gbGlieGwuCj4gCj4gTkIgdGhhdCBl
dmVyeSBsaWJ4bCBjb250ZXh0IG5lZWRzIGEgbm90aWZpY2F0aW9uOyBzbyBtdWx0aXBsZSBjb250
ZXh0cwo+IHdpbGwgZWFjaCBzcGluIHVwIHRoZWlyIG93biBnb3JvdXRpbmUgd2hlbiBvcGVuaW5n
IGEgY29udGV4dCwgYW5kIHNodXQKPiBpdCBkb3duIG9uIGNsb3NlLgo+IAo+IGxpYnhsIGFsc28g
d2FudHMgdG8gaG9sZCBvbiB0byBhIGNvbnN0IHBvaW50ZXIgdG8KPiB4ZW5saWdodF9jaGlsZHBy
b2NfaG9va3MgcmF0aGVyIHRoYW4gZG8gYSBjb3B5OyBzbyBtYWtlIGEgZ2xvYmFsCj4gc3RydWN0
dXJlIGluIEMgc3BhY2UgYW5kIGluaXRpYWxpemUgaXQgb25jZSBvbiBsaWJyYXJ5IGNyZWF0aW9u
Lgo+IAo+IFdoaWxlIGhlcmUsIGFkZCBhIGZldyBjb21tZW50cyB0byBtYWtlIHRoZSBjb250ZXh0
IHNldC11cCBhIGJpdCBlYXNpZXIKPiB0byBmb2xsb3cuCgpGb3Igd2hhdCBpdCdzIHdvcnRoLAoK
UmV2aWV3ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSG93
ZXZlciwgSSBkb24ndCB0aGluayBJIHVuZGVyc3RhbmQgZ29sYW5nIChhbmQgcGFydGljdWxhcmx5
IHRoZQp0aHJlYWRpbmcgbW9kZWwgZXRjLikgd2VsbCBlbm91Z2ggZm9yIHRoYXQgdG8gbWVhbiBJ
J20gY29uZmlkZW50IHRoYXQKdGhpcyBjb3JyZWN0LgoKPiArZnVuYyBpbml0KCkgewo+ICsJLy8g
bGlieGwgZm9yIHNvbWUgcmVhc29uIHdhbnRzIHRvOgo+ICsJLy8gMS4gUmV0YWluIGEgY29weSB0
byB0aGlzIHBvaW50ZXIgYXMgbG9uZyBhcyB0aGUgY29udGV4dCBpcyBvcGVuLCBhbmQKPiArCS8v
IDIuIE5vdCBmcmVlIGl0IHdoZW4gaXQncyBkb25lCgpJIGZvdW5kIHRoaXMgY29tbWVudCBhIGJp
dCBydWRlLiAgVGhpcyBpcyBub3QgYW4gdW51c3VhbCBhcHByb2FjaCBmb3IKYSBwb2ludGVyIGlu
IGEgQyBBUEkuCgpJbiBSdXN0IHRoaXMgd291bGQgYmUgY2FsbGVkIGFuIGBpbW11dGFibGUgYm9y
cm93JzogdGhlIGN0eCBib3Jyb3dzCnRoZSBjb250ZW50cyBvZiB0aGUgcG9pbnRlciwgcHJvbWlz
ZXMgbm90IHRvIG1vZGlmeSBpdCAoYW5kIHRoZSBjYWxsZXIKb3VnaHQgdG8gcHJvbWlzZSBub3Qg
dG8gbW9kaWZ5IGl0IGVpdGhlcik7IGJ1dCB0aGUgY2FsbGVyIHJldGFpbnMKb3duZXJzaGlwIHNv
IHdoZW4gdGhlIGN0eCBpcyBkb25lIHRoZSBib3Jyb3cgZW5kcy4KCk5vcm1hbGx5IGluIEMgdGhl
IHN0cnVjdCB3b3VsZCBiZSBgc3RhdGljIGNvbnN0Jywgc28gdGhlcmUgaXMgbm8gbmVlZAp0byBh
bGxvY2F0ZSBpdCBvciBmcmVlIGl0LgoKSSB0aGluayB0aGF0IC4uLgoKPiArCS8vIFJhdGhlciB0
aGFuIGFsbG9jIGFuZCBmcmVlIG11bHRpcGxlIGNvcGllcywganVzdCBrZWVwIGEgc2luZ2xlCj4g
KwkvLyBzdGF0aWMgY29weSBpbiB0aGUgQyBzcGFjZSAoc2luY2UgQyBjb2RlIGlzbid0IGFsbG93
ZWQgdG8gcmV0YWluIHBvaW50ZXJzCj4gKwkvLyB0byBnbyBjb2RlKSwgYW5kIGluaXRpYWxpemUg
aXQgb25jZS4KPiArCUMueGVubGlnaHRfY2hpbGRwcm9jX2hvb2tzLmNobGRvd25lciA9IEMubGli
eGxfc2lnY2hsZF9vd25lcl9tYWlubG9vcAoKLi4uIHRoaXMgaXMgd2hhdCB0aGlzIGlzIGRvaW5n
ID8KCj4gKy8vIFRoaXMgc2hvdWxkICJwbGF5IG5pY2VseSIgd2l0aCBvdGhlciB1c2VycyBvZiBT
SUdDSExEIGFzIGxvbmcgYXMKPiArLy8gdGhleSBkb24ndCByZWFwIGxpYnhsJ3MgcHJvY2Vzc2Vz
LgoKSSBhc3N1bWUgdGhhdCBub3RoaW5nIGluIGdvbGFuZyB3aWxsIGRvIHRoaXMuICBJZiBzb21l
dGhpbmcgY2FsbHMgYQpub24tcHJvY2Vzcy1zcGVjaWZpYyB2YXJpYW50IG9mIHdhaXQqIHRoZW4g
eW91IHdvdWxkIG5lZWQgdG8gc29tZWhvdwpjYXB0dXJlIHRoZSByZXN1bHRzIGFuZCBmZWVkIHRo
ZW0gdG8gbGlieGxfY2hpbGRwcm9jX2V4aXRlZC4KCj4gKy8vIFRoZSBhbHRlcm5hdGUgd291bGQg
YmUgdG8gcmVnaXN0ZXIgYSBmb3JrIGNhbGxiYWNrLCBzdWNoIHRoYXQgdGhlCj4gKy8vIHhlbmxp
Z2h0IHBhY2thZ2UgY2FuIG1ha2UgYSBzaW5nbGUgbGlzdCBvZiBhbGwgY2hpbGRyZW4sIGFuZCBv
bmx5Cj4gKy8vIG5vdGlmeSB0aGUgc3BlY2lmaWMgbGlieGwgY29udGV4dChzKSB0aGF0IGhhdmUg
Y2hpbGRyZW4gd29rZW4uICBCdXQKPiArLy8gaXQncyBub3QgY2xlYXIgdG8gbWUgdGhpcyB3aWxs
IGJlIG11Y2ggbW9yZSB3b3JrIHRoYW4gaGF2aW5nIHRoZQo+ICsvLyB4ZW5saWdodCBnbyBsaWJy
YXJ5IGRvIHRoZSBzYW1lIHRoaW5nOyBkb2luZyBpdCBpbiBzZXBhcmF0ZSBnbwo+ICsvLyB0aHJl
YWRzIGhhcyB0aGUgcG90ZW50aWFsIHRvIGRvIGl0IGluIHBhcmFsbGVsLiAgTGVhdmUgdGhhdCBh
cyBhbgo+ICsvLyBvcHRpbWl6YXRpb24gZm9yIGxhdGVyIGlmIGl0IHR1cm5zIG91dCB0byBiZSBh
IGJvdHRsZW5lY2suCgpJIHRoaW5rIHRoaXMgaXMgZmluZS4KClRoYW5rcywKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
