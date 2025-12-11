Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B986CB6D6F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184481.1506906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTkyE-0003zz-S1; Thu, 11 Dec 2025 18:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184481.1506906; Thu, 11 Dec 2025 18:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTkyE-0003xx-PN; Thu, 11 Dec 2025 18:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1184481;
 Thu, 11 Dec 2025 18:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEbC=6R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTkyD-0002cg-0T
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:00:53 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f5c03e-d6bb-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:00:52 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5851.namprd03.prod.outlook.com (2603:10b6:806:11b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.15; Thu, 11 Dec
 2025 18:00:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 18:00:48 +0000
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
X-Inumbo-ID: 54f5c03e-d6bb-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTmbNME3kGphzMRd5l3dX9zA5avwkCiMIx6v1DEkKg77Qaarbys3YOOdRq669tflc0WqWrIF5cgQYi66QPAsF5fTu7WW6UELsYL1szg2hbOiRj2vdovhN+g4oyOK/TRTOWG1RGlxkoITRX60UkLF+ZgAWWMGnNf0+5vJv3rUJuFNj/JgAE6RlQ7Z//ksH6dVF3oBITRMnewK6l8NgB6Q1IlqN4EWEvB0k03z3th/sNSBL54EJnxL0C55q5vaL3k0BZmv8fdna5PfALkg5iT1mR6cqgRZH1CpfiEZ5J+b+N/jGGA9U8Tj/uFxISyz4V+cjxFbUtYGzC2uwwMHx3fLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bO9ZNoyg/dO1UIM0jL1mnfdLsA+af6I1/SfRN24ERFE=;
 b=nWFQUWcLnjFNvYm6FPw1eZ0zVaa85cBGAzoRzi2TsCz4TUwg4grNhVh8m5rbjuamHfJWqPxxNyilvf5eaSaIY51QNHf4bwJUJEnaUmuSQtOWh4Mh0q+iOvF1UnmhcxfysBGBuWXZmhdKx3a+f/RwXBSPrBWYeQhmN5/MAHMejvlly5Y+NbmfT7+hOnKOlzCxLPPsl/EAMjKHL8+yFihZDiA8Lc16xRB08Dabjx0O6SGXLWluUQU3kihN72JMNKZIb1+ysrKFzzEIuDFVA3Q6MMrIMvnJmBGtQRN//01PxCcb3jRRRhvBdM8FvL93/dhW68pKR/f3IKhMtolMH6Et0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO9ZNoyg/dO1UIM0jL1mnfdLsA+af6I1/SfRN24ERFE=;
 b=zcy69nO/+f9zbjdn0mCtBFEPBrJ88/YsomAVSll6f00459O0eTGp2dfFA7s3eSMsynM2Kx0enyRglzfhgM+Kx68KqpuqafA/44rjUaSsSu1BuRvFj1y+q8kLCLVHcJhL1G6zt+67PI0aAm/G/u4UUtOXJS6KyNNC+ZJQoo53cZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <03bbb773-cc02-408f-a01d-bb7f2447e57b@citrix.com>
Date: Thu, 11 Dec 2025 18:00:45 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] CI/eclair: Rename the eclair-* jobs to *-all and *-amd
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20251211161339.2296433-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2512110959140.17367@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <alpine.DEB.2.22.394.2512110959140.17367@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0667.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: b475612e-7a9b-43f6-c719-08de38df371b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ty8xeEpNcmpvc0VQVzhnT2ZRc1ZqOWRndi9DWFFtWFJXZVlaeXJlaDRCZ1ow?=
 =?utf-8?B?T2Voa1B0ZFE1S29uSCtUY1B4Um1Rd0Q3RC9RczNMMm5UUCtnaFlpUzdGMlRs?=
 =?utf-8?B?dmhWVVRpa2VSYytHTk1aRmdhLzlYVTQ5V2xzZjVpb25xR1FoYURiUzBLRzBo?=
 =?utf-8?B?bHB0UmtYOGtIS2V2SWFHMXR6RzkwMEJqdUpSYXVEY1M5aG1kQThNa0pMNlhS?=
 =?utf-8?B?UXliTnppdXBsekF1TzBYRWdQNHlDdWdKL2hYb29mUEJBaVVsY0wzVGtiOUVG?=
 =?utf-8?B?MjNYeTFZUHkwRkpzRkRvRHZJTUpYd21mUSs0YUt2SXZSR3doNVNzUXFLUUZl?=
 =?utf-8?B?S0puS0N0TjdkTU16a0o1Qm5id3JNZVhwQ3NyY2FUdG5FTk5WK2JYUTNTK1hY?=
 =?utf-8?B?TDltSUhiLzRCdytjVDJNeDAvb0pKVldPSEp0SVpST3c4YXNYUW55aXlxOWtN?=
 =?utf-8?B?RWRvM1Y3TEdxQ2FIc1NsZEp2SVFPSmU0a2oycXNqRFY5akV5UEllbWc0Qjlp?=
 =?utf-8?B?N2Z5V0lVckdUYkNKQWFnc0VtMW56aGR3UGxBTXNZRnNoQ3h0WUU3ZHBzMVBO?=
 =?utf-8?B?bGJJUElyVE9NNlVzNkNoK0ZPcTlKSWlGV0luRUdyTW9SNndkTDBrczF3MmJQ?=
 =?utf-8?B?TlFVd3J4SDJLaWJMeXVXTjZWV2c0Mm9ZeUY5YXd0akZ4ZUo1UzNCUGR6SXRJ?=
 =?utf-8?B?OUJmRkpydmlFVlhJLzJMekRDSlErbnd1V3hyakQ3cUYrdVVtS1dIY0NkMi93?=
 =?utf-8?B?SjNya1ZjdmRHT2dDV2RuVmJ6Uncyd2xHcThpM080MFhqRisvSkVFdmVSYTJJ?=
 =?utf-8?B?N2IvMnBmK0dNUkpLMEZaa0VIZ2NsUys4VWltQjFsNDVuN09tMkNOOCtudUNs?=
 =?utf-8?B?aDYrdmlxc3BZR2J3KzliOU5Wb0JmMVQwYnF6aTN5Smo4SVE3bVVaOWU0RXE2?=
 =?utf-8?B?cEFudkJwdXJlcVozUkRESENHMHFBS1pCSG5EV3YvbEpWMzE4SFh5WndtMlBk?=
 =?utf-8?B?Ynd1MWhFTy9palloNkxLL2hvVXRiMmdkV3UzelZFMHl3ZHF0SDlJdFdSalc5?=
 =?utf-8?B?aUdxeTFYMzd5T2VQKzFTYWlLUmxmSiswWVRjc0p4MGRzNlBSMndhb3UxSk1F?=
 =?utf-8?B?L0lwY0cwZ01FNHZ1UFByL2NlakhUcGFBUi8rczMzOW9RWHdobGQ5RVdBY1U4?=
 =?utf-8?B?RS9aR3krRXVGUEkwc1c5UStSd28zSHVzQi9ma1k5NVRYMjd4NWV5eThNakJX?=
 =?utf-8?B?aFY1bFJBWnNJdHUvWTRlU0Zmdk9JZml3cmZsNjl4UkVmcVI2Q1N0bndHNnJX?=
 =?utf-8?B?dGRsZkViOUdpdGpQdGgyek5KK2N2UXhYTnhocVloTkVRRm5uVkw3RUlzNWFJ?=
 =?utf-8?B?KzZyUkxLUEVFOE5EMUNUQkRqTUtEelVPYTBVZFdNRElnQ2hnYUVMR2tKVk9o?=
 =?utf-8?B?LzFYOTYwREJJL2E0YjE1SThtajhkVHVTVkZYVi9Zd1V5b2EvMmcvOUVEYnc3?=
 =?utf-8?B?Y2xHeEYvSWw2YktnSEhGbDZtYThmVmRXYU44N3RMZUw1dlBMYWZHRHlqdHc4?=
 =?utf-8?B?RHdSVzdmL2ZsT0FjT0szUjJlZTBRc3Z2V29lUzNJVlR4bEtpYVNMa2hodUJN?=
 =?utf-8?B?eUNvM2c5Nkh6RDdrdUJVSndib3NtbnFKNXJ5ZCttdzVXbHF4NkNZQnhFL2tT?=
 =?utf-8?B?eUJBQ2cxMk5oQ1l5Nk1HMktJaEFES25iSXU4RkpMVnJQeWdXRjJIZUpFR0Rq?=
 =?utf-8?B?cXZnS1NwMWYvaVdoQmJ0RmsrbUUwazlzWG11SUdyanJaeGIzWC9FRXhQVXFT?=
 =?utf-8?B?bjVaV21xRllLV1owQllCRWFQNncxVnZzTk80Y1BhSldyL2dRL053aERBbHJ6?=
 =?utf-8?B?dFdwajVkS21yWmFHTWxjeTZNYUUrc1lOY25jV3I2QnRISGFJdnkyVXhUb3JL?=
 =?utf-8?Q?ZhIZWYGRB4UDmyRcyKBH1N/wsTzYhJsV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3BXcUJDdFZrTUk1eElnWEtEL1BoQ1lsbE05NXVNaDNMK3kxclRwVmsralpl?=
 =?utf-8?B?aTV4UHM2eVFHNXF5ZmJXWkFlZVVxZmw0eVVWbDFzeFI4NURIZkpnMlNjRlpw?=
 =?utf-8?B?a2tySlBSOXpJY3BKRXo1NjJMaUkwajRmelNYZlZCSUo0bzR0dUZpZG4rQkFp?=
 =?utf-8?B?Z2xlQmFyREtFWnY5RWpxQmFEcDZneTFsaVB3S1pBWGsrMkFwc3M2WHhWK290?=
 =?utf-8?B?c1AvNGZVUUdzTVQ4QVZzcC92Y0M3WkhOY3pRNGV5NTNiSXR5WjQ2WDVxcUNY?=
 =?utf-8?B?ZzR6Q0s1NkpRK01MQmVuMXhQZkczSVQvdktKQUIySVZXalZqV2RXc2paL2lq?=
 =?utf-8?B?WkpjNHR3dzNxcjNZeWpkbXFLcVMzL1JNUFNzNzEyUkRpRERRUHpSL2lIWEdI?=
 =?utf-8?B?ekoyVHdpQ0I5am1GYzZLd0FuU3MxS0hvU3ZXc2N3eGdwRU94Ty9ONkJ0S1RG?=
 =?utf-8?B?dE5BVHR2MW9OMll1WXJQMmRHcmlJazk3THNvSHQwQ3hrT3B4NjhQa2liMlY2?=
 =?utf-8?B?S1lBS1VxYWpvWVdSVFlGb2lITzFWdzByREwvYml5R0czS201ZVp5ZlhoMHIr?=
 =?utf-8?B?dUw1R2liTGxlTkcza280aHFwUGNud1FreVMyM0ZWM2RYcE9RWGFTcnJhZlpu?=
 =?utf-8?B?RjMvMHJwR0w4Uk80eDVmbWZMZjNxUjZqdExhcjV3WlJYOGNLdmpNWHJzNlZu?=
 =?utf-8?B?cjBMeUUvNGNOdlJJMjYxL0pNSGg4bCtmNGtZNG5OZ0pway82NHpKVUduQzdp?=
 =?utf-8?B?L3RYcjNqd0FqTC9SU25JQ2JqdW8rRE42dDlUME95My9rcS9Ib2N5bWZwMXdG?=
 =?utf-8?B?V2wwKzNSdUlJRHlTY0gydkl3Nk5jSFJqL3VhNXNiQ3VaczZ1OThpNFYxRExK?=
 =?utf-8?B?dTBFR3ZnS0VSNUMrZ1gwRStiYitTTjBuTDNXc09DK0s5R0cvMHkrZDBXdk9T?=
 =?utf-8?B?aDgva0QvOS9IZ0xOaithNXpYQW5ELy9OamVoN2VoeHIyLzAvYkdLb3J5ajNG?=
 =?utf-8?B?blduK3hNSXl3dnVaQU4yUFVDa01tQWs3Vzc5cm8zc3M1RzdFZUNPZmQwZy9a?=
 =?utf-8?B?YTdXTDgzRFQ0a2VmaC9taW4zd1ZtOWZvQUp2cmtBdzNPM1pVOFJnR3lYSVFY?=
 =?utf-8?B?TTkwVC9Od0lJbE5Idmk5MDk3Y0RLVjIzbVVjeWFtazBkK3ZHRXN4Z3ZVenBu?=
 =?utf-8?B?ZitRbndkd1hYLyt2Q25FRUdVcXhySkd0M1RxZUpUYTU1ZG1FZlZPNU5hckxu?=
 =?utf-8?B?ZEtQSCtlK2ZITndyckhGVmZoRnlLdTdhK1ZKRVd0d0hLT3FldmJPc0JuTXBK?=
 =?utf-8?B?SnZKdFB2aDhMOGd1UDJUN3g3bmhxcXBwN3NZbzZJRlBYSVIvWmxFUWt5QXg0?=
 =?utf-8?B?ZWEvb2E2dE13aTRtMjR5SXFBei9TVGxxNC9tQ0xhaHBpZUxlRGkvelpDL3Fl?=
 =?utf-8?B?dUdmZWtKVEQ0RDNKcEVldW9VNWRQT3FQaVdHRVNwTlFucEdjbkxFWVhtUzZq?=
 =?utf-8?B?VytuY3UrbG8vNWRXMDUwM3JzaGEzc1FvcXNaV0o4M21WWkx6WTdWNFBqMUNV?=
 =?utf-8?B?cHRnYUowZXJDb1hBR3l1NVJXRmhCcWRzTjFickhNL3lUQUp3ZCtHUHhjN0Zx?=
 =?utf-8?B?M2FsaHYxYnpBVFRVdW1kYjlyaVVDOFNPQVQ1Vi9NOHg1R3p5U0xvNDRXMmM4?=
 =?utf-8?B?eGJpUkRtOFVBdUVnN2JJd3IvK2RLQjdjNDVhajhsRFdzZ1B4TG8wTnpoWkpS?=
 =?utf-8?B?SWcrenZ3enlJTkhNRGhnRlNpRkN5VGlyamRWREJjMnlLMCtjaWd6cU1pWm01?=
 =?utf-8?B?dkEyWVpUcngxbm9INEhTUHg5eTJwMlNFakc4K3B4ZkdDbXFFZThDaVVveEN0?=
 =?utf-8?B?VUxYZHpONkMvSEFHN1JJMnBxN0JyUS92TDE2aVR4cUdyMjlpMGhsQ1NLc3Br?=
 =?utf-8?B?dnJYQURXNHVQTy9jRXBQQTQrQXovN0t4ZVJjemNTbjg4SFBQSjhuVUVVVlV3?=
 =?utf-8?B?SjQ4R0RzTVJVbkZjbE1oV3VhUjI5Mkt2RHlJUm5MTFFHeXBlakU1b1puSXI4?=
 =?utf-8?B?SzRVSTVNWmtveFh5ckJJRXpzNzB6ZlA0ajBnOFdkS1FkME9uMWRZVzFHNXY2?=
 =?utf-8?B?eFd0WXc5d2lSYlQyd2VWVTNlNFk5Qmg0U2d1VDNVRE1JdWthSEZHYlFPQ1JP?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b475612e-7a9b-43f6-c719-08de38df371b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:00:48.8171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxcpYzZ5VsccRQnrUl3UDjwi8Am9qvFC6+jl5RMmulMBLTdiEgutZIoZE6VXLtxGEbPr1JoTJxqPubZ/vjnhW4fE8kmmjSYVsxUrkBlaWrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5851

On 11/12/2025 5:59 pm, Stefano Stabellini wrote:
> On Thu, 11 Dec 2025, Andrew Cooper wrote:
>> The *-safety jobs are AMD's configuration specifically, and other
>> configurations will likely be different.
>>
>> Give the un-suffixed job an *-all suffix to make it clearer what they're
>> doing.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> This is straightforward:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
> I like this and I think we should also rename eclair-x86_64:on-schedule
> and eclair-ARM64:on-schedule for extra clarity. For instance:
>
> eclair-x86_64-allrules:on-schedule
> eclair-ARM64-allrules:on-schedule
>
> It could be in this patch but also in a different patch.

Oh, that's easy enough to do.  I'll fold in.

Given allrules for that, do we want to make this allcode for clarity?

~Andrew

