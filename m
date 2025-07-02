Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7540AF0C39
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030258.1403886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbc-0000Mc-OC; Wed, 02 Jul 2025 07:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030258.1403886; Wed, 02 Jul 2025 07:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbc-0000Hr-KC; Wed, 02 Jul 2025 07:10:08 +0000
Received: by outflank-mailman (input) for mailman id 1030258;
 Wed, 02 Jul 2025 07:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrba-0000Dm-VB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a81004-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:05 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PAWPR03MB9857.eurprd03.prod.outlook.com
 (2603:10a6:102:2e4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 2 Jul
 2025 07:10:02 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:02 +0000
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
X-Inumbo-ID: 94a81004-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiZ9JIqc5ZS6kmGJbiRFRmiUEDLDdtpqGTCo8iJZM3ddhiBIKVD+2RGu1R/lAt0ZOYk6OIyMDA6ovKu2Nzdc7Sdw3MTp9Ofh3VcK9Lm7gfRCml8NpDbdksVsxRxvdFk6iv+9PFhFxOMne0nWBN7tAe/1N8KlPvdNrCoRQbd4HKcwG45StG8ONP6L2LeFrZKrGgpRYLY0OZvzZPXolLjWW39Nb2dqFVCFZXvN1cyOqzS5M4VRozMYBQUdMwdRfpH0dWr4jCHFaUETTN9c2L6PS0pvfaPjw6Pqu14fW4rlFb0nrsUGRe7x3GJImkq5mLevpFi9b4ehk/bt3M0voAgQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0fIYyRtrGDYb2inwj/9c0Fm/wGYo8/Q2HKicoq4Zks=;
 b=WfcRrVFzS35TwdN1EGi4JbgbMLgaQ3+waO5/c+Mnxg0wgpRh4y5iTiptNZ+aE0HRpUAZyMFJAewoBUgpmkM0rtOg+0a+GpPHxDE2jrpVribJJVq6LFmtdRH8vgUMeC/6sra/A0RKMfovBC5xJYliGi9DkBL0tk01gvbvwisVZFYbvXdQPVr59gbtt/M874dfSAz8yhqb081iGwsZXiGXvDW8Zz/f+OFUvPe6kTlDC+RXImslf9ezpQgHGb7R1UF91Kq1tNXfj0uGWqVOzebLxnSGWjdf3B6aUAvZVr0di7VEksJ4sDuSxFLfLW3VnzQ1uXTtW5Z96pgILffc76rHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0fIYyRtrGDYb2inwj/9c0Fm/wGYo8/Q2HKicoq4Zks=;
 b=X+b2ot4QQsewVD7mTyupxomrk3rqQfVBXIeiQLule99ZedlOl/haDWE/2aicI9O3hAJGprJtEmms28H6nwM8Sg2EDfwpx3mrY5et2pwPjH6RB3vb2aOc2OikuUiayikynRC46CQ0dQtwu0G9Yvkf9SouvO+snWWEh+lxjfYd7SYrNsexZMgxa1UMtOtnUjreXxY+L05A6F07REbAMJoaPM6zhBSvEdt8/07nfKUOU8G028mQ1eQYK8btVSVd80YJoUYeEBeWzU0Wg4YdpCyNV7A1PN9bNttqLRHU5HD+x2SZtC9kTQSxVZwqF4/hTeQAep/Oe7sbN4bY992t1AkMvQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 5/7] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Topic: [PATCH v12 5/7] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Index: AQHb6yBUi/XpEQ96bkGJlOgGIbY7rg==
Date: Wed, 2 Jul 2025 07:10:02 +0000
Message-ID:
 <38959c5bd9f8c3b9d63c8dfbd4be9341d326fe45.1751439885.git.mykyta_poturai@epam.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PAWPR03MB9857:EE_
x-ms-office365-filtering-correlation-id: 54954d49-477f-4077-1507-08ddb93776f2
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FTYPqNSfLxvJ4w0/nP9OAHGEUSUmXY9tuYPdvxXd8mGAnb3W1XF2E1axtr?=
 =?iso-8859-1?Q?4ReI1TgRyvkCPbu8mB6PiGkKxk62qZv1lydHHitEAJuBk+YDp1I+AN1uxU?=
 =?iso-8859-1?Q?+wK8kh3E5gmGeVbyR+MUNicGQ+rquv7PgSljzhsD5+dffk1FxdoPlBAAIh?=
 =?iso-8859-1?Q?0FkuPv5aYe1s3mY4GoWkqnxmc9zD6q0OPw9s+ek3fiOH/Pz3o0Vvczf/2r?=
 =?iso-8859-1?Q?BPUdWKEHAqQck/4dPdexMoLYxHXg5S87K9uR3HqD92OqDa5DM9TA5g+l9C?=
 =?iso-8859-1?Q?TsSdQNt06cvDUQ27eDrFfvphBpyNkU8F3BO/sHTMOW54+C0mmdzyr3qJh8?=
 =?iso-8859-1?Q?P2+P75WS7GWVS1UulT2I/yOI6ntx0hS98+w50eToBcasSyEuNE51QADFLV?=
 =?iso-8859-1?Q?ES9LcvgL9zoYCpKw4RQVEUOOu024kyvu00B+sk3UtAkFLxS5jbAY1bvkRx?=
 =?iso-8859-1?Q?syhvIj5lGQWpUOrPZFwkJ27MwdrOUHkUIRhMnoLcl6aZFmcjkcNypBqYWE?=
 =?iso-8859-1?Q?JOTUsRIEFqH/DtKfdTMDlRM1fCqY0kH5v3d3WvpzG/r804WVeJF0Wcxg67?=
 =?iso-8859-1?Q?kvnaWe8J8gSdfQOf850lQBI6nBEysIqJoXaOoUbS7VhQWZcQLr2OVhEFoY?=
 =?iso-8859-1?Q?9iqioihw/NYUMZHn0oZEUFyAtYSJ+jDnLcBU7doS9qrS7wlvoxboUTKjx6?=
 =?iso-8859-1?Q?vP88m3JmOS+924pBCGAa69KOYiL5FuG8vdVVAFpllImF0mLgkY9n8lHA0e?=
 =?iso-8859-1?Q?ZqnKGdS0CPbffFjTZ5SBflMrvSNIy39PYlMk/hM8QDmVVdUwiRv5JJmB9H?=
 =?iso-8859-1?Q?Wca6/tkiPMUQ8w+dF2TZl5TkN+3fH5nn/rAHWNAIiiV/xmIzDNLL+bPR8S?=
 =?iso-8859-1?Q?9X9h9Mko5tcAxYu/kVy4HYv+FGPF6GOBA2rzza3pftvxYo/008fIkJVnFX?=
 =?iso-8859-1?Q?t+kd+7ft1ze7uSpwcFCxD3TsaQ2ublEZWx2yci3yDm5eNmP77ZBJd3zG3r?=
 =?iso-8859-1?Q?lebWGcMGF7zrSmqKP2YgmGHneNZzCGQOtXo7l6pwrs6egNDaSVy5wMfTiB?=
 =?iso-8859-1?Q?qFy5aHOrujK0OwhUUDNWq0s27Mkx3/poF1NAuaumvc8j+NtOzjHjV4mPpr?=
 =?iso-8859-1?Q?Zd77LEC+uH7deVxDW44sbp47gwpEe882shftydz5eKVV7vE46rbBF1owdj?=
 =?iso-8859-1?Q?NM+sS2umMuSSDsqerszJZYi4B4re9IT1iXRj6cuy5xcczE2wzXLJl43hpa?=
 =?iso-8859-1?Q?2DgdbcOPhXxfd+8ianIJHU0fZhvWv/ox0qcrsN1ei0H2OuBwrT/rp2xnJL?=
 =?iso-8859-1?Q?U3/UAU90VfZ+JEtDBivHVIqq99Qbec/YqlrmxUsgLFDmXJoJaI6Z5M6wP9?=
 =?iso-8859-1?Q?B9AnZ6ZXMxv+elMv/XyaPxKpwaIbYIupf4FHglJ3CXG3zu7KeZdbtgSgVk?=
 =?iso-8859-1?Q?jyHO32MaTy9ZBUm1IEnpCLlpkaYvMiCd7IS2SemIfTiHVTrs4+oodxsJ4G?=
 =?iso-8859-1?Q?o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aF/uFuP3w5OszPwm/FjvXtizc0yVdsmtWhz6hpyi1EjlN+f8MLlSedrYGi?=
 =?iso-8859-1?Q?VY5leNMP8or+WeZgEhTqDmsbCYk/EQYr2T9t6t+GsEAwAg2ZIQUoJjfDCI?=
 =?iso-8859-1?Q?5LqtsXfNIL2SfmlGEjfepcCAUrIWtxo2wHNeTgUnbwl/Stn5Z10rCh+2tr?=
 =?iso-8859-1?Q?ttV/9ExtEPtc5W2dCAys9KKpGrkAehrk5j+1/iI5R9sRKOkoipg1ERjzER?=
 =?iso-8859-1?Q?yWlWx6idm6ek+37wxlWBPkSO9z37GiomDHvqIiCaN4vrw7ivU7f3PnSgPF?=
 =?iso-8859-1?Q?1QtgxZYUsh6bcApUIMRQ4b+UJTn/eOn3pHLWOsRy62Pf+3mUWlDFEH8VPH?=
 =?iso-8859-1?Q?/CFM05uGTVCPOCKMv+O7W+vn30PlfOGEneVH7eCcv0DgXGqZj+mA35hylf?=
 =?iso-8859-1?Q?0vlQSXTdsyRR4vcx47KgQ8MLQ8yP/LqP3j9N7HChNfz8FQNnWYfYlUKq8Z?=
 =?iso-8859-1?Q?vFNiJgGw521slaemZtmeB2aR8wK0igyX2BywZ3mgt+dFQjoJ927X9tuB+o?=
 =?iso-8859-1?Q?HJECLwa9P/++v0cxj0tkrIyrzzmN6U0sgTcu8k/ew1BGvjE+P2BMXcuQAj?=
 =?iso-8859-1?Q?5+lOVXd+SjJkEWk+8CfkNvHNpoX/2iYqpX8koQpLqG8vveKTusFsC3yem4?=
 =?iso-8859-1?Q?diq8Rz5brserApiwE7uK8f0sRAsXSvSvUSfe/9MlqUgPqq0246LNcGnSX0?=
 =?iso-8859-1?Q?g+k33SZhtILXF5oDQWAEAf8hIEuXF12gMQNYvI4GkEFZCaN45TH2yhryof?=
 =?iso-8859-1?Q?fz2gnYcmpHwDNjoJfG6X+AI/W15qQe+6R39luIiB2zeVjSnFyYNKPZqsa/?=
 =?iso-8859-1?Q?jsFKhxxa+r9DEk/8xyq/0OtESfGGBZiF1c+Dug9bSLk0zIMI2Xxvqweoau?=
 =?iso-8859-1?Q?pX3NgiLpHupDcAMQxb7TiPplKNBZunFmiwIH5fnd0cgXY6j/9fx8GYI/YR?=
 =?iso-8859-1?Q?4wqMOU1ocLWfMcVT4aD0rCgOnO326kqNCUuPo7b2HIbeby7KgG7GJ/HchU?=
 =?iso-8859-1?Q?3GnKCRnTq9xu8S0SbN9yCPYKd3pd9MuY7PF4x+PLrOLMUeUm9IDGiPbmvE?=
 =?iso-8859-1?Q?4eJnA9GdHhxj4S1G2g0jE3SuVC+q3fgDQdV+9UIJnp0LICIAbETYmt3IVY?=
 =?iso-8859-1?Q?Pm9NvNMmWCp6pyrvloWF31kMrS02muYT+CuvuVncJ0ERN7zTYzFdrwHNIK?=
 =?iso-8859-1?Q?fQht9YIGrwB3e9eZD+iKTgiCZU4luhmIn1Hko8kUalHpF2TmmUBoSX/P2R?=
 =?iso-8859-1?Q?4qnsuwS3set+n8CXs8W3B7lMY8dCzgiU04jgLbijMT7TKD9BR1rj/i0zq1?=
 =?iso-8859-1?Q?Pwh8Xz4BIVUZ1x/1R8cdCSzSpnoZ3+yIiwKCKgT2xQIuGh6nRL37s92Gvd?=
 =?iso-8859-1?Q?/9gX/Rl0YJimPU9K5mczJQ1pntyZ86a2/Vh+5pMSpsY2m4YkHGwBZjIrPL?=
 =?iso-8859-1?Q?O1t14rwDxKAjSO9h9qzvsZPhBwnhYRJ6DnqBOhBUn44a1FQ5XvPoCp0je9?=
 =?iso-8859-1?Q?k6oXtcuoI+K+jFkllPXGccm13F+L4lIVpSEBlxjr4set0lZASnAKZT/ptp?=
 =?iso-8859-1?Q?Md4n85TdsyNUh4jR0PJ8TCvMm8W4d8ELkHA1LrDJA7LCHV7aP2QQsuiz0u?=
 =?iso-8859-1?Q?Gqc04otkEv56XNQ6MvCpfZgPO7hbhWmjFXxVW7KzrFWIAtJTdp5EDHYw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54954d49-477f-4077-1507-08ddb93776f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:02.6004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zbww1NHaJ0GbLrdRodi5sDDU6L9ER4ivwiDv4/Wk5S9XmlZwd+/6fexewf1auZ0+Y20DvZYeUtoGb5o2wMJCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9857

From: Rahul Singh <rahul.singh@arm.com>

Current code skip the mapping for PCI bridge MMIO region to dom0 when
pci_passthrough_enabled flag is set. Mapping should be skip when
has_vpci(d) is enabled for the domain, as we need to skip the mapping
only when VPCI handler are registered for ECAM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This patch was originally picked up from [1]

v11->v12:
* no change

v10->v11:
* no change

v9->v10:
* no change

v8->v9:
* no change

v7->v8:
* no change

v6->v7:
* add Julien's A-b

v5->v6:
* drop unrelated change in xen/arch/arm/domain_build.c:handle_linux_pci_dom=
ain()

v4->v5:
* new patch

changes since picking up from [1]:
* rebase on top of "dynamic node programming using overlay dtbo" series
* replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_P=
CI)
  instead of removing

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5e1c1cc326..11523750ae 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -268,7 +268,7 @@ int handle_device(struct domain *d, struct dt_device_no=
de *dev, p2m_type_t p2mt,
         .d =3D d,
         .p2mt =3D p2mt,
         .skip_mapping =3D !own_device ||
-                        (is_pci_passthrough_enabled() &&
+                        (has_vpci(d) &&
                         (device_get_class(dev) =3D=3D DEVICE_PCI_HOSTBRIDG=
E)),
         .iomem_ranges =3D iomem_ranges,
         .irq_ranges =3D irq_ranges
--=20
2.34.1

