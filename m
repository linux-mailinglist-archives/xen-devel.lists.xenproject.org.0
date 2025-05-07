Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D58AAD5BD
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 08:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978205.1365044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCY10-0002LH-1I; Wed, 07 May 2025 06:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978205.1365044; Wed, 07 May 2025 06:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCY0z-0002Jo-Th; Wed, 07 May 2025 06:12:21 +0000
Received: by outflank-mailman (input) for mailman id 978205;
 Wed, 07 May 2025 06:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeMd=XX=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCY0x-0002Je-T6
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 06:12:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2413::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a063da8-2b0a-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 08:12:18 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Wed, 7 May 2025 06:12:11 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 06:12:11 +0000
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
X-Inumbo-ID: 3a063da8-2b0a-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8BHaQmhg7F64FSbzXe4OGMod+bCuOVYGjpTlbrBMaUz1GN+AVFC8BHG1pyoM9LzEjiJkRUHNJxDaiSDZXVfo8didfYFqpdoeTTs39olSmO+KxufXGKbnTFMWT3RDNuF9Snnngq8Gs85m90lVPh9LXZBdmHqJskWTIWc5uUeJRjRRyFPhboxeEhmnylBTMn/HGhvp0aNe7oJFnY3MHi8qPi50t1Uxn82kCAkNY05k//IFdzU6Jd8L9YumhmahNlxgHX/JlWCyKM+iQQkaIIlEqPYTWgqCKj0kQTc9nD8U7cNySGfyJtGZ4qWYIp+Qflbx/RdnUxGq0yZKs64cc2SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qScM/HNPsHuM5fcWLL01+zdYCBxtF8vmW0h8LWyZ78A=;
 b=W0ba6zqJee8YnR1Sor6WmLjRw1ZvYNGlUN83OTelDvo2mcpzcVd0xzT9y/gFzpbNHcsaU/UtvKLvdTPtVN+gY9qG2kkle3IYsKNPMjjDyy7DwzyG4S1KBuYzNGqXSGmaJcK91dDic6vUiiOAPC1n2sCDBmdKIkemhoI2+LtA7cbAQKsbzm0lFketnE3edGnSrENR29Ts/+kCH8GcTK4rzhpPiX7wS9dPzVXbweEv82XF9v/y6RUV1bdCnaey+ExygO36nEVycMDm7m81LVY/Fc/NauIJK15iMOzSTroCIXl1gq94G1kwJ2GiJv3L6mQWwndGchmDcS3vzTdSBtDQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qScM/HNPsHuM5fcWLL01+zdYCBxtF8vmW0h8LWyZ78A=;
 b=1Gzn9hDOH6+ck/pmlS2jvpujcDjABK6mQ28YrgNAnpgk1VtGzG/R3QBJFM72VkkqfPOFE0C0dTXb9FKYOxUZMMfNJeAcscCNErEf2tJlJCPl75CB7rQSkEgOPoiLptLN9KmwIiWcRilH3g5POP1Zd+pJzXN90RuGFOiN9pexfK8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
Thread-Topic: [PATCH v4 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
Thread-Index: AQHbrRCpjadEsJgkvkaYqq8R9zYjVrOn/wMAgB7NzCA=
Date: Wed, 7 May 2025 06:12:11 +0000
Message-ID:
 <DM4PR12MB8451210ED3CBF8BEDDB48F8EE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-8-Penny.Zheng@amd.com>
 <8b87f6c4-ebc7-4d13-8fe6-a56df6b76523@suse.com>
In-Reply-To: <8b87f6c4-ebc7-4d13-8fe6-a56df6b76523@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=1c164910-7122-49ab-8719-3ada28a77e73;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-07T06:11:40Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY8PR12MB8066:EE_
x-ms-office365-filtering-correlation-id: b46ed75d-7fbc-4c6a-84c2-08dd8d2e1ac4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Sm5mWWE3ejlDbGk2clUrZ2FqMjA0K0o4OCtRSUIvZjNmZ2pNNTFGa2FVOWkx?=
 =?utf-8?B?a1pyTXRUa3RVTjVHMGhPU2lTYjJVQ3d1TzNsT0ppWE5MTld5RW5oanZiM2RO?=
 =?utf-8?B?dFdDZHlwZ3hqeW1FVytzUTloUkxza3VXWGQreUlwa1FQUE45K2dJSFhyQXIy?=
 =?utf-8?B?NFdwUURmZlYzVU13Vm1lMHI4bmZiTCs3NUtBQlk0NW1UT2JxUmFzNGNBR3NR?=
 =?utf-8?B?NU90SzNvM1NuRFUwekJCY3Zia1pHUFJpZnZROVU5UTNWOUh5bi9lbHZGa3o3?=
 =?utf-8?B?aTBYWGRWZXZ5NXFnZXVUUThLUDJicnZJTDVrZjFQdjEvajRoU0ticHNwSExI?=
 =?utf-8?B?Nm9qN0kySll3bTdmcVRuK2Y5VmNGT1B5V0sxcWcrYytOWW1JUU01WVFtNElX?=
 =?utf-8?B?NVltd243TUF2SnhqTzhrdktkQVJBVVN3NHpNd0NoS2FzRmhGeG9zMXhyRmRn?=
 =?utf-8?B?UjZVbEh3QkpMSHhCUVZIS09BNHJucjlrMjRoV21RM3RSc3gxOGhNTFlzdUxl?=
 =?utf-8?B?M1JqYVNBWlZDMThZRldReXp6WHUwS3NudXFzQ2sxcUJFRnp3dDRHRmxmV01O?=
 =?utf-8?B?ZGFkWFlXTHN3L2VHWXVLZ2svZU5aM3VvY3FkY0dVNnE1ellJYVEyNnFDY1ZX?=
 =?utf-8?B?bk1GTTFzSExXUmRMcWhyelJBaS9zTkZBWVlzdEdSNXYrQU5RL1lxbGo5dWh0?=
 =?utf-8?B?d0dmNnQvN2c0N25CUHdUcU0wN0FiYWM2UGc0bkd1NXdnZzAyN3NFRHJKY0Nn?=
 =?utf-8?B?NGIvQkVHM0ZUN0FseGQ0SmVmZkN0cVc2TzBTc2drYWJXMWF0WllJaGVzTlgw?=
 =?utf-8?B?SWRzdnBnRXZ0Y0tGdjVscm4wUmVRRXgrQTdodmVQY1pyVEI0ZXR1VFpzTzUv?=
 =?utf-8?B?NjY5c21aYUMxVHZDZW8rdkplbnlKL3pveE8rdWdxT2c5VTVHcG5URmxtc3o3?=
 =?utf-8?B?azlmZ3pIRm13UVpSY1lnVm9iS0FQb0xhdnZZSU56aTdBbXUxMGNINUszelpL?=
 =?utf-8?B?RGROZlM2Nk4rcEtQR1R0TVFobDZybGhEVFRuV1VXa2xtOUxPTVpVY3hBRUNm?=
 =?utf-8?B?ZVVCSFRHMTVmRWh6YWN5R2pTZlkyazE4bTcyamFleXJXejY1NnBFTkxoZUZK?=
 =?utf-8?B?M2FiR1ZQZDR3UGlkRGFPY3BFdElNZndQcldOUVl0UndwM0lLRWUxWHJ6cUJ4?=
 =?utf-8?B?ZGFNWmhxWEY1MUJ3THZrbmxIYUlZYzBEczVYSTdkS2F3R1dRMGRmeHRBUVVI?=
 =?utf-8?B?ME5OakNCNW9MS2ZtN2Y3a1JiV0wzSXNpTHl4UVd3WjI3M01wM3FnR2ljTGU4?=
 =?utf-8?B?eGxRY3RWbmlNa29YKzJieUd0VE1zQUJZUzZFL1pCS3lsYllTQVRVUDBsZUFF?=
 =?utf-8?B?T3NSMmdaVndCU3NPdldWT2dVckdnM1VDb0JnUzAyNkZmOEt0Rk1iR012SUtD?=
 =?utf-8?B?RXEydmcxcjkxZzdjTXpFTC9TK3NWaXlQWm5wWFBlVGRrdUxSS3l2Zi9oUHNv?=
 =?utf-8?B?NnNjN1JTa0JLRnpDZWpOMzd0b2Q1VTZGNVpaTjRkRTVITCtjc0JxTFo5Rmx2?=
 =?utf-8?B?NjUrL0doOXZqU2RnQmNnZG9OK2hsSFZGMDBKVU5rdHhTWjZGU0JjUnArOUtx?=
 =?utf-8?B?d3h0bURKdVMrLytjTHBQWjV1dU5OZkdFcFlvR0kzNXlLTWU3eFY5T21FeG9R?=
 =?utf-8?B?bnBQN2QrMENVaVZkUTNxSWZnZ1Z5N25hWE9NcWtwdkhWVHBab3lFUW5RL2sv?=
 =?utf-8?B?M04reDVrY0JDbnNrNkRkTWMrSkk5VUl2OHRqMjEydU5RQjhINkEwQXQwZERy?=
 =?utf-8?B?U1FQY1JXMEhzV0MyUW5nQUtwYkVKL3RxN3ZJbk1YOE5SZTUzemxOTW44Q3Ez?=
 =?utf-8?B?WXV4VUpNV1A2bEVtYk4zaEV1c1Z0RzJLZWtNV2JhbzBUM1lYVjEyTWpGcGVZ?=
 =?utf-8?B?OHY3amdQc3h2MDkyZHdHOXJVMTNwbzNkVUkrai8xSzhlT3BjaWRQdEpRRWk4?=
 =?utf-8?Q?P9+tgawparnH0J9AGLbEGoewjvOudw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1ZCQytBZ1BiR1NVMndtQ2lrMngrbzQ3MFJjUmhpTWlFblFWN1JiNE1lVHNU?=
 =?utf-8?B?WUtZNWZhZmtleStVWk1DaCs5em52dm1peVNvUXpobE1TVWwrc0FYeWcrcEZR?=
 =?utf-8?B?UkhDVzdIMDh0SmNPWXU0VlFOcmNlWnE0V1pWbHYvL3puYmJJZk5BYWh3a0Zk?=
 =?utf-8?B?bWlZNGRrSE9SenpnckNhek1IUkxUUmduNXJLQXRlQURSZnFsMkNxTEVOb21i?=
 =?utf-8?B?WThzOW5lQVFhS1RBRkhDQktJbXpaTTl5aVBkTmdEdUZWbklVbkMzU3V5QjA0?=
 =?utf-8?B?S3hUQU40MkpuUHNkTDk5Zi9xcWtVWjc2a2dGVFU3S0JOTWtrU0NFTW9uamRa?=
 =?utf-8?B?NjJSNUs4QytmUG84MnUxbGUyRnBZbVpQUVlqeVpDRkJ4YUl4OFA1MVJsZ0sz?=
 =?utf-8?B?THAvUkgvWUxXd1hIMXpTd21XZXRaMHNRYjNQTU96OGpCQkdOZnJsd0U0TVE2?=
 =?utf-8?B?RXRveURDSDQrQzdNTlZwSjBvUExGVmZ5TU45WmlNdk9TLzZDRkwyMUsyeGdJ?=
 =?utf-8?B?YWN5cVdnL3J2NEZGOS9QNDM0dTEwZ0Eram1sSHNrbGlkbWlBK0VnMWtjNDFk?=
 =?utf-8?B?NXZXdzdSMkE1L2Q0QWRleXI2TFRScnlsSGhqYXBZS2VuY1ZwYXBHT1l3MmZV?=
 =?utf-8?B?dFFsTGUyNFQ2aEQyNDlVZytFMUxhMVdoTkRDS01Ga2hJSjlQU0JZZlFoblor?=
 =?utf-8?B?TVBrdERiWGo2WWhIdE5ZeG03MXJMZVJWbTRMeWdmeS9MRUdLY3NrZk5wT3hM?=
 =?utf-8?B?WkVDV2Z3SU9NWENFRVRMWVg4dFVuSFFZcGxFSEtpelZ5Y3A5VnVUYnVzeWdx?=
 =?utf-8?B?aUZiZmhSQjZQbTZMdWp2UldzRHM3TzJwZGJQRXVWeDJZRDVwcFVUd2E5Sjdq?=
 =?utf-8?B?d3UxVCs0bzBlczVBMWRGRUU0Z1pPNWc5c1ZmcDdSdXRXVSsyU3lCTXJxaklW?=
 =?utf-8?B?VFhla0g4b1dPSk9nYmpoa3Frem9IRXRMT2dNUFdRaDBhNlovbnk5WjFUUTB4?=
 =?utf-8?B?aGc1ZkpBdUl6Z3E2bU90QkFDbUVrZDV1eEg2WE9YdGdxK2xwR0FzK1RVc2ZE?=
 =?utf-8?B?UGlTN0ozUEg3UGJzNGN3MGhUVE93UHRVMVErcXNnQUlkS2dCTHBnQWtiYmZj?=
 =?utf-8?B?b0NJazZsL0Mvc1pYMjEzc2dPdk1UR2hrM0NITWNoc0ZXL1FuWEF3UGZUbXR6?=
 =?utf-8?B?SkJCRWZvSXZDWC93R080MW5TeGhXMm0yRGFFaHh2YVhoWFBIdWZEVFl4ZEdU?=
 =?utf-8?B?cXJGMkd1alpXNDFjMC92M3lHRWxkWFZMVTdKTldnS0JNczlsQk5EODZsdzFS?=
 =?utf-8?B?c0M1VFd1WjdMdjZnMVo1dmt6UzFTVkF5OWJwQnVaVjdQbmFlVHR5ZjBkU2ZT?=
 =?utf-8?B?eGM4aGdxSG5Ham5ITjdVV3VyeXJHVXRWQTNXUUY3cmhrbUxKRktFRjRDTUVh?=
 =?utf-8?B?QU1IUitvdERkdVdBZWllc0RwSms5VFcreVUvbnBySGZWRzhRS3JxdnFycFpC?=
 =?utf-8?B?VnZZTTZidi8rSytTb0FvRHdkSzFNYlVlTU1BbzJKZXlUcHErMTF4YkhVWlpi?=
 =?utf-8?B?UHhxWFpuVjgyTnFiNkF0TkJ0cXBxWUh2bk9MUENNYnFKOW01SkoxU3RlODVh?=
 =?utf-8?B?NU1PQ1NIdjlIcTlhczNZaklSTGZUNW9peGFaam8vNEZZNUJEbXp5UDVhazBS?=
 =?utf-8?B?Qk1sdnJhNVlnNjhMc0ZlMFdXQkc5MDJsMVoyK3R6RWQ1UW9iMEtPTGhLelI3?=
 =?utf-8?B?T1lqcG8raVJocjNQTy9mejROQWxpVGZlamFkVXB2TDJGR203TXUzenlRRnJo?=
 =?utf-8?B?UHNhNktuYmFmWUNIbXZ3VEE1TWRnekdUL0p3THFuYjNvbUMvT2ZvR2VycXRN?=
 =?utf-8?B?K1VWcG43NncwTm00UURrVUgyT1dNaVdmTis5TDZVeEZENXRBYUpNYUwxMERs?=
 =?utf-8?B?U1NJUUVZd2l6RW1WOUtyZHNhMUltUkVUbndrMk9Ta0EzeTZlTGQ1cWs1bXdx?=
 =?utf-8?B?SmJDbldhMTFYVUl5eUVXemZUSjVMcDRNM1JNaE5xZ21tMWEveTJDQjVhMG1F?=
 =?utf-8?B?eXZPOERTKytTMVR2Y1M1TDVwYUpQNmtrcFRBVWlZOWVpNEI4bFhXaXR4TXRt?=
 =?utf-8?Q?I8Dc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46ed75d-7fbc-4c6a-84c2-08dd8d2e1ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 06:12:11.3038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +LDtfUirWbxNRMafFXOyehD1vR0zylTPfzbhbAef5yleROlz+jjYNfMpEhmFmE1ukGmBaiehlBDaRYhNzlzmYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwg
MTcsIDIwMjUgMTE6MjMgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNv
bT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0K
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDA3LzE1XSB4ZW4vY3B1ZnJlcTogZml4IGNvcmUgZnJlcXVlbmN5
IGNhbGN1bGF0aW9uIGZvciBBTUQNCj4gRmFtaWx5IDFBaCBDUFVzDQo+DQo+IE9uIDE0LjA0LjIw
MjUgMDk6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEFNRCBGYW1pbHkgMUFoIENQVSBuZWVk
cyBhIGRpZmZlcmVudCBDT0YoQ29yZSBPcGVyYXRpbmcgRnJlcXVlbmN5KQ0KPiA+IGZvcm11bGEs
IGR1ZSB0byBhIGNoYW5nZSBpbiB0aGUgUFN0YXRlRGVmIE1TUiBsYXlvdXQgaW4gQU1EIEZhbWls
eSAxQWguDQo+ID4gSW4gQU1EIEZhbWlseSAxQWgsIENvcmUgY3VycmVudCBvcGVyYXRpbmcgZnJl
cXVlbmN5IGluIE1IeiBpcw0KPiA+IGNhbGN1bGF0ZWQgYXMNCj4gPiBmb2xsb3dzOg0KPiA+ICAg
ICBDb3JlQ09GID0gQ29yZTo6WDg2OjpNc3I6OlBTdGF0ZURlZltDcHVGaWRbMTE6MF1dICogNU1I
eg0KPiA+DQo+ID4gV2UgaW50cm9kdWNlIGEgaGVscGVyIGFtZF9wYXJzZV9mcmVxKCkgdG8gcGFy
c2UgY3B1IG1pbi9ub21pbmFsL21heA0KPiA+IGNvcmUgZnJlcXVlbmN5IGZyb20gUHN0YXRlRGVm
IHJlZ2lzdGVyLCB0byByZXBsYWNlIHRoZSBvcmlnaW5hbCBtYWNybyBGUkVRKHYpLg0KPiA+IGFt
ZF9wYXJzZV9mcmVxKCkgaXMgZGVjbGFyZWQgYXMgY29uc3QsIGFzIGl0IG1haW5seSBjb25zaXN0
cyBvZg0KPiA+IG1hdGhlbWF0aWNhbCBjb25wdXRhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0BhbWQuY29tPg0KPg0KPiBBcyB0byB0aGUgdGl0
bGU6IEkgZG9uJ3QgdGhpbmsgImZpeCIgaXMgYXBwcm9wcmlhdGUgaGVyZS4gT3IgZWxzZSBJJ2Qg
ZXhwZWN0IGEgRml4ZXM6IHRhZw0KPiB0byBiZSB0aGVyZSwgd2hpY2ggSSB0aGluayB3b3VsZCBi
ZSBoYXJkIGZvciB5b3UgdG8gZmlzaCBvdXQgKGFzIHRoZSBlYXJsaWVyIGNoYW5nZXMNCj4gaGVy
ZSB3ZXJlbid0IGJyb2tlbjsgaW5mb3JtYXRpb24gb24gRmFtMUEgc2ltcGx5IHdhc24ndCBhdmFp
bGFibGUgYXQgdGhlIHRpbWUpLg0KPg0KDQpJIHdpbGwgY2hhbmdlIGl0IHRvICJFeHBhbmQgY29y
ZSBmcmVxdWVuY3kgY2FsY3VsYXRpb24gZm9yIEFNRCBGYW1pbHkgMUFoIENQVXMiLCBvciBhbnkg
YmV0dGVyIHN1Z2dlc3Rpb24/DQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2FtZC5jDQo+
ID4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYw0KPiA+IEBAIC01NzAsMTIgKzU3MywzNSBA
QCBzdGF0aWMgdm9pZCBhbWRfZ2V0X3RvcG9sb2d5KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDoNCj4gPiBjLT5jcHVfY29yZV9pZCk7ICB9DQo+ID4NCj4gPiArc3RhdGljIHVpbnQ2NF90
IGFtZF9wYXJzZV9mcmVxKHVuc2lnbmVkIGNoYXIgYywgdWludDY0X3QgdmFsdWUpDQo+DQo+IENv
bnNpZGVyaW5nIGhvdyBpdCdzIHVzZWQsIGRvZXMgInZhbHVlIiBuZWVkIHRvIGJlIGFueSB3aWRl
ciB0aGFuIHVuc2lnbmVkIGludD8NCj4gV2hhdCBhYm91dCB0aGUgcmV0dXJuIHR5cGU/DQo+DQoN
ClZhbHVlIGlzIHRoZSB2YWx1ZSBvZiA2NGJpdCBQc3RhdGVEZWYgTVNSLCBhbHRob3VnaCB3ZSBh
cmUgb25seSB1c2luZyB0aGUgbG93ZXIgMzJiaXQgdG8gY2FsY3VsYXRlIGZyZXF1ZW5jeQ0KTWF5
YmUgaXRzIGJldHRlciB0byBsZWF2ZSBpdCBhcyB1aW50NjRfdCA/DQpJJ2xsIGNoYW5nZSB0aGUg
cmV0dXJuIHR5cGUgdG8gdW5zaWduZWQgaW50LCBhbmQgZG8gdGhlIGZvbGxvd2luZyBjaGVjayBh
bnlob3cNCiAgICAgICAgI2RlZmluZSBJTlZBTF9GUkVRX01IWiAgKH4odW5zaWduZWQgaW50KTAp
DQogICAgICAgIGlmICggZnJlcSA+PSBVSU5UX01BWCApDQogICAgICAgICAgICAgICAgcmV0dXJu
IElOVkFMX0ZSRVFfTUhaOw0KICAgICAgICBlbHNlDQogICAgICAgICAgICAgICAgcmV0dXJuICh1
bnNpZ25lZCBpbnQpIGZyZXE7DQoNCj4gSSBhbHNvIHRoaW5rIHRoZSBmaXJzdCBhcmd1bWVudCB3
b3VsZCBiZXR0ZXIgYmUgdW5zaWduZWQgaW50LCBhbmQgd291bGQgYmV0dGVyIGJlDQo+IG5hbWVk
IGUuZy4gImZhbWlseSIuDQo+DQoNClVuZGVyc3Rvb2QNCg0KPiBKYW4NCg==

