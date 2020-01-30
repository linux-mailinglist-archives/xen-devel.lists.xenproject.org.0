Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6E14E0B3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 19:22:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixEQK-00022S-90; Thu, 30 Jan 2020 18:20:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tz6E=3T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ixEQI-00022N-Fv
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 18:20:14 +0000
X-Inumbo-ID: 2815c810-438d-11ea-8ae8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2815c810-438d-11ea-8ae8-12813bfff9fa;
 Thu, 30 Jan 2020 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580408414;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qVIYn3NgGH+1ZI2gHejtPHKE+6oUsJZa3ZCqGNnoer8=;
 b=LpuoS8XNlIqwEeDocMsfZdP1a4Imlm/o8o/UE/kWbz/EFD1/HajiQv1B
 JIZVgbpXIWikcu4xHle92hQcU+pK6GgSv2FVaZszl7eMrlTmswkQw5J4C
 pcUqOGkiX0qNA7aUzVyruNUDsKaWlCryKgPI7e7k7weuhZYF0PW7dEnTF k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1th4uQu2QfhvvlYaeVhj5Of1DbDFMg/+5sz3aVYTlHTDd1tuncGGLYpgv5WHHm3U75+DIMU9Vs
 g2rXNjVW4/TpeZTMc1gWLnb6TioHQfBBy8Hv2QQYqJgCmBQw19AqUWph6F/axUKeiGQQbPi3DC
 x1s6y/iLth7pWU5A1XIhzGtg6pd6KEfLdLdIusRae70EgZdqxxVu6YEmXWf0WsurPtpKn+yHNI
 P8MuNn9dLxlNl7DpMhju860AfvzcbGxWw56r8Mg6JV8AQ+kJwjgGeIAxkrjA5XtQVeEBbcg9pG
 Ti4=
X-SBRS: 2.7
X-MesageID: 11872502
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11872502"
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Ian Jackson
 <ian.jackson@citrix.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-8-pdurrant@amazon.com>
 <24115.4689.88393.840303@mariner.uk.xensource.com>
 <07859eefc91d43859bb12e59eb6298cf@EX13D32EUC003.ant.amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <38d14767-eca0-6343-799c-49167271c9e7@citrix.com>
Date: Thu, 30 Jan 2020 18:20:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <07859eefc91d43859bb12e59eb6298cf@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDEvMjAyMCAxNzo0MiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5j
b20+Cj4+IFNlbnQ6IDMwIEphbnVhcnkgMjAyMCAxNzoyOQo+PiBUbzogRHVycmFudCwgUGF1bCA8
cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnOyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50aG9ueSBQZXJhcmQKPj4gPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNy83XSB4bDogYWxsb3cg
ZG9taWQgdG8gYmUgcHJlc2VydmVkIG9uCj4+IHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlCj4+Cj4+
IFBhdWwgRHVycmFudCB3cml0ZXMgKCJbUEFUQ0ggdjQgNy83XSB4bDogYWxsb3cgZG9taWQgdG8g
YmUgcHJlc2VydmVkIG9uCj4+IHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlIik6Cj4+PiBUaGlzIHBh
dGNoIGFkZHMgYSAnLUQnIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gc2F2ZSBhbmQgbWlncmF0ZSB0
byBhbGxvdwo+Pj4gdGhlIGRvbWFpbiBpZCB0byBiZSBpbmNvcnBvcmF0ZWQgaW50byB0aGUgc2F2
ZWQgZG9tYWluIGNvbmZpZ3VyYXRpb24gYW5kCj4+PiBoZW5jZSBiZSBwcmVzZXJ2ZWQuCj4+IFRo
YW5rcy4KPj4KPj4gSW4gcmVzcG9uc2UgdG8gdjMgNi82IEkgd3JvdGU6Cj4+Cj4+ICAgSSB3b25k
ZXIgaWYgdGhpcyBzaG91bGQgYmUgZG9uZSBtb3JlIGluIGxpYnhsLiAgU2hvdWxkIHRoaXMgYmUg
YQo+PiAgIGRvbWFpbiBwcm9wZXJ0eSA/ICBXZWksIEFudGhvbnkgPwo+Pgo+PiBUaGlzIHF1ZXN0
aW9uIHJlbWFpbnMgdW5hbnN3ZXJlZC4gIEknbSBzb3JyeSB0aGF0IG5laXRoZXIgV2VpIG5vcgo+
PiBBbnRob255IGhhZCBhIGNoYW5jZSB0byBhbnN3ZXIgeWV0Li4uCj4+Cj4+IFBhdWwsIGRvIHlv
dSBoYXZlIGEgcmVhc29uIGZvciBkb2luZyBpdCB0aGlzIHdheSA/ICBNeSBpbmNsaW5hdGlvbiBp
cwo+PiB0aGF0IHRoaW5rIGRvaW5nIGl0IGF0IHRoZSBsaWJ4bCBsYXllciB3b3VsZCBtYWtlIG1v
cmUgc2Vuc2UuICBEbyB5b3UKPj4gdGhpbmsgdGhhdCB3b3VsZCBiZSBwb3NzaWJsZSA/Cj4+Cj4g
SSdtIG5vdCBzdXJlIGhvdyBpdCB3b3VsZCB3b3JrIGF0IHRoZSBsaWJ4bCBsZXZlbCBhcyB0aGUg
ZG9taWQgaXMgcGFydCBvZiBjcmVhdGVfaW5mbyBhbmQgdGhhdCBpdCB0cmFuc2ZlcnJlZCBieSB4
bCBvbiBtaWdyYXRpb24uIElJVUMgd2UnZCBuZWVkIGEgbmV3IGxpYnhsIHNhdmUgcmVjb3JkIHRv
IHRyYW5zZmVyIGl0IGF0IHRoYXQgbGV2ZWwsIGFuZCB0aGVuIEknbSBub3Qgc3VyZSB3aGV0aGVy
IHdlJ2QgaGl0IGFuIG9yZGVyaW5nIHByb2JsZW0gYXMgd2UnZCBoYXZlIHRvIGRpZyB0aGF0IHNh
dmUgcmVjb3JkIG91dCBiZWZvcmUgd2UgY291bGQgYWN0dWFsbHkgY3JlYXRlIHRoZSBkb21haW4u
CgpUaGVyZSBpcyBkZWZpbml0ZWx5IGFuIG9yZGVyaW5nIHByb2JsZW0uCgpJIGFncmVlIHRoYXQg
aXQgc2hvdWxkIGxvZ2ljYWxseSBiZSBwYXJ0IG9mIHRoZSBsaWJ4bCBsZXZlbCBvZiB0aGUKc3Ry
ZWFtLCBidXQgbm9uZSBvZiB0aGF0IGlzIGV2ZW4gcGFyc2VkIHVudGlsIGFmdGVyIHRoZSBkb21h
aW4gaGFzIGJlZW4KY3JlYXRlZCBvbiB0aGUgZGVzdGluYXRpb24gc2lkZS4KCkkgaGF2ZSBubyBp
ZGVhIGhvdyBlYXN5L2RpZmZpY3VsdCBpdCB3b3VsZCBiZSB0byByZWFycmFuZ2UgbGlieGwgdG8K
c3RhcnQgcGFyc2luZyB0aGUgbWlncmF0aW9uIHN0cmVhbSBiZWZvcmUgY3JlYXRpbmcgdGhlIGRv
bWFpbi7CoCBJIHRoaW5rCnRoZXJlIHdpbGwgYmUgYSBsb3Qgb2YgY29kZSByZWx5aW5nIG9uIHRo
ZSBkb21pZCBhbHJlYWR5IGJlaW5nIHZhbGlkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
