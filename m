Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A3F115DE7
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 19:22:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idef3-00083l-HF; Sat, 07 Dec 2019 18:18:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idef2-00083g-G1
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 18:18:32 +0000
X-Inumbo-ID: f9212b56-191d-11ea-85dd-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9212b56-191d-11ea-85dd-12813bfff9fa;
 Sat, 07 Dec 2019 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575742712;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=QLl0jqKpC0ZoFFyOVH5ESehb904KqhgKPIXw9NCj2DE=;
 b=hr2AJVjnjpiEJgzr9hfCA8WxUmiJWnUTEBFjyRV7jxoYxlJTzygI2k7t
 /0KKA8EV5/Ots5GFcRScvJMNgxA4uWuJ8BoVP61rBp6/Q5wN0YllmyiHo
 9iKXnXZyKJvRKhzqm38bdiqkE9I19bVOi3ko64RoEU7IFq6dlCCkaz49V 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9dhDO1zkFJw0cT5rJFJrjG8u/tTyIXl1TZcIRHIaC/YQN0b/ng7dZkizhNO0lN2BZEdiBu/ICh
 ND5vasTVZJ5Dtq4eyvPzxgibovRLBvmBCsALa75C2CAe0VCeHqXcsD6EyanslZ9oaARqmMSTp8
 BLzozRMrx8ldqaQIiKQD3zfS3NSluoI89y4c5vn8fYmscziwpFJwQMX/XmGRV6lem1TqwQfoJz
 EHv9HgAGqFoXFqpkNaS87KOtLbpjO5fURvS8G4rN3oQXV90sQYDXFfZBsNlODuJWheFMQzfpAT
 uRY=
X-SBRS: 2.7
X-MesageID: 9350458
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9350458"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 18:18:10 +0000
Message-ID: <20191207181813.30176-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/3] xen: Build fixes related to
 Python3
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggMyBpcyBhIGZpeCBmb3IgYSBwcm9ibGVtIHJlcG9ydGVkIG9uIElSQy4gIEl0IGlzIGEg
dmVyeS1uaWNlLXRvLWhhdmUKY29uc2lkZXJpbmcgb3VyIGF0dGVtcHQgdG8gbWFrZSBYZW4gNC4x
MyBQeTMtY2xlYW4uCgpXaGlsZSB0ZXN0aW5nIHBhdGNoIDMsIGl0IGJlY2FtZSBhcHBhcmVudCB0
aGF0IFhTTS9GbGFzayBpc24ndCBQeTMtY2xlYW4sIGFuZAp0aGlzIGlzIGEgYmxvY2tlci4gIEl0
IGlzIGFkZHJlc3NlZCBpbiBwYXRjaCAxLgoKUGF0Y2ggMiBhZGRyZXNzZXMgYSBidWcgc3BvdHRl
ZCBieSBHaXRsYWIgd2hpbGUgdGVzdGluZyB2MSBvZiB0aGlzIHNlcmllcy4gIEl0Cmlzbid0IHN0
cmljdGx5IGEgUHkzIGJ1ZywgYnV0IGlzIGEgYnVpbGQgc3lzdGVtIHJvYnVzdG5lc3MgZml4LgoK
QW5kcmV3IENvb3BlciAoMyk6CiAgeGVuL2ZsYXNrOiBEcm9wIHRoZSBnZW4tcG9saWN5LnB5IHNj
cmlwdAogIHhlbi9iYW5uZXI6IERyb3AgdGhlIGZpZy10by1vY3QucHkgc2NyaXB0CiAgeGVuL2J1
aWxkOiBBdXRvbWF0aWNhbGx5IGxvY2F0ZSBhIHN1aXRhYmxlIHB5dGhvbiBpbnRlcnByZXRlcgoK
IHhlbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKystCiB4ZW4vdG9vbHMv
ZmlnLXRvLW9jdC5weSAgICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4veHNtL2ZsYXNr
L01ha2VmaWxlICAgICAgIHwgIDYgKystLS0tCiB4ZW4veHNtL2ZsYXNrL2ZsYXNrLXBvbGljeS5T
IHwgMjAgKysrKysrKysrKysrKysrKysrKysKIHhlbi94c20vZmxhc2svZ2VuLXBvbGljeS5weSAg
fCAyMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCA0NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4vdG9vbHMvZmln
LXRvLW9jdC5weQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi94c20vZmxhc2svZmxhc2stcG9saWN5
LlMKIGRlbGV0ZSBtb2RlIDEwMDY0NCB4ZW4veHNtL2ZsYXNrL2dlbi1wb2xpY3kucHkKCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
