Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0517910FBD1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 11:36:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic5VI-0004Z0-Vq; Tue, 03 Dec 2019 10:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pRqY=ZZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ic5VH-0004Yq-PR
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 10:33:59 +0000
X-Inumbo-ID: 69f06e78-15b8-11ea-81d9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69f06e78-15b8-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575369238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sNQa6bEbpIRBkGvzXiMpsm6WzpDBp22a8py3EX3VKvU=;
 b=C9Zn9kHCtmENRzHVjdEugzy1C4C3CUABlXitdmJ9a5FG75LT3D6pInI4
 gjAOej0WrXVzF/5stgNbLwE/RqXwYtJz1hatfv1EjmIxLXroXRqG/nJCB
 pL7UXuHseoCCqEsiim0hrtuu+pxTcAZT/C+woSHX7Hr0D2iOlo7/N6GLc s=;
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
IronPort-SDR: T+x9etNRh42b1Oadu9Xl258ZOwQlFlJEXutWYd24Bds4lSgL5N0BST6+LW5wHfnTXIH9xGBSxT
 wBJMK70Lz7nLzYifedh2O9GexlIr2cI5oWSEh8tvA7Kzfg1OAPWtFiFQca8I4SxBKepAGxU+2+
 rryyAr8uBIpwiZUi1Pi92pTREV7gGS/xWNPphcbB4dKIe5hAkzoO2g7wHg0GGFB2DtF677L600
 x6ugnYR9pYZpZOYUKOpWB0E97lmC9xcHqMgjrOgLh7GoYJmAzoYHfUWYjIZ+17CYNG4BNXVyai
 pVM=
X-SBRS: 2.7
X-MesageID: 9516636
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,272,1571716800"; 
   d="scan'208";a="9516636"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 11:33:50 +0100
Message-ID: <20191203103352.29728-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] automation: improve tests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpTbWFsbCBzZXJpZXMgdG8gaW1wcm92ZSB0aGUgYXV0b21hdGVkIHRlc3RzLCBmaXJz
dCBwYXRjaCBlbmFibGVzIFhlbgpjb25zb2xlIHRpbWVzdGFtcHMgYW5kIHRoZSBzZWNvbmQgb25l
IGluY3JlYXNlcyB0aGUgdGVzdCB0aW1lb3V0IHRvIDMwcwpzaW5jZSB0aGUgY2xhbmcgUFZIIHRl
c3RzIGFscmVhZHkgdGFrZXMgfjEwcyB3aXRob3V0IHRha2luZyBpbnRvIGFjY291bnQKdGhlIHRp
bWUgdG8gaW5pdGlhbGl6ZSBRRU1VLgoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAo
Mik6CiAgYXV0b21hdGlvbjogYWRkIHRpbWVzdGFtcHMgdG8gWGVuIHRlc3RzCiAgYXV0b21hdGlv
bjogaW5jcmVhc2UgdGVzdHMgbWF4aW11bSB0aW1lIGZyb20gMTBzIHRvIDMwcwoKIGF1dG9tYXRp
b24vc2NyaXB0cy9xZW11LXNtb2tlLXg4Ni02NC5zaCB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
