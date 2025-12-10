Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249D3CB279E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182682.1505524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTG4w-0000IX-Ei; Wed, 10 Dec 2025 09:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182682.1505524; Wed, 10 Dec 2025 09:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTG4w-0000Ga-B8; Wed, 10 Dec 2025 09:01:46 +0000
Received: by outflank-mailman (input) for mailman id 1182682;
 Wed, 10 Dec 2025 09:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2u0=6Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vTG4u-0000EX-CK
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:01:44 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7b043e7-d5a6-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 10:01:42 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by DM6PR03MB4954.namprd03.prod.outlook.com (2603:10b6:5:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 09:01:38 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 09:01:38 +0000
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
X-Inumbo-ID: d7b043e7-d5a6-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jioqKAXQxU87x8M3lsWes9msjOcGDJSb16H/It8keel7C5Ik1aZgy6qtYv6PsJ2is0wICcZsoBes/Ct2JWtbkIVjv+fpJWW4duhLqRBc30KqL5kENHVbosJHAZ43JhdFvN2+OrmGpZw1wuf9BPL7YZwVtqjiyRPHSGDBFK5XInhnCHqA8vo8O0HzqPynJyTfXCqlW0zkwtR2jILsoxr3EhEHU2VgoQNYZIwXvSkY9F29Xs1gj0KdtadwmQunN5/hw8V9wWwOtd14TLUFUlS1pb1fNTjnUUpkek0rQPUnaoJe3JVAuNvGe76P98YSztCF52+3TSgeC2MeCwtSjR+suQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHtOpjToBfe+/fGHL9n3cgmGnJve/H3YqpL+esDaiZc=;
 b=Xiy8Nyr9arFIL2/0UtEocsqz8DbiGYCWClmrLI9+6GOPKOxxi15GQdQ1XmSE8oSU0yw9B/diO+lR8E3LWOdwxT/qlZzD0S2quRUp7kX0GYkDnMBD6txFJuYtt7Qfzhqq78HHx57kV+j4RFeAf/ANeUy0MlQ49kHt1c7aREOAuV3UPRwkhC8vYIrnreaUpgYTgcuSv2W7fJAbqpiDIlU0clP3tZrsE7xU7e+tu7aLTwOXP7s8nMrBY1MNiQXOtb7lGfq6BbKuIUKZiTZQqMwvYtPqP5+CYT8i/0ugSSpF7l4/ID6quj3fNkFeMc1+CgmYHJ6KUmqyFBDX8Cm2Cb4dXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHtOpjToBfe+/fGHL9n3cgmGnJve/H3YqpL+esDaiZc=;
 b=MtXiJKYYQJdqMjoyqFqu2QnpsY4HYYniIjAtMS73U7toBSWZ7O/4qr5R6HdgbkYCAagO8BsvPaqaYWxA9UmgVhZhrOfcc8Y6l9OxhtH2YzNOfrKmKCRiOZa6bDJalJJ5AsKdwTuIySjSssNI9tj3iGDgoCih1t5EykhY4obWgRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 10 Dec 2025 10:01:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
Message-ID: <aTk27qyaDM9FuL33@Mac.lan>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com>
 <aTLjwbcm4fjwNJfb@Mac.lan>
 <b03a8039-e4b3-42ff-9781-031bf68ccb72@suse.com>
 <aTgJUvqTIQRc66L_@Mac.lan>
 <f09af4cf-09d7-462a-b8d1-0f2a4b3f32cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f09af4cf-09d7-462a-b8d1-0f2a4b3f32cc@suse.com>
X-ClientProxiedBy: PA7P264CA0243.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::8) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|DM6PR03MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: c709d4d2-5a24-45c5-7e39-08de37caba6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmpFcnByQnVxMlNLdCtFOEpnTjJlUkdtbWhsZ1lMWXFvTXFKL1BCNUkvL1JL?=
 =?utf-8?B?RjZ1aFBuRjJBbHFMQysxQllUTnJxc0NtVngxaG5HQkxnV0MydjZBaEtlZjAr?=
 =?utf-8?B?YVBsdmcvc1Nia0tXc0V1dys2OEV6YkRocGJCRWJ0RWt2RkNvTUo1RGw4ajhC?=
 =?utf-8?B?NlRKMVJXdjlYVGs3NE9RM3ZrUS9aTm1HRjFkYkdKdEErRVlBTWZaaCtoU2l2?=
 =?utf-8?B?YTJIeXRQaFhiNUliaVpPRGhZWGZ3c3NiU0tHaU41OFJMV29ld3dKdFMvNTFX?=
 =?utf-8?B?U3ZVMFJuV09kc2lXQjgzOXhob0RPY2J6L09FVDZMSk55dWczOThkL3krdnk3?=
 =?utf-8?B?RCt5eW9MZFZFa090dUJGMlBaQXAxR2pGdGE3MGJyRjc5TzVyV2FXV1VJZUlZ?=
 =?utf-8?B?eW40YUVpYXJTQ2FSMFlOOFJUMSsvTTNSZCtCeVlyeGdUSDk1TlZLOC9LQXg0?=
 =?utf-8?B?VDZ0amxnd0RQb010cUR2K0tvT21DdXlyU2I2OFZPZHpFdndUdXJWbGdUWlFW?=
 =?utf-8?B?ZjBVRnBDbFlzRDh0RFpIc1dKTFNKTnUwMjhWOFVmRkVvZWRPcXJEeWFSRVlz?=
 =?utf-8?B?eFk1YXdiRkIvak5aVEI0aGI5NnZEUUlVUm01ZzFqQmtJNGVFN0ZGbGhQLzlD?=
 =?utf-8?B?a1lyOWtYM0dpZ1hUZ2t1N1FKUGlLL05NczBmakp5dENjU20vQnN5eU9aQ2Q2?=
 =?utf-8?B?R3lUOVVMd0F0bjJObHplMlVweEs2OU1kUDkwbXlmQkJnYVh1c2JLRWd1WVpt?=
 =?utf-8?B?elUwRDFlMVV0M1hRU3ZFVGU1c1NPNm83eXhWUjB2Q2FGT045cjdDd09xOGcr?=
 =?utf-8?B?dXg3VXY5cWp0SHFIU1hOR1pFdVZiVW9JQWJBV1NVZGJLQXQ3eStySytobEgz?=
 =?utf-8?B?NURzRWY3UG5BWDd1U2hGelM3MFNIbzFISlRzVmFPeTJPNDdKSFVtZk5MMmRl?=
 =?utf-8?B?ZlhEK1hQMitHdXp0emduZHdIUGZpRjhrTEJlNUUzU3h4SzdKSlljR3Q2NGVw?=
 =?utf-8?B?QUluK0VRenNuRWd1eFUxV1k1bjlLZ2NTRytOemZSekk2TnBxcTNweFk2WDdF?=
 =?utf-8?B?ejlxYXl1SGRJeHkrRDdiRno4MDNBMWlhSTRvNGl4WE5obGl0ckcreGlCV2ZO?=
 =?utf-8?B?dXk0eUVxekthdVBQd0YwMHpOUjZ5aUVxWFZRUm5acUhmNjQ0R1AwakJVaXJy?=
 =?utf-8?B?Y3VsR0lFcXM0Y0E3Z2VBR2pzZnV3TFR5M3IzNnVlckMzRVFLWTZaZXpSU0U0?=
 =?utf-8?B?K0psZjZqd292YlFoVkllbjFDdEgyTXFmaUdTK0xSMEowTXVxTHZsS256WTlj?=
 =?utf-8?B?RTNCUHlEL1VwN20raVc1TDhkdmt3d0VjaHVEL2t0VjZ3emhBbHRUUEVZSDJr?=
 =?utf-8?B?YWpwZWIyR2xZZitsdmpINndHZm9KelJnQWVsdXBLTW40UHlpaSsrKzZKVjlx?=
 =?utf-8?B?V0xBS1NxWmhGZHRyYVV2dGNtZ1pJTDJtaEdDSzNMZmsvdjh0eFYwbnA4bml6?=
 =?utf-8?B?eFM0bkVSYmVQMFdBaEVEVkFtdGl3T3FsdVA3M2FlZDhCYThNdEVOREE1aDBR?=
 =?utf-8?B?VU9jSGN4dmxaNG1rWHMyS2hQSklmajlCWGU3S3lsL3FicEVhK2t3OVdaQlBN?=
 =?utf-8?B?bFYrL0FOWE1qNkJtNHZCTlZPRnRjREp0K2hoSkJKVWVTYzRyUkIwOUlSaFo4?=
 =?utf-8?B?bjdGWm5FSmVsUTU1NFZlcG8reXpwTCtmOEhvRjhGcHcyUUVjYkR0c3p4UEQw?=
 =?utf-8?B?cTdDbGRyQkpkL1ZsekNhNm9sUDhETFdVQTJnWHVIaUUxM3NxeFY1TFBOYnM1?=
 =?utf-8?B?V0s2NTk0cE9PeEJIMWpqdUZTTWdPNkMwQmVmNCtHZWJhUDNndkpaRHByZy8v?=
 =?utf-8?B?RkhldzZvcXkzbjhCa2RMR0tVZ3lNVVN6WXROWVp3NnRtd2U1SXRocERTMmN3?=
 =?utf-8?Q?DlmZEpveSn7ntmxdQSRs7GrqHR+DSh8t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXNBdGpIUnl3UHBFVnBtWU1SRUZOMWZLSW4vQjdIejEwbnFDcVlyTm5UOXVC?=
 =?utf-8?B?NFc4dUlwejNTRS9yUTNhWnc0clVYUFhlRlRFVmVrUmhJSlpzallMWnpVQXR2?=
 =?utf-8?B?dURCdFVNaHZPZDlWclF0bTg2UkxNTmZFN2JHOEFXWi9CQUxQcGpxN2g2VUdl?=
 =?utf-8?B?MlRZZlErVjdxaE83d3hNQjNiR1JUL2FZd1BqbENLV1UreWJtcDZoQlVuTWZj?=
 =?utf-8?B?UkRDOVdYeE9UT3NZU1M3MkNwTGwzTXZaWGxFZWFaZWkwMHgybXRTT0xBNmtj?=
 =?utf-8?B?bnpwWlFpbERxbWtCMm5Jei9nRkVDc3puamF5MDZYZVdWRjFZdEY0bGhXeEQ3?=
 =?utf-8?B?Qzc3TGNwUWZtYVRTc0FpTUhTQ0dUNUlvUmJiMkVEKzVoS25zWVZmUVZJOWVy?=
 =?utf-8?B?OEdLZG1jWnlDSXRIcXpUd1c2L2R1WWxDQ2p3OWNPdWtmb1d3L3d5YlNLZEQz?=
 =?utf-8?B?M2R1SHhRTWNtYlc4ZGg0MkZ4V05qa3JwdU5ybXdPak9OOTdmVHkzWHBvekxs?=
 =?utf-8?B?ZHY3NWMvRytsZW1UMXFEYVBUREhGbnlIZVVWS05xWWVQbmFDcGJEWVFyajBE?=
 =?utf-8?B?d09MdGt4cHR1UC9oU3lEeHJjK2ZyajkzeG1nRFdhc0x4VWtoei9hMkRwdHRO?=
 =?utf-8?B?bmU4UWlaYWJVSk5TdHFnOHJUeUluT3FxczFYK01EWFhJNnRwMmtkdW00MkN1?=
 =?utf-8?B?WlF1cVFnYkFHZE1KZTlnUitBeEp5c2IraU8wT3RQVDRONm1BK3kvOVZXNTdM?=
 =?utf-8?B?NGUrd3pZZmZUNlBxUUZPVXozaVBoNFNnL004SEt6d0s0YytpeUxmbVNxTTRL?=
 =?utf-8?B?RDZQNmF2WXpWdWVWbXJyaUVTNlNWMThMbnQ3dlovRUNPZ3hrMzJJSU5HVGJ4?=
 =?utf-8?B?eDlHNTJVNzgrSlBYZkNUZjNzWGhudS9yUElweW44UWtITWdzWEFmODVNcmhx?=
 =?utf-8?B?eUJnMWx6WGZ2SDFOSThmTnIxeXF0WGwvU055OUJreW9zTXJLS2lXWnJFTEVN?=
 =?utf-8?B?Y2VVNDhQZ1ZyVHJLYVJjQm5tUExHdnc5ZFlCbmk3SXl5ZDVTWVlyaHZYZ1J2?=
 =?utf-8?B?TC81ai9CaEthM01mMDJBYVZ2bHFwWFBkM2doUHg3WU5leUpwYVY0KytiL0FQ?=
 =?utf-8?B?czgwNWFydkRvNjluVDh5U0p0U0NhZndubjV5SjRoeisrcENWYXk4U3lTRldm?=
 =?utf-8?B?cHQyUWY2bkRnSGt1bTIzNmZxZDhnZDBhYmRZeTdoVk14RzhLSTRqZDZlTUI2?=
 =?utf-8?B?ZTBnUTVUNTJaSCthRlk5ZmpYRldTS3VDN0d0SXY3a09YcTBMclhhdW1SSHVH?=
 =?utf-8?B?UHBEa0o0Wk1lV0t1TVlUVSt0ZldUVGNmS3JoclBjY1BhSEN6OGk3SmJ6REpi?=
 =?utf-8?B?ejJFSEJxRzlUSXE5T24xOEt5SXFtOGRFY2t3c1JHdTlLYUN2TERHSGNrYkM1?=
 =?utf-8?B?OXhaR1JZWkhFSlNOWU1uc3k5eTQ5bDJpSSsza2NEWU53eS9sazdtbXhoVThV?=
 =?utf-8?B?aVgyUmVRZ1ZRY3dUdnpvTy9JT1FVb3NFRXNuRWY5clg0Z0JNZHByM1IrNk1F?=
 =?utf-8?B?c1FRWVFpOXZQVDlaS3ZuNE9tUnZMTUFRVFhLdm9VNEtyVTk0NW9qZmt4czNX?=
 =?utf-8?B?MEJKZFZvU0lCMXhWZ05Odkl2cUYxQWpjRXhDVlJnMlFSNnVKMWN1WGhoSHRv?=
 =?utf-8?B?K3BuSXVzcWJnYTZCemRCMjQ0bHdjb0pwZ3dlL3NlZHpiazFwL2tQeTJkVCtX?=
 =?utf-8?B?R2V3RCtmdmFGV0ZGZTNBV3BESHRCTkdOM2YzVXlodmlYQVhmenNNdkpxVXFx?=
 =?utf-8?B?TEl3T1NqVDVWek5RRnVIVEk3dG1nTEQ2SXUrRStDSXdjS3JrL1Q2RVNrRWJR?=
 =?utf-8?B?NXFiejF0cWJ3aG00RHFCUnhQcy9TWmhWdjJDK2V2c1VuMUVTeHYrRjFpdGUr?=
 =?utf-8?B?MTNqU29GYnRreHhJaVliT25OYThuMTRTVkdBN1N3RWt0Q2lEbm1NcVorRHVh?=
 =?utf-8?B?dld0bUM4YjhENDRGNXkxUXNpaEZqc1UyQXlCZUlpZWc1SGE2UjFFUVVkUysz?=
 =?utf-8?B?d2Q0Wi9Qa2tFNkVkdUZicXRvTjBEM3E3aVlrMmZHdmdkbytXeCtlQ1JYdTdP?=
 =?utf-8?Q?DS8FgwuQ3FrZLTN4J49dypQIK?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c709d4d2-5a24-45c5-7e39-08de37caba6b
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:01:38.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dcv6c6WpgDAAuJ6qzK7cVwZLrpk4tLYTlkUlc8iq/n8e+WeSXMNXYBcvjULiG4prCI5GxnDZjhJKR+wCrCnyDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4954

On Tue, Dec 09, 2025 at 12:49:59PM +0100, Jan Beulich wrote:
> On 09.12.2025 12:34, Roger Pau Monné wrote:
> > On Mon, Dec 08, 2025 at 11:48:00AM +0100, Jan Beulich wrote:
> >> On 05.12.2025 14:53, Roger Pau Monné wrote:
> >>> On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/mm/p2m.c
> >>>> +++ b/xen/arch/x86/mm/p2m.c
> >>>> @@ -549,7 +549,10 @@ p2m_remove_entry(struct p2m_domain *p2m,
> >>>>          {
> >>>>              p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
> >>>>              if ( !p2m_is_special(t) && !p2m_is_shared(t) )
> >>>> +            {
> >>>>                  set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
> >>>> +                paging_mark_pfn_clean(p2m->domain, _pfn(gfn_x(gfn) + i));
> >>>> +            }
> >>>>          }
> >>>>      }
> >>>>  
> >>>> @@ -737,8 +740,11 @@ p2m_add_page(struct domain *d, gfn_t gfn
> >>>>          if ( !p2m_is_grant(t) )
> >>>>          {
> >>>>              for ( i = 0; i < (1UL << page_order); i++ )
> >>>> +            {
> >>>>                  set_gpfn_from_mfn(mfn_x(mfn_add(mfn, i)),
> >>>>                                    gfn_x(gfn_add(gfn, i)));
> >>>> +                paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn) + i));
> >>>
> >>> Have you considered placing the respective
> >>> paging_mark_pfn_{clean,dirty}() calls in p2m_entry_modify()?
> >>
> >> I didn't, but since you ask - I also don't think that's layering-wise
> >> an appropriate place for them to live. Whether a page has to be
> >> considered dirty needs determining elsewhere. No matter that ...
> >>
> >>> There's a lot of repetition here with regard to handling the side
> >>> effects of p2m changes that are forced into the callers, that could
> >>> likely be contained inside of p2m_entry_modify() at first sight.
> >>
> >> ... this way there is some redundancy.
> > 
> > Redundancy is one of the aspects, the other being IMO code more prone
> > to errors.  Having to do all this non-trivial extra work after a call
> > to set a p2m entry, both in the success and failure cases, seems
> > likely that it will be forgotten or incorrectly implemented by some
> > of the callers.
> > 
> > It's you doing the work to fix this, so I'm not going to insist.  It
> > seems a lot of extra complexity duplicated across multiple callers.
> > 
> > FWIW, it would be easier to understand if we had the logic to mark
> > pages as dirty in a single place, rather than scattered around
> > different callers that do p2m modifications.  For the time being I'm
> > fine with doing as you propose, but long term we should see about
> > cleaning this code IMO.
> > 
> >> Furthermore p2m_entry_modify() also isn't really suitable: We don't
> >> know the GFN there.
> > 
> > For one of the callers there's the GFN in context.  For the EPT caller
> > it will likely require some plumbing.
> 
> From a more abstract perspective, passing a GFN into that function would
> be wrong imo: Constructing a PTE may be unrelated to any particular GFN.
> The association with a GFN comes into play only when placing the PTE in
> a particular (live) page table.

But the usage of p2m_entry_modify() is not about constructing a PTE,
but getting notified on p2m changes, and any p2m entry change has an
associated GFN.

IMO the point of p2m_entry_modify() is to put all the side-effects of
p2m modifications into a single place, where it's easier to manage
them.  I think the log-dirty stuff is suitable for being one of those
p2m modification side-effects, but I'm not going to insist.

I might take a look at this myself if I get some free time.

> Furthermore it's not quite clear what the conditions would be for
> p2m_entry_modify() to actually mark a page dirty. Only new type? Might
> old type also matter (so we wouldn't mark a page needlessly as dirty)?
> Yet other criteria? That's what callers will "know" (better?).

I've just taken a quick look, but callers from the p2m tree seem to
mark pages as dirty based on the new type.

Thanks, Roger.

