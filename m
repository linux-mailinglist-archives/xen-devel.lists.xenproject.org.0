Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668EBABEA77
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 05:33:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991390.1375264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHaC8-00050t-Tt; Wed, 21 May 2025 03:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991390.1375264; Wed, 21 May 2025 03:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHaC8-0004yV-Q3; Wed, 21 May 2025 03:32:40 +0000
Received: by outflank-mailman (input) for mailman id 991390;
 Wed, 21 May 2025 03:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfG4=YF=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uHaC7-0004yP-3r
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 03:32:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2418::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be388bf-35f4-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 05:32:35 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH1PR12MB9573.namprd12.prod.outlook.com (2603:10b6:610:2ae::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Wed, 21 May 2025 03:32:31 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 03:32:31 +0000
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
X-Inumbo-ID: 3be388bf-35f4-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PG3LUrsj9iPy+C+UBZAqCKMkctLJgLhgmQZbSYyR+rj/70jhGMKyeG3uASGFvUC+UWXPlXyR7nKFVtpE8Fxsx67S+sgbSjbOV2UHhnoPm3oF6zwZWwtoD1lBm2LZ8JgQRPbnVLcU5VxclyLcRCXsZGepg0WO7rc1aTFUPGxJEwO6m8rDttj3+D+TLC8Cpjyen9aohU23JaLC/zJyT2yaIrgXJHUne10amCkSMuHWCL91b9d8LZI813VzWyhO+aGqieQS8UMXJRBM3HhVNHDJIKI3oWOkkA41IFObhNlVh8JhzahlFjlFRhM7T+pIr9O9ItaPguQKfa8Q9uy5nA+Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6lgO1+ItVCy56iWST09fh0O5R8yfiodxM9VPtYNz9s=;
 b=AnmVX0CMrqXjaUb6CJHZOplxlDAHqCN0u/EEwRs/WFsabhZb61S+jyPSrx0t2arCw8HAJ2LfoWcBHF/JpsWkIhCCJy8UkmpwRovjtgexph84wsbfL5wkT9b8+yFEBKleflJk2DT/tPPYG7XUICqZgcZlh9oEYg8vRc1U+ybYhpKgXh8MoiWaKtQ7AuGFe7b7UVw351yXXO7lP2cEkdXOb8qAlo6AM0xvC6dh4KzxMPA9o7nB9v/M1a4XKTxlmB+sOly7QvGJjZMqSibgZI69za+DS6JJGlXX/7bp+YHrMhwerRUbX0BpCS0Jnfuc6R3edNnAT40IMmbE9BoJPc8iTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6lgO1+ItVCy56iWST09fh0O5R8yfiodxM9VPtYNz9s=;
 b=2BlsN4/oamMQkaoAthJWzL0MvNx12IRzwXXUrlXfYECWHNMUzBhxDonKkP6CT+PpEvAlSCtZNydkdH21bBRWM2Ltr6tif6AuM1HKUgAtfegvWmo0+I1jXMohQtjCUmzQjmPRQykzU/3u5zwDOvIAzoZfgnzWi2ti4YStrRmO7Uo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 01/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Topic: [PATCH v3 01/20] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Thread-Index: AQHbspBJQJlxlUqSyEmw7elTsZuHSrO8YLMAgCA1fRA=
Date: Wed, 21 May 2025 03:32:30 +0000
Message-ID:
 <DM4PR12MB8451466F13BBB48800612771E19EA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
 <20250421073723.3863060-2-Penny.Zheng@amd.com>
 <7e16adfb-21d7-48e1-ab71-b66efa9553df@suse.com>
In-Reply-To: <7e16adfb-21d7-48e1-ab71-b66efa9553df@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=7daf3202-ed3d-47d7-a1a5-686d8ec9b759;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-21T03:32:21Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH1PR12MB9573:EE_
x-ms-office365-filtering-correlation-id: 1d9404f3-f2ae-41da-a02b-08dd98181e28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WW1DcFA0bUdqWWpGZEZ1YkZES3NHREZoL0RlRUxjU0ZHdFJsbjEyTlVGV3d4?=
 =?utf-8?B?R04zNTV5MzNjWk5yK3FQMDdjbEVmNi9nUmhsbnlIWnljSG5RREVKbkxld2RR?=
 =?utf-8?B?M2h0S2hZY09WWGZYbzJwVFVpUnQydXJOTnpvUkYzOE5PUDF1MTJlTXFVZUZo?=
 =?utf-8?B?U09NdUN1ZzBsMUhrV2FHb3YyTWlnbWs3ckY2UEMxVUdNVWZlVFhZZ3NFM3FO?=
 =?utf-8?B?MWk4RWZBZU1FbXlPSjZzUGxOejl0ZmxkZnNneTJqbzViK2hzWEltTVRVeDZT?=
 =?utf-8?B?ekhCQjN6WGZraEFKZE5FNzZPMWVRRWZCYklBd3FNK3FMN2RZVGVESE5JTXAr?=
 =?utf-8?B?c3RkV2Y4dVIzQ2Y2QXg3VE9IVXlrZGVkdk8vSEJ6cUE0RDhDc1JkV2RnTnJ2?=
 =?utf-8?B?d2R0NjI0SnE4VlZRTk9OVlpJY3c1cUNIV1VoV2U1RjNZWmV2VmFCd0pVcGMz?=
 =?utf-8?B?VGFaU0lKZ1V0bU9VYUY5QzdqNDdXSHRudkFjQlVROGxwUkNVd1gvU0F5enY2?=
 =?utf-8?B?aTk3L1l3WFJZVUxncDA2RDYyaEQzMFU5WHlUZmdncHhBajJCR2t6WDV5dDAv?=
 =?utf-8?B?d1lveTF1ZzV5UzJ4N1poeHBRYktaN1FJejMzWExUalpjeTVpb2krQksybTB5?=
 =?utf-8?B?cmtoL21HeXNLRmVIT0ZaUXl1SGhCbGZ3RU13SjJYNVg2SnZLSTVYRFJFSmt5?=
 =?utf-8?B?Y0laSVhUcERRUnB2eC9CSlNIWUVnVkFlUDNZOTV1NDlqTWhNQ09LYWt3dXBX?=
 =?utf-8?B?RWJQbWwrdDd4TWxyU1lvcXhMYXJ4UldiejBTeFdFK0k3SnVWdHZSLzZDbGVQ?=
 =?utf-8?B?d0pEODQ1b3ZKUGdwN28wMWlkN25rbGF2NTVMOXZ6bVhNeDJ5SUNLOVJ4bmd2?=
 =?utf-8?B?MkMyNG1XdjlSN0xrYUdEOGtoeW5jZnJIN3prTit0OE1WbG9LajA2bERLNkVy?=
 =?utf-8?B?WnVTOW5ONzM5bXdHZmw4YUM5RWF5NExuZVJ2ZDl0Y1BNUUZ2RVFxeXZLUlFy?=
 =?utf-8?B?UWpQQTVSSWhQYVA5V3EzQS9qUTBzMWY3ajlvb2JtQnVWZUxYMTRLdmc5b01Q?=
 =?utf-8?B?VGkvMHlnajNMaHYrWmZXWGp0Zzd3NmJ6QTVEdi9aNFl3K3N0cW1takVDUmdN?=
 =?utf-8?B?bVNJZVlvWmxVKzYzRU8zSzc4dlpGTFJ0N3ZoZkc3OUY4WW16bnp2TkNsV1VL?=
 =?utf-8?B?OGo3V1V2aU5saU5GcHJiMjRNd3BBZ2tYMWY1L1dpSGRXdXVWdmFzdTRkdjZn?=
 =?utf-8?B?aVBCcTUvcEpCMHVkS2Fab2dqbVA2YXFtRysvbG8yRVpUeUVVUE9RTS9RSFBp?=
 =?utf-8?B?N1VaMXBZVkwyM042SWgrSFE3cGR4aTU1T0MrdWVqUEM5YkpwRWRCZ1owT0Fp?=
 =?utf-8?B?SDRxa2tET1JZS1ErSmZObHZ5N3poTEV3dTlaNW1KUUlRenVrRG1KM2p2Y3V0?=
 =?utf-8?B?WGs2amd0NTdhRDAwZGg3U2FadmNQbHJnU1paeTVTbi9KQkc2Mm83cklEd0h2?=
 =?utf-8?B?Z1V5WDczTFZQbVRQYVhrMXEySDRUUlBlbmRwaFUvbUYvYjFQMkJobDlXbzQ1?=
 =?utf-8?B?dVRMTjFzWmFZTDNralB6blNKaXlGQzdhcVNIL011ZlJBV2lqb2FsQkYrelpv?=
 =?utf-8?B?VzZaYmx2RFVISUlPUVpoYWVwUmhvbkVLM1VsN08rMTdNNVpFRTYzanQ5V29H?=
 =?utf-8?B?NTBwVW1oRDI4dHBiOWdOSXpaWWJ1aDVTaGJjTU5VRmVpMTIrRkJ1dnlmNW9r?=
 =?utf-8?B?SEl4UUU5ZC9yNFNhT2pNdWdTOTAydS9wVDdDVzEySnhqUWp1NDAxOHlQT1Uz?=
 =?utf-8?B?aVhMUldPckJBNUlkTE5iS2pzclJkU3pNVGpldVRMUFF0OXhCM1M4NjZnRVBI?=
 =?utf-8?B?SzI3QkhIbnZ3cUFuMHlyZEx4enQwekVnRFltd2J0UDFzYlZncUUrOEdBMEts?=
 =?utf-8?B?K3FKdDJNOHhLUEw1bUVtWUw3dTZRNGJJOHNObHM1MHovQlJka01KNGFRY2ln?=
 =?utf-8?Q?Mjj519O754VC/WyV6kbvVnbZgAvG+E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXM4Rkt2K1h2Qko3anJDSWZXa3BKcXlPeDlyT09haGw0WVNIU005Um81dUVW?=
 =?utf-8?B?eGtNY0d6Rm43Q3ZrTi9hSzEvWDlwYUwzOTJtZmNac2ljZnZPZUtORkZPSDdk?=
 =?utf-8?B?Tnk5L2hnVjA3T2tEbVZGQ01sV01tcm1TWXZ4THdoa0ppaFNnN2Zvd0R6a0V1?=
 =?utf-8?B?SHZoeVBGdU5MNHVMc0xSS09pNTFFZHEwOVloTllHZ1NzQmpPZXVIWlhyU1Zh?=
 =?utf-8?B?MW16SW4ra2hWUkJ5OFJLK1p3dzdheUgzUGxCc3UvQ2ZtdEpuYlpOU0wzT1pu?=
 =?utf-8?B?YS9CdFdVTDNrZmEwbFlVQ2M0dm4vMFdsRE1SM3AyeWlqQWV5cFZqbnQvZGxo?=
 =?utf-8?B?Z0g2d3NVbC9Ba3JYWDNWN043VytFY0hxVU9pUFBZRyswMG1FL1FPanY2dDhj?=
 =?utf-8?B?MloyNE4wMWdxLzFSUmQzWjVtVGV1ZEpydjdzbm5jOWF2SEZDeDNLeEhnVzhi?=
 =?utf-8?B?R2pnUjhRUXl2M05tU1NhU2hSSU9rbkQzOFIzMFVBbDVaZ084UlFPakFNeDJ2?=
 =?utf-8?B?Y2ZMUUtXZzBRdEVldmlpK3VYQjNlWjJldDIxM1plRjdKcFJpNFVoMTNYekJr?=
 =?utf-8?B?VWp5OWRqQmdPajRrdU1ZMjVjUnNETDE1V2lsL1ZRMXJMRGlxQ3R3aUdMRDlz?=
 =?utf-8?B?bmtZY3EwSnp2MVZ2RUpzQ2pwaDVTNHlVY1R4bWNzQVlEMjF6clNid3Q3R3Nk?=
 =?utf-8?B?SUJRUC9GQ0cyOWw0YUpLWHZNaFB3TXNkRlRDYjcrQmhINlFDWlFRazJTdEJh?=
 =?utf-8?B?UTVSRUZ5VVBpVjdrZGdxTktpa01jcFY3WFhWc21wMk9EUWZGOUN6dDRPM3U2?=
 =?utf-8?B?UTJTbGc2S2hacjA0dEhTSCtRdllZTEd1bmp4YUFlQVJva2RxOWxsR2tGKzRN?=
 =?utf-8?B?TUxYUE9tUU5SSkt4eG1tVHJ6NnhlRG5TTUZtbitpdVBFa1lmZ3MrenhXTTdo?=
 =?utf-8?B?WjNGZ0lOcng5UXVjTXpzMXJYQ1V6NVJIay9iNFQ1ZDg3ZGp3bjB2R05kY0Ux?=
 =?utf-8?B?NmRBUUpLMzRNZzVYQzcvY1hFRXl0Nm1uaXBlckE4NktibmkycjZaTUpzejJC?=
 =?utf-8?B?enR4TFJ6S3d2RDRsMUorbTVQMldZYzNUZHZPSVRzMmFkNC9vdUxzaGpodVdJ?=
 =?utf-8?B?TTFHVHovRjFSNVpUSStKRnN0bmJZRDZPWEV0UlNKd3RKcS9CNmxRM2dieUhs?=
 =?utf-8?B?MGF4QXdvTnJpakVDUjk5bHhnSHlLdGp5ZGQxcldDRWkreVozWmZicG1zSW5t?=
 =?utf-8?B?UE5LSEx3OG0vUjVlR1FTSzNnQnUvV09SUmhkSzJueGo0YmprdVI0aFFybVVo?=
 =?utf-8?B?eER0aTVFWnpDcjlZenBQREh2WGlWTlJySk5LQXl3V3p2VklBUDQrcFB3ZEtQ?=
 =?utf-8?B?T295UGc2YnZrOThkWmxYN1FMNFdQVjdmS2lVaGQrMmRzc0ZGOUlLRjBsaDdk?=
 =?utf-8?B?L3N6YnY2VDNIbUI2VDdrRlNFa0xBL0FsdzFWaGIvUEdyczBSWHVTUXhiY2JC?=
 =?utf-8?B?c0tpT0IyaVlENTRrREswSHdTNVJXamZ2VEJDMHRDVDRTejRJekdjYVJ1dmRU?=
 =?utf-8?B?SkFRMGZ5K09RdnZKb0Z2b3pna2s4blBDUUxjUU5pYUtJV0lHUU1SanpyZ2pw?=
 =?utf-8?B?QUhrWU1SUW9rNmpjNWdXQUoybVY3OE0vZEtWVnhVUll3MjNGU1MxQ3dWZTIr?=
 =?utf-8?B?N0xyY3hwUUNpU2pWSEtaTGVrWU5ZWUVZZjJHbjcxVnYwZmhQQ1VhYkNnbTZJ?=
 =?utf-8?B?amhab2JneE5ncW9veHpVT1dzamt2T1c0cEJyMjJjVXVhNU9GNm1IcUN5VFR3?=
 =?utf-8?B?QjJlM1pQZDlPbXVXamVGOC9oMzlHZUtEdmltUHpTclV6WXFnNUVRN3NsaUx0?=
 =?utf-8?B?eDI5RHJCZ2FUbklZOE5vWmtRdnEvZ3FNUGM2OHBVUkRmcjkwSktxMmQ1VDN2?=
 =?utf-8?B?UEk3Q1hHVVQ0NTZxU2VXUFkraXFZcW5hWmNYOGhxMk4yWkxHcW55dTJLelMy?=
 =?utf-8?B?UUdlN256dnFlNmk1RmR3R3hIYnQzbjRFSzB3YVdqbDhmaTJOY0VlOFppbWRP?=
 =?utf-8?B?WEtLT0RmTFNtdGw0UHJPQm02VWlDNE53USt2S1lzWXRieUZqeU5Nb3loZUtT?=
 =?utf-8?Q?WUfc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9404f3-f2ae-41da-a02b-08dd98181e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 03:32:30.8815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwMq61KmuXXq4IRgZzCX9L4tCHgV+P657hGNLHOZvic8PhcFmIpuSgGl21GhcPFJZDP+lipd9HgU0/nTNNbNeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9573

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMzAsIDIw
MjUgMTE6MTcgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4g
Q2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBP
cnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwMS8yMF0geGVuL3g4NjogcmVtb3ZlICJkZXBlbmRzDQo+IG9uICFQVl9TSElNX0VYQ0xV
U0lWRSINCj4NCj4gT24gMjEuMDQuMjAyNSAwOTozNywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
UmVtb3ZlIGFsbCAiZGVwZW5kcyBvbiAhUFZfU0hJTV9FWENMVVNJVkUiIChhbHNvIHRoZSBmdW5j
dGlvbmFsbHkNCj4gPiBlcXVpdmFsZW50ICJpZiAhLi4uIikgaW4gS2NvbmZpZyBmaWxlLCBzaW5j
ZSBuZWdhdGl2ZSBkZXBlbmRhbmN5IHdpbGwNCj4gPiBiYWRseSBhZmZlY3QgYWxseWVzY29uZmln
Lg0KPiA+IFRoaXMgY29tbWl0IGlzIGJhc2VkIG9uICJ4ODY6IHByb3ZpZGUgYW4gaW52ZXJ0ZWQg
S2NvbmZpZyBjb250cm9sIGZvcg0KPiA+IHNoaW0tZXhjbHVzaXZlIG1vZGUiWzFdDQo+DQo+IFJl
Y2FsbCBtZSBhc2tpbmcgdG8gYXZvaWQgd29yZGluZyBsaWtlICJUaGlzIGNvbW1pdCIgaW4gY29t
bWl0IG1lc3NhZ2VzPw0KPiBBbHNvIHBlcnNvbmFsbHkgSSBjb25zaWRlciAiaXMgYmFzZWQgb24i
IGFtYmlndW91czogSXQgY291bGQgYWxzbyBtZWFuIHRoZSBvbmUgaGVyZQ0KPiBuZWVkcyB0byBn
byBvbiB0b3Agb2YgdGhhdCBvdGhlciBvbmUuIEl0J3Mgbm90IGVudGlyZWx5IGNsZWFyIHRvIG1l
IHdoYXQga2luZCBvZg0KPiAocmVsZXZhbnQpIGluZm9ybWF0aW9uIHlvdSdyZSB0cnlpbmcgdG8g
Y29udmV5IHdpdGggdGhpcyBzZW50ZW5jZS4gU3VyZWx5IHlvdSBkaWRuJ3QNCj4gcmVhbGx5IG5l
ZWQgdG8gZXZlbiBsb29rIGF0IHRoYXQgcGF0Y2ggb2YgbWluZSB0byBmaW5kIGFsbCB0aGUgIVBW
X1NISU1fRVhDTFVTSVZFOw0KPiB0aGF0J3MgYSBtYXR0ZXIgb2YgYSBzaW1wbHkgZ3JlcC4NCj4N
Cj4gPiAtLS0NCj4gPiAgeGVuL2FyY2gveDg2L0tjb25maWcgICAgICB8IDQgLS0tLQ0KPiA+ICB4
ZW4vYXJjaC94ODYvaHZtL0tjb25maWcgIHwgMSAtDQo+ID4gIHhlbi9kcml2ZXJzL3ZpZGVvL0tj
b25maWcgfCA0ICsrLS0NCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQo+DQo+IFdpdGggdGhlIGNoYW5nZXMgaGVyZSwgd2hhdCBkb2VzIHRoaXMg
bWVhbiBmb3IgdGhlIGluLXRyZWUgc2hpbSBidWlsZCwgb3IgYW55IG90aGVycw0KPiB1c2luZyB4
ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnIGFzIHRoZSBiYXNpcz8gWW91IGFy
ZW4ndCBhbHRlcmluZyB0aGF0DQo+IGZpbGUsIHNvIEkgZXhwZWN0IHRoZSBiaW5hcnkgcHJvZHVj
ZWQgd2lsbCBjaGFuZ2Ugc2lnbmlmaWNhbnRseSAod2hlbiBpdCBzaG91bGRuJ3QsDQo+IHVubGVz
cyBleHBsaWNpdGx5IHN0YXRlZCBvdGhlcndpc2UgaW4gdGhlIGRlc2NyaXB0aW9uLCB3aGljaCBt
YXkgYmUgd2FycmFudGVkIGZvcg0KPiBTSEFET1dfUEFHSU5HKS4NCj4NCg0KWWVzLCBJJ3ZlIG1p
c3NlZCB0aGUgY2hhbmdlcyBpbiBkZWZjb25maWcNCkknbGwgZXhwbGljaXRseSBzdGF0ZSBhYm92
ZSBvcHRpb25zIGluIHhlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcNCg0KRm9y
IFNIQURPV19QQUdJTkcgYW5kIFRCT09ULCBtYXliZSB3ZSBzaGFsbCBhZGQgYmFjayBkZWZhdWx0
IHksIG90aGVyd2lzZSB4ODZfNjRfZGVmY29uZmlnDQp3aWxsIGNoYW5nZS4uLg0KDQo+IEphbg0K

