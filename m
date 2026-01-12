Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8317D13C38
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200604.1516477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfK5W-0003tX-MI; Mon, 12 Jan 2026 15:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200604.1516477; Mon, 12 Jan 2026 15:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfK5W-0003qQ-J3; Mon, 12 Jan 2026 15:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1200604;
 Mon, 12 Jan 2026 15:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfK5V-0003qK-IL
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:44:13 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89fa4b77-efcd-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:44:12 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV5PR03MB8458.namprd03.prod.outlook.com (2603:10b6:408:360::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:44:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:44:08 +0000
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
X-Inumbo-ID: 89fa4b77-efcd-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM+gAmZFXeXrtw7GX3QObwoZ0o2fzWW3wDVYJMXMVw4oRKbDsxry+u4UwjkIoQqbNl3PK7nZe2Ebz6jaTAqWiCqZsG1ec9hJ4542q84pCZEnc2OCSce81T1E4HabEf5htOarIIf0QCvXHOlnVGBRS7MZRBFexEhywf1JNvkt5pMtJ/sfG+eqd8/3Y9eUy3dCv3WWdQK+YwIjJ+gVRYGnvSkcvoffzIIHXUc0+Gm5NwpWdHaP+RkiA2AM3j+QUac8aEHkYLhAQJJ0Uo92d2/A2hg3qqBxTsJtTiXRrHP9+RpmpM88QZv3680EhsZ7+fId9mSvN2IvZuoUirJdXJs3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyoWAi6eInynUxeCQCkvdupEhitQPHlm6s9xJHkS6Cs=;
 b=SUyk5+HKFi+mjMzjDikE5d9wOoOWw9K65hizWcULx2JhYFMxMuFZBvM1VEWH/ccSVdXSRd1aj16MSwD0Z9kfeVCM4YD6+wxlfCCet++egh0sLGCcbh9IOBFLyQX7OwKSHPeym63BqwaQo+eb2b/ValMtAY1NIWVxSSKtKcE897uPHXcH7NT/LXhugR3bgATn78+SE8xYehXofzWw9nVe+LOVXJT6iOsG4t6oPFxI69lNFq7ugLgtyfPO5qu8DJnJKsyIg8F7psRyDH4tL/7pvC4E4o42jKWImM4YShV95R8nV4MgUCPUDB7I/Ft5p8wtxBLN0eod3HqOCuDcm3YdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyoWAi6eInynUxeCQCkvdupEhitQPHlm6s9xJHkS6Cs=;
 b=Qeirf+glgtM0w4jdATEeTHP0EgLpZ7Z0Ot/xIGazKGxNheMM0+/AAFL68BBZPAUHECZVse7b9oJtFvvPUrocb75mEQzEV4In16jAmlEWXRuBnGJHz6GKKHa1V1DDE/n0o75IOrSrjrpiZksdY9B9u8QA2+FAe4cgxoY5M31Z04g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0770d48c-ba38-4480-ae96-a16de8cc9bf1@citrix.com>
Date: Mon, 12 Jan 2026 15:44:05 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/ucode: Fix typo s/mitigiated/mitigated/
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260112150259.74535-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0637.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV5PR03MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 682ebf30-6c1f-42f3-e8f2-08de51f16cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWhWOW1kS1NHZzZiK21oTS9BQ2hrSXVJYUxXOXpKMU5lNVArWmIzdzY2TlVL?=
 =?utf-8?B?K3gzOTZlUkFsSGt5NGk4UXAwNnowV0tjN0diMTBUNW5VMkJwNUd2cEZJVHJ5?=
 =?utf-8?B?blV3ZHFabmtxMlNpMHJ6dGRhNjd3ZVhWTDF2UjVQTDRTL0d1Skk3UkxGZUpH?=
 =?utf-8?B?UDduZ1prVHpvVko0ZGM4NmpMVE9uTUVsRmVIaUVzQ1ZyOTBBWmhxUjI4TzNU?=
 =?utf-8?B?bktVMXl1NUJ3Y1N5QXlHcHl3a2MxdkU1cXkwSjZrTVpuR1d1dHg3MEY2Kzhi?=
 =?utf-8?B?cXNLaFB1cW40T29zOSs0cHdRUUd5U254YzU4UEp1Z1lUdjF0eXVlVHhHMXdu?=
 =?utf-8?B?bDI2bk9paVBqRFdkVVFUMEhvNTdhZGZkN0lGU0V3SC9EQ0V5ZWFjRFFUZVp0?=
 =?utf-8?B?NTkwclE2MFZnZnpmYXp0VTIvMjZPSlZEUFVlVTQveVltSTFLcHVHQ0VIMWgr?=
 =?utf-8?B?Q0NIVGVncm1uT09mMEUycnNPQXZKOW44ODVTbnk5TGIwY2NBek5SVyttTTRv?=
 =?utf-8?B?eVNicDhMc1VUem5WeWVrbGhteHRXekJZa2VRLzNyZkxvRkthaW1GeU5ndmxK?=
 =?utf-8?B?VXBEeS9sTUNzSEM5UzFnSzBvb0F4MWliZUU4azJaYWhld3RoREJZK2w1YUZD?=
 =?utf-8?B?TnZFSDBIZmtjQnJLaDFMQ09BMFpRa0d4TXFFR1ZIZVQyTnpvUkduNlFNWTlh?=
 =?utf-8?B?dTRUL0RyNFI0WXhxR2NtdWVIWnUyVXlzdGlVSURtMUsyTzJ6M2pjVzgvcE1C?=
 =?utf-8?B?cHNzWXJ0Y1BNMElnUWRuRzVsRGg0VjlPdkJUMTg2M081NUJ0RXNsZkpNdlJD?=
 =?utf-8?B?anFNSHlUamFCQldJWGJHTkJabEpGazRXaG5Va2FMWnBlbGdWYy83QjNudkEw?=
 =?utf-8?B?azYzaGF6ak42WG8rWGNFQmF0ZUVlWjFoYVpYbnkzOU56Sm9KSjFXUHZnM09p?=
 =?utf-8?B?TUw5V09RNjVjTU80UURSeFpnNEl0RHRiTnFWQWdOSEpEWnhiWVZheFpuakFz?=
 =?utf-8?B?Tmlqb3RoMHdIRjRJQUorVTVYTk9UbVlPRTlaeGhyOTFkbnY1ZVk1L2hESHRl?=
 =?utf-8?B?OGNwRDFNWFhacUNlMk9NMnM1TFdoZmViUHhjMHZXaWQ2b3g0RHpQaC9SOWZl?=
 =?utf-8?B?cWU4K05SNmhuQ2FSUXo4c0F3ekpUbW9kMGFONlpUUkhJLzBZYy8rakxkWmtv?=
 =?utf-8?B?cXBFOHp2VGpvNXdhMHRubnFUcWdPZTBGNXlYTWRDbnQyaVZQd1dsK2cxY1Rx?=
 =?utf-8?B?RTV6VmdqWml0RHM4Y1ZhSHRNeGczaDRFdDEzakw2U3hydUZSQ2FyU1ZMeFRI?=
 =?utf-8?B?STBTRHZjWVpXd1p2bUpWamJuOHN3M0NzWTNXbnZiUVU4b3ZHRnJVTlc3VURs?=
 =?utf-8?B?azR4YnZzL0hYc25HaFRlN2paM3g0N2ZJR0hBa0tkRFhMUWVxdmtoeDVPWlgw?=
 =?utf-8?B?Vy9mVFhOS1ZlRXUvSFA0dk52SU0zTnZ4TUY3cUlhSml0MVVuMGJ2aUVNTjlR?=
 =?utf-8?B?akpDeGJqbUw0eFBBVm93ak1OT09wbDJmR0FaSzdRSkN2alBBV05jT2FYV0Zp?=
 =?utf-8?B?QnR2Zk1pZGRzUnJKVm13QjNqbzZRRThzQ0RLdEE3bVZTYlNyaUM1WjJWSTFk?=
 =?utf-8?B?MjZRUzQ4ajdYeWFCM0tUTit1ait4S1JZcTRPS1B0aDZpMUE0WWp0ZGZheWlF?=
 =?utf-8?B?ZVErOVB1a3dQZVpxc0wvVm5DMzZONWVUeFdsWnNteHpzWHp6VHczU053UWlj?=
 =?utf-8?B?MzBmdHNabk1pT2c4UEw2NmtRbmtLN213OVhYamJYcTRDR0FuZ0FqNUpKbWpl?=
 =?utf-8?B?aDVMbUxOUE5zOExGZUQ4QnZkOENncjdRd3ZDNHNiYTQ2a2t3NXlCalIwZWhB?=
 =?utf-8?B?bEtvb1N3c3VnaGtMOG1ybnE5TVFudGF0M3VwM0hQUE1ndEowQjBGMVZRa2pT?=
 =?utf-8?Q?k4H3ynt2bKyClzuxo+DIAOT9UODwm6Ay?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzhzSDloakgvVUUxZlloa012Mk5nekFHaTVOaTEwMmQxeGVST3ZBN2o2Z29N?=
 =?utf-8?B?WWRWcHFwaEhITWpETU9QRUFlUk1Nb3JVemZtUDI1VmZhaFAxNVVYZGdLKzVn?=
 =?utf-8?B?aHUwdzZnd2RFMDc3TzZvMTN2L1JHLzRrSUViRE85eGFCL2gxa2IwZnVXc290?=
 =?utf-8?B?OUlhbzFqYlFURDV1TmdWOExxWXJnalRrcTNWV0p4WVpJajdORzFqZzBnZ3Bw?=
 =?utf-8?B?NVJickRTSW9kZjJ3TDAxZFBSZ2VtckF3U1R6SG45dUREVm5UekkyMlBlOEtQ?=
 =?utf-8?B?bjBNdVpYU0IxREdNejFQdXpIQkIyNDY5anlMaXd5T0VIanJ1bnpHQk5ibUJi?=
 =?utf-8?B?L3pCM0hBZldUT2xITTFZSlNVallaOEFLWWFuZk8rUFBTNTVydGhSLzZNanBC?=
 =?utf-8?B?cTZ5R2JsdS9pOFVKQ09iMUdJR1VWd2M4N2dUK2NTd2QwdnBhKzlVNVl4bjNT?=
 =?utf-8?B?SEg5REMzdkNPSWRPWm41cExvVmU5ZGtwNDYrWWtoTFp0L25aSXgyTUlISjJR?=
 =?utf-8?B?TEk4QjVqOFhLVmR0aVQwV2FEc05VZElja1M2VUtiQ0ludnJtYkVNazBxRTAv?=
 =?utf-8?B?ZHhObndqd0oyZmh6Ny9GWFd4MnhnVHFPQmdLMnJGUFpRSFVtWGsvVTlPTE95?=
 =?utf-8?B?Q1ovUU1tUm8va21xOFdLN1dtOVFxdVUyTUgwMkxXNkx5UlNCcU8yalJFZGxL?=
 =?utf-8?B?QkQ4Y3ZqNm1xdkUyRGhRdGRKMFRtLzVjWHlFZG5PTDhzWVNvQm9nK3k4dWwr?=
 =?utf-8?B?dnZ6RytxU1NnSkZPTVRUMVZuYWRBdnJlRUIwbXc3MkxNSGd5Y0VmSDRNUnVU?=
 =?utf-8?B?S1RJaWxHWkdDazI4c2NHQUpWbjVrSTBIZjN0MVN1azdCb01WTGtqclN3RDhV?=
 =?utf-8?B?NS9wS0tYY2tDdEp2b2RBQnVCYVJqMDR4dGttWVZjUFl1ZndPTkZDcUxxZUdo?=
 =?utf-8?B?Nm9LTnFKK0szK053UmM2QTk4dThtTEE5aGVJbUpiQ3hBMThGazJrNWtiT0x5?=
 =?utf-8?B?U3lGbnRKS0JvV1V0K2xYQUFDcGV1REdRZndpTEZDcGw1M3dYWmlNTC82dU1X?=
 =?utf-8?B?UTFNeGoxdUR3UWV2OVBzU2F3ZDhqcHZjRDhKM3JSYmpLRHY0NmkrSUcwVUsz?=
 =?utf-8?B?blpJVlFEd1NpczQzNjI1TW5iU1ZrcXRJTXRxaGZZcTZyQmRsZGVZZjIwZXB1?=
 =?utf-8?B?MzM4MFRkdVBwaERTV3JTVVVkK3R2Rm9nM21RYWxlMk1wR0tYSzFydCtGZmpH?=
 =?utf-8?B?R3Y3NktjMVhoOFd0eFY0SUp2TmNKTTdDTm54b3dHZ2xWSE1Udm4xdXREQUF4?=
 =?utf-8?B?d2o3Z21mcW5lczFBSVNVM2Fjekp4RHhuWExXanV1SFBxWG5rSjg4TjFjWTU4?=
 =?utf-8?B?MFdFWmI3L2h6OFFXMGcwcm80MjExa2EvNXVVL1Z0VXVHeWp5Z2REdjN5ZGVa?=
 =?utf-8?B?S1UzL0VJYVJzandkaTdkWTYwV3RCUmFDTzdqOGxrYlF4R3d6Yy90cjEyWFVt?=
 =?utf-8?B?bm5YZ0J4YktjWDU0ZDFEek4vN2xseW1Xb3pIL3ZkaHNVQ3lYem5XZFJVYzV5?=
 =?utf-8?B?M0Zvcm9DSTFvbnFzRklDditBbDJNTldBbGYrVXZocS82dFp0aXpBeW1RY1ZH?=
 =?utf-8?B?cVRXMk8wZUNiUUdsdnR1VzBkZG0vSmxJdUtGUkF3UUN1M2c1RlVxRzlSQlVO?=
 =?utf-8?B?bXdYaCtPRGU0TzVtb0RXeGs1NTNmTjdlOExmdUcrUEQ4Uk1yNy9QK3o0bnIz?=
 =?utf-8?B?em91Y29HQnNUWUV2OG43N012MjdTM3h1RG1ZVjdHMjBSSndRMWtLZnIzNmFK?=
 =?utf-8?B?U3JCamZyby9RTzRuUUFVUUJQbGNCVGhmaExIYm83VUdNQUF1YmZOVyswQzJu?=
 =?utf-8?B?REdtaThuRXUrdTRkQXRkeTlKdHY2WVFiWjJrV3NKS0picnQ1MVBqdHp4SXVu?=
 =?utf-8?B?dG5JUGlsQU5waTB3ZEZPUlYvY2U4NHRYc2lqb2VuWm5ubkV5SzIvalcvcVVz?=
 =?utf-8?B?dytzSEYvVXdoWlpCbUlrcGtGMExJamZPWjE2aHFaMGlsUU5aMDNIbDMxajVF?=
 =?utf-8?B?K25Ib0tJOEdnWHJUejNVOGYwbDBPL1Y5QnNoVElXVUtjZEx0WmIwSzd5dFA4?=
 =?utf-8?B?N1YyaGY4Mi9mRkhXa05ZUXAxZkV3RUVjbXAzdFBES2FMK3hvd29MQ29pZENz?=
 =?utf-8?B?QWpHNjIrNmxndzV0NEhFaHo1VWc1YXVvaXJYOFRQRUNiZ0s5NW90eVRwZWtH?=
 =?utf-8?B?QTVNUTc2V2tscVVUS2dZUUpDK2Uvb3ZyaTYxdVJPbHNwQ3FnendIcEdNaTlG?=
 =?utf-8?B?dEhzeUFkOGZRQ1ROMXFRUGw1ekZSRFdzWG0xV1QrZThmUXplanVZQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682ebf30-6c1f-42f3-e8f2-08de51f16cbe
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:44:08.7375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPuUTL17QkZsK26+6fMQ0r3ER39QlS/QUf5N1rEA1yqiEn7zNLD175nLJGdS/B93q87oLChuVlsi4Ek5uwkIBv0CNi52zfbVPaz13NSVbT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8458

On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
> Not a functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Oops.  Clearly my fault...

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

