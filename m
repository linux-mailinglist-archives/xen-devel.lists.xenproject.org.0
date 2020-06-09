Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD31F4142
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:44:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihMh-0003Au-M5; Tue, 09 Jun 2020 16:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0Bv=7W=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jihMg-0003Ao-Ho
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:44:42 +0000
X-Inumbo-ID: 83e09a7c-aa70-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83e09a7c-aa70-11ea-bca7-bc764e2007e4;
 Tue, 09 Jun 2020 16:44:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7uBIuLbKvPFUYQnstSiXxU9/CdaBgJodt5M046qoF1Hxy0lIfXcl2In3N/uYHWyIBel+mAc6bF
 2CRmHj0Z/j+5ClvvDp3H2dMx0iCxgmDPXROpQMP0OUczyzbD9p9kKKOAVi8WPKvBaxEpw11xam
 GiaYDeWJNkgfEc/Rl8LpiTvVYz5yfIZcF3yeTD0DMi5jyqKyhoIwW3JNfWGghmohTKEtHacgm6
 SJHsFmjwQ+835iWWWpbTed937G0/IA7pr2eCA0aB7Kyc+N+FdBZojbQFKVLRlVZCmllOxXokZp
 AiM=
X-SBRS: 2.7
X-MesageID: 19599142
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19599142"
From: George Dunlap <George.Dunlap@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [TESTDAY] xl restore gives an error too soon after xl save
Thread-Topic: [TESTDAY] xl restore gives an error too soon after xl save
Thread-Index: AQHWPn1DWNbZ6w270UycYgt4Xt7XxQ==
Date: Tue, 9 Jun 2020 16:44:37 +0000
Message-ID: <B965FD5D-549B-48E2-A05A-1E4D405F624A@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A6A0FD1263329A4BB5E1EF09ECAA5658@citrix.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Somewhat surprising that if you save with -D, you get mysterious error mess=
ages for the next so-many seconds:

root@immortal:/images# xl save -D c6-01 /images/tmp/c6-01.save
Saving to /images/tmp/c6-01.save new xl format (info 0x3/0x0/950)
xc: info: Saving domain 19505, type x86 PV
xc: Frames: 524288/524288  100%
xc: End of stream: 0/0    0%
root@immortal:/images# xl restore tmp/c6-01.save
Loading new save file tmp/c6-01.save (new xl fmt info 0x3/0x0/950)
 Savefile contains xl domain config in JSON format
Parsing config from <saved>
libxl: error: libxl_create.c:692:libxl__domain_make: Domain 19505:domain id=
 recently used: No such file or directory
libxl: error: libxl_create.c:1233:initiate_domain_create: Domain 19505:cann=
ot make domain: -3
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 19505:Non-ex=
istant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 19505:Una=
ble to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 19505:Destructi=
on of domain failed
root@immortal:/images# xl restore tmp/c6-01.save
Loading new save file tmp/c6-01.save (new xl fmt info 0x3/0x0/950)
 Savefile contains xl domain config in JSON format
Parsing config from <saved>
libxl: error: libxl_create.c:692:libxl__domain_make: Domain 19505:domain id=
 recently used: No such file or directory
libxl: error: libxl_create.c:1233:initiate_domain_create: Domain 19505:cann=
ot make domain: -3
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 19505:Non-ex=
istant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 19505:Una=
ble to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 19505:Destructi=
on of domain failed

[A few minutes pass]

root@immortal:/images# xl restore tmp/c6-01.save
Loading new save file tmp/c6-01.save (new xl fmt info 0x3/0x0/950)
 Savefile contains xl domain config in JSON format
Parsing config from <saved>
xc: info: Found x86 PV domain from Xen 4.14
xc: info: Restoring domain
xc: info: Restore successful
xc: info: XenStore: mfn 0xbe8d2, dom 0, evt 1
xc: info: Console: mfn 0xbe8d1, dom 0, evt 2=

