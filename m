Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58279F45F3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:22:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858569.1270825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNSqh-0004VE-0h; Tue, 17 Dec 2024 08:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858569.1270825; Tue, 17 Dec 2024 08:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNSqg-0004Sz-UL; Tue, 17 Dec 2024 08:22:34 +0000
Received: by outflank-mailman (input) for mailman id 858569;
 Tue, 17 Dec 2024 08:22:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8UP=TK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tNSqf-0004St-Ao
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:22:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2418::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f63ddd0-bc50-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 09:22:32 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 08:22:29 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:22:29 +0000
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
X-Inumbo-ID: 0f63ddd0-bc50-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEB6SryH+RncRkUaEnKjLLukZy/D/iOWnbCxmuIV0+eIRtw9hltf9sKX/FkEiPb5W82H+cLwTVQoq4asFFbLI/S/kzgEiBuuOlnzi2nEMnFdn08jlEaPJmOr/K6J2t1DBBCGp5oMUqvyQN1SrbW2mXN4RJ5Mg6iSpXIyXUwQWEdlM1xCzKnb90GpkGA7YSkCeNtBlSdUHeif259gdkLMs84Xv1A/Uea1Wmpw/6L0qcZ/8aAq2W+DH/1y0eOuSCW9K68Gmy9+nA8phBw+L4VF2Zl7Q+Rv13ZU5X+M6L+wW0lSv9qhONHYAWVceFvfVAF3I35/wkoLOWgnNPKLg5iVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwVHidIimuTaiqlUBVJb3ndRK3bVXYzMoj55zuU/1UM=;
 b=FYVFbqsdPDZ2SBLb25d2+KWdua3ZjrBrGApdKB/OusHVvIME/t1or/bj5MfQaw8pG+8NUOc8p68E787zj4SDKrA853X+L/DisBjti06iThIPcjrefBDbSXtQIQat5yFIdjMbMY/BfXnEwGDxgJ95QU655HxJC8HccO0lBXB/zUt+2M10DsWHCHsQSZDh9LzlUINLBqaPwtIDJF0jHThAsy9Qdfd6C1JJ2VRg9sWr7/vFa4EGfCEjbqU4QI/LoBHR9Yyx2lg7vmwnvkMzcE+oqzJKA6KreXmW6QXh3VzLRK6IG1em+nUPnl+V+T4ysrxs7tCXs6GEadkmgRmVvOp74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwVHidIimuTaiqlUBVJb3ndRK3bVXYzMoj55zuU/1UM=;
 b=ZciHpY5Gk+zDdhTKKC4qD/QXEzXYyfg4uz+Ac8GL2QRJ4KG/2QLZ33x/iXEy7d5Emp4VW8g0qJ21rMVgztJ/UbvFvlafcNHTx+krYj6MvK4h36/cSuSa6I0JrqvxByk/ONergAA7XI3IplRsX/W2wiyVOuyqsYwAXtMPWv2HlgU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] vpci: Add resizable bar support
Thread-Topic: [PATCH v3] vpci: Add resizable bar support
Thread-Index: AQHbTSHk/+a4JH45i0iSPkOFUem08bLov7+AgAHlKwA=
Date: Tue, 17 Dec 2024 08:22:28 +0000
Message-ID:
 <BL1PR12MB5849A5497B2C72283B8143D6E7042@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
 <0f75fcd2-6c5d-4be6-9fc9-3c7b6c10ae51@suse.com>
In-Reply-To: <0f75fcd2-6c5d-4be6-9fc9-3c7b6c10ae51@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8251.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB9447:EE_
x-ms-office365-filtering-correlation-id: 03b6f623-6947-4896-9e80-08dd1e73f22c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?T3pNSzBNNnQxM0tvNzRzenJoTUFzdjVWaFNobzdTRzRRei8xc2F5MnYzcDNW?=
 =?utf-8?B?YXMzemp2bHJZOEYwcFlnZXpBQjNEdnV4enZZejFEOXBaTGROazA0eHI0ZWlj?=
 =?utf-8?B?V1prbEVlQU5ZbXNLTkVsV0lKejVWeG1yWHJkQW5UMDFwYXJOOHBsOGl3ZnRn?=
 =?utf-8?B?eDRabnh2OEV6QmV5bWd5eUVNaEdkQzBSdXBGVnYxemJHbVV5bUJ0TzI1SjVw?=
 =?utf-8?B?N1NKcHZIRklOWlpnNGlLUkJYMy93S1Q1WUFxSUdaaGxnblNZSDRxQTk5c0x3?=
 =?utf-8?B?NGJ5c2g5RjdnWmtwOFNkTy9LRmRoaytySlJnWXA5Y3pIbjlHMTE1Wk5lNlJx?=
 =?utf-8?B?Z2RhaENPbHQyMjJDQnNkSFUyN3RsMHBLUGU0bUNwZWhud2RscklLZW9yL0hC?=
 =?utf-8?B?SDNsSmx1Lzlnd3RIa1BpV3BaQXFUTVFaL1d4c3Ayc1l3NDlSSWJGNDczWEM3?=
 =?utf-8?B?KytreEl4TW5vNzllWVY2djlyNmpQNHBNdUdpeWdrVGZIdWpSYUs1K3RvOG5j?=
 =?utf-8?B?ank0dlhRWnR0UVZqLzF5bW03S1NhbW9Rb2JJZDFXZjlYZFFyWGxhU09paFYv?=
 =?utf-8?B?eDJ3OERrMnBXVGFTU3hWN0RXVGVRSXVSSUpyZThud05SVVc4eEF6SlYwRXBP?=
 =?utf-8?B?UGg0YzluWTlncWs5bTNoZDNRV01Wd3o4SDF6SWM3T3kyMGJXaExUUjkxbWt3?=
 =?utf-8?B?MWZKVmF0T3J2WnBNWmdham0wZmZvZ2dFRlpmbTJ1ckxTUGNqSmlqanlDQmp5?=
 =?utf-8?B?SHhTcDRsZm9ST1VDdno3dzJuaXlaT0E2VDBnZmhNRkdNZVYrWXJSS3pOa1RT?=
 =?utf-8?B?elFhZW5aWW16bTZiaEJGelZ5cTdSUmlKTTBlalVvUVR0cFhYaHcyQmlrU1Fi?=
 =?utf-8?B?ZnpIcnZYclRvamRVeWRjRnJLM2wxTE00MDhVOUpoN0t1Y014Sk1VRmNJcGtk?=
 =?utf-8?B?MzhSQVl3aCtNa21RMDFrZkpOUVQ0cWJLRmoyVkVrL1NpU2JweUdLVXFlVkh0?=
 =?utf-8?B?VE9CMUxIdUlKcEFja21ZSEJ3ek9NNFFJK0NjRHFnY08xQXgxNmI5V1ovTXNn?=
 =?utf-8?B?NEFSTERwN09uL3Z1OUp4enZYb0I4RkxyNDcxVGd3VXlBbDFCN0svcXhDU3ZG?=
 =?utf-8?B?QkpaMWh0NHlUbG9MODc4c25ONkdiV1l0WlV5eE42V0IyV044ejdTOWphMTQ2?=
 =?utf-8?B?S0I1SlNpeTdDd3V5OGRUUDBtbVg1YU1kQVBKUmhOaXBrUWdKbzFGVTlleldp?=
 =?utf-8?B?R3lBcGUzVnB3SGMrR0E3RlJ3VDkyQlRMUnp6SElIbXROYWw4WGE2eTNZUExk?=
 =?utf-8?B?QTk2ZXBZWTRWQU5nUkpyMGtWbk5VWHJiWFVNTEF3cnZ0TkVMK2xLeDNSVzdX?=
 =?utf-8?B?d2MrRCtlQ0hiMjdDRWFkZDFYaDFYdkVRSnJjS21SUnE1d0xPaVQ0T1RNN0lN?=
 =?utf-8?B?T2psRUxLZUVmekE1OGZlN2FKTWEzM00vaXE0NDJXZ0FzOFJKazNTb1drOHU1?=
 =?utf-8?B?dG5NOXcxbmVVMHBUVWowQURJM2d1YkU2citwZG9NUlJwZVBodkdoYXNHYWZZ?=
 =?utf-8?B?bUhRQzVqR0g4a2dxdGp5cGt0Wm9HTVcxeDlmaUpiekRYMFY0T1Y5TkYvM0Jn?=
 =?utf-8?B?WUNZM25DVFBONThiYTJpbGJzZWhIS3daL3YyS1ZYaFpDNVd5Z00zRDBqQnhj?=
 =?utf-8?B?NnNSRVFWZEg0RVdlaTVEemFrbFROSlcvY2lCWXBxRWZrcE4vSnd5SzRuSkhi?=
 =?utf-8?B?TVRES0VQL0djSUxMdVVSbW00aWg2QTNvcThFQkxRNUFvcHFrMWpOd3FpM3hY?=
 =?utf-8?B?Mk02S0NJZjBkdHJpdE5obHVKNHpBU0VTeldaQWR5eXpQVG5hdDBCMVlTMXkr?=
 =?utf-8?B?c05ZM1ZkRW4wb0NPdURNSHRBUnZTZUdFMkl3ZVF4WGwzRUVYY21KUTUrRVI0?=
 =?utf-8?Q?H/M4OH6No2Hy5yVCETWbCkByZjiLFWHQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3dsenhLNmh4N2lsR29hRGpHN2xuTnRmQjBJQk1QN3VMMHI0VUsxSGpjR2RV?=
 =?utf-8?B?WFpvRForU0ZVL2xwNDBZU2t2dUZLYVRFMm4rbFcwWlVuYm1lMitaOWRiYThv?=
 =?utf-8?B?YnV4cUNYcnhrdzVnUXVEZ2hFa2ZXS3JYN1duSnoxQ2IxVW9aZlZ6UzBoNU1I?=
 =?utf-8?B?TWRRQ3FVems1NERQSmo5QllyY3ZWdFhHai9abGRkcXAyOXRHYm9GeDFPbC9m?=
 =?utf-8?B?S01JdlZFL3doZDFQM3pPUWZyR0Y5eEc1b0xvVDFvdDhrUDJ5bjl4TVhHSVEr?=
 =?utf-8?B?WHMxdFMxRUJublhzQ3JvQ0hlRktxWU5lQjJHSWZxODNRUTNEcXA0UVNnU3hz?=
 =?utf-8?B?M2lEdnlycjBiT292ZWkxWHJJblAzL29UeG0yYVkrbmtpOE1YSFd0TFFCSGZ2?=
 =?utf-8?B?c3paQ3pxR3BzRERjL0ZVcU9xUU1tZFE5U0RmdERCeDBTMllIQUdXVjVHSWI0?=
 =?utf-8?B?ZEdIV0Q4bHVIU1VkWnIyV0FOdXlkckJCSUZNZDFnbDFyMytIMVFoV1NuSXYx?=
 =?utf-8?B?MG5vS2l2Z0swYlpRQTI2Y041ZXhiYlFpV2RSS2lDSVVMYnphQ09jQnZIaytY?=
 =?utf-8?B?T3RrR2ovWVUyQkcyRkhiUGpGSFpSN093NERQLzJieDVqdzZaQW1TOEluTnFY?=
 =?utf-8?B?QVI2NlFoR1B5RVZMekRrZlk5djVmb0ZHWVcyY1F6dU4xMVRvVzZOZUd4Vkc1?=
 =?utf-8?B?KzJBTjRoaTN1UEV2S0xZR1d3VTN3SExwazlzaThXbWhya3RsWlhCek4vbWFQ?=
 =?utf-8?B?ck0yR2lwLzNHT2xkUU1Fdkc3MWMzZ3ZXcmJkTFJpTWU2ZFJYRTF3d21ROHVB?=
 =?utf-8?B?dGRuem9xdWJCQXpsdlgzRksvNE1QZVg1TGtQaHJTNzczcU1ZUC9KKzdDcmdN?=
 =?utf-8?B?ZEJiNDVHSHpYaEpkR28zRzdPQXl6a3VlazM5dy84Szk5TnkxQzdYanBNZGpn?=
 =?utf-8?B?UnBaOXRBU0d0Z2NyREVCaWIrY3Jmdjk4Zm9tbk13RVRtRzJrT1NSQ3dWSDhS?=
 =?utf-8?B?MEFoOHFKNjBXbHFsWEJteFJQNGgrOHNjU3Z4NTVUdHhnNnZUMnlzTWFJQTdr?=
 =?utf-8?B?bC90SU1XWWNGVURDajF1TEs4WWM4R2VXU1FvUXhuZ2VhOUkxcFpUSXozT1Zz?=
 =?utf-8?B?ZkJ1S29XWmU5MG5iZ1ZhWnRLRDNaaXB2UnF6WlY2cUc2NTlGenV1NmJYcGsv?=
 =?utf-8?B?endjTkpwbjJEZk5GZWRPaTE3cDUvMGtmaTVEL2tJdVZwT0VYRnViUXQrWE1J?=
 =?utf-8?B?VGk4cTI4RFN4ZksrcmFGeDZUL0RybENkRXRhd0lud3V6c1NhN2NITUpscUtR?=
 =?utf-8?B?Vm5OVHo4ZllBWFNZVWlpakR3Q3dlMFlINzd1QytIYVc2bkJBMllkVnRYcS9t?=
 =?utf-8?B?NXFUeUgzRHJkOVFvZnZSczRNZEVlQmxUQjBLTGdDdTJtWFhJa3p1V3U0eXJR?=
 =?utf-8?B?UnhoL3FEdnphSGFZSWprWmo4REpYbDZMWEI2N1lrVnI3c0JTb2R4NllTWU81?=
 =?utf-8?B?MEQzcS9LdnpaVVhDbFV1Q2RmUDBKaVk2MEhpNnpmT2dycm03ajZOaGtteDVp?=
 =?utf-8?B?S1ZveEdId0M2bk0rS3F6N2h2OFNDZjlNTWhDTHNZWjJQUUxycjBPbXpGMGhC?=
 =?utf-8?B?S2ZzY0IrdEJpa05kN1VKWEF5eTFFQTAvVWRlcjhrdTgvY1lYYkdxbjBrMW5C?=
 =?utf-8?B?WEFxRDZnK202eFlZZVNyRXBaVDllTE9sWXV1QjRtaVh4Y2lLbm4yYVNpLzVR?=
 =?utf-8?B?MHVaK1YvSjA2NG1wZjdPaDVxVExMNUU5dThmaEt6QjhyaWplMFcwMXVMMjU3?=
 =?utf-8?B?cEFLdll0V1l5RlVQTUpEZWliR1MyVXR2ZzVqc2tGcWZSNWlwK3BpRmx3SEhy?=
 =?utf-8?B?NEFOUjVnQjUxY2dCbGlibEt3N1ppejBGcGwzdlVWSXcwUlU3b1RMUUk1ZVdU?=
 =?utf-8?B?dFY3RVo4c0xXVkU5Nitxd05KK3NMZTV3K2JjVmx6NHp6WThzaGFDZzlQaGov?=
 =?utf-8?B?N29TNVJnNVplTVQ3NWlpMXQrMVhveEpaWXFhWFY0NW4yS0hHaUJuSFVqYXdN?=
 =?utf-8?B?bkN6dHJQY3pmejh3TmJvM21oc0l1TSs2Rnd1T1ZMcGc4QXg2bzkvdS93S0My?=
 =?utf-8?Q?XdXI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <332D272B3600394CA777C39787847E52@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b6f623-6947-4896-9e80-08dd1e73f22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 08:22:28.8973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSKaRQpB9/9UHp8eJz1XXbx8Ni3VOp7yh8kk5VkUtCGXUF3bfyWhTK4swCKaTURixfeaHgcO4Mqbt+bCQd33yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

T24gMjAyNC8xMi8xNiAxOToyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjEyLjIwMjQg
MDY6NDIsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVu
L2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiBAQCAtMCwwICsxLDEzMCBAQA0KPj4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+ICsvKg0KPj4gKyAqIENvcHly
aWdodCAoQykgMjAyNCBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQuDQo+PiArICoNCj4+ICsgKiBBdXRob3I6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBh
bWQuY29tPg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+DQo+
PiArI2luY2x1ZGUgPHhlbi92cGNpLmg+DQo+PiArDQo+PiArc3RhdGljIHZvaWQgY2ZfY2hlY2sg
cmViYXJfY3RybF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZWcsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4gK3sNCj4+
ICsgICAgdWludDY0X3Qgc2l6ZTsNCj4+ICsgICAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSBkYXRh
Ow0KPj4gKw0KPj4gKyAgICBzaXplID0gUENJX1JFQkFSX0NUUkxfU0laRSh2YWwpOw0KPj4gKyAg
ICBpZiAoIGJhci0+ZW5hYmxlZCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggc2l6ZSA9
PSBiYXItPnNpemUgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybjsNCj4+ICsNCj4+ICsgICAgICAg
IC8qDQo+PiArICAgICAgICAqIFJlZnVzZSB0byByZXNpemUgYSBCQVIgd2hpbGUgbWVtb3J5IGRl
Y29kaW5nIGlzIGVuYWJsZWQsIGFzDQo+PiArICAgICAgICAqIG90aGVyd2lzZSB0aGUgc2l6ZSBv
ZiB0aGUgbWFwcGVkIHJlZ2lvbiBpbiB0aGUgcDJtIHdvdWxkIGJlY29tZQ0KPj4gKyAgICAgICAg
KiBzdGFsZSB3aXRoIHRoZSBuZXdseSBzZXQgQkFSIHNpemUsIGFuZCB0aGUgcG9zaXRpb24gb2Yg
dGhlIEJBUg0KPj4gKyAgICAgICAgKiB3b3VsZCBiZSByZXNldCB0byB1bmRlZmluZWQuICBOb3Rl
IHRoZSBQQ0llIHNwZWNpZmljYXRpb24gYWxzbw0KPj4gKyAgICAgICAgKiBmb3JiaWRzIHJlc2l6
aW5nIGEgQkFSIHdpdGggbWVtb3J5IGRlY29kaW5nIGVuYWJsZWQuDQo+PiArICAgICAgICAqLw0K
Pj4gKyAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLA0KPj4gKyAgICAgICAgICAgICAgICAiJXBw
OiByZWZ1c2UgdG8gcmVzaXplIEJBUiB3aXRoIG1lbW9yeSBkZWNvZGluZyBlbmFibGVkXG4iLA0K
Pj4gKyAgICAgICAgICAgICAgICAmcGRldi0+c2JkZik7DQo+PiArICAgICAgICByZXR1cm47DQo+
PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCAhKChzaXplID4+IFBDSV9SRUJBUl9TSVpFX0JJ
QVMpICYNCj4+ICsgICAgICAgICAgIE1BU0tfRVhUUihwY2lfY29uZl9yZWFkMzIocGRldi0+c2Jk
ZiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnIC0gUENJX1JF
QkFSX0NUUkwgKyBQQ0lfUkVCQVJfQ0FQKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUENJX1JFQkFSX0NBUF9TSVpFUykpICkNCj4+ICsgICAgICAgIGdwcmludGso
WEVOTE9HX1dBUk5JTkcsDQo+PiArICAgICAgICAgICAgICAgICIlcHA6IG5ldyBzaXplICUjbHgg
aXMgbm90IHN1cHBvcnRlZCBieSBoYXJkd2FyZVxuIiwNCj4+ICsgICAgICAgICAgICAgICAgJnBk
ZXYtPnNiZGYsIHNpemUpOw0KPiANCj4gVGhpcyBvbmx5IGNvdmVycyB0aGUgMU1iIC4uLiAxMjhU
YiByYW5nZS4gV2hhdCBhYm91dCB0aGUgMjU2VGIgLi4uIDhFYiBvbmU/DQpUaGFuayB5b3UgZm9y
IHJlbWluZGluZyBtZSENCkkgd2lsbCBjb25zaWRlciB0aGF0IGluIG5leHQgdmVyc2lvbi4NCg0K
PiANCj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGluaXRfcmViYXIoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+PiArew0KPj4gKyAgICB1aW50MzJfdCBjdHJsOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQg
cmViYXJfb2Zmc2V0LCBuYmFyczsNCj4+ICsNCj4+ICsgICAgcmViYXJfb2Zmc2V0ID0gcGNpX2Zp
bmRfZXh0X2NhcGFiaWxpdHkocGRldi0+c2JkZiwgUENJX0VYVF9DQVBfSURfUkVCQVIpOw0KPj4g
Kw0KPj4gKyAgICBpZiAoICFyZWJhcl9vZmZzZXQgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+
PiArDQo+PiArICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4+
ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKCJSZUJhciBpcyBub3Qgc3VwcG9ydGVkIGZvciBk
b21Vc1xuIik7DQo+PiArICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiArICAgIH0NCj4+
ICsNCj4+ICsgICAgY3RybCA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWJhcl9vZmZz
ZXQgKyBQQ0lfUkVCQVJfQ1RSTCk7DQo+PiArICAgIG5iYXJzID0gTUFTS19FWFRSKGN0cmwsIFBD
SV9SRUJBUl9DVFJMX05CQVJfTUFTSyk7DQo+PiArDQo+PiArICAgIGZvciAoIHVuc2lnbmVkIGlu
dCBpID0gMDsgaSA8IG5iYXJzOyBpKyssIHJlYmFyX29mZnNldCArPSBQQ0lfUkVCQVJfQ1RSTCAp
DQo+IA0KPiBQQ0lfUkVCQVJfQ1RSTCBpcyBhbiBvZmZzZXQ7IGl0IGNhbid0IGJlIHVzZWQgdG8g
YnVtcCByZWJhcl9vZmZzZXQgaGVyZS4NCj4gVGhhdCdsbCBuZWVkIGEgc2VwYXJhdGUgY29uc3Rh
bnQsIGV2ZW4gaWYgYm90aCBldmFsdWF0ZSB0byA4Lg0KSSB3aWxsIGFkZCBhIG5ldyBtYWNybyB0
byByZXByZXNlbnQgdGhlICc4JyBpbiByZWJhci5jDQpNYXliZSBJIGNhbiBuYW1lIGl0ICJQQ0lf
UkVCQVJfU0lOR0xFX0JBUl9MRU4iID8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=

