Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BBDAEDC5E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 14:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029101.1402838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWDLD-0006Vv-Ve; Mon, 30 Jun 2025 12:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029101.1402838; Mon, 30 Jun 2025 12:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWDLD-0006So-Sf; Mon, 30 Jun 2025 12:10:31 +0000
Received: by outflank-mailman (input) for mailman id 1029101;
 Mon, 30 Jun 2025 12:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRSJ=ZN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uWDLC-0006Si-0W
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 12:10:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:200a::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 347309b0-55ab-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 14:10:27 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS5PPFF2923D4C1.namprd12.prod.outlook.com (2603:10b6:f:fc00::669)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 30 Jun
 2025 12:10:23 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 12:10:22 +0000
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
X-Inumbo-ID: 347309b0-55ab-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+iMugCrjj/4pIzva11912GB3RgRgI3eWR1k7BQmmc8g4gvHHk2lx2EWUB9z61mceON7yX0h+9kRgmbmbbPdze/qhpP7KauJS+4akvxDuEx7wLAZOKws2lzY4dllSDZcCyYAIYS8H/gmv1Vn8O+Ny7ULNWqZMY6BdXjljL6gf0YSZflVUVo8uj04L1uKPA4b7HDhpj473PvtUP5Ew/LN3g5DYRJvN4VgltMhuFbSYUhL9ocQsF+T0cRyMCXaKXHasnGdC9Tkk0Li44vcRnPmV4RoKhMnJse4EqiLQDREGYCY2ZTc/dNJZDFRHkke0jEVuAnC6I9/7C2eLnxUTpwaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlzqaeUyAWy5W3cUW9IzyPn7WSKQaGXp3YwzvABgZjE=;
 b=DslfOJ2LdwD8AUC/hxK76uRH3maBUFtycCY0Ik2At5cpPtkERHykG/xhMAX2w9qmNsfVibRx9uQCK/afrMyx6T4sTtv04VFjbvzbpbMfm+SoDscSpKwlwPRGzegDlbKNwUI0pG1vRmuJjjMW3gAc0b/UtqKb0UEgIzKdCfVfNGyfp/GYjlTcJ5zM1JiAjaFFrqgQWDBqsdFJAbtQt83XnwBZdfH2G8vbZVmpi+Osbmhr9xiLYg+R1hDfTuWxfmA0U0aanoLgBxp/uNUUFbndvObxTLdcSK8pFmybaA3qRhfQMSlZ7WrfAZXusgj/XzRmdmKWXk1FBwe0z4ctjXxxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlzqaeUyAWy5W3cUW9IzyPn7WSKQaGXp3YwzvABgZjE=;
 b=HxdI2gwb0zmPo+o4pQh/4N/hc7y8aqrNSMjW2SpphnJaFNjmob+ZwxKGKly7nI+lslw23AIqTmvwquauAvgn5Xj1NjSS5PJFLcYjZRFsn/8raBx0jltxisskCGOzKNcATijL6QXUw/R5hdyFGDHnT8VJb/qn5Te8YiRKXd4a/Ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ff2a5885-3dc4-4226-9c7e-a23c5cd52a1d@amd.com>
Date: Mon, 30 Jun 2025 14:10:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm/mpu: Find MPU region by range
To: Hari Limaye <Hari.Limaye@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <e4d628ea02af087c4a299de0b16c75a9e0c6c17f.1750411205.git.hari.limaye@arm.com>
 <bdbf558e-c574-47b9-86fa-b9e54a759f9d@amd.com>
 <AS2PR08MB87459E5BFB3D0CF492FF6E47E246A@AS2PR08MB8745.eurprd08.prod.outlook.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <AS2PR08MB87459E5BFB3D0CF492FF6E47E246A@AS2PR08MB8745.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0216.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS5PPFF2923D4C1:EE_
X-MS-Office365-Filtering-Correlation-Id: f3db176c-3915-40dc-3bc4-08ddb7cf16c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU1sbFp3L0dUbDNIcG05Nm5rc1VKUjVkT21IMkhVdTYwVXNGdUZ3VXg5enFT?=
 =?utf-8?B?SjdMT3dkdWRReFUrNE5QakVxUVl6SFdVa3dDa3poNkt4UkhsZWU4NHozK0pn?=
 =?utf-8?B?WkF4ZDV4RFl4aFgvVS9pSjYvRDdPUEJ0aWhWWmtSRlpXYlpqb09FMWRKMW9J?=
 =?utf-8?B?VFZpYmpEbzhLS0NoSUwvNUE3aHZ6SGNvUXlPcXFZRlB5QTRnNitoZmNYSFJy?=
 =?utf-8?B?bWQ0b0Y2OG1mVi9BRUFIaUFKRDhzcHVoVzR1UE4zVGxPSEdpNVJOLzMxRFdL?=
 =?utf-8?B?TWp0MlRiTkNac090cUxaZzFyTUppdWVTcEJJd1pmV2hKSzQyV3NDR2FpcGNv?=
 =?utf-8?B?Q2xkK3VyL1g5ZkVkMmhBT1N0c0pYWUhFMkVoVVBXVnFJUjhueWRkbEJ3TlRN?=
 =?utf-8?B?U010Wjh6dTRZb2RRVDBYSWdvKzVCZFFyZGVpTTJzYVVQSGRKdmpLaWdpQWpt?=
 =?utf-8?B?TUg1KzdRODV1cXk2UHRIcUFWeTlGc2VqQTM2bXUyYXpKUUlJNzdPMDAxRmI1?=
 =?utf-8?B?VkFNbFNuRFJBVS9wSnJPVEVsdnBCc3VPRDlMVHo2STVOREZmd1ZXQkg2dSth?=
 =?utf-8?B?VWhTRE5ZVTRlMHpiRHQ5NXNvUDVlQTJIdnBPcWNEU3hGVGpsZFBCTDROeFMw?=
 =?utf-8?B?OHlPYmxnUlJ4SlVIYlhHMytaTU5IcjhJZnNrck5zZFVUZXZrSTd6NFgzMnV5?=
 =?utf-8?B?ekdNazYzUDU4d1hSNTkraUVOSVB4b3BWMFgwbzRwZDdjRXMvbnh4U1VaWHFW?=
 =?utf-8?B?b21BSW1MNTFpV0lmRHd5dzd5Zm81RytFQ3V4bmZZeVNjamxzQTZKaUM4Ukln?=
 =?utf-8?B?MWlRZjNtOVJhMVk1dXA4eUN2Z3NpbWJ1alFNaFNpV000OHlNS2pTY28yWkhx?=
 =?utf-8?B?aXNlT3lZNFc5UjBQY0FxSW9HRVQ0dkYwM0ZzWURWVlJVa3U1MjVQckpsWmxX?=
 =?utf-8?B?US8rcG9oRlR3YlFPc0R4LzlKeDJza09BWERab0J6MXM2UDY1U0hkU05BQndH?=
 =?utf-8?B?cDZWZ2ZhcHNhSkd0a0hEeWxESG9zOENhNFl1N0lCK3psV0FzdkZQWWY4ZXBI?=
 =?utf-8?B?TGtIT08vVmNoM3ZlNWlwZTZ5bGc0NVRHVDJsY1JSd2VSbW04WXZsSEpxWkFk?=
 =?utf-8?B?QTYvY24wUERTTm1YeVZuYmhVSVZ2Y0tHMCs0aVFBdDVid3pZMTVtb1FsQUxJ?=
 =?utf-8?B?eWJtRFY1c2lsV01VZnhkVC9RVC9KdFkvUjltOEg0b3dLeEZ0a0wwU2NtQ0t5?=
 =?utf-8?B?VVNINzNsdkRuajlYTHV5Yjg2c1gvVjBNdHZETWozRWxqU3o2KzVESHdsTmlN?=
 =?utf-8?B?T2pCVmQzQnNjSjVVSzZwLzlRd2xCUlJLWUV0TkxrN1djWW5vTVBUcnREK3hn?=
 =?utf-8?B?WnFmZXVCbVdUZndtbG56ejl6NzJ1blgvQkNxeDRIUm9FcHhuaWkwTjRXc1Jl?=
 =?utf-8?B?eURxZUFaU1FSR1NsSE82K2k5Nm56SzdVT2llYk9yamFqTTVYQkcwa0l4Z0hi?=
 =?utf-8?B?dVd6TlhyMm43MWZobVZxQTNOQUF1LzlML25VYjA2cVpBM2w5cm5zS3ZkMGp2?=
 =?utf-8?B?eVZUdnp2akg4MGFDYU03STdQclIxWENJSE4xRnFXYThReE1wSnRscXR3Zzly?=
 =?utf-8?B?VFNmRmo3L1diVURkQlVSY3lyRjY5akE1YkJOOGJCR2w1dUJwckNMbUNzdWZL?=
 =?utf-8?B?OTJtR0RuUUdUbFBvUmozN0x6REIyL2JTcDRpNjRUbk1EMjZDVWdJSFhPLzMv?=
 =?utf-8?B?Q3lGa25ObFNOcXk2eUlsa2hKcENFa1B0WSttWnNmYy9PNUVkVzBTZ0x4ZEtx?=
 =?utf-8?B?eVZFdFY1VnVpa3M5clYzMHFZbGJsWDJjTXIwZHNLOTRKM0NqaTNVejdURVdt?=
 =?utf-8?B?azFuL2EveS90QU5ESStPWmZrQk1KMzA0QU9qckVtaVgyVXgyUlBCNWQwSk5l?=
 =?utf-8?Q?aSRudZG8y5Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVU1QVZOdFNXTVpPVkhVRkNYNUdsVG1jVlBHVEc0aG1jTVJwdWI1c3RGMmt1?=
 =?utf-8?B?N0ZlWE9hMnd3V28zREdENmkzVW5oRHFxWjBBdVlzL1NVMW5rZjdlWlR6TDRE?=
 =?utf-8?B?RmlPUjRndmY2eU1MRWw1NXNsenJ6dmlUZDVMY3NoNHdzMmlaU2xNOVBKQlhQ?=
 =?utf-8?B?Uk5DQmNoVGJETmVpZjMwN1BmTWlLbDM4VjFZWnJSQitSZTloU2VzSS9UdjhO?=
 =?utf-8?B?YWhzSTNPekNZdk5Fc0luRHVwSkZWa29rNmxXWDdiYjM1bm5tc3JuUGN5cTZ2?=
 =?utf-8?B?VldPdDJvUVh0elBpRnJRZFY1V3BmbFIrV1VqN0h3NGIxcTU4SHBMeDVWQmNq?=
 =?utf-8?B?aHZXYVhidVd3TTJBT0J5TEVxaDM4VWJURWJTSlBQVUNyTHc5elFSN0hiQVF6?=
 =?utf-8?B?bjFBWjM3NnY1cW1qU2VlcjhYZ0czMkZkR0hvbTJ5d1RiczFkQnYyeFFieWVR?=
 =?utf-8?B?QXNORTZRSzVUMXRJRDFmaTBmMTNBeUl2dTgrWEJ4amJDUzArSkw3Ympram44?=
 =?utf-8?B?bkM2RDg2MHdNR0Vpb1ZMbCsyNHIyQ3JlQ1BxVkU1enV4SlM0MTRhL2o2anRW?=
 =?utf-8?B?bmNLamlqYS9LQ0o0WEVpMVBqVEtwSFFIMHpRUDZPVDE1R1dxY1QrRDd6MnZ4?=
 =?utf-8?B?T3diUVhMWVNYeGRxWFhFNWVBbmo0bnVqL1h3a0QvTWUyYjN5SzY0bCt1eWhr?=
 =?utf-8?B?VkhyZlQ1VWcrd0cwN0lqYnQ0NHk3dm9LSUdlNTNRcEtjNUtrUGFpYTNlc29n?=
 =?utf-8?B?NW4yemt0eVFpRmJYaytMTld2Vng0TkYrK0lkRjIvcDI5bTA2QUQ4SllUczM4?=
 =?utf-8?B?bDJOcTd4UnljcWpXRzFHN1ZQc0ZyUThWUXo5S1VHUERGdGdSL3lTbEZISGo3?=
 =?utf-8?B?c0pBUUpaYUxuaHJtQ0ZHRXJuQk9kbXdVNlZDK3ZCYkV0MDRrdnFNT2tmZ3Bp?=
 =?utf-8?B?NnlvTGlKZGRsU1laTzlrYzNNcU9ocGFEOS9LbWMrVlkyeGN5aWc3aHgyZTdp?=
 =?utf-8?B?aXFWU0MvTjlhb3hmUk9rOElmS1Z2c0paV3pQVW16TlZqRUt4b0VNeCtlcGUw?=
 =?utf-8?B?clg2eXBxSUlTMlNrWVF6TElWbmIwVGtwdVlYaUVJODNYT0pWR0lXbG81Ymc5?=
 =?utf-8?B?cGlZN1JSbW1SZzY1MEN5M3o4eHArdXdvRXpYMFZacEJDdVk4R3hHM2tKTWo1?=
 =?utf-8?B?TUVmZVlyZEpYY2NNbFZnSFo2Z1NIam16T2ZmVFhoSEJvd1Y5bkVpVUx1RHVu?=
 =?utf-8?B?dmRwaTBDQ1QzRWZ0TUk4enJMc0dwU2JyaUJWck5QR3JxenpNM0JLdUFkS0lt?=
 =?utf-8?B?Q09JWUtNWjJVeGg3eTQ2V2JhcHBBdjVQRW02VWxwUm0vd1JnZzJ3MGphUXZ3?=
 =?utf-8?B?eW82bUpsQVkxeXZJUnJDU3dTRTEvWlM4MVJidTh0L0wwNmZGTENRM2NHVUJr?=
 =?utf-8?B?d1k1VDhTaURJNkdzYmJ2WlJnenFlUzlzTVR4YngvaGhsaGl4dFJzb3Z0dkVa?=
 =?utf-8?B?T1NoR1NOMTk2b1g4dEMrdFZzeVdjcjdZL1VmUG9RY1IrTitTMGgyTW94cGFp?=
 =?utf-8?B?Q1F6TzY4TEFHMmRmTzF1eVFWRi9tckJQRnlVdlRPNzJXNDFETi9OMnJ2bldh?=
 =?utf-8?B?RXVNeVFicXlBUjhjcWZlN1VQUFVhKzFnbjFLcGxyTVRwV3E3OHlNVEFmSzRn?=
 =?utf-8?B?aWxuT0FhaVhoVzBLNWQxNXpZeWRWZGdVaWlVaWtVdGhYbTlDdW1kTHZEWnlh?=
 =?utf-8?B?K3hPNkdJK1BqMytlTVRlTnJMQUhydlg4bURPNGZHRGY1eVRVTWpvTndIaE1l?=
 =?utf-8?B?OTY4Um5NcWhlTm52c0dmdjZXcnlpc0p1TS9nMnJtbitPRVlxZ1FNRGdYSXY0?=
 =?utf-8?B?Q25qMWJLT09sZUMwNjlEbmUrZTBJM1ZURDNKNk9qSm4xSW0rT2MwSEI2cTRP?=
 =?utf-8?B?RExsODRPd0JibVJVVFBkS1YrdkpsSUREYTlBOUVmMUNtTTV1aU51dytsRjJZ?=
 =?utf-8?B?elF6aElvejdCaHBnYlR2WEtXT2cvUkhjaEpKUk8rNHc4Um5uV3o1aXJxM2pu?=
 =?utf-8?B?TVhWaDlJVUpsL2R5dzB0MUg4N2lIdFhkdVRHMVFTMW1wYnBzeVZZQ29uUFhz?=
 =?utf-8?Q?dE8o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3db176c-3915-40dc-3bc4-08ddb7cf16c4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:10:22.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RPOh2iC9MSSKkE50buv9kYcdILngSpKO60LzXwqVmhl53F1hyNGrCrTp0QxZTQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF2923D4C1



On 30/06/2025 13:45, Hari Limaye wrote:
> Hi Michal,
> 
>  
> 
> Thank you very much for the review.
> 
>  
> 
> I just had a small clarification regarding the following comment:
> 
>>> +
> 
>> +    /* Allow index to be NULL */
> 
>> +    index = index ? index : &_index;
> 
>>If index argument is NULL, why bother setting this internal variable _index?
> 
>  
> 
> This assignment is intended to support `index` as an optional output parameter:
> callers can pass NULL if they only care about the return value. This approach
> avoids repeated `if (index)` checks by aliasing to a local dummy variable upfront.
You don't need multiple if ( index ). Just one at the end of a function by
modifying it to use goto e.g.:

rc = <return_code>;
goto out;

 out:
 if ( index )
	*index = i;

> 
> Would you be happy for me to retain this pattern, renaming the dummy variable to
> make it clearer, e.g.:
> 
> ```
> 
> uint8_t dummy_index;
> 
> index = index ? index : &dummy_index;
> 
> ```
> 
> I would also update the documentation to clarify that index is optional.
This does not address my point about having and setting a variable that may not
be used.
> 
>  
> 
> Alternatively, if you’d prefer to disallow NULL for index and require the caller
> to always provide a valid pointer, I’m happy to change it accordingly.
No, that's not what I had in mind. That said it's up to you to decide how you
want the caller to behave. If you think that obtaining index is not necessary in
all the scenarios, then you should retain your current functionality.

~Michal


