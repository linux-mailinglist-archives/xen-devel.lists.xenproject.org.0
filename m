Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FDE2090
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:27:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJQa-00056I-B5; Wed, 23 Oct 2019 16:24:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jB4Q=YQ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iNJQZ-00056D-CS
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:24:03 +0000
X-Inumbo-ID: 862f745c-f5b1-11e9-bbab-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 862f745c-f5b1-11e9-bbab-bc764e2007e4;
 Wed, 23 Oct 2019 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571847842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HVMZIZQ2aBnZ6SpYXCA7TMejLZ5BMlTuG254O8UscJo=;
 b=hH29Iip7QOk8iLkzrivndo0KbBCcwwLb7GsGWX8z7Oxd071urU9ROr2F
 2Spm0KaLQ5w8mdHuBX+kGhwBWZStbGuGp+1H9UrYj8+pxXWGK0hoOnMKk
 SPKL2DVGP1tPK5Yqh65CDa9J6RSgBy2HIigzFA8mE3v9KbjeQ0f3nroHS s=;
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
IronPort-SDR: T+V7yF0tXhGhbyhZmSo8hBsRTxF4wAURm4hecDMIxHkla6HdS/ZFhMVYc5SD7EEqeTQ3Fkhx48
 j+IRJ8unRTxBldn1ugKEHFHlTlKfhIvkxxIDEKtG9NJ/hE6wCIGT2qT0zmdAk+aZw7B9f+umOq
 Yv8Xelb6hqBL3MMQJnddB50wCFPWCLh3jFfvLWcDkx9e812//95NhTCf/bRo6DIiBL5HIpR3jg
 c9ES9VFZmeG7H3DxHo5lGrsRvF3PjrNj+szz/tY2usztRtc+qeU3YHmFLzNC/pT+XAxQmN0/V+
 UeU=
X-SBRS: 2.7
X-MesageID: 7680495
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7680495"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:23:58 +0100
Message-ID: <20191023162358.7222-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] golang/xenlight: Fix libxl_domain_shutdown and
 libxl_domain_reboot as well
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm90aCBhcmUgbm93IHBvdGVudGlhbGx5IGFzeW5jaHJvbm91czsgcGFzcyBpbiAnbmlsJyB0byBy
ZXRhaW4Kc3luY2hyb25vdXMgYmVoYXZpb3IuCgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpSZWxlYXNlIGp1c3RpZmljYXRpb246IFRo
aXMgaXMgYSBidWcgZml4IGZvciA0LjEzLgoKQ0M6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBh
aW5mb3NlYy5jb20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5n
bwppbmRleCA1OWI4MTg2YTY0Li45MDJjYmI4MzllIDEwMDY0NAotLS0gYS90b29scy9nb2xhbmcv
eGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvCkBAIC0xMDQxLDcgKzEwNDEsNyBAQCBmdW5jIChDdHggKkNvbnRleHQpIERvbWFpblNodXRk
b3duKGlkIERvbWlkKSAoZXJyIGVycm9yKSB7CiAJCXJldHVybgogCX0KIAotCXJldCA6PSBDLmxp
YnhsX2RvbWFpbl9zaHV0ZG93bihDdHguY3R4LCBDLnVpbnQzMl90KGlkKSkKKwlyZXQgOj0gQy5s
aWJ4bF9kb21haW5fc2h1dGRvd24oQ3R4LmN0eCwgQy51aW50MzJfdChpZCksIG5pbCkKIAogCWlm
IHJldCAhPSAwIHsKIAkJZXJyID0gRXJyb3IoLXJldCkKQEAgLTEwNTYsNyArMTA1Niw3IEBAIGZ1
bmMgKEN0eCAqQ29udGV4dCkgRG9tYWluUmVib290KGlkIERvbWlkKSAoZXJyIGVycm9yKSB7CiAJ
CXJldHVybgogCX0KIAotCXJldCA6PSBDLmxpYnhsX2RvbWFpbl9yZWJvb3QoQ3R4LmN0eCwgQy51
aW50MzJfdChpZCkpCisJcmV0IDo9IEMubGlieGxfZG9tYWluX3JlYm9vdChDdHguY3R4LCBDLnVp
bnQzMl90KGlkKSwgbmlsKQogCiAJaWYgcmV0ICE9IDAgewogCQllcnIgPSBFcnJvcigtcmV0KQot
LSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
