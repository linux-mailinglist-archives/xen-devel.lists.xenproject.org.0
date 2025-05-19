Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E179ABB655
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 09:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989598.1373614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGv7d-0006yu-A4; Mon, 19 May 2025 07:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989598.1373614; Mon, 19 May 2025 07:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGv7d-0006xT-6Z; Mon, 19 May 2025 07:41:17 +0000
Received: by outflank-mailman (input) for mailman id 989598;
 Mon, 19 May 2025 07:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGv7c-0006xN-MC
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 07:41:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ab2848-3484-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 09:41:14 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 07:41:10 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:41:10 +0000
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
X-Inumbo-ID: a3ab2848-3484-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgCuqzLzfI71uVBvBe/C3c8g3mRI3Gmdhck+yiPl6OcF+5XKstzepNxzHWIMgr2V+bQl/Hu7HKZpP/V9acNhGNl/GHdlirEfaibaZNm5ZyXnERX9PE62/Z/fQQV2FUaI0AWhWfH3LVXvCL9oL3IKy8fHGVnkOCQxOePATgm2/Z+itDJEG3PcH9TFbVKnbGIaVRMp/9me7Tcoznl6gq79PkXkL0F7Nbz04UXDkWfSNe2Sj+sIfxqSBq+ADq7N3VD81VcCkLWVZDkQX20NH9I//z8Uw0UyZ367rdpeVqiuYK+Lou7gDuHTQIl2WYGSB0SNOPoGO24jpeUhfI7U6WeJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YvWkgvAQk4fOVetIis6HCc0GmeSw9LWJX9vxqlPUcA=;
 b=Xn6tP6xFlvXoCViYtUjUtqdu5x8A5iij+O76nfGwiRZRg5UJ691PtiMEePcJ2MbwrlaFhmoW8al+PSEVIG6N4U483cHhfXFYMVOgMRbjIhhAoKvhLyBGUhabhbiU6gIn0LG3dxViPfk/1yv4EUSZaAP3Rp87bC5QCQA7iZ/kAsLy5GFE495pHQQrLgWqhERWBZuXxMisasDcGeQZKN2jJjq9P7e36EleYIYWtfHq2JW38Fm24AN2syVDUpx9FlTIdzqLGMYGl+wZtRa2xbUvjcAC+Ewi3SLsQVa9jNMITPfhTIpXNslwl8ahFc6ZUL0gy270CANR6UCiPnqY4msGyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YvWkgvAQk4fOVetIis6HCc0GmeSw9LWJX9vxqlPUcA=;
 b=vwtbgmQVH63UoCq3EfSoD2usddYTIs/89PXkbDfcZrbxvoM7oIzhhdzBEnt1qjnopBRYE9lEGZhHDyN3Jm5xXB50m0D6ZB9Rd2z95she0exfyBPOt0bpoCwdh0Ogd1pII/jPFqR5+at5Mqomi0FP3rA+ZoNLMuJSqdOiRb2BFjw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 06/10] vpci: Hide extended capability when it fails to
 initialize
Thread-Topic: [PATCH v4 06/10] vpci: Hide extended capability when it fails to
 initialize
Thread-Index: AQHbwMGh3aKmZdUzDUy0XNAaOb3iFbPYhg4AgAGguoA=
Date: Mon, 19 May 2025 07:41:10 +0000
Message-ID:
 <BL1PR12MB58494E5187A483E992930AE5E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-7-Jiqian.Chen@amd.com>
 <48c71b8b-2b59-41aa-ad02-b237d53f1d6d@suse.com>
In-Reply-To: <48c71b8b-2b59-41aa-ad02-b237d53f1d6d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV8PR12MB9620:EE_
x-ms-office365-filtering-correlation-id: da5ded58-e33e-4ad4-3874-08dd96a8862c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SkowODhiaThSZGduemFCdTJBcWwwQ0xwMnY2WVdTMitweHVQRGJ4OHdIdmhr?=
 =?utf-8?B?OUxpS2hHSGk3OFh0QVRYa1Y1OVB0MEM1MnlGemljbC9JYTQ4YTdNdk0vWkd2?=
 =?utf-8?B?VkpKd3hOSll2OW02YjNXUFdtSVFlTm9lcU5na0h1ajViVS9YTEZBNHByMnVs?=
 =?utf-8?B?UzBSdjVkZU1Od0d4RnZ4MnNvdFVSTEZTTm13dHZoMlo0THlyQzdhSjNnSjhJ?=
 =?utf-8?B?MmVabCtCTzV6Y2l5ZkxBaVhxMTJndEwvY2xYN2kwN0JYa0xVWmR4OTdLWXNQ?=
 =?utf-8?B?aW84ejh6VHVzZnBjTzFqSncvREQrMExvQXZTWnJBQ1c2UVpPVjdGZ0VMa0s3?=
 =?utf-8?B?R2RhSTJHUlZtMDZxUE9SNVdJWXFNT1dCWjVKUTFQQXE4VVpmTVJ1d0V2K29I?=
 =?utf-8?B?OFg1MjBCK3VXQjV2UkQwVUdLaDVLY0FzUGoxdVRCZmV3Mk9ueGVxaVpzR3pN?=
 =?utf-8?B?N2xuOEdWOXV2VHFxQ2hjL1RxR01mVVBtYk5BVG1PbjcrbHVlaUJjOWx0WVow?=
 =?utf-8?B?WVNSbVpLVE1CUEZsbE93SlU0UUJ2U0liUVI5NGI1amhGNW14cGswMTlFYzIx?=
 =?utf-8?B?RmpnY2g3Qldoc21QUEdXTllzMmVlNWt6R1hCckd0ajRaeXVuUjdsNWs3S3Qw?=
 =?utf-8?B?VXh0eStndnhwZkJDYk1Qbk5DZXBDNjdsbVdPbWdwWkQrVGNSVkUyYjNZM1R1?=
 =?utf-8?B?ZWRNTmdKM1BlcHZxMDFUY1VQUXQ1TXp4ZWxleW5KVmE0bjZqa3J1dFRXMzNp?=
 =?utf-8?B?U3hJL2VFeXFRL0doeXBoanpuMmpYL0Q2TDEzQzlZRlBsOEJYbTk5M1VUbENF?=
 =?utf-8?B?YVdyb0xvaE4rQW5zUEZveW1DcGEzWkpwcDJQWnlNWkg4MHlEMXVPOFdDRGlU?=
 =?utf-8?B?K1RrbnZCZ0xqSmQzWllmaHhKSndGT1pVZEJKbk5UdjhmTFNwSS9zQ0x0aERI?=
 =?utf-8?B?RDF2QUl1QnUzQ0hnOGVlVmh0UnVjM2JDeklWNXg5dWEzVDJ5bk50NHNTNkp5?=
 =?utf-8?B?ZGYwclVTSnM3VTdSejMzdlRBemxoenRyZ3BNdVBIVnVHUUdWdTJVMzJMeSty?=
 =?utf-8?B?ZXNUTGY3UThHK3dWWmI3dVFUQkNXblhDMngzUmRkTHg5MXNNUi9KZ3FQUU02?=
 =?utf-8?B?MUhqUkFmcFhNWEFndDF6eWxFMXhlQnk1Qk9TWGlGU2FsTTBJZE1leGJGYk1U?=
 =?utf-8?B?ZjZEK2hBUmF4MFQxdS9URWVQVzFsVytUVWhVUGo2b3Z2TGtBYzZlOVdhNnJv?=
 =?utf-8?B?NTRKQld4NEVqeE5BZzVEc0dJQ3dSOTFXaHNGb1UxbmhudWQ2Zm9ZNXd2cTND?=
 =?utf-8?B?RHF4ekhkdTJnQ3BCcXMzYXpFSVJqS0V5cmZkUEhTYUdjZWlJeDdoSWlCMXJq?=
 =?utf-8?B?Umh6alFnV082YU9zakxMcGtjV1NEQmxibFdsWG5aelBTOUVKMkFyNmJMaW9r?=
 =?utf-8?B?ckVTTXpxMjR5b0JRRlNlWVF3VG45SEthYzl0d05MYmQ4WUxNbWt3ZUdaeUZK?=
 =?utf-8?B?NzdYblNTVnpBcFlYeC90SVk1OHFhWVZSaGtkUjNGaUZKeHpocmxjM25CSUI5?=
 =?utf-8?B?UThmNlBKdCtSVENtTzIvb0J2MmhQNFQwSnoyUUJHWE1pbnRDWWVzNXNNbEtK?=
 =?utf-8?B?ZVNLMjRMUjRVaTErcEZrQkJGdnlWRDllQThEdDlFNjZMbjJEZm5EdHhWL0tk?=
 =?utf-8?B?eDQwUHdFMHhXMThucWVjQlRaZVZ5cGgxbDE4aVFURXdKRCtkeXJIc2JSUUJO?=
 =?utf-8?B?Z0ZTSDdDRkxiYkx5UWlGV2xjbEJ6VWFTV0tublFpejNEYkQ3RGR3SWNwcTQ5?=
 =?utf-8?B?c3MvTzRVMTRWbkRSNTBsbHQzUm1iT3dSSWV6L20rYXVMUU54QmQ3UzkzbFk3?=
 =?utf-8?B?dUZvTDdVcDlTd3IwV0pyL2pYWXFEQ3VmTzZseEJad3VTdVdYWnp0VWw0K3VL?=
 =?utf-8?B?NFdjQkFhc1ZyeGtHbmJtWXZEelN5UDRwZlFpVTMvVnk4Nmt6eTltMmhlQi9i?=
 =?utf-8?Q?kP+Nn91SwzwB1txTSNH+tX3cwmY01M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEYxb1lxV1JLQkRLL1pwdk9PcTVlMFRwSVFONjlLaDM1SXNxK2U4N3AySVNo?=
 =?utf-8?B?bXZEWUQ0bzkzOXZIRkd4T3hBZGxmQStieXFidHN1M2dMZ1k4VkJ4MnRyR2th?=
 =?utf-8?B?QUh6dUV2WUZCbnltWXFNRXdWNkhXeTlvZGtHaCtLRk92OEFhdnVYVHpNWUtO?=
 =?utf-8?B?YldHTVo2bXZSaGVmeHBHZ1VJZFg3blBDT2kxcWVxejNCdFVLTEFuSGV1YlVO?=
 =?utf-8?B?cHpxb3hDb3I2SGprRW1Ub2V5dGJkSndDQ2VaSGYzUGF2RENTaG43ZnRmWkc3?=
 =?utf-8?B?K2JrQ2s4Rk0wNzNTZ2l4SnVYbCs3OXlrVlg5c3VVOTlGQ1UwTXRjMHd5MWVD?=
 =?utf-8?B?Wm5Hb0prd1R1bHlRSWptbVA2VlJFMVJQTElUbDhCM3hLQ1AxTDc4KzV1M09Q?=
 =?utf-8?B?QTBraGpzNU1TTDQrZW9HRHk4Uk5vTW5odnlsT3ZBSVdMRVdhMW40cy9kTjdS?=
 =?utf-8?B?QjJ2OGF2dGtxOXN6amV2QVpGVEJDRjYyaDZwZTJKQkU1YjBDWkhZYVp4Q0ls?=
 =?utf-8?B?SzAyVFRlckR6M292UzVFSkNlVEhsQWdoaXREdGlpdlo3ZkZnRjlDaUVNb1ZO?=
 =?utf-8?B?NVNYS0tGY0VoOHplQUVMeW9yMkdRcUxwOVN4NkR4Z0owNWVXUGNNMlNKY29o?=
 =?utf-8?B?d2k3L1NTUk9HWFVwclIyWUVkb2tBY2EvbS9ENlBNZmR3RlByUHp5bUtnaTNq?=
 =?utf-8?B?eEZzTGJreHBIQ3BkYTR1V2F4bi9ZUm1NeFJCSzhrYVpUUklyMVNWMkxhWnJp?=
 =?utf-8?B?Q2NmWndEbkdjMzdGY2grQjRKbDQ0eS9Iekp4ZXNXM1pUQ3JYc3N6Zk94MHo3?=
 =?utf-8?B?a2Z1VVhHTm9ybHBueG5WOTRaTFBCSjRRVk1MVU01dEJQL0hjeGZyakorL3px?=
 =?utf-8?B?UFVPZlBaMkU0NWtaTlJBWGRreTBiQlJweC9NTW8zVkFkc0FOa1VoNk9RWkNN?=
 =?utf-8?B?ZGZCUEdMeHkrbGJ3cXJRRHlHYU5BenlHYUVHdzZSNUQ0TzdhZjNLTnNOK2d3?=
 =?utf-8?B?UUI3M1NqSDVWckhZKzVwN1VVNWM1WnZWTkk5WUQ2eitUUzllNlJ3YWZadUxl?=
 =?utf-8?B?TGtuTURNdk9GUDcwVVl6Ti9PYUI1NWhjS0FsZ0t2NEs5SitJcWhRRW1MNHB4?=
 =?utf-8?B?eWQxSkJnWWdYaWNNelBydlBvNzB3bmNDMmJmbGpDeDlnZkw4QjFXWVFxc3N2?=
 =?utf-8?B?OEYvU204VWQxVGl1MDk5b0x2ZmxTblJDNlF6WVBDNkJWRGlCVmNTRlBCNFZp?=
 =?utf-8?B?SEppeWVJOElyZUJmVGw3YVloaUx6WHQzdXhpanBuUXF2N293Zllnakw4Nkgz?=
 =?utf-8?B?Uk1aOXZUeHBxZXViNEg4TjVyMVN0T1hpT3l1OEpRT0FGVWNORGpXL0F1ekdw?=
 =?utf-8?B?RzJFY1V3TWZMeEJJeTF6Y2xYTXlVV2Z6aDVrZ2hhYzFKNmFjcnJMQ1VlMlRP?=
 =?utf-8?B?eExvK1l3eHhXeVYvaFVHdlFRekJKODRzMndRVXZlaGhSeUNhZ3NKaXAxWHRE?=
 =?utf-8?B?Ty9sUWNFdDZadDVyY1A1SVBsbGdwMWNSckp6bEhoT0M2MmxrNXhrakVEMUZU?=
 =?utf-8?B?amk5cnVaMXpYZ0FDeHlua0FCS1lrcDQwVnVYV2k0K0xHdld5OWNpaDdrNmZy?=
 =?utf-8?B?cTc3Zy9QcUFmUnZFQlgzbVRBWUZjQkJiSWlWTHZoWnMxZXlvYVJLY1hGUUVC?=
 =?utf-8?B?YjdDbXBIcTRwTVpBV096L25IenVlUXhrdG1udzl5QTN2MnFaSWM0dFI1U2NE?=
 =?utf-8?B?R3BlVmptazRvM1BXdUtkZ0d1dm92ZUpReE9UalduSzZPNzM2YWUwZmZHYWht?=
 =?utf-8?B?SjRVU2xISXNPdnZtNldPaWNHaExTN3ZvTitwZjdkenZ1b0tFam53T1YxUlAy?=
 =?utf-8?B?aE4vaWxidnRmaHMxMWtkcStUeWpFNzFrOC9uUmphRkE1RW5rSFRFVnlKM2JC?=
 =?utf-8?B?NTRZR2NSNW5oczByRFpwMUhDTFlycG1wdHpadis5bkhuLzRXSmJ5K0U3M0RW?=
 =?utf-8?B?ZWpkMWhiY3lxbmE5ajZYOTZJOHp2VDFRL2tzaDJiWG81YS9tMUFJaXk1dG0z?=
 =?utf-8?B?VmI3ZkNkUGtoVlg3RWZjd2psaXZsTmgxVzJjY2VDOFpxcGtWZEwxcGFqTlZh?=
 =?utf-8?Q?Gya0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDA23C32B9746B4C88EB535443CBB327@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5ded58-e33e-4ad4-3874-08dd96a8862c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 07:41:10.6091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0STwxfOI3u++61iQSFQEom/LI6uedFObNTZEbjZuw/orEnhdJEdqaooN/qUmobogcr9gIvQh8BQXdyBigpMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9620

T24gMjAyNS81LzE4IDIyOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDUuMjAyNSAx
MTowNSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpX3Jl
Z3MuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgNCj4+IEBAIC00NDgsNyAr
NDQ4LDEwIEBADQo+PiAgLyogRXh0ZW5kZWQgQ2FwYWJpbGl0aWVzIChQQ0ktWCAyLjAgYW5kIEV4
cHJlc3MpICovDQo+PiAgI2RlZmluZSBQQ0lfRVhUX0NBUF9JRChoZWFkZXIpCQkoKGhlYWRlcikg
JiAweDAwMDBmZmZmKQ0KPj4gICNkZWZpbmUgUENJX0VYVF9DQVBfVkVSKGhlYWRlcikJCSgoKGhl
YWRlcikgPj4gMTYpICYgMHhmKQ0KPj4gLSNkZWZpbmUgUENJX0VYVF9DQVBfTkVYVChoZWFkZXIp
CSgoKGhlYWRlcikgPj4gMjApICYgMHhmZmMpDQo+PiArI2RlZmluZSBQQ0lfRVhUX0NBUF9ORVhU
X01BU0sJCTB4RkZGMDAwMDBVDQo+PiArLyogQm90dG9tIHR3byBiaXRzIG9mIG5leHQgY2FwYWJp
bGl0eSBwb3NpdGlvbiBhcmUgcmVzZXJ2ZWQuICovDQo+PiArI2RlZmluZSBQQ0lfRVhUX0NBUF9O
RVhUKGhlYWRlcikgXA0KPj4gKyAgICAoTUFTS19FWFRSKGhlYWRlciwgUENJX0VYVF9DQVBfTkVY
VF9NQVNLKSAmIDB4RkZDVSkNCj4gDQo+IFBsZWFzZSBjYW4gdGhlIGhleCBkaWdpdHMgYWxsIGJl
IC8gcmVtYWluIHRvIGJlIGxvd2VyIGNhc2UsIHdpdGgganVzdA0KPiB0aGUgVSBzdWZmaXhlcyBi
ZSB1cHBlciBjYXNlPw0KSW5jbHVkaW5nICIweEZGRjAwMDAwVSIgb3IganVzdCAiMHhGRkNVIiA/
DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

