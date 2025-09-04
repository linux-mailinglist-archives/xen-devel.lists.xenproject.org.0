Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC891B446D8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110715.1459764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG94-0005qK-SK; Thu, 04 Sep 2025 20:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110715.1459764; Thu, 04 Sep 2025 20:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG94-0005oi-Oo; Thu, 04 Sep 2025 20:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1110715;
 Thu, 04 Sep 2025 20:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG92-0005Me-N1
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:20 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec2c6fe0-89c9-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:01:19 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:11 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:11 +0000
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
X-Inumbo-ID: ec2c6fe0-89c9-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABBq6qnYPiOvPcB3kNkCO8devkBd0sPDBrU/6ROIrfiZA5ruZbA8YmraQwZuqHA/Z13r9K7S0Qu3LH7B0v3P+nXbLrUSmA4PBwHCDvhNGLCWBj7gU7HqURpIagCYv6C2trdNg9iG6hkxemrFs5mN8i7dRUlC4J4eairU3ul0PdoA7alXvyIqi0+Oidd79v0Vxml2Yio3h+RM6Lhl4Ip0kWWECCb4ytxX51td0ulxHkWMa0lCzHp2hsIGrjaqsKeNsOAirxlrQxo8FB8/ViLV27TrRFwCSn12IUhp3In/UpYrHTqRJsSenVdYSWzHPgxli8EzkjnntG6MfhRdViCD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f65apG4C53Gx80G7sqxIHr7SUDXQIALLuO5Rqk5ixqY=;
 b=FKZOipOEUrrp38t7fu42jwDDnhj1tV+ohOP9bFvp/yLpN8hGVKu+Bboc+82R4wQ+AHZQWGH0UfnEHlqXS3wvJKp/r+aCpyJW1t2ENvxSAsEZ7ILyqxKtQlUiYiL/wTF/JB7PR19gLOCyQooTApsecigkBvjLQFDsOkuBMhK4C49Iled2vF3sq0a5aPsV3+kPOtZTde6DIvTiUTKgwQl3KvDtATOZwdqkOcZNacZbD4fBaVS+zrAFU/ls9pf4aLFNPzk2DLIdw1+uXNl4VHizcfA4Dron9Qbka6OFil4lNtUO/j1TEow4+MCzu5bEJSELWwoEmOZGB0AwehKYfRJAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f65apG4C53Gx80G7sqxIHr7SUDXQIALLuO5Rqk5ixqY=;
 b=VgAG0Fgn+3UdqjqZnT+OS1iXmpYxo5xzfDJZmO0EKVj/iMAKXk7pzdbhGm8NjHDI1ow8dyMsW4NWhMIgbWjnMkQA1IQWj5y6Vheuo2XLopygHcUjvWpEvdUdrNriiqUQXxvdWHsCOLlaRgmwvBSFP/8Fx5zhJDO3fTTjUAr80ySKf5vphTXrY9RH/nXi0XGzA709W2C6uJoQeYGJpFBtEzI5VXX79uKoiiyNJxIqFxJjXeg9ndwiiFuFQmDqRS4DhELHezQnUTdcEVuAhF8GDHPulJYZ+AXBF85Rr5uggfvqDsfZKJLOBj+VPQk/CvIFV+oMiX2eQ8+ooL7Dm9YnSg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 02/12] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v7 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcHdap1hDc78ei/Ei0f3qUM8qeYA==
Date: Thu, 4 Sep 2025 20:01:11 +0000
Message-ID:
 <896848d3f4758e45e032351b5759965e041ed220.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 5237f30f-611a-41c3-1894-08ddebedcbd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cf0IDe986aEk3hgOBmSZSpoXYTLiEAtLfdKXLvT2bCz/QYrYJIGlKh2C6p?=
 =?iso-8859-1?Q?Kvn/28HvZgd3ITf6we1Lpzj/+jE+CK8+8N24Q7b5OCPrDSRLI7AKETgLGW?=
 =?iso-8859-1?Q?aHxXWCcVHFkKDRjO0a7SMSH69wUooFZs2jNpVGdwelsYAPO1f52+5pR7Zl?=
 =?iso-8859-1?Q?ZtDuTjqLf3HBNqbXRTfMwivMa5QWopmJ1/oJ25I+IaLwzJWk5VirJtB8kz?=
 =?iso-8859-1?Q?mJWrC+/jrXAVkAk//Qv0M6JdZnVs1x+FZOTjBBVzl2fV2y3TUjuraYM2i7?=
 =?iso-8859-1?Q?0lRLIVsAkJE7rt7O2c8tPAyDV4f6FQNQg5aacFfO8NYhDQwlPmudsCV94f?=
 =?iso-8859-1?Q?nEL3UTLCKKSdkmKkGH7z7j1Rop5bPn9nJTKcpZGoolaFsa4avcbpiro+E2?=
 =?iso-8859-1?Q?wAMLP0Iy/ltQ4RH8RlxT1vfejRl0UVpRrwsvNWEThFSVFWehilPPz3jp49?=
 =?iso-8859-1?Q?alVhUaKE7PEB5wDhHlAurYWEgSl1jPOvm5OROOSKg4Twfsr8JNddeWBi3u?=
 =?iso-8859-1?Q?3724Hjy451mYODzHJ9lu/wH4aW73sH9GKM40zOW9lu1itQ5wZo4HpCc04y?=
 =?iso-8859-1?Q?jwiUQOpq9bznUDc5esrWJNlJXfa2dX/Bhk9qylAvdNHCTP/Xu+CnAljOJt?=
 =?iso-8859-1?Q?8plFFnAs4ldVgRqlx2x9Ph7h9cAFNLFKB2Sj27ZCULQ8A+VnZu4Jh0XxZK?=
 =?iso-8859-1?Q?RCaTDGAON/rtcztEfh9CcfaKMG07AfDZGuTxVROLrGZUeJiFOZz2+c3BQY?=
 =?iso-8859-1?Q?kHJPOg7Gfiouw+EwI1gs5Mi6RkXtfcY9LDwjtMP0csR89mkm4tTnfLpnw0?=
 =?iso-8859-1?Q?AwDMnoklJ/rSNxoanhsAF58aOeI/Ul7atZDPw0y2hpZABk8W4QJGzr5oix?=
 =?iso-8859-1?Q?SLiLmD3xLixHqlyP1hK6hwnIsdzbgF7Z/OVLrb4HiFwSqJ+IPYEhRYXmt5?=
 =?iso-8859-1?Q?j7ModaHw5jk4wfydY5VvxkXEqTc+Dwrm2MQfbqILAZc/HL18H0FRNkYShv?=
 =?iso-8859-1?Q?StF3HcZNE6Jb9mQS+Z3gYDWknbBnC9TxMjRAxiY9vlTP/BLxOWSZnl+t5v?=
 =?iso-8859-1?Q?hEnjDTFp96mYS2PaNmj4cHUE5S+gt+OYeQJOuLNRdAlBKBSdS0POuhMO1x?=
 =?iso-8859-1?Q?hrtgJ0t6mcVF/Wh9FRXEIzDtQxAPLC7xE7Xl0XwVKjkp17RVR9+d78S2ig?=
 =?iso-8859-1?Q?6blxfjD1vJLyOzcO5LovLot33jjjpDTP6vXZ7qBxByymon38N/kfUaSqQ5?=
 =?iso-8859-1?Q?FBM/E/IBHNYPqgSrnMWtW5Dgfm89SIfwqMs2RNoF4Wgdn3zhZ8RyT/qvEU?=
 =?iso-8859-1?Q?MJwi92ddqr020IYXRZdO5WFp53L4OTt5Bvn6dy82HL+C4gEV8VZf7Igdot?=
 =?iso-8859-1?Q?Au3RaZF17p30rXV3aTKYPLKaS/UkhLGzWXIFUHNIuufZnu88YkaaEAlloR?=
 =?iso-8859-1?Q?zhBCkSJ8W+APnyD2uYJVqOzngxf+54YblAo8eHfetjNtUifVqhJCpFoYSH?=
 =?iso-8859-1?Q?VgmLjApr2dFhqzsTpDLJd3bt32JMsBhePwj9XjPa0LIg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mCt6YRpyEfA2JcCbZJ2zTREwdUF74mHJZ6gtOPp0DeubF08TXV9OEoFvjf?=
 =?iso-8859-1?Q?moee0inU5jAJrmpdFH2+G7wEiiz9u9AkaqrqIQCMTWVir4xHjEE4/s2/a8?=
 =?iso-8859-1?Q?dK9BgKmORVV8gFK2HnpsiAk8l7J610LO9c9sE44ECGFwZMosHhe+nrDCPp?=
 =?iso-8859-1?Q?9u5XEflPiqJCX5aoScprdicEYzLonnZORFg6fsUKyeC9V0Syf1svjfW9y0?=
 =?iso-8859-1?Q?W0C0tGJOqtJ1nqtjk8IpXuYIK9JidntBSF3YWkyVd9ialFFBMovMt7zSHp?=
 =?iso-8859-1?Q?/bI9vXQPZvQ6eDPMVJOzMqjxKbH0cgWxMFFmvk6B2txiUM3tnoTIPNlMFP?=
 =?iso-8859-1?Q?NvdREuH+KIn+0Rg42w8A2uM0WQksgI60/6DWhRGGdoNCjv9ypaF8rByh6S?=
 =?iso-8859-1?Q?EDCgmZe32YrG3BskobDDbd0iLTjJbZdBskrWxHDqJD/EUlSz2e9Qs+n6Z8?=
 =?iso-8859-1?Q?hTNpU47j1XhkZH63t2zw0pcugwea4Z+6ozF/pjtFKncXEaVfJhdLkNinxX?=
 =?iso-8859-1?Q?XpQGhwI00QxdYNOvMIwkF4jepHDHc2dQBRfYUlXQYmLqCfphdAhnVE3t2z?=
 =?iso-8859-1?Q?6qPusxIYaY4whYBj3el+V2S6adtIoEBu/6IbehNLVI3SdRfpwqOB9I2ejC?=
 =?iso-8859-1?Q?FhwHId82Zd2NhqMsfWVo+u0SGOubybTa+YUXRc8PbARymf5Q5rPqKC/o15?=
 =?iso-8859-1?Q?iDNo76yzXgvJaB/1vFJE98LcgpWjR6qlmsalokCbCctMpHm9zm8dCxAfdq?=
 =?iso-8859-1?Q?egSTVv6yxQ9iWZNRkvF0ZExf3fw0k6w8NA8hMOAkMYzNQdwtqdwvKYi/98?=
 =?iso-8859-1?Q?tTgY2b3He+Yr6ORp5JHQC36/Vyu75+DAErOvm7AD4v/4S+WaRHyaRYe/qX?=
 =?iso-8859-1?Q?4eI3FxURrQI6HOUtxIzJRJgE4pTBk04Zvxm1I4Xp+aviboubyvjPGb0SyP?=
 =?iso-8859-1?Q?hMh/Rnl+v+iZ3+YlgTQH5Ja+LotIBKgsu+c/+KUjaftDCaEACmiMg67d3S?=
 =?iso-8859-1?Q?SVSaxw+6EHrRMMozbavfQIUGRYPxusFYYAqEWeeGtaizkrDf2B7wXP0i8U?=
 =?iso-8859-1?Q?UWOSB4/6e6ZMojqQRuzYh0hnVAesW8hOUIRf8lgPbMIycV5QcjSw7FANPP?=
 =?iso-8859-1?Q?OSLYLoJwPT0Evv47IrnXKGKat9Jtzf9K+2EV8CWqPoX4kJWYWNizVnUXQF?=
 =?iso-8859-1?Q?+XIjGAbDA0xF66e8DZyZKRchW8JOrHTgdQMoxzi1mOKOtCSfU+cdZvVESD?=
 =?iso-8859-1?Q?lZXrmj5mn1+yzWszsvES+5DpKVpmRIQu8KErJMxednxDcivbkpZH/U7FIy?=
 =?iso-8859-1?Q?2GVMKsFDlqYqq3xXMJ+Go40zB6wJWKqOfJ2Osp1L9uyEISpa5cfdKOMLA0?=
 =?iso-8859-1?Q?69wG/xCLnUvnj4/wC1xeVv7vvqVfme/ZZupAczBgB2uHOXttZVxKLGpYRH?=
 =?iso-8859-1?Q?dq0rZiWvB0UqTPKyRxNMBC/DU6SFdUyPmzTZnN5jOo246hPGlCefZ/Nr+v?=
 =?iso-8859-1?Q?zrBqk4B36638J6Tx9cgFwy7SjD70pWe+HbGzGZ7dUsyoJ6LYKkX7AwURFS?=
 =?iso-8859-1?Q?aLcYStJDZQl5zIULI+anWMPETvcJiUxgXkfAz2CEieefuv3pzhrre0Ygw1?=
 =?iso-8859-1?Q?kLQnMdiU7JJU8eBOXWONTKpuXq7FJE4YzmfidXBFfyoB7EaMC+N7Uq1net?=
 =?iso-8859-1?Q?sQaFJwG3CtnKl6kzbdg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5237f30f-611a-41c3-1894-08ddebedcbd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:11.5910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNuJSajT1wjc0vV9zBCzGTylrQVrM1gGe0xbEHqINQugq46vy2y+mwiv0SnRxuF+0ohHuZ0oGFPNy5zxhs+9bG1EJonpXT0NQGkBq4Zr/D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Introduced two new helper functions: gic_is_valid_line and
gic_is_spi. The first function helps determine whether an IRQ
number is less than the number of lines supported by hardware. The
second function additionally checks if the IRQ number falls within the
SPI range. Also, updated the appropriate checks to use these new helper
functions.

The current checks for the real GIC are very similar to those for the
vGIC but serve a different purpose. For GIC-related code, the interrupt
numbers should be validated based on whether the hardware can operate
with such interrupts. On the other hand, for the vGIC, the indexes must
also be verified to ensure they are available for a specific domain. The
first reason for introducing these helper functions is to avoid
potential confusion with vGIC-related checks. The second reason is to
consolidate similar code into separate functions, which can be more
easily extended by additional conditions, e.g., when implementing
extended SPI interrupts.

The changes, which replace open-coded checks with the use of the new
helper functions, do not introduce any functional changes, as the helper
functions follow the current IRQ index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V7:
- no changes

Changes in V6:
- no changes

Changes in V5:
- fixed a minor nit: moved the existing comment to the line above to fix
  formatting that exceeded 80 characters
- added acked-by from Julien Grall

Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
  gic_is_spi
- updated commit message

Changes in V2:
- introduced this patch
---
 xen/arch/arm/gic.c             | 3 ++-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..4bb11960ee 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,8 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    /* Can't route interrupts that don't exist */
+    ASSERT(gic_is_valid_line(desc->irq));
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..3fcee42675 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_line(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_spi(unsigned int irq)
+{
+    return irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq);
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..7dd5a2a453 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_spi(irq);
 }
=20
 /*
--=20
2.34.1

