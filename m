Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355BD17AB6C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 18:14:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9u20-0000qp-0w; Thu, 05 Mar 2020 17:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ek+B=4W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j9u1x-0000qk-Ui
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 17:11:29 +0000
X-Inumbo-ID: 5a2473c8-5f04-11ea-90c4-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a2473c8-5f04-11ea-90c4-bc764e2007e4;
 Thu, 05 Mar 2020 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583428290;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=OTSyWdXEaZPpjHVDS0E2fyd9paFmP5T2VrZtHzAI7FA=;
 b=B0L61J47X2skk0vbZfh7UgJWPU+tTw+hYTdoeqExhJGCagdDmJdfcpl3
 7WKB/DBKRpz4zxdHe7qsFqjrxm++JkE6kypddakuHWPano0sFwJJ+fVzU
 7ZWt6/q0AumtPGT/cKRfP5w2B2q7nDUwYCd4urT72fCN/+lakjGeFDwUG Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K8YThGFt8Etx+fWkVoBhdodiOoELUZabenJLtVJpUAfNfxhp9SxgamK5h/wzAqBjo6KnWAJ0Uy
 6KY5GZvteMJmlbQ8YQlGfz71BK6NiyOLI+/kjwVN6JT/3Eu1M9o2+L0JdMmqgZ7OPewi/BIpcS
 FBxUcPMxidjK59Ye8Nf8s4EW7ZSTqolHn9hsDB2+pa9MmA4AQCijL2f5D0TYsSUy+3/MmD9bw6
 BbvaMEcdb+Nq4eCHe3ZvDyrIyYR3jPPoOxKrfF8cHgUlOntpXT5qaxAJZ397iouo+6uRRxcbfQ
 Hrc=
X-SBRS: 2.7
X-MesageID: 13459401
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,518,1574139600"; d="scan'208";a="13459401"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24161.12968.77707.404087@mariner.uk.xensource.com>
Date: Thu, 5 Mar 2020 17:11:04 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <1f074dca-9798-1ed9-0163-882eb2079d53@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-4-andrew.cooper3@citrix.com>
 <24148.1780.909250.638385@mariner.uk.xensource.com>
 <1f074dca-9798-1ed9-0163-882eb2079d53@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 03/17] tools/migration: Drop IHDR_VERSION
 constant from libxc and python
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDAzLzE3XSB0b29scy9taWdyYXRp
b246IERyb3AgSUhEUl9WRVJTSU9OIGNvbnN0YW50IGZyb20gbGlieGMgYW5kIHB5dGhvbiIpOgo+
IE9uIDI0LzAyLzIwMjAgMTc6MjUsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gQW5kcmV3IENvb3Bl
ciB3cml0ZXMgKCJbUEFUQ0ggdjIgMDMvMTddIHRvb2xzL21pZ3JhdGlvbjogRHJvcCBJSERSX1ZF
UlNJT04gY29uc3RhbnQgZnJvbSBsaWJ4YyBhbmQgcHl0aG9uIik6Cj4gPj4gTWlncmF0aW9uIHYz
IGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIGludHJvZHVjZWQsIG1lYW5pbmcgdGhhdCB0aGUg
Y29kZSBoYXMKPiA+PiB0byBjb3BlIHdpdGggYm90aCB2ZXJzaW9ucy4gIFVzZSBhbiBleHBsaWNp
dCAyIGZvciBub3cuCj4gPj4KPiA+PiBGb3IgdGhlIHZlcmlmeS1zdHJlYW0tdjIgYW5kIGNvbnZl
cnQtbGVnYWN5LXN0cmVhbSBzY3JpcHRzLCB1cGRhdGUKPiA+PiB0ZXh0IHRvIHNheSAidjIgKG9y
IGxhdGVyKSIuICBXaGF0IG1hdHRlcnMgaXMgdGhlIGRpc3RpbmN0aW9uIHZzCj4gPj4gbGVnYWN5
IHN0cmVhbXMuCj4gPiBDYW4gSSByZXF1ZXN0IHRoYXQgeW91IHVzZSBhIG1hbmlmZXN0IGNvbnN0
YW50IGZvciBgMicsIHJhdGhlciB0aGFuCj4gPiBzcHJpbmtsaW5nIGxpdGVyYWwgYDIncyBldmVy
eXdoZXJlID8gIFNvbWV0aGluZyBsaWtlIElIRFJfVkVSU0lPTl8yID8KPiA+IFRoaXMgbWF5IHNl
ZW0gcG9pbnRsZXNzLCBidXQgaXQgd2lsbCBtZWFuIHRoYXQgaXQgaXMgcG9zc2libGUgdG8gZ3Jl
cAo+ID4gdGhlIGNvZGUgbXVjaCBtb3JlIGVhc2lseSBmb3IgdGhpbmdzIHdoaWNoIGFyZSByZWxl
dmFudCB0byB2MiBvciB2MyBvcgo+ID4gd2hhdGV2ZXIuCj4gPgo+ID4gKEkgZG9uJ3QgaXQncyBu
ZWNlc3NhcnkgdG8gZ28gdG8gYW55IGdyZWF0IGxlbmd0aHMgdG8gc3Vic3RpdHV0ZSB0aGUKPiA+
IHZhbHVlIG9mIElIRFJfVkVSU0lPTl8yIGludG8gZXJyb3IgbWVzc2FnZXM7IGEgbGl0ZXJhbCAy
IGluIHRoZSBzdHJpbmcKPiA+IGlzIE9LIEkgdGhpbmsuKQo+IAo+IEFzIEkgcmVwbHkgcHJldmlv
dXNseS4uLiBUaGUgdmFsdWUgY29tZXMgb3V0IG9mIGEgcGlwZSwgYW5kIGlzIGNoZWNrZWQKPiBl
eGFjdGx5IG9uY2UuCgpJIHRoaW5rIHdlIGFyZSB0YWxraW5nIGF0IGNyb3NzIHB1cnBvc2VzLgoK
SSBhbSBzdWdnZXN0aW5nIHRoYXQgeW91IHJlcGxhY2UgZXZlcnkgaW5zdGFuY2Ugb2YgYSBudW1l
cmljIGxpdGVyYWwKYDInIGluIHRoZSBjb2RlIHdpdGggSUhEUl9WRVJTSU9OXzIgKHdoaWNoIHdv
dWxkIGJlIGEgI2RlZmluZSBvciBlbnVtCmZvciAyKS4KCkkgY291bnQgNCBzdWNoIGxpdGVyYWxz
LgoKPiBZb3UgY2FuIGFscmVhZHkgZ3JlcCBmb3IgZXZlcnl0aGluZywgdXNpbmcgZm9ybWF0X3Zl
cnNpb24gd2hpY2ggaXMgd2hlcmUKPiB0aGlzIG51bWJlciBpcyBzdGFzaGVkIGZvciB0aGUgZHVy
YXRpb24gb2YgcmVzdG9yZS4KCk5vbmUgb2YgdGhlIHRoaW5ncyBJIGFtIHRhbGtpbmcgYWJvdXQg
aGF2ZSAiZm9ybWF0X3ZlcnNpb24iIG5lYXJieS4KVGhleSB0ZW5kIHRvIGhhdmUgdmFyaWFudHMg
b24gInZlcnNpb24iIGJ1dCB0aGF0IGlzIGEgcG9vciB0aGluZyB0bwpncmVwIGZvci4KCkFtIEkg
bWFraW5nIGFueSBtb3JlIHNlbnNlIG5vdyA/CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
