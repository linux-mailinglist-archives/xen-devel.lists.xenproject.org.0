Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F77902B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:01:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82h-0003Iu-Q3; Mon, 29 Jul 2019 15:58:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82f-0003Fb-6K
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:29 +0000
X-Inumbo-ID: b447ca3a-b219-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b447ca3a-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:28 +0000 (UTC)
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
IronPort-SDR: Hn6HSGGiCIQjvrv6DrX4d22VoeyjcDedBidEoKWpC3AqFpqDkUG+VQPM7m7BOMnpk01LDaKP9p
 A/D2cq9+FTl79ls3VF2U1kIoCjtkMWJe5rhiJvic2z32GPcnVAsFkPhHlXf58MRqHXpLIsNY8S
 XdhsGekLxZ/Gj6M6Vat/fLEhJteUeF5IhVoYV/aUepaVYFbWyaaLgmNDuH81wgb+u9JyG+bFw2
 1FAljKSRLd5vJZGNX3gsTvR8nQoEIO8Ck5dp5BrAbPUWC4HfZrFEKSCez8UCLzns9TSEU9I+La
 rjE=
X-SBRS: 2.7
X-MesageID: 3607284
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3607284"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:38 +0100
Message-ID: <20190729153944.24239-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen: Override PcdFSBClock
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
ZHNjCmluZGV4IDIyOTcwZWRhNWQuLjQ3N2Q4Yzc2YTEgMTAwNjQ0Ci0tLSBhL092bWZQa2cvT3Zt
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
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
