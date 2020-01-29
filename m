Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61114CA99
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:15:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmDC-0007po-QR; Wed, 29 Jan 2020 12:12:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV5r=3S=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iwmDB-0007pX-OR
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:12:49 +0000
X-Inumbo-ID: a4e93456-4290-11ea-8396-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4e93456-4290-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580299961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oi+cHxgzi+PRqZzIj79s83RFuw3z+sUy9q8sfMqAjwk=;
 b=hkMeypcAc9EPTzmI1+iqtsKEEkZOn8JrsGg2wT7QAa+GKGgUmAy4QnKk
 OxVwluqUeV+qydrsKmislZf0LU4+URgI0oo1s+Yq5R7wVB0gjP3e6LfYb
 LOgGkFcJ1PgtRArwBWlu29vGt+hMHtjsqiPGhzLd7c078JZnDAHb2Ktei w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6jNr9SSSuM1D6vlqD/rgQgOzyrJEiP4S/+iGYfURrVy4cTAnpvdA+T1H8NYbTDQbSGsXl4Xc2X
 3YfkD1NfCo0gvkvcW1iacSUHJX3iUMIyiLlckkmriJzzONWsUkc8FauzFHqZEyx1axFSA06mCd
 +Tz6/d8+6dK4WuW334Qf+MYkANCcwoE7MZ5mf3cTZjgXvIo1japyyUBcmERRpdpPvmVQboG4ET
 EceSnB8y4p2NT5uADo+cjDlAVMmbfSJLtkryB9pP/NZUQWP1znVL3p+8gKKTvv8lJSC0GFLzPF
 uR0=
X-SBRS: 2.7
X-MesageID: 11606517
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11606517"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Wed, 29 Jan 2020 12:12:32 +0000
Message-ID: <20200129121235.1814563-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129121235.1814563-1-anthony.perard@citrix.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
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
Cc: Bob Feng <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming
 Gao <liming.gao@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2hhbmdlIHRoZSB2YWx1ZSBvZiBQY2RGU0JDbG9jayBh
dCBydW4gdGltZSBpbgpPdm1mWGVuLCBzbyBtb3ZlIGl0IHRvIHRoZSBQY2RzRHluYW1pYyBzZWN0
aW9uLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lk
PTI0OTAKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+Ci0tLQpDQzogQm9iIEZlbmcgPGJvYi5jLmZlbmdAaW50ZWwuY29tPgpDQzogTGltaW5n
IEdhbyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Ci0tLQogTWRlUGtnL01kZVBrZy5kZWMgfCA4ICsr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL01kZVBrZy9NZGVQa2cuZGVjIGIvTWRlUGtnL01kZVBrZy5kZWMKaW5kZXgg
ZDAyMmNjNWUzZWYyLi44ZjVhNDgzNDZlNTAgMTAwNjQ0Ci0tLSBhL01kZVBrZy9NZGVQa2cuZGVj
CisrKyBiL01kZVBrZy9NZGVQa2cuZGVjCkBAIC0yMTk0LDEwICsyMTk0LDYgQEAgW1BjZHNGaXhl
ZEF0QnVpbGQsUGNkc1BhdGNoYWJsZUluTW9kdWxlXQogICAjIEBWYWxpZExpc3QgIDB4ODAwMDAw
MDEgfCA4LCAxNiwgMzINCiAgIGdFZmlNZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RQb3J0ODBEYXRh
V2lkdGh8OHxVSU5UOHwweDAwMDAwMDJkDQogDQotICAjIyBUaGlzIHZhbHVlIGlzIHVzZWQgdG8g
Y29uZmlndXJlIFg4NiBQcm9jZXNzb3IgRlNCIGNsb2NrLg0KLSAgIyBAUHJvbXB0IEZTQiBDbG9j
ay4NCi0gIGdFZmlNZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RGU0JDbG9ja3wyMDAwMDAwMDB8VUlO
VDMyfDB4MDAwMDAwMGMNCi0NCiAgICMjIFRoZSBtYXhpbXVtIHByaW50YWJsZSBudW1iZXIgb2Yg
Y2hhcmFjdGVycy4gVWVmTGliIGZ1bmN0aW9uczogQXNjaWlQcmludCgpLCBBc2NpaUVycm9yUHJp
bnQoKSwNCiAgICMgIFByaW50WFkoKSwgQXNjaWlQcmludFhZKCksIFByaW50KCksIEVycm9yUHJp
bnQoKSBiYXNlIG9uIHRoaXMgUENEIHZhbHVlIHRvIHByaW50IGNoYXJhY3RlcnMuDQogICAjIEBQ
cm9tcHQgTWF4aW11bSBQcmludGFibGUgTnVtYmVyIG9mIENoYXJhY3RlcnMuDQpAQCAtMjI5Nyw1
ICsyMjkzLDkgQEAgW1BjZHNGaXhlZEF0QnVpbGQsIFBjZHNQYXRjaGFibGVJbk1vZHVsZSwgUGNk
c0R5bmFtaWMsIFBjZHNEeW5hbWljRXhdCiAgICMgQFByb21wdCBCb290IFRpbWVvdXQgKHMpDQog
ICBnRWZpTWRlUGtnVG9rZW5TcGFjZUd1aWQuUGNkUGxhdGZvcm1Cb290VGltZU91dHwweGZmZmZ8
VUlOVDE2fDB4MDAwMDAwMmMNCiANCisgICMjIFRoaXMgdmFsdWUgaXMgdXNlZCB0byBjb25maWd1
cmUgWDg2IFByb2Nlc3NvciBGU0IgY2xvY2suDQorICAjIEBQcm9tcHQgRlNCIENsb2NrLg0KKyAg
Z0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZEZTQkNsb2NrfDIwMDAwMDAwMHxVSU5UMzJ8MHgw
MDAwMDAwYw0KKw0KIFtVc2VyRXh0ZW5zaW9ucy5UaWFub0NvcmUuIkV4dHJhRmlsZXMiXQ0KICAg
TWRlUGtnRXh0cmEudW5pDQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
