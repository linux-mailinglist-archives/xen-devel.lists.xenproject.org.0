Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26A14A620
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:30:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5Nf-0000Xd-BK; Mon, 27 Jan 2020 14:28:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw5Nd-0000XL-0m
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:28:45 +0000
X-Inumbo-ID: 52110c8e-4111-11ea-855b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52110c8e-4111-11ea-855b-12813bfff9fa;
 Mon, 27 Jan 2020 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/YATWRgkomEbRb5nMy19tf4SPwLXEx7DAP5iAdjVIIg=;
 b=h4QBM40tFtbBp18P2G+OgHaStm/BzIZjftRJEeMGk4Jo5GY/i/sFncu8
 dJj1vhgsE62Nb/4OfS7b42fM5/fzWSAxOCEGz4rxQg6Tz+pphw8Uryo+j
 XpEbHwYVCV4CoyW3+Id/tCmbWSIJc34SZdhMllviPZKPHXWn8dbBaUkhu o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ol3RVMqaujkky42oBAFgD5TA8VgO4nxU+q/Rv/i5HRIys3AlWjFBYc4qZtnwdbK3m3ixIdk2xJ
 9vEe1om5SyalzSIuDW9wCr7Q91THaJLv1lPxtWK2JzeqJVZmPFRxMC5RQn3t/KnGkZb8FWt1hA
 dHIyNbwyFQ0OeoPsg5QH0QZFTYE/VBWb/HaBOSPdxkeMEjlXNZ5JHsCgBI6ahBBc+v4ArP1fjI
 PNb4fx8fz6lUq4xxZk5/eIQNb4fcb5l44+mM61eIdb8KwqUP4VUqpxoZK4G7dWVSRL9h4DPfXu
 RUs=
X-SBRS: 2.7
X-MesageID: 11484934
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11484934"
Date: Mon, 27 Jan 2020 15:28:36 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200127142836.GG57924@desktop-tdan49n.eng.citrite.net>
References: <CAMmSBy8d1EGVeNLis-RJqBogihiY3T=4poxfLyF_s2PG89yGNQ@mail.gmail.com>
 <20200127122718.xz44jspb5wslprtt@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127122718.xz44jspb5wslprtt@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] PVH PCI passthrough for DomUs
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
Cc: xen-devel@lists.xenproject.org, Roman Shaposhnik <roman@zededa.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTI6Mjc6MThQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBDYyBSb2dlcgoKVGhhbmtzIDopLgoKPiBPbiBTdW4sIEphbiAxOSwgMjAyMCBhdCAxMTozMDo0
MlBNIC0wODAwLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gSGkhCj4gPiAKPiA+IEkndmUg
anVzdCB0cmllZCB0aGlzIHdpdGggWGVuIDQuMTMuMCBhbmQgaXQgc2VlbXMgbGlrZSB0aGF0IGlz
IHN0aWxsCj4gPiBub3Qgc3VwcG9ydGVkLgoKTm8sIHRoZXJlIGhhc24ndCBiZWVuIG11Y2ggcHJv
Z3Jlc3Mgb24gdGhpcyBzYWRseS4KCj4gPiBUaGlzIG1ha2VzIG1lIGN1cmlvdXMgaWYgYW55Ym9k
eSBpcyB3b3JraW5nIG9uIHRoaXMgYW5kIHdoZXRoZXIKPiA+IHRoZXJlJ3MgYW55dGhpbmcgd2Ug
Y2FuIGRvIHRvIGhlbHAgYWNjZWxlcmF0ZSB0aGUgZWZmb3J0LgoKVGhlIGZpcnN0IHN0ZXAgd291
bGQgYmUgdG8gZ2V0IHZQQ0kgaG9va2VkIGludG8gdGhlIGlvcmVxIG1hY2hpbmVyeSwKc28gdGhh
dCBhIGRvbWFpbiBjYW4gaGF2ZSBkZXZpY2VzIG9uIHRoZSBlbXVsYXRlZCBQQ0kgYnVzIGhhbmRs
ZWQgYnkKdlBDSSB3aGlsZSBvdGhlcnMgYXJlIGhhbmRsZWQgYnkgZXh0ZXJuYWwgaW9yZXEgZW11
bGF0b3JzLiBJJ3ZlIHBvc3RlZAphIHYzIG9mIHRoaXMgd29yayBvbiBTZXB0ZW1iZXI6CgpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDkv
bXNnMDMyNzguaHRtbAoKQnV0IEkgaGF2ZW4ndCBnb3QgdGltZSB0byBnbyBvdmVyIHRoZSBjb21t
ZW50cyBhbmQgcG9zdCBhIG5ldyB2ZXJzaW9uLgoKT25jZSB0aGF0J3MgZG9uZSB0aGUgcmVtYWlu
aW5nIHN0ZXAgd291bGQgYmUgdG8gbWFrZSB2UENJIHNhZmUgZm9yCnVucHJpdmlsZWdlZCBndWVz
dHMuIFdlIG5lZWQgdG8gYXNzdXJlIHRoYXQgZ3Vlc3RzIGNhbiBvbmx5IHdyaXRlIHRvCnNwZWNp
ZmljIGJpdHMgb2YgdGhlIGNvbmZpZyBzcGFjZSwgYW5kIG5lZWQgdG8gbGltaXQgdGhlIGNhcGFi
aWxpdGllcwp0aGF0IGFyZSBleHBvc2VkIHRvIHRoZSBvbmVzIFhlbiBrbm93cyB0byBiZSBzYWZl
IHRvIGhhbmRsZS4gVGhpcyBjYW4KYmUgd29ya2VkIGJ5IG11bHRpcGxlIHBlb3BsZSBjb25jdXJy
ZW50bHkgSU1PLCBidXQgcmVxdWlyZXMgc3RlcCAxCihpbnRlZ3JhdGlvbiB3aXRoIGlvcmVxKSB0
byBiZSBmaW5pc2hlZCBmaXJzdC4KCkknbSBtb3JlIHRoYW4gaGFwcHkgZm9yIHNvbWVvbmUgdG8g
cGljayBhbnkgb2YgdGhvc2UgdGFza3MsIGluY2x1ZGluZwp0aGUgaW50ZWdyYXRpb24gb2YgdlBD
SSB3aXRoIHRoZSBpb3JlcSBtYWNoaW5lcnkuIElmIG5vdCwgSSBleHBlY3QgSQp3aWxsIGJlIGFi
bGUgdG8gZG8gc29tZSB3b3JrIG9uIHRoaXMgaW4gYSBjb3VwbGUgb2Ygd2Vla3MsIGJ1dCB0aGF0
CmRlcGVuZHMgb24gbm90aGluZyBlbHNlIGdldHRpbmcgb24gZmlyZSwgYW5kIG1lIGJlaW5nIGFi
bGUgdG8gZmx1c2ggbXkKcXVldWUgb2YgcGVuZGluZyBwYXRjaGVzLgoKV291bGQgeW91IGJlIHVw
IHRvIHBpY2sgc29tZSBvZiB0aGVzZSB0YXNrcz8KCkkgY2FuIHRyeSB0byBzcGVlZHVwIHRoZSB2
UENJIGlvcmVxIGludGVncmF0aW9uIGlmIHRoZXJlJ3MgcGVvcGxlCndpbGxpbmcgdG8gd29yayBv
biB0aGUgcmVtYWluaW5nIHN0ZXBzLCBJIGhhdmVuJ3QgZG9uZSBzbyBiZWNhdXNlIEkKZGlkbid0
IHNlZSBtdWNoIGludGVyZXN0IGluIGdlbmVyYWwsIGFuZCBJIHdhcyBleHBlY3RpbmcgdG8gYmUg
dGhlCm9ubHkgb25lIHdvcmtpbmcgb24gdGhlIHJlbWFpbmluZyBzdGVwcyBhbnl3YXkuCgpSZWdh
cmRzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
