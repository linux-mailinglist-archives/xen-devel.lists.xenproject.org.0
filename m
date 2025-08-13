Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33957B24210
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 08:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079471.1440304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um5Ql-0002W7-TE; Wed, 13 Aug 2025 06:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079471.1440304; Wed, 13 Aug 2025 06:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um5Ql-0002U5-QA; Wed, 13 Aug 2025 06:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1079471;
 Wed, 13 Aug 2025 06:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1N0=2Z=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1um5Qj-0002Tz-GA
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 06:57:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2009::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cefa1772-7812-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 08:57:43 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.16; Wed, 13 Aug 2025 06:57:37 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 06:57:37 +0000
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
X-Inumbo-ID: cefa1772-7812-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICQGebgDJvOjG5ysFt1OlbD8X2kX0EitGMF7+ZghfCBStymfqnN04hO/SDh/gol44d6KWLf3jWtX9bSlWmlc+tdOEmc004MkxW1mHrUgq1ueZl56His1doCXRqVScDWktDmeSaNAdX+xeVs8MI9o9lUaxMvKxSKZ7OVqswwVxeuHEU+39f/RLBpipOOSpww/cFjXQmhHUPxoww9nUAVHds0txyRHrBuU4huhp6awFZY2OLD4nJ9/zAE3iXNV5GVyvdwJam+yPGqBQJW/t92KZapUjkuajtHBGwcmt0jnqI1Hiwgp/+TuBMhtTOnwOeNA7e/qYGfDo/Kzs/V7RkfUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kDTXgM8GZivn5Y9y/bNB7Cufnd+AjJNEpY88AC5abU=;
 b=Rt/bXjSL8cUFFs9lO8w7XJDiJBs6gZZITotfD0MVmlB3jrioaZXwQSwiwuu5xoqE/b1mPPKcSVKlx2tmpBEZchYbfIRF2MpL6uficgotnfalXlKJ5WNO7P4AUG0ga+qH3JoAjvDFgC0JHbwAyjRtLqzob64iGJOogrldKKqLhAKb4sBeBWgWo4an8BNHK+f2PVBGVQf/B9dGjyhJf82bUjO1CQp5xlQmqf2GPh+fcqRooKABCzXGEu28LNXQozQiRFpgxKlBXZ2yImwPVYBDeb3mFgoDFOCPGH9wm7+m6nfcNYXIaa72m8kBLHWAGbiHYPpWIRgc8jL4uz0nxDHnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kDTXgM8GZivn5Y9y/bNB7Cufnd+AjJNEpY88AC5abU=;
 b=MiPktRc4wD1rLdmwZh9bjCatfoGMO/7LbzJ4+/6k4gA5o3BaYVWu7evoC9FvPjuJpRXrTjnQ23SSEzD3cmXbDkLVyHHdbwhJq3K+o6PyKka5TyBWSdI9FA9zbc2sA6Er8z4eCy2dL28p/MG1ERCuObh5+Oc23uOftSTHq+gTjQg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 18/19] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
Thread-Topic: [PATCH v6 18/19] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
Thread-Index: AQHb8hct870Jb7Op80yNICw04pKwJbRBZNiAgB7l0+A=
Date: Wed, 13 Aug 2025 06:57:37 +0000
Message-ID:
 <DM4PR12MB8451F0DC452A789CBA374537E12AA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-19-Penny.Zheng@amd.com>
 <e28d711a-d83d-44a1-9d2e-8b5e694fbaf1@suse.com>
In-Reply-To: <e28d711a-d83d-44a1-9d2e-8b5e694fbaf1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-13T06:57:25.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ0PR12MB5610:EE_
x-ms-office365-filtering-correlation-id: 730d982b-edfb-40b9-3824-08ddda36b024
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Smt1SDBRVTVkc0xjZjUrRzNNdXFRZ2N4UHUwQ1ZMc1ptUTdONWliZCtRejh4?=
 =?utf-8?B?V090S0xLNTE2RkJKQnNTN2VNR0pqNWtiNWR0am9tbjYrV2pSaXM1M0RPOHky?=
 =?utf-8?B?OVNkTGh6RTRXTlltNUwvdEpuOXRwQ3JlNlEzWlRoVytqbG1yTmhOWWhTRjY5?=
 =?utf-8?B?dnRaOWtlNm1vbkliTmZ6aUNWUjhKdi9YM1E5dmw4N0szWUxHWUtIVk1EdTVZ?=
 =?utf-8?B?Qlo0SXhRZnJ4cjdURjR4TlRRbDdMQVRiLzVrK0xwT3BIWE5PMnRlOGtzUUVa?=
 =?utf-8?B?QXV0TlZ0VHpXK2JhVzB6S1gwREJGdzRkaFdsRGZLZnIzQ1JuZGRzd0gyRHRC?=
 =?utf-8?B?eG5BU0t4VFY4R096NW5TbXVyeDFTV1lONHFwdkZvbzJHMWkxckU5QUZEOE1o?=
 =?utf-8?B?OHk2eldvcDlkQkIxeXVmbFZQL0tjZjJYZVg5NUNkQ0hZQnFHVThDdkxjazJY?=
 =?utf-8?B?SHE4NmtnN2NGMWJKWklWRGF2Q1dFbmNQTWZQZEJmV1hpRWNRRkh3ajYrakV1?=
 =?utf-8?B?MDh0cnNuOTh3S2d6SnFaMlQ5bEpvK0N3UkhQMGd1MWtPbFlvSlpZYlpHQVBZ?=
 =?utf-8?B?ZGNibWM4RWhSeDRtS0NBaGkzOWdPTW93RzVlbFQzRG5YRmR6R01JYnUzcTBl?=
 =?utf-8?B?YnJvM2xiK1I5eThnYTNCUTJKajVWS0UyelpzaGZRci83VWo2SjI4MVJSbVVJ?=
 =?utf-8?B?YVhNcGtPdFFTYjEwNVR4aUlicEduUXpqTzF0cjJZajloRlNyYmZQSldkZ0lr?=
 =?utf-8?B?MFhRQUpneHBBWnJDUUlwREN5WWxNQXRwS21ZVDUrWW1NamZWVDBXejNpUlh6?=
 =?utf-8?B?SWVrTVdUUUdrTk5pbHpQaXFEMGFYbHNRRDB4K0UrK01SQ3pnWEYvV1U4T0J0?=
 =?utf-8?B?bHBObUs5TGc5bnVvOUw2TlU2NWtwdk1WS1cwcmhnaWVRcGhndGd2ZjgwaGsz?=
 =?utf-8?B?K1dndWdBUTdlZXN5NUpSZE5GOE1wM1orV2FTVzh4dnE4TG9WbjB5SS9NYW1B?=
 =?utf-8?B?eUVnOHZhMkxKKzB0dzV0ZTNYSUdzRjhFUlY1WVFEaWJ1bzRCK2ZaK1V1OWFv?=
 =?utf-8?B?dEdWY3k1Yms1WHM0TU1ybE42SE0vN3RNZjJhVkVBU0pQcVc3YnZQZUVNSS93?=
 =?utf-8?B?dC9rekNCRzJ5NjZlek45TWhIcVNjZk5ydVVTdGVFekJKUkRURndhajQzWmsy?=
 =?utf-8?B?L0R3VUFBaFo3Wnczd245eDhpL3NTNmVhZnBHLzFqVkVIZnJKYlR6NlVkYWE5?=
 =?utf-8?B?dWhwNnBaL0VGeU03NUhOVVlDeTdEN0lpVUlHajVlRWp0ei9tRGNsYWx0R1E1?=
 =?utf-8?B?T3lsRlFjY0JyclgrNUlGaFA3S1JyaFJoaXRIQ1YwSjRyZ2ZVZ0xnYWJpZ3Jq?=
 =?utf-8?B?K2FMaUV5Z1N6ZmdoV2JQR0tnZGlFck94aGgxa2NBdVVMb3hOV1k1L01tR1Ev?=
 =?utf-8?B?QTQxSVJaQVhhWHBwOTRhRjYxclRScnN4NG5oL0hzODFEcHRocUVnNVhVYkgr?=
 =?utf-8?B?dmkxamZKc2todlNhOTMvSFRaYU9RRmZPYi83QlhRQ3NkU0NBclBPWHE1YWxQ?=
 =?utf-8?B?dEhpTlVuUmM2c1Y0YkwvMko1OTdsYnRrKzlDOURVWEU5OXZveHN5SkRvYnBp?=
 =?utf-8?B?MVVKbmFCUFQvRkZvWjdNanVDY1RsNEhOUHRzZUhzdzk2U3NnY1RnVUlEOWNh?=
 =?utf-8?B?alBUVDdaUnV3c2Z5K1MzMng5TUhKUGgzV1JzVWxIT2NvT3M0OXZxVXMreTdp?=
 =?utf-8?B?YStwSmpMQjM4elpSeXgvMmJoM0Iwa3g3VnJsTmFxUTVqT01oaXcycDJJd1JC?=
 =?utf-8?B?Qm5DcHRvWHpNOWhvK2pLQ21qcTgwbHp1WEJWNVVRZWFVV0V0YXY3WnZKdktx?=
 =?utf-8?B?Nk9lRlpGYXZwSWgzZ2RWbVBmZGRodWZvZFpkZE5LelRYYzZSaTdIMS9jdnc3?=
 =?utf-8?B?RDgvNW94Rzd0OFVGNlQ2TWJZT2NJTHVZVWwxQkZqNWYrOHFLd2xWSXpGekZH?=
 =?utf-8?Q?VgqY4L8Cvm8s6dEPD69Kd/ykB4vh+Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2kvWXVySkhvZ1paSFJubkk2aWJiVHlMblZPWW9wdU93dm9RK3MxL0QwQm1H?=
 =?utf-8?B?c0hWWU5scGVHd2JqelByRkNIUlc1SlMvcnR4eVJwTFZ1cUF0Q2ZoUTA2ZElZ?=
 =?utf-8?B?a3NJcndiR2FaZDFHTE80R0hXK1lVTHhYSmZyR0J3MGpaWFJzUC9VejFSc28w?=
 =?utf-8?B?VTFKWlRIaCtFYklVVHhveXdERko3dTVEVDdFT3Zyam1qOWtYb1B6R25xWlJk?=
 =?utf-8?B?NTYySjExVTlmZmxwQmdqbGRLMi9lNVFWYWUvclNnSTNqUjcxNUI4Y2NYRWsz?=
 =?utf-8?B?eTh5ekZ5clhsVkorVW1RRzdUV3htVDV5bldhR2s0ampRS0EzekVpeFRycE4r?=
 =?utf-8?B?SFdVdm0vQWhmQ29LVXdRZC9hOHQ1bU9wMEQxNXNlbVhBR0ExMWxwK0N6dlpM?=
 =?utf-8?B?VWpMak9tbGFyMFM0YkJ6VVBLWitQdFZmclpySTNIYzQyMDlFNWRvMHVpd2do?=
 =?utf-8?B?SzM5eUlWVWlmY1FZcWFNRlJHditWelEwTnlqSzY5d2VCaEdwOGRpRnFGKzFr?=
 =?utf-8?B?TnVxbWRQV1VUVmFFSTgvQisyU2hFT1hGNjZPaG5FQTg5V1daNkprUEVmSDg5?=
 =?utf-8?B?SlBjblpqd0haN0M3clhNRk9hTC9EWGxadDJuRk9BSG9aTHd2TmNUSXgxN1kv?=
 =?utf-8?B?ZWFUOUlXZ2gxVDFkdzRQK1RBNGRHTnRYeUJDTWFjT1hYMGRDeE5xMEQ2My9H?=
 =?utf-8?B?cDJjMTZxaHNvRGRXSCtJdGRzOTU3c21IeDRrME5DSTB3SG1yM1VUemxuWmE2?=
 =?utf-8?B?QVRHZkxBbnZ4TUFOMVlkcjVrTGJzSi9sZFhOLzV2dkVQbEF2SUF6eDNlRzRj?=
 =?utf-8?B?bCtzdE5SV1oxSlZUb1dVWTN4WmY0VDI2ekM3dFB4Ym94MlI5OFFBQnZaT0tZ?=
 =?utf-8?B?VW5TVzkrV0NtQWcxM0ZhOHJZU0dnV2dHcHh2UVdRK3dwdmlWdHByVkRRR1lS?=
 =?utf-8?B?NzE1SjlERFovckYra0Q0UHN0SmpJTm8vRjhrakFCQWVEdU1aVDF6LzRuL3Rq?=
 =?utf-8?B?VThra1BYb21nQWxjc1lUUTlueTF6Y3E0RzU3WldoVnJJYk5USVFXUUtXbDZD?=
 =?utf-8?B?bWtaQm9HSG1MRWNjTzAxNExvVFlPR3c3SFNLS21LQXpWVDB4RjVEbFYyMWxV?=
 =?utf-8?B?aTJqTlA2K1I4aDhmaytHVjVEeTZaS3h6alVyRVUrZDVKWk9naHpJZ3JDOGlP?=
 =?utf-8?B?WTlRZlhIREtmZDRZMnZMb2Q1K25pKzMzdTN1KzNkUlFTaEVJRkhJZzdkYi83?=
 =?utf-8?B?Tkdjdy9sNnIxNXdEUUltV1FLMzZlMWxuTjhMa3k1UGpZTGN2NVpuN05JY0x0?=
 =?utf-8?B?dkhFK2JpclJLRGNmQVVlTmxxSzhUUFQ1eDFTVmZsd3VwUTI5NXZHN0NqeDRF?=
 =?utf-8?B?NThmNVdiV04rWmdpUDZ2dUk2Y2lNUUxyZWtmRmhCTlpWRFRCWjdjclFYN2g2?=
 =?utf-8?B?R2Q2UTE0MjhXdTRuOXFRQ1Z3eG85V2FyV050Yk1QU2NRNWNQRzVoZmdWb0Y5?=
 =?utf-8?B?eTNrUyt4VExFLy9XNE9XOUsvZVFSd3ZQeFB3M053Nkw4S1h6TkVqaTRpei9j?=
 =?utf-8?B?OVg3YnRqVlRSc0RvTjFxRkRZcmdRNzVVUHI5dmpST2dackF3WXJjeWg0ajVs?=
 =?utf-8?B?Z28rbXVTTDRJK2pZbkhBdjIwV200eEs0dHVSNDhnN0R6eEVuSDhmYkhMNWE0?=
 =?utf-8?B?WDB5Y1FiVG96N1RYWmVIVFVXMDVOdGxUd1pTZk1Nc2R0Y0QrdXBsdDZYQ1Zs?=
 =?utf-8?B?WnpsU0FSOWtvRWdmd2c0Ti9jcUVsYnRBVG41NXBNdXlHTW9mSUNPNEc4cmNM?=
 =?utf-8?B?d1liWDdnZlp5QkhtL1ZLQjBIdDhqSGo1VGlsdGMxWVRpcVlOV2lUbnhWajMw?=
 =?utf-8?B?amNkalltMnVsbEVwcnJnTEZrRXo3aHUyc08xVTNmOFJFTVRFSTUwVHl2ZUd5?=
 =?utf-8?B?RG5aeEtWQzJueUl5T2xhN2tyait1aGVsbUNTV09Oc1ptQUd3YU5sMk93V0dl?=
 =?utf-8?B?OUQ1ZGdMbElJSHR3ekw4a0loblM2OWEyQzNRaFBRaDN0aU5QZVR2NDNDQ0Zk?=
 =?utf-8?B?QzFSQzRJOWxENkZVcWxDd2RSM3FBL2NtcGVjOXpBQ3ZjVlpLWWxpaE9xMkJW?=
 =?utf-8?Q?Y7+w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730d982b-edfb-40b9-3824-08ddda36b024
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 06:57:37.4268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWA0+hYVtp1Q/+BBJVOKn/h0tZOSYfdsqMRx3lFRCsbT1HeAyWKIquRRGyqm015RLZh7SkLd9LzSsg5EDky3eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDI0LCAyMDI1
IDEwOjA5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+IDxhbnRo
b255LnBlcmFyZEB2YXRlcy50ZWNoPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTgvMTldIHhlbi9jcHVmcmVxOiBieXBhc3MgZ292ZXJu
b3ItcmVsYXRlZCBwYXJhIGZvciBhbWQtDQo+IGNwcGMtZXBwDQo+DQo+IE9uIDExLjA3LjIwMjUg
MDU6NTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9kcml2ZXJzL2NwdWZyZXEv
Y3B1ZnJlcS5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMNCj4gPiBA
QCAtOTY4LDMgKzk2OCw5IEBAIGJvb2wgY3B1ZnJlcV9pbl9jcHBjX3Bhc3NpdmVfbW9kZSh1bnNp
Z25lZCBpbnQgY3B1aWQpDQo+ID4gICAgICByZXR1cm4gcHJvY2Vzc29yX3BtaW5mb1tjcHVpZF0t
PmluaXQgJiBYRU5fQ1BQQ19JTklUICYmDQo+ID4gICAgICAgICAgICAgY3B1ZnJlcV9kcml2ZXIu
dGFyZ2V0Ow0KPiA+ICB9DQo+ID4gKw0KPiA+ICtib29sIGNwdWZyZXFfaXNfZ292ZXJub3JsZXNz
KHVuc2lnbmVkIGludCBjcHVpZCkgew0KPiA+ICsgICAgcmV0dXJuIHByb2Nlc3Nvcl9wbWluZm9b
Y3B1aWRdLT5pbml0ICYmIChod3BfYWN0aXZlKCkgfHwNCj4gPiArDQo+ID4gK2NwdWZyZXFfZHJp
dmVyLnNldHBvbGljeSk7IH0NCj4NCj4gVGhlIGZ1bmN0aW9uLCBieSBpdHMgbmFtZSwgaXMgc2Vl
bWluZ2x5IGdlbmVyaWMsIHlldCBpdHMgaW1wbGVtZW50YXRpb24gaXMgdGFpbG9yZWQgdG8NCj4g
dGhlIEhXUCBhbmQgQ1BQQyBkcml2ZXJzLiBJIHRoaW5rIHN1Y2ggbmVlZHMgY2FsbGluZyBvdXQg
aW4gYSBjb21tZW50Lg0KPg0KPiBTZWVpbmcgdGhlIFhFTl9DUFBDX0lOSVQgY2hlY2sgaW4gY29u
dGV4dCwgSSBhbHNvIHdvbmRlciB3aHkgaGVyZSB5b3UgY2hlY2sNCj4gZm9yIC0+aW5pdCBqdXN0
IGJlaW5nIG5vbi16ZXJvLg0KPg0KDQpDaGVja2luZyAtPmluaXQgYmVpbmcgbm9uLXplcm8gaXMg
dG8gZW5zdXJlIHRoYXQgY3B1ZnJlcSBjb3JlIGlzIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseSwg
bm8gbWF0dGVyIFB4IG1vZGUgb3IgQ1BQQyBtb2RlLg0KQXMgbm9uLXplcm8gY3B1ZnJlcV9kcml2
ZXIuc2V0cG9saWN5IGNhbGxiYWNrIGNvdWxkIG9ubHkgdmVyaWZ5IHRoYXQgcmVnaXN0ZXJlZCBj
cHVmcmVxIGRyaXZlciBpcyBnb3Zlcm5vcmxlc3MuDQpNYXliZSBJIHNoYWxsIGFkZCBjb21tZW50
cyB0byBleHBsYWluDQoNCj4gSmFuDQo=

