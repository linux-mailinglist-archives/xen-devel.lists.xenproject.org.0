Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F18E115D9C
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 17:58:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iddKP-0001TX-Vh; Sat, 07 Dec 2019 16:53:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iddKO-0001TS-3N
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 16:53:08 +0000
X-Inumbo-ID: 0590db72-1912-11ea-a1e1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0590db72-1912-11ea-a1e1-bc764e2007e4;
 Sat, 07 Dec 2019 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575737578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KfZ5k1GCGybok2YdxP8dG1qh3yim1hLYVV6a6LaKsD8=;
 b=G+Uct0tmQ2bIa3tFUa3kGaupyRek/8jSnMD0zr/me0S97wAZoWo95bf1
 Iduh38O4uwPFfZny0LnlpHdf8+OlnXBq83DVOAo4y0YXzRxMXHnlByO9a
 qjn/0qJJsUptUGqPK65RKDvI0FeOEXRRj9Ze0AUcKZCMQNTs4QJnx68L3 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fCGu3BYvkWEv6yX46Jb4PxEiv9kjtW+UKKFmu5T7Pt8jqkfzQ4m8JwDy2XSi0RyqDG05nXtS2C
 OSZSKm2qVeTi6qXVOQgfQv5+J4r1JEM3dBRQQOYnpTmENyyTCjy4W/qFV8l5ziXqXmKAGmipR2
 xp6EESP37KexqgXK+qpNwqqdRrH3HlSpXuuyleCHxkphaNwWsyBN1qtBbyMb6pxuh8bACvcBIc
 rHfZtoIqUgEqsU4FjObGSWeyuqx3BU1esivfGKNm7CaV9aOsyJDAQaLD88/aqfqWS7+kbAE+h2
 Yi4=
X-SBRS: 2.7
X-MesageID: 9704956
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,288,1571716800"; 
   d="scan'208";a="9704956"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 7 Dec 2019 16:52:52 +0000
Message-ID: <20191207165252.1045-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191207165252.1045-1-andrew.cooper3@citrix.com>
References: <20191207165252.1045-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] xen/build: Automatically locate a suitable
 python interpreter
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
b20+CgpGb3IgNC4xMy4gIFRoaXMgaXMgYSB2ZXJ5LW5pY2UtdG8taGF2ZSBXUlQgb3VyIFB5My1j
bGVhbiBpbnRlbnRpb24uCi0tLQogeGVuL01ha2VmaWxlIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBiL3hlbi9NYWtlZmls
ZQppbmRleCA5OTcwMWUzMTY1Li5iOTM2ZDE4MTJiIDEwMDY0NAotLS0gYS94ZW4vTWFrZWZpbGUK
KysrIGIveGVuL01ha2VmaWxlCkBAIC0xMiw2ICsxMiw4IEBAIGV4cG9ydCBYRU5fQlVJTERfREFU
RQk/PSAkKHNoZWxsIExDX0FMTD1DIGRhdGUpCiBleHBvcnQgWEVOX0JVSUxEX1RJTUUJPz0gJChz
aGVsbCBMQ19BTEw9QyBkYXRlICslVCkKIGV4cG9ydCBYRU5fQlVJTERfSE9TVAk/PSAkKHNoZWxs
IGhvc3RuYW1lKQogZXhwb3J0IFhFTl9DT05GSUdfRVhQRVJUID89IG4KKyMgQmVzdCBlZmZvcnQg
YXR0ZW1wdCB0byBmaW5kIGEgcHl0aG9uIGludGVycHJldGVyCitleHBvcnQgUFlUSE9OCQk/PSAk
KHdvcmQgMSwkKHNoZWxsIHdoaWNoIHB5dGhvbjMgcHl0aG9uIHB5dGhvbjIpKQogCiBleHBvcnQg
QkFTRURJUiA6PSAkKENVUkRJUikKIGV4cG9ydCBYRU5fUk9PVCA6PSAkKEJBU0VESVIpLy4uCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
