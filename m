Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099C8B06F42
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:44:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044877.1414923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwnx-0000Ch-VV; Wed, 16 Jul 2025 07:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044877.1414923; Wed, 16 Jul 2025 07:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwnx-00009E-S3; Wed, 16 Jul 2025 07:43:53 +0000
Received: by outflank-mailman (input) for mailman id 1044877;
 Wed, 16 Jul 2025 07:43:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fgsf=Z5=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubwnw-0008Mr-Fu
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:43:52 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d688a82-6218-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:43:50 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7560.eurprd03.prod.outlook.com
 (2603:10a6:20b:417::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 07:43:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Wed, 16 Jul 2025
 07:43:47 +0000
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
X-Inumbo-ID: 9d688a82-6218-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqj3LKDab5dT7WYO5sB7+ndl6GlJFOktoRT/3rny8YGLOQ75RUw2AjT9orSLu8j7YY0pAF3NgTnuTZp0vls8iao6KfkqUb+o3faiesLlqksdM5UzpThACd56m5ZI90r/3Yomn2ohyJcvF1l01/ZskVusc11igQtqbAZBz8O91Asw1cnmguKppg8k/Vw912X1jfSw5iKuT6JDR3oat1VT8WNHBCi4KX1ky+WjFfcaI0oinY/HpHyvF2rDWcQT8JbO+xcxAeWDAjccmWD3zljjZlZbI1oqMrLUc1g52B+XTpDr206JgyQefDcRLlElnweyHT2Fq0P3xghUfzu9tK+kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUG6Cwb8smWEtMNxtDvE6ueGOwnA6LFWxhVRoCwAz1E=;
 b=By7GH5VByg4mf30cgVBlHFdubQUoctygsL08xWPD/RtFphjyIzPOse67knEfYGj+8/wVNc0uNgPh86aZm6KI8N5Wsfk3BYLDWif+3LHtVm3GmkJfHIWDY768Ox6iZCHc7yJ35M/561cEPnoFxjXLbvz/pQQB5yRtShQZxTXv6zH3LpimlSDcJW6RP4N+gKdUBbM4vfBfSZ78B1tmVCJgf9MqrQF4cHguiHD/3G0e870B39JpTTG1yWO2S4x7G3dvoAA8GOUtCBruT5T67yhGjfqyM0QmhMitc669GH5hq4W5B3UotdhZ0ojHdON6Qh6R0hv611JiOEe6zl2po1vSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUG6Cwb8smWEtMNxtDvE6ueGOwnA6LFWxhVRoCwAz1E=;
 b=vJIpS/+yeTmeR83QYl1/tyLvFt3BJzYx+cvP0hOacJX4zU1J+gR8V0UwDtIblKWjCdiZvhIet27V2Rs5OmsgU5KR47yyLTF9aJn8mXEygSlfhlLR2/hLgEmniYBAQOWQfxurLuKh//K/XW4ETxQAQyk3shy/U6+LVsuepSUhBhU1GFlzHzVsBKtRd7jGqHWBNEGevri2+IcOHr8wj8T4+Cr7GkUZgte4PkSLqNTiQh3IG0gK9Xo7R3dcdtqa9CIRTqD8Urm1KPmIMkgAlUyFKqSqHoDR6flmRXeHpji2I8wP46Af54llsbZLccfKe01Tnyd3UPCM/5nv1VGLcclBHg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
Thread-Topic: [PATCH v13 1/2] arm/pci: add pci_passhtrough_enabled check to
 pci_device_reset
Thread-Index: AQHb9iVc9+KBe39cBkCCdxD6apzzJg==
Date: Wed, 16 Jul 2025 07:43:46 +0000
Message-ID:
 <daa6b4a6f1e0d90ddf5fd4c25cd941e3fb0d4774.1752649797.git.mykyta_poturai@epam.com>
References: <cover.1752649797.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1752649797.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7560:EE_
x-ms-office365-filtering-correlation-id: 3bb49be5-48ce-47f2-7b43-08ddc43c7f5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?H9ht5Vyk3kdLzCS5SdxC0QMrTSdCCGlSACnOGd1Vbqv6ICA04vtF+ieC9j?=
 =?iso-8859-1?Q?2WsDOJt8RWQfIwLLcwrdnc5NOmyn83mwWycSwGD4OtgxEGNwgVstneQYEs?=
 =?iso-8859-1?Q?PXih06vaSMb3arN3WlI4wsuFnhDqnfLOYA6zNyE1q3arlVqrDq4NAW494G?=
 =?iso-8859-1?Q?s5pDwbqN168r1zBLcmWqfrlDAPUxiFE2zt58jANijyj+4f3qtgdIrY/1c+?=
 =?iso-8859-1?Q?dPqFFvuuEnaIVnCDegVZw8vNrNSpEOSgrCs/3Z83JMXb2zl6VWRKByn1de?=
 =?iso-8859-1?Q?/kKV1wpdYtwxmgzgVsqorc4dENUST2m+PVnGKhdJ50GlmBvoS9aMtfoLkZ?=
 =?iso-8859-1?Q?qFneU8JsWuy4VhTv6+bBGhRSsT0sWmiiLqM0jW2zVNNibagMTibw61YO3f?=
 =?iso-8859-1?Q?9hdnW+zURgMjF0QN4FSnOiLrEOFyAz1pvydBAkYKfcOZGlaeOyef9zo9YR?=
 =?iso-8859-1?Q?crxDRiOShyYVCpo8xM6eWZfKxdv+Ib0PzC0XBpysdxbBWJZjoXgpidZulr?=
 =?iso-8859-1?Q?8MmNzUmjSBKf+cvfo+Ho2n2jDlzc/zEbnOTgHhebOtOZTuc5K+naGtjw5F?=
 =?iso-8859-1?Q?2/phqpQqQsSWQEvbStwVBVH/h2/NQ70z8ihogyd9hVed5IAJ3TEu+zNnNn?=
 =?iso-8859-1?Q?MyRt582f8PIoo8RS0fqqphzG2TThseT5vlxX1eACQsXDpU1Tm1Xm7P12Jg?=
 =?iso-8859-1?Q?eEPzE+1PNuQWeZzZuE/uMfmkekW/rOMjPl3rH0wBFYCz0W/oZWrIBf77MS?=
 =?iso-8859-1?Q?4SuosXST1xoS1B1Y1SxtOGq+G5kTabV6q9GIeT3ENTIercWycJBcHFxmyu?=
 =?iso-8859-1?Q?2lgO8n0WjK2gzTvpg8rBqh48BHlGKssWrPUlhQ9irkKxd0bAS99SoUubUa?=
 =?iso-8859-1?Q?uvpdoNDzS5EoTcrgcT9hlnkmyZRVoYIuIP30BURQX01TGOEPbjcboBocCE?=
 =?iso-8859-1?Q?6cjpz5TYltqkwLjDOfSbAZqmZzBpO3GbSWqkYGVJSty/bQHh3/QTchMNHq?=
 =?iso-8859-1?Q?7vXOfU3k6S4AMw/0UIlngiKK5r+7TG4hyeszVlc08O95gjMG7VKKuWc0Gf?=
 =?iso-8859-1?Q?hlzqw/YUwNp9ab8rHaVZh+0My9G2qrCncZ6+JAw5FNvbNOQx28m2hbVoe/?=
 =?iso-8859-1?Q?RQn2BcEKaoYYtvP5yZYe2dZ4eSFrKgVcRHYrIeiWcACe/ugyH6qdleHWEQ?=
 =?iso-8859-1?Q?kCQcCXFn1AXuq5IcRpUyb0m3JLnTKHdAAMAWwdTSEmQQgjtgLeDkZ5hMyL?=
 =?iso-8859-1?Q?AwQxn3dRR2ZvAL2OWyFTO4q5CV3Rn2tyHqnTj6nLe2PclIVtsjSTmbCAAL?=
 =?iso-8859-1?Q?LPuu0abwTgSYc7N8545AXiVtQvYkgeX9rCx0wcMSOqMLZo2GARa/EAZY2E?=
 =?iso-8859-1?Q?X0d6f8kCo6RjlKNDoCh/SURpgB2QnRNMfrMSFhvQKlpQRLid6hGM5GbR65?=
 =?iso-8859-1?Q?NanYSefMhG2kdLGEayitMWKcbYI4sw5MoqjRMQ9Ctbve3dj1HpqZoJnHoC?=
 =?iso-8859-1?Q?ZjPw/8lWZz6eRFqjihrLPmUAMJk7oopUAzEJmQSeXRDQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HdzF9ryvrOLu9gCQavjKo8Pe1l1akh+NkrqeVYW6LQwLl7cgAokmgebmR0?=
 =?iso-8859-1?Q?RLExFE5932t2Zn+9MUArmeouHg8DAqk2LKPQz00xVbcceObWxXd7L2OCu9?=
 =?iso-8859-1?Q?kqanBa5jo1SNfKDTjUs8ytHVtKbO5hirkFrZFDnWVw4gV71mbjRxOqqtqK?=
 =?iso-8859-1?Q?4848RnIEZvSL4x16vxInepD+lxtzg5GPqmAiE904QkOxQQ/NxqAJ8dqJB+?=
 =?iso-8859-1?Q?hpvsUjmMszAkQRObMJXyH/BzpZkrKBo2PrmjbuHUh/BBudqar4GLpVQtkA?=
 =?iso-8859-1?Q?kbS1s7evsw1deMOxOuG/36r9bFEptTu8Csak9aE1Arg8mSXdWIO9yutgV+?=
 =?iso-8859-1?Q?wxzgv/zagn3+QWqRNqpINUuTiFWY8gdwepisBhiumaP8Rda8pUxMwWrB3l?=
 =?iso-8859-1?Q?nPvg3nlgwBVexh3QA65m4iUiuHwfU1fyYoq3eHOjG86A/g8xULbFAwFTA6?=
 =?iso-8859-1?Q?X6RNrmyc9iR696zyUEAE4DLh24bPnMfM8FYhooxM3o6UNg/bSSSSjypV+R?=
 =?iso-8859-1?Q?6ZOw1k1MhaBR8auZPAw3L+/yERGgg3yj2sc0/EaEN7myynMiOmm9bjtcA6?=
 =?iso-8859-1?Q?de7nOfGqFMV1BgwIY+0/XzTDhx/JqiAAVLgpKmOAveUZq/nSe3dMxC0HCc?=
 =?iso-8859-1?Q?bkuQbAdHPdNgt1po2c6C6dshIM7r6wArLJvuXl5FL1w+JMKcJSATOJkc6z?=
 =?iso-8859-1?Q?FpL4DrZ1bW8OGzNWsWsFq+K88eLfvWvSl/0A/FzEUQwsWnj1jCpS5lkbpm?=
 =?iso-8859-1?Q?WRdohTV6crNBHPZGn5O7mEgRoulRSgyAdPry4dhikFO+CHdJgz/aPkRtpy?=
 =?iso-8859-1?Q?gmCBHiLBuw05zQjAW0TZRmC4CDscIKn4nbDJrLSQhlwFl4gBeeWoLb+c1h?=
 =?iso-8859-1?Q?5xJ4QWrgYDItDAapR3+XzotmcvkYApgFnwBxUPAzp0Tvv3qYQDRBbVXZY8?=
 =?iso-8859-1?Q?HLNiQoDpAH3e+BxhS2FOkdu6iFcZQdYuzxgurZLfySUC/wQi3bPuiFZ82O?=
 =?iso-8859-1?Q?Ocb8OoNg8yLf+Y2a5xYzAYrWsfd6kGU3qM7zUd7YrlcCxVn25PmK8MJAZp?=
 =?iso-8859-1?Q?uyeBxPIerTXrk2IRK7JT+Uq8wDyqAoRFs7uT3dbm7g8C3/NwVbIU2kr7Ry?=
 =?iso-8859-1?Q?zShJOooMXdSKGjhE6IXwzfpAu10c9g1fl4U/SfewoQl/wQw3yDncOZISOR?=
 =?iso-8859-1?Q?iLYm+VFhWTdKzv12rhNG3lNkAnQj1GShHM/HLqImmgaLILJqY7GIqnFEtb?=
 =?iso-8859-1?Q?e09TZ+aYrWcx9DwrqPjhoWTvrArE5Q0YnbkmRmrj8cvkw5f5bZkcHhyxDH?=
 =?iso-8859-1?Q?SeThuIjbaAf62aoVWBIjImDyPg0f968sVmSR+C802f3o0HM4Yqp+lmAAV5?=
 =?iso-8859-1?Q?0aoys9XnyznUhnlZCL7BlKcpH/YVRhhLSrvNn9yUjx0iPiN5+aUBZSONQ6?=
 =?iso-8859-1?Q?bgaaqrQiDB08Pc2Zd0RPbZDbFOK5Z9wcLXSb9AW1skfEO5aIpmLpT3gHQi?=
 =?iso-8859-1?Q?t8dPAVcLI9Sec19sgxPYMAdlss9HoH4OjcJW919eek9nTSMkECeAwTPVNp?=
 =?iso-8859-1?Q?MwjV/oZ9Ypdm55yXMG13dZ/aJ4CWOLPb88WoTgLiEKLjfWKyYeBApoClMd?=
 =?iso-8859-1?Q?DQhmS8AueXWRbVZsbCojWYApShK+k1VfY5n/oL0Cr88fig3dr/jYtCyw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb49be5-48ce-47f2-7b43-08ddc43c7f5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 07:43:46.8320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiplkrgL4BEhIzOZb90TCKQk/MbGzWhKBDf+lY8iOlTJ0FYEkSFVdjFbS4iJK1UD6Er/OVlQ1jg2slC9Rn5dnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7560

Without pci-passthrough=3Don Xen does not know anything about present PCI
devices due to PHYSDEVOP_pci_device_add not executing. This causes
PHYSDEVOP_pci_device_reset to fail when trying to find the device that
is being reset and return ENODEV.

Add explicit is_pci_passthrough_enabled check to return a more
meaningful EOPNOTSUPP code.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/pci/physdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..78de67ec64 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -74,6 +74,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev *pdev;
         pci_sbdf_t sbdf;
=20
+        if ( !is_pci_passthrough_enabled() )
+            return -EOPNOTSUPP;
+
         ret =3D -EFAULT;
         if ( copy_from_guest(&dev_reset, arg, 1) !=3D 0 )
             break;
--=20
2.34.1

