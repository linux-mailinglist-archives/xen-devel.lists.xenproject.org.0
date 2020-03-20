Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1150E18DA1B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 22:28:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFP8c-0003tQ-VX; Fri, 20 Mar 2020 21:25:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFP8b-0003tA-8O
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 21:25:05 +0000
X-Inumbo-ID: 40a20f5e-6af1-11ea-be18-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40a20f5e-6af1-11ea-be18-12813bfff9fa;
 Fri, 20 Mar 2020 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584739500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gRxI7Oc4Wp+Qk0hR4RDsw2VmblvMSH/qTYnP7wNUnfc=;
 b=eEIlIbuvrE6uH1T3FoOjHy/rSdAQYlMuo4kuFIF3rVl+h9+6VAtG0Wl1
 aU4xuQzS4okpn3dI22BSSI82HEZnBxkWygMb5xkseV2R9VkeSzD6FE6Ad
 ROWjmHdJ4IPv00cC/g2O84Hw1sEHJjoIimyyjVIMEdN/TNl4q2zlfzItn Q=;
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
IronPort-SDR: MB9IwGlG5PhaooFKrO4v/o/Rlk7htYlTa13v3F/pdJfFA5wsxypsY723eH1pdUiQ42QWcf8v25
 LekmDdYiZ97KueKGcV3VepxlZC3DnwIisaHstyBkPgG0sIUVTBynNp6ygg3PxDP/qv+nW5MlaE
 F1USN1zk4YvtpukxvGWe3rwVxUJQWsiRLGazWxf/JCEQOcsd2GXT98W2OGjWVFQP4ByKH3rjKw
 nf/pSOtkIHh686VgmhBJ1iWyu31MU4XQBOtPxiJlRFO6aMjyamG/DiCHXJnQlZGpn7glWIx47W
 Xxg=
X-SBRS: 2.7
X-MesageID: 14716097
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,286,1580792400"; d="scan'208";a="14716097"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 21:24:49 +0000
Message-ID: <20200320212453.21685-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200320212453.21685-1-andrew.cooper3@citrix.com>
References: <20200320212453.21685-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] x86/ucode/amd: Fix assertion in
 compare_patch()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBjbGVhcmx5IGEgdHlwby4KCkZpeGVzOiA5ZGEyMzk0M2NjZCAibWljcm9jb2RlOiBp
bnRyb2R1Y2UgYSBnbG9iYWwgY2FjaGUgb2YgdWNvZGUgcGF0Y2giClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUv
bWljcm9jb2RlL2FtZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1k
LmMgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwppbmRleCA5OWUyNDQ5ZWVlLi5k
NGIyODc0ZGU2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwor
KysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwpAQCAtMjIyLDcgKzIyMiw3IEBA
IHN0YXRpYyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgY29tcGFyZV9wYXRjaCgKIAogICAg
IC8qIEJvdGggcGF0Y2hlcyB0byBjb21wYXJlIGFyZSBzdXBwb3NlZCB0byBiZSBhcHBsaWNhYmxl
IHRvIGxvY2FsIENQVS4gKi8KICAgICBBU1NFUlQobWljcm9jb2RlX2ZpdHMobmV3LT5tY19hbWQp
ICE9IE1JU19VQ09ERSk7Ci0gICAgQVNTRVJUKG1pY3JvY29kZV9maXRzKG5ldy0+bWNfYW1kKSAh
PSBNSVNfVUNPREUpOworICAgIEFTU0VSVChtaWNyb2NvZGVfZml0cyhvbGQtPm1jX2FtZCkgIT0g
TUlTX1VDT0RFKTsKIAogICAgIHJldHVybiBjb21wYXJlX2hlYWRlcihuZXdfaGVhZGVyLCBvbGRf
aGVhZGVyKTsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
