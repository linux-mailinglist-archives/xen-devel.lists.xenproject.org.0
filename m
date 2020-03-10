Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C817F727
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:11:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBdgC-0003ys-6P; Tue, 10 Mar 2020 12:08:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ti7X=43=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBdgB-0003yl-2i
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:08:11 +0000
X-Inumbo-ID: ceec3116-62c7-11ea-ad86-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceec3116-62c7-11ea-ad86-12813bfff9fa;
 Tue, 10 Mar 2020 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583842090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X2dXf5aYaklMH/yXWI3Nu3npZn4QEqfFqjQEUeHYZ0U=;
 b=bcrDZ7Im9qvMagaeiwgp7WRboPehxRdH8ycyr14dsWVjM2hMoutLWsD/
 RrwefefGfjl0CpTpotCJyn6P4EqmyNJg0HrCQqHYxQutH84Q02GWG8fUY
 tzroKmIQLvNDFT5jHf3HbyrmzDD9zDrXO3zHA7j19Qh4yX2LaYXyMSsbY I=;
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
IronPort-SDR: PqZ2H7yqXhWYrTx/I5o+EH7jpBm+JM9hZbtY4/+S6yGwY47x6/HvNtAJdl9I0IcaQbInyzCJVr
 CinI7aUmOiBPkEMGmwCKY7zz3HsnKxceeDSOXKZx3zjtY2PygF+PS/PvrVrHzZ6NbE5gLpUkfF
 4XnxtbGOi277RcRRzk6BpXuIqxnZ8O28qKd2XTq02LO/KOmkEBOS5OWxrtXys9va7LmwwS5z6Z
 aGbeeckcusABubxq+VMmCijxLM7RWcw4aQIdE9SgVYqLRRPqoGL7nLz4L/y5XUB/leJx5Gvcd4
 flE=
X-SBRS: 2.7
X-MesageID: 14030102
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,536,1574139600"; d="scan'208";a="14030102"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 12:08:01 +0000
Message-ID: <20200310120802.31625-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
References: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/3] ts-memdisk-try-append: Notice when
 job arch retrieval fails
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

V2UgY3VycmVudGx5IGhhdmUgYSBidWcgd2hlcmUgdGhpcyBmYWlscywgcHJvZHVjaW5nIHRoaXMg
b3V0cHV0OgoKKyBhcmNoPQorIGNhc2UgIiRhcmNoIiBpbgorIGVjaG8gJ0FyY2ggIG5vdCBzdXBw
b3J0ZWQgZm9yIG1lbWRpc2sgdGVzdHMnCkFyY2ggIG5vdCBzdXBwb3J0ZWQgZm9yIG1lbWRpc2sg
dGVzdHMKKyBleGl0IDAKCkl0IHNob3VsZCBmYWlsIGluIHRoaXMgY2FzZS4KCkNDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb3lnZXJARnJlZUJTRC5vcmc+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRzLW1lbWRpc2stdHJ5LWFwcGVuZCB8
IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rz
LW1lbWRpc2stdHJ5LWFwcGVuZCBiL3RzLW1lbWRpc2stdHJ5LWFwcGVuZAppbmRleCBjZmMxNzU1
OS4uMmZlMThmNDUgMTAwNzU1Ci0tLSBhL3RzLW1lbWRpc2stdHJ5LWFwcGVuZAorKysgYi90cy1t
ZW1kaXNrLXRyeS1hcHBlbmQKQEAgLTI5LDYgKzI5LDEwIEBAIGFyY2g9YHBlcmwgLUkuIC1lICcK
IGNhc2UgIiRhcmNoIiBpbgogYW1kNjQpCiAgICAgOzsKKycnKQorICAgIGVjaG8gPiYyICdKb2Ig
YXJjaCByZXRyaWV2YWwgZmFpbGVkPycKKyAgICBleGl0IDEKKyAgICA7OwogKikKICAgICBlY2hv
ICJBcmNoICRhcmNoIG5vdCBzdXBwb3J0ZWQgZm9yIG1lbWRpc2sgdGVzdHMiCiAgICAgZXhpdCAw
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
