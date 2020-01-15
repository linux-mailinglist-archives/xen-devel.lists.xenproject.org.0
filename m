Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65813BCF8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:00:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfR5-0008Qy-5A; Wed, 15 Jan 2020 09:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wVk1=3E=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1irfR4-0008Qt-FW
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 09:58:02 +0000
X-Inumbo-ID: 82461e32-377d-11ea-84fc-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82461e32-377d-11ea-84fc-12813bfff9fa;
 Wed, 15 Jan 2020 09:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579082279;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=elMJdOXrkW5lsNepJXposhbnE9nTjcuSxhcIx3OgOkQ=;
 b=CH12z7sah1pAGuhxolSamLhTzkRuBPt6Gh9m5ZjNNa0T+qdYu99iScSK
 VzGAO9GYDESGzEtlzkMhItbaONztssDBR1AgQC+RuG2a12gE73eo3m+wr
 ik51jNc7KeyY/sLhelzKyaQy7tSigJERGT3mRYsdNU+tCmR6/ma0uplgx U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qea3l0Ws87JqCFqqqxFJczrUHF67Y39GKJhw7LqkaLDr0sfnkMLuN8uMSSOXBUmk/S9JTTLOMf
 +XvyAGtTumA6nIIDsSCSqrCH6TIX+yXZZzx+cLVBAx60zG498ffpK6DQ3VacaeRw4NMu7foTeE
 wvNemYj5tKcK6T4y/EYRqIm47RRxlpZ4S37KDXRkJg0D9Wj5VblSUXWM65Mbu2aHWW4gPodJ1X
 VGmQv2ItABjVyYTanBrBco8Kxf4a2CWZs4sWT7E4NyVTR4Q41gacOeuRYsIFqxBEWATNthnwXK
 hB4=
X-SBRS: 2.7
X-MesageID: 10949427
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10949427"
To: Andrew Cooper <andrew.cooper3@citrix.com>, Andy Smith
 <andy@strugglers.net>, <xen-devel@lists.xenproject.org>, "Konrad Rzeszutek
 Wilk" <konrad.wilk@oracle.com>
References: <20191202082222.GW32576@bitfolk.com>
 <62ef8718-fc48-cd5c-93f6-83c3d43862c6@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <871c2617-3b85-bc38-0236-2d4686bbbfd1@citrix.com>
Date: Wed, 15 Jan 2020 09:57:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <62ef8718-fc48-cd5c-93f6-83c3d43862c6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] livepatch-build: What does getting no output from
 "readelf -wi xen-syms" usually mean?
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

T24gMTIvMjcvMTkgNTowNiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMi8xMi8yMDE5
IDA4OjIyLCBBbmR5IFNtaXRoIHdyb3RlOgo+PiBIaSwKPj4KPj4gSSd2ZSBiZWVuIGxvb2tpbmcg
aW50byBsaXZlIHBhdGNoaW5nIGZvciB0aGUgZmlyc3QgdGltZS4KPiAKPiBDQydpbmcgbGl2ZXBh
dGNoIG1haW50YWluZXJzLgo+IAo+Pgo+PiBTdGFydGluZyB3aXRoIGEgNC4xMi4xIGJ1aWxkOgo+
Pgo+PiAkIGNkIH4vZGV2Cj4+ICQgbHMgLWwKPj4gdG90YWwgOAo+PiBkcnd4ci14ci14IDMgYW5k
eSBhbmR5IDQwOTYgT2N0IDI1IDE2OjExIHhlbgo+PiBkcnd4ci14ci14IDYgYW5keSBhbmR5IDQw
OTYgRGVjICAyIDAxOjE2IGxpdmVwYXRjaC1idWlsZC10b29scwo+Pgo+PiAodGhlcmUgaXMgYWxy
ZWFkeSBhIDQuMTIuMSBoeXBlcnZpc29yIGJ1aWx0IGluIC94ZW4gYW5kIGlzIHdoYXQncwo+PiBy
dW5uaW5nIG9uIHRoaXMgaG9zdCB3aXRoIGJ1aWxkX2lkCj4+IGIxOGFmNzc0YjU2YjBjOThjZmE2
OTQwYTcyNWJhMmJhMjYwNjY5MjkpCj4+Cj4+ICQgY3AgLWEgeGVuIHhlbi1scHRlc3QKPj4gJCBj
ZCBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMKPj4gJCAuL2xpdmVwYXRjaC1idWlsZCAtaiAxIC1zIC9o
b21lL2FuZHkvZGV2L3hlbi1scHRlc3QveGVuLTQuMTIuMSAtYyAvaG9tZS9hbmR5L2Rldi94ZW4t
bHB0ZXN0L3hlbi00LjEyLjEveGVuLy5jb25maWcgLXAgLi9scHRlc3QucGF0Y2ggLW8gbHB0ZXN0
IC1kIC0tZGVwZW5kcyBiMThhZjc3NGI1NmIwYzk4Y2ZhNjk0MGE3MjViYTJiYTI2MDY2OTI5Cj4+
IEJ1aWxkaW5nIExpdmVQYXRjaCBwYXRjaDogbHB0ZXN0Cj4+Cj4+IFhlbiBkaXJlY3Rvcnk6IC9o
b21lL2FuZHkvZGV2L3hlbi1scHRlc3QveGVuLTQuMTIuMQo+PiBQYXRjaCBmaWxlOiAvaG9tZS9h
bmR5L2Rldi9saXZlcGF0Y2gtYnVpbGQtdG9vbHMvbHB0ZXN0LnBhdGNoCj4+IC5jb25maWcgZmls
ZTogL2hvbWUvYW5keS9kZXYveGVuLWxwdGVzdC94ZW4tNC4xMi4xL3hlbi8uY29uZmlnCj4+IE91
dHB1dCBkaXJlY3Rvcnk6IC9ob21lL2FuZHkvZGV2L2xpdmVwYXRjaC1idWlsZC10b29scy94c2Ez
MTAKPiAKPiBBcyBhIG5vdGUsIFhTQS0zMTAgaXNuJ3Qgc2FmZSB0byBsaXZlcGF0Y2guCj4gCj4g
V2hpbGUgKGluIGdlbmVyYWwpIHlvdSBjYW4gYnVpbGQgYSBsaXZlcGF0Y2gsIGFwcGx5aW5nIGl0
IGlzIG5vdCBzYWZlCj4gYmVjYXVzZSB0aGUgYmVmb3JlL2FmdGVyIGxvZ2ljIGlzIG5vdCBzeW1t
ZXRyaWMgd2l0aCBob3cgcmVmZXJlbmNlcyBhcmUKPiB0YWtlbi4KPiAKPiBEZXBlbmRpbmcgb24g
dGhlIGV4YWN0IGludGVyYWN0aW9uIG9mIGFwcGx5aW5nIHRoZSBsaXZlcGF0Y2ggd2l0aAo+IHBh
Z2V0YWJsZSBkZWZlcnJhbCBvcGVyYXRpb25zIChWTSBzdGFydCxtaWdyYXRlLHNodXRkb3duLCBv
ciBsYXJnZQo+IHF1YW50aXRpZXMgb2YgcGFnZXRhYmxlIGNoYW5nZXMsIGUuZy4gYSBmb3JrKCkg
c3lzdGVtIGNhbGwpLCB5b3UgY2FuIGVuZAo+IHVwIHdpdGggdG9vIGZldyBvciBtYW55IHJlZmVy
ZW5jZXMgZHJvcHBlZC7CoCBUb28gZmV3IGdlbmVyYWxseSByZXN1bHRzCj4gaW4gYW4gdW5raWxs
YWJsZSB6b21iaWUgZG9tYWluLCB3aGlsZSB0b28gbWFueSB3aWxsIGhpdCB2YXJpb3VzIEJVRygp
cwo+IGluIHRoZSBNTSBjb2RlIGFuZCB0YWtlIHRoZSBzeXN0ZW0gZG93bi4KPiAKPj4gPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+Cj4+IFBlcmZvcm0g
ZnVsbCBpbml0aWFsIGJ1aWxkIHdpdGggMSBDUFUocykuLi4KPj4gUmVhZGluZyBzcGVjaWFsIHNl
Y3Rpb24gZGF0YQo+PiBFUlJPUjogY2FuJ3QgZmluZCBzcGVjaWFsIHN0cnVjdCBzaXplLgo+Pgo+
PiBTbyBpdCBzZWVtcyBpdCBjb21wbGV0ZWQgdGhlIGluaXRpYWwgYnVpbGQgd2l0aG91dCBlcnJv
ciBidXQgbG9va2luZwo+PiBhdCB0aGUgbGl2ZXBhdGNoLWJ1aWxkIHNjcmlwdCBpdCBydW5zIHJl
YWRlbGYgbGlrZSB0aGlzOgo+Pgo+PiAkIHJlYWRlbGYgLXdpIGxwdGVzdC94ZW4tc3ltcwo+PiAk
Cj4+Cj4+IEZvciBtZSB0aGlzIHByb2R1Y2VzIG5vIG91dHB1dC4gSSd2ZSBwcm9iYWJseSBkb25l
IHNvbWV0aGluZyBzaW1wbGUKPj4gd3JvbmcuIERvZXMgdGhhdCBpbmRpY2F0ZSBzb21lIHNpbXBs
ZSBtaXN0YWtlIGluIG15IHByb2Nlc3M/Cj4gCgpZb3VyIHByb2Nlc3MgbG9va3MgY29ycmVjdC4g
WW91IG5lZWQgdG8gdXNlIHJlYWRlbGYgZnJvbSBiaW51dGlscy4gQXJlIHlvdQpwZXJoYXBzIHVz
aW5nIHNvbWUgb3RoZXIgcmVhZGVsZiAoZS5nLiBmcm9tIGJ1c3lib3gpIHdoaWNoIGdpdmVzIHVu
ZXhwZWN0ZWQKcmVzdWx0cz8gRXZlbiBpZiBscHRlc3QveGVuLXN5bXMgaXMgaW52YWxpZCBvciBl
bXB0eSwgcmVhZGVsZiBzaG91bGQgc3RpbGwKZ2l2ZSBzb21lIGVycm9yIG91dHB1dC4KCi0tIApS
b3NzIExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
