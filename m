Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF15AC6551
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999021.1379745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpq-0006kC-Td; Wed, 28 May 2025 09:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999021.1379745; Wed, 28 May 2025 09:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCpq-0006eI-Pg; Wed, 28 May 2025 09:12:30 +0000
Received: by outflank-mailman (input) for mailman id 999021;
 Wed, 28 May 2025 09:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sgde=YM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uKCpo-00059a-SB
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:12:28 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dedad733-3ba3-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 11:12:25 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB9PR03MB9709.eurprd03.prod.outlook.com
 (2603:10a6:10:459::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 09:12:18 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 09:12:18 +0000
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
X-Inumbo-ID: dedad733-3ba3-11f0-a2fe-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFN5DZovh7IEAGJJ1pjeE5TUtHID5rFNren6IHyw3Y7LByhgx8xrmrhXrW3lWQ74hkAjXnYGvHIHKik0ONZEM5Eq0GgibNtuGdF+zAsGdgUIVwSapeXwURqgzxR1L2FhIgxQU6nYTAno/JnGN/m6Ghi2CbAU7OT3oheTfgxwb/Rlw9NlPB9UQEhtURMIQ6y31Sy13GQtu+D5GRqyluX5yqddFFdDIhkJVpYUSSAxyFl8AUW7UCswxxn6WBBovOQfhhgyxOTd0iUfSzju6PCx8xWJcA1AcnOCHlERjxWFAVrs1MMmio0scgNqfQXvbMLU31HmGQWZzU0jeRYbQ9q/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hJipxXtGS84tqPWWkGQID4DWS/WfVqz4LfOOuxpUoY=;
 b=xZ2NVzpRHCOhl6GV3vyj8G8moJXTdyqiLZ2zCgSaFwFtl9SUmYKmpWN8Ky6FPm/mBtyN3VSel5cBpcKJbVIfD7wluvoTpu6Ko1q9PHwlmwI7YY4L91IhkjSXMXlJS0E07LmOEKxpiQ+P7yI3L3dBQiFxu5OIhGSjSa2NcKuQ+wxd+KFVro7XARsaSaoXFOASiaaJFycpHofenX5HWm+HdeHjOozuR5MOqKGwrRv+iXgswke0N6/H5nHHUvCLLAZ/c/H1/7fELQxAq73JVdgWI4K7sihIO3wDBZijcxMCpXqCaDAda/NXvW7DoQEEaxvC4oRekELMdB8xQ+8ioRhcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hJipxXtGS84tqPWWkGQID4DWS/WfVqz4LfOOuxpUoY=;
 b=VQNFbRxdGIvHvKZj81sp9IU5asMYTBMjH9zOjeIPEjs7BCM3kUd4q0vBTFagd2P7bz1oWQ3PiUrSOE6mSDj94a7+ricit2LNFckqWWg/Xave7L3gRU/tbPWheM1ej1xOvbAeiLNPRk0UEeYwBDb1z67ZKFzRWwwAuZfRjAHUCKGvy4pyC6L61FVytcNib2B4bJb5xBkic61twpDuew0zPV6IqxLnsjHUiin7xs5jqbqXr4LjekbCfi14wLlEEhVegxPzVTwtDCwfkju1xsnLkCjHA4/yo8W4BXCK0jV1MjRIYJ6rNRA/lbzvK9QJU2kAlzUjJP2ql9/S4nZDOw/Bug==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 5/7] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Topic: [PATCH v11 5/7] xen/arm: Fix mapping for PCI bridge mmio region
Thread-Index: AQHbz7CcY3xN8amw40aBS5pduG3+AQ==
Date: Wed, 28 May 2025 09:12:17 +0000
Message-ID:
 <90bbde388d0a5ce445c16058fcc619206cc7d0f1.1748422217.git.mykyta_poturai@epam.com>
References: <cover.1748422217.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1748422217.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: 4ef80455-f45c-4c15-f60f-08dd9dc7bf17
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uI2D2sv6SM+ShFQXvoArRZu/zccy64K82035vcm5/bwDrwgWNY5AVakf1O?=
 =?iso-8859-1?Q?jISS/vE4gO3HtE5frMry4tO1HYMgJOWI1jEd0l4T/g9T0H3VKfMkCi9sdR?=
 =?iso-8859-1?Q?Hymwu3pTNYUywSnMydWr3BBlGIgH+9ipuzDoKMaM8ahb7gjANiKrCwZ5Ef?=
 =?iso-8859-1?Q?EDRrxv7x554wbnu2YIZKoCi6eCb5V3Y3whiS9KTHXXtlX4oKeO4KjNVEzp?=
 =?iso-8859-1?Q?yAq97YGdWoulcE6HyAAVrUdMn/MeNZoecWgffybd3JjuaB4fb02ngFQvq6?=
 =?iso-8859-1?Q?aZmMZ18ySR7XReFFrjYYyjCKNtSXAUORo4LSt3KbUgOtjgL/UkZGUZoCod?=
 =?iso-8859-1?Q?WN57Wh3YCaOhVCXPk6zoqTgIPTUDKuarpwxjsLkivkVvFUlWe10AitFMOZ?=
 =?iso-8859-1?Q?j4OSZ9BTdWeO12e0KNQgBhLy4Z7YZThShyUlUZzNVNGnyWuq3uJxXjQ5HR?=
 =?iso-8859-1?Q?nG2VOZw4pqagNZn3XKamI69J9Gh8OoIADCmSzSyUyTiU+5VYbMsSzwBkRN?=
 =?iso-8859-1?Q?pesunpKtb7l+NboBsk0cpKU3Tw/C5hqaDj3zHPfa5uHUf9RYQECAmoiDHu?=
 =?iso-8859-1?Q?Nyd2Due7+dUZC+J6XX1uPeDoyaVUB69AehEYUnEMcAVPvATn/gsxcILo9C?=
 =?iso-8859-1?Q?PM038P7k12dQeCu57ctSNhF3CtT1o4gW7sxFxnPFbz/l981aKa6dt5nl+2?=
 =?iso-8859-1?Q?0YGSQhqr1AIFMAJPT9mcOreiA5/Q7K8xszJmGcUBsE66GpDzo7K+kBuyZT?=
 =?iso-8859-1?Q?3ZoBMN11E2+55slW330OCWv01/1Gc/bkF3rOVJL1sxfu++3Q3a4gF34xbp?=
 =?iso-8859-1?Q?WtDYZm/gZet3Cv0FEqKpiv8ZO8XrhveOsxwjTcuID4WTqKXFfBkPxb5m7O?=
 =?iso-8859-1?Q?iKaN8HKfmB/4qdvxLg/S3Cn6iTIMEexwiIPwOwG3PCuJfmwejveaesF2lo?=
 =?iso-8859-1?Q?jycc1Kv2SHnqTxcOrbYvQ93dLM5eIWiwuYEy6wvzAsmMtBnyEoRghyVZE6?=
 =?iso-8859-1?Q?fDpH+GJqosQlSmQY5UZ6HuoJ15jqeTkYp4uumyOPhuBgO9rHIk9sBr+rJE?=
 =?iso-8859-1?Q?EMFMISCN02jjAARhi/bnNYxaUKln4cwSNpZglylz+tgVpKKX4j4Onv3/Hv?=
 =?iso-8859-1?Q?7smS85+lcHCC7546iI9eKpnwlX1H9i+cy/wPZmtB1bOjf53swt9cLgsEBo?=
 =?iso-8859-1?Q?a4/E29yIqWRsteKooTGoQQW7BrwAS7K9z9XSmSQiMQAHJcg8ZUy/yopuIx?=
 =?iso-8859-1?Q?j2VYKuBZmuXjaoous+hW3ly0HxaYCWSr0+3niFV52IiWbUD06viW9xKSqu?=
 =?iso-8859-1?Q?PjhDxmuYBklYRHTqtsmgbqRLW+37TFRO6brFB8aZnU/yzBy0gyFT515S39?=
 =?iso-8859-1?Q?yo5qZDqnN/xOZZmWRnfNHy/uvcNqNUOYehYD+bh4aJyqxkzmjFYrhXAI7R?=
 =?iso-8859-1?Q?+s91y2wkxQLVRw0MXE3JSJrwuI6ibytvKSve4JnkSB4+W9PZlpwaNNAE8/?=
 =?iso-8859-1?Q?8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qmkvIdBkEmZ1q7D0lRzMmDwraLQr4yw+zRa4HKW8apqfEqwM6wIGCR6wMB?=
 =?iso-8859-1?Q?OaQjCR0G7/jGQERNMhlfF6oSyU3doRuI6C9rsEHsGDuXKr1d9HWMDHYMR2?=
 =?iso-8859-1?Q?zA2RKSYWtjWJBVsPn5LOyba5SMLDPaYAoG33Pq2H9cWEe/dZWteHwIyGg+?=
 =?iso-8859-1?Q?dzFVSQ9gTkcC1JoIy0NPcAJR648eEzaaQDKNNft+t85wTPNW0NNZXG5UAo?=
 =?iso-8859-1?Q?AC7aw3DaOu+5aKcqPwezbhwdBHKgpSZk8j5tsFAS7wkUiIBuBj6PEY/UnH?=
 =?iso-8859-1?Q?Z21hiY7JDx6ebONO9EIwnHWT+2HZV4asKGf+v4ssQAES5B/bBwE3IHO/Wd?=
 =?iso-8859-1?Q?446f3BTjjee2ZA9LYk0e/pPH9rWDQhhXOQu6J5UcPpe3VBhg+na+t7bTVS?=
 =?iso-8859-1?Q?nEJ3XvJercTJCtHJ11JRK+xqwApvkJCX4OAhV+vpFC0sJ2ildUXnu5IFyI?=
 =?iso-8859-1?Q?80V4oVZ89nxBPtr5IjiCYJg4tiVWHyANeOKnH+L7DFnJKLey/F0H9hbIEn?=
 =?iso-8859-1?Q?pQHu8Tt6gO+NanD45krBahQXE/5OrLQzAWm2oHMoGK3w07/qpVxdWiD095?=
 =?iso-8859-1?Q?JyTUeXUKOc3qpeaFJc0/mFSGI641ZrN4Ebhum0BslEAcDc7bec6eTs6v3k?=
 =?iso-8859-1?Q?9GddD57LgiAsiMMkw5ytSvpd9rjPvQNo7WCbrE/vGJU3+4ajzJj46Z4Siu?=
 =?iso-8859-1?Q?s49mbMDDHwKmb7FVXq+mQ8mIRQMEkgBGdzhmQpp8t2rdbHmJUH9MiwBLp3?=
 =?iso-8859-1?Q?j0mjnKdTIs7BwnKUBjklVNi3sXkUnL9riQaoxGhDeYgBiaErYLOn933Whv?=
 =?iso-8859-1?Q?EJ4s5SbUebZehGlEGdzjLboTU0j0b7FIwGi+NegSGr33oP488+UVQpAEjh?=
 =?iso-8859-1?Q?zkNeLXETZ2q9WOSTWzfx163QtHVBkBUWZBXLqtDqAwOpPnQv8cIa8ZuPaW?=
 =?iso-8859-1?Q?pZ6fE1H91XX/7MnWO8ZhFf3ftvZ+gnKWUvhMkjNNUloC129Cw0XE4hq0Yr?=
 =?iso-8859-1?Q?k3kCA2PGFSfBZdhXoihFBjjS98MwEeejMf4sYLLcy94PXP6sJnEDgUSZF7?=
 =?iso-8859-1?Q?pBYKDhg2G6tUumE11o+7NLsG5WKFZAyRDbnnJKsrQHyOa62QtfTB57rQjx?=
 =?iso-8859-1?Q?Ci+qpiSCngyKD7QHolKs8tybCNl3OWYRkZLhnEpUzCeLC3vHZ4YfQ36PZb?=
 =?iso-8859-1?Q?4Sduc7cQt6uu8hMJ1SFHqWyTALZJjqSI5N/gyijtKtfGKxX4MZBvrhticG?=
 =?iso-8859-1?Q?ive0aHoteY1T/1hYczE63bkc3zUVrFwwlX3rw7/PI6BRhcY10tAO6b9va6?=
 =?iso-8859-1?Q?LZC52IZplEjFxHUSJdplbm98pfAwgdjT9qZv9a3mpmJ1nt3aL1k1/YATxH?=
 =?iso-8859-1?Q?WDkEbWvKkYQHfCab6kXuA2opNf3J1jY4nM01QHDXQWSK7czg3lKLeYil8t?=
 =?iso-8859-1?Q?gMyCXVP7ZObWWQX7RbpBsvNQWfUh2FeGhimyUkT+g2oInYQzsH36pfCXYa?=
 =?iso-8859-1?Q?TZp0anwwqcm1voHwXFalh40mv5sFYEmYtPwORL0M9/+j248UV75xWqrhvW?=
 =?iso-8859-1?Q?eEGKMq1tyJ1C85BlSxgGTnuJuXujBG0l2G6v7jvtQlRvbNMDC3vr+6epw/?=
 =?iso-8859-1?Q?SE4dq/AOwnA7gBzCIJHuGRFEL1xkzjQo++uk8AMTc3p1xy0RvZeA/hOw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef80455-f45c-4c15-f60f-08dd9dc7bf17
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 09:12:17.8409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0l1xf1x3uKraDFRweJojNMSY+36UI3M7Qa9iyAT8+vUeKw2YqFIgC6B4e7f+nTG74eJtpjfO5r4jYELPA4QTxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709

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

