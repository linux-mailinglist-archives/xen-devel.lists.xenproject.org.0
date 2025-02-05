Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A9A28640
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 10:13:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881992.1292162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbSw-0008QR-V6; Wed, 05 Feb 2025 09:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881992.1292162; Wed, 05 Feb 2025 09:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfbSw-0008NU-Rb; Wed, 05 Feb 2025 09:13:02 +0000
Received: by outflank-mailman (input) for mailman id 881992;
 Wed, 05 Feb 2025 09:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBCp=U4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tfbSv-0008NH-5R
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 09:13:01 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2415::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64032266-e3a1-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 10:12:59 +0100 (CET)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Wed, 5 Feb 2025 09:12:55 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 09:12:55 +0000
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
X-Inumbo-ID: 64032266-e3a1-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDXXiZrF0xOn4ookKuJiQotnCnSuv5hKldPHaRi0B0EnVOGxM5NHr+KbRg1PEdnlpLDr2q9JhPw24zLlNUCcmpijrdAi+PqGZU70GdtQUOI40l4z3QkiwC1OFQ9FqOQdXgIrJ0foJ0tGp5mF3YVBcahTbedgkLbjmPb9YHos9I2w0UeljXYAtjvEIvf1iwWlE/lbDnTAodJ/0Z95W9pTleUcvkIW4sx+TgQdw2sziUKlzvh1sHpK3yL18HFyxOwXg4zT8aC7woQrM+9HtJaerQ8j886kbe5UAVKy5u28JvS80Z1ZOIvQEA3fHk0ZVf9oBo9vfcl5YCZRDLJxMT0hGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15T+2oKg08hpRoEl+bZ0MyfJ7ADeXubq1PlUYg+B1wg=;
 b=SfuLmooNnR7xfWNzNeymtvcpvwg4WdbFTCTpxccvA1WHe9Q7/KKfzcB40rOHrtB73x5kwFW+5qKfjUnmsFiQoEI7GJkOJtF2bURRh6cXNcZDyg0YBwiX7YNJAk6DKmanUWl0E/eDVp9JG6mA5M87QoCUcmBNQ5NqCeCitmjl8CATyDSILi4nHVhYc0tFlItdxUzM228YzvO+7CVBvcgXme+g/Cu1ATd7M1yNc0LOGGD4H2GGpO0wP7eYu42V4YhPUA2v5TgxFMONbdVectprcszloTP3453fg/WvydTTtdsE8Ab9DMds33a+Fc2s/icQSKqUUP4pchYruSTuueB/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15T+2oKg08hpRoEl+bZ0MyfJ7ADeXubq1PlUYg+B1wg=;
 b=CAiuRMR8CWw9N+7Eq9dBQQw9PW0phgQb5ylZ3isSfAOB9IIUSGCkx3VNILBx/B8X9LmASm82PMbMKpFBVS6IvUrmhuQk937NXSasZSA29GE9KAh9WXszXuTwGcN4L3bwuEJdRAvIUJvWU0VcpF/sTU/SuvHu2LJmb0sXOBxhPQM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Thread-Topic: [PATCH v6] vpci: Add resizable bar support
Thread-Index:
 AQHbbUoyUzXRgWLOOkOHv+F73OEjK7MqsrQAgAAFzwCAAAMXgIAABJWAgA3j+oD//9kVAIAAiKwA
Date: Wed, 5 Feb 2025 09:12:55 +0000
Message-ID:
 <PH7PR12MB585419F320DC4EA364EC79ECE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <Z6Mn2pWdp6aquAmY@macbook.local>
In-Reply-To: <Z6Mn2pWdp6aquAmY@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8398.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|DM4PR12MB6133:EE_
x-ms-office365-filtering-correlation-id: 98bbcdb9-e311-4099-2653-08dd45c54694
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Tmt5ZUJyOFlSMjdDSVJyOVZtV29Lc2FROE95RUNkQ2IwTjVEYk5aSkM2Mkdi?=
 =?utf-8?B?TjJQSFNyWjNzU2N5OUhIVEJFOG5Va1pIbFphbHVGdk40YTRxWmpRUTdhQ1Vn?=
 =?utf-8?B?VGYwUnllWkxXbll1Uk1yMU10eVlobncwYkw0NFNmOFpNS09vcjIyUjFybFRF?=
 =?utf-8?B?OSsyblc3cVNXNmNzclFjYkFFVnRPVVhoN1BhWUNVQy93UDlLdWM5SWRQWmhp?=
 =?utf-8?B?QkFGeTFFVUMwczJ3ZWxON21UMWVuRUtIN1J6SmRSMGhNY1pUNUFpK1dMamd5?=
 =?utf-8?B?c3lHQ2t2WTZRWXZtNnVIWlRIRnJUN3V3R2JUM2JpRE9RQStTSE5kMlk4R3dS?=
 =?utf-8?B?Z3Y4aVdFdHROUlVDckJqb2UxM3lhRlZGMlhkWTE3R09ITXA0MW0rZXpwZTUx?=
 =?utf-8?B?Q0l2RzNrTkVMOVBCNmhPUTNPSXJCS010c1pnbzhYaHJyL3IxUFhRbU56Q1Ar?=
 =?utf-8?B?VEl0TldZWXE5Tzd0NmQyeHVXSXpxWlFwbVdoc3h3V0FzdU5KOE9ZcTNPd0RH?=
 =?utf-8?B?SnlYL21qZU91KzJJdlRWS2IySW51RmxkZ0RXQ3NEM2VySzRxbk91L2l2a2JS?=
 =?utf-8?B?M1RoeHpKSWtMRFZycUIzS3BPa1ZnODNXSzd6S0JLZUlYL1gyOVkvK2pxQUZQ?=
 =?utf-8?B?aytQcndGZVJrL3hDKzNKSUZKVzg3UisrUXhsbkFJL0h6cGgrRXZMUVg2UEFz?=
 =?utf-8?B?S1poN3J1ejdzNWZIUU83eFFFQU9sTk92NCtaOFJyalFleEVJcUJhOUlrMXps?=
 =?utf-8?B?anh5eXZWY0VlMEVMeEd3VmUwalpyRjQwd29hbzBiRW13d0RPdmRMd2Q0VWMr?=
 =?utf-8?B?TkJ3NUI5YkswdC96ZHRIbXJXb2I0VnN0U1F0b1AxQ1VSeFFiNnIxN0o4Vm5S?=
 =?utf-8?B?bGNKcmlCak5qdmdXTndzNko4WVFya25MT0xVQVVCbS9SSXFFL1QvYmRXVkp2?=
 =?utf-8?B?UGRBK1NUU01QaWdGRGQxWjI1MkhoSCtPUG0xV0owOXFXaitXSzJqdnRjSnkw?=
 =?utf-8?B?TGVzcnVjVnhsY25oa2F2Zkhrc1U1L1lDTk9NbFZ0RzF3bnFzNldKN2lVcEpT?=
 =?utf-8?B?SmYydmRaYzFaRDVEWUREeXZGTC8yZTRzWTJJQVE4bEl2Q1dwNGQ0VWpsam5z?=
 =?utf-8?B?VmxRUFU4OFpjV1JIWGVxdFB4QnRwVWM2VVhsNGU5cmwrUzVtN0pBVFRtdXdT?=
 =?utf-8?B?TGhxb0VCTjh0TThUSnBlNUFaUmlZcHNLZlAzb1RCRTFhV05xRkk5MDNPaTJs?=
 =?utf-8?B?dlVOVWcrd3Y2UG9NR2pEMlUxdnZoT3IxNUxla2d4bGRwU0sraW1NcDJPZlAw?=
 =?utf-8?B?Tmh5bEM5ZWxMRVVSMmptSjFqcmtlbnc5REZlQ0hxdmRmL1NOY2M1RmtLaVRl?=
 =?utf-8?B?K04wc1F4ZW1wcUgvZ2RKOTh1eUF4R0hWVlZuemhsMEJlS0I2Qms0UGpZTHRw?=
 =?utf-8?B?TXVrVzNkaml6c1FkMkFsSzRLMjZ3M0JCei9VMVRXcE92emZmNVI0WGYyMGF2?=
 =?utf-8?B?UUptRmhRRWZURHZpZklkOUV4QlJVSHhKYXJMR2YvYTJ3V3ZaWUJRM3pNanBM?=
 =?utf-8?B?YlRHa2VHaUJRa2xITWY0NnVSbTBaaHZtQmY0S1V1OVRCRmk5MklyeGJWeGlO?=
 =?utf-8?B?enNYeU54VTkyeC9LV3M0N0pybUxRamFGYytnMllaSjFCSlBQSlFWbHhxQnM1?=
 =?utf-8?B?SHlwNGVRcHdsOFkrcElXMGUyWnBER1VPeXoyYmt1R3RVNDFKQysrSXNucXdl?=
 =?utf-8?B?SmdlWS9tSGRMaVBndXVIemlDRkFkN0xxTVJRejhuK1JJWGc4U0FTaXEva2ts?=
 =?utf-8?B?dWd2TWYxTWxkcFdVZkNreFBhcTF6alJrNytlNmJyZ2RoVGFSc3pzS3pLcVFE?=
 =?utf-8?B?bGEvVHdhWWIzQWRMdEwxRlh4d2k3VTNQSzB0Z0hBMnkyU3lmUDU3bllGODBP?=
 =?utf-8?Q?RFjuiUtZOo95T0S9B70l315baWBFDjYQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2MwcHRZY2lpOEtCOE5zZVgzVC9IUTBjY0hHMGU0Y01Xem9rYnpaRkxKRG9y?=
 =?utf-8?B?WEFNQ3ZJSzk4VjExR0dJRUhBN3VmaWhrb29MTHp4ZnFwWjhreHBNM2RmUHA4?=
 =?utf-8?B?cHNaV25IVUNlTW9KYmNoNmZvckRHbDAwbW5hekgvUUlEdkdsaTN1d2FkNFVs?=
 =?utf-8?B?UXA2SEhaMTJibXBONVhZcnUrRTFMeTJLNjYxbkxBZ0lSZUN5TXc2UlpCZGZ3?=
 =?utf-8?B?TC9saUxxbGVMWC92S24rZ0xuMjVwUTdtL21wZDJzVU9mbGV2YlFLTU9MK2dI?=
 =?utf-8?B?bCtsUUF0SC9HMFZNYjFjRTFacGFxcHBuc1FEOHM4OEI1dENZTWxGNFJxM1No?=
 =?utf-8?B?VWF6R2RoNUQ5YnJaSXNIcFJ4eS9WMHJPNjlhR1ZJOGE2aGRmZFlBVW1aVEdF?=
 =?utf-8?B?b0FrU3BlUlNnL0RRU2JwTVA1akR1Qjk3aC9EWndLSkR6Z1Z6Y3kwNjZUWHhC?=
 =?utf-8?B?cWR1eDI3enhzekVBM3JKOFdnL2FYenFGZmVJMldlVFB1V3VQaVMvTUtzaWZO?=
 =?utf-8?B?VS9FT0cyZWp0eWljNlNBdVRZODY5Ym5ub2NMRVpjbHQ1ZjlRUzJBWGRaRlRm?=
 =?utf-8?B?RGVyRjJQZ1JldVNhS2NrTXhXTTJ1ajgwOGlSelE3bHZkK1Z0SGZ1THVPZnF3?=
 =?utf-8?B?VE5XdTN2Sk03WUt3RG9LQnNuS2l1dmtEalBxYjdwWWF1SE5STEFQOHhLTmgz?=
 =?utf-8?B?UkIyNW91a3VKNjdBeFcxcklwRHNEdktYWVJ4Ym9wdkZVU2IxSnEyUE11Q2Qv?=
 =?utf-8?B?V24zRkIya2FKUnRoL1U2WDh1ZHNQbmMyQU9EaW9UOExRZXVKTkdpQno3U2RQ?=
 =?utf-8?B?Uy9DUVhZN3ZFZGY2U2hsM0hHa2FFd3plZ0xldTh0WGo5b0VWRGZzUjRjNm1Z?=
 =?utf-8?B?M2NTRDV1d01DcWFYMFhFVW1mQlg5VGt1QzY0SFI1SlhHSEp4VXBMaGZtaWxF?=
 =?utf-8?B?cVpDYXR1aytIMTFqZ2tMekYzb0puRlNndWxaZGhDMWxoNHVkRFJubzNrUkJW?=
 =?utf-8?B?YXVEbnZmblBtekp6WFNyWGIxTVBMMzRQTEI5a2JpMXR3dU5wM3dzN2ljTWhV?=
 =?utf-8?B?amNSOVF4MUVyM3F5YU1LQW9YS1FjdEVsMDRjNUlPeHVUNTFObEIxWjdjYkFl?=
 =?utf-8?B?OTZBUTBDT29YT3pmdml0V1R3KzRldUV5dFpRTGluOHBFZWE4dTE2WTgyNEx0?=
 =?utf-8?B?QlFaZWVSZW8weVlsaVlhWTRLQlJDMFh1VGxQcUZGa0ppeUgrWU53M2lvZVhq?=
 =?utf-8?B?YnhwMUJzVVREMXA5R3U3TngzSkdza1lFSWxvVUxnd2svR0NwMXpuOXJkTTlL?=
 =?utf-8?B?ZkhnbUFFK1RlTUdZK3gxMzdRelF2bytaKzgreEw0ZkRvS25lTThCZG5TcnhX?=
 =?utf-8?B?ZDlrMzUzZm1pU1pGbytRbFE3S1VXNDdHcEwwMGtJcUFiYnBtekNod3Vud2xo?=
 =?utf-8?B?NXN3WnYyVWk0eWI3Rlpyc1U5SE03ZWN2eFNQV2xrYzB1N0NJVnBiNUh0RUtX?=
 =?utf-8?B?cjV0eDI1bGp2bFFJV01WS2FKenlCcTQ2SUoyY2h2eENkZVlqUXhreVo1bDRa?=
 =?utf-8?B?ek5oMVNrNGZnajRseXZxWkhHNHlBWkU1d1cvcndLU3lMTjcrWUt5ZDNrUjZE?=
 =?utf-8?B?WGpWQktsSWtaV0s3MWxrcWZSMllLQnJsUXNCSlArOHFpRGZQK3Jjajh4eGJ0?=
 =?utf-8?B?dktxUHJ5cFNTK0xPZXUxeDl4S2NaQmd2TWt1VEpVanVVWHNJQWpuS200cWxy?=
 =?utf-8?B?NWkrRkJ1YlBXRGNFWGJnSVY2eFo4ZVhvUFFTNFZYRllRRlEvckZ5YW91ZXFO?=
 =?utf-8?B?ZkR4U2c2L2hVZGRqb0MrOFZ4TmdmZUJJa1ZvbDFSSzh3bkdaakJ2cTJWWDhG?=
 =?utf-8?B?UEpmeVhUbTlGUXJIaE1TOHJqS3lLek1ZNFNFTnhuVFJyYXNvekR4MFR4QnUx?=
 =?utf-8?B?MFdaSTNMR3c2U2g2QlNOanpUeDZwN1hmNUgxckswdTdhSG96OSswcWZHWlRT?=
 =?utf-8?B?RGtTdUdkVzNsSWQ1ZFVaOUhMWDJ1Wk95YVhCSXFaSGJVTkIxRUxoL09qVTRY?=
 =?utf-8?B?dFVPRG5HYUlqYUkxRGgxVk12OUhaOWdIT2NvaHdlaFRKM3V3T09GamIzakJT?=
 =?utf-8?Q?tang=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8157CA5961DB434DB4E2ECBCE975973B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bbcdb9-e311-4099-2653-08dd45c54694
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 09:12:55.0890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pT3KHljJHUeTsc9HFnh8V/cfBzoZvofdc9mPSvaoG6zXDN/81xxkPLu0tOnignWtemZpF0J8O5kgBuqVG+eByQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133

T24gMjAyNS8yLzUgMTY6NTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwgRmVi
IDA1LCAyMDI1IGF0IDAzOjQyOjMwQU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9u
IDIwMjUvMS8yNyAyMzowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBNb24sIEph
biAyNywgMjAyNSBhdCAwMzo1MjozMVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4g
T24gMjcuMDEuMjAyNSAxNTo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIE1v
biwgSmFuIDI3LCAyMDI1IGF0IDAzOjIwOjQwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+Pj4+IE9uIDIzLjAxLjIwMjUgMDQ6NTAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+Pj4+PiB2
NS0+djYgY2hhbmdlczoNCj4+Pj4+Pj4gKiBDaGFuZ2VkICIxVUwiIHRvICIxVUxMIiBpbiBQQ0lf
UkVCQVJfQ1RSTF9TSVpFIGlkZWZpbml0aW9uIGZvciAzMiBiaXQgYXJjaGl0ZWN0dXJlLg0KPj4+
Pj4+PiAqIEluIHJlYmFyX2N0cmxfd3JpdGUgdXNlZCAiYmFyIC0gcGRldi0+dnBjaS0+aGVhZGVy
LmJhcnMiIHRvIGdldCBpbmRleCBpbnN0ZWFkIG9mIHJlYWRpbmcNCj4+Pj4+Pj4gICBmcm9tIHJl
Z2lzdGVyLg0KPj4+Pj4+PiAqIEFkZGVkIHRoZSBpbmRleCBvZiBCQVIgdG8gZXJyb3IgbWVzc2Fn
ZXMuDQo+Pj4+Pj4+ICogQ2hhbmdlZCB0byAiY29udGludWUiIGluc3RlYWQgb2YgInJldHVybiBh
biBlcnJvciIgd2hlbiB2cGNpX2FkZF9yZWdpc3RlciBmYWlsZWQuDQo+Pj4+Pj4NCj4+Pj4+PiBJ
J20gbm90IGNvbnZpbmNlZCB0aGlzIHdhcyBhIGdvb2QgY2hhbmdlIHRvIG1ha2UuIFdoaWxlIC4u
Lg0KPj4+Pj4+DQo+Pj4+Pj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGluaXRfcmViYXIoc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICsgICAgdWludDMyX3QgY3RybDsN
Cj4+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgbmJhcnM7DQo+Pj4+Pj4+ICsgICAgdW5zaWduZWQg
aW50IHJlYmFyX29mZnNldCA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNiZGYsDQo+
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9FWFRfQ0FQX0lEX1JFQkFSKTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIGlm
ICggIXJlYmFyX29mZnNldCApDQo+Pj4+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+PiAr
DQo+Pj4+Pj4+ICsgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0K
Pj4+Pj4+PiArICAgIHsNCj4+Pj4+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwcDog
cmVzaXphYmxlIEJBUnMgdW5zdXBwb3J0ZWQgZm9yIHVucHJpdiAlcGRcbiIsDQo+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgcGRldi0+ZG9tYWluKTsNCj4+Pj4+Pj4gKyAgICAg
ICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4+Pj4+PiArICAgIH0NCj4+Pj4+Pj4gKw0KPj4+Pj4+
PiArICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmViYXJfb2Zmc2V0ICsg
UENJX1JFQkFSX0NUUkwoMCkpOw0KPj4+Pj4+PiArICAgIG5iYXJzID0gTUFTS19FWFRSKGN0cmws
IFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSyk7DQo+Pj4+Pj4+ICsgICAgZm9yICggdW5zaWduZWQg
aW50IGkgPSAwOyBpIDwgbmJhcnM7IGkrKyApDQo+Pj4+Pj4+ICsgICAgew0KPj4+Pj4+PiArICAg
ICAgICBpbnQgcmM7DQo+Pj4+Pj4+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyOw0KPj4+
Pj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaW5kZXg7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAg
ICAgICAgY3RybCA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWJhcl9vZmZzZXQgKyBQ
Q0lfUkVCQVJfQ1RSTChpKSk7DQo+Pj4+Pj4+ICsgICAgICAgIGluZGV4ID0gY3RybCAmIFBDSV9S
RUJBUl9DVFJMX0JBUl9JRFg7DQo+Pj4+Pj4+ICsgICAgICAgIGlmICggaW5kZXggPj0gUENJX0hF
QURFUl9OT1JNQUxfTlJfQkFSUyApDQo+Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+Pj4gKyAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiB0b28gYmlnIEJBUiBudW1iZXIgJXUg
aW4gUkVCQVJfQ1RSTFxuIiwNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21h
aW4sICZwZGV2LT5zYmRmLCBpbmRleCk7DQo+Pj4+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsN
Cj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgICAgIGJhciA9ICZw
ZGV2LT52cGNpLT5oZWFkZXIuYmFyc1tpbmRleF07DQo+Pj4+Pj4+ICsgICAgICAgIGlmICggYmFy
LT50eXBlICE9IFZQQ0lfQkFSX01FTTY0X0xPICYmIGJhci0+dHlwZSAhPSBWUENJX0JBUl9NRU0z
MiApDQo+Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICIlcGQgJXBwOiBCQVIldSBpcyBub3QgaW4gbWVtb3J5IHNwYWNlXG4iLA0KPj4+Pj4+
PiArICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIGluZGV4KTsN
Cj4+Pj4+Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4+PiArICAgICAgICB9DQo+Pj4+
Pj4NCj4+Pj4+PiAuLi4gZm9yIHRoZXNlIHR3byBjYXNlcyB3ZSBjYW4gcGVybWl0IERvbTAgZGly
ZWN0IGFjY2VzcyBiZWNhdXNlIHRoZSBCQVINCj4+Pj4+PiBpc24ndCBnb2luZyB0byB3b3JrIGFu
eXdheSAoYXMgZmFyIGFzIHdlIGNhbiB0ZWxsKSwgLi4uDQo+Pj4+Pj4NCj4+Pj4+Pj4gKyAgICAg
ICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMnZwY2lf
aHdfcmVhZDMyLCB2cGNpX2h3X3dyaXRlMzIsDQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmViYXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NBUChpKSwgNCwgTlVMTCk7DQo+
Pj4+Pj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4+ICsg
ICAgICAgICAgICAvKg0KPj4+Pj4+PiArICAgICAgICAgICAgICogVE9ETzogZm9yIGZhaWxlZCBw
YXRoZXMsIG5lZWQgdG8gaGlkZSBSZUJhciBjYXBhYmlsaXR5DQo+Pj4+Pj4+ICsgICAgICAgICAg
ICAgKiBmcm9tIGhhcmR3YXJlIGRvbWFpbiBpbnN0ZWFkIG9mIHJldHVybmluZyBhbiBlcnJvci4N
Cj4+Pj4+Pj4gKyAgICAgICAgICAgICAqLw0KPj4+Pj4+PiArICAgICAgICAgICAgcHJpbnRrKFhF
TkxPR19FUlIgIiVwZCAlcHA6IEJBUiV1IGZhaWwgdG8gYWRkIHJlZyBvZiBSRUJBUl9DQVAgcmM9
JWRcbiIsDQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+
c2JkZiwgaW5kZXgsIHJjKTsNCj4+Pj4+Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4+
PiArICAgICAgICB9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICAgICAgcmMgPSB2cGNpX2FkZF9y
ZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgcmViYXJfY3RybF93cml0ZSwNCj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lf
UkVCQVJfQ1RSTChpKSwgNCwgYmFyKTsNCj4+Pj4+Pj4gKyAgICAgICAgaWYgKCByYyApDQo+Pj4+
Pj4+ICsgICAgICAgIHsNCj4+Pj4+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICIl
cGQgJXBwOiBCQVIldSBmYWlsIHRvIGFkZCByZWcgb2YgUkVCQVJfQ1RSTCByYz0lZFxuIiwNCj4+
Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRl
eCwgcmMpOw0KPj4+Pj4+PiArICAgICAgICAgICAgY29udGludWU7DQo+Pj4+Pj4+ICsgICAgICAg
IH0NCj4+Pj4+Pg0KPj4+Pj4+IC4uLiBpbiB0aGVzZSB0d28gY2FzZXMgd2UgaGFkIGFuIGlzc3Vl
IGludGVybmFsbHksIGFuZCB3b3VsZCBoZW5jZSB3cm9uZ2x5DQo+Pj4+Pj4gYWxsb3cgRG9tMCBk
aXJlY3QgYWNjZXNzIChhbmQgaW4gY2FzZSBpdCdzIHRoZSAybmQgb25lIHRoYXQgZmFpbGVkLCBp
biBmYWN0DQo+Pj4+Pj4gb25seSBwYXJ0aWFsbHkgZGlyZWN0IGFjY2Vzcywgd2l0aCB3aG8ga25v
d3Mgd2hhdCByZXN1bHRpbmcgaW5jb25zaXN0ZW5jaWVzKS4NCj4+Pj4+Pg0KPj4+Pj4+IE9ubHkg
d2l0aCB0aGlzIHBhcnRpY3VsYXIgY2hhbmdlIHVuZG9uZToNCj4+Pj4+IFI+IFJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiBPdGhlcndp
c2UgeW91IGFuZCBSb2dlciAod2hvIG5lZWRzIHRvIGF0IGxlYXN0IGFjayB0aGUgY2hhbmdlIGFu
eXdheSkgd2lsbA0KPj4+Pj4+IG5lZWQgdG8gc29ydCB0aGF0IG91dCwgd2l0aCBtZSBtZXJlbHkg
d2F0Y2hpbmcuDQo+Pj4+Pg0KPj4+Pj4gSWRlYWxseSBlcnJvcnMgaGVyZSBzaG91bGQgYmUgZGVh
bHQgd2l0aCBieSBtYXNraW5nIHRoZSBjYXBhYmlsaXR5Lg0KPj4+Pj4gSG93ZXZlciBYZW4gZG9l
c24ndCB5ZXQgaGF2ZSB0aGF0IHN1cHBvcnQuICBUaGUgdXNhZ2Ugb2YgY29udGludWUgaXMNCj4+
Pj4+IHRvIG1lcmVseSBhdHRlbXB0IHRvIGtlZXAgYW55IHBvc3NpYmxlIHNldHVwIGhvb2tzIHdv
cmtpbmcgKGhlYWRlciwNCj4+Pj4+IE1TSSwgTVNJLVgpLiBSZXR1cm5pbmcgZmFpbHVyZSBmcm9t
IGluaXRfcmViYXIoKSB3aWxsIGNhdXNlIGFsbA0KPj4+Pj4gdlBDSSBob29rcyB0byBiZSByZW1v
dmVkLCBhbmQgdGh1cyB0aGUgaGFyZHdhcmUgZG9tYWluIHRvIGhhdmUNCj4+Pj4+IHVubWVkaWF0
ZWQgYWNjZXNzIHRvIHRoZSBkZXZpY2UsIHdoaWNoIGlzIGxpa2VseSB3b3JzZSB0aGFuIGp1c3QN
Cj4+Pj4+IGNvbnRpbnVpbmcgaGVyZS4NCj4+Pj4NCj4+Pj4gSG1tLCB0cnVlLiBNYXliZSB3aXRo
IHRoZSBleGNlcHRpb24gb2YgdGhlIGNhc2Ugd2hlcmUgdGhlIGZpcnN0IHJlZw0KPj4+PiByZWdp
c3RyYXRpb24gd29ya3MsIGJ1dCB0aGUgMm5kIGZhaWxzLiBTaW5jZSBDVFJMIGlzIHdyaXRhYmxl
IGJ1dA0KPj4+PiBDQVAgaXMgci9vIChhbmQgZGF0YSB0aGVyZSBpcyBzaW1wbHkgYmVpbmcgaGFu
ZGVkIHRocm91Z2gpIEkgd29uZGVyDQo+Pj4+IHdoZXRoZXIgd2UgbmVlZCB0byBpbnRlcmNlcHQg
Q0FQIGF0IGFsbCwgYW5kIGlmIHdlIGRvLCB3aGV0aGVyIHdlDQo+Pj4+IHdvdWxkbid0IGJldHRl
ciB0cnkgdG8gcmVnaXN0ZXIgQ1RSTCBmaXJzdC4NCj4+Pg0KPj4+IEluZGVlZCwgSmlxaWFuIGlz
IHRoYXQgYSBsZWZ0b3ZlciBmcm9tIGEgcHJldmlvdXMgdmVyc2lvbiB3aGVuIHdyaXRlcw0KPj4+
IHRvIENBUCB3aGVyZSBpZ25vcmVkIGZvciBiZWluZyBhIHJlYWQtb25seSByZWdpc3Rlcj8NCj4+
IFNvcnJ5IHRvIHJlcGx5IGxhdGUsIEkganVzdCBjYW1lIGJhY2sgZnJvbSBhbiBhbm51YWwgbGVh
dmUuDQo+PiBEaWQgeW91IG1lYW46IHdoeSBJIGFkZGVkIGhhbmRsZXIgdnBjaV9od193cml0ZTMy
IGZvciBDQVA/DQo+PiBJZiBzbywgdGhpcyBpcyBhIGNoYW5nZSBzaW5jZSBWMiwgdGhhdCB5b3Ug
c3VnZ2VzdGVkIHRvIGFkZCBpdCBiZWNhdXNlIHRoZXJlIGlzIG5vIHdyaXRlIGxpbWl0YXRpb24g
Zm9yIGRvbTAuDQo+IA0KPiBJbmRlZWQsIGlmIHRoZXJlJ3Mgbm8gd3JpdGUgbGltaXRhdGlvbiwg
eW91IGNhbiBqdXN0IGRyb3AgdGhlIGFkZGl0aW9uDQo+IG9mIHRoZSB0cmFwcywgYXMgdGhlIGhh
cmR3YXJlIGRvbWFpbiBieSBkZWZhdWx0IGdldHMgcmVhZCBhbmQgd3JpdGUNCj4gYWNjZXNzIHRv
IGFsbCBQQ0kgY29uZmlnIHNwYWNlLiAgSU9XOiB0aGVyZSdzIG5vIG5lZWQgZm9yIGENCj4gdnBj
aV9hZGRfcmVnaXN0ZXIoKSBjYWxsIGZvciBQQ0lfUkVCQVJfQ0FQIGlmIHRoZSBoYW5kbGVycyBh
cmUganVzdA0KPiB2cGNpX2h3X3tyZWFkLHdyaXRlfTMyKCkuDQpPSywgSSB0aGluayBzby4NCg0K
SGkgSmFuLCBjYW4gdGhpcyBjaGFuZ2UgbWVldCB5b3VyIG9waW5pb24/DQpOb3QgdG8gYWRkIHJl
Z2lzdGVyIGZvciBDQVAsIGFuZCBpZiBmYWlsIHRvIGFkZCByZWdpc3RlciBmb3IgQ1RSTCwgdGhl
biAiY29udGludWUiDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KSmlxaWFuIENoZW4uDQo=

