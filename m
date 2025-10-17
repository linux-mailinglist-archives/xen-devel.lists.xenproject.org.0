Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28FBE6F71
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 09:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145008.1478176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9f2x-000730-BP; Fri, 17 Oct 2025 07:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145008.1478176; Fri, 17 Oct 2025 07:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9f2x-00071a-8X; Fri, 17 Oct 2025 07:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1145008;
 Fri, 17 Oct 2025 07:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9f2v-00071U-4S
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 07:38:41 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b162177-ab2c-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 09:38:38 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH8PR03MB8178.namprd03.prod.outlook.com (2603:10b6:610:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 07:38:35 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 07:38:35 +0000
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
X-Inumbo-ID: 4b162177-ab2c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XosFa8+jhCzsQuNnybZHomVCAKGrSEDXVYLQ23sMVt1Ze46iNewYJqYe7pQLH+1WF9+iCFaaFnLI/UwKaQqcVxr4DtAiwzt9OUZ3N5gvUR38qIo3EIQ5hpxAhBrO4XYmAFCxDu+MFmLs+wNpBlHUXxH1qkJv0xwQSHbY0zhGoowBDDCofHa3FcGe6G2Kl7Sodcw0bfj35wWzd61ycdCtpp9bGnev+mhmdDkxTFdDgBUUIKNyY6lLi5miNYX4ToNv9asitGfDdlIKWGAhwr8S2zkRwuP6nLrCUcs9q7VnUPhOJX/KeOWeBtjtwa878aCIGtLmvnf96fdR1YKrrS+tJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whW7G34Y5RFo8eebljx+NifytIjRAh5GJs46kktfN5I=;
 b=elUxEO3Bn728swSOfdNwt8bGq7S7nrV88kOr9RS/iGxJjRE3jb7qh94nuVuPtIg6IqSrYDg4DBMkf9LLDDr6SQmThojjxMAgzRMQnMptdC6q9h9rNbW3I40p25SOyLnomxB5iHRlVMbj4cxFqLCzYEk02IW1/KP4ZKT1K93fYi75JGz/Fef1CHkDy2e2KuKW6iwpFOVKe0WL/s9Dty23NvCgHU3ByzrAl8A3mAyjg8oOuWS1/rqYBwrxxetLON/qQZNkPMQ8mHJnZ4Eal6pAhvVYjfvBFKapio3UkQktvZuzkJQ895U2Ki3CsZ/71s0pXOf9psyaqcCu5XLelt5J0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whW7G34Y5RFo8eebljx+NifytIjRAh5GJs46kktfN5I=;
 b=W1sqECnfbkPxBVt7b+4mArACkS1e5zxjlVvL85qP4ElrZnMe8M43mTlKuvyEk/yGVf68ke2+/ZnXI+JZTgc7A9MG0slsK5YsmHcu4rsVaRY34gDEGiqbBOsFTizpB2RfdqjOIjsI2sZaLo0RFZdR77IIDtF+jdD3Zf6u23vK9ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Oct 2025 09:38:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aPHyd8m57y_UkSl-@Mac.lan>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan>
 <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan>
 <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan>
 <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
X-ClientProxiedBy: MA3P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::16) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH8PR03MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: c517df84-81e0-4660-e9f9-08de0d502dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWVWdGhJaTUwdTZQemdXS0RYSUlwMnJOK0c1OUtOMzhkdXd5emtJeXc5Y1p5?=
 =?utf-8?B?ZnVQMGk3V08zbWRzdTFHSWttSkZaQStnNmszN3NjdXZKV3I3NC94ZUc3S3k1?=
 =?utf-8?B?NDBmY2NKV3lSaFhza0pSTGZHSGlwQXk4S3F5OG9MSkNHTVBFa292TkV1OHRV?=
 =?utf-8?B?YVdFU01mY3gzNE9QVzFONVFCVXVwdkIxOWlXclA0bTBQUUpCVkE4WHJjUGN0?=
 =?utf-8?B?SCs0aGRpaWVUR0k5MFBSUHNDR0V2a2tibHZ3ZHQwcU5BRGhGVE1ZQituWm4r?=
 =?utf-8?B?OG9vK3pqQUtKdERYSVBLd3NjdXFHdGVYb1hYNmRXcTdVZTN5MjNValVNWFZn?=
 =?utf-8?B?RVI0eXExbWtoMkZsSHdRZy9aN2JzRDRaSkwySHhaeWo4ZlJnWTNYT09PK281?=
 =?utf-8?B?RFlvdnUzMldEOS9sSll6MjJRY254Rk9LWVhrVm9QOW1ZdmUrVVcvaHFSOHBa?=
 =?utf-8?B?SDg4Y0hRVW1ReTRsVnV2UmhmT2tRUVpIVHdYUmZQWENpTllWS3ZrWk90WkpD?=
 =?utf-8?B?WmRUaXdIcXJBYXl1bWEzVTM4SlM5WVRWclNMNkdmR0t1MWtJUFFad1FMVzk2?=
 =?utf-8?B?a2JaTTBaQlBnY2tpWDBOT2t0VEY4S1NCVndsUlhNTDBjNU8wOE8yQlFwTTBt?=
 =?utf-8?B?c1ZSVG9ZWEdSYlJVZWhKNlNSNVpaNitQa2NMaThZVmFyNUU0TE5KMTBxRG1E?=
 =?utf-8?B?d3JHNk9ac0dOQW44eUZ0SzBpQWRINmkvWXBFczlIRWxQYmNaQXlMTnVPU3lv?=
 =?utf-8?B?ZmZaQ3oxMlBPSXFMYytsS1d0NHl2SmFNbE5VRTg1WWtTWU5DWldxaUEyajdP?=
 =?utf-8?B?QjFhU1pOUytrbEJiOTZJdEFuNkJyVXdQWXplT08zMytNYU1mMmNvaG1nbUkz?=
 =?utf-8?B?ZjhpL0VKRndTV2JpMjVhUHVQbHBrcVJZRkFkV0J6Vjh6ZkdJc0NWSjFiQXVF?=
 =?utf-8?B?aVFKU2NUejRYVVRSNlkvbG5CYWwvVUk2MUQ2OUtucGdPY0pMekhGdklHSTYz?=
 =?utf-8?B?SksrVllGcVBEYytpWU9jVkFnM2hJVHVQVWZYMVUrRUtZdks2SVlxOUtSKzB3?=
 =?utf-8?B?Z0FXbmV1dzZNUHQzazN3QWxPeFBwUUtmQitLQ3pTVmEzYTl5cFMzc1lFNDdC?=
 =?utf-8?B?OGdqcE5vbDZCbjFQdHpsR2RHcHFIQWlMa2VudUhybDd5NUdqemJ5OTdKVG9T?=
 =?utf-8?B?Q1NOOENWdHRnV01NTW5uVDBHYzZzVncwUWV5cWQyQnczRlpnQXZRcTF0U1h6?=
 =?utf-8?B?MDF3RGx3U1Fyem1MY3lPUkhnNlNJZjh6N2tWUXhvZTFmWWVUSk4yNCtJTUtK?=
 =?utf-8?B?TXpaNWdESmN2c2RFWDE0QjdQQWpMUFU2UHJSN29EZ2V1VlJYRjk5UUtZblFz?=
 =?utf-8?B?dWVVK0RZSXJtR1BPcks4WUEwOCtyQUwwY3l2RHQyRUJIejFyMXRUTE54TU9Q?=
 =?utf-8?B?VmRORk5yN2lmN0g4SkRvL2thWEJteTdkRlRKc01sR0sxTTRGUUpxVHhTeTFi?=
 =?utf-8?B?bjVSZHluamFnSCtsQm5mSFc5YjR1bnhtMVAvUmR4NmI3Q3ptRENyZVdJbm1M?=
 =?utf-8?B?SU9FL0lxK2k2TG5PRG9jeVhxZ1VzR2pzZ1kyUDhNK0xhMDBIRy8yZENVd1dt?=
 =?utf-8?B?N2lHbEhKeWpEOUtQM3FrcCtiREZmU2ZrODlOOTJuWmJ6S1hoN2xBNEFrUzdp?=
 =?utf-8?B?VzNIZko4VjlVd25CNDZKcmNnT201MW1RbFdkNS9uTVNlMVBOS21qRFhtRjVF?=
 =?utf-8?B?VnlsbFUwdWtQUW9GMGF2dnVXb0IrL0wzUkkrWkdaSm94VU0ybXZjWTd2NnZ0?=
 =?utf-8?B?cHZWaWViTlI3OVl6a0RpYmpXN0VHUFh6MklMeloxYnZEeXc2MlpGK2dvQVZo?=
 =?utf-8?B?ZTJnVEljOVFuOXhlbmlwU01JMGZlVzRMbkRIVTdocWo1eStROXJOUWZ3M2pL?=
 =?utf-8?Q?hyksDdEWWoiQ89V2V69X5pMueHS/8qhG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmNRUGkrNVdxektYbkFRSHpaV2pQMHBxOGswUkdyVCtxVHUwY2ZDbDVWSWhi?=
 =?utf-8?B?WDJLa1JBT1JoYTBSUjZRUzU3TGRsMmVBTVpXYi93WXJqYnA0dWJwWTJqYjZP?=
 =?utf-8?B?M01FamxqWjRoNnUxdUtNN0dKSmM2ZmZOZnhTL0NtL3BDUWwrUEpIQ2hxelMr?=
 =?utf-8?B?c2xiYjIybHpKY1JBMXN0c09wRHdqUGNOUGsza25HVVdtN2lGS2JIRDcyQ0l4?=
 =?utf-8?B?NGVZMW1JNkNnaVBmNmhTU0JyZFBNd0NZY1c1SGZoaGJUVkxVcjd3elBGeFIv?=
 =?utf-8?B?UXdLZkhGaytkUW5YQ1ZLa1NiVjQ1OFd0dzhuVUkraGViZHVENXVWdGJrVzRN?=
 =?utf-8?B?eFQ3RjVQdmdpQkJXd2hhTkZtN2lGdHdZQXJXSFF6WDBGam01ZnRNUmh4OFdv?=
 =?utf-8?B?ZXdycVRrajNZQjNvNW4wMmZTQXlyOFYwcU9zZytwRXE0R1VwVC9qTzB4eGFV?=
 =?utf-8?B?dzhFWjZXNDRiYTFOSWNTSTJmSzJFVDYvbVBncXRjcFhGeFlHK2NKaHlkblRU?=
 =?utf-8?B?ZTlONDBueWoyRk5lSGFMYllMS1VaeHpJN29Fd0pOWUFEL3h2T05wSkVYZmJC?=
 =?utf-8?B?SzVLNU9YSStSUGJLR25XbThUSW9tYU8wMGtwK2s4OUs5bmZpSFFmdC9LaFZr?=
 =?utf-8?B?cVlqNHBVdm5xOHNreVljU2hNWndVcmxxWFVDdjVIMmo0ZzlvVkVsa01IYUpy?=
 =?utf-8?B?QTJvVkdIK0M2K0tXTGlLMWZmamtlM2J6cHNmZDZKbFRRazlKa2lMeXdpRnJH?=
 =?utf-8?B?N0pwdkRpMCtMM05zYjdHbndmbHdwWTJ5QXo2TERTakNEd2FqQ2dRTmhmK0gy?=
 =?utf-8?B?S3dvL3p3WUZqc3FFYlRTUHBKYW9RbVNiaGdSdHQyVnZLY29YRGZpRUJqdEVO?=
 =?utf-8?B?VENSamFXVnFtU3AyZ3ZrdkNFc1pESzRkaHdxcUp1ZTVMRUp0WHVTNTNxMjB1?=
 =?utf-8?B?Z0Y2ZzhuZ2MvcEM5YktwWDhod0J0V20rZGpkbWsrQU9zY1JVbkxEMGRjdHVn?=
 =?utf-8?B?Z3FKLzdKSGxaUEJaVzBLcXdVVU9JNnR5ZDNyVlBwUk4xR1M1N25NeUZpNGdz?=
 =?utf-8?B?UExhdEQrSWw4czdPMWtRSm4zMi8yWkdjV016dVpaQlZienIvQ1Fmb2U5U2Fx?=
 =?utf-8?B?ZXo3b1pJUXlDK29zS0lYZ1lNa0kwdkpUZnh6cWtzRUttbmNlb2ltdFpaUWVJ?=
 =?utf-8?B?VFg2enRiRU0zYklIdmx0RDRveDFTalRqRU0waDRjSUkrSFNXc0xmOS9ieldC?=
 =?utf-8?B?b0hSdStxcDlyTGpCcytYb3J4Z2MrVmljUnUxYlZ4UVJZK05iT3NmUDdhMEZM?=
 =?utf-8?B?UTBTQ3kxY0ltckpEKzlSTVoxNjE0YXZVbXpoUWM3YkdwckJJby91a3hoVTJN?=
 =?utf-8?B?UW95YUdXMXhUVXJOanYyL1oxOVBvL1FsUGt6Q1BHOFhQaGdSRERoZGVSQ0xH?=
 =?utf-8?B?TTBUQS80ZHhXM0pyN2FPZzVSZmI0QkVXMTBwWDRqcHVPdlpxR1RJWGpxcnIy?=
 =?utf-8?B?N3p4LzBhcEVycUZWSmxuUVlPNUphMlNvZldJbUw1czVJeUtrMGFuVFBTb0ZN?=
 =?utf-8?B?S0VWN3JRbytmUkM2ck16NnpvcFJnbFBrM0FwcDhmSm03UjVVNnR3bUVDWWdW?=
 =?utf-8?B?MFpkMHg4eEdhVXVVK3EwMzhkT1hoOEwwUEJ5TWQzcTlBZnAxVWxYMDFDT21F?=
 =?utf-8?B?MkV0N2tLOVFBM2Y0cDhCeE5UNmc0dW94MW1Oa3dnL25obm9qMHhpUjJQMjla?=
 =?utf-8?B?RldqaEpKNUNPcGhxSmRlZVBtalArYjlkVlVHRHFlM3BnMlRTTHowTFBHeUpC?=
 =?utf-8?B?TkN6a08yNER2TXlmanQ2RnFiRWJKZXlmbUF6ZnFGNms3RmcyNGZ6NzNFaDVn?=
 =?utf-8?B?cmkrVWZDb3hMaUsySXlXQ1RPYkk5VWVGbzE2MllxcTJMMUNVTG82M0hlL0li?=
 =?utf-8?B?TWtwVjdvSXIyMCt6Z0EwNDFIUUxWQjduUE5ickVJZ0NpN0QyYytycEIvSE1B?=
 =?utf-8?B?TzQzYTB1Sm5KUkg2eWV6bHhoQjY5M0oyWnFYOVU1UVdtNzhZVWZFUllIYmRr?=
 =?utf-8?B?eGlSN2k0cVQ0YnViL0lpNmU5QUJKencvWUNabmVzWlM2bTlFMXhhL0dpY3ha?=
 =?utf-8?Q?RZraCyyGkm+tNLHnaUFVoKapp?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c517df84-81e0-4660-e9f9-08de0d502dc4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 07:38:35.3786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AlJn2VuzFyWMWRynCmeL2bB3e8eD/T+sUc5SDvYb0/elGCYT3zM3Ay+zIXEPZsHEjrlcmbtcQDyQ4W3wRbjsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR03MB8178

On Fri, Oct 17, 2025 at 12:40:33AM +0300, Grygorii Strashko wrote:
> 
> 
> On 15.10.25 11:00, Roger Pau Monné wrote:
> > On Tue, Oct 14, 2025 at 06:48:23PM +0300, Grygorii Strashko wrote:
> > > 
> > > 
> > > On 14.10.25 17:38, Roger Pau Monné wrote:
> > > > On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
> > > > > On 13.10.25 15:17, Roger Pau Monné wrote:
> > > > > > On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
> > > > > > > From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > > > > > > +
> > > > > > > +	  If unsure, say Y.
> > > > > > > +
> > > > > > >     config MEM_PAGING
> > > > > > >     	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> > > > > > >     	depends on VM_EVENT
> > > > > > > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > > > > > > index 6ec2c8f2db56..736eb3f966e9 100644
> > > > > > > --- a/xen/arch/x86/hvm/Makefile
> > > > > > > +++ b/xen/arch/x86/hvm/Makefile
> > > > > > > @@ -1,6 +1,6 @@
> > > > > > >     obj-$(CONFIG_AMD_SVM) += svm/
> > > > > > >     obj-$(CONFIG_INTEL_VMX) += vmx/
> > > > > > > -obj-y += viridian/
> > > > > > > +obj-$(CONFIG_VIRIDIAN) += viridian/
> > > > > > >     obj-y += asid.o
> > > > > > >     obj-y += dm.o
> > > > > > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > > > > > index 23bd7f078a1d..95a80369b9b8 100644
> > > > > > > --- a/xen/arch/x86/hvm/hvm.c
> > > > > > > +++ b/xen/arch/x86/hvm/hvm.c
> > > > > > > @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
> > > > > > >         if ( hvm_tsc_scaling_supported )
> > > > > > >             d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
> > > > > > > -    rc = viridian_domain_init(d);
> > > > > > > -    if ( rc )
> > > > > > > -        goto fail2;
> > > > > > > +    if ( is_viridian_domain(d) )
> > > > > > > +    {
> > > > > > > +        rc = viridian_domain_init(d);
> > > > > > > +        if ( rc )
> > > > > > > +            goto fail2;
> > > > > > > +    }
> > > > > > 
> > > > > > Are you sure this works as expected?
> > > > > > 
> > > > > > The viridian_feature_mask() check is implemented using an HVM param,
> > > > > > and hence can only be possibly set after the domain object is created.
> > > > > > AFAICT is_viridian_domain(d) will unconditionally return false when
> > > > > > called from domain_create() context, because the HVM params cannot
> > > > > > possibly be set ahead of the domain being created.
> > > > > 
> > > > > You are right. Thanks for the this catch.
> > > > > 
> > > > > Taking above into account above, it seems Jan's proposal to convert below
> > > > > viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
> > > > > 
> > > > > int viridian_vcpu_init(struct vcpu *v);
> > > > > int viridian_domain_init(struct domain *d);
> > > > > void viridian_vcpu_deinit(struct vcpu *v);
> > > > > void viridian_domain_deinit(struct domain *d);
> > > > > 
> > > > > Right?
> > > > 
> > > > Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
> > > > flag you need to exclusively use the Kconfig option to decide whether
> > > > the Viridian related structs must be allocated.  IOW: you could also
> > > > solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
> > > > is_viridian_domain() for most of the calls here.
> > > > 
> > > > The wrapper option might be better IMO, rather than adding
> > > > IS_ENABLED(CONFIG_VIRIDIAN) around.
> > > 
> > > I'll do wrappers - less if(s) in common HVM code.
> > > 
> > > > 
> > > > > [1] https://patchwork.kernel.org/comment/26595213/
> > > > > 
> > > > > > 
> > > > > > If you want to do anything like this you will possibly need to
> > > > > > introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
> > > > > > domain has Viridian extensions are enabled or not, so that it's know
> > > > > > in the context where domain_create() gets called.
> > > > > 
> > > > > In my opinion, it might be good not to go so far within this submission.
> > > > > - It's not intended  to change existing behavior of neither Xen nor toolstack
> > > > >     for VIRIDIAN=y (default)
> 
> [1]
> 
> > > > > - just optout Viridian support when not needed.
> > > > 
> > > > OK, that's fine.
> > > > 
> > > > On further request though: if Viridian is build-time disabled in
> > > > Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
> > > > or similar error.  I don't think this is done as part of this patch.
> > 
> > Another bit I've noticed, you will need to adjust write_hvm_params()
> > so it can tolerate xc_hvm_param_get() returning an error when
> > HVM_PARAM_VIRIDIAN is not implemented by the hypervisor.
> > 
> > Implementing the Viridian features using an HVM parameter was a bad
> > approach probably.
> 
> I've just realized how toolstack need to be modified and all consequences...
> Have to try to push back a little bit:
> 
> VIRIDIAN=n: Now HVM_PARAM_VIRIDIAN will be R/W with functionality NOP.
> 
> I'd prefer avoid modifying toolstack if possible.
> 
> How about sanitizing HVM_PARAM_VIRIDIAN to be RAZ/WI for VIRIDIAN=n?

I've been thinking more into it, and we must still allow writes/reads
to it, otherwise migration would fail when restoring a stream that
contains a Viridian record, even if Viridian is not enabled for the
domain.  Right now the HVM param is unconditionally part of the
migration stream, even when Viridian is not enabled.

I think Xen could return an error when VIRIDIAN = n and a non-zero
value is passed to HVM_PARAM_VIRIDIAN?

That shouldn't require any changes to the toolstack, as when Viridian
is not enabled the toolstack will just set HVM_PARAM_VIRIDIAN = 0.  It
would however still fail if toolstack attempts HVM_PARAM_VIRIDIAN != 0
and Viridian has been build time disabled.

Thanks, Roger.

