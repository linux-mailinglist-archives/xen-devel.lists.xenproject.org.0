Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6083217F722
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:11:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBdgD-0003z4-EO; Tue, 10 Mar 2020 12:08:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ti7X=43=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBdgB-0003yr-Qi
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:08:11 +0000
X-Inumbo-ID: cfaef052-62c7-11ea-ad86-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfaef052-62c7-11ea-ad86-12813bfff9fa;
 Tue, 10 Mar 2020 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583842091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Xs4fiV3M+YvZ+yzGv4KDYdD45eOph1korhAXW0BPxo=;
 b=QSyOkYWwmh6J1lgDNQ3HKkvLXx+Nsk31nW+S4vEdd0KpJik5osy2Xi/V
 z3LXWB3UWDI7DN0qQwB3KG5jKIjfazWrEpQ4Y2PNtjgn17y1I2LAAJ8pR
 TRz7O2NAfBRHNuVKjyGaO9H6TTQRxKZsHgJQDyFHSarkxQ6aiVdEZhuFc w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DcIK2qiyICbau3bp5JUYA5QlQUWaDM4O4a4S6OJqvFYJyOgy5ErxpBaEi1h5RLMn0sTfZ7INla
 LeJKdZrMLVzqVc7YD4juofc3VpmLFsciAng4T98JRL/U2rJylJ9ZftvGlG0Y/kKchzBC0+r4os
 b79goq3JNJiXPZIzWUVZkuUN/1ms6+f7wwuJnv2bkUi5/UVMgpWFYOdLTfr9LFqzSMIaMAiM84
 8/aWliL4UxsvaQ17sLWPQ+UE2kSgeX0/xYeHQFEvAfWlmlvBjc0hkWHUL7Hzy9LH74a+YdCOVy
 +fE=
X-SBRS: 2.7
X-MesageID: 14030104
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,536,1574139600"; d="scan'208";a="14030104"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 12:08:02 +0000
Message-ID: <20200310120802.31625-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
References: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 3/3] ts-memdisk-try-append: Call
 selecthost
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
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gN2Y0OWFiYWEwZmY5MWQ2ZGMxNTkyZWE4MGYxMDIxMWM1MmZiMDNjNAogIGFyY2ggcmVwbHVt
YmluZzogUmVwbGFjZSBtYW55ICRye2FyY2h9IHdpdGggJFtnXWhvLT57QXJjaH0KSSBhY2NpZGVu
dGFsbHkgYnJva2UgdGhpcywgYnkgbm90IHNwb3R0aW5nIHRoYXQgdGhlIHBlcmwgZnJhZ21lbnQK
ZGlkIG5vdCBjYWxsIHNlbGVjdGhvc3QgYW5kIGhhcyBubyAkaG8uCgpGaXggdGhpcyBhcyBmb2xs
b3dzOgogICogUGFzcyBhbGwgb2YgdGhlIC10cnktYXBwZW5kIGFyZ3VtZW50cyB0byB0aGUgcGVy
bCBydW5lLgogICogSW5jbHVkZSBhIHNpbXBsZSByZXBsaWNhIG9mIHRoZSBhcmcgcGFyc2luZyBv
ZgogICAgdHMtZnJlZWJzZC1ob3N0LWluc3RhbGwgKG5vdGFibHksIHdlIGRvbid0IHBhcnNlIG9w
dGlvbnMsCiAgICBhbmQgaW5zdGVhZCBhc3N1bWUgdGhlIGhvc3QgY29tZXMgbGFzdCkuCiAgKiBD
YWxsIHNlbGVjdGhvc3QuCgpDb21wYXJlZCB0byB0aGUgc2l0dWF0aW9uIHByaW9yIHRvIDdmNDlh
YmFhMGZmOSwgd2Ugbm93IGNoZWNrIHRoYXQgdGhlCmhvc3QgaXMgYWxsb2NhdGVkIHRvIHVzLCBl
dGMuLCBiZWZvcmUgbG9va2luZyBhdCB3aGF0IGFyY2ggdGhlIGpvYgpzcGVjaWZpZXMuICBBZGRp
dGlvbmFsbHksIHdlIHdvdWxkIG5vdyBob25vdXIgaG9zdF9hcmNoIGlmIGl0IHdlcmUKZGlmZmVy
ZW50IHRvIGFyY2guICAoQ3VycmVudGx5LCBpdCBpc24ndC4pCgpDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm95Z2VyQEZyZWVCU0Qub3JnPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1tZW1kaXNrLXRyeS1hcHBlbmQgfCA3ICsrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90cy1tZW1kaXNrLXRyeS1hcHBlbmQgYi90cy1tZW1kaXNrLXRyeS1hcHBlbmQKaW5k
ZXggMmZlMThmNDUuLjRiNTRlZmYwIDEwMDc1NQotLS0gYS90cy1tZW1kaXNrLXRyeS1hcHBlbmQK
KysrIGIvdHMtbWVtZGlzay10cnktYXBwZW5kCkBAIC0yMyw4ICsyMywxMyBAQCBhcmNoPWBwZXJs
IC1JLiAtZSAnCiAgICAgICAgICAgICAgICAgdXNlIE9zc3Rlc3Q6OlRlc3RTdXBwb3J0OwogCiAg
ICAgICAgICAgICAgICAgdHNyZWFkY29uZmlnKCk7CisKKwkJb3VyICR3aGhvc3QgPSBwb3AgQEFS
R1Y7ICMgYXJnIHBhcnNpbmcgYm9kZ2UKKwkJJHdoaG9zdCB8fD0gImhvc3QiOworCQlvdXIgJGhv
ID0gc2VsZWN0aG9zdCgkd2hob3N0KTsKKwogICAgICAgICAgICAgICAgIHByaW50ICRoby0+e0Fy
Y2h9IG9yIGRpZSAkITsKLSAgICAgICAgICAgICAgJ2AKKyAgICAgICAgICAgICAgJyAiJEAiYAog
CiBjYXNlICIkYXJjaCIgaW4KIGFtZDY0KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
