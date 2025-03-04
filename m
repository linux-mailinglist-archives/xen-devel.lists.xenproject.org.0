Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21BA4D191
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 03:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900768.1308750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpHrM-0004tK-8l; Tue, 04 Mar 2025 02:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900768.1308750; Tue, 04 Mar 2025 02:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpHrM-0004qu-5P; Tue, 04 Mar 2025 02:18:16 +0000
Received: by outflank-mailman (input) for mailman id 900768;
 Tue, 04 Mar 2025 02:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCLV=VX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tpHrJ-0004qh-Qm
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 02:18:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaa1b2d4-f89e-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 03:18:10 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Tue, 4 Mar
 2025 02:18:06 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 02:18:06 +0000
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
X-Inumbo-ID: eaa1b2d4-f89e-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOi7ZWGcvjKK9N6caXlkhQJvu+3VUbI4+33zelT5oMbrUwXrEnlTMO21IlkMQ+c1FPmw0KmF4TOOA4NzfyBwlv2HEcg1UZpKHyTlgSaem6IcqOuP2WPM+HBxIX2OgM41vEjq8YTLhP8I7ja7knys4YgFOi79YGXJA0ARJjSBM+GXZF0C7/yfBerdz4qRPkMIw5e4F1z4PUPsm1HVIv++NBXY9Ps8FsE4dxJBUMmJoQA+VWTp+vvAzm+g33sRD69dy/PUoHpcCSfVru3ynWrkMUxy/wjblvfTdSIF9LXwfT25LcL/W714AZ525ktlpBak70vL+f7wX6Gq1IGOMkybOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93XWpMAil8kZw/FJjXP+kEHfUlyZc3CtscelPwBcgc0=;
 b=hz9lCo04rmLJCJaJgyGBxo5yTP1o7QHN/2ObIcUD5N9TSgxmUWSg5hPtppVotUD/INNP/0XN8L8/N5O/sN6LjPxkVc4ct9OQDhp+IyMEA1Y6Mc/mm0EqfzejDBbI1wilounSiSCz3eVbbLXtSlQxogFpNrUmEa7R595RFQcuBSumFtew7Z7IhBbabShEKldtzXvKlUtBkq26iEnX4ytGtyFZmeyAHHq54aFGPYnS+pRNLckqz2/p3tj1IV+UfJ21U9BodLj6JW3vXNXAZDlQJOi3V1CTttSiIdWfHiwKMGK3gSZ1o9OQUcetn4mBs/QxmKD47t1C/2aM3wk5tyMEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93XWpMAil8kZw/FJjXP+kEHfUlyZc3CtscelPwBcgc0=;
 b=iJxZ97tfB2pXrq9Y65sVWctWwMOYN9YjbVA74wH8AL7XY1rLIzXorpG8bZFITU1qScdsmkHx9QEB9C0nW9a43IW8TcHwbkiVbPSecfegPkHueTW9/eT/O1M4WA6n5kFYsSEka48UG3bcCcw6fY2iIRYljRCyUuKu922c/XOT9I8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v9] vpci: Add resizable bar support
Thread-Topic: [PATCH v9] vpci: Add resizable bar support
Thread-Index: AQHbhmvKPUvcbBS+pUu7/6jYBR9mPrNhfwoAgAFQkYA=
Date: Tue, 4 Mar 2025 02:18:06 +0000
Message-ID:
 <BL1PR12MB58491E4C192B282406782B8EE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250224032433.1879630-1-Jiqian.Chen@amd.com>
 <Z8W4NFdcK1kuAH5q@macbook.local>
In-Reply-To: <Z8W4NFdcK1kuAH5q@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8489.024)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ2PR12MB8874:EE_
x-ms-office365-filtering-correlation-id: 10196f6e-d553-4824-2adf-08dd5ac2cd1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YkJoQWZkU0VNSGVrQVZWV3RDQThOV2RORVFqSHBPV1BqTVdrRDBpVm9ub3Y4?=
 =?utf-8?B?OVplVU44aUpMelBBdHd2ZVZNWFcrb2NQa2V0Q25LNXUyenRvMTh1WjRiTEcr?=
 =?utf-8?B?ODdoUll6WlRTdkM5ZDBxblBSa3prL3lLb3d1TENhZmtPdSt1cjFpZ1FMT2Zu?=
 =?utf-8?B?cW4wd2lLQXdldlRTOUdBSW9HajZQNEJNSnI4ak9ZWW1MU2c0dW1aTFpXYmdH?=
 =?utf-8?B?SVZTNkpGRy9jckxpZlJ5c1diN1dxKzJtM3Fkd1hibmQzazVZS0tNZXgzcExB?=
 =?utf-8?B?ODh4eGpVdndmNnlYMkZZREs4Q1NiWVV3cFdsYmxhd2VVK2RuL3Z5Tlcvb3ZV?=
 =?utf-8?B?cC9zblJZKzYwM1NsVkRNR2J3Y0IyTkZaeHoyMDdzV3RiNXZmb01LQzR2WFBZ?=
 =?utf-8?B?US9ENExhaVg1VHFnbFozWU5KQ1B0OE95TVI4ZnI3Qmc1cWFYVjFSRXpJbjdT?=
 =?utf-8?B?M29Tb01NcktNY24vRW9MQ0dmWkxKWnZ5WTBlVWdMaGY1UzVaK01NUFZBcU5p?=
 =?utf-8?B?ekNwV0hsNUpnTVljODZwdmcyNnZDQ1BQSEFCbENINDhYeGhheTgrSEJ6RTF5?=
 =?utf-8?B?Yno0cWpoN1B4WjlEd2dCYmd3bE5LWEV4M3o2enFDdE1RQ1k4R1BZaS9hS3hz?=
 =?utf-8?B?VXNPNmZOWmwzREsrL3ptWnRsUVNmSmxaZmk1cDBMMVZxVDVPOERvR0NOc2s4?=
 =?utf-8?B?Ymh6YWxrZ2gwZU1OMzV4RHVOQkJaaWNQQW1EQWcvd3dORkMwTkpzdmltNnJL?=
 =?utf-8?B?VEFuQmZhQndtSTVwV0ptWWRqcFdSOU1LckNJb05ZK2RyWndnVE9XLzM0elVx?=
 =?utf-8?B?cXJoSXVWYWwzU3phSkNWdFFxQ2hOTXd0UGYyUi9rakVXNzFtQ1BFSnNPV1RD?=
 =?utf-8?B?OEZmeml2S1lPWEVDb0dLQ0V1b05KTXhBb2YyQ0lpQTlZUGg3Yy9WVEN1aU95?=
 =?utf-8?B?YzhBL3hjVEp4UDF3YlUzR1hhRUNMcVROckNud2t3emFYdnZXekt5NUhpZU5Y?=
 =?utf-8?B?dEhMOXZjTHB6RUR0MUQ5Q2lZYkUxZFpmYlNzRnJTdHpxVnBnSW9GbGJzVDFF?=
 =?utf-8?B?MWxuLzgyR0xtUDI1dnJMYUtTSnl0d3dJcmNpNUNJdDIwaVoyVytzN1AyWnM4?=
 =?utf-8?B?SWw1T2V5YXlKUFJmeWgrVFNsT21YU0lYWFE3YWYwQnZ5bm1YdU5vanBQNlhr?=
 =?utf-8?B?OEpUOGZzYXJ0ZWs1NGVPdVdUS3R0Vmp3UTBlS3JaZmVlYW5hUGowWnRnc3Vh?=
 =?utf-8?B?RU5UQ00rOWdpL0VQUFZGUVRibWE5SDFGMXNzbGpicjNWUFV4YVJrbW9OVVo4?=
 =?utf-8?B?eGJhbS9rMXpJaThGYWhhd3lwQ0tjcFBubGE3VEs1Zk5qVHgxTkVXU29DWktG?=
 =?utf-8?B?Y2lYWVJ3cFBaQTNncHZjWjh3M2Y4OFdBcUloSXRNdGNyVUwzblExbTJCa2xB?=
 =?utf-8?B?OHh6RGZZb1pJWDJwS0hXRkhlR2Vic2orN1ZhUTRLQXlZc0pVT2t0a2NmSE0z?=
 =?utf-8?B?ZGJNN3pYQXhqZU5uVS9qKzVLWklHZ3J3ZXJlWktpK2Y5ZDZCWDM2K1UvSGpJ?=
 =?utf-8?B?UnZmWGVBaWdqdDNzL3NPSUF1V0RtL3ZEMXI2ZzUyZjdlSmU3QVc4azFTdDcx?=
 =?utf-8?B?OTIzMUlvc25hV2hpRHFPbjNUSXYvM0orZnRYU3ZGb3AySHBhMXNmdWovRXYw?=
 =?utf-8?B?aUNXbzFpSjUwbzVoc3RsYXI1MkJyVUxjY2doZHJSL2tFekdVUmQ2VFgvS1pQ?=
 =?utf-8?B?MlNuRE8rSzdQWnNicVVFZGRsWjRpaU9xVnZIN1BKaVM1RC9wUHFtVU9EYS9w?=
 =?utf-8?B?Zk9IdWRZZS9ucVdJb1U1Zi80UnA5c2lSNU9KUWVMMHE0enRSUTlIVnNLZ1lG?=
 =?utf-8?B?d2trK1FEbkVteStJbkNXVXZiUEw1aStsK0tyNDRma1NmREw2R05qZlM1UTBO?=
 =?utf-8?Q?qzhInWOzIg7qZck/X2nPTvb3y/rM2+7Z?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0ZKTmZCdTdNSDhhV3RzNnppVno4c3BQcFc1c1ZMRjQyQTVXNXg1V3JuNUVn?=
 =?utf-8?B?cUNzUGFiU1pkaUwwMVZMUkFFczA2UVhZQkpmTDhBaVduNEprUUdXU0V5TVdG?=
 =?utf-8?B?UmJYczZDSEpjQktTYU5hMDFsdzlucTN6eWVDb05vM2NtUjhFV21wK256dk91?=
 =?utf-8?B?TjVhbUJyQ0Y5dVk4U2d1ejBYbys0NFdkYXpreXp1SjFwcEFBWDRDbWZLaXNT?=
 =?utf-8?B?SmhoZkJEL3d4SEd3ZnZxQ2RpY3VvMnF1eVV1djdRSmk1bW84T2F3T0tMMW9m?=
 =?utf-8?B?aGMyamp2NVpsOTkzYWQ2ajMxckZxaVpjNnlKK3ZVczdTVjAzL2pxZUdHbks3?=
 =?utf-8?B?cjlJY1NDM0I3b1A0RHdpaXptNVJxTk80VWNqTmtIZlBrYlYyMzRnVlZyZkg4?=
 =?utf-8?B?UnhiTHVhaHk0NzdpTzV4bXU3bFFqNDM5blFLUXVwK0Q0WlNoemt6cEl5WnlK?=
 =?utf-8?B?QU5Ud2FPVmpZTVNHOFlXTnJpTHdMN25GNllLR1pYWWFSNzQxT3o5MDVRVzlM?=
 =?utf-8?B?Q2NhN3lXVWRPVWJNSEVVY2RWMFUyNkNIdjhia1J0K3ovT1RHd1hmcE5PSjNP?=
 =?utf-8?B?cHF6aTVIcnpobU5seU5VVEhOdFIzMEo5QmZWakNSZGJYZ2dWTUdzRk1XeDIr?=
 =?utf-8?B?THBvV1FyZVo2NnJsUFBGekk3Z29VZjArUVY0L2VqSXoxTnh0NEdDR28yNURB?=
 =?utf-8?B?TjVsVWszdzNiRHBRcG02ZlJxVHVIQ1lOYnZaZldkdjJ4cmdPUzhOcStaU0Jl?=
 =?utf-8?B?UnhLNnJtSTFTYkIyWUFZNHpjUzZINkZ3a2hTejVWMDlqdStJMDVMbUlVNy9o?=
 =?utf-8?B?ZE1CMU1JRHd0U1pqYnkxbHhyTEZvdSs3Z2t3Z1QrZGtvd1I0WWR6ZUpBVW44?=
 =?utf-8?B?NjJzaEdseS9WU0ZmQWF6RlpXWlp0Y08rdFpFOGR6NWJkODlsaHVwZzdoZnFF?=
 =?utf-8?B?VkUvUDZvWEo5eGNHS01UQmtUS2k5V01qZ293VThKVVJZY1NCU0tKdzdXYkZp?=
 =?utf-8?B?Y3dtbWowaC9HSlJneUhZZkdWNDRyTzZJK01jUjc3Umc3VjdxRWlrSS85WXlu?=
 =?utf-8?B?ZmNVN0lJNzFJdXQ5Njh0Q2VZR2ljOEtEVS9nNisxbEs0elZib1Zoc3kxTldo?=
 =?utf-8?B?Yjh3a0xlaCtmL3FiYnRsWW9qaCsvYnJvdEdWVWpaQ01LOTZmN3V2ZjFyQURn?=
 =?utf-8?B?eDhybG1xSUFQMnRJL0h1aWN1dktWVjhQYyt2KzhWdVp4NVNuMTF3cG1HMERQ?=
 =?utf-8?B?dkNuM0pncEZ4dGdKeXY5MWpKRFJGdXNVMHBudEpaV3BveFJXbkRoWTZneWFR?=
 =?utf-8?B?OCtFTU53N1VZYlpIZnkyaXd3QTZvZ2llWTVRNXBvK09INjJGVzhnR2tvbHNy?=
 =?utf-8?B?Wk9FKzBPSVhZRzBmanl6MHRkZi9ENTF1VktUb2xEYVZRMWF0TlhyQjlQWWtW?=
 =?utf-8?B?R25kRHBKVzF6RU5KZnZvMTlZRmhoMXphOTdVV2NrdGRweTJML1JNNDVKRk5Y?=
 =?utf-8?B?S2lFOEpxSUdiRUltTkFrNCtISk5nRk9RNmw1elhiSFZHbTJYUmw5UGZoaXBX?=
 =?utf-8?B?YTc1b0g0aGxLaUM2d0tWaDVaOTJnR2tVSFdwUUdBQkJMcEpqd1k0czE3aHZp?=
 =?utf-8?B?aWpaT0prcGVQbW9DdTEvVnppd3RaY3BFaXVvYmlzU01pMHBBRVNkdTZDRkR3?=
 =?utf-8?B?VEEyMFVZWndZbUJ6blkwQTBOSDVSMlpoT2Nidnc2cEVjMXpLSWVscW9uQnlY?=
 =?utf-8?B?US85alJCcXp1b2hSVy9TQnd1ck1GYjg2Zy81OXJ4Uy93NFA2SXphTzQvci9T?=
 =?utf-8?B?YzRIUXpId0xidlZKcG0xVUdVbm9tRTJ0UDhrM3FLOVlDb2hxTm9BU3YyRHlm?=
 =?utf-8?B?ZThWdnVzVXBaQ0xSR3o3cXVuODk1d1hpSnZzZHNqUjZGckJSd3hHZWhxSFhJ?=
 =?utf-8?B?aWFBeGJNNDk5Yy8yVUdkam51SWdRNjh1YjlaSDlMejlncUZ2ZG4zQTVGbFkz?=
 =?utf-8?B?K24reWROektXNlEyQ0t5MDUxS3dyUlRTTm1yNERyNXA4L3hpRTFzZ0JhWUcx?=
 =?utf-8?B?N0R1UGxTOWF6c2FVRk1tWUFUY0xQUEhvTEdnY21vZjhkYUZLbTBmUWZDZWJN?=
 =?utf-8?Q?UDDY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9D72235AF09614EA7FD14B1FB687627@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10196f6e-d553-4824-2adf-08dd5ac2cd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 02:18:06.7751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESxOC9TZn595zBA9symprqP/gNi7KNHoHnzS0nodki4uG9uxcq2cE3sTDUvPDHVNkY7q/FDBO8zLJuZgiS5cBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874

T24gMjAyNS8zLzMgMjI6MDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgRmVi
IDI0LCAyMDI1IGF0IDExOjI0OjMzQU0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gU29t
ZSBkZXZpY2VzLCBsaWtlIEFNREdQVSwgc3VwcG9ydCByZXNpemFibGUgYmFyIGNhcGFiaWxpdHks
DQo+PiBidXQgdnBjaSBvZiBYZW4gZG9lc24ndCBzdXBwb3J0IHRoaXMgZmVhdHVyZSwgc28gdGhl
eSBmYWlsDQo+PiB0byByZXNpemUgYmFycyBhbmQgdGhlbiBjYXVzZSBwcm9iaW5nIGZhaWx1cmUu
DQo+Pg0KPj4gQWNjb3JkaW5nIHRvIFBDSWUgc3BlYywgZWFjaCBiYXIgdGhhdCBzdXBwb3J0cyBy
ZXNpemluZyBoYXMNCj4+IHR3byByZWdpc3RlcnMsIFBDSV9SRUJBUl9DQVAgYW5kIFBDSV9SRUJB
Ul9DVFJMLiBTbywgYWRkDQo+PiBoYW5kbGVycyB0byBzdXBwb3J0IHJlc2l6aW5nIHRoZSBzaXpl
IG9mIEJBUnMuDQo+Pg0KPj4gTm90ZSB0aGF0IFhlbiB3aWxsIG9ubHkgdHJhcCBQQ0lfUkVCQVJf
Q1RSTCwgYXMgUENJX1JFQkFSX0NBUA0KPj4gaXMgcmVhZC1vbmx5IHJlZ2lzdGVyIGFuZCB0aGUg
aGFyZHdhcmUgZG9tYWluIGFscmVhZHkgZ2V0cw0KPj4gYWNjZXNzIHRvIGl0IHdpdGhvdXQgbmVl
ZGluZyBhbnkgc2V0dXAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlh
bi5DaGVuQGFtZC5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpcnRyaXguY29tPg0KPiANCj4gSnVzdCBvbmUgcXVlc3Rpb24gYmVsb3cgYWJvdXQg
YSBjb3NtZXRpYyBhZGp1c3RtZW50Lg0KPiANCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4vcGNpX3JlZ3MuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2lfcmVncy5oDQo+PiBpbmRleCAyNTBi
YTEwNmRiZDMuLjJmMWQwZDYzZTk2MiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9w
Y2lfcmVncy5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpX3JlZ3MuaA0KPj4gQEAgLTQ1
OSw2ICs0NTksNyBAQA0KPj4gICNkZWZpbmUgUENJX0VYVF9DQVBfSURfQVJJCTE0DQo+PiAgI2Rl
ZmluZSBQQ0lfRVhUX0NBUF9JRF9BVFMJMTUNCj4+ICAjZGVmaW5lIFBDSV9FWFRfQ0FQX0lEX1NS
SU9WCTE2DQo+PiArI2RlZmluZSBQQ0lfRVhUX0NBUF9JRF9SRUJBUgkyMQkvKiBSZXNpemFibGUg
QkFSICovDQo+PiAgDQo+PiAgLyogQWR2YW5jZWQgRXJyb3IgUmVwb3J0aW5nICovDQo+PiAgI2Rl
ZmluZSBQQ0lfRVJSX1VOQ09SX1NUQVRVUwk0CS8qIFVuY29ycmVjdGFibGUgRXJyb3IgU3RhdHVz
ICovDQo+PiBAQCAtNTQxLDYgKzU0MiwyMCBAQA0KPj4gICNkZWZpbmUgIFBDSV9WTkRSX0hFQURF
Ul9SRVYoeCkJKCgoeCkgPj4gMTYpICYgMHhmKQ0KPj4gICNkZWZpbmUgIFBDSV9WTkRSX0hFQURF
Ul9MRU4oeCkJKCgoeCkgPj4gMjApICYgMHhmZmYpDQo+PiAgDQo+PiArLyogUmVzaXphYmxlIEJB
UnMgKi8NCj4+ICsjZGVmaW5lIFBDSV9SRUJBUl9DQVAobikJKDQgKyA4ICogKG4pKQkvKiBjYXBh
YmlsaXR5IHJlZ2lzdGVyICovDQo+PiArI2RlZmluZSAgUENJX1JFQkFSX0NBUF9TSVpFU19NQVNL
CTB4RkZGRkZGRjBVCS8qIHN1cHBvcnRlZCBCQVIgc2l6ZXMgaW4gQ0FQICovDQo+PiArI2RlZmlu
ZSBQQ0lfUkVCQVJfQ1RSTChuKQkoOCArIDggKiAobikpCS8qIGNvbnRyb2wgcmVnaXN0ZXIgKi8N
Cj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ1RSTF9CQVJfSURYCQkweDAwMDAwMDA3CS8qIEJBUiBp
bmRleCAqLw0KPj4gKyNkZWZpbmUgIFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSwkweDAwMDAwMEUw
CS8qICMgb2YgcmVzaXphYmxlIEJBUnMgKi8NCj4+ICsjZGVmaW5lICBQQ0lfUkVCQVJfQ1RSTF9C
QVJfU0laRQkweDAwMDAzRjAwCS8qIEJBUiBzaXplICovDQo+PiArI2RlZmluZSAgUENJX1JFQkFS
X0NUUkxfU0laRVNfTUFTSwkweEZGRkYwMDAwVQkvKiBzdXBwb3J0ZWQgQkFSIHNpemVzIGluIENU
UkwgKi8NCj4+ICsNCj4+ICsjZGVmaW5lIFBDSV9SRUJBUl9DVFJMX1NJWkVfQklBUwkyMA0KPj4g
KyNkZWZpbmUgUENJX1JFQkFSX0NUUkxfU0laRSh2KSBcDQo+PiArICAgICgxVUxMIDw8IChNQVNL
X0VYVFIodiwgUENJX1JFQkFSX0NUUkxfQkFSX1NJWkUpIFwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgKyBQQ0lfUkVCQVJfQ1RSTF9TSVpFX0JJQVMpKQ0KPiANCj4gSSB0aGluayB0aGlzIGNv
dWxkIGZpdCBvbiBhIHNpbmdsZSBsaW5lIGlmIHRoZSBpbmRlbnQgd2FzIGp1c3QgNA0KPiBzcGFj
ZXMuICBXb3VsZCB5b3UgbWluZCBtZSBhZGp1c3RpbmcgaXQgYXQgY29tbWl0IGlmIGl0IGZpdHM/
DQpDZXJ0YWlubHkgbm90LCBwbGVhc2UgYWRqdXN0IGl0IGlmIGl0IGZpdHMsIHRoYW5rIHlvdSB2
ZXJ5IG11Y2ghDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0K
SmlxaWFuIENoZW4uDQo=

