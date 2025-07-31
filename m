Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37811B171EA
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 15:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065633.1431009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTCu-0008Kv-FC; Thu, 31 Jul 2025 13:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065633.1431009; Thu, 31 Jul 2025 13:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTCu-0008Iz-BQ; Thu, 31 Jul 2025 13:20:28 +0000
Received: by outflank-mailman (input) for mailman id 1065633;
 Thu, 31 Jul 2025 13:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZdq=2M=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uhTCs-00063e-Pb
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 13:20:26 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e2591ee-6e11-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 15:20:24 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by VI2PR03MB10716.eurprd03.prod.outlook.com (2603:10a6:800:27f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 31 Jul
 2025 13:20:21 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 13:20:21 +0000
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
X-Inumbo-ID: 1e2591ee-6e11-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aufQWIwPJqQpQb1cNaEg4cmdnb9D5112uG4p9X3iClMdeAu4vw3K5n/I3twU8FsgVb53l0IAXiT8NVuX5ZqQHlZvdNHiWrSwhaC4/0ill4Mn+h0gl1gKTFy5yxDewmHmXnCEVVLdIicfGNlBe9+xcOCjxlJEW/XZe2nyvDKQ+FA0HGl7RfrWu6hGiDa548Fj3ZeJ+gt0Zir2/K6/kCg0bqePYek0ybmDB2uXca/NjMgMqcNxsaSb25ZewLzwvbIdZX1BXoqe4JwJ4rARTCuil/6Fgigd1aas4vmTglM45dXF6QOjIWfG+ExcXit0D+gm4ovP+zrr6/baJOwsfbgAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8/JnZ9ZdM2g7yD1fuGKs/LWTyQuEMFWbfZysOCuao8=;
 b=fjUyJ+w8EzUJLWpEMAG+KMgKNidofHQb8cD8ibM6iP/Oa6bFMO/jWB8mkgPQCaFEmDcxdq6e/FiVXZjCgCBmvBDyPfLN8ZBdlx+OiyAaki4L4yyUCSUlOr/Zqb/mpaqD2qTxRmY61N2fxMB1wfbCyjl/53m4jjQO4TcrwUD7iTaUIw16YSybfeWqeRofHlNlhq3WAO6ZpDifHBK0iCDTOB0uBUZMcInKY71jLLtaJc9z4nffSpbrcF7C5QnsZlKuOC121kbXiMk+61If+i524wUg73ZBvEwGxSot0Ky7qO7KxjDxp4oXmiGL+Z6fled2+qGrr5zNEPAGuyz8XnrdeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8/JnZ9ZdM2g7yD1fuGKs/LWTyQuEMFWbfZysOCuao8=;
 b=sECvSvhM8hteqE4eruTEhu2MjlcW36XQ103OR36HJ5PmHo7GPCH+YtZeyXLj2ij8ocJkQhaEYSS/2ZWcbn8WkqIp7urJV0z31idwNbHxym1ZtHCFUorJBhQ6XovldzZKgo6zBGifdpk8v6Fi6li3noAV2wBN8B5eyGfi7n0lFV5nLjACfDUg7my3D3EKfgJpr/owQSMI+OGzHw7Zwe6sUAuSKjSejrda+FBCYidVRHHkf5OQLFSRdEVgfOyGzl0jlIun8Vs9oIKgezh5RdUv9C8XuvBMMZhdF37SaU7nipeG5bpI1tGIDZHHzUNPxmimnrwYGPVsZpIX0HbKQfF0rg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 06/10] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Topic: [PATCH 06/10] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Thread-Index: AQHb/KmyzrA3Eiqe3kK0sQcmvNAff7RJKJyAgAMZy4A=
Date: Thu, 31 Jul 2025 13:20:21 +0000
Message-ID: <c78de6ea-f767-44c5-b344-2075752aeb97@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <6f7e5b23852d4791c81db75ebaaccc2dc7151c22.1753367178.git.leonid_komarianskyi@epam.com>
 <8381b52d-855f-403d-a1f3-d55427bf7d7f@xen.org>
In-Reply-To: <8381b52d-855f-403d-a1f3-d55427bf7d7f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|VI2PR03MB10716:EE_
x-ms-office365-filtering-correlation-id: 9c2066cd-6841-4755-e42f-08ddd0350095
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUdBSUFxbUlqRW5KOWRmZ1U2Uk9rcDJXTkZrdnhlanJrOGhwTzRIclpTTWJE?=
 =?utf-8?B?NU9DY1BWbXN5UmhzTW9SZGtoTmd3MkIzRVBvOEU0L1FUUGhQelhRaVFvSGtH?=
 =?utf-8?B?WTlMUW1jdFh5T0Q5enpSZG1IUStwWndKdHl1MlNqcnp2SzFYdENURkVTeFZG?=
 =?utf-8?B?UnZ5VUlLTlZVTytCUzY5c0s5cERNWFhLOEp5cDVKbFV4VXhoSCtGbXpvU0JS?=
 =?utf-8?B?dHdUVVl6Q0pFWkFQRmFqWkJTTjdkR25EQStQK3ducnlpSWwwYmVvVXZQeHVW?=
 =?utf-8?B?TTQ4bUxBSTNtN215TGtFQ2FscG5RNGhHYW10UGJHQ2ZVNU5RbjZyMUdwYkp2?=
 =?utf-8?B?ZFo1MVAxb3JjckdDcXNLeElQS1kwbHZVeG9JUHNzS2dRUU1wU0dSTU1DOXgx?=
 =?utf-8?B?VHhKQ0d3MUlVRFpiSVM0Q1VHc0RHc1RBRnE3b2wwYkZLZ3hHK1RvZ2VkSnJD?=
 =?utf-8?B?Sk9aM1FUR1N1UVZ6cll6blpjc25ZZWI3dDBxeS9uRWd4Q2xobzIrSGFlb1dY?=
 =?utf-8?B?eUczY3RSQWJXRFcwUTlaUHphaTdxd2VNK2tBREJJWDJnT05oTkJSSGRrOWwz?=
 =?utf-8?B?VDg4ZnJMK0xhTnFWYTNFVU5FSnBBK0F0ajZ2UXN2TjFvcDJkbktONitDMXND?=
 =?utf-8?B?SWdhS0c3QjZQNVE5U1QvN2ZHcDkxanpwY2ZCMmVPdHovSTVpSEd2REt2QVdJ?=
 =?utf-8?B?S3VlMldkTGRBMEtLSXlQcWVJcjdrT2ZGNHVkdm1TM3RraE8vY3BOeTlyZjdh?=
 =?utf-8?B?eG1ZMFVjRnlRSHBmcC9FTmtQTlV4clhxM3pCRkM0THVKellvaHZ0YklRVm5q?=
 =?utf-8?B?cXhQbUF4aTc3aTB2dCt3dVBJcG1YTWNoSVA0Sjg0Ny9kblROUTk4SDZuenor?=
 =?utf-8?B?UGpKQ0UrMkhnT2tmWWFwbFF6RjFZVE4xSzlQSElieUZGTnZtejgrTFhwSHB1?=
 =?utf-8?B?Q3JDTDkrRFA1VlJ3VEhETGFucjlCdzFDZnFVc3FGTzFOZnJDc3BoMVJ2ay94?=
 =?utf-8?B?R01QZHlxeGVnbUI1Qm9XMmNWQURFNEtNMnJyN1prTWhwZFh0UG4zbXloQjZ5?=
 =?utf-8?B?Nk5TdVRSMkdTbEx4NHRQdFZIQ0pMUzYzWVdRTE1uekc4UkNscGpCdzk0RU1w?=
 =?utf-8?B?L2Fmd1lYSS8rUll2dndEUEtqeUh3Z1FaY0hrZFAwOTd3R1BxNytHUURrZ2Y3?=
 =?utf-8?B?ZjNVeWpEQ0NkcHlPc25xWmg4SWx0U0hST3ExWEN4M3l4ckxrMUtBYTlsdkNl?=
 =?utf-8?B?ZTlKVlM5anl6R3ZxWE1IL2FxZ3JLdWtxMFQ3MTVDR1BUL0V6dm5IaU1NSmJS?=
 =?utf-8?B?YTRQTXUvK09JQXhuZmRRdjNJUnBXSElKdUdGS29CWllSUTQwOGlOaGpaNXI2?=
 =?utf-8?B?RFZpZTI0NEpXYWlqU3hyaDlYWm5EcVpNaGNvREFEM001Y3lGZ2NUTnRsbk1N?=
 =?utf-8?B?bWtHbFpjeER5VTRMZWQzdWF0STlTSmdMTHZjZnJ0SFBhazdhVmtXVEQwQjFv?=
 =?utf-8?B?d1Bkc2VESWovVjE1TFJ1c0VHaHhnQ3NZa2tPeDdxT3pMMkV1QkZ0SlFIdVBy?=
 =?utf-8?B?TytSZnhYL3NDMjltd0V4U0ZtZHZRZXNySHpZcWR6aFN6OTNSVDdnU2R1OTJ1?=
 =?utf-8?B?aTdmVkdXcXF3TnVTTVI3dGhIUVhFTVMyOCtOaVZ4dk9aUWVmek9jSERSSmpG?=
 =?utf-8?B?eVM2V1V0WFRZakVEY2ozV2dtNENVSEVrOTR0ZktkU0pZejBlSC9kaDAwZGI0?=
 =?utf-8?B?VDBzTXVuSnF5bE80dmR0VHNsOEJQaDJqZGI0bDI5blBMZ2NZT2ZvdGhXZHlE?=
 =?utf-8?B?RW9mcjhmVEgwNlBianl5Wm1RMy9KZkFrVzByQTQ1UzExTEFKOXMvRTRaRjR1?=
 =?utf-8?B?Vi9CN0Nkb0NqWWtIbmVBWXh2SXhJczlvaW4zUDlINnVlN2JFaENwZDRiaHgv?=
 =?utf-8?B?WE5abW1kMFU0Q2YwN3ZZS2VVR01GekdiR0xqQzF3dlJBcTRiV3dmTDZ4Uk4r?=
 =?utf-8?B?dFNvYndoZTF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZCtEclk3NCtLSCs0eHR4Q2RJSjNVRk42dzR3bVU5S0E2T0prUzd4MENpRG9q?=
 =?utf-8?B?czdyYnZkV3FjR3p0d0pyY0ppSW5sWlErVHNZeGVuV0h5Q0VpTlNmTGVXRGhq?=
 =?utf-8?B?Tk9FS2ZSNVZoMjJBVC9sZlU3T1hDYTVIU282ZGp1ZDNHVGFCVThOZ3d5dlRU?=
 =?utf-8?B?RFYyNW9WR241TXIxQjRSVmx3OGY3NDZHSEtCblhEbG5uaDBIZUttV3loZ0tL?=
 =?utf-8?B?blRydVk5clVGVkFET0ljR2lkU1VrL3dhT0EzRndzL0NraTNndmtHZm5ENXVH?=
 =?utf-8?B?T1hnL3R1b0x4cWZPQ0I5di9URjNsb21iV3RBMlpIUmZFZERwVE1VOEVXbGJ4?=
 =?utf-8?B?QWNxZGxwRmF3UVJFZHZZRkNXUnVWNUhaSUpIeFI4YkpObU1UNlgrZ3dZNjAr?=
 =?utf-8?B?WDNVa3BGeXh3QitVVmh6KzlKVGpscWhQbmQ1ZDc4OHhEU1VSUlRuMzk2WlAx?=
 =?utf-8?B?ZkRWazNVangxTXJiMCtjZjdBc2J0VUJLQlJjQnJWMU9MWGdKMmF4SmNhcFNZ?=
 =?utf-8?B?ZzRjQzRSaUtsUUlXL3lnWTNDa3ZvdE9ieVp6aERvamRQeWdIdmoyR1ErL2JN?=
 =?utf-8?B?cGcxSmsrQldJOHJYd3pOaCtlazFBaGJtTFpmbzVJOVBJNHNrbDF2K1lEcUpy?=
 =?utf-8?B?YVg2T09RRzFCc0VMNk5uWjBEREdtWjhrT2RlaXZlOERMV29Gb1Z0VEgxZXo4?=
 =?utf-8?B?cHB1QUx6eGd4UndCR2ZITFJQT3M2RGh6RkJzQ0VkK25yajR4VjBLekg0NEpP?=
 =?utf-8?B?bFFZb3lDd05VaGtZbW5NSTZxcVZjUXdBY1hhcmpqc0xLcHFFQkhhcldrL2tn?=
 =?utf-8?B?MG8zWWFJM09hNEI0eG1TS25JcmlBdDZTV2JhSi9ZL3lsN0dHVEh5cmRZUmMw?=
 =?utf-8?B?Qml0TVh5c2o5MEx2aEN2UUY3ckFGSEwvL0F3UmVDWWg3NDJ1cWsyQlBJa042?=
 =?utf-8?B?LzIrUndpTnMwQlhrSkdVc3VFYlg4ekd6bWJRdVozRlVUOW4yM29GdnltNk5v?=
 =?utf-8?B?STFFZGxCOTAvcVorNjZBK3BaYUcyWkxJY0FSUFhXTVRJczk5dndoU28wQkF0?=
 =?utf-8?B?Kzk2eE1GYW1OQzlsNFpjL1RscWY1UjhmY2VaYzg5Z0N2RWwvMS9CK3lPRDZr?=
 =?utf-8?B?QTJOQU1aMFVyMFl6NXczbVpXZG5QSGVRallwR3FCS2dLOWZDdnJWUU14ZkZX?=
 =?utf-8?B?TGhwQ0R4TFVhZG4rQk15UUE0eGZJYlc0YjhFRFQ4cnVlZjk2RkFMWWNmbUFV?=
 =?utf-8?B?N1hCTXNQSk12UVhRZ3gvQWZCeXFpREFqWUMrR0NROGZ1czJQditxUnBIRXlR?=
 =?utf-8?B?aXZYRlRlbGt6enlsL3ZoeUtBOGx2dW9TQjkzbU5kdlFTRURIanp0RG0zaUxw?=
 =?utf-8?B?aXIxYVlRT2xGWm1vUmRLSUFGWUNEdFJzSUZHaFRlR0hiOGxYTmFSc3BFWWVQ?=
 =?utf-8?B?UmdiV3ZyVGtHQlZiVlRVcWpPQ2pmMEMxbVVRRU4rTE1remVGcFZWazhTZ0ha?=
 =?utf-8?B?TTNzbWRMQjZUZ24xd1JVZkhlR0QycFd1TXBYUnZUSWtRSy9iTmZ4OGE0b0lT?=
 =?utf-8?B?QUNDR2Y4akZJQ0JwaUY1cnFVQkVNVk5GRml2TnRqMWkxbmdrYk1mVnovOEQ3?=
 =?utf-8?B?YitldHZmZ3oxYkpqRnlET25POWtuTWxYRVZIZnpOL29IV1MrNGJVeHpnd2Y4?=
 =?utf-8?B?L3BPSk9XSVdiT25SQ2dQSld0Z1hlcjVCVWtMNlVHaFNFT2hqbGRwOUpQNWlP?=
 =?utf-8?B?VUFwQ0JIVmh5K05uYXlYQTVramV3ckVuYVlFZDhGUVkrRElwVmVlcHNlQVJU?=
 =?utf-8?B?WUx2c0lCeUkrejE0eGNuaUxqSXc2WDNRb1dnOXIrKzZGamg5ZmdRckQ1elFq?=
 =?utf-8?B?MkgwVElEREV1YitsUUlnZFlZRW5CTUJVNWZPWmJ2Q1JnL0pKc2lLTU91c2JY?=
 =?utf-8?B?TnBvdUpya3N2c1k3YUhkN0thY3hPSzdKV1dPbDlST1Z1MGZJaUVCZVh6ZmNq?=
 =?utf-8?B?RzBXbFIzb0YvdlY2MDlXVFV5dnNuL0p4elA4R1o5SWFwNERzZ25XV3kvRHl3?=
 =?utf-8?B?emQ5QUR0NGw1aU1IL0NrdG9DUFJlTkU4SVNHR3YrSU1PM0NVTTdYM0htNmR4?=
 =?utf-8?B?clYxMVBuaUE4UWluQThQMDJoMTlYT0twMUVER3BNK292cGQvTUtCTTRrSlc0?=
 =?utf-8?Q?C1Qx8z+K2ZtbJJyJFw65h5o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23E9F25CDDD4634F93BDEF0CFC335009@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2066cd-6841-4755-e42f-08ddd0350095
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 13:20:21.8115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OqUdBY3QgdoQfdEWgmOYs1wvA/JFVwusGzhDnDCOueCT2Wp7aGpWnTSgyadVnywm3RbqZkilRAMCre8JrEF9tt8ZuntVGai9/mY3AWtV+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10716

SGkgSnVsaWVuLA0KDQpPbiAyOS4wNy4yNSAxNjo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IE9uIDI0LzA3LzIwMjUgMTU6NTcsIExlb25pZCBLb21hcmlhbnNreWkgd3JvdGU6
DQo+PiBUaGUgZG9fSVJRKCkgZnVuY3Rpb24gaXMgdGhlIG1haW4gaGFuZGxlciBmb3IgcHJvY2Vz
c2luZyBJUlFzLg0KPj4gQ3VycmVudGx5LCBkdWUgdG8gcmVzdHJpY3RpdmUgY2hlY2tzLCBpdCBk
b2VzIG5vdCBwcm9jZXNzIGludGVycnVwdA0KPj4gbnVtYmVycyBncmVhdGVyIHRoYW4gMTAyNC4g
VGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBjb25kaXRpb24gdG8gYWxsb3cNCj4+IHRoZSBoYW5kbGlu
ZyBvZiBpbnRlcnJ1cHRzIGZyb20gdGhlIGVTUEkgcmFuZ2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFtLmNvbT4NCj4+
IC0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL2dpYy5jIHwgMiArLQ0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2FybS9naWMuYw0KPj4gaW5kZXggZDVmMmFkZGY5
Zi4uYjRhMTg1ZmNjNSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMuYw0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+PiBAQCAtMzQyLDcgKzM0Miw3IEBAIHZvaWQgZ2ljX2lu
dGVycnVwdChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgaW50IA0KPj4gaXNfZmlxKQ0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIFJlYWRpbmcgSVJRIHdpbGwgQUNLIGl0ICovDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaXJxID0gZ2ljX2h3X29wcy0+cmVhZF9pcnEoKTsNCj4+IC3CoMKgwqDC
oMKgwqDCoCBpZiAoIGxpa2VseShpcnEgPj0gR0lDX1NHSV9TVEFUSUNfTUFYICYmIGlycSA8IDEw
MjApICkNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGxpa2VseShpcnEgPj0gR0lDX1NHSV9TVEFU
SUNfTUFYICYmIGlycSA8IDEwMjApIHx8IA0KPj4gaXNfZXNwaShpcnEpICkNCj4gDQo+IExvb2tp
bmcgYXQgdGhlIHNlcmllcywgd2Ugc2VlbSB0byBoYXZlIGEgY29tbW9uIHBhdHRlcm4gd2hpY2gg
aXMgImNoZWNrIA0KPiBpZiBhbiBTUEkgb3IgYW4gZVNQSSIuIEFGQUlVLCBwcmV0dHkgbXVjaCBl
dmVyeXdoZXJlIHdlIHVzZSBhbiBTUEksIHdlIA0KPiB3YW50IHRvIGJlIGFibGUgdG8gdXNlIGFu
IGVTUEkuDQo+IA0KPiBTbyByYXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeXdoZXJlLCBjYW4g
d2UgY3JlYXRlIGEgbmV3IGhlbHBlciB0byANCj4gY2hlY2sgd2hldGhlciB3ZSBoYXZlIGFuIChl
KVNQST8gVGhpcyB3b3VsZCBtYWtlIGVhc2llciB0byByZWFkIHRoZSBjb2RlLg0KPiANCg0KT2gs
IHRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50IC0gaXQgaGVscGVkIG1lIGlkZW50aWZ5IG1pc3Rh
a2VzIGluIHRoZSANCnByZXZpb3VzIHBhdGNoZXMgOikNCg0KQmFzaWNhbGx5LCBpbiBzb21lIHBh
cnRzIG9mIHRoZSBjb2RlIGxpa2UgdGhpcywgd2Ugb25seSBuZWVkIHRvIHZlcmlmeSANCndoZXRo
ZXIgdGhlIElOVElEIGlzIHZhbGlkLiBIb3dldmVyLCBpbiBvdGhlciBjYXNlcyAoZS5nLiwgdkdJ
Qy1zcGVjaWZpYyANCmNvZGUpLCB3ZSBhbHNvIG5lZWQgdG8gY2hlY2sgd2hldGhlciB0aGUgZG9t
YWluIGNhbiB1dGlsaXplIHRoZSBJUlEgb3IgDQppZiB0aGUgSFcgR0lDIGFjdHVhbGx5IHN1cHBv
cnRzIHRoYXQgSU5USUQuIEZvciBpbnN0YW5jZSwgdGhlIEhXIG1pZ2h0IA0Kc3VwcG9ydCBvbmx5
IDUxMiBlU1BJcywgYW5kIHNpbXBseSB1c2luZyB0aGUgaXNfZXNwaSBjaGVjayB3b3VsZCBwYXNz
IA0KaW5jb3JyZWN0bHkgYmVjYXVzZSBpdCBvbmx5IHZlcmlmaWVzIGlmIHRoZSBJTlRJRCBmYWxs
cyBpbiB0aGUgZVNQSSANCnJhbmdlIGJ1dCBkb2Vzbid0IGNoZWNrIGlmIHRoZSBoYXJkd2FyZSBz
dXBwb3J0cyB0aGF0IElOVElEIG9yIGlmIHRoZSANCmRvbWFpbiBjYW4gdXNlIHRoYXQgSVJRLg0K
DQpJIHdpbGwgcmV2aXNlIHRoZSBjb2RlIGJhc2VkIG9uIHRoZXNlIGZpbmRpbmdzLCBpbnRyb2R1
Y2UgaGVscGVyIA0KZnVuY3Rpb25zLCBhbmQgYWRkcmVzcyB0aGUgcG90ZW50aWFsIGlzc3VlcyBp
biB2Mi4NCg0KQ2hlZXJzLA0KTGVvbmlk

