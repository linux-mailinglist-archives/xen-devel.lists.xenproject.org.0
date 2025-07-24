Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045AB10D64
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056176.1424357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uews5-0003v2-GJ; Thu, 24 Jul 2025 14:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056176.1424357; Thu, 24 Jul 2025 14:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uews5-0003sI-Dh; Thu, 24 Jul 2025 14:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1056176;
 Thu, 24 Jul 2025 14:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bzRN=2F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uews3-0003sA-B4
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:24:31 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8a2c7f7-6899-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:24:29 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 14:24:25 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Thu, 24 Jul 2025
 14:24:25 +0000
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
X-Inumbo-ID: e8a2c7f7-6899-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ftz6Fs/Y0Yd1pHEP+siLZm3P+ilKR1ZU0QbMV46UvAxbjRcl2Fk2VHVmoTEx+X048Y2ONb/x5oEuaHsdruYwu8AQO+ET/tJk92YioZxMYw7tJ+f5R9uaszfQyO0+H9rNvTXLwhN6uhFSLK1dNPH+0DGWMiPPYMMJ6gzyHuJV6GfK3raYpStoVMuFvQK3q+9LYHxMCGLsApq5UlXznDlrEuOcDfLmt91xQWeb1LObTbQZpuLFIQBDYr3ewtALQ56Oo2EtK5ul0nmV6KT5ZORdCeg2wmMwoCCro9JGIa/1Bv7SFJyUu8ge1dxdFIf5i2LzfJX3J16BrTEoSMWJ+8Vwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yiMFdacHB2lEvmYfc5OoAUQ+fCy1KI3Glu18CPpXD4=;
 b=PsKkd7VILYHd6Z9qdapGH3JbtRggKPBxloOyMBV9wnih0WvYxNoo4kEz9jAUEs0g8I4cXQ0Dz6bBm2ClyUiaplITeVjlN8H6oa0fg9uaR2hMH6zmEo/EahtA9tYN8FcpoZiKuS7pH3Csfc9uxfC9FZH+VXUfb5MhyIxWJVoJK5aPaeirMrOGGb4WL/3jLI+6G29moY4rL8racGiNCCtm8RBaLRRlNyZ/z18pur2V2RMvNbPCBEnbk426hJRh+ASphgFciJFarhlB23zMGefbpNNrB15v/bI2kN+qp4x55m2VyRmzcjKwGK9aLnK5R993TL/d0gvGokPyYJos5kj8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yiMFdacHB2lEvmYfc5OoAUQ+fCy1KI3Glu18CPpXD4=;
 b=IydYamuwFG/SsL/6IrtJesHIqDK9SeGaRCKFxaJQHBkPxc+sKgGlETsKM3aI94FkWS+WxoVwoi/oG9WTyPGNvu7DEGiP2U+gc8KW3dGnSJU4AJaUBWtOcJ4FL1OaXPD0MjaW7qNzo6vDoSs7+oJkZfkI7038rwd8Ee/htHgR0SUuvUe44vKZR6Pu7ABf1U21wt4Qgf4r5XjoBlsT9B9NgDe7YL69nAShOIhpuwpNzhSTAA/Fp+bk0qKkObVbA6T3a0Rfctn9o/mBo9gVLrfqVA5VucMUNwajG/d5RnUejmy1wBNfh9A9USrl5irs2X0rkE1uybY9sYfKiVYuom7QTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2539ad65-895c-4252-bd98-e7542e2d9945@epam.com>
Date: Thu, 24 Jul 2025 17:24:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Julien Grall <julien@xen.org>, "Orzel, Michal" <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
 <e35822cc-d8a0-49c1-a4b1-2765e0e6cb6c@amd.com>
 <add27fd8-aaa2-453a-b502-fd505ec77f94@epam.com>
 <71fa14e0-83d7-48ec-8bd9-258ec8f6cedf@xen.org>
 <10bc21a4-77ac-4c5b-8c2c-0022936b19df@epam.com>
Content-Language: en-US
In-Reply-To: <10bc21a4-77ac-4c5b-8c2c-0022936b19df@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB4PR03MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: 9727d467-a9c9-4cef-1100-08ddcabdca5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTNVLzU2b3hTdUdsLzBPUlIrL2lUR3dUeThLZFhRMmU4eWJvSERoUmtmaGRw?=
 =?utf-8?B?eHdRNklwRHF6RU81aVh1UVByUzR1NlhIMEczVDczRHZxeFYweS9JMG9kSml2?=
 =?utf-8?B?TEd6akFSenR5cWVsMTAreStvWmZOQVd4bW9jeGpQUW1ldldWZXAxcEIvUGJH?=
 =?utf-8?B?d2lQUHpnem1mY2MrT0tUdkt1c1JRcEF6bFlYSlJXWnFKVWtoeDlSdkc0bzN2?=
 =?utf-8?B?YythTDFBamxnNWNtMitlRExiMEpQUjJyeCs4SjBERndWemdwQ2lCTTJHVlFG?=
 =?utf-8?B?dUI1Sm0zbEd3MzY2SDdHWVpPZmh4bzZ6SC9QK21uRlBCU21FLzUyUXQ4MEVj?=
 =?utf-8?B?NDhIaTBVMFZhdGJ4d0R4eEd1MmE4WjFCb1BhdDNxOVFUZGtyMlVGNGEwTUpx?=
 =?utf-8?B?WncvUWZNUzZRM1gzWnYxMWNXbmczVEdTMXdVZTJwckdoYjdjMHRCN002ZGF5?=
 =?utf-8?B?dUJFTUU2NkxncGs4eUNiYXEwYUJIaHVJZkZ0cTZmYmloeVQ0ZzIxQnJJcEdn?=
 =?utf-8?B?enBjc01SYmUzZXc4RGRJS1d0bkQvb2ovNmVJaERLdWxlK0llODJNaWVSaXIy?=
 =?utf-8?B?L1FqOVNBWkprV2FQZmZGMkJBT21xVDhWV1Y0M0I4TTRPR0VtRDM2ZjdLdjJB?=
 =?utf-8?B?d3dqNy8zc0RBM0xWbFlXV2hscDBQR1BraUtNSWltTWl3WFM0dHFYSGdPUTJU?=
 =?utf-8?B?Rm1ULzRuclR4bTFlNThRZW5SV0xXWEN4S09UOHgyeDhldVZIQW9kMmlzQXN3?=
 =?utf-8?B?cFNjUlVVeUcwT0RLM0x5VUxuRjNRbUxVL00wd0VuQVEySHpEMWhxV2tacFQx?=
 =?utf-8?B?Q0lza2hzSVI0MzlmNENtbko3aHE4YVVUVUp4MmVFU3c0a1piMk5nNkFhK1hY?=
 =?utf-8?B?WHVpenZQK1I3Wm9WUzVWSExjbnJCU1g4SmlqUHlSTGRqemdtUlVhbythQ3J4?=
 =?utf-8?B?OVhOd1lKRmpsejV2b3BSc256NXBOT0tKYm5XYlNGenlpRXJ2b1JzZEdCQm9E?=
 =?utf-8?B?SURwc0Ruak1kQVBSSlZzbzdTZDUvN2VvTmJkbEwzek9XbHVNZUFST0NPZ3JJ?=
 =?utf-8?B?KzlxT004SEV5Q203MHdzSnVZS3VLYnRoOHh4VWNsWkZaTCtXQXU5WjZoOVZx?=
 =?utf-8?B?WklHaUNqNWpML1gvcU9HbVM1cFRSWkY0dHk3SHVrcmpWeVVKcW8yaDVRSVN6?=
 =?utf-8?B?b2diK3gzalMvUGhYUi9UZGo2Skc5cjdpR1VGUFJtQXlBdVdhVjJ0cllEMCsy?=
 =?utf-8?B?cjd1bUdJY1Y1UTlRODVCS0oxVCtOTW90eVdkWWhWenhwYTczU0xnbkJyYlBC?=
 =?utf-8?B?WFBZTmJlTFVXUFRrTnA0bWdCbEYwalBSdUtVSmdPMGVIdTV0NE05S3Y0NEg5?=
 =?utf-8?B?YVF3Tzh6N2Iwb0pmeEFZWGo3Um56czZyNFByUXdqNHBPK1d0SEhHTGhHT3Ro?=
 =?utf-8?B?c3I4elV2Z1VNOXJrRzNqSWZZeFJyY3dFcm9XdFdNUXVWN0hXZk1pdzd2aVNS?=
 =?utf-8?B?Z1NOc29ZMk10VHJvTmo1UmMwOWJNNHQ4ck5SUEtRaXE3ZUhPQTM5VnVDcHRh?=
 =?utf-8?B?WmtmWDdjWWhiUzZvcjRqaXFQbjhiaVlaU1RpeU9PcEgyaHBzSzZGTDg1TmdH?=
 =?utf-8?B?SDQ4WHBvL1BEQXBuTHpXNVRzNnBOcG9GR3lLT3JkUS9QRUdYM0dESy8rQ1gy?=
 =?utf-8?B?ZUxMMFQ5eHhLNURLaVltWTJnRnpPZDd3MWl2YTZXdEdHeEZGWkE3RjF1OXlt?=
 =?utf-8?B?NWppM1JtWk0wcnFHWmpyWHBEQmdBN0RwODRtK3QzNDdmN2lwSFFlRTJkYWow?=
 =?utf-8?B?aVREMzNYS0JrQTl2aHF6N1ZJY094ODdqQ1RmMDBhbmNrRFhxZGVJZWZRSHlL?=
 =?utf-8?B?M2lpRkk3WDMxOC9ReFMzaHhEUlVBV1RBR1ZEMms5aW9yOTh5aFk0V3Axbkhw?=
 =?utf-8?Q?89VTflIro7Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1VXc0ltZnh2V01IL3habHdyOVV2YnVVQWVRVEZjcFhGL0Vicnl2dUZZbzlx?=
 =?utf-8?B?Y05ZWmpyUXA5SFVYTTc2V3VWZ0dtMFpoMmRWcE5aS0F5R2w4TjZxNFNNWWR4?=
 =?utf-8?B?dm1SdG5UQkFVbWZMb2ZQRW1OL2ZxbSttc2l1cFBaNVh6S2lXQ3NCUWdGRHVz?=
 =?utf-8?B?Q3NwWWFyUFJMZHlBZnBNYXlXZWpuSkU4Vy9raFJQUUpIa2Y3QS9vUUpYUmdq?=
 =?utf-8?B?QVFQU04yZ25xQXh3RVp5T3ZYN1JCL2l4eDd0Y0tla015eXcrRnlRY1NIenBQ?=
 =?utf-8?B?N0NIVFRKRUs5NVh3aDNDL1U5NWtoZjVTdDNwY2g5NXV6Z2g0bHdOZ1hna1kw?=
 =?utf-8?B?WmE2azBubTdROVh2ZkxiM09OWk54L0V4ZEdrbmlIRTRpUVNmTGN3Q3JOb2hy?=
 =?utf-8?B?TXhiSzhiSy8xV2ZCVFdPSnBtdVZCRWZGNmFqZmh0WDZuZW5LMStoRkhIdzNv?=
 =?utf-8?B?WEgrSmxlMTJBeDZ5N1BCSGVSdm1sSzVVOElTOE80N3BESFFTUXdGdGNzRWlB?=
 =?utf-8?B?NzZ5VEdHeUZta2F3aUFocTZJZkNlTElBSlo5RDhHNmFvbFVZa1NqWnU1QXpz?=
 =?utf-8?B?cjRTUGpsQXdNeGQ5Y0U1MjBvUjZMZzdBS3NWVkhtY0UwbUg0SElzNWpibktH?=
 =?utf-8?B?Y3hFNndvTWFBaUZUTFBPekhReDNVcC8vaHdwOG85by9UV1FFZlpCWGQweUor?=
 =?utf-8?B?TU1BYzdycThzeTNGZWZxdDRWVnI1OEZ0VUZPSWQ0M2V3Yzl4MUFGcXdjYjgx?=
 =?utf-8?B?a3pVQVhrNUV6RTlpNGRJaGxmWUVEVngwNWErd3Y5ck1kZlBQL21aZFNkeHox?=
 =?utf-8?B?dERzSVR2YkZ0SzlZV0FRNDhTaUFYdDI3R253OUNqSEdsbnNCUDNtcTVSNVdo?=
 =?utf-8?B?bGRGdGpOVnhnY3JZdklXTldpRVRnVk43eCtiNFZxVHVFazNYYStMcE50MXBL?=
 =?utf-8?B?M0tSdTRZNmNmdzlBOGU3bUV3SENIWWk4b0dEUHlTbmt4TnZrYm1CY3lDV2ZK?=
 =?utf-8?B?K3MwQmJ4bmVaRXZ3dGgvTmdPSGJHSTFxeE1aREF4cGRKV0gwTzc1dzA3aVpK?=
 =?utf-8?B?eUEzL1VMTXBoQ0FYenQ4Ylc4dDRtc1dGQ1BwMThOZmNIakhUZkVHbUkvRnUv?=
 =?utf-8?B?NjkvOUEyQklmeHFNNzUwSys4WC9QbjkvcGVna0NyRXl6c1J5ZnpKcU40Y3c5?=
 =?utf-8?B?S0EwU2xnMk9POC9yMGpDZUVJN25Qek5BbVVDMkRvdHViMUJ4dnZLV3d3dXJp?=
 =?utf-8?B?RlJGNUVuWlIyT0Y1b3N3b3hnNHVDY2xBc0Y4NGFUN0d2U3EzUUpXQW16eFpr?=
 =?utf-8?B?R2QyY1k1ckpJVzBSOGxnOUZvOFVBUVdSV3A2bDFyemdGTmwyaEVJclI0WGZE?=
 =?utf-8?B?ZytQaWJqZkJjTCtyMVV5UXVuRUduVU1WNmFKeU0vVU9vQjJkRnU2NkVkb3Bw?=
 =?utf-8?B?UkxTcDJUUXZINTVOd0ppeGxzOW1uZHBYUWRzczZJcGp0Y2tXdndRZzlDMDR5?=
 =?utf-8?B?QVZSY2YvY1h5VEFUUmplenpWc1VlMVdmT2NYTVhWbVJNUnNyZ1M5TWNiVUgz?=
 =?utf-8?B?bnB4KzFuUzd1UitLSWJMNnFjNzhPYVhzbUM4azBScER5U3YrRHdGL1lpUzBa?=
 =?utf-8?B?My84OEpVa2wwOE9LODhlL2U0Tk5YSE9ZTkh6RmkzUVNnNGNTcGZWNU5FbjA0?=
 =?utf-8?B?bjdhUjZXeFBTdnhNdEdBaExINTU2MzdyRjFXMDJKVStuM2xCOFRLYlV0Tktn?=
 =?utf-8?B?TXdkY3Y5QWVCTmRDWTRBR3NoRTRuZ1o0YTZncFFSK2FsOXdKTWZwT1J6SUNJ?=
 =?utf-8?B?aDNCQlVuZHNoL2RQZGc0K3YxaERFNmdydnBCZUtCYktpZkc3ZlExTmlmYWY1?=
 =?utf-8?B?c3c5dmlJL3VMSHNQYjQ5RndkcUF6QnREL1dCVHp6RytUSlJXVUtxVzQrUjgw?=
 =?utf-8?B?WXlzNkx6SUxYckpvd1ZZWnVBL3d5TkE1b0RzYTEwZWNmLzI4TFRQMlF2MC9n?=
 =?utf-8?B?TWNHTTZnRFNHSmdwckFmRVFCRU9sS1paTFFrWUtWUUd5blZ2UXpxVlBkRmhE?=
 =?utf-8?B?UzdWNHZVSU5tMFZCUWhRNXNRbFFCMXlKaDV5UXlTTklOejY3MllacHdjbVhv?=
 =?utf-8?B?eVRkbWRzSEVjcDhtRG5GcGZSS2pOMTJKNjZSeVJodG5hT2Q5TWdXcjZSYk95?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9727d467-a9c9-4cef-1100-08ddcabdca5a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 14:24:25.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LFvJoDkvu9BBsRA5el18My8zWhBzxaIbtX3cc4N14jgInRG9N2k74RYKDa7TcVvfNKT1/7QxiwkJ79KeAHckFBnPKKRJ9iRrUo1bjtBCDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9556

Hi All,

On 23.07.25 15:12, Grygorii Strashko wrote:
> 
> 
> On 23.07.25 15:02, Julien Grall wrote:
>> Hi,
>>
>> On 23/07/2025 12:48, Grygorii Strashko wrote:
>>>
>>>
>>> On 23.07.25 13:54, Orzel, Michal wrote:
>>>>
>>>>
>>>> On 23/07/2025 10:06, Julien Grall wrote:
>>>>>
>>>>>
>>>>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>
>>>>>> Hi,
>>>>>
>>>>> Hi Grygorii,
>>>>>
>>>>>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>>>>>> all Arm64 platforms supports AArch32 or this support might not be needed.
>>>>>
>>>>> I am not entirely sure I like the proliferation of using CONFIG_* for
>>>>> every single feature. This makes the testing a bit more complicated.
>>>>>
>>>>> Can you clarify what the goal with this patch?
>>>> AArch32 is used quite rarely in embedded systems. Also, in Armv9A it might only
>>>> be implemented at EL0 if at all. When focusing on safety certification, AArch32
>>>> related code in Xen leaves a gap in terms of coverage that cannot really be
>>>> justified in words. This leaves us with two options: either support it (lots of
>>>> additional testing, requirements and documents would be needed) or compile it out.
>>>
>>> FYI. bloat-o-meter report for this series with CONFIG_ARM64_AARCH32=n, CONFIG_EXPERT=y
>>
>> Thanks for sharing the bloat-o-meter. But I don't think the result below warrant a new config.
>   The reason provided by Michal is a better reason as the impact on safety certification is more significant.
> 
> It just an additional info to illustrate achieved build-time optimization results
> which reduces coverage gaps.
> 

Would it be reasonable to send patches which split arm64/arm32 code separately (Patches 1,3,4,7)?
(with comments applied).

-- 
Best regards,
-grygorii

