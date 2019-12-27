Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211212B5E3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 17:35:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iksXT-0001X0-HX; Fri, 27 Dec 2019 16:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFv7=2R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iksXS-0001Wv-5h
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 16:32:34 +0000
X-Inumbo-ID: 7b70c3ca-28c6-11ea-9c5f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b70c3ca-28c6-11ea-9c5f-12813bfff9fa;
 Fri, 27 Dec 2019 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577464353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tgQVqhpD88Shc5uH6gLTpV0x5POAuDsPV4Q79I6AVyA=;
 b=Qjn0ZEg7ibN1iynJy06PCN0vUkwskjjSePiJ6Fw/6kl81n/OfDTTzplI
 llrIKuPBqvDiVgZWDTMPXflQKYzw3UoOZoDTnprkEY4FQFF+LXyKotmyc
 xRduq0dcoiK12brAApUgGx3z95m1bsc7bm7XMSYxH0SNdDRzBkUCw/ilp k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3BPHlT5ppEa5BEHZK+WdcLxhxN47Pm9UAn0JNWJ9d+ntcUNTfBvFpMD5dOE1Ohen9xmD2iklU8
 OapuyABTygnuBe2O/yU4RMLrE5wupxzv2B1Lz5iyx8oCkGTHUIHH74/sGwocub5k3ha9SM1YNP
 t+dJsKSSTYtPucBKwWyK7C1Kb6JykSZp/ajCpsfi/bZzR8SQDAtj7rO0c2gM09509EIXFwgmGQ
 Te3PpEcq2WjmiHGXTHVa6YKT+JkcwMxEU/5crlmQWnLLTfqAWSHPpGp3K1BjlOm4norOm7Y3bb
 5oI=
X-SBRS: 2.7
X-MesageID: 10626138
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10626138"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 16:32:19 +0000
Message-ID: <20191227163224.4113837-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/9] go/xenlight: Fix CpuidPoliclyList conversion
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RW1wdHkgR28gc3RyaW5ncyBzaG91bGQgYmUgY29udmVydGVkIHRvIGBuaWxgIGxpYnhsX2NwdWlk
X3BvbGljeV9saXN0OwpvdGhlcndpc2UgbGlieGxfY3B1aWRfcGFyc2VfY29uZmlnIGdldHMgY29u
ZnVzZWQuCgpBbHNvLCBsaWJ4bF9jcHVpZF9wb2xpY3lfbGlzdCByZXR1cm5zIGEgd2VpcmQgZXJy
b3IsIG5vdCBhICJub3JtYWwiCmxpYnhsIGVycm9yOyBpZiBpdCByZXR1cm5zIG9uZSBvZiB0aGVz
ZSBub24tc3RhbmRhcmQgZXJyb3JzLCBjb252ZXJ0Cml0IHRvIEVycm9ySW52YWwuCgpTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpDQzog
TmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCiB0b29scy9nb2xhbmcv
eGVubGlnaHQveGVubGlnaHQuZ28gfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGln
aHQveGVubGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXgg
ZTE4ZjBmMzVmOC4uOTlkZTY4MzIwYiAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0
L3hlbmxpZ2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAt
MzE3LDYgKzMxNywxMCBAQCB0eXBlIENwdWlkUG9saWN5TGlzdCBzdHJpbmcKIGZ1bmMgKGNwbCBD
cHVpZFBvbGljeUxpc3QpIGZyb21DKGNjcGwgKkMubGlieGxfY3B1aWRfcG9saWN5X2xpc3QpIGVy
cm9yIHsgcmV0dXJuIG5pbCB9CiAKIGZ1bmMgKGNwbCBDcHVpZFBvbGljeUxpc3QpIHRvQygpIChD
LmxpYnhsX2NwdWlkX3BvbGljeV9saXN0LCBlcnJvcikgeworCWlmIGNwbCA9PSAiIiB7CisJCXJl
dHVybiBuaWwsIG5pbAorCX0KKwogCXZhciBjY3BsIEMubGlieGxfY3B1aWRfcG9saWN5X2xpc3QK
IAogCXMgOj0gQy5DU3RyaW5nKHN0cmluZyhjcGwpKQpAQCAtMzI2LDcgKzMzMCw4IEBAIGZ1bmMg
KGNwbCBDcHVpZFBvbGljeUxpc3QpIHRvQygpIChDLmxpYnhsX2NwdWlkX3BvbGljeV9saXN0LCBl
cnJvcikgewogCWlmIHJldCAhPSAwIHsKIAkJQy5saWJ4bF9jcHVpZF9kaXNwb3NlKCZjY3BsKQog
Ci0JCXJldHVybiBjY3BsLCBFcnJvcigtcmV0KQorCQkvLyBsaWJ4bF9jcHVpZF9wYXJzZV9jb25m
aWcgZG9lc24ndCByZXR1cm4gYSBub3JtYWwgbGlieGwgZXJyb3IuCisJCXJldHVybiBjY3BsLCBF
cnJvckludmFsCiAJfQogCiAJcmV0dXJuIGNjcGwsIG5pbAotLSAKMi4yNC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
