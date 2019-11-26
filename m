Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73C109F47
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:29:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZas1-0002GC-Jo; Tue, 26 Nov 2019 13:27:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZarz-0002Fy-Ri
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:27:07 +0000
X-Inumbo-ID: 70866a98-1050-11ea-a3a1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70866a98-1050-11ea-a3a1-12813bfff9fa;
 Tue, 26 Nov 2019 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574774826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hd/QUkxYxNM2Xsuq7q602uBS9foRpaJTp4htD9cOAGg=;
 b=Ko316iZfr8ZllKfZM+wTZ50LlnEjN31a2lcDgt7zLRYarHzoQXwbPYNr
 z5ggBGccVRq2RcPeRraE0D6C6Wagb3OVp95NmGvCvZV/9waxx/KQ49iAM
 p98etOr0G7WjyBHxQTdITqCFxSQcQIZ1/J1iRNRxoprgFgkiA6oHJp5Qv 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PLQacz+Cqp5PZHGSwa4s0PI41PB8II38MOhfi/Ra5lrVIhwaCDFAsz0MrY0pfDQquCRgonljRe
 yLsAdmRk9w6mbnm6OO4lYDJ5loZufm8y38vZiXBC7hVHjF0zv/ft+dqzLTW5K7dudb0FqPPLly
 1n/lGQiZa8UWLO/QMzN8c6N6Cgp2frKP2YzLqwuO7giXUrkSaEpKNgkJEawazwKCoe2fgmYyDO
 ZZA6dj8YFe8pq/Q2if/FsfgC0OnQ2vraxCYdbbX/sSiS/XM4/uSogP42bweoyqVZlXNfIgE4Pb
 uGg=
X-SBRS: 2.7
X-MesageID: 9257574
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9257574"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 14:26:46 +0100
Message-ID: <20191126132648.6917-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v3 0/2] x86/vmx: posted interrupt fixes
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW0gdG8gc29sdmUgdGhlIGlzc3VlIHJlcG9y
dGVkIGJ5IEpvZSBKaW4gcmVsYXRlZAp0byBwb3N0ZWQgaW50ZXJydXB0cy4KCkkndmUgZGVjaWRl
ZCB0byBzZW5kIGEgbmV3IHZlcnNpb24gYmVjYXVzZSB0aGUgcHJldmlvdXMgb25lIHdhcyBtaXNz
aW5nCnRoZSBmaXJzdCBwYXRjaCwgYW5kIEkndmUgYWxzbyB0YWtlbiB0aGUgb3Bwb3J0dW5pdHkg
dG8gYWRkcmVzcyBKYW4ncwpjb21tZW50cyByZWxhdGVkIHRvIHBhdGNoIDIuIEl0J3Mgc3RpbGwg
bWlzc2luZyBmZWVkYmFjayBmcm9tIEludGVsCmhvd2V2ZXIuCgpUaGFua3MsIFJvZ2VyLgoKUm9n
ZXIgUGF1IE1vbm5lICgyKToKICB4ODYvdm14OiBhZGQgQVNTRVJUIHRvIHByZXZlbnQgc3luY2lu
ZyBQSVIgdG8gSVJSLi4uCiAgeDg2L3ZteDogYWx3YXlzIHN5bmMgUElSIHRvIElSUiBiZWZvcmUg
dm1lbnRyeQoKIHhlbi9hcmNoL3g4Ni9odm0vaXJxLmMgICAgIHwgIDcgKysrLQogeGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMgfCA3NyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkK
Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
