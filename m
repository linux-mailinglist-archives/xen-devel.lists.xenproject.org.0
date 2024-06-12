Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7043590492A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 04:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738798.1145662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHDxt-000697-Ln; Wed, 12 Jun 2024 02:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738798.1145662; Wed, 12 Jun 2024 02:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHDxt-00066s-Iz; Wed, 12 Jun 2024 02:43:57 +0000
Received: by outflank-mailman (input) for mailman id 738798;
 Wed, 12 Jun 2024 02:43:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAc7=NO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHDxs-00066m-L8
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 02:43:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2414::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bff1155-2865-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 04:43:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 02:43:52 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 02:43:52 +0000
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
X-Inumbo-ID: 9bff1155-2865-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM7zGWZbY73n3z3VECnXoPWAJN5ggR+nqqvAnJHLmUuT4rycN2z3B5TIbS7ulcECmlHIK0G2f3uyAXe10V5loiaaWuWGYJTNCaWTNoy4V1An0DmHbU44lTLuGbTiInCjtNkM8qk8SYGFVur5Ax/UJ9DETxQKZtW2+MzZLXNzBiY2Ymg5uRgtcC21DATtA0NjjYAQl3AQ9NjJNkaj3Ymp2rcP4zA5EPwK9OZP9pJ0UxlHGRWojJHf3dk4DwGQuaJEBRYGgOf15FGpu3gM6ul+iwGFDaHnctHp81dqPztIyC69NGsfdM7bG0FXK4QeklerstIXFqahwDdAz/thHXouTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsyLDthGinb2wG8OOq9BSBAG2db9iZHQburqgXXesKM=;
 b=EflQTm4IngNAUMpbkpt7TJW1sFMYo9xkGU+guTmMkLD5olYE/r4las4iDzYOt4SP/p2nGWIktLufpri+GnHh9eWbd24AZIlHbqubGYWba8a4AdwuzFOW44Xqnyz++SP22FTbEgpQweYURIQEwpOwhC/uxzK/KvIbPq/xPd76mq1lCp5wdaPc2yTnxqAgdiE/m6qT3900WF95R403uWREWoMIA7otvvc+cbx83+IYS6uwjOb9LPNVmwJW+YgkveMj5LREmRmfHv6DnYiE/vAEdJLFyBHd/kUsWAGzubwuGg9RU/mu4vu8fQ8jPFYEEWLR8rRIf2BaOFVtPdUt6tWnEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsyLDthGinb2wG8OOq9BSBAG2db9iZHQburqgXXesKM=;
 b=CTHKQPPtfBEvT+Ke+xDnVtfsxuDjr1Irm36ZcZwD14j6RTQJdK+3YJrGcxQyO9s52P/Tx2DE3WLQ9RLBKpZ8Bc2oxH+Kz4mJ59YvhBaxq91cKEtgrlYtaq/ds9sG0tHtdymSJ3VHI41liP6XJvJNvaU0eb+xlDlcpTpTFZqkqYg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Topic: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Thread-Index: AQHauLJgk79xZtykz0GMHuXNeMsUFbHBLLUAgALK4YA=
Date: Wed, 12 Jun 2024 02:43:51 +0000
Message-ID:
 <BL1PR12MB5849B1B536BAD641C37A4308E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-3-Jiqian.Chen@amd.com>
 <efc35614-561c-4baa-9d94-d17ecb528a4b@suse.com>
In-Reply-To: <efc35614-561c-4baa-9d94-d17ecb528a4b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL1PR12MB5731:EE_
x-ms-office365-filtering-correlation-id: bcd9349d-13b7-4ff2-7c13-08dc8a897ea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|1800799016|376006|366008|7416006|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1RaaVdrSGxOdnc4LzRiRFQrelJLenkzbVZQcE5ZSGltUk8xektKUHFVUFBj?=
 =?utf-8?B?MGY0aGZLUWdYNTdOYW1nUHpXT2ZCeFQ0UWZJNzZmUEpVQWZHWVZQM2VrSVUr?=
 =?utf-8?B?RjhlUkpwek1kN001c1JSeWdSbitNb2lzQmc2akFzb2JDMHdRemVQN3NXY1NW?=
 =?utf-8?B?TVVwZFBoMjd4cGlYOS9yeTBLS1pBMkEreHQ5b0Jod2pQdTRsYjdpdnFzTDVT?=
 =?utf-8?B?bFFyWW9DTlEvOUNjSDlNMkJ1RGxwUEgwbU54Z25qTnpGVEZYVlpyb1JzWkt3?=
 =?utf-8?B?Rjc5NjYrajZpMEU4akZnM3RaaFFNRjdIaUQvMHIxV3l6RzNEVkMwakc3OElE?=
 =?utf-8?B?UG5YVnVZdUVkM1Ezb2hEWkg1SWxFeFZQRmJyWTVxWVFOMUs2Wk5weUZsQVpy?=
 =?utf-8?B?aCtaSWxvdUZTQ2VjNnl3ekErSzNLTk5nUXRwYVRkeUxId0doNlRvRjRZY01v?=
 =?utf-8?B?NEM5RStCenY1MHp6WnEvYUhxSlcrK3dFNUZXbFJrbEdFOTMvYitjTmxsa2xW?=
 =?utf-8?B?UjNheVZkeGk0VVZvNVk0UDJPOFNFcTkrbnM3Mktab1RpYzhZQTBnS1NJL094?=
 =?utf-8?B?TWlyQXpGRndueGo4a3B3aExDekJZU3lMdDJxcXhZNm0xNjlrMHlrZE5tVUIr?=
 =?utf-8?B?V3FFM2RpV2ptK0kvaXZHQTF3MSsvb0hkY3VWOWx1cFBGQlcrYlNNQTJGZ0R3?=
 =?utf-8?B?WU9xcm5FcjNwQjdpbXc0TVRQWWlPeVRCNnBSd3FwdlFkWURWSkU2MEpvZUoz?=
 =?utf-8?B?UGJKWDBsUEZ1WWRRMmZuQ1UwYU9VUkJ2VDdjdEhvNnBoYkM3ZzUvcVVhRTBG?=
 =?utf-8?B?S0RZVnA0SXU5aHFHNWw1ZmtuQ0EyQUFKSU9MYmVNTlg5cmRHZmJHVTY4OVFn?=
 =?utf-8?B?cEJOakYrUDBhVTZhSGp2SUVkS1ZqSlhTM2V1TEhjVWh0aDE4VHkzZHZOMDM5?=
 =?utf-8?B?a0szWmZqT2FYQ3cyVE14UGE0Qk9KbVg4MkJyb1BRbko2U2pQd3cyOTAzS1FR?=
 =?utf-8?B?WTdjME5yY1JRdXZZdUtrVlVLakNxdjZOZE5DTU11QklGQjVKWG9ieWVDTVBH?=
 =?utf-8?B?di9RcnphR29EMTh0ZmF5Sm9rS3BrZWVjSS8vbVUvZnh3RG5CMmZlWXhCc3RN?=
 =?utf-8?B?dzRFNGtjSmphMkxXNHZsR2NsTmI1L1pRS2NYZzlVNHIyM0ZVb1R1OWV5U09X?=
 =?utf-8?B?OFlHNjhRbGhIWjdOTm5aT2tSc0lrcXFxaXRDS2JUcmExMGU3OUt4ZjZTRXRs?=
 =?utf-8?B?YnpPU3BpaXZ3OGkxWHBxaFhsRmNnQ2tRQldlQlJiaDE5MzhtWm1WMm9KWnhK?=
 =?utf-8?B?UVA5ai9jNXYyekhHajZ0SG9WVERFVFBMNmpmcWxHbStscWh1T2p4MzArTjc1?=
 =?utf-8?B?S0g3NDAvcG1LdlR6OHp5UkE4Q0lvNXo0cjI3YmdSQ0VEMnA1ckJkR05OMFF5?=
 =?utf-8?B?YWZxREhzVnoyelBnNmZLVDNBOXVlQjF2anJGN1NXaWZwNG9zczVvbzJRZjJN?=
 =?utf-8?B?c2ZtRHM1a2VSOWlxSVhJZ3hBekYyNXpiSHpPYXkveldud09TdGlzRVhMNUlO?=
 =?utf-8?B?UVl2OE5oWkFia0lDbVBPV0VadEhSeC84ckJMdXFGMkw4bGZxakgrcHRkdC9V?=
 =?utf-8?B?cjFEUytTSDZhK3pMZFBkVVdDWHN4SUlIRWxEMk9RSWQzd0FXdDkwczkvWXRS?=
 =?utf-8?B?YjN1bVBZQlFxenRZZHhRaFdtUmVrWkhId2VaYUUyNnA0aVI2SlhqdWVqNjRS?=
 =?utf-8?B?MThpLzVQSThVcW9EVXdkMDNialFReGJiUUozYkpIV0pSQ01ZKzlCYkJFOUFN?=
 =?utf-8?Q?uZL5XA/ACZplv9sAVxohxthkm5npr9DBM2+FA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(376006)(366008)(7416006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzdlcDJJSjdhYkpXQmJzcVhKOWg3a0ZvdFZqSjd0NTdpRGZGdDhIemc5QjNK?=
 =?utf-8?B?WW93ekRTM1dCZ0JNWWxEQ3o4NFBGa0I1RzNpeG91bnBlbEFLRGRDbnJLT3BX?=
 =?utf-8?B?eldFbHdiQ2d5ZDhhVzdvaUZ6S3duUGpzbFV6RkFZUWh2bzhPSXR5Yk54dE1O?=
 =?utf-8?B?bUJreTAwdzI3YWFVLytkYzFMVDZTWUFXOVU0VEptWEZRTUpDVXVXNmhQYVZF?=
 =?utf-8?B?QXNjVU9aNnFSZXE1ZWpVM0IrNnROeHVuSmxTQjhoL20zaFZNaUlOdnBZaVVP?=
 =?utf-8?B?cjYxVmFUWEt4OGhpT0Q5Tis4K1dMQzVvK3dDZ21Dd3RDNHZScU14QXBZN3Ju?=
 =?utf-8?B?b0RkQmNXOE9BSW56cGJaMk1KSXlqMDlwS3dPLzluNTFKZWFubjRmcmdCQ2Nu?=
 =?utf-8?B?MmFYRTdWSk13bituTXBUZlVRWnd0Q3ZyZVdvYng3ZFdDWmpDTVFQUUs1MGYr?=
 =?utf-8?B?UE9YMUkxSFdJVnptS21zWnNsdkpJaFdoV3hmTURBb1htWVhlR2dIT0VkU1RM?=
 =?utf-8?B?SC9xVHRyY243MXZtelI5N0J2bnEyZ052Nklsa2QzNTcxUktLYkZ1aXZrOUVk?=
 =?utf-8?B?TjJYWW80aVBTQUdFM29hRFIvQzRTcmNtSXIvb3JHOCtpNkNTSXFUNHlyY25w?=
 =?utf-8?B?anJxL0pGWUZlNk55aGFLWEFGSjJxcG9LRzFMY1QyMUhBSXd2TVlETVdGNUhj?=
 =?utf-8?B?SzllbFc0U0hCekVMcnlXTTNUMTZiNGw1QjJaSERKZHJrUWVrTDZ0VHNLRWFF?=
 =?utf-8?B?WkFlaFR0M3RlWUdoajU4NVNtWmZ0WFhYOUN5RE45a01pNGYzUFJQcXhMdjhm?=
 =?utf-8?B?Z0I3SHY5UTAzYmh6MjFJc1VvTjN4ZFRSYjZUUEVTbDFyTmNDM3UvcWdjY0Y0?=
 =?utf-8?B?YjFSS0JkcElqbVcwRlBtVGlsSGlnS0diWDh2Sng2MTRlNWVNVWFJZmJ6VTRs?=
 =?utf-8?B?aWw1TVIwNzVXYVIxQVJOcmd2aXlUN2RyTmdTcGhGWnQ4enRxOGw1d0NGSlhF?=
 =?utf-8?B?aVVQUnFTdzAwSStNd0JDMlJwK21ReGRvQTVWL3M5NVlYclFUejZLZG5pNHJz?=
 =?utf-8?B?b1BxbVNvZDlzMW44TXFaS2MxTmlvcHhtcGxMdFdNYjdSeVZLSmI3STMyNXJV?=
 =?utf-8?B?c0lPeEJmZURGQk5uOUNacW5RY3pSMTBGVHRMMFU3aW9HTEplaDdXRVVwV0lB?=
 =?utf-8?B?YmFiSVJOYy9QNXI5dHNLSUZHZVVjWUtVU1QrdUtHKzJmN1VkR3JpR21Fcnhr?=
 =?utf-8?B?aVBlUE9Nbm1DKzlOV2dsV2o5dUdaWUJiVWVjWGV5Q2ZBRkE4dXJrOTg3MEdi?=
 =?utf-8?B?TWFiOWJsdDZTQkNHc1NhSGpTc2lEcFo3czVMSU5rUEdob1pyajZFTDd6OGd2?=
 =?utf-8?B?dFdSSWpZNG5wWkhxd2s4NDhWdk1wbDRyUzJIalNiVGROWEZsY294Nm5xWE9m?=
 =?utf-8?B?Skxxa2JzbmRtV1FIRG9JWVJiclFyRkxGM0JIZ2sxdEs5UXRLeUtRQUgrQzIy?=
 =?utf-8?B?NlJHMGVneVAzczM5dy9VUXp3VzlLak5nb1NRdVp2VkJWdnZCSlhmQ0RteGlP?=
 =?utf-8?B?UW9BT3RXbmdWc0FaR1B0dUo4SW5HUjJnQVNWUTFiVGVDU2FTRnhoT3BkTlox?=
 =?utf-8?B?RWFmQk1jTDA3UkNpQzlFYUZTTUZmdFRSZk01NVZCbng5czhGWGF2dlRBeGlp?=
 =?utf-8?B?a3U3MEVNTWFyWkZlVEYybGRTZXlNeDR0NVRCOUo2UWp4WHpqdWJtL1JURUpH?=
 =?utf-8?B?S2Y2cGh2YXFtTWxsVll2SFVVaVNrbzdGRXpYSnJFWE82UjFsWGZIWm8vakwv?=
 =?utf-8?B?di9PSmlqNWtMLzQxc0VrajRTRzc3ZWtFdmtrQktwRWxybDZuYk5pN1dwM0h1?=
 =?utf-8?B?UE1wR0g5d3VMMlJwSXVIV2VoeVBuNDJQeWE2UGgrWEphckl4QnN3U2dBSjk4?=
 =?utf-8?B?L0dEN0RneTdnbzZ6cHBSM1JNUWNPQmFXQmZ1bnFoalcwbjhtSGhrWWhwYjA2?=
 =?utf-8?B?RlpaVGRKQktlTWdXTm5nV0VYZDlQaHVSWWhkdHRoR1VQcnYzdXpJYkdrSUVn?=
 =?utf-8?B?NWZ5SGQzTjd1Vm1NaVdJZ2M0UUMzN3JIOGJ5WmJzS2hRU1JZSlpOeGVYcUxN?=
 =?utf-8?Q?YSdo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04C8574644F6AE4CB9A1EAB248FA644D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd9349d-13b7-4ff2-7c13-08dc8a897ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 02:43:51.9341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4tM78/Jh36dODqh3p3w4WkDMQlhi8YppExJeNtvnKG78BJ8FARRKQz8knb4aOYmUKLG5Ur1XfsQA8J5v5knJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731

T24gMjAyNC82LzEwIDIzOjU4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDYuMjAyNCAx
MDoxMSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBJZiBydW4gWGVuIHdpdGggUFZIIGRvbTAgYW5k
IGh2bSBkb21VLCBodm0gd2lsbCBtYXAgYSBwaXJxIGZvcg0KPj4gYSBwYXNzdGhyb3VnaCBkZXZp
Y2UgYnkgdXNpbmcgZ3NpLCBzZWUgcWVtdSBjb2RlDQo+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5
c2Rldl9tYXBfcGlycSBhbmQgbGlieGwgY29kZQ0KPj4gcGNpX2FkZF9kbV9kb25lLT54Y19waHlz
ZGV2X21hcF9waXJxLiBUaGVuIHhjX3BoeXNkZXZfbWFwX3BpcnENCj4+IHdpbGwgY2FsbCBpbnRv
IFhlbiwgYnV0IGluIGh2bV9waHlzZGV2X29wLCBQSFlTREVWT1BfbWFwX3BpcnENCj4+IGlzIG5v
dCBhbGxvd2VkIGJlY2F1c2UgY3VycmQgaXMgUFZIIGRvbTAgYW5kIFBWSCBoYXMgbm8NCj4+IFg4
Nl9FTVVfVVNFX1BJUlEgZmxhZywgaXQgd2lsbCBmYWlsIGF0IGhhc19waXJxIGNoZWNrLg0KPj4N
Cj4+IFNvLCBhbGxvdyBQSFlTREVWT1BfbWFwX3BpcnEgd2hlbiBkb20wIGlzIFBWSCBhbmQgYWxz
byBhbGxvdw0KPj4gUEhZU0RFVk9QX3VubWFwX3BpcnEgZm9yIHRoZSBmYWlsZWQgcGF0aCB0byB1
bm1hcCBwaXJxLiBBbmQNCj4+IGFkZCBhIG5ldyBjaGVjayB0byBwcmV2ZW50IHNlbGYgbWFwIHdo
ZW4gc3ViamVjdCBkb21haW4gaGFzIG5vDQo+PiBQSVJRIGZsYWcuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEpp
cWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQo+IFdoYXQncyBpbW8gbWlz
c2luZyBpbiB0aGUgZGVzY3JpcHRpb24gaXMgYSBjbGFyaWZpY2F0aW9uIC8ganVzdGlmaWNhdGlv
biBvZg0KPiB3aHkgaXQgaXMgZ29pbmcgdG8gYmUgYSBnb29kIGlkZWEgKG9yIGF0IGxlYXN0IGFu
IGFjY2VwdGFibGUgb25lKSB0byBleHBvc2UNCj4gdGhlIGNvbmNlcHQgb2YgUElSUXMgdG8gUFZI
LiBJZiBJJ20gbm90IG1pc3Rha2VuIHRoYXQgY29uY2VwdCBzbyBmYXIgaGFzDQo+IGJlZW4gZW50
aXJlbHkgYSBQViBvbmUuDQpJIGRpZG4ndCB3YW50IHRvIGV4cG9zZSB0aGUgY29uY2VwdCBvZiBQ
SVJRcyB0byBQVkguDQpJIGRpZCB0aGlzIHBhdGNoIGlzIGZvciBIVk0gdGhhdCB1c2UgUElSUXMs
IHdoYXQgSSBzYWlkIGluIGNvbW1pdCBtZXNzYWdlIGlzIEhWTSB3aWxsIG1hcCBhIHBpcnEgZm9y
IGdzaSwgbm90IFBWSC4NCkZvciB0aGUgb3JpZ2luYWwgY29kZSwgaXQgY2hlY2tzICIgIWhhc19w
aXJxKGN1cnJkKSIsIGJ1dCBjdXJyZCBpcyBQVkggZG9tMCwgc28gaXQgZmFpbGVkLiBTbyBJIG5l
ZWQgdG8gYWxsb3cgUEhZU0RFVk9QX21hcF9waXJxDQpldmVuIGN1cnJkIGhhcyBubyBQSVJRcywg
YnV0IHRoZSBzdWJqZWN0IGRvbWFpbiBoYXMuDQoNCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+
PiBAQCAtNzEsOCArNzEsMTQgQEAgbG9uZyBodm1fcGh5c2Rldl9vcChpbnQgY21kLCBYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICANCj4+ICAgICAgc3dpdGNoICggY21kICkN
Cj4+ICAgICAgew0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBPbmx5IGJlaW5nIHBlcm1pdHRlZCBm
b3IgbWFuYWdlbWVudCBvZiBvdGhlciBkb21haW5zLg0KPj4gKyAgICAgKiBGdXJ0aGVyIHJlc3Ry
aWN0aW9ucyBhcmUgZW5mb3JjZWQgaW4gZG9fcGh5c2Rldl9vcC4NCj4+ICsgICAgICovDQo+PiAg
ICAgIGNhc2UgUEhZU0RFVk9QX21hcF9waXJxOg0KPj4gICAgICBjYXNlIFBIWVNERVZPUF91bm1h
cF9waXJxOg0KPj4gKyAgICAgICAgYnJlYWs7DQo+IA0KPiBOaXQ6IEltbyBzdWNoIGEgY29tbWVu
dCBvdWdodCB0byBiZSBpbmRlbnRlZCBsaWtlIGNvZGUgKHN0YXRlbWVudHMpLCBub3QNCj4gbGlr
ZSB0aGUgY2FzZSBsYWJlbHMuDQpUaGFua3MsIEkgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

