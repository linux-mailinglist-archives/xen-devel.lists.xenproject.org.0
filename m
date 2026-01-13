Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8D8D18B68
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201648.1517227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdWh-0007jD-Rt; Tue, 13 Jan 2026 12:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201648.1517227; Tue, 13 Jan 2026 12:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdWh-0007gX-PD; Tue, 13 Jan 2026 12:29:35 +0000
Received: by outflank-mailman (input) for mailman id 1201648;
 Tue, 13 Jan 2026 12:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfdWg-0007gR-7z
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:29:34 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82b48425-f07b-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 13:29:32 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7549.namprd03.prod.outlook.com (2603:10b6:208:4ff::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:29:28 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 12:29:28 +0000
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
X-Inumbo-ID: 82b48425-f07b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdawEElySxKa6ltDCnhL0pmNKPrirIgDbbarUI02viUMhQwtkueV2ozZqvXT6OJNWOG2ZlpQ03cSkOvEW0SZWu9aQhNHmmo4mtDHcYBSKk43h2qJ1vBIxHU506mLbiJnUaD2aa/hjAfWEXyuLtl7Dv1uB2Oyk9H7duuKV4GaXIO00x+GW4vK2+DCeqmypSYJ40LE9tEwEjExsvcf/3UlYNfM+RCpxDTbLUhpV4Lg8K2nqfOZp7jp9MxUU+T24I5cofR113TDGes5oSo6keePCLKku8+L5VGpCv/DrRu+MsdrHakVVzjUzm4giBF+ejL0WiTkOLxUMbst9gNDg/FadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6bD/w6JXot9y4TDrlAFH+egyNANng1WkJ8ahwGb/tg=;
 b=w/cS/RHEynN5cnUlbyHQ3KR2s8uyiaTEG6NF66g+fKerYdkgGshYdM+gBaB6tn7fX2Y6D1Rlc1hQvokAWUXN2Mmrz8O+WCa3NW0NJVEQqbxDgvEdRr8L3YpD/gJZrrO9yS30JaqHaM1TN40NyBx0n8e8cJRhqcn9loFqGV0KyW2I7prElS5dwmbpNgp9W085iulFZQ68bsVabEPSQXKO17wLL0ecTdv+6Llu3eOC/4+xwgNaEqi2GYzontstx4bgmKJw57W8heMnwXR0Gtot+WpYbXIUTDV01JJqzGB1XxAQWwxqGK5cYERvk79f+PqgizWbiRq9dOmzX/rPxTvdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6bD/w6JXot9y4TDrlAFH+egyNANng1WkJ8ahwGb/tg=;
 b=oSDf28rD0vjYx/5T5MXWnHWnpyHOw0ejTJ+fAzGquo9MWP/dfxAqoew9RljjiWgeOj5EW9PhUEH0FiK+LkmnNK5nwgKPuW5US5Thr2qT8o9HrIPwCZixzKJt95MHq7NtKteAQGL0t2ThGqC5l8IlC0+mCrybwzd5XQGG9p+2WGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5735aa32-0840-4fda-82ce-27a3f63af628@citrix.com>
Date: Tue, 13 Jan 2026 12:29:24 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/4] x86/ucode: Rename UCODE_SCAN_DEFAULT to
 MICROCODE_SCAN_DEFAULT
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260113122109.62399-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf0d48c-b8ab-45d0-07eb-08de529f6536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnk1cGc1SDhJaWJwdVZkWFZZS3ZHVkdqWFJSRjArZ1lac002VlVMYmluWmFJ?=
 =?utf-8?B?VDE2R2lvRytoSmYwcmFGaGo2MjhSUzN4SFg1R3Z6LzRwN212S0VpUUc3TjJh?=
 =?utf-8?B?U203Q2J0WnBQbFBxRmFpa2NHblpxZXRjdGRTbG1xOUFMalZlc2M2R0pSMXhk?=
 =?utf-8?B?N0JpZWo1TER6SUxXYStUN2p3R2RzR1lodktHZ2NvN0VCdE5uY0RQTEJDUXdW?=
 =?utf-8?B?ZCtubWUrY2ZOeE43czFRbXVYckNUWklpajNydCt6NFFlVno2OUhNUW8zd3pF?=
 =?utf-8?B?c3ZWRnhrRDcyWGxKTHpkMDcxNTJYdzFJRWpLTUFUSHlObHNtblRzcnpzallV?=
 =?utf-8?B?NTViSmYyWTdmWVNGYUdrNmxFdzhRTHZSbWUzc2c0WWtrZlF6VHVPQUxLNjN3?=
 =?utf-8?B?USt4amlvYlFWMjBmOTlRMktvS2diSFpLeXp2WVhTdFQ0LzNZNC9NRzkrQWs5?=
 =?utf-8?B?V2lsSFp6RVNoR21vKzVzbTlESTdRM3dJQnE3azZ2VW9objV2TGhHM3UrTTY0?=
 =?utf-8?B?S3o0TUFaRFhySmFCZTFabEdwZktOQUpLQmpNc2tKS0NjZklhclJNZk9FemZH?=
 =?utf-8?B?bElUd3I0MTZ6TEhTa2swOEFERVhlQUFpeDlobkU0VjV3VE5pcGE2TUZSeFk4?=
 =?utf-8?B?ZWg2V3F6SXVjdWlrQjRGK21hb3NQQiswaXlQTUZMUGk0dmdrVGJpQzU3ZUpi?=
 =?utf-8?B?NHJrejZnTFNOUlE0T3h0YUVkNUQ3NmZBNVVvbU8vdFhVU0JJQmxvelppdHZ4?=
 =?utf-8?B?MnE0TERSWXZXVFdFaGJZbmF5NytwMzExbUZDTTV0UUFFRnhKZ2hXOFBKVS9M?=
 =?utf-8?B?VXk0QkhLNXNyV1oyMmRwQW5kUERyVDYwaVQ0ODJsK1NES1lKN0huZkJlMjRq?=
 =?utf-8?B?cFMzTEhzU0NKNHRIUDZmOEJDWXNLcFFUWUpVQ2wvNnl4UllwUFdOTXhuZVRU?=
 =?utf-8?B?YVdiYjJMeTJBUnZOSzNJaml0QXVueDc1QlNXKzJLSW4rZnc0NXRLUmRjaVp3?=
 =?utf-8?B?MkRUTElaaGc0czlBZy9Hcmt0V2pqaFBHZUpTbmdKK0hpdmp2UGtzZ2RIWHVk?=
 =?utf-8?B?Um5pcVk5VjlFcG5qbVlZU0lCVlBSbitSbGF4bWtOWU5kTU83UDFHS0RFK250?=
 =?utf-8?B?bDZhZUhrQ0xpTHd2aHFLWkJubE8wYldyR2d4aDkvTGxZc2s1VnIxT0NtU2NP?=
 =?utf-8?B?SlA4UTFJZEhEYW9QMG4wRnlFOFppMEpYSThBWG90WG1WWGFZL296Q3RZRW9B?=
 =?utf-8?B?WG9VL2FmOVROS2N6bm1XK3kwUzRhcVBmS1ZMcDJJUHhMRGlqZFYrYkMrMHpj?=
 =?utf-8?B?NTgrNFYrcmkxT0t3d0F3eEszZXlFdjdjaXozaDRTZTB2Zk1KYjVITXExUE9Q?=
 =?utf-8?B?TldDVU0wbytwaVFZTEozcWVNQklJRGpENVJoNGFsT08yaXh0dlVCNFh4ME10?=
 =?utf-8?B?dzdwTlF1djBQSEVTUlZibXdFUGdCL2RyT21GK3hHaXBqRklUTk5zNUNRa1pj?=
 =?utf-8?B?aE52a0oxcjE4dk5FZzVtTHRkUnM1ZnpjMVZPVEtLT25SczVEckZGWFRNeHNI?=
 =?utf-8?B?WVF5RXREd0FackNkN2RGUmpLRlEyc3RrSWxHdVNJYmFiWkkzbHRZbHRMUVVi?=
 =?utf-8?B?di96Rm5uSnFBQjRtSEk4b2NyMktLcVpxZ0IxUG9MWVV6eldLQ1ZWakp4bzZC?=
 =?utf-8?B?eE14MktXRm1EWGdzSWNhQnRYaHFqM1M1VTBLV0h3eklaWnFHTkl5TXdwOHBx?=
 =?utf-8?B?R2cwbTJKVmY2NzF3dWUxcWpRUkpxbFdYa0NTRTc0ejRmYTRjSFc1TFR3cTZX?=
 =?utf-8?B?MjE2SWF2VVU2Y2dYbmlzWWpiYUpRYkNWdjBkc2ZoZHhoaFE3RXl4YU9IZWZC?=
 =?utf-8?B?NnVReHBmRWZCQlY2WC9MOWZOMS8vL2JSOWl4czBlbjlTbExXUlZwSExBN1Nn?=
 =?utf-8?Q?cdz9cwbslU6LGNm/z8IHUyyU/j6TDmXW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG84SlRIL3g2QS9iYUMyU1NhMm1oY20vUFVrMkxVRTNValdwclVNOEh6YzdZ?=
 =?utf-8?B?WGFEUlAwTDF2aXJDeTFlWVZoNk85Z003a3QrUUtxZ2swUlI3R3VSZDlzSlVY?=
 =?utf-8?B?ZWR2WjZqMkxwM3V5SFB3anlCak4vUW9vZk80UHRyY1R2T3RULzhJbjRHd3My?=
 =?utf-8?B?M2ZXOUtUclRsK2krZk1xdFBDNGVHM0RhNERrNm51Zi8xVlRWdmN5MzFoZDd2?=
 =?utf-8?B?OUtsaHpxaWo2TzNBaEhDTENrZ3BiUXNwckVoaTBzWGZXelFUcGloekZ5RmlE?=
 =?utf-8?B?aWUrZTljOFZvWGVTSlZ0OThXWWl6clNKNEROUU1BR1J0QWRxRVFlZitWMTJI?=
 =?utf-8?B?cGZWallwUG91NGg2YXVQRnFYT3NsWFc2Y0hBaW1vTENsUnk5MTZiUXV1aDgv?=
 =?utf-8?B?bmpUZVg4MVFuaDRSaG8rdldSU2g5SzRGNDYyQlg0Sjd3ZTJieG5pQ1ZIdC9l?=
 =?utf-8?B?ZW5FeDlVZGpiZi9GQWpPdUhXd1YyTmNSbFBYOWRNZ093US9BU3BZN0FKVzZ5?=
 =?utf-8?B?V3FSVkNLOU9pM09qamdXVFR2RzNvY2t5TytCaTJlQkg4Y0k2eG5PQlppT3hR?=
 =?utf-8?B?eDZjWFQ5UWNHMVVWbmJ5NjgwaU1LODFEVGJKTkFUa1QzMERZKzNhZDlsck4z?=
 =?utf-8?B?WklXS3Y4bGlKbXQxclBlU2RGb0xaM1doQ0lLa3htVG4zMVpNYmYybWIrMDFS?=
 =?utf-8?B?VUJCQVlGS0dNZ3FDVE14R3llY20vTHNYNzl3OFhLYXdlMWUrYTVIbzFhd2Fi?=
 =?utf-8?B?ZDU2NkxFb05PcVFBZmVoWVJEaDFGSitsWmZ1T0QzdllSbWRrMGRhVTBEVTQ5?=
 =?utf-8?B?ZkVwWUlMMWQ2MlZBTGxNLy9wL0p5ZjZlYktJaWpOcGFQdFV6ZHJQbUpWblQ3?=
 =?utf-8?B?cklNRS9LS0pDZHFYT01DdXVmdDdkTnNaK1cxZGQyODhPdERiREIxVVlBQ2Jw?=
 =?utf-8?B?U2l0cTdLYXZnSHlxUnkvb2JMaTdGaDJrMTYvek1WYmY2UkNOU1huTE9YOXZy?=
 =?utf-8?B?RmVla2p2OCsyRjRxUDhGK1BMcURuTVVoVjZ3QVpiMWVVVU1TbThlR0l0UUtw?=
 =?utf-8?B?L1lRd3RFWmhiZWRKOUNDSE1lQ050V0VLYXdEKzdaQVF6ZmZWQmpVcE13WXMx?=
 =?utf-8?B?L3hXblhkYmhpdlZIOHZTdWNKeDNnZGE4K0toYXJBQkxZMzdkN2hlcDdyZXFx?=
 =?utf-8?B?aVpCT2V2TEs3ZVJyZ2ZQa0IyTmpCdUpydjJnd3RNUW9KZzNna1BhbWhjYktQ?=
 =?utf-8?B?YTA0UGFrclc2aXNDWGhWUXNadW1vYjZqSWVpUXJhT3Y2T1BoTldlaGx4NVB3?=
 =?utf-8?B?U2pOdjl6YzU0dlVHL3M5SzJ2SFFHQ0VpVXBrRmwxdk5kVW5GaGZ1SWFCcE9P?=
 =?utf-8?B?VTQwaFF0VEJ1eTlxMEtjVnNCOVl4VVZDR01sTjZvZDRYeXZXMGtITlpmV2dq?=
 =?utf-8?B?cUFzUndGU1R3Z00reFBROW5ZbVowZnd1ZGp1SkZUaVdtc1NkUDVTZS9RNW55?=
 =?utf-8?B?UkNBR295ZWU0d0YwbnRhMHZWYTd6clk4YTd0SUdLTHJWMlk3TDZQN05sa1h3?=
 =?utf-8?B?K1R3MHk0L2tVZGRzRmUyOFZoQVdhV1ZiZzhVSHVvQUxmVmlabVU1enNHSG13?=
 =?utf-8?B?MFN5aE1tRlZaK3RKVUcvY3F2RjNtL1hmZUd0c2JEalBFci9Ic2VVdmpOR0po?=
 =?utf-8?B?eEgwYTY2SkJQL2JlYUd4a3BZbUVmandobCs3VWp6Ym15TTdNREc4N3RJYnhD?=
 =?utf-8?B?WmJuTDZLWEVTMnBuUXZhaVdhR2EyYkIxQVNheWdQOUFadllUalN5OURtZnBZ?=
 =?utf-8?B?cUFPWE5BbXcraUU0VmRYa2dFaVJVcytDKzB1Q1dHOFloWHpzK1lHb3Jyb2Nt?=
 =?utf-8?B?cnNqS0w1YXQ3dWgxSHp2MGo0Vld4YUk5QlJQY1lsbzRUZW9XQWppamJXQUpp?=
 =?utf-8?B?VXBXQzdFTi9CWjBiZzBXaHlseFJVV2tvejgyalMxcEM4eW51RjdwKzJMSk1j?=
 =?utf-8?B?VGtMRFhmdWlrNDZ5dktFQnNtYXUvRk1mMTZlZUVrcWVuUnpjb0YzOUdnRkV4?=
 =?utf-8?B?eGtqRTNGcWltbXMxOTVYR0xOMkFIL1lPbS9FU1VqRFh0NUxJWVBMZ1NESDl0?=
 =?utf-8?B?UkZCZUo4QWY3Zm5BeUNmOFZWMkxvcHN2TjhQaW85UCtRTHZZR3JaVkp5b3Zr?=
 =?utf-8?B?eWN3K1BTUUlRYnJxTWxhVzVVdE55U3h6TkFKbzBwekJid0ZZbGhDQ29hejkv?=
 =?utf-8?B?dW43NW5wSXZpelBMTVF3NlZMQXowZmJkcXA3dW5pckNCQlB3d0J4TTVWU2li?=
 =?utf-8?B?MmdCMGlVMW1IQW4waEhZMTEwL3AwWDVHSnB5MXRLQVEzamNkSDk5dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf0d48c-b8ab-45d0-07eb-08de529f6536
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:29:28.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1Ox6mvn1Js/NHItrZMaPyT40oxX8o+HFbRhAeyVsyKiXXQrbq25UsBgbwD3wApfYOyTUqIlSiTZQ7uQV11ON66jXn/M1NI74LJbs+agP1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7549

On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
> We'd rather have the full spelling in Kconfig. Adjusts every other
> reference to the name too.
>
> Not a functional change.
>
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

