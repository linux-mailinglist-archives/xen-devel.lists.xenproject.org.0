Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECBD17567E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:01:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8guc-0000oe-V6; Mon, 02 Mar 2020 08:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8gub-0000oZ-PW
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 08:58:53 +0000
X-Inumbo-ID: 09e22a7e-5c64-11ea-b472-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09e22a7e-5c64-11ea-b472-bc764e2007e4;
 Mon, 02 Mar 2020 08:58:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A993BAD86;
 Mon,  2 Mar 2020 08:58:51 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
Date: Mon, 2 Mar 2020 09:58:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] credit2: avoid NULL deref in csched2_res_pick()
 when tracing
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
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGlzc3VlIGhlcmUgcmVzdWx0cyBmcm9tIG9uZSBvZiB0aGUgZG93bnNpZGVzIG9mIHVzaW5n
IGdvdG86IFRoZQplYXJseSAiZ290byBvdXQiIGFuZCAiZ290byBvdXRfdXAiIGluIHRoZSBmdW5j
dGlvbiB2ZXJ5IGNsZWFybHkgYnlwYXNzCmFueSBwb3NzaWJsZSBpbml0aWFsaXphdGlvbiBvZiBt
aW5fcnFkLCB5ZXQgdGhlIHRyYWNpbmcgY29kZSBhdCB0aGUgZW5kCm9mIHRoZSBmdW5jdGlvbiBj
b25zdW1lcyB0aGUgdmFsdWUuIFRoZXJlJ3MgZXZlbiBhIGNvbW1lbnQgcmVnYXJkaW5nIHRoZQp0
cmFjZSByZWNvcmQgbm90IGJlaW5nIGFjY3VyYXRlIGluIHRoaXMgY2FzZS4KCkNJRDogMTQ2MDQz
MgpGaXhlczogOWM4NGJjMDA0NjUzICgic2NoZWQ6IHJld29yayBjcmVkaXQyIHJ1bi1xdWV1ZSBh
bGxvY2F0aW9uIikKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgotLS0KSXQgdG9vayBtZSBhIGxpdHRsZSB0byBjb252aW5jZSBteXNlbGYgdGhhdAoKICAgIG5l
d19jcHUgPSBjcHVtYXNrX2N5Y2xlKG1pbl9ycWQtPnBpY2tfYmlhcywgY3B1bWFza19zY3JhdGNo
X2NwdShjcHUpKTsKICAgIG1pbl9ycWQtPnBpY2tfYmlhcyA9IG5ld19jcHU7CgphcmUgc2FmZSwg
aS5lLiBtaW5fcnFkIGNhbid0IGJlIE5VTEwgaGVyZS4gSSB0aGluayB0aG91Z2ggdGhhdCB0aGlz
CmNvdWxkIGRvIHdpdGggbWFraW5nIG1vcmUgb2J2aW91cywgYXQgdGhlIHZlcnkgbGVhc3QgYnkg
ZS5nLgoKICAgQEAgLTIzNjAsNiArMjM2MCw4IEBACiAgICAgICAgICAgICAgICAgICAgICAgIHVu
aXQtPmNwdV9zb2Z0X2FmZmluaXR5KTsKICAgICAgICAgICAgY3B1bWFza19hbmQoY3B1bWFza19z
Y3JhdGNoX2NwdShjcHUpLCBjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSksCiAgICAgICAgICAgICAg
ICAgICAgICAgICZtaW5fc19ycWQtPmFjdGl2ZSk7CiAgICsKICAgKyAgICAgICAgQlVHX09OKCFt
aW5fcnFkKTsKICAgICAgICB9CiAgICAgICAgZWxzZSBpZiAoIG1pbl9ycWQgKQogICAgICAgIHsK
CnBvc3NpYmx5IGFjY29tcGFuaWVkIGJ5IGEgY29tbWVudC4gVGhvdWdodHM/CgotLS0gYS94ZW4v
Y29tbW9uL3NjaGVkL2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYwpA
QCAtMjQwMyw3ICsyNDAzLDcgQEAgY3NjaGVkMl9yZXNfcGljayhjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyCiAgICAgICAgIH0gZDsKICAgICAgICAgZC5kb20gPSB1bml0LT5kb21haW4tPmRvbWFpbl9p
ZDsKICAgICAgICAgZC51bml0ID0gdW5pdC0+dW5pdF9pZDsKLSAgICAgICAgZC5ycV9pZCA9IG1p
bl9ycWQtPmlkOworICAgICAgICBkLnJxX2lkID0gbWluX3JxZCA/IG1pbl9ycWQtPmlkIDogLTE7
CiAgICAgICAgIGQuYl9hdmdsb2FkID0gbWluX2F2Z2xvYWQ7CiAgICAgICAgIGQubmV3X2NwdSA9
IG5ld19jcHU7CiAgICAgICAgIF9fdHJhY2VfdmFyKFRSQ19DU0NIRUQyX1BJQ0tFRF9DUFUsIDEs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
