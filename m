Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62CF737F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 13:01:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU8LN-00055e-FO; Mon, 11 Nov 2019 11:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VDtj=ZD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iU8LL-00055P-EA
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 11:58:51 +0000
X-Inumbo-ID: 9cc656ff-047a-11ea-a20c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cc656ff-047a-11ea-a20c-12813bfff9fa;
 Mon, 11 Nov 2019 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573473527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XR/ijDWdLZq9ipboJ4AuGX+Fy5B9NfDqb090X77zwS0=;
 b=SfFA6Zgx3iQjA9B2nGd0nCZ/R4BRqC1aN2w+fP9KrMGpKskvAWr4nWSI
 Oqhwk60i1NVIgPWPx4/mRTIX7JsnVHypEGOPOYjCo8T3qXnzL6Tl8rfan
 G3zFeoDfU50f5kCXMU7gprTfsyJZF4yTGKWefqmbtCotrjNNtrYSHSl4/ k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
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
IronPort-SDR: nWYRjQG33lKty1SfmtJiaHUuQoBriqt9a++9669APSNpBuCghX6Ne+1kL4tBQgK9uW0EXu3CjN
 cFf9ygtYVYke6qs1qcliOeEwODTisavn9PSrROhje+jnBVSRm0c0eabaHhE0QSEfn4K/dKsWcn
 b8WyAHTYpm369Kk7k4zPNXyIeSmzZ+Uh6Tj1wFcfqUDO7OGWWcGCN65rew4tz3/5mKoxTKOD5e
 33cKA7b71ygOncA0/P73M/R73oFvvr+KjjEFtdHCuK3VnnDbcvc78cfZty2Eo3JUZZ2vAA14lQ
 0wo=
X-SBRS: 2.7
X-MesageID: 8132962
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,292,1569297600"; 
   d="scan'208";a="8132962"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 11 Nov 2019 11:58:35 +0000
Message-ID: <20191111115835.31285-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191111115835.31285-1-ian.jackson@eu.citrix.com>
References: <20191111115835.31285-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/2] Revert "guest_prepare_disk: Only do
 the umount if we set an env var"
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBlYTY2MjZmN2VkZDllYjQwYTM1MTBlYWY2ODE2YTc3Y2FjNGY2
M2QwLgoKQ29udHJhcnkgdG8gdGhlIGFzc2VydGlvbnMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCB0
aGlzIHVubW91bnQgZXRjLiBpcwphY3R1YWxseSB1c2VkIGJ5IHNvbWUgdGVzdHMuICBTbyByZW1v
dmluZyBpdCBicmVha3MgdGhpbmdzLgoKTm93LCB3ZSBoYXZlIGEgZGlmZmVyZW50IHdvcmthcm91
bmQ6IGEgMTBzIHNsZWVwIGJlZm9yZSB3ZSBhdHRlbXB0IHRoZQp1bW91bnQuICBUaGUgY29tYmlu
YXRpb24gb2YKICBlYTY2MjZmNyBndWVzdF9wcmVwYXJlX2Rpc2s6IE9ubHkgZG8gdGhlIHVtb3Vu
dCBpZiB3ZSBzZXQgYW4gZW52IHZhcgogIDFkM2E5N2IwIHhsIGd1ZXN0IGNyZWF0aW9uOiBQYXVz
ZSAxMHMgdG8gd29yayBhcm91bmQgbGlieGwvYmxrYmFjayByYWNlcwogIDNhMjA4YzE4IGFsbCBn
dWVzdCBjcmVhdGlvbjogUGF1c2UgMTBzIHRvIHdvcmsgYXJvdW5kIGxpYnhsL2Jsa2JhY2sgcmFj
ZXMKYW5kIHRoaXMgcmV2ZXJ0IGlzIHNpbXBseSB0aGlzOgoKICBAQCAtMTkzOCw2ICsxOTM4LDgg
QEAgc3ViIGd1ZXN0X2NyZWF0ZV9wYXVzZWQgKCQpIHsKICAgc3ViIGd1ZXN0X3ByZXBhcmVfZGlz
ayAoJCkgewogICAgICAgbXkgKCRnaG8pID0gQF87CgogICsgICAgc2xlZXAoMTApOwogICsKICAg
ICAgIGd1ZXN0X3Vtb3VudF9sdigkZ2hvLT57SG9zdH0sICRnaG8pOwoKICAgICAgIHJldHVybiBp
ZiAoJGdoby0+e0Rpc2tmbXR9IC8vICdub25lJykgZXEgIm5vbmUiOwoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0
U3VwcG9ydC5wbSB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3Qv
VGVzdFN1cHBvcnQucG0KaW5kZXggZjJiYWE3YzIuLjQ0ZjAxYTg2IDEwMDY0NAotLS0gYS9Pc3N0
ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KQEAgLTE5NDAs
OCArMTk0MCw3IEBAIHN1YiBndWVzdF9wcmVwYXJlX2Rpc2sgKCQpIHsKIAogICAgIHNsZWVwKDEw
KTsKIAotICAgIGd1ZXN0X3Vtb3VudF9sdigkZ2hvLT57SG9zdH0sICRnaG8pCi0JaWYgJEVOVnsn
T1NTVEVTVF9HVUVTVF9ESVNLX01PVU5UX0NMRUFOVVAnfTsKKyAgICBndWVzdF91bW91bnRfbHYo
JGdoby0+e0hvc3R9LCAkZ2hvKTsKIAogICAgIHJldHVybiBpZiAoJGdoby0+e0Rpc2tmbXR9IC8v
ICdub25lJykgZXEgIm5vbmUiOwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
