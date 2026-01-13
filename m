Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7E8D19404
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201741.1517331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfexj-00065p-Rx; Tue, 13 Jan 2026 14:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201741.1517331; Tue, 13 Jan 2026 14:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfexj-00062r-Nr; Tue, 13 Jan 2026 14:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1201741;
 Tue, 13 Jan 2026 14:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vfexh-00062l-Fs
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:01:33 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d08beec-f088-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 15:01:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA6PR03MB7735.namprd03.prod.outlook.com (2603:10b6:806:43c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 14:01:27 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:01:20 +0000
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
X-Inumbo-ID: 5d08beec-f088-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQ1M/waEsnI8GeQTLxFT3j1ZtpkNd2V9bNPGe1BuPoGI0I/yBFH0QunLAKvSpAeB94ahkYyiO2hlz5dWQfsuaCUXEfh9Sk2/q6skpWVoOIeWscDh2siClyXyE98WKWZF44eL83OW14NFQYi/FftUtXFab1dLEmHehOAZ0qTDH+6FPjCCB9x45fzrwurXJHU53OQ9K+eQbzCzWC/KO0LDThU+xtyE5dABcrGf7LryVnjiOov9rn941uNR2CTEYmO73Eyz4H3Fn1kob3aEmNmQlrzaiOwjJbYljoAzsqOFiuXa2oJmA2g/l9hYX8ZO5aW8eeUZfU9GUpliOdRZO0h3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DuMkhpSsc0/+mMpGd2m3Wpu6gUezUsD1TdTB/KCR+k=;
 b=hdrWRH7Z9cpPhHIOyOYNCH7z9KkobCMiKWxWNmzBOqc+LxFojtq7W9Nz6ijGo9xeoPBPS+wUefYWY39ywkCon5LDzyUW84OxqPHG9NZxiqRVqWtnavpl8Ve9E/+LnnGfBKgKV2xmOChOzO1qXFFH9Dyo9qOc1WlWloNLA9he6sG0oLTdkZjfGTbYM3bTAskz1bo2TOt2kfhKNTBoQkSFRT0uUag1IJwhxpaLL4siP4RU3WyQCFjsE6r6K2sBMHO8IC0FSusec6rmzpx3gEKsM5sWj9tjNfKubOdLGBJGPRjdlVV/0gM40eZt0GE9yJOsEktXVK6nnGoNKJJCh7mFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DuMkhpSsc0/+mMpGd2m3Wpu6gUezUsD1TdTB/KCR+k=;
 b=IWu08B7Mpa/1KBs4Lb7qR8Vf09HlYXcDKiNbsD43oU5cRl0nz3A0Jo6b9/Sv+1+P3WdwFs7cJqTkGz9g6crv+9uislkQPtK+GoacCzmzUSj7oplmwUMqvXP2n37AMG8PcGQ1qYYdvdttPO6yhMIT5VUMQEZ5ZR7EZrw30ZONopQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Jan 2026 15:01:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] xen/mm: limit non-scrubbed allocations to a specific
 order
Message-ID: <aWZQLL997K3MTQY4@Mac.lan>
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-3-roger.pau@citrix.com>
 <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b547676c-ff2e-4a56-b3b4-2b2da167e2f1@suse.com>
X-ClientProxiedBy: PAZP264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1ef::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA6PR03MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bca35b1-6b21-4adb-06d1-08de52ac3aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmJ2aE5FSXpnOEJsKzRVa0tjcDkvMStienlLZE5wWkhSV2cyanlEL1ppLzZD?=
 =?utf-8?B?enNPYisrUUdBei9NK0VqeERUL0NTdWJGQTcvYkhvU3RzaDZ4MjBKSVhoQUpu?=
 =?utf-8?B?YmI4djhFWUoweGxwaEUrOVliTnFBVUQ5QTN1OVB6cXUvS0QwNUtnTjFncG5Z?=
 =?utf-8?B?QXNET1JJdFVxVHFYUnJtM2c1NmpMVklmM1dKaDRWZTV2UlFyTkZ0eFN5clVk?=
 =?utf-8?B?Wld6Z3MxNGlaWTIzckZvbTdxS3h6S2RRSXNHWlJWYm1paVRHT0pML0RSTlVN?=
 =?utf-8?B?TzNSVy8zM0FwR0lsTVI0c2lBamFFY0N0Zkp0SjF5Q3lVdzJpK3ZYb2FjNWJ0?=
 =?utf-8?B?YmcxOWJ4ZUNwSlQwY0ZVK3hKdW9uRHoyQ1F4TkZsOGc2QUZhMGRPVEViczFp?=
 =?utf-8?B?Q0FIUFFmYlh0MitPNnc0akRDdjJCQUhvSjJrN2ZGcmNkWCs1Uyt0b2NNYzRG?=
 =?utf-8?B?ZVJsVTB5Sm41TnRqUzBJWlBWOS9RcXdWSE4zdGhJajdXdjE3TlI4OXJjelMz?=
 =?utf-8?B?UVRQTm5tMWR2TmR2T1pmUE1lOVZiRjQ2TG5iVWpCTFI2c2FsWFliWEZmMThZ?=
 =?utf-8?B?OWNmOEY5dDhqbG5aRVdoWmNwWkdzUDl3NStSQlNlMXlWeTBicmtPeDhwZ0Ru?=
 =?utf-8?B?c1lOODdWL3praHZqM3NvdXRyMFRPUG1IZ0NlM2hnUjNIR1MyV29tSjg4ejBk?=
 =?utf-8?B?RUk0ODFTYkJUYjgza0g5THBPaFgzZFhLYS9iTVNNRE9UWVVqUkFhQVpiS2ly?=
 =?utf-8?B?RkZLcDl4YnhpQVYwQlh3WEhScm5WNGdvdUJvRitKYk5JeVlFVFVsSjlCWHF5?=
 =?utf-8?B?KzNmSEJJWjMvTzFiUFREMWIvK1UyRDNXSXQzdXpSenlxUWdRYnA4Q3lqeFhH?=
 =?utf-8?B?L0VwUGRBYXJaTUhnZWhNMDZMS1U3a3BZOWNNb1g4VHVNTU50SXlPODhqeEg5?=
 =?utf-8?B?WHl1RDdNd0dmMHd6U21zdUN5YUhNc3dmNWNnWUNZMUZlcEpUQ0hMR256YkZM?=
 =?utf-8?B?RmxhTGpJSkRodmtWKzFzM3YvQlV2R3dYLzl6cGduSkJEc3Q3K2tNRUEyQzlw?=
 =?utf-8?B?NGdGQzcrU2ZtMWFVTWtPZUdFalh2VHZjbndrWmFxR21QQThrMTZSNzZPNitV?=
 =?utf-8?B?TWdqV0k5Y2dxb3MzMkJFSVBHTU93VWVWMDI2Nk5LNGpFNzBmOHZMSis0TXZO?=
 =?utf-8?B?M3NCWUxGV0U4VkxZNWE1ZnNtTW05TTJENkhLVEJHcG8vK28xV2tGaTVNQWZk?=
 =?utf-8?B?WTZkV3RYdTNvWWdpTG90cEZPNFhKai9PR1VOeGdFY3NESnh4RFMzNzdzN3Az?=
 =?utf-8?B?L1Q2cGczaFFXVFFqbmdZOFRtUHRYeFBsajFSMVA2aWhTK2JkeDJ0bXBJSUV5?=
 =?utf-8?B?bjE1R1cyVHduZUFVbWlQZTJ1aW53dGtmRGZsNGRpdnBiRVZsbHErM0JXTytM?=
 =?utf-8?B?dTJxUXpicURkMEVYUmgvMmJJNlZ2S3M4L25UWHFtRUhqeEN2bFVVUHp2SXI4?=
 =?utf-8?B?RlFad3l6c3dmbFRsSHJoREhPTjlibHhmc1YvYTd6dDNhdXVzRXFQUEhVL1JP?=
 =?utf-8?B?U0Z0d3R5WWR4aGk5SlVld295SHNXVFlkOTJEeVJOU21lb1dZZ1hIbGhpS1VW?=
 =?utf-8?B?VXp6SExMOHBCZDRyTEZWczZISVJTank1MjBJMkVmSFVCRUpuVllMQ04rNlB2?=
 =?utf-8?B?Z3lOa250UHhoajBpaFFubndnTGJRSGJWWmJaWExlakpVcHJwVUNxV21FWnVG?=
 =?utf-8?B?bVl1V1NYaVY5bUFFVklNZ05GNzByTFhGMFBScDdmbFJzWVZiank5ZWhKcENY?=
 =?utf-8?B?RDBxdWtOcW1BSGN6Znc0MzBVRjFZQ0c0NmpGbmNKak1UMnpFZ1hlL1ptUkNp?=
 =?utf-8?B?ckhkeUdvMXpOQ0phK0liNVpJNEw4U0F1Z3pGVkwrU29WTXRodGZiNVpSL1I0?=
 =?utf-8?Q?sn0fy10H1s30U/aKQLGqfMrjXnK2KAjk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjkyT1V5M0xlWHRLQUJ0eFpCbGhsWk5yZ0p6TWF0QUFNcHY1WDlDSXp6NzZk?=
 =?utf-8?B?R3NEbEhoL1JtbW52TnhOcmRKMU5uT2VVOUxvaStTRyt1V211VnhJWkhnV3hD?=
 =?utf-8?B?Yjh5N3ZlOWEyYVVIWUpwTTdIb29YYnZXNlZ6UzQ5bmhTMG5Vd2xLY2pFNEh4?=
 =?utf-8?B?OXRPbGhQSkVUMXpRNndZUG9nalJyV3ArNWRXUS95OVFyYzBhMGU2T1ZjQk9N?=
 =?utf-8?B?dDJCYkRjem83NnA2WEI2SkJUZU1SSHhPQzRUR0JOVUh5Vjl1Qnd1dWlBdUxv?=
 =?utf-8?B?QTBmMnlNQlYrTWJPNnMrNkMyTlNzRllmZUVRZjg4MzdFYjBkRnNXZGxYTlE0?=
 =?utf-8?B?Nks4Z3ROblBPOXNXUWlVVG9xQWw3RlFScTZBRkEzTHJtYlNFSnFjSjlDYUtr?=
 =?utf-8?B?T0trR2lZbjdyc0ovU25qRmJ6MmZPMTE0d0lsbmJPSnEzWHUxWWpSVjlBMldG?=
 =?utf-8?B?L1VuK3JDRnpSaXhsMzZ5QzdWamVOdVlqWk03R21iY1ZqZFJNTUpzSUNESk5Q?=
 =?utf-8?B?M3VYVnVDRnJuRUMyanVNSlludkRYRFM2NGwvK1R1eEFUNUhQVUYzMHBxaXBU?=
 =?utf-8?B?TjQ3T1A0aVRhc2N6b25pM3Q1K1pXQ1Q5bXkwM29OQ0I1VDNXUlo5eUYrL241?=
 =?utf-8?B?bHNJTk9vOVRXbURud0hoM01QZ3J6aGU5RGYzcnNUR1ZZWHVJbHpxQzFWcDRL?=
 =?utf-8?B?YS83YVc5UEZRcUdKbFY0cGlvKzJDd1RvREpwTkNyNjVsRmxoQXNac0F1dTFM?=
 =?utf-8?B?blF3OTF2SFRobmJGak81SVgrZUFKbkg4cGhzS29tS2ZNU1ZiRmZkMDJzRmFl?=
 =?utf-8?B?OURBTmE4NlJrSDZCamZpcjVJZmVWeXhodTdSSG4rMHphUWgzL25SamYva0tL?=
 =?utf-8?B?RDQvejlGV0dUZXVTRXZEc0hUQmxiblAvNDBqMDFsL1Y3djV1cEZTR291bXdB?=
 =?utf-8?B?dkdLRkNqSEZCQjRhTHdXeDViOEltb0wwallITjBzdG0zOEtUN2N1UkZoQnpY?=
 =?utf-8?B?SlcwejVmU2lRNm15ZjVNQUxxSFFkUUc0aGowUURiWTVLM2N1K09FZE5rOFNy?=
 =?utf-8?B?YU5zb0JGbzNvZ295ZS9TSG9ydzVpUU43dTZuTmRMU3lJYSt4TDUyczI4WDFH?=
 =?utf-8?B?ajhENklaem1Ka1RLMkpMZW1HdnVod1FycjN3WCs1T3BUNDlTZnRoRXVYRjdo?=
 =?utf-8?B?Zm05TXVzaHk4YnJ3dFRCQVMxRkhQTXh3TmlWLzk2V0EzOXdNQkJYRjdyRjhG?=
 =?utf-8?B?SEM2bGsxQnJUMUJ0YW9lOEpTQnZLaURMTU1UcHdQdHhpcm9NMGRHc1RTOUp2?=
 =?utf-8?B?ODdXZjc1eEJJWmlEQW5WZlJ4Ky9DT1lEODBHZDdnRytMK2N2N0lYSU1NSTFt?=
 =?utf-8?B?MWRUZXRDZCtlK3l6STJNczFLYUpmc25LcjhCQ0kzYVh2WDg5ZVlYV2pGRHlE?=
 =?utf-8?B?cjk0QlJXa0xJMUFZdjZUTW5pRi9uc1lIT3N1bU8yVTFONkM2clJDdCtQNDI0?=
 =?utf-8?B?STdYcE1IYkFaV2FOUHlwTlJTQ2d4enYxMzZmMVFCQVV2QlNUc1RZTGExQWtK?=
 =?utf-8?B?ZzdzekRFVjJzbGthZGRISUR1dFpTQ1NuWk91aTlyTXBUR2xPZURnblBjWmNq?=
 =?utf-8?B?ZEVUd0llbVBZRmpBc2xzRVp5ZDBkcEVaQmlQc055TDVPdVFSZ1p4QTB6bDhj?=
 =?utf-8?B?L3RSMS9sajdtVVM5bk55SGV2RmxNeXdFWkhuVFpKY3ArV3NoRFBlNGFpK0tB?=
 =?utf-8?B?ekd3SU1SUjNuK1QyU1lpeExOSXhIYkM4dmhUZ0VUdEtPZyt6dHRNUFN5amxY?=
 =?utf-8?B?U1ViUU50NFJqNWV3aHJDQi9XWUxRQkFVZWhXRWtSZng2MkZ4K0VoSVNHYjVX?=
 =?utf-8?B?OTI5Nlh5YU1ndjFBT2dYVFpCNW9yKzViOTN3TEs5TVhBYlVZMWlkMTY1TVky?=
 =?utf-8?B?Q2tlR1pQM3hjUUMrUkFMcERUR2xDelpOOHh0ZCt1aFdEYmVKWHJLcFBWRU5I?=
 =?utf-8?B?KzVrc3lSRHM0WTZWcjdvN3lPNmp1RCt0dnhHMTlldTF3K0RqMG5veExpWU5i?=
 =?utf-8?B?TWxVd1dGU1dPT2psVERJRk9yQjV5Q1pGRTVPekgwWjhmNTFaOG11cHZSL2FF?=
 =?utf-8?B?Z2JQUWxTSGJPSUhETnAvaWk5d0N5YVRVNFJkL2RTYkpWalBpdWZQQkRZK3E1?=
 =?utf-8?B?bWJxNXpGRUdBaDBmTkFGVmxQeUVnY1VQUmVZNFJPUUxBR2xRcTllVXVGV242?=
 =?utf-8?B?S3pNbXNvRkhDUmxUL3ljOU1JQkFvanhIN3hSdkJvWEZpUzVCclNyN0ZGaVN6?=
 =?utf-8?B?TnhTdUVoRGZVRU1ycGlEdXVrWU1Dbk5CRExOMmlObzN3SlBvRkoyZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bca35b1-6b21-4adb-06d1-08de52ac3aa0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:01:20.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D0fbmlCDYETZP68rsBcv2ApdGgWOr+gEht298GVnJpBo3F8d9iXmgFBxTR5vU0XfIixZBAOuATNdAfZ6KlaltQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7735

On Fri, Jan 09, 2026 at 12:19:26PM +0100, Jan Beulich wrote:
> On 08.01.2026 18:55, Roger Pau Monne wrote:
> > The current model of falling back to allocate unscrubbed pages and scrub
> > them in place at allocation time risks triggering the watchdog:
> > 
> > Watchdog timer detects that CPU55 is stuck!
> > ----[ Xen-4.17.5-21  x86_64  debug=n  Not tainted ]----
> > CPU:    55
> > RIP:    e008:[<ffff82d040204c4a>] clear_page_sse2+0x1a/0x30
> > RFLAGS: 0000000000000202   CONTEXT: hypervisor (d0v12)
> > [...]
> > Xen call trace:
> >    [<ffff82d040204c4a>] R clear_page_sse2+0x1a/0x30
> >    [<ffff82d04022a121>] S clear_domain_page+0x11/0x20
> >    [<ffff82d04022c170>] S common/page_alloc.c#alloc_heap_pages+0x400/0x5a0
> >    [<ffff82d04022d4a7>] S alloc_domheap_pages+0x67/0x180
> >    [<ffff82d040226f9f>] S common/memory.c#populate_physmap+0x22f/0x3b0
> >    [<ffff82d040228ec8>] S do_memory_op+0x728/0x1970
> > 
> > The maximum allocation order on x86 is limited to 18, that means allocating
> > and scrubbing possibly 1G worth of memory in 4K chunks.
> > 
> > Start by limiting dirty allocations to CONFIG_DOMU_MAX_ORDER, which is
> > currently set to 2M chunks.  However such limitation might cause
> > fragmentation in HVM p2m population during domain creation.  To prevent
> > that introduce some extra logic in populate_physmap() that fallback to
> > preemptive page-scrubbing if the requested allocation cannot be fulfilled
> > and there's scrubbing work to do.  This approach is less fair than the
> > current one, but allows preemptive page scrubbing in the context of
> > populate_physmap() to attempt to ensure unnecessary page-shattering.
> > 
> > Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > I'm not particularly happy with this approach, as it doesn't guarantee
> > progress for the callers.  IOW: a caller might do a lot of scrubbing, just
> > to get it's pages stolen by a different concurrent thread doing
> > allocations.  However I'm not sure there's a better solution than resorting
> > to 2M allocations if there's not enough free memory that is scrubbed.
> > 
> > I'm having trouble seeing where we could temporary store page(s) allocated
> > that need to be scrubbed before being assigned to the domain, in a way that
> > can be used by continuations, and that would allow Xen to keep track of
> > them in case the operation is never finished.  IOW: we would need to
> > account for cleanup of such temporary stash of pages in case the domain
> > never completes the hypercall, or is destroyed midway.
> 
> How about stealing a bit from the range above MEMOP_EXTENT_SHIFT to
> indicate that state, with the actual page (and order plus scrub progress)
> recorded in the target struct domain? Actually, maybe such an indicator
> isn't needed at all: If the next invocation (continuation or not) finds
> an in-progress allocation, it could simply use that rather than doing a
> real allocation. (What to do if this isn't a continuation is less clear:
> We could fail such requests [likely not an option unless we can reliably
> tell original requests from continuations], or split the allocation if
> the request is smaller, or free the allocation to then take the normal
> path.) All of which of course only for "foreign" requests.
> 
> If the hypercall is never continued, we could refuse to unpause the
> domain (with the allocation then freed normally when the domain gets
> destroyed).

I have done something along this lines, introduced a couple of
stashing variables in the domain struct and stored the progress of
scrubbing in there.

> As another alternative, how about returning unscrubbed pages altogether
> when it's during domain creation, requiring the tool stack to do the
> scrubbing (potentially allowing it to skip some of it when pages are
> fully initialized anyway, much like we do for Dom0 iirc)?

It's going to be difficult for the toolstack to figure out which pages
need to be scrubbed, we would need a way to tell it the unscrubbed
regions in a domain physmap?

> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -279,6 +279,18 @@ static void populate_physmap(struct memop_args *a)
> >  
> >                  if ( unlikely(!page) )
> >                  {
> > +                    nodeid_t node = MEMF_get_node(a->memflags);
> > +
> > +                    if ( memory_scrub_pending(node) ||
> > +                         (node != NUMA_NO_NODE &&
> > +                          !(a->memflags & MEMF_exact_node) &&
> > +                          memory_scrub_pending(node = NUMA_NO_NODE)) )
> > +                    {
> > +                        scrub_free_pages(node);
> > +                        a->preempted = 1;
> > +                        goto out;
> > +                    }
> 
> At least for order 0 requests there's no point in trying this. With the
> current logic, actually for orders up to MAX_DIRTY_ORDER.

Yes, otherwise we might force the CPU to do some scrubbing work when
it won't satisfy it's allocation request anyway.

> Further, from a general interface perspective, wouldn't we need to do the
> same for at least XENMEM_increase_reservation?

Possibly yes.  TBH I would also be fine with strictly limiting
XENMEM_increase_reservation to 2M order extents, even for the control
domain.  The physmap population is the only that actually requires
bigger extents.

> > @@ -1115,7 +1139,16 @@ static struct page_info *alloc_heap_pages(
> >              if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
> >              {
> >                  if ( !(memflags & MEMF_no_scrub) )
> > +                {
> >                      scrub_one_page(&pg[i], cold);
> > +                    /*
> > +                     * Use SYS_STATE_smp_boot explicitly; ahead of that state
> > +                     * interrupts are disabled.
> > +                     */
> > +                    if ( system_state == SYS_STATE_smp_boot &&
> > +                         !(dirty_cnt & 0xff) )
> > +                        process_pending_softirqs();
> > +                }
> >  
> >                  dirty_cnt++;
> >              }
> 
> Yet an alternative consideration: When "cold" is true, couldn't we call
> process_pending_softirqs() like you do here ( >= SYS_STATE_smp_boot then
> of course), without any of the other changes? Of course that's worse
> than a proper continuation, especially from the calling domain's pov.

Overall I think it would be best to solve this with hypercall
continuations, in case we even want to support pages bigger than 1G.
I know this has a lot of other implications, but would be nice to not
add more baggage here.

The "cold" case is the typical scenario for domain building, and we
would block a control domain CPU for more than 5s which seems
undesirable.

> > @@ -223,6 +224,14 @@ struct npfec {
> >  #else
> >  #define MAX_ORDER 20 /* 2^20 contiguous pages */
> >  #endif
> > +
> > +/* Max order when scrubbing pages at allocation time.  */
> > +#ifdef CONFIG_DOMU_MAX_ORDER
> > +# define MAX_DIRTY_ORDER CONFIG_DOMU_MAX_ORDER
> > +#else
> > +# define MAX_DIRTY_ORDER 9
> > +#endif
> 
> Using CONFIG_DOMU_MAX_ORDER rather than the command line overridable
> domu_max_order means people couldn't even restore original behavior.

We likely want a separate command line option for this one, but given
your comments above we might want to explore other options.

Thanks, Roger.

