Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277218D795
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 19:46:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFMbu-0006hK-DH; Fri, 20 Mar 2020 18:43:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFMbs-0006hF-Uq
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 18:43:08 +0000
X-Inumbo-ID: a4224194-6ada-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4224194-6ada-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584729788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eDHlgNwkK4QcMwAiaAIzWWnIk92AYRBKDqNBUR0XJH0=;
 b=T4XbF31WsSljsbWhnaYObzrwag7mbyZNJhUgJim3P8bPupnmgbkRaFrq
 INNvGXd8cwQxVkuSWVi/JDFKvN5d33w0WPuy7GXmkMOW4qUIf+Zcod7di
 5wbZa0gpDwPz32vWBj9zykcp869UBcgfxjhO1G8ui3tMruAHhqOjAz7AQ Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VBmlsuA/HccNcQeVtzUW4HxVFtobLeMwWrKqWjnoHUvg3k5IgNijDlp2kcW5tUaMii/jtk+i3m
 S1X+nx6zcBifnfOL/LXzzIWXdsvTKhrksGqMNbcT+yWZQTYKi0ByvGK5Sy1/zpLW6mpKGfFCCU
 /A3QhIFLkboUDd/9YtS3+c4SGOa7DAVCamfpbRBzllV8mPTeFOWTRLvYMjqRYLETD4rjKBFWcW
 FB2BwIUz9mrMYGD7jpJIVbNKPJ7BT0X60UjJu3DMaY/T6VuKsvNfvISyle9HDJtNKa5dTmWFAL
 dfM=
X-SBRS: 2.7
X-MesageID: 15017152
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,285,1580792400"; d="scan'208";a="15017152"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 19:42:37 +0100
Message-ID: <20200320184240.41769-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 0/3] x86/guest: use assisted TLB flush in
 guest mode
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGlzIGlzIHRoZSByZW1haW5pbmcgb2YgdGhlIGFzc2lzdGVkIFRMQiBmbHVzaCBz
ZXJpZXMuIFRoaXMgbGFzdCBzZXQgb2YKcGF0Y2hlcyBlbmFibGUgdGhlIHVzYWdlIG9mIHRoZSBY
ZW4gYXNzaXN0ZWQgZmx1c2ggd2hlbiBydW5uaW5nIG5lc3RlZApvbiBYZW4uCgpUaGFua3MsIFJv
Z2VyLgoKUm9nZXIgUGF1IE1vbm5lICgzKToKICB4ODYvdGxiOiBpbnRyb2R1Y2UgYSBmbHVzaCBI
Vk0gQVNJRHMgZmxhZwogIHg4Ni90bGI6IGFsbG93IGRpc2FibGluZyB0aGUgVExCIGNsb2NrCiAg
eDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggd2hlbiBhdmFpbGFibGUKCiB4
ZW4vYXJjaC94ODYvZmx1c2h0bGIuYyAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgMTQg
KysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAgICAgIHwg
IDYgKysrKysrCiB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jICAgICAgICAgICAgICB8ICA4ICsr
KystLS0tCiB4ZW4vYXJjaC94ODYvbW0vaGFwL25lc3RlZF9oYXAuYyAgICAgICB8ICAyICstCiB4
ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMgICAgICAgICAgICAgICB8ICAzICsrLQogeGVuL2FyY2gv
eDg2L21tL3BhZ2luZy5jICAgICAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tL3No
YWRvdy9jb21tb24uYyAgICAgICAgfCAxOCArKysrKysrKystLS0tLS0tLS0KIHhlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvaHZtLmMgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFk
b3cvbXVsdGkuYyAgICAgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogeGVuL2FyY2gveDg2L3Nt
cC5jICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2ZsdXNodGxiLmggICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrKystCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDE3ICsrKysrKysrKysrKysrKysrCiAx
MyBmaWxlcyBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgotLSAK
Mi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
