Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGFbC7JmjGkFmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:23:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EFC123D46
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227337.1533680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8J8-0005z3-Ht; Wed, 11 Feb 2026 11:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227337.1533680; Wed, 11 Feb 2026 11:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8J8-0005w7-EJ; Wed, 11 Feb 2026 11:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1227337;
 Wed, 11 Feb 2026 11:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq8J6-0005w1-Ny
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:22:56 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02a83105-073c-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:22:55 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH5PR03MB7886.namprd03.prod.outlook.com (2603:10b6:610:215::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 11:22:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:22:52 +0000
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
X-Inumbo-ID: 02a83105-073c-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+Y2Aus9DfQz3W/uzdIPfzGNQkJ/TmN0oGpDS5kqv5llyv+t029ZoedI4q6Zsy50piKFg36sa6sqTydoclni18Khx2GsY0V1D/jLpnGr/WlSZ6kEf9H5/1fm5yu5Hnh2OeY4WJhpR624QCI/3b/2jIWtB7erF/gXylF9gxTHsG2SlLcxnXkFWRu4bDT2SLJqxmJ959eWIjBA0Dthb+Bn0mNid8mduhxHO8YQdJPciZWpIihfciJVFYPn12Rl/QOFJIs+HGni8jXb8y0mNBMOR+43V95GU1Zi70zExULXyLohSZRPEwYznJekYgIxpJBGzgTdRcdUwIsMPxSmibRt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQZW8Xc8JjdHLtma+EsAndH3CmHFXSp1Ru2UaiqBp0A=;
 b=TWstfIWiP7CeUBINJXq3bTyYet38uLMJuwr5eB+9MhH3e4b3cqBYRE5nMAj7O25z97KDopTM/3v4Ki7/PTO4wkaDqRlirfMrGc4isjQ7YWRKKYJe/mOJ9gLia1wCIXVm6OYsIrfbA6Esr3c+XD23mhzp959umImLQayfn6Dy0GX1+jEMqL1wP7Hn24qiskId97FklTuXkrYloeq5oznkccAiGZHlXMCGBFx4B8eNx6sCTzGR30epj5exCwDCgk5arYvV19orUxHBK44Q6hN7e9n6DwkwxNGrBdvWcoMYQ2C+zx3t3ZhrTuxehcApGh6lZX0pe0aZCJ2u5tOqNESWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQZW8Xc8JjdHLtma+EsAndH3CmHFXSp1Ru2UaiqBp0A=;
 b=TW7EOAIqP6ITQVGe83hF3s5z473zkNza9aw4XnC7RRDFZNci7GFfu3+EfUo5z/d/LD/ZT2MI4U39v4vJTke1uCkQdVfqI4WzCbR14L97qJO9Gk5efAj/dUgFfOpeFmkUn39p0CAJSnokyybUM4oITj3lkDOMfbIXiQjTDehFs08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 Feb 2026 12:22:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/5] xen/x86: always consider '/' as a division in
 assembly
Message-ID: <aYxmiU0ks4Lzrwgs@Mac.lan>
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-2-roger.pau@citrix.com>
 <124efc9a-b4f2-451f-8354-29ee78ac5bd5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <124efc9a-b4f2-451f-8354-29ee78ac5bd5@suse.com>
X-ClientProxiedBy: MA2P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH5PR03MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: e411d73f-5505-42f0-952e-08de695fe521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkNhdW9NNi93eExKSG1lUFdqcUFyWjBZT3ZUS3Z4bTczYldXSEZOVU4raDdS?=
 =?utf-8?B?QjlZeE1GSnFjQk9uSnY2dkhaN0NHN0cxbFB6QTU5ZlUrdWEzTjZIQkdqZlhv?=
 =?utf-8?B?dGdOWGcwZy9BSFEzV3FHUk5FTEc0aEdUUFArODZsSXNGRytUTXdNbHVXMDNT?=
 =?utf-8?B?aCtQSmRCS0sxbGpmMEdCS3BkZGRaanNxMHI1Nm1Say9FazdGRFlnK3NwRU5y?=
 =?utf-8?B?ZjZ2Nlo4YzFEVGM4OGFwV1RUOW9MWC8yb0F2MHlML0dwSC9TY21oczhUVmxr?=
 =?utf-8?B?b2Y0YkFZSWJoclczU3VmMkpoVlE5YmQyTnRYYjQySzdNUUIxR3g1bUVGbSt6?=
 =?utf-8?B?ZGNob0plY1RDNndWUlhveDQ4TVlFVG9kc1JxcThhblR2bzJvTmhmTXZ1RjVR?=
 =?utf-8?B?cDUyS0x5OGU2MVBIVHFJUng4VnYwN3ZDZjdybm5xYUNqTWdTajQzcVphVDVC?=
 =?utf-8?B?YlFJMzlpSW4yK3RLVHMrbnZkSmJWUk00bjhuYXBtamV5aUIwWHRIQnJyeWVX?=
 =?utf-8?B?RVovZ1RIVERJdmxjdEwxaEJGT0VOR3lEd3crcVB2cXg5Q2JyTWhsT2tsQWEz?=
 =?utf-8?B?LzVaaU55NVRmWG9xRk9ZNlYxQ08vMkdnVVdCRXFqYmlQSEFFY2lxWWdka29z?=
 =?utf-8?B?V2hJUzRYWGl6RDZENncyVTZObUk1YVZlVXpmbXpBUFdWNnJwYnc0di95NTFB?=
 =?utf-8?B?c0tmNzhhOFdkOW8veWtuOGFTeVFTZEhndHZkODAwVjNWTTkvRjdMVUJMOFlo?=
 =?utf-8?B?NkMwTjBhUGI4a1h3R2dLUlduYVYxL0RIUWdMNjVUek9ETU4xRVNUcDh4VDlI?=
 =?utf-8?B?cFMvMW9rR2tndHVJY05KMThCeWN2dXRiYkcxR2xIT2JUTGtBOWJ2cDRBVlRL?=
 =?utf-8?B?M1VDNlZDRE40Tk02MDNSTlNLTUFOMGtsK09rOUdkbTcvelNGclNsQnFkV0Jp?=
 =?utf-8?B?TjhqY0RDQlh1L1ZLZlorMG52WjEyK0tRMWw5K24zQUl6TTR0bUxjKzVSNkZ5?=
 =?utf-8?B?MmdyODlha1B6ako5TDJyWUtHSGNHYnBPLzNEZjBLb3FSVFpRN2hZYSt3aHVm?=
 =?utf-8?B?VjBWbzFBdG92ZmNLaDdDM1FVZ0x4OCtjaUdGSis3YUVzeXRxckJqdVhqSloz?=
 =?utf-8?B?SkdRb29FTGt6b2FlcWo1eHVCTXI2YkpFa0NpSUozMEJQWG1PV3ZIUzdGaVFD?=
 =?utf-8?B?NlRNYmVyRGRHcEdvOWtMYkNubWlSZ1hSNlNlQit5VEFGaTFuYklPS3lHT0hT?=
 =?utf-8?B?OGYyeTk3T3dXSGcvRzdObWloaXI2UEJQZ0RPY2l4MEVrdWJrTnRVWDBmR09Y?=
 =?utf-8?B?MW9YMUpKYWNMTG9aZTI0TElNNldLUElpbWhmcUlXTmsxS0haVjJCVFUzM3VU?=
 =?utf-8?B?SWhhaWpXYjYrUUhBMmpRWHhWVGRFS2lRdUQzV2wzNGZETSttak8zZm5waUln?=
 =?utf-8?B?cW5WbEJDZGtQeVlyaU9QQXRsRyt6S091YW1BbmNHbDJGRDJOSXpYMVY4Umtw?=
 =?utf-8?B?MzR1cjJEN2NaU0NrR0xSejk1c2VYM3gwak1jYTgrOU0yV1VVN3Nma2pXMEo2?=
 =?utf-8?B?UWZaSmlMT1ByTkhCNUtTZFpQSGFsYk9SVHAyT202UHpmdDZTd2hyejhrUnc2?=
 =?utf-8?B?ZCtqMkNSYnBHZUJ6T1BGQzRNd3hzQTM5WVZsNjJIa1ZrWm1Lc0hxTUY5TERR?=
 =?utf-8?B?V0JYRHErOXBXRmllNVc5UDVYVEFCSXpYNmJjTjF5UXRudnNSZEhlekt6TzNh?=
 =?utf-8?B?a3JzblRnVkljais1cEc1RnZOb2tMRkJST3pINVo1aXRwUU1OT2Q5Y0lTb0NR?=
 =?utf-8?B?WXp5KzlXKytKT0tndU05VXc5NXlyZFgya3hxLzhEL1hKVWtxK2Q4dnUyOXFK?=
 =?utf-8?B?UUlPMjg3TnB0QjBSbTNzQVpsNVVvUTM5MkUzVWpKTExZWjlXcjFaYWpOejlE?=
 =?utf-8?B?cDcyVnhLSzRVRFd0ZnZDOGJnZ2xqYk96SEh4bG5wcTBZdDFrUHRVa1BoTlVB?=
 =?utf-8?B?WVVNME5qc3RxOEdWaU5IM2F1UXN3aDJJWTcxbkh2S2oxbVArOHBRTE5CdnJG?=
 =?utf-8?B?cVIrSEUweWF6aHZraXQrZm8zeHRPd3YrME8zZmpuRWhkd3ZTUE9sUVVWVTJI?=
 =?utf-8?Q?yBWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHg0VmVEV3JGTkdwc0c0bWcwTXZWYjEyVlE5RVJZNGRGUGRyT2Vybk9zbW96?=
 =?utf-8?B?YkF0V0kvUVMvcFRCcERUZDZzNmxyM1hRRFU4TGh2RTgrbHpBUWtDUDhkTjZM?=
 =?utf-8?B?Z0pXVitSV2VCVXdvWUpnQ3pkT2hGWFBNZko0WGt6bDNTaTFzRC9Lb2RDUXc3?=
 =?utf-8?B?V1A3WjZ1WlhXSE1uaFN6TWJoY0t5RWJoc3oxRUt0V3JoaVdKVWlUNHE1ZmRz?=
 =?utf-8?B?Z3hCM09yWSthRGpBTHRROXkycmRYZU5uMC8zQUl1VXhkQmM0cFozeVliTmNQ?=
 =?utf-8?B?U09LMVpQMGIzRC9JZnUzdG5ZYnBlTWtNQ0VFa3kxYUNQemg2NmdneVBEV0xa?=
 =?utf-8?B?V0c1RW5SM1FJREFRbTZ2eFJndGx2UkMvYWdOcFBRay95R3N4UTNERHZkQWdG?=
 =?utf-8?B?bmZHRjVIZVVnZW15NTNNbUlET2hqbzYwS0RGR2NaMnBsdXVsUkQwbGs3dVdY?=
 =?utf-8?B?ZTRRTXk4TDl4ZHgzYlMvQ05lbVpWVXE4ZVJPOWd2M1REVTMzV284VHg4ZVhC?=
 =?utf-8?B?Q3R3cjJtMmxCLy9oL0ppckRvUmpYTmpNdjYwckNzZmg5T0wzdzFzc0Rjdk5K?=
 =?utf-8?B?UU5RN0JHbnlIVU55RXRUWmd6RS9kbkhCR0l2RW1SR3VRL1pTOHQ4ak5YV0V2?=
 =?utf-8?B?bktRbUJ6QzBFTDdEN045RWJGU1J1eVRjNk9ERDRBRGpXblJmeXFQZkg0Q3Mx?=
 =?utf-8?B?N2xyL1R1Syt2c1BpczQxRnNtc0p0SWVmR05EV0dzZDU2SEkxMG84cG9ZSUNx?=
 =?utf-8?B?K293N3JjVU55RnFCdG15ZFcwUFUrY3NuVDBkK01PNmFlTzBWT0lwOS9QVnJ3?=
 =?utf-8?B?dEpHeWR4cXFjUnNvTGlFdkxtOVZWelU3aWpqSjZMUjlGNjJHZFVkZ1htS2Rp?=
 =?utf-8?B?WjA1eW45bW9uZGZjOTVRS3l3WUtTWHVlZWx3VlFEQ1Z2TG9HcTAyVW5jcTJX?=
 =?utf-8?B?RUJnN3R4LzBrT1RsN1FyZzZUdDNJNkZabDJ5WnZZR1EvajlVb0F3YkxTVTYx?=
 =?utf-8?B?all1K0k1RXoyY01PaHZrV2pmN0ZKSEg3YkRPWWN5YmxFL0F2eGEwTDFYeUxE?=
 =?utf-8?B?WmFkcUtCTFNPVTNzb285RFZTRTdxOXBZMlVIYnlWRmxDRkdKYW5DRXdFN3V4?=
 =?utf-8?B?dWp1N3hCV0J1SHBXR3BzTHZLMnUwUWRlUUpMT09IVXN2cUVQSmtFRitkVTdH?=
 =?utf-8?B?Y01WdGpOV00zSmhERG1NamhWLzE2VDlPSGRCMEJleWRQaG1DdGd0V2pTS1pi?=
 =?utf-8?B?eDJSNXlOUU1najNIL1I2V002aG1mb1d5ZUxhZDRJdHpYaWVoMUMrQ1JaRjgw?=
 =?utf-8?B?eTZXN2JRRXg0a0U0aVBTQlNwc20vWUpPbWxGRUp6blI2ZUkwR1BJZy9FamFB?=
 =?utf-8?B?RExhUjh0RW5rSkMzcVV5ZTA1MDREUmVmUEtYTVA0REdPVXRZRGFtaTlzOXly?=
 =?utf-8?B?UFNOZW0zSTQwZjBsaGNIeHJmQURtVWhaRU9SNnFTQWE4QVI2aUNJSmRrOFBE?=
 =?utf-8?B?Z1FYOENPang4NE9sUjJuUE5aUEhFdE9TWnVYNk0rbmpxbmxDb0U2V2N6Slg4?=
 =?utf-8?B?MHhFcmE3anlwSGhKVlZ2cW1HdFhOMEp4T3E2MTZJc2g3dFFnN25vS2VqQzg1?=
 =?utf-8?B?SHRlOS81QlNIaDVycE1seHJGWlVnYzdnVGQ1U3JGeG44YjFDWC9FbkJsSzcr?=
 =?utf-8?B?TG5uRkNqY0Z3RGtUSkZCbEhLU2o5eSsyY2Q5S3BQb0o5eEZmSVNyU2hhTkFM?=
 =?utf-8?B?anZ3SjRwdjNyV0FyNWd4VjVpSXV0cEFJRTkzTitrVFJOd1Y4eXVNcFVxT0x4?=
 =?utf-8?B?Zm1CQmhVMWJVMURvdjBaNC9ISXBvdjJ5QlNINlZmei9XU1ErNnppcDFEWnk1?=
 =?utf-8?B?dU9ZRnFtRnkrbUNuc0JROGVHcXRPL3JBNFhOU1FOWFNEZHFRb2FQVlY0VU5u?=
 =?utf-8?B?RVNaQzBKM2FMa2xSUXlQY2oreElpREdraXVHd0x0YVBDQTNmQm5rbU1DVUhN?=
 =?utf-8?B?RDRPMzhCMWRZZTMxYVc2U1N5dFkreUZIYmJmRFhWRHBMZGM1SVpudmlGOVJI?=
 =?utf-8?B?WVJnR3hJRXJnRVE2Ni9TUUxNOTJIakQrZFo2Q2lCUXNLWnE5R25nditsaXBF?=
 =?utf-8?B?TEQ3bjMrMlAwaVVyakFHWmhsbFdmMVJyYUFHMmROLzFPRUdYRGpiMTJkcTJW?=
 =?utf-8?B?N2NnZ3hValJpUjRFSENlRk9mL3cvdHg0VTVBditaMk5kNFExYzFSWm9CVFlx?=
 =?utf-8?B?Qi9CeHA0ZnJOUTltMG9zdVFSLzR3M2ljeU5ENmJOakNrV3pxckJCeXoxakFN?=
 =?utf-8?B?LzJGbU02anNQU1N1UVRFSHpyUnZWRzJvZnJQSHhkUk52ODR6dm1uUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e411d73f-5505-42f0-952e-08de695fe521
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:22:52.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOwijXpJCL1ali9Zkc+CQBOjxjuwf/JIm+AtVC01A1b1Q0qVLugk6l3m/vToVOWA7+EWX/HZhVtdTdplRqirbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7886
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 86EFC123D46
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:11:32PM +0100, Jan Beulich wrote:
> On 11.02.2026 11:46, Roger Pau Monne wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -413,6 +413,13 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
> >  CFLAGS += -Wa,--strip-local-absolute
> >  endif
> >  
> > +ifeq ($(CONFIG_X86),y)
> > +# The GNU assembler will interpret '/' as a comment start marker instead of a
> > +# divide for some ELF targets.  Pass --divide when when available to signal '/'
> > +# is always used as an operator in assembly.
> > +$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--divide)
> > +endif
> 
> As said before, I don't think this should be put here. Not even with the
> new ifeq(,) around it. It should go in x86/arch.mk, or a reason should be
> given why it can't.

My bad.  I've attempted to put it there but got complains from the
build in x86/boot/.  I think that was because I had leftover stale
objects in there, and nothing do to with the patch itself.  I can
confirm it works when the chunk is placed in x86/arch.mk.

Thanks, Roger.

