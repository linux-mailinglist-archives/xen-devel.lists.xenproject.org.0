Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3005FA67
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:59:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3BS-0005w3-3F; Thu, 04 Jul 2019 14:58:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3BP-0005ui-VG
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:57:59 +0000
X-Inumbo-ID: 1ce7fc91-9e6c-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ce7fc91-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:57:59 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ExyLaEm0yel+ApHibEIlWZqvOSUPAe72yi2+KiK4wVj8ajlm3eFjJLEddVZzkakPjwO9ZLdfD/
 DF8yL//fYoz+NrK+HuDZEnQg/t5MvnefctGmhuVWVclO87HPkwn4r8JzG4MHhUPNzDVnAmFW1f
 YRN/nhG6Sp2VK8yxaV6zi+o0vxNJ1zrdIjDSFhp/iMJJmQmaf7PJTXCTP01sQ1DpKSNi86mVoR
 AnD5IUMbGGVAUI9JuCUJLrg8rZANwwEWHPkHUxGkzdk1G894JFwLSGsh92WO3tPyZrHLQbBPIP
 xyg=
X-SBRS: 2.7
X-MesageID: 2617757
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2617757"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:28 +0100
Message-ID: <20190704144233.27968-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 30/35] OvmfPkg/OvmfXen: Override PcdFSBClock
 to Xen vLAPIC timer frequency
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGNkRlNCQ2xvY2sgaXMgdXNlZCBieSBTZWNQZWlEeGVUaW1lckxpYkNwdSwgdGhlIFRpbWVyTGli
CmltcGxlbWVudGF0aW9uLiBJdCB3aWxsIGFsc28gYmUgdXNlZCBieSBYZW5UaW1lckR4ZS4gT3Zl
cnJpZGUKUGNkRlNCQ2xvY2sgdG8gbWF0Y2ggWGVuIHZMQVBJQyB0aW1lciBmcmVxdWVuY3kuCgpS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
QWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAg
ICB2MzoKICAgIC0gZXhwYW5kIGNvbW1pdCBtZXNzYWdlIGJvZHkgdG8gYmUgc3RhbmRhbG9uZQoK
IE92bWZQa2cvT3ZtZlhlbi5kc2MgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvT3ZtZlhlbi5kc2MgYi9Pdm1mUGtnL092bWZYZW4u
ZHNjCmluZGV4IDY4ZDgyZGE3YWEuLmJjNmI2NjAyYzYgMTAwNjQ0Ci0tLSBhL092bWZQa2cvT3Zt
Zlhlbi5kc2MKKysrIGIvT3ZtZlBrZy9Pdm1mWGVuLmRzYwpAQCAtNDM5LDYgKzQzOSw5IEBAIFtQ
Y2RzRml4ZWRBdEJ1aWxkXQogICAjIFBvaW50IHRvIHRoZSBNZGVNb2R1bGVQa2cvQXBwbGljYXRp
b24vVWlBcHAvVWlBcHAuaW5mDQogICBnRWZpTWRlTW9kdWxlUGtnVG9rZW5TcGFjZUd1aWQuUGNk
Qm9vdE1hbmFnZXJNZW51RmlsZXx7IDB4MjEsIDB4YWEsIDB4MmMsIDB4NDYsIDB4MTQsIDB4NzYs
IDB4MDMsIDB4NDUsIDB4ODMsIDB4NmUsIDB4OGEsIDB4YjYsIDB4ZjQsIDB4NjYsIDB4MjMsIDB4
MzEgfQ0KIA0KKyAgIyMgWGVuIHZsYXBpYydzIGZyZXF1ZW5jZSBpcyAxMDAgTUh6DQorICBnRWZp
TWRlUGtnVG9rZW5TcGFjZUd1aWQuUGNkRlNCQ2xvY2t8MTAwMDAwMDAwDQorDQogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMNCiAjDQogIyBQY2QgRHluYW1pYyBTZWN0aW9uIC0gbGlzdCBvZiBhbGwg
RURLIElJIFBDRCBFbnRyaWVzIGRlZmluZWQgYnkgdGhpcyBQbGF0Zm9ybQ0KLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
