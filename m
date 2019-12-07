Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D49115EBE
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 22:19:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idhRm-0005y4-6Z; Sat, 07 Dec 2019 21:17:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idhRl-0005xu-GW
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 21:17:01 +0000
X-Inumbo-ID: e2eea48a-1936-11ea-8621-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2eea48a-1936-11ea-8621-12813bfff9fa;
 Sat, 07 Dec 2019 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575753412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=x65yPkRzbRP8bz+lg02qKJ5UXlvVqui0Ev1WEd8Adok=;
 b=gxOYvLYjwY/xArYoEcRbcZdRCpoZUFpmNIF0SZ1yx7TV2csO7lt0n9cY
 m+tmDNdob7LVd4Edd+yhKLZnY2JIwbxX5MqzHvfEgaSUfUGr4D5dCA1Cs
 nXw15LQSf9QDU6bMaJgCNGNMp7mcuw9xkj4HAw49F4xrSZgQAAnQwNPVl 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1hYMHB+ENX9We1s8UfpPB64NWPIctlhuCd+Oj/7VyeV2I854O71hPLZ+VhDB+0unf9SRUrwzA6
 fg4oDmuouqVdjphi01LzCdp0ihhFVEHVWESWcfQx6PT7iNXnvt4Gy8e6hkx5LD68Ujf/zxMthn
 UhLT0n8KGv358FdDW7yLOwKRvV1R0MZ+e3YwHiyzvjrVhLTMNCWhyfvSiAqbsJlteuGkLZKoiX
 6o1AOVfeyvHVQZo4T1O0w58dTtBjkjicVksnQbG2mC0nJCqV2K6Uvi9wHqGmDnzWPMZVvdYTU8
 CLg=
X-SBRS: 2.7
X-MesageID: 9355333
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9355333"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 21:16:34 +0000
Message-ID: <20191207211634.9958-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207211634.9958-1-andrew.cooper3@citrix.com>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/3] xen/build: Automatically locate a
 suitable python interpreter
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
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TmVlZGluZyB0byBwYXNzIFBZVEhPTj1weXRob24zIGludG8gaHlwZXJ2aXNvciBidWlsZHMgaXMg
aXJyaXRhdGluZyBhbmQKdW5uZWNlc3NhcnkuICBMb2NhdGUgYSBzdWl0YWJsZSBpbnRlcnByZXRl
ciBhdXRvbWF0aWNhbGx5LCBkZWZhdWx0aW5nIHRvIFB5MwppZiBpdCBpcyBhdmFpbGFibGUuCgpS
ZXBvcnRlZC1ieTogU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1PgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PgpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBTdGV2ZW4g
SGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cgp2MjoKICogQ29wZSB3aXRoIGB3aGljaGAgbm90IGJlaW5nIHByZXNlbnQgaW4gdGhlIHN5
c3RlbS4KICogT25seSBldmF1bGF0ZSB0aGUgc2hlbGwgY29tbWFuZCBvbmUsIHJhdGhlciB0aGFu
IG9uY2UgcGVyICQoUFRIT04pIHVzYWdlCgpGb3IgNC4xMy4gIFRoaXMgaXMgYSB2ZXJ5LW5pY2Ut
dG8taGF2ZSBXUlQgb3VyIFB5My1jbGVhbiBpbnRlbnRpb24uCi0tLQogeGVuL01ha2VmaWxlIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9NYWtlZmlsZSBiL3hlbi9NYWtlZmlsZQppbmRleCA5NDljYTZlYjAzLi5mMzZhNWJjNmMwIDEw
MDY0NAotLS0gYS94ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0xMyw2ICsxMywx
MSBAQCBleHBvcnQgWEVOX0JVSUxEX1RJTUUJPz0gJChzaGVsbCBMQ19BTEw9QyBkYXRlICslVCkK
IGV4cG9ydCBYRU5fQlVJTERfSE9TVAk/PSAkKHNoZWxsIGhvc3RuYW1lKQogZXhwb3J0IFhFTl9D
T05GSUdfRVhQRVJUID89IG4KIAorIyBCZXN0IGVmZm9ydCBhdHRlbXB0IHRvIGZpbmQgYSBweXRo
b24gaW50ZXJwcmV0ZXIsIGRlZmF1bHRpbmcgdG8gUHl0aG9uIDMgaWYKKyMgYXZhaWxhYmxlLiAg
RmFsbCBiYWNrIHRvIGp1c3QgYHB5dGhvbmAgaWYgYHdoaWNoYCBpcyBub3doZXJlIHRvIGJlIGZv
dW5kLgorUFlUSE9OX0lOVEVSUFJFVEVSCTo9ICQod29yZCAxLCQoc2hlbGwgd2hpY2ggcHl0aG9u
MyBweXRob24gcHl0aG9uMiAyPi9kZXYvbnVsbCkgcHl0aG9uKQorZXhwb3J0IFBZVEhPTgkJPz0g
JChQWVRIT05fSU5URVJQUkVURVIpCisKIGV4cG9ydCBCQVNFRElSIDo9ICQoQ1VSRElSKQogZXhw
b3J0IFhFTl9ST09UIDo9ICQoQkFTRURJUikvLi4KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
