Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBFCB17F2B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 11:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067004.1431993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyX-0006oP-2q; Fri, 01 Aug 2025 09:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067004.1431993; Fri, 01 Aug 2025 09:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhlyW-0006mQ-UF; Fri, 01 Aug 2025 09:22:52 +0000
Received: by outflank-mailman (input) for mailman id 1067004;
 Fri, 01 Aug 2025 09:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0QZ=2N=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uhlyV-0006Wd-KC
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 09:22:51 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1825ef52-6eb9-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 11:22:50 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI1PR03MB10032.eurprd03.prod.outlook.com
 (2603:10a6:800:1c7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 09:22:43 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8964.023; Fri, 1 Aug 2025
 09:22:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1825ef52-6eb9-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htXMl8gFRBj3SLuhJjO77sE76IParomrBpfrZ7mHESjhFCZA9V7gUFdD8oCam0Od2z3TDt/iin4LS5AcCsRu2AT6cDUmZGFTRfMLZr9rU++h3DofUNAyWpzZwbpOGuHegveWkE5vpszA0oyCdvXnbsEj5lwf1XKimpGmhlUtTLZLlLB92MIXg3RDYGJxt2fAVu91OQGMiHbephZTWMrFHIdARjMJrx4O1Ea10ONgeJKoN/FBu0YtmvmIrENn+Fo5AeN3BjsHy3cH5TsLm5XB6t/IS/i2VVbG+udbxDV9rJByokQH+ikg9HFL+ZaA9rkfRZj6uzEA/99kOQhSMf1dPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zlQ9RsmD85LL2B66MlIxD5xfPP4ETtjgZvJ6aWslpI=;
 b=Yla8oTQ6gxG5F1eGI1WSNlSoeROvIYyZKHGvB5ZruT1pZTVM0AA8uOpMUHMlST/p/lrx/JFEBrRBIQYU9IQ8X981g2aPGuzdzXP+qGPYvqor+PSKkvK1dIx2w915X2zkA14rZn7wtvF1nwY3Dybz8bUh9Jw/tGzJUm2se1/rk6ojcoPI2oOkUejyMHpdrxtcfm9DR+gzaDMBcdOhif7EJPboHPl4OvXnxgYDz+IcfG1bgUyHZl+NuUV78ic9AWW4SvusDo2L66d3fHFp1476bFGiAmCwyOlZXbdqVIF2qLySZoWHSxhyPvgeecplXMVTCnHiLcHQZpIxMftDzHJh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zlQ9RsmD85LL2B66MlIxD5xfPP4ETtjgZvJ6aWslpI=;
 b=GR9XyI4wY0mVAnrgLh6STd2ogC9v4+wvQRFl8u3RLCcHo1L9bRiGWWOnoulRVaLAP7ipoKRhacjJvm6vDfL3f6cLbuPm1DdqEULY/T7TJUK09sbvCIR/8VIyAdKgEbgmGh+KEXUROQFt1qYaeCKGax/Bt545kZmtoJYcOSWlk8cfofC950nr9SMIe3oGUqbh5jxs5eA5W6tuagbPkRC0EYAbnn8caDN93WlJq+2hYL2kkqSAQlbARAdilifsOURVsBQi/ERXqMr4JmVJoq8lQDVwXvOoaeIzxGNCOorX7xlKlSFo9aqnNMavPIbyBD8x74KK3j0qMl8waUI+mjF8/w==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v1 2/3] xen/pci: modify pci_add_device to handle device add by
 Xen
Thread-Topic: [PATCH v1 2/3] xen/pci: modify pci_add_device to handle device
 add by Xen
Thread-Index: AQHcAsXVSnyGYKO2WEup/omKSt+BHQ==
Date: Fri, 1 Aug 2025 09:22:43 +0000
Message-ID:
 <32cf834e95664805604b13d10bcaa857897f0890.1753968306.git.mykyta_poturai@epam.com>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753968306.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI1PR03MB10032:EE_
x-ms-office365-filtering-correlation-id: e0adab0a-389b-49e2-2b06-08ddd0dcf887
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lzt0XJvpf5GNBAVYxzS8XNBUyLFEOTwfoHpQUVhxclER5ZqLkb8pu02XRl?=
 =?iso-8859-1?Q?L0ORC9V4g8aNPnsT8GSOYB9Wrbm4ntrzdNnzkNVjxl04l0Zgvm5xA4CK31?=
 =?iso-8859-1?Q?vMRWECCAtrVU7ygn+l3ZunOnzPqMhPCdYXjxozoVrJRUAE/KHjGI9YebL6?=
 =?iso-8859-1?Q?ciwVBvJC7Hm5q1r563gWa6XxtrYHyTVnrrvD+NN2Se0locup8YJyL2+X5n?=
 =?iso-8859-1?Q?Ixs+NbMTNj8HojjCrgsCLIjWjPpCJcnzp2qmxEZrSR5Jmo4HJ1L2tPX1kI?=
 =?iso-8859-1?Q?CdW2FQqkWCHdCH5Q2257fUx738BExELy581rJEr6tGN3zUXR+YQVCbwboL?=
 =?iso-8859-1?Q?S+YM7pgh/rBN7Ul2wbCn5nxZI28kv0aLXZVtkfNxn0QGK2nS7Vffevd2Ii?=
 =?iso-8859-1?Q?sl6PNcCagCEXUXgVpYk2OCTJgMsu8dJRbzFfH77+CcOIUnBSuIUeRlQTmp?=
 =?iso-8859-1?Q?wW5RCCSKbznmvPWoZSTd4FSvPPPSLkeBvlJ030MO4TRzKLKcUzOn/ieJ/S?=
 =?iso-8859-1?Q?HBqMzEQkEaF+MDE8fgrAQNXPVgMucyzDb3EdVeGjLmaVZwIiM5Z6Spa+FV?=
 =?iso-8859-1?Q?ud8MKoc1tVY9ARN4a/dMKfL8uZp3Ch39aCW2Z777hq9DrbcTmt70b65OjE?=
 =?iso-8859-1?Q?3v9UweWAXVuVTNnObE41cRDida4gclOmr30xKrgWWwTsV15cSH9F4PFEM2?=
 =?iso-8859-1?Q?wTxz+yBgIkgBBGZ94PjWIZoSB3vfKmTu8cX4JDqhCobT6SwnFvYw/hSn5T?=
 =?iso-8859-1?Q?0XGBnyZ1k7qQP/AM2pMCT7nKulh5PSVgOpGg6XmAecxqXO+ri6DhQEDCp2?=
 =?iso-8859-1?Q?f+btlxWa9XZflx25osfqWS5DR6ZAQ9zMFH1kWV1yN9h2PULHrZt7lMfyTt?=
 =?iso-8859-1?Q?S0+vv8c+ahSAMw03lZflQDs70w2m2bO7XPuDeDWIVj9ciKzOz52Bp2AkWQ?=
 =?iso-8859-1?Q?4tB38OiDE+g9uoksCG8fktljryjLtMhGZK/O4d2kIPHVUSvBLt5cCWDOxi?=
 =?iso-8859-1?Q?DnMhxxeandxNM+E0jXYj++VIydbL9kFzRZlzEAWxzV92G/eVhiUUyu1X7I?=
 =?iso-8859-1?Q?Z9wkjx9LpLA4KdZsP3ECtv9CgHzhtbv/QIjFJhLcvf0FwfNZIF0I7rqzG/?=
 =?iso-8859-1?Q?xdV84BJpyV8tVtc4eKmmnvYmOEcOjzXPwK7cIlT+plmjhNwy20iUsgLPPT?=
 =?iso-8859-1?Q?Qc0VlzDN0zLD/pgthIz9VxvGcoiY8mINiKyhsmzbGROIJBT8VuKWgh32nv?=
 =?iso-8859-1?Q?1z8Dr3AMw502cYiVfyx0MtyeG4fXqIVYwd73b+3cNgSNVf4Id5lf95lTrI?=
 =?iso-8859-1?Q?RB3/gEI5vXRiNiVKvZz1b0yu7KBYA1RGzU/aSwfejfZ73znPSMla1aIhjo?=
 =?iso-8859-1?Q?mV9HASUxXVPwQaJ2GIKGX1M+PnQQvcDRK4+BZmp0ICEZNRD7k2fDZ6t1pi?=
 =?iso-8859-1?Q?HiQ/yFr/Wp78eI9h4HY6uw39wboWYSAE1Av9EES4kBEcTtXR4VBaY58lLe?=
 =?iso-8859-1?Q?EFM67FuQnZXixIxWniz1Jf0n/0J0XmddAgY52sNpU/EjTD+AcXFqo7Tgtp?=
 =?iso-8859-1?Q?bIoqtlw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LKKh5X2TOAZqS97An7R1JDl3zU8JyvH91rsjWC5P8fFzuZB9wyY0/Q2pjI?=
 =?iso-8859-1?Q?9SpYH4j6dsmIAVO4VVqwsxonEUnzY2QsaATYc4G60thkbEhGK+V6GFRBmT?=
 =?iso-8859-1?Q?tiaPgl3UbiD8hjn0Hf8S3cLeQ6JtSp/si9d+Imwk6em1547K65Zh6witPR?=
 =?iso-8859-1?Q?0E+QCdvL8w0lTyo8JgevgcZA2roAMbymgx6okglN9nkx4/nuy+ZNbZf0PV?=
 =?iso-8859-1?Q?Dpko7g6pduOBKtoh/JrlVS94V3jWkBeu2wcLOuQ+g8ztvm2uhSaeb41T3p?=
 =?iso-8859-1?Q?Hfbj8ApwhIU+ZRW/BpHCbkjkumvV2OmT3JGsGVglBIZsuj+/IHNMgD4Bf+?=
 =?iso-8859-1?Q?2iPuSgMtdWau7Obcq8aDsjgkZ+1Z+wfSgE9GPWlTj31hsVyt+E0VDdnauV?=
 =?iso-8859-1?Q?awv5L3aErwsSS6e2kEWwDpNYixXbfVsLgm5ey6z20qOUN1h41kkcqpKl+s?=
 =?iso-8859-1?Q?Zv9QgffdPNVg+n40jcxWkvqdfp4E18a5CE12SJ/V3NKFWjctW+6OELC3Pg?=
 =?iso-8859-1?Q?2DDlsrS0NC9rYuc6rvgCCb0x2JeZj32jwbs8YEH/OVUhS3PumRE0zT0Hhe?=
 =?iso-8859-1?Q?NERPzi6R5L2BUBFjB8PU8UcCRlzHolwYvybq2f2FS/o/3cOy7Qh4yCYOLl?=
 =?iso-8859-1?Q?DrlGVHlexNCw61sU9v5u/T6HrAc3xyxip+30a3GwDzyuDVlgyNF1aQWG8A?=
 =?iso-8859-1?Q?sir5+BRQpVnjgZtpT6yMfsG3jK7Jbsw66qVbsOlfAjpBGC5sFjnmPi0HFc?=
 =?iso-8859-1?Q?6md9vNKiGo2lmYfx8gCPzpDmD/b9F66f4IaAl1JMU4hQWwKXUhWoYCfDyQ?=
 =?iso-8859-1?Q?9wSY0PzoKmA379EhI7r99zBn8PwpkIymbDjoGjxef87YbPwhkUAUSvavvq?=
 =?iso-8859-1?Q?i61cMffoveGNTahqntzsDJqmfK2HyBfV6VgDFK/2W/fiMo8Y/vnV2jSiPK?=
 =?iso-8859-1?Q?cU2UNfri7DkL3z/hBH6zxb83ZT4nv3J4+YBMFIb+Fy2+md/DgAE6FoQY/F?=
 =?iso-8859-1?Q?ZUPI/qhR0fAHmZbjw8RVoUI4Ndi9XDl9T5awznwD3MyUAjVcgQBvhwcddh?=
 =?iso-8859-1?Q?t9o+XjwRGQAnrEjdBheCpGbI8AYgPJKUUXVMIpn3gQb7rjWBaF+L2SmH66?=
 =?iso-8859-1?Q?ArSvym/aRoRCGqhhGvsZS6nWtPIyUPW3WKNE/kul4Al21IH5HPnuvVF7ws?=
 =?iso-8859-1?Q?Fk5ANpJoyCbk/Yc6bhjvqp2XjlsVFdHSsKdbofvnlxNakdGtuYGT/qqqzz?=
 =?iso-8859-1?Q?oF/CtCm6/IgvfB+MmdZYcKzWRVo/hMzwhTm8NcG4ZiszNo8QIMaBTmqerZ?=
 =?iso-8859-1?Q?qP8Dv8QUhfXCW6T0XqT0MRsDldUWY9YyA4Jwt+++xOebp4nEVhrbM3E00d?=
 =?iso-8859-1?Q?KwZxjF1MtvHyTrKa2vM+thVTC9m7F/TkgZRes3TEI9VwmWytUmimJ/Fqhj?=
 =?iso-8859-1?Q?fjH97maCAWZcLV7jIyKaoU7eRIOzSlstChduoTq9IM32db1y2LEeScvUSd?=
 =?iso-8859-1?Q?jXVO8Ly/C0+7mbJMt/pokT3E13wXDf8VisKEQNc6Gxf30wGAqoDJkvXLv1?=
 =?iso-8859-1?Q?Apum4gz4XYMkZAN0ugyF/TyT3N9y4oBDjeLjswGigmehqrbaRuMewdrzM1?=
 =?iso-8859-1?Q?oq0SIGS7jOWSUZrXwj+J0jicLUAnD6F+sFpdpIxM0tUOjefv83D/KL+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0adab0a-389b-49e2-2b06-08ddd0dcf887
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 09:22:43.2717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dbZZQK/UQt/EQAnTtI2KXvP5z4n7WFq53WAoQ49sX86/4cf0pSOOiVSrbAQ1wLrU/uuw5rMCougVGu/kt6nZiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB10032

From: Luca Fancellu <luca.fancellu@arm.com>

Currently pci_add_device is called from hypercalls requested by Dom0
to add pci devices and when the device has no domain associated with
it, it is assumed that hardware_domain is the owner.

On the dom0less scenario, the enumeration is performed by the
firmware and Xen at boot time might want to assign some pci devices
to guests, so it has to firstly add the device and then assign it to
the final guest.

Modify pci_add_device to have the owner domain passed as a parameter
to the function, so that when it is called from the hypercall the
owner would be the hardware domain, otherwise when Xen is calling it,
it would be another domain since hw domain could not be there
(dom0less guests without Dom0 use case).

In pci_add_device there is a call to xsm that doesn't consider the
requester of the function to be Xen itself, so add a check to skip
the call if the owner domain is dom_io, since it means the call is
coming directly from Xen.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
(cherry picked from commit f0c85d9043f7c9402e85b73361c8a13c683428ca from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)

changes since cherry-pick:
* s/hardware_domain/d/ in some write_unlock calls in xen/drivers/passthroug=
h/pci.c
---
 xen/arch/x86/physdev.c        |  9 ++++-----
 xen/drivers/passthrough/pci.c | 32 ++++++++++++++++++++------------
 xen/drivers/pci/physdev.c     |  3 ++-
 xen/include/xen/pci.h         |  2 +-
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 4dfa1c0191..9e894ce665 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -446,8 +446,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         if ( copy_from_guest(&manage_pci, arg, 1) !=3D 0 )
             break;
=20
-        ret =3D pci_add_device(0, manage_pci.bus, manage_pci.devfn,
-                             NULL, NUMA_NO_NODE);
+        ret =3D pci_add_device(hardware_domain, 0, manage_pci.bus,
+                             manage_pci.devfn, NULL, NUMA_NO_NODE);
         break;
     }
=20
@@ -477,9 +477,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
         pdev_info.is_virtfn =3D manage_pci_ext.is_virtfn;
         pdev_info.physfn.bus =3D manage_pci_ext.physfn.bus;
         pdev_info.physfn.devfn =3D manage_pci_ext.physfn.devfn;
-        ret =3D pci_add_device(0, manage_pci_ext.bus,
-                             manage_pci_ext.devfn,
-                             &pdev_info, NUMA_NO_NODE);
+        ret =3D pci_add_device(hardware_domain, 0, manage_pci_ext.bus,
+                             manage_pci_ext.devfn, &pdev_info, NUMA_NO_NOD=
E);
         break;
     }
=20
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index fa03dafac7..49a39d69db 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -654,7 +654,7 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned=
 int pos,
     return is64bits ? 2 : 1;
 }
=20
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
+int pci_add_device(struct domain *d, u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node)
 {
     struct pci_seg *pseg;
@@ -672,9 +672,12 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         type =3D "device";
=20
-    ret =3D xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | dev=
fn);
-    if ( ret )
-        return ret;
+    if ( d !=3D dom_io )
+    {
+        ret =3D xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) |=
 devfn);
+        if ( ret )
+            return ret;
+    }
=20
     ret =3D -ENOMEM;
=20
@@ -767,9 +770,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     ret =3D 0;
     if ( !pdev->domain )
     {
-        pdev->domain =3D hardware_domain;
-        write_lock(&hardware_domain->pci_lock);
-        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
+        pdev->domain =3D d;
+        write_lock(&d->pci_lock);
+        list_add(&pdev->domain_list, &pdev->domain->pdev_list);
=20
         /*
          * For devices not discovered by Xen during boot, add vPCI handler=
s
@@ -779,25 +782,30 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( ret )
         {
             list_del(&pdev->domain_list);
-            write_unlock(&hardware_domain->pci_lock);
+            write_unlock(&d->pci_lock);
             pdev->domain =3D NULL;
             printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
             goto out;
         }
-        write_unlock(&hardware_domain->pci_lock);
+        write_unlock(&d->pci_lock);
         ret =3D iommu_add_device(pdev);
         if ( ret )
         {
-            write_lock(&hardware_domain->pci_lock);
+            write_lock(&d->pci_lock);
             vpci_deassign_device(pdev);
             list_del(&pdev->domain_list);
-            write_unlock(&hardware_domain->pci_lock);
+            write_unlock(&d->pci_lock);
             pdev->domain =3D NULL;
             goto out;
         }
     }
-    else
+    else if ( pdev->domain =3D=3D d )
         iommu_enable_device(pdev);
+    else
+    {
+        ret =3D -EINVAL;
+        goto out;
+    }
=20
     pci_enable_acs(pdev);
=20
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index d46501b884..1b59bf1246 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -50,7 +50,8 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         }
 #endif
=20
-        ret =3D pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, no=
de);
+        ret =3D pci_add_device(hardware_domain, add.seg, add.bus, add.devf=
n,
+                             &pdev_info, node);
         break;
     }
=20
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 5c242278b9..77a44aea70 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -227,7 +227,7 @@ void setup_hwdom_pci_devices(struct domain *d,
 int pci_release_devices(struct domain *d);
 int pci_add_segment(u16 seg);
 const unsigned long *pci_get_ro_map(u16 seg);
-int pci_add_device(u16 seg, u8 bus, u8 devfn,
+int pci_add_device(struct domain *d, u16 seg, u8 bus, u8 devfn,
                    const struct pci_dev_info *info, nodeid_t node);
 int pci_remove_device(u16 seg, u8 bus, u8 devfn);
 int pci_ro_device(int seg, int bus, int devfn);
--=20
2.34.1

