Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F5ABC31B
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989962.1373940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2le-0005g0-LI; Mon, 19 May 2025 15:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989962.1373940; Mon, 19 May 2025 15:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2le-0005bx-Dv; Mon, 19 May 2025 15:51:06 +0000
Received: by outflank-mailman (input) for mailman id 989962;
 Mon, 19 May 2025 15:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2ld-00055d-EW
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:05 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11047c03-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:03 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:56 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:56 +0000
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
X-Inumbo-ID: 11047c03-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9e9pUtkNdyQQ2vuBZGPSTatUP4QVa4nureL9CDHBZosASAjN25rFgyTfASzPCZgyd/xefeaSvm7u5UQDRwcJF5nBrFTAOZz7ccJf9Efws3e4x2PNghKeSf92e74cFBkN1y+t7ZGQUUcqkgHgFk/7tI6yBQpIlELT8FGEQsUm+XghjehAweZY6ot054Z76MS7Ow/WvEORl/HSXOj/F7QvF66C29G1YKXhH53/VUplr2f9z8vpv8s2AGXNVgsqjOhS/3W7UYaan6RoOG7fZhD/gBhYwlLIrLaPOLJHayyMMMpQTfGE+qh3Foru2xzoURSS45CUemnz7grMNJoByQ7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuRaKSb2E1086xvD0ZVG5GfhbsL6SY92mOveYINGGu8=;
 b=uyg0PNph68ansj5aYWlV03+TtFjBeudxE+QDDTWqLYcr8OUS8kt27eXHOXUSfpS6BdyfKaV2kSFCgfzmcB01480ptuvkJSX1r9KZLXZcnboNIriBRec5rGAXdT3Vs6u7fdaOD8REY7f3fQQpaziuGYLCpBXg7T2fDlQRmK9s+Cf8bGvD9ad/ywpJFxoQUrCuDSTnijeMEpuEbmSWpypcaLojkbR+RQvCP0wX1PxEU9IKSBsqDS7KA49vzPax7ah82S8KNXS4MMh5UEdYdAbOc6fmbEjf3DnVP3LKZgMbVTRWgKu/vvO31vMIiqxbdalSL4xtsRIOTQgvKR7pRM2tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuRaKSb2E1086xvD0ZVG5GfhbsL6SY92mOveYINGGu8=;
 b=Z7SH5iP6W88/OMHeKK2oDQuHY1yd3oX59p1ybCeZVSq/XGlUbyPqlBoRGROa+MaRoflU/slQWDdHI42IlJWSrF3VOQBkftIxlLBsqxiBNzD/K/0hNs9Tww3xKqoA0YoVtD08ySRt+zrfAaslUF9UKuxoPQKP2hQkz5RqeuXeGG0qN5e0eVsDa8SBybue+qmOguM45q8tJuh8HSM5QzA5EDktkryEjy1lo4+BEpTMDyEVv4U2wxKJwkGRW7R8BMyRfshDupxnORUcaW63mmV9j8vrEdoQOGqpVzPba7/+wD0fs0nwCiGqTLxiAPDl0aS4wWi2OAf9PF71N6YFsgcSVw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v4 1/8] xen/arm: add generic SCI subsystem
Thread-Topic: [RFC PATCH v4 1/8] xen/arm: add generic SCI subsystem
Thread-Index: AQHbyNXOqELJ9X0XaEyNPLqmNXa/uQ==
Date: Mon, 19 May 2025 15:50:56 +0000
Message-ID:
 <48b70b34c576d8dfcf6156d1997bc3c0f7cbbceb.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: 38b27eff-4e97-4ad9-f4cb-08dd96ecf1a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?B4JgUr7hUJy44i0uFVHkp60oUcZIbSu3q8qfVpGGk1aGqcqIv1Cq/Hly6r?=
 =?iso-8859-1?Q?Vn1OInDADFVJR8jEDBMefemod8vVafktj0vv6QOY/9zEVfLonY3eQ+OHbJ?=
 =?iso-8859-1?Q?t4gHx5ShIxxqXMzoXtg9xqfwKu2eFa7+q+h+pkyG1Sggq90J7LxwdMGZ3i?=
 =?iso-8859-1?Q?6Xv1e8blGadjOkeVhFan8YWlWIqOpllazrZg0GnV8QDQ/eEbCZ1ZT9jaoQ?=
 =?iso-8859-1?Q?+BbuLkKEeK5/1auticE3IoZqF+tdguX9oTXhCFcSsdjRN0AFBlCJSQOEEw?=
 =?iso-8859-1?Q?n/CMszWq/HBkYPcM2sSvIg+SQm98n4ujnDMV82854udbNOlTH/bwzEn9f5?=
 =?iso-8859-1?Q?5GDehtuC41qTNbG3MmlvrNDCHpjrNrmscFXGJGsG5hPWOoJEZeWY51DAOZ?=
 =?iso-8859-1?Q?5QcAP16bDOCgjMar2CdTjDft0NjyNfOiDA0JVZkff+znWr+kifiVX0oTYZ?=
 =?iso-8859-1?Q?5CbialbivaLiyYYg3/Lw8PvvbOV9cNZrKj6qcEXefuiJRSh8HzOX729WbR?=
 =?iso-8859-1?Q?ZqSS3szz9+VpF+ua4RKfpYZhBmHHJLPWIKDmEjQ1O91XqhXH75w4BrAvo9?=
 =?iso-8859-1?Q?6GEf448DziHuG2NFkZU0xzqR8yubdSObSvXde8tWhyr7QWFvDS+BcL6Y+2?=
 =?iso-8859-1?Q?UhOTxLWaqGDNj1A+021oMSCq9r1IX5Lki6ONorHUS4lAZlmilWfzG2il9W?=
 =?iso-8859-1?Q?EmU6pbRYsBcSNp53F+iXigQ4gs60b5H/kFMBBJq/mH/GFYEAocxNVSzwh/?=
 =?iso-8859-1?Q?HFf60xgIuIQKWPa0wDxgZNijPmJsKqA3RsovbQkwz+i/LQW/pPyk8oY/KJ?=
 =?iso-8859-1?Q?Dr27utbsGvVO1ux1TnbFf6HAe4/a/1WSAH1qycNMrDwz2ZDKnaEvpk8vHq?=
 =?iso-8859-1?Q?rzo4wsLQZgDCICTk6ZVqf7Y/+GMtG2gFiUbZ6amWXIXtQu8nFEYzWodALl?=
 =?iso-8859-1?Q?7pGGDW/iWF2nJmXptq1eDIuxA2g9Dt/G5Zcb5S2bb/b/HxnmAS2m5racy8?=
 =?iso-8859-1?Q?S/IDhw3+y5zx2tc7wQulDmaut8p5GRHUaCA8KpCHLT+Rqd3o0VXcugDVL+?=
 =?iso-8859-1?Q?vXPrrbONbqR9RVvJRTLOPRsDBDC0OBl2g3/XdCPHtae+F3hC7j+50fVF4W?=
 =?iso-8859-1?Q?iyWzfIi8+hQc8nZxFu5LH6cpYbi/MBWS9M3NGGQkZmoUnJmahZyutLiWTR?=
 =?iso-8859-1?Q?C4igB+XJAte6R/bAcCR/kQwYOkCJkvmbr5qgU6WApQnZhXl1RmDk8RgUGC?=
 =?iso-8859-1?Q?CwUQ5TDJbKS3w+pL8dyJvm2MuKFmzidjCeDXjN1vAG5jy3XMFTu41c/pSs?=
 =?iso-8859-1?Q?t0y3XzT3R6mBmGGoNo/QWrR1rRSQdU/SnpqbRv8UUh9iON88mITnfDViD2?=
 =?iso-8859-1?Q?pwOgrcmoAWnc8gyebYJKM7qamaZVOC/A4loH09mrZbDlDQ0xajMHcMedg/?=
 =?iso-8859-1?Q?dpXnzIp4/Mdse5LnXdTv58/3ifORCm9EWLqUliU/1CSNbbNtfxsemIf6yM?=
 =?iso-8859-1?Q?w+JTaR0Hb7rRPe5iZ+2ZKCXnWC/nciugKE9VrDTI2GXbCBYmeH7366DmwX?=
 =?iso-8859-1?Q?sV/aVEs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pXfQZC2pgA2DrlsMeS/Wc18g7eAQRGE9Zk5vDvHxZKUIH5Q3Zzvr/K7Vds?=
 =?iso-8859-1?Q?OlJehgGEMUAJ/L5rZYARYW9jVcVeEDcyzWKNUQHTTS/3gagRW/h4ss8HNT?=
 =?iso-8859-1?Q?DjgM0rrQlSKsPkngcT0gaYJXpn+8rwJ7uX3bldXtOhVeqWKKFySYnqPetK?=
 =?iso-8859-1?Q?P8oBYdhGaGlz8EhNzScgVHwxXmIHcHIYZKlH9ggulR1FJSlYZK7UlNte1P?=
 =?iso-8859-1?Q?ZBvfyA6qcB1c31soqJSWqutJC6H9zyjVl0073Yi5k7SHbjRvthNMgK2kCg?=
 =?iso-8859-1?Q?yvBZ4XjSw8bDUzKgWQKDCi15sdRsMPsaYEe1gYu/P5hCakzGRhhYhlnTSm?=
 =?iso-8859-1?Q?vl6UxdiqKDKkPkoi0GCuGSPtH3dmm1tI7CpCMEVy1NuBZ8+pN5lTSkfYoL?=
 =?iso-8859-1?Q?RpjHE1Z7iBoOrdEi3g9dIS6dX8FUEZJJ8F5zwcCUdVIUpfvSInyv6pH0XZ?=
 =?iso-8859-1?Q?eIHNWP5/4vlpmWWQ0d5ylNAJ8h+DrWh7tf5X4dfVFAC4tJDttWgWs/pDfm?=
 =?iso-8859-1?Q?f/CNzDzoWEduUBVaRaB+eeyQki3roFpypFgABdyFJqecSsZxdzFS2AhHrm?=
 =?iso-8859-1?Q?HeB6wl5cqzzLt7EknkvthecNX1/iVsEKTaNXRflbcxVG/Neo+jyJXMkpjr?=
 =?iso-8859-1?Q?AVaRKMhD0hjK7WNQqYcxf3Yg1bSWQNSVFTaYbA6POU6jK0oXySV/NV3Ous?=
 =?iso-8859-1?Q?lldVkzKIIc9uC2ZpJCQeasZMElwk/osVxID7bhihOy6zYBcXo+vhRiZjeE?=
 =?iso-8859-1?Q?MeRNo46DjgwAVVX+lpr0ZlmSxK2onJwhhTkDlJtUgCaXgKQb3+o7mOLXOE?=
 =?iso-8859-1?Q?U24v+vJ2jCp37WnxyuU5g3xDm58EaVbtu1Tn1N08EXaUQJWM6ltSns+Gk7?=
 =?iso-8859-1?Q?UTRxmOEJ7ZPAB6KnkNtv6ibXiUjAl3/nJQvcy1V6Mf3MZARPd7FQ7I9k0n?=
 =?iso-8859-1?Q?9coocKMwWf50nVo/nG/acm6HhlE7nIuELA3NwWdN3qmL751c+oucyLJgwK?=
 =?iso-8859-1?Q?bVMQ1NP9hShmyaFSw876ZFctXZA/n055qVYXcXYT04sJ+ejgB3xJNFCWkd?=
 =?iso-8859-1?Q?66iDuQfMtSMwsuq5YX5+Ef3zX10LCYESFWIX5YOagJ0Ag6ih1F2oFGH0K8?=
 =?iso-8859-1?Q?wfZTTlUXgiisbTXusCVqhJgA51dOHoMNDhMV1K3lKBqos3lkp7PD1mTcEh?=
 =?iso-8859-1?Q?1J4aHybQL1N2lXbP6TYRpngWyXMfCl4vlQq2pMofW4LmqEhtuEczpt5RjP?=
 =?iso-8859-1?Q?K/PM3bebXxqdnT2SxRhT3C2Juaq94uvqo33Mwe60sTYi31DRNVdCh8E3wR?=
 =?iso-8859-1?Q?c+9ELtbKGAGsKMZBqjRg5dPQYpIFxNnUOdSnjvG24/wi451ngG/Vij9VUf?=
 =?iso-8859-1?Q?6sZc/6njD4V6ocg3KdUhd9tMYXyvhlXs/DxI9xdVXbIH6Zn87B5CljTpG8?=
 =?iso-8859-1?Q?XvY2SYYDlUUzGErrDBTpf9HR+fOio8dELVpNEOEXDKSQb3W/3kuUpADeLo?=
 =?iso-8859-1?Q?pp+26R0eg37IfyqX0GTR5jhNMpGGLbfO6LbrTAALvEpq4WMEb1C0qEz6Ix?=
 =?iso-8859-1?Q?II3yEJ8EgKvBUeutYZgqtrNNcRSC4N1Hd6na6FbiB13+ySJBjFzOakE2TJ?=
 =?iso-8859-1?Q?pCDAljM7qy2hKPsY9N3kRR0iZD2CvArLhw0NnkJ/1pct7KArXPhYXDLw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b27eff-4e97-4ad9-f4cb-08dd96ecf1a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:56.1740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JR021mEIK9xc+Alyw57gKDXyuu/TMWWbXxFG+JbS9Uyg5DjP0PINFmGfDtQ4hxFMjfWdj5RHe59u5fiL7GriPulCUD5D/W7tM5tsT6KMx+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

This patch adds the basic framework for ARM SCI mediator. SCI is System
Control Interface, which is designed to redirect requests from the Domains
to ARM specific Firmware (for example SCMI). This will allow the devices,
passed-through to the different Domains, to access to the System resources
(such as clocks/resets etc) by sending requests to the firmware.

ARM SCI subsystem allows to implement different SCI drivers to handle
specific ARM firmware interfaces (like ARM SCMI) and mediate requests
between the Domains and the Firmware. Also it allows SCI drivers to perform
proper action during Domain creation/destruction which is vital for
handling use cases like Domain reboot.

This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
drivers basing on device tree, SCI drivers register itself with
DT_DEVICE_START/END macro. On init - the SCI drivers should register its
SCI ops with sci_register(). Only one SCI driver can be supported.

At run-time, the following SCI API calls are introduced:

- sci_domain_sanitise_config() called from arch_sanitise_domain_config()
- sci_domain_init() called from arch_domain_create()
- sci_relinquish_resources() called from domain_relinquish_resources()
- sci_domain_destroy() called from arch_domain_destroy()
- sci_handle_call() called from vsmccc_handle_call()
- sci_dt_handle_node()
  sci_dt_finalize() called from handle_node() (Dom0 DT)

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers

 MAINTAINERS                             |   6 +
 xen/arch/arm/device.c                   |   5 +
 xen/arch/arm/dom0less-build.c           |   7 +
 xen/arch/arm/domain.c                   |  12 +-
 xen/arch/arm/domain_build.c             |   8 +
 xen/arch/arm/firmware/Kconfig           |   8 +
 xen/arch/arm/firmware/Makefile          |   1 +
 xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
 xen/arch/arm/include/asm/domain.h       |   5 +
 xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                     |   3 +
 xen/include/asm-generic/device.h        |   1 +
 xen/include/public/arch-arm.h           |   4 +
 13 files changed, 413 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c11b82eca9..f5e3c48b96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -507,6 +507,12 @@ R:	George Dunlap <gwd@xenproject.org>
 S:	Supported
 F:	xen/common/sched/
=20
+SCI MEDIATORS
+M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/firmware/sci.c
+F:	xen/arch/arm/include/asm/firmware/sci.h
+
 SEABIOS UPSTREAM
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba..bdab96a408 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -13,6 +13,7 @@
 #include <xen/iocap.h>
 #include <xen/lib.h>
=20
+#include <asm/firmware/sci.h>
 #include <asm/setup.h>
=20
 int map_irq_to_domain(struct domain *d, unsigned int irq,
@@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_n=
ode *dev, p2m_type_t p2mt,
                 return res;
             }
         }
+
+        res =3D sci_assign_dt_device(d, dev);
+        if ( res )
+            return res;
     }
=20
     res =3D map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d65..a09c4c4bd7 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -14,6 +14,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/firmware/sci.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
=20
@@ -321,6 +322,10 @@ static int __init handle_passthrough_prop(struct kerne=
l_info *kinfo,
         return -EINVAL;
     }
=20
+    res =3D sci_assign_dt_device(kinfo->d, node);
+    if ( res )
+        return res;
+
     res =3D map_device_irqs_to_domain(kinfo->d, node, true, NULL);
     if ( res < 0 )
         return res;
@@ -970,6 +975,8 @@ void __init create_domUs(void)
         if ( !llc_coloring_enabled && llc_colors_str )
             panic("'llc-colors' found, but LLC coloring is disabled\n");
=20
+        d_cfg.arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
         /*
          * The variable max_init_domid is initialized with zero, so here i=
t's
          * very important to use the pre-increment operator to call
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f866..652aeb7a55 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -25,6 +25,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -694,7 +695,7 @@ int arch_sanitise_domain_config(struct xen_domctl_creat=
edomain *config)
         return -EINVAL;
     }
=20
-    return 0;
+    return sci_domain_sanitise_config(config);
 }
=20
 int arch_domain_create(struct domain *d,
@@ -786,6 +787,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D sci_domain_init(d, config)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -846,6 +850,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -1039,6 +1044,7 @@ enum {
     PROG_p2m_root,
     PROG_p2m,
     PROG_p2m_pool,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1098,6 +1104,10 @@ int domain_relinquish_resources(struct domain *d)
         ret =3D relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
=20
     PROGRESS(p2m_root):
         /*
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade1..36d28b52a4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -24,6 +24,7 @@
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
+#include <asm/firmware/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1888,6 +1889,9 @@ static int __init handle_node(struct domain *d, struc=
t kernel_info *kinfo,
         return 0;
     }
=20
+    if ( sci_dt_handle_node(d, node) )
+        return 0;
+
     /*
      * The vGIC does not support routing hardware PPIs to guest. So
      * we need to skip any node using PPIs.
@@ -1988,6 +1992,10 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         if ( res )
             return res;
=20
+        res =3D sci_dt_finalize(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         /*
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 817da745fd..fc7918c7fc 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -1,3 +1,11 @@
+config ARM_SCI
+	bool
+	depends on ARM
+	help
+	  This option enables generic Arm SCI (System Control Interface) mediator=
s
+	  support. It allows domains to control system resources via one of
+	  Arm SCI mediators drivers implemented in XEN, like SCMI.
+
 menu "Firmware Drivers"
=20
 config SCMI_SMC
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index a5e4542666..71bdefc24a 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
new file mode 100644
index 0000000000..e1522e10e2
--- /dev/null
+++ b/xen/arch/arm/firmware/sci.c
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/firmware/sci.h>
+
+static const struct sci_mediator_ops __read_mostly *cur_mediator;
+
+int sci_register(const struct sci_mediator_ops *ops)
+{
+    if ( cur_mediator )
+        return -EEXIST;
+
+    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
+        return -EINVAL;
+
+    cur_mediator =3D ops;
+
+    return 0;
+};
+
+bool sci_handle_call(struct cpu_user_regs *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->handle_call(args);
+}
+
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->domain_init(d, config);
+}
+
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->domain_sanitise_config )
+        return 0;
+
+    return cur_mediator->domain_sanitise_config(config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->relinquish_resources )
+        return 0;
+
+    return cur_mediator->relinquish_resources(d);
+}
+
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_handle_node )
+        return 0;
+
+    return cur_mediator->dom0_dt_handle_node(d, node);
+}
+
+int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->dom0_dt_finalize )
+        return 0;
+
+    return cur_mediator->dom0_dt_finalize(d, fdt);
+}
+
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    struct dt_phandle_args ac_spec;
+    int index =3D 0;
+    int ret;
+
+    if ( !cur_mediator )
+        return 0;
+
+    if ( !cur_mediator->assign_dt_device )
+        return 0;
+
+    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
+                                        "#access-controller-cells", index,
+                                        &ac_spec) )
+    {
+        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
+               dt_node_full_name(dev), d);
+
+        ret =3D cur_mediator->assign_dt_device(d, &ac_spec);
+        if ( ret )
+            return ret;
+
+        index++;
+    }
+
+    return 0;
+}
+
+static int __init sci_init(void)
+{
+    struct dt_device_node *np;
+    unsigned int num_sci =3D 0;
+    int rc;
+
+    dt_for_each_device_node(dt_host, np)
+    {
+        rc =3D device_init(np, DEVICE_FIRMWARE, NULL);
+        if ( !rc && num_sci )
+        {
+            printk(XENLOG_ERR
+                   "SCMI: Only one SCI controller is supported. found seco=
nd %s\n",
+                   np->name);
+            return -EOPNOTSUPP;
+        }
+        else if ( !rc )
+            num_sci++;
+        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
+            return rc;
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index f1d72c6e48..fa0898b7cf 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -118,6 +118,11 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+#ifdef CONFIG_ARM_SCI
+    bool sci_enabled;
+    /* ARM SCI driver's specific data */
+    void *sci_data;
+#endif
=20
 }  __cacheline_aligned;
=20
diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include=
/asm/firmware/sci.h
new file mode 100644
index 0000000000..71fb54852e
--- /dev/null
+++ b/xen/arch/arm/include/asm/firmware/sci.h
@@ -0,0 +1,200 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Generic ARM SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+    /*
+     * Called during domain construction. If it is requested to enable
+     * SCI support, so SCI driver can create own structures for the new do=
main
+     * and inform firmware about new domain (if required).
+     * Mandatory.
+     */
+    int (*domain_init)(struct domain *d,
+                       struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain construction. The SCI driver uses
+     * it to sanitize domain SCI configuration parameters.
+     * Optional.
+     */
+    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated for domain.
+     * Mandatory.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by SCI driver itself and request resources releasing from firmware.
+     * Optional.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* SMC/HVC Handle callback */
+    bool (*handle_call)(struct cpu_user_regs *regs);
+
+    /*
+     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes i=
t
+     * need to handle and decide if those nodes need to be provided to Dom=
0.
+     * Optional.
+     */
+    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *n=
ode);
+
+    /*
+     * SCI driver callback called at the end of Dom0 DT generation, so
+     * it can perform steps to modify DT to enable/disable SCI
+     * functionality for Dom0.
+     */
+    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
+
+    /*
+     * SCI driver callback called when DT device is passed through to gues=
t,
+     * so SCI driver can enable device access to the domain if SCI FW prov=
ides
+     * Device specific access control functionality.
+     * Optional.
+     */
+    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_s=
pec);
+};
+
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return d->arch.sci_enabled;
+}
+
+/*
+ * Register SCI subsystem ops.
+ *
+ * Register SCI drivers operation and so enable SCI functionality.
+ * Only one SCI driver is supported.
+ */
+int sci_register(const struct sci_mediator_ops *ops);
+
+/*
+ * Initialize SCI functionality for domain if configured.
+ *
+ * Initialization routine to enable SCI functionality for the domain.
+ * The SCI configuration data and decision about enabling SCI functionalit=
y
+ * for the domain is SCI driver specific.
+ */
+int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *conf=
ig);
+
+/*
+ * Sanitise domain configuration parameters.
+ *
+ */
+int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
+
+/*
+ * Destroy SCI domain instance.
+ */
+void sci_domain_destroy(struct domain *d);
+
+/*
+ * Free resources assigned to the certain domain.
+ */
+int sci_relinquish_resources(struct domain *d);
+
+/*
+ * SMC/HVC Handle callback.
+ *
+ * SCI driver acts as SMC/HVC server for the registered domains and
+ * does redirection of the domain calls to the SCI firmware,
+ * such as ARM TF-A or similar.
+ */
+bool sci_handle_call(struct cpu_user_regs *regs);
+
+/*
+ * Dom0 DT nodes handling function.
+ *
+ * Allows SCI driver to detect DT nodes it need to handle and decide if
+ * those nodes need to be provided to Dom0.
+ */
+bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
+
+/*
+ * Dom0 DT generation finalize.
+ *
+ * Called at the end of Dom0 DT generation, so SCI driver can perform step=
s
+ * to modify DT to enable/disable SCI functionality for Dom0.
+ */
+int sci_dt_finalize(struct domain *d, void *fdt);
+
+/*
+ * Assign DT device to domain.
+ *
+ * Called when DT device is passed through to guest, so SCI driver can ena=
ble
+ * device access to the domain if SCI FW provides "Device specific access
+ * control" functionality.
+ */
+int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
+#else
+
+static inline bool sci_domain_is_enabled(struct domain *d)
+{
+    return false;
+}
+
+static inline int sci_domain_init(struct domain *d,
+                                  struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline int
+sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct cpu_user_regs *args)
+{
+    return false;
+}
+
+static inline bool sci_dt_handle_node(struct domain *d,
+                                      struct dt_device_node *node)
+{
+    return false;
+}
+
+static inline int sci_dt_finalize(struct domain *d, void *fdt)
+{
+    return false;
+}
+
+static inline int sci_assign_dt_device(struct domain *d,
+                                       struct dt_device_node *dev)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 62d8117a12..51b3c02973 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -12,6 +12,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/firmware/sci.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -300,6 +301,8 @@ static bool vsmccc_handle_call(struct cpu_user_regs *re=
gs)
             break;
         case ARM_SMCCC_OWNER_SIP:
             handled =3D handle_sip(regs);
+            if ( !handled )
+                handled =3D sci_handle_call(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_E=
ND:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END=
:
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/dev=
ice.h
index 1acd1ba1d8..e96c5558c2 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -18,6 +18,7 @@ enum device_class
     DEVICE_IOMMU,
     DEVICE_INTERRUPT_CONTROLLER,
     DEVICE_PCI_HOSTBRIDGE,
+    DEVICE_FIRMWARE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 24840eeaa6..55eed9992c 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /* IN */
+    uint8_t arm_sci_type;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.34.1

