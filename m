Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED700133F81
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:44:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8k8-0007x0-S2; Wed, 08 Jan 2020 10:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ip8k7-0007wv-31
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:39:15 +0000
X-Inumbo-ID: 180e1864-3203-11ea-b836-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 180e1864-3203-11ea-b836-bc764e2007e4;
 Wed, 08 Jan 2020 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578479947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QVnrRGZjNo0oQhZlYhybEpfaK0mH0aDjJrAPmWPtFzw=;
 b=UbsOfMajXs8MbsCBTh+8FB5wsv9IUOZM6AyDxMvb4WQwULE+sWUnwbO9
 VJLHmGlLMM9PErvAqwUJIAG+MX7+F+v/YRNMpAL7TfPHpdXZom9uJKL7C
 9vLKWu0xSaNhPwDbtzqgfST/JWlIEM3KWghwB54NwrSz2W0v7gPYZZJXn 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fjF+ptxjR33NZJMPFAwJNP+c8JbLrWJ5iyjnkXa6HZ+xS7Oophbu4837iVOR/DMgpJKkBaZU/k
 2wBkEFhe/0HJzgSTEJYZ37jZJIjJVxkeERmpj0woDl4N56Jp/wSOO6Guey+IRR9dseAptAkMu1
 QHonlSVBtAdGnL89WF7H4zcQFYgnH4+l71PgFibL91cb9B0I6tqMKw/HDGqFH+EM+M/MQsXiZy
 7ET30jIYG88PX6zAuMd2yyF1Gczfqc1/06jUavSeD+qTcJo+gG1g634ccTxtC/ZOljnm7YaW1H
 7pc=
X-SBRS: 2.7
X-MesageID: 10777187
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,409,1571716800"; d="scan'208";a="10777187"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 8 Jan 2020 11:38:55 +0100
Message-ID: <20200108103857.77236-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] fix nested interrupt injection on virtual
 vmexit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHBhdGNoIGZpeGVzIGludGVycnVwdCBpbmplY3Rpb24gd2hl
biB1c2luZyBuZXN0ZWQKdmlydHVhbGl6YXRpb24sIGFuZCBhbGxvd3MgdGhlIHVzYWdlIG9mIHgy
QVBJQyBieSB0aGUgTDEgVk1NICh0ZXN0ZWQKd2l0aCBYZW4pLiBQYXRjaCAjMiByZS1lbmFibGVz
IGV4cG9zaW5nIHRoZSB4MkFQSUMgQ1BVSUQgZmVhdHVyZSBiaXQuCgpUaGFua3MsIFJvZ2VyLgoK
Um9nZXIgUGF1IE1vbm5lICgyKToKICBudm14OiBmaXggaGFuZGxpbmcgb2YgaW50ZXJydXB0cwog
IFJldmVydCAidG9vbHMvbGlieGM6IGRpc2FibGUgeDJBUElDIHdoZW4gdXNpbmcgbmVzdGVkIHZp
cnR1YWxpemF0aW9uIgoKIHRvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jICB8IDExIC0tLS0tLS0t
LS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0MyBkZWxldGlvbnMoLSkKCi0tIAoyLjI0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
