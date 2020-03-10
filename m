Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A1180232
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:45:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBh27-0001rX-JC; Tue, 10 Mar 2020 15:43:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ti7X=43=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBh25-0001rS-Ow
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:43:01 +0000
X-Inumbo-ID: d257d486-62e5-11ea-a6c1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d257d486-62e5-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 15:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583854981;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Vl4XBjbsd2L/s9wtvlwy6V0pRNh3wXHyXMx+8YkElUw=;
 b=QDaatjALyFxLl92I1YcyT6DPc8kmZ6v0tNdTVFy83Tl1+KaX4Ko5yi6T
 7lYyaDz++ex9WD2br68uMSyRoTVT5wAkU5/Aug52sWfnw2b1EwyzbyE56
 qeLpYpu7T4v0blhTJzm4IA1jRzPM8q+RaC6cUoxYGSu6bW4rcWBSC4Lcg Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QXDgWwnSGFRCO40xoyiImd2X/45CTUfRpFCfJIlIfOF1sH0vElGRsgrZ0e1MSJroSiUih7UrCO
 RL3Tip8PwX7QbfIpShHQWW2rKEYTcZQzQn9t00Yf2xuygRtfu3Z6upflvs6RwMr+lDKbJoz/8y
 qEZua+CZsTTaQoKLf88RAAKu85ZdwQQGKB53+ZF2jNiHWLvjISg8ueDtXBPFTa0MhThXy11mQg
 jVR6WWWswA6xzMmskLG0BNhiWMF/jiEG+C4K1tVpbMYW3KDyJ0NTEScPI6PMRMOHrE6VTb4UsX
 Gto=
X-SBRS: 2.7
X-MesageID: 13714339
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="13714339"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24167.46462.266537.781520@mariner.uk.xensource.com>
Date: Tue, 10 Mar 2020 15:42:54 +0000
To: Jason Andryuk <jandryuk@gmail.com>
In-Reply-To: <20200310132904.16992-1-jandryuk@gmail.com>
References: <20200310132904.16992-1-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] scripts: Use stat to check lock claim
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

SmFzb24gQW5kcnl1ayB3cml0ZXMgKCJbUEFUQ0hdIHNjcmlwdHM6IFVzZSBzdGF0IHRvIGNoZWNr
IGxvY2sgY2xhaW0iKToKPiBSZXBsYWNlIHRoZSBwZXJsIGxvY2tpbmcgY2hlY2sgd2l0aCBzdGF0
KDEpLiAgU3RhdCBpcyBhYmxlIHRvIGZzdGF0Cj4gc3RkaW4gKGZpbGUgZGVzY3JpcHRvciAwKSB3
aGVuIHBhc3NlZCAnLScgYXMgYW4gYXJndW1lbnQuICBUaGlzIGlzIG5vdwo+IHVzZWQgdG8gY2hl
Y2sgJF9sb2NrZmQuICBzdGF0KDEpIHN1cHBvcnQgZm9yICctJyB3YXMgaW50cm9kdWNlZCB0bwo+
IGNvcmV1dGlscyBpbiAyMDA5Lgo+IAo+IEFmdGVyIEEgcmVsZWFzZXMgaXRzIGxvY2ssIHNjcmlw
dCBCIHdpbGwgcmV0dXJuIGZyb20gZmxvY2sgYW5kIGV4ZWN1dGUKPiBzdGF0LiAgU2luY2UgdGhl
IGxvY2tmaWxlIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBBLCBzdGF0IHByaW50cyBhbiBlcnJvcgo+
IHRvIHN0ZGVyciBhbmQgZXhpdHMgbm9uLXplcm8uICAnfHwgOicgaXMgbmVlZGVkIHRvIHNxdWFz
aCB0aGUgbm9uLXplcm8KPiBleGl0IHN0YXR1cyAtIG90aGVyd2lzZSB0aGUgc2NyaXB0IHRlcm1p
bmF0ZXMgc2luY2UgYHNldCAtZWAgaXMgZW5hYmxlZC4KPiBzdGRlcnIgbmVlZHMgdG8gYmUgcmVk
aXJlY3RlZCB0byAvZGV2L251bGwgb3RoZXJ3aXNlCj4gL3Zhci9sb2cveGVuL3hlbi1ob3RwbHVn
LmxvZyB3aWxsIGdldCBmaWxsZWQgd2l0aCAiTm8gc3VjaCBmaWxlIG9yCj4gZGlyZWN0b3J5IiBt
ZXNzYWdlcy4KClRoYW5rcy4gIFRoaXMgaXMgbG9va2luZyBnb29kLgoKSSBoYXZlIHR3byBuaXRz
OgoKPiBXaGlsZSBoZXJlLCByZXBsYWNlIHNvbWUgdGFicyB3aXRoIHNwYWNlcyB0byBtYXRjaCB0
aGUgcmVzdCBvZiB0aGUgZmlsZS4KClBsZWFzZSBjYW4geW91IGRvIHRoaXMgaW4gYSBzZXBhcmF0
ZSBwYXRjaCwgaWRlYWxseSBiZWZvcmVoYW5kLiAgKEkKZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIGJs
b2NrZXIgaW4gdGhpcyBjYXNlLCBnaXZlbiBob3cgc21hbGwgdGhpcyBwYXRjaAppcy4pCgo+ICsg
ICAgICAgIHN0YXQ9JCggc3RhdCAtTCAtYyAnJUQuJWknIC0gJF9sb2NrZmlsZSAwPCYkX2xvY2tm
ZCAyPi9kZXYvbnVsbCB8fCA6ICkKPiArICAgICAgICBpZiBbIC1uICIkc3RhdCIgXTsgdGhlbgo+
ICsgICAgICAgICAgICBmZF9zdGF0PSQoIGVjaG8gIiRzdGF0IiB8IHNlZCAtbiAnMXAnICkKPiAr
ICAgICAgICAgICAgZmlsZV9zdGF0PSQoIGVjaG8gIiRzdGF0IiB8IHNlZCAtbiAnMnAnICkKPiAr
ICAgICAgICAgICAgaWYgWyAiJGZkX3N0YXQiID0gIiRmaWxlX3N0YXQiIF0gOyB0aGVuIGJyZWFr
OyBmaQoKSSB0aGluayB5b3UgZG9uJ3QgbmVlZCBzZWQgaGVyZToKCiQgbHMgLWxpIHQgdQo4NDQz
MDcgLXJ3LXJ3LXItLSAxIGl3aiBpd2ogMTE3ODQ0IE9jdCAzMSAxMjo1MCB0CjgyNjQxNyAtcnct
ci0tci0tIDEgaXdqIGl3aiAgIDE3NjUgSmFuIDMxICAyMDE5IHUKJCBiYXNoIC1jICd4PSQoIHN0
YXQgLUwgLWMgIiVELiVpIiB0IHUgMj4vZGV2L251bGwgfHwgOiApOyBlY2hvICR7eCUKKn0gPSAk
e3gjKgp9JwpmZTA0Ljg0NDMwNyA9IGZlMDQuODI2NDE3CiQKClRoZSBzeW50YXggKHdpdGggbmV3
bGluZXMgd2l0aGluIHRoZSAkeyB9KSBpcyBhIGJpdCBvZGQgYnV0IG5vdAppbnZva2luZyBzZWQg
aGVyZSB3aWxsIGJlIGZhc3Rlci4KCkFsdGVybmF0aXZlbHksIGlmIHlvdSBkb24ndCBtaW5kIHVz
aW5nIC0tcHJpbnRmIGluc3RlYWQgb2YgLWMsCgokIGJhc2ggLWMgJ3g9JCggc3RhdCAtTCAtLWZv
cm1hdCAiJUQuJWkgIiB0IHUgMj4vZGV2L251bGwgfHwgOiApOyBlY2hvICR7eCUlICp9ID0gJHt4
IyogfScKZmUwNC44NDQzMDcgPSBmZTA0LjgyNjQxNwokCgpJIGRvbid0IGtub3cgd2hlbiAtLWZv
cm1hdCB3YXMgaW50cm9kdWNlZC4KCkknbSBzb3JyeSB0byBib3VuY2UgdGhlIHBhdGNoIG92ZXIg
c3VjaCBhIHNtYWxsIHRoaW5nLCBidXQgdGhpcyBpcwpwYXRoIGlzIGFscmVhZHkgcXVpdGUgc2xv
dyBhbmQgaXMgY3JpdGljYWwgZm9yIGRvbWFpbiBjcmVhdGlvbiBhbmQgSQp3b3VsZCBwcmVmZXIg
bm90IHRvIGFkZCAodHdvKSBhZGRpdGlvbmFsIHN1YnByb2Nlc3MgaW52b2NhdGlvbnMgaGVyZS4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
