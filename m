Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB49490C387
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 08:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742705.1149549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSHh-0001b2-NI; Tue, 18 Jun 2024 06:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742705.1149549; Tue, 18 Jun 2024 06:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJSHh-0001Yq-KZ; Tue, 18 Jun 2024 06:25:37 +0000
Received: by outflank-mailman (input) for mailman id 742705;
 Tue, 18 Jun 2024 06:25:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kZif=NU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJSHf-0001Yk-HR
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 06:25:35 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f403:240a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90871517-2d3b-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 08:25:33 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB6144.namprd12.prod.outlook.com (2603:10b6:8:98::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Tue, 18 Jun 2024 06:25:29 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 06:25:28 +0000
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
X-Inumbo-ID: 90871517-2d3b-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv6u6JXxI9WdGBplVaHiB8zDK4/6QDVEKVY5CuWLk6HjUKCF/ILJ3KY8tfB0FyVo+HtVWhZySr2A4+0SeY1tETNuYjgSNkFgdQCEj5/JjTgN/j0WUrGU5aEZcXxh+CxdIVQrjfyVTldRFJPxogrQNsE0NfWFV1lkKg1/K8gGlS6Glg5nVTuFBU7Pcr4nj902muf+TL1r8CiNfzp2AYChpl0jISCx4wKsE4525VnHG5l7FTbw0SOOrB6QGVApBhkd5WioKJSBwI4uCPv/kiq96G/jV2JUxZQBxxvmA7gferwktHVVcIkhx/s6Il/DZnew/LtElO3UVLcIff5RbNvwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF/u2HYjaNDBqyK+8tQIhNMCEVfbij6OHSG2EI0sfOw=;
 b=ckAi/pkk3C8qZ5VsGODkDrgn4TG4a6wl7FmzIIXUVJZmVOaKlg55sSmENALcWZCB1lGKpM0EFtlnJS9Ruv8nXqHjzRsXw2oVvKmZKVLr7JBEogOXOOP42iktdQHyRtOwVT/32CjAGG9q/dinCb+Q010DHbPnurAnOL0NmyeuFeFjwd/AG4GOLNheOUFav916enhyLK9wKxEO3APLlbb8bHtNqYfrI9Hw2VuuWh6auyQ3Pa912mh2PPls50/Tk8UJHgSzougKkfH82K8GoUjYhRAMaMf5u1Jc9LX5tJfYpboLqN2Txv95CZXoIX0yFev0fDEQYoUb1jNZTfaLQg18Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF/u2HYjaNDBqyK+8tQIhNMCEVfbij6OHSG2EI0sfOw=;
 b=C9jTkCq1HBXFKx5Z7O7DZ4UDJCErYbpOwZt2coYINuZrFnQfEgDMGHqi0Deao5U90liND9BJwy6A0Rs0Jq3o0U7KcXebAEERnDywNBpOYWY9cGFhc4mOsZJYHAE90V04z2gDXinWFnc7P9SP8+fmsxeXQYNHCnoolAXA4ESBl1M=
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
Subject: Re: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHawJTga4AgQ2zhd0+hWXdwZesfOrHMAOYAgAGQCAA=
Date: Tue, 18 Jun 2024 06:25:28 +0000
Message-ID:
 <BL1PR12MB58499527CFA36446EAD3FCE0E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-2-Jiqian.Chen@amd.com>
 <4e2accc2-e81d-450a-af2d-38884455de9c@suse.com>
In-Reply-To: <4e2accc2-e81d-450a-af2d-38884455de9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB6144:EE_
x-ms-office365-filtering-correlation-id: 2f789970-0eab-49d9-d350-08dc8f5f72b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?eThHNXY0bWJMNEswM21uU0w4dE04N0VCZFUzR2JieG45NkFaK3QxOTNlRnhy?=
 =?utf-8?B?VTRGSnZ6clJTbytFT2MyeTV0bC8vcmxpVFhoc2s3eHB6LzlES1kzcHNkL3ZL?=
 =?utf-8?B?dm1Bakk2YTdTSzFxbk14aHdsOFFEMldVTVl5V2xQK0FMUC9RdWJZNlZvRDE1?=
 =?utf-8?B?NHBCZFN0cmdsYUtEU2prS0o2QXA4NzYyRVFPNTlFYm1RbDMvOHBLUDFtcWxM?=
 =?utf-8?B?dmR2aWpubmV6a05aNGdwYlE2aUZ6aFZ1dHFZeGV6TWtBaEV6WUFheXFra3Vk?=
 =?utf-8?B?MGpUQ2VyUnV2MTRWU0tpTXVsdUJBWDNhclAvQkduRDEvNEgrNmZjTDJYZzVL?=
 =?utf-8?B?S1I1YTRkNDc1UjNXYm5jL1lCVEYzYS9NWHZzYU5aVS9CTVJCK1ZkUVlSc1Rr?=
 =?utf-8?B?UlJCdW16ZWwxSTllL3VnRm1OZERpdEJkKzBoNjVVeTB5Mk00VlVKYkdKclZC?=
 =?utf-8?B?Y3RFQWdVaEhzUjR2U3hvU1hyZGMyOVYzdlBiSm50YS9Pd3FHL0I2Y1hLRk9j?=
 =?utf-8?B?OGw0ZG16V0hsUGE1czZneVNrRW5tK3BrWVdha1NDNVVZbndNZ0hST1BSaHNH?=
 =?utf-8?B?TytzR0dCY1c1eWZxRTVieUJGWk8wK1cvNkkyVE91OWJXRXlSZGUvZ3MzWFFE?=
 =?utf-8?B?N0NncHVPNFFKOXFBYW0zMGtYY0NWQmxYSm8yODhlUjc4QStmVG85UXRNY28y?=
 =?utf-8?B?dHJSeDBEc3NsVmZwbmxld1ZQVHZuU3hiQU1mSm14NDNtT0hTQVBONDNKQ0Rh?=
 =?utf-8?B?eUVSckh1SjM1MTg2R2xUb1U3K1NlL1BaZW12bGJ3N2xnZkJQZWpyMUZabVRG?=
 =?utf-8?B?d0kyaTZqc1YyV0VWTklnMHJjTFh2MDJLQ0tvM0lwYVZrdjk4eEc5S3E3MExu?=
 =?utf-8?B?MFVUSFoyM2tiRmFIZGt1Q2Q0R0kwNHdIVnFJZHQ3MDVlWFFvVGpnMDFqOGx4?=
 =?utf-8?B?RGRuUXFkbTRLajRaS0pQUDIxaWhjSkFoSEkxbWd6MGdIWFZTbzI0V0pNS2VH?=
 =?utf-8?B?dVBMMmlhWnFpUngrVnJGSzJVZTRaVVNhaEpGdWJ0SEs4WmVKU0xlNEVpNm1D?=
 =?utf-8?B?c2lVSWdCSjVrV2Q2d0hEMmhvZEZzcGlpSFgvN3Yvc1ViSFl2Wm1GbkpHWXQ2?=
 =?utf-8?B?a05iRzNhVjBORnE2YXVFQTFOWE1RQmtHbUQrcytHaHk1eW5nZGh6VmNWZElK?=
 =?utf-8?B?QTdGaHErdGUwcjVLNmdzNzR3bTJHU2FPNFdMQldwMWR6ZSt3bjBsMlFzY2ly?=
 =?utf-8?B?QWw0djJrQU04cGV3MFB6OUt6UHdDT3RNaS8zUFNIbklkWVlicldueHhtbjkx?=
 =?utf-8?B?d1ZLZHYxcm1RTWl0ZUpFWDdPdGF1V2V4bitPNTBETmJVaUpReUNYT1I1T2NF?=
 =?utf-8?B?WEhld09jRDltWlVzYXp1TnRrVXV0SkV1UWVhWklMZ1RPZmQ2KzZHeDAwOWtt?=
 =?utf-8?B?TlYzSFArRGN3QnF5VkdnV2Erd05zdERGRXNHcGozeDc2U3dVdlZDL3JCQUVI?=
 =?utf-8?B?ZmV4cW9tNk5GSzUxNDgyVkhzL0dLRkdXZVNTbm41aytOQThFa3VmSmt1UDN3?=
 =?utf-8?B?bUZjMXZyOVl5S29EWGhKbDhzZUdsbUppZ05hN2pHbmlVeEJ3WjdoTGIxNHY2?=
 =?utf-8?B?TGFWNTRZRXRPUnJHVHJ0UjdkUDkzZHpSS1NpcE9QNGpjL1A0RmdRdGxNbkp0?=
 =?utf-8?B?OEZ0UDBHR0MrRjBPMWpqSjlhQlBNSHBJaGZjWjJxa2JtNG4vbVNTWE9QQ0h5?=
 =?utf-8?B?OFhhRFQwTjA3eEFkVDlxbU8zWk5yYjdHZFh0VlZxTUVOYW1oeHFiL3lQQ2Fl?=
 =?utf-8?Q?bLE6Fb2CXMBRDyAChEqkOy4LY8Qe57A8mmV7c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RllwVjdtRytUOVh1S0d3Wkhxb1NDUFNXYTRZdE5mcXBsSWFuandoT014RWw0?=
 =?utf-8?B?R2lsYXdqL0s0TVR4cmIrWnozUlN0Uk5SbVVIT3dmbkVMNTU1ZVVxWlJYMmZG?=
 =?utf-8?B?UmhGYmJ2L0RVSDJjODBZcGkrWk1FRzFCVmQ5Ui9VcUNLRTJ6aDBRZ2N5UHo5?=
 =?utf-8?B?VmJkd0VYWmJCUjJWNDlrY25PU01HaERQRTZ6ZW1NRTZXenh6NnNXNzdNNFNM?=
 =?utf-8?B?c0Q4S3ZiOWowWEdSNmtjcTVmdHhzdWZqZG5kN29YanZzcG9CYXhPR003eW83?=
 =?utf-8?B?bXNzdktleW1WTnkwaEowRmJ5TU50Y2NBbnBkMW1USVR3dEdkbldSUjJGVzVp?=
 =?utf-8?B?d3ZySkNmaVB4YjVmTmdnMzBvNU55Y2lCTnBwUUIxcDYxUVVLeUt5RlZaMUh2?=
 =?utf-8?B?bEQ4Z1Q2cEQ5dzdaZG5vZDRKcU14S05qaitSci9zcUdDbGF6NXJ4eXpLNjdO?=
 =?utf-8?B?SHVKYVk2N3dremplSjdEY1E5UWNnVDFIV3lhRnFEcXE1TUtSSm5uMlN5VkRI?=
 =?utf-8?B?TmdTZFlLcG5idVBLRFRHajllbTdJWGVEbXQvV1NxNUx6d2NZWlV3djhDYktM?=
 =?utf-8?B?bzVVNnhta21vdVVvbXI2MSttRWZMZGtHV2k5cUZrd2t2SDkwaDh3SDNSczBq?=
 =?utf-8?B?UHdHOXRnY1JaTGExbWVLU2RHUnF5eXhJV2MrclZUbk5PREFodTNuYkxOTnR6?=
 =?utf-8?B?RU5ERU5MRm4zZGsrcWxhOHlqVVczQWJaeHVQU2g5T2R6b3ZadTNRa3V3a2Jm?=
 =?utf-8?B?R0JqVXNuMkxVN0FFZmUzb1c4T29mSnB4NjhDUHVCUldBeFVHWjVFcGYwekhI?=
 =?utf-8?B?V3NtSUpKU05lVlZqWG4rRVBlRHBCSVZvdnRhbzFzNER3YWFjTFRRWWd1WW15?=
 =?utf-8?B?Nzk3aGlEM3NjWmEvMCtpYklBbEZmUlVDQjY4SC96eGk3aENISk1hRENtNEc0?=
 =?utf-8?B?aTloL05pTHdJREwzODkycXcrY2FiWjNjN1NDTlplUHNDdytpQXpJOXc1eUNt?=
 =?utf-8?B?ZmxHMlVrdFVCcWxVMEI3dkNjc3BHbXJZeWsrd2IzbG5nNmwyblJOd0pJTzNq?=
 =?utf-8?B?SCtSVTJkNUNOREFKdzZNM3dtV2JFaE5TQUIvK2V2bjFRUFNySTlmS1lrN29Y?=
 =?utf-8?B?RS83dTlOelBDWXd6VTJYL083bE95RjVPOGUvanY1dXA3ek8zYm5pWmEzMHNv?=
 =?utf-8?B?L0xMalFnQkxReTZNUFZpUi9XRTRJV01CMWZKRTRlR0c1VGFVMmlXYnUzaklv?=
 =?utf-8?B?QnRUUHVjaXFGcG05c2ZxWGZlSUlWdldsVTczSFJtRC9iMFI2eVkxRkNMNkVJ?=
 =?utf-8?B?bWhNak5Xek1ZUWdSTkJRREtzR3dPQmk3UEVIdUJZdHVnaXRubDBUSnJKWTBq?=
 =?utf-8?B?UGFLeGsxZGs5ZDlYdXhJa1JtMzNrV3VzQXk2cE40SmszYkV2eEFWdmNmSTF1?=
 =?utf-8?B?MjR0cnpFemdCSHRWdU91b0w5VlQwZkhjcXZUbjNyTkRQTjg0bjdYeS8wWkZO?=
 =?utf-8?B?aUhzWGlBclJ6NlR2aDEySmhUQTQrdllVT2YzNWF5Ris2WXBVODJia3pBR1hl?=
 =?utf-8?B?bnBMUzNtZlBaWkxNQkloWEVyeFBSdFAyNTBKQklGVE9tajRYeHM3RUMzZlFY?=
 =?utf-8?B?dnFuWWQ3M0dCbS91OEdnMzVKR0N5VGhzY0V5S0RFNE5qTmtkSUpWRWExUHdj?=
 =?utf-8?B?MysvdFp3RWl0TnhTSzlySXNXV2c1YjNyMFQvTFlhcDdhdTdDNm5MTExVd1dV?=
 =?utf-8?B?cHhhTVRmaTU5UmdBSjdPUVFnRGFRWU03UUNVOVJWMmhkQjdPeEprdG1HYktH?=
 =?utf-8?B?bktjT1ZxQjFqZmdrUzUyOHpVR0ZlQzlVSkxNZUJ0WUxJeHB4cXdHVkN0emlP?=
 =?utf-8?B?TkEzaUJRRnM2QlA4L0V3ZGVVVGNuUkY1SUIzWXZ3MHhlTjgvMXNIRkUxMmR5?=
 =?utf-8?B?eDZZcnJybVkzQ0VBcjBHb0hzMTRpYi9MRUxDNUhnM29nR2dyeEJhNDNYTUhh?=
 =?utf-8?B?eG9QVTNWUEFPUE41UVZPc0Z5N0JXcDd6eEt5QXVoanZtQzBoZEJrdDJDTldC?=
 =?utf-8?B?SXVWUy9tcGhWOGtJNGMvOVdMeXlKemVhRDZCVmhqZEk2U2czREo3bmp0czRF?=
 =?utf-8?Q?cy+I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F7DEA5FB5B5544D9091BE68FD21122C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f789970-0eab-49d9-d350-08dc8f5f72b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 06:25:28.8866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHYz98x98tnGdrTL7M7zN7Cc6rYQhHA712gWdIANzHZHMIWo1nqySxdVddIuIYPQMhd88mAaqHPGrBi9jdUKPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6144

T24gMjAyNC82LzE3IDIyOjE3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDYuMjAyNCAx
MTowMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvcGh5c2Rl
di5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+PiBAQCAtMiwxMSArMiwx
NyBAQA0KPj4gICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+DQo+PiAgI2luY2x1ZGUgPHhl
bi9oeXBlcmNhbGwuaD4NCj4+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4+ICsjaW5jbHVkZSA8
eGVuL3ZwY2kuaD4NCj4+ICANCj4+ICAjaWZuZGVmIENPTVBBVA0KPj4gIHR5cGVkZWYgbG9uZyBy
ZXRfdDsNCj4+ICAjZW5kaWYNCj4+ICANCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZp
Y2Vfc3RhdGVfcmVzZXRfbWV0aG9kDQo+PiArICAgICAgICAgICAgICAgICAgICBwY2lfZGV2aWNl
X3N0YXRlX3Jlc2V0X21ldGhvZHNbXSA9IHsNCj4+ICsgICAgWyBERVZJQ0VfUkVTRVRfRkxSIF0u
cmVzZXRfZm4gPSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSwNCj4+ICt9Ow0KPiANCj4gV2hhdCBh
Ym91dCB0aGUgb3RoZXIgdGhyZWUgREVWSUNFX1JFU0VUXyo/IEluIHBhcnRpY3VsYXIgLi4uDQpJ
IGRvbid0IGtub3cgaG93IHRvIGltcGxlbWVudCB0aGUgb3RoZXIgdGhyZWUgdHlwZXMgb2YgcmVz
ZXQuDQpUaGlzIGlzIGEgZGVzaWduIGZvcm0gc28gdGhhdCBjb3JyZXNwb25kaW5nIHByb2Nlc3Np
bmcgZnVuY3Rpb25zIGNhbiBiZSBhZGRlZCBsYXRlciBpZiBuZWNlc3NhcnkuIERvIEkgbmVlZCB0
byBzZXQgdGhlbSB0byBOVUxMIHBvaW50ZXJzIGluIHRoaXMgYXJyYXk/DQpEb2VzIHRoaXMgZm9y
bSBjb25mb3JtIHRvIHlvdXIgcHJldmlvdXMgc3VnZ2VzdGlvbiBvZiB1c2luZyBvbmx5IG9uZSBo
eXBlcmNhbGwgdG8gaGFuZGxlIGFsbCB0eXBlcyBvZiByZXNldHM/DQoNCj4gDQo+PiBAQCAtNjcs
NiArNzMsNDMgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0K
Pj4gKyAgICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0OiB7DQo+PiArICAg
ICAgICBzdHJ1Y3QgcGNpX2RldmljZV9zdGF0ZV9yZXNldCBkZXZfcmVzZXQ7DQo+PiArICAgICAg
ICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlICpkZXY7DQo+PiArICAgICAgICBzdHJ1Y3QgcGNp
X2RldiAqcGRldjsNCj4+ICsgICAgICAgIHBjaV9zYmRmX3Qgc2JkZjsNCj4+ICsNCj4+ICsgICAg
ICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgKQ0KPj4gKyAgICAgICAgICAg
IHJldHVybiAtRU9QTk9UU1VQUDsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IC1FRkFVTFQ7DQo+
PiArICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgmZGV2X3Jlc2V0LCBhcmcsIDEpICE9IDAg
KQ0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgZGV2ID0gJmRldl9yZXNldC5k
ZXY7DQo+PiArICAgICAgICBzYmRmID0gUENJX1NCREYoZGV2LT5zZWcsIGRldi0+YnVzLCBkZXYt
PmRldmZuKTsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IHhzbV9yZXNvdXJjZV9zZXR1cF9wY2ko
WFNNX1BSSVYsIHNiZGYuc2JkZik7DQo+PiArICAgICAgICBpZiAoIHJldCApDQo+PiArICAgICAg
ICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAgICBwY2lkZXZzX2xvY2soKTsNCj4+ICsgICAg
ICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXYoTlVMTCwgc2JkZik7DQo+PiArICAgICAgICBpZiAoICFw
ZGV2ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0K
Pj4gKyAgICAgICAgICAgIHJldCA9IC1FTk9ERVY7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+
PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4t
PnBjaV9sb2NrKTsNCj4+ICsgICAgICAgIHBjaWRldnNfdW5sb2NrKCk7DQo+PiArICAgICAgICBy
ZXQgPSBwY2lfZGV2aWNlX3N0YXRlX3Jlc2V0X21ldGhvZHNbZGV2X3Jlc2V0LnJlc2V0X3R5cGVd
LnJlc2V0X2ZuKHBkZXYpOw0KPiANCj4gLi4uIHlvdSdyZSBzZXR0aW5nIHRoaXMgdXAgZm9yIGNh
bGxpbmcgTlVMTC4gSW4gZmFjdCB0aGVyZSdzIGFsc28gbm8gYm91bmRzDQo+IGNoZWNrIGZvciB0
aGUgYXJyYXkgaW5kZXguDQpPaCwgcmlnaHQuIEkgd2lsbCBhZGQgY2hlY2tzIG5leHQgdmVyc2lv
bi4NCg0KPiANCj4gQWxzbywgbml0IChmdXJ0aGVyIHVwKTogT3BlbmluZyBmaWd1cmUgYnJhY2Vz
IGZvciBhIG5ldyBzY29wZSBnbyBvbnRvIHRoZWlyDQpPSywgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2
ZXJzaW9uLg0KPiBvd24gbGluZS4gVGhlbiBhZ2FpbiBJIG5vdGljZSB0aGF0IGFwcGFyZW5seSBf
YWxsXyBvdGhlciBpbnN0YW5jZXMgaW4gdGhpcw0KPiBmaWxlIGFyZSBkb2luZyBpdCB0aGUgd3Jv
bmcgd2F5LCB0b28uDQpEbyBJIG5lZWQgdG8gY2hhbmdlIHRoZW0gaW4gdGhpcyBwYXRjaD8NCj4g
DQo+IEZpbmFsbHksIGlzIHRoZSAiZGV2IiBsb2NhbCB2YXJpYWJsZSByZWFsbHkgbmVlZGVkPyBJ
dCBlZmZlY3RpdmVseSBoaWRlcyB0aGF0DQo+IFBDSV9TQkRGKCkgaXMgaW52b2tlZCBvbiB0aGUg
aHlwZXJjYWxsIGFyZ3VtZW50cy4NCldpbGwgcmVtb3ZlICJkZXYiIGluIG5leHQgdmVyc2lvbi4N
Cj4gDQo+PiArICAgICAgICB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+cGNpX2xvY2spOw0K
Pj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJS
ICIlcHA6IGZhaWxlZCB0byByZXNldCB2UENJIGRldmljZSBzdGF0ZVxuIiwgJnNiZGYpOw0KPiAN
Cj4gTWF5YmUgZG93bmdyYWRlIHRvIGRwcmludGsoKT8gVGhlIGNhbGxlciBvdWdodCB0byBoYW5k
bGUgdGhlIGVycm9yIGFueXdheS4NCldpbGwgZG93bmdyYWRlIGluIG5leHQgdmVyc2lvbi4NCj4g
DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMNCj4+IEBAIC0xNzIsNiArMTcyLDE1IEBAIGludCB2cGNpX2Fzc2lnbl9kZXZp
Y2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgDQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9
DQo+PiArDQo+PiAraW50IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPiANCj4gQXMgYSB0YXJnZXQgb2YgYW4gaW5kaXJlY3QgY2FsbCB0aGlzIG5lZWRzIHRv
IGJlIGFubm90YXRlZCBjZl9jaGVjayAoYm90aA0KPiBoZXJlIGFuZCBpbiB0aGUgZGVjbGFyYXRp
b24sIHVubGlrZSBfX211c3RfY2hlY2ssIHdoaWNoIGlzIHN1ZmZpY2llbnQgdG8NCj4gaGF2ZSBv
biBqdXN0IHRoZSBkZWNsYXJhdGlvbikuDQpPSywgd2lsbCBhZGQgY2ZfY2hlY2sgaW4gbmV4dCB2
ZXJzaW9uLg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL3BjaS5oDQo+PiBAQCAtMTU2LDYgKzE1NiwyMiBAQCBzdHJ1Y3QgcGNpX2Rl
diB7DQo+PiAgICAgIHN0cnVjdCB2cGNpICp2cGNpOw0KPj4gIH07DQo+PiAgDQo+PiArc3RydWN0
IHBjaV9kZXZpY2Vfc3RhdGVfcmVzZXRfbWV0aG9kIHsNCj4+ICsgICAgaW50ICgqcmVzZXRfZm4p
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICt9Ow0KPj4gKw0KPj4gK2VudW0gcGNpX2Rldmlj
ZV9zdGF0ZV9yZXNldF90eXBlIHsNCj4+ICsgICAgREVWSUNFX1JFU0VUX0ZMUiwNCj4+ICsgICAg
REVWSUNFX1JFU0VUX0NPTEQsDQo+PiArICAgIERFVklDRV9SRVNFVF9XQVJNLA0KPj4gKyAgICBE
RVZJQ0VfUkVTRVRfSE9ULA0KPj4gK307DQo+PiArDQo+PiArc3RydWN0IHBjaV9kZXZpY2Vfc3Rh
dGVfcmVzZXQgew0KPj4gKyAgICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIGRldjsNCj4+ICsg
ICAgZW51bSBwY2lfZGV2aWNlX3N0YXRlX3Jlc2V0X3R5cGUgcmVzZXRfdHlwZTsNCj4+ICt9Ow0K
PiANCj4gVGhpcyBpcyB0aGUgc3RydWN0IHRvIHVzZSBhcyBoeXBlcmNhbGwgYXJndW1lbnQuIEhv
dyBjYW4gaXQgbGl2ZSBvdXRzaWRlIG9mDQo+IGFueSBwdWJsaWMgaGVhZGVyPyBBbHNvLCB3aGVu
IG1vdmluZyBpdCB0aGVyZSwgYmV3YXJlIHRoYXQgeW91IHNob3VsZCBub3QNCj4gdXNlIGVudW0t
cyB0aGVyZS4gT25seSBoYW5kbGVzIGFuZCBmaXhlZC13aWR0aCB0eXBlcyBhcmUgcGVybWl0dGVk
LnQNClllcywgSSBwdXQgdGhlbSB0aGVyZSBiZWZvcmUsIGJ1dCBlbnVtIGlzIG5vdCBwZXJtaXR0
ZWQuDQpUaGVuLCBkbyB5b3UgaGF2ZSBvdGhlciBzdWdnZXN0ZWQgdHlwZSB0byB1c2UgdG8gZGlz
dGluZ3Vpc2ggZGlmZmVyZW50IHR5cGVzIG9mIHJlc2V0cywgYmVjYXVzZSBlbnVtIGNhbid0IHdv
cmsgaW4gdGhlIHB1YmxpYyBoZWFkZXI/DQoNCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
dnBjaS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBAQCAtMzgsNiArMzgs
NyBAQCBpbnQgX19tdXN0X2NoZWNrIHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3QgcGNpX2RldiAq
cGRldik7DQo+PiAgDQo+PiAgLyogUmVtb3ZlIGFsbCBoYW5kbGVycyBhbmQgZnJlZSB2cGNpIHJl
bGF0ZWQgc3RydWN0dXJlcy4gKi8NCj4+ICB2b2lkIHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KTsNCj4+ICtpbnQgX19tdXN0X2NoZWNrIHZwY2lfcmVzZXRfZGV2aWNl
X3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4gDQo+IFdoYXQncyB0aGUgcHVycG9zZSBv
ZiB0aGlzIF9fbXVzdF9jaGVjaywgd2hlbiB0aGUgc29sZSBjYWxsZXIgaXMgY2FsbGluZw0KPiB0
aGlzIHRocm91Z2ggYSBmdW5jdGlvbiBwb2ludGVyLCB3aGljaCBpc24ndCBzaW1pbGFybHkgYW5u
b3RhdGVkPw0KVGhpcyBpcyB3aGF0IEkgYWRkZWQgYmVmb3JlIGludHJvZHVjaW5nIGZ1bmN0aW9u
IHBvaW50ZXJzLCBidXQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBpbXBsZW1lbnRhdGlvbiwgaXQgd2Fz
IG5vdCB0YWtlbiBpbnRvIGFjY291bnQuDQpJIHdpbGwgcmVtb3ZlIF9fbXVzdF9jaGVjayBhbmQg
Y2hhbmdlIHRvIGNmX2NoZWNrLCBhY2NvcmRpbmcgdG8geW91ciBhYm92ZSBjb21tZW50Lg0KDQo+
IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

