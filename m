Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CECA9472
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 21:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179431.1502926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXh-0006Qg-Tc; Fri, 05 Dec 2025 20:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179431.1502926; Fri, 05 Dec 2025 20:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRcXh-0006OS-Qt; Fri, 05 Dec 2025 20:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1179431;
 Fri, 05 Dec 2025 20:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rowU=6L=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vRcXg-0006OM-Ls
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 20:36:40 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 171d36f2-d21a-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 21:36:35 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AM7PR03MB6182.eurprd03.prod.outlook.com (2603:10a6:20b:140::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 20:36:31 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 20:36:31 +0000
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
X-Inumbo-ID: 171d36f2-d21a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdIyAYJ292A9DvCHtLkfRCP9fjUu8lKLZYPRkk32B7NvYx7mz0dLVNw21ddyjMNxB5pqQ1csUTqCY0zeQWhV/WrvLWMsjnC3Fk8OwSZcxyFCwGcz9kN9PrIwQMWdeYUqYAYtVwufNNk4xMPPrz/HyVMV95RD/+7dv2sWHnyTr6X7H8g5Xi4ARbKiRGz/Bjfyf1JKjd6fAlCajgAn1jsVgwww1XbTPAx/WP4UfcrRhmbBffOwOK9Ltxrxpm9OI3jeUoWEwnU/nvYsxg+jFE1haTFYLKjdpnV/VAzzkkIFAPfhmOODfowNFfakl65IbKI62q28yO6sI1VuH5+DCSC+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA5BhbhYY4M/JOIT3p9VQwyw3l0aCB7jasnjvH8F6Xk=;
 b=LRa+oGqKLHoYboaVVyyWNhExx7jVozv51IdmOR7UVwplOOGuU79WLJF9yph7IwnrAbfQItdS1JO5O4B6mOQY9wpI6uTeROr5dJTM+MCrkEUV/gCY8B3ObZSrBvx9mBkUyahQKl23rrxiWQw5vqoh6pl98bZ+xdyV7ixbjvxbvyEeMRoSoiG/i3ZJ9ff5UgUznj8FSRBASjd6/E3V9TteX3iEn9kVOdVfngjmmjWCMpwm+hkbSa1UX8JTL8hfPq3nrM7AupqRMCtUu3yUCKVPWyeFWuq2UfgmyYW2Y44ctfJ6bu+uc5z2nLR6CunPBi5TDSld4gKXUY5Hq8fowNVdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA5BhbhYY4M/JOIT3p9VQwyw3l0aCB7jasnjvH8F6Xk=;
 b=ILfDqAgtG+K8A9r362laSsee9vFvaYGAJ9o63+V01yRWFgcAnC1U58KSwblTLBK81BtwJeUjzuySZMADzM1nqv8tRDmb1mGPYpas5kFI1DDG3jN1c0il3T7ipYVksLJ7PpYDtUi2781xBRXGsMyJ+PA9o4t9bybgk0ITV80zOG3ABR9FVSP7/fSfrL0axlKu4zq4GdJxFdM6FLYXUd3oox5SL0Rrul76Sq7T2a4/TinBQX3hBHQujtzRWMIW/n69SpW518xpD76LJ86wwG07aZXNZXh+LsQ/yqa13OPW1NeMJodY8umn2kNj5QkFeVRFP4lRjm9nIrWn30w7XXc7ZQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 0/4] Align handling of domctl/sysctl unsupported commands 
Thread-Topic: [PATCH 0/4] Align handling of domctl/sysctl unsupported commands 
Thread-Index: AQHcZibWGCY4W4S370OKBLIMh6NLpw==
Date: Fri, 5 Dec 2025 20:36:31 +0000
Message-ID: <cover.1764961645.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8322:EE_|AM7PR03MB6182:EE_
x-ms-office365-filtering-correlation-id: 76d6af85-2610-4c89-6c92-08de343df991
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ILC+NtPJOBzaz/0FdAwIILRzZaqYRlEHJ9pMmHLAafBudUkHbVyNWyJs5+?=
 =?iso-8859-1?Q?v9pkaTID6kn5qSgacgXmAk8dwHatqVLQEFdrPkyLjK+zxYK50BEc/yu/2J?=
 =?iso-8859-1?Q?oKggvKnVGVweTKdV/bdhoJskKVlm4YFc1NTKge9TpRZUKmc9arMpgoMCgm?=
 =?iso-8859-1?Q?M1mcaOuQNaca5bIcLuXFRzCyILTl8u2C7/Bwav8JrJVEQ24jAcDgwe9+dx?=
 =?iso-8859-1?Q?cskR9WKERJs4bJ3Tmor+OdVodkjyOj0rMc1NLkhN48B4lq5g1hLRsmZx29?=
 =?iso-8859-1?Q?ysyXmynD8bu5gIwOABohfySDFureeAQps23QaJ4HdmO0i0ifS60a6cJGIl?=
 =?iso-8859-1?Q?LHgCSqE9SZYk/yKwCOcx4CEleAaB81lHnfdseLh12A5NYA3thAuP193Sm2?=
 =?iso-8859-1?Q?TELhdBPS2b7ubgDIKlwbZHLiPBPqdRBtabcFw63n2jVFLKvuE3kL0dJvWz?=
 =?iso-8859-1?Q?XiogKOjj49Eo8BSamT46qaZDaqXmd/kUfFGuoH0B1GbCd+Asj4L+imBwZ1?=
 =?iso-8859-1?Q?o9aFjQHu8VnDAB9KcoDKdbHlTeOZRX1y8XWKeZe2bjm9IZPZKXS5G1K5pR?=
 =?iso-8859-1?Q?bJdxcWMSyxNAtJgty2OXeDGy+chA03mVMfe14vYUto5bG6cKQkidLFLqTV?=
 =?iso-8859-1?Q?dLFOgrY0C3Coko1hwjF3id62FoeaIuJ+vuTJABf5dPubkKtkNmcXdbYhlG?=
 =?iso-8859-1?Q?oBZXSYYzBc248jGV3oG9lJQ+AgSmHTGx4w4EfkYLNEtD5wLJYsUkfBtHvV?=
 =?iso-8859-1?Q?M1aTL1b16B9M+E3DURUhKl0P5Or/Jn3m6sUCoVIV2bzo8rYzs7r7w30wIl?=
 =?iso-8859-1?Q?SIhOG+8MulAZSE9eHELN1j67y5gYOTvL/NSv8v9Ikpof0raJNrDkk7/u48?=
 =?iso-8859-1?Q?Bzb0BPEkgPTHuqvhAYslK6wjturQJ/rgqJVvxrnZVnGj+jBYUz26Lenvsh?=
 =?iso-8859-1?Q?jjJvzDiV0Qh56nRJlDDi5Z5uEp7ogpKO/Mnr8hZlH5QhwJwsCGwyEvF3an?=
 =?iso-8859-1?Q?NfmeMOKF9iHB4XDCekKKtELVglxU9SOJF72yPDWyYUCpj3TkF4JpgyF+Go?=
 =?iso-8859-1?Q?fKeAT6NjRvao5tRDudteJVrlXntZ0Y9VEFl1aBZuRmGt6MCt9815pcUDS4?=
 =?iso-8859-1?Q?q4ksiKiD5if/ngoPZq1nxiiHM9tEdkh6I2NteOqo4/wt2am3CZkZKdtAue?=
 =?iso-8859-1?Q?b25Zc2Bvo3J4nE36O1b2/Ieo2lz7cGgwmipwlPM/+Brecm6deJkfvHugGT?=
 =?iso-8859-1?Q?JDH8WEsSpX7GyVMIoAwb8jLUPjjUpCmHw/wNYjnwZs0/enNvQgYf0LR/QQ?=
 =?iso-8859-1?Q?+L34R+8NOcUr9h24OI34VnCJ9/2k+Au79IMBCWxM5scvodV2yYOYJAOcr8?=
 =?iso-8859-1?Q?YlBUl8llsFLQJxRsJ1CQ/XhAVY1H7uMpoLFBKXmqg1bAWpNnwjBW+2fuIn?=
 =?iso-8859-1?Q?VcspEpW274v52+28SaiwCovMyK1gfTCbUF814xhjfAy3Fi6ZKU4Ha4uDXr?=
 =?iso-8859-1?Q?v6WPSHhAPP4kQI0k5hP4CFhtwsus5DWbSdRrJ5b3YL7jIVH4ehruRcNjUR?=
 =?iso-8859-1?Q?XQ0NLs4laVTW0lOp+q/mmqaY81VT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZTML2IXd5CL8lyFybzG+0lL5NAVZwGPLQ+guf/hQFxQSwVe7husN78Suid?=
 =?iso-8859-1?Q?qtH9sfSbvGX6ot/2AdJByha7PxxSpIwaAVJwHQ9aIyksOHVrbz0qQDo3TT?=
 =?iso-8859-1?Q?8soJjQ4JaPsqZ1Z7bhjmal4CLVpVRLq7QIyKboFWtMLckpX0adYZg/sTwK?=
 =?iso-8859-1?Q?ULlCdEqPK8a8e0I8cJnYT8xtE0p6lfwSYJt/jizD3IYhw+QPK6Iu6IrpCC?=
 =?iso-8859-1?Q?OxvdwrzoOjC4RAW5sM0xJZUTYL/lBleQ5AplGhwqj2R8/4EH+T5D62y4uH?=
 =?iso-8859-1?Q?FiFTx6Mwn8yaB3XCjQlGRto1tNWyHTYV8EfJJ9G3XJSfV8jNFsh7vIZ2hl?=
 =?iso-8859-1?Q?HOF9K1fsbOoCysceHSFvRW57kcu0nsXwFzgCMfaccibcPuzNhDnZHmwGKO?=
 =?iso-8859-1?Q?7/BtIEoVPqQuebQtebXOd0CA2WtPtC1sxQ/wFYta0i1rNNT4/bmazDQY/a?=
 =?iso-8859-1?Q?Q3mNKg399HRpXyU9JMHuJ9r0YxDRaGSgCsguDbLzfu/f30zjvun0QeVdb7?=
 =?iso-8859-1?Q?csQoI5qFdKXanqMPZ4dy1GJQ75B6GrYwj8ftSf4UXjB8WlqOpOWqK22APS?=
 =?iso-8859-1?Q?PfKnPSupppcObFguPKIlwOQjErVOWIWrW/00IQfeGCX0viJN8K3XEYFP1F?=
 =?iso-8859-1?Q?jxJqu8AiSimQKLX8Fm3yhJKHu5tx7oYEppRtZ3DeIhb9UAGX+XGHWShs4n?=
 =?iso-8859-1?Q?tSnL7Es+UF429aNM0u+L3lSAklT3dbi3IVv0q46iva2J0WaH/gDZOhlQxj?=
 =?iso-8859-1?Q?uONmjNI/uZzJ9pjyjZPIzFHo2WwX8MdivfH5B0CLqu+wjhbWhqnIiw/lEG?=
 =?iso-8859-1?Q?qMfTK6ex8Oj+jwkR94SZeU/kl+/BIWULmcM5YV6slK1FnnkqaLdfYX7oDN?=
 =?iso-8859-1?Q?tLeFGigHpC48KQRlWzWCELaao2+ndO+uIxcW3hIQN4riPsXpEBcnFkKrAr?=
 =?iso-8859-1?Q?PJvgQIaoi4XiZaYRery6DrD3X/8ySUZ3dbNWvbFc/WynxlyYfWiiogho6A?=
 =?iso-8859-1?Q?m8ygBKOMI8MN0F4uyJba8JAyPr3UzhpEgL9F3i3wKGtW2+2nL33UodvoLt?=
 =?iso-8859-1?Q?/JUqEQ4JCkqgc/WVikkg0DQzQP37npMyEe1f4S8KZpFO9wUAMQH+CJRLeb?=
 =?iso-8859-1?Q?Ie8hd6jIMcrK6Fk4F6OMQagPI+EoKrY6y+EaE8qjqFjHp2p5N8Qjke9Gpx?=
 =?iso-8859-1?Q?K57WjLErDRjCZ16Q463poMLlPvLxmEETNbnFy9rFIycIKHKr1THy83r65O?=
 =?iso-8859-1?Q?7svcZHzoxMJeQwCRaVhkOUQEDUiFEXfB/0dCvSPFdqiQ2meKByHC/DDSck?=
 =?iso-8859-1?Q?HgGAz7uM5cDLdtQcSaz/j2hTwu/W/XFYhLkY4cilq02+RNCBhwGk2gkwpx?=
 =?iso-8859-1?Q?bHdn2BAK3HS+CmbJkORSR31JhvUdlu3JOcel/f/f6FDemE35Uno4tvI902?=
 =?iso-8859-1?Q?4qyRSQ+d/LcFvGnSle7dUGeLlN94kkRko0K4sxrtYlC1Uya8eoGgvJQYRZ?=
 =?iso-8859-1?Q?qCLJRChlLi3YkjoBcom7TfoiU+vIbVPl5DmBD95WZg39eLXPP4cwMWyIRY?=
 =?iso-8859-1?Q?quO/noKK7ncIEzdL5f1r+qUjp4g5w+kNBr+THf0k8fpFq3JQZY90Wp0Fuu?=
 =?iso-8859-1?Q?2YO7yxQhZUqHpU3660CXuv2bLMGQC0ilAG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d6af85-2610-4c89-6c92-08de343df991
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 20:36:31.7425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEYdPtwhiHBxfe2Hpkyd6rpKHEipEdPtzr7daCZuxCxeHDxumWM3jz19u8oPjSgAottWsr4mAwss45/dOnFjqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6182

This patch series provides minor updates to the domctl and sysctl handling
of unsupported commands. Currently the behavior diverges: some commands
return -EOPNOTSUPP, while others fall back to the generic -ENOSYS. =20
This series aligns the behavior so that unsupported commands consistently
return the appropriate error code, allowing the control domain to correctly
identify unsupported operations.

Where possible, IS_ENABLED() is used to detect disabled commands at compile
time, enabling dead code elimination.  For commands where stubs are
provided, the stub functions are updated to return the correct error code.

The only exception is XEN_DOMCTL_irq_permission, which cannot use
IS_ENABLED() due to PIRQ-specific structures being unavailable when PIRQ
support is off.  In this case, classic #ifdef blocks remain in
place.

There may be future updates in this regard. This initial series is intended=
 to=20
get maintainers' feedback on the approach taken.

Milan Djokic (4):
  arm/domain: Update SBSA_VUART_CONSOLE config option handling
  domctl: Provide appropriate error code when PIRQs are not supported
  domctl: Provide appropriate error code when VM events are not
    supported
  sysctl: align handling of unsupported commands

 xen/arch/arm/dom0less-build.c     |  4 ++++
 xen/arch/arm/domctl.c             |  3 +++
 xen/arch/arm/include/asm/vpl011.h |  2 +-
 xen/common/domctl.c               | 25 ++++++++++++++---------
 xen/common/sysctl.c               | 34 ++++++++++++++++++-------------
 xen/include/xen/livepatch.h       |  2 +-
 xen/include/xen/perfc.h           |  4 +++-
 xen/include/xen/spinlock.h        |  6 +++---
 xen/include/xen/trace.h           |  2 +-
 xen/include/xsm/dummy.h           |  4 ++--
 xen/include/xsm/xsm.h             |  6 ++++--
 xen/xsm/dummy.c                   |  2 ++
 xen/xsm/flask/hooks.c             |  5 ++++-
 13 files changed, 63 insertions(+), 36 deletions(-)

--=20
2.43.0

