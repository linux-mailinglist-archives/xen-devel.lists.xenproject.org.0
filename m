Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1284B2473D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 12:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079706.1440431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um8ky-0001Ro-A0; Wed, 13 Aug 2025 10:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079706.1440431; Wed, 13 Aug 2025 10:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1um8ky-0001QN-7B; Wed, 13 Aug 2025 10:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1079706;
 Wed, 13 Aug 2025 10:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pw7=2Z=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1um8kx-0001QH-9W
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 10:30:55 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96ac653b-7830-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 12:30:54 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 10:30:49 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 10:30:49 +0000
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
X-Inumbo-ID: 96ac653b-7830-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIaQDp9IHuSB3iuAb6nlT68SscrM+rMWtQ7ENPA9FMcU5L4hMc4GV1vP+O2PbBRNk1PzdkFVTMDb0d1WcavUTYO1+o8ngDoQUJjF9aQo/ZBCxNVk2QwLR1ONs7wi/jzOac1BP+xbwqvPuRTc5I2DlTOJVy47AblRr2cw2DqAd5qiUFM10Pbl0T6UIh5edWDkkBU3hcNuYQ5PEImtdsZJlz0IfDiNlZEB35pSYuso6dIwRCAh++kEIF/wRIrkI27RJj0UjW6o/P1VNaeCJtyijoH4wmvCQShHfXJmaS/jwFafjQigIuXzKYEfoT9G8Rg3vUb0ouXeN2B1j9BNPnn+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAOm1sdEPLj75mAAN7vkfs9Qhu9uQayDxLixvMBiA/8=;
 b=brzqW8A2o727ki7wfMbbkpbH0U6EaqND6UXiYa2OK67Gudu9Lszoixo3wfroifT9qpoUV9foZNmT40VZXWJypu/8MlsFnL5af78jbnCF9OMNY2guX1N780Cbo0+TEgK8VJMo7I4nnV9Qp2y7XEBYuyqQjjruhOEp88xag985x0cw+pi7O1fZxj/gpFdL2p0AxU08NbPoDI/FE8I8lOjeVOzqIaV7MmPSFZQfk5ogtH8g6YlHV3tO/DIJbWeMV1JqL0MJV8APhhIdl6kW2UELimyYsgfDI0x42JYTSjqVKB8pk6Dh3fuGNYmbazYcjD3OAl8221gMjx+Hbb9+/ECzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAOm1sdEPLj75mAAN7vkfs9Qhu9uQayDxLixvMBiA/8=;
 b=pi2NZAgaQ0I7DunWUQEtMlrJUO9uQk2/J4ozN23HVJ48mIDp6lV2yB8mVGRdqPFT0bSWEd6zhMRuDFCI0SxXbFAN5uvS+fZVyTYSMwxprreb6DIHYHrkLVPwWJDTxrI5OowvPLGaqDTwtWbYf27ql2AKL0ugnhamqy52BVoBRd3iXiIRkSWThj6ruftFlIW7FTpPQKPKjPkgqItAkleImDYg9/wlMA78Z27wVhqsehccm5asnCscxzXHQD32wRlTJAikupTbmXqBHi7XycNmuGyF8CRPWzsVsv8G9ctNMMFZBGxqrAhxEmPukpCyeydFH5XfI5Ya94N1Dwkdq9mcRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6f0162d6-4e81-40dc-ac9f-ac458519f5b3@epam.com>
Date: Wed, 13 Aug 2025 12:30:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] xen/arm: vIOMMU: Add cmdline boot option "viommu =
 <boolean>"
To: Jan Beulich <jbeulich@suse.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <c539f673eef6f44a1191b0f8213ff5571baa411a.1754580688.git.milan_djokic@epam.com>
 <dd006b8c-c198-4f38-bfaa-990122bb7174@suse.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <dd006b8c-c198-4f38-bfaa-990122bb7174@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0275.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::48) To PA4PR03MB7136.eurprd03.prod.outlook.com
 (2603:10a6:102:ea::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR03MB7136:EE_|PAXPR03MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f8d4c1-bbfd-4b5e-341f-08ddda5478df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjJPb3V2bGw2dlBpT3B6NWdVb3RBREM3WkxwQkZGWDVwZlZjUG5SRUtsdDJs?=
 =?utf-8?B?TzhDSlFYMm1YbThhQVAyeDluQ3VMdVFTSDFhbWVoTWlZcDBWWmNEZ3QxNDBO?=
 =?utf-8?B?MEdtZDRnZStrZGRZVE13b3JVZmZGVjFwWnBGbzAvYk5aTXZoMnhUak5aR3Ju?=
 =?utf-8?B?STFLVGpwTWpVaWk4MGl3MlFHc01kWTdkaGdXMTRlenFPR3lUcnhNS0FzRm13?=
 =?utf-8?B?aVdGelNNcDFSNnFuUkRSbTBtYzR2clVZOENVQ1NadEZlVWR2TjBnSVpiTC82?=
 =?utf-8?B?WlJqWWRZNDc0LzhiMHRlbTBJRGQwNGpTVVA5dEdCZHo5THpvMW9Sem5ONVdh?=
 =?utf-8?B?YVhjTSsrUS9Wa0d4N3FnL3RHTWtpTnRGWTR0dUpkSWwvMWNONXdSNUpMdWI1?=
 =?utf-8?B?cXlRRG0wbDZJRnlZYXczalJSUUs0M3JXejhoSEZwaXVEM3NIb3JmZk5HMmhV?=
 =?utf-8?B?d3VDQitYeE00dWp1d2MwMnJDVVlHTjVLWlRUQUttd3lZZWdmQ2pSNzhScjVm?=
 =?utf-8?B?V054bTlTcTY2ajRmbmZud3ZGLzdKOWR6S0tJclJRQU8vcVY4WEt2R0RoYkQ3?=
 =?utf-8?B?dkNnMnRwckdPZDgzM0hEZWp5SStzaDBpb2czeEVkQkp2SjBwR3h3RSsxend1?=
 =?utf-8?B?VThZb3lzRnZiRmRIUFh5R1crYTd6RE55ODdvcDQyS2FPVnJDN3NrWkxQUUo5?=
 =?utf-8?B?QzB4ZVlVNmZYR3RlelBsWENORzBTaHRQMm00Yk5ETHBwNmNMWVZ1SGhYdE8r?=
 =?utf-8?B?eFRYMHVRMmFtdmVkNzNBT2VkZHlhTHdncHlEU1FmeHlrVkRGMnhEMkhWVXhB?=
 =?utf-8?B?Tkd5SHU4UllUdzN3TlEyMXkwL2lMWndYVW4yUGxvbThFK29JQ0xKcnE1ZWUz?=
 =?utf-8?B?dlZqNXhqdTcrTGZ5bUJOY3hIYVN2S0dUcEdmeWcrdUl3T3lYem10NVFOdlJh?=
 =?utf-8?B?YzFNN3l6bXlqSHRPRFlWeFdiVWRZMlA4dmlhbFR3TTFsWFUzYXp3NDd5d2Uw?=
 =?utf-8?B?VThqVVVnMm1GSTJEdnl2Sjlic3VUMzhQR3NrdklQVXZDRXFIbnVhWnV5MDlQ?=
 =?utf-8?B?b3dTS0Z6a01lT2J3c0JwbTlTQ0dSMjhLSG9aS1dVdTNJNkZoazgyYWdmczFo?=
 =?utf-8?B?QmVSTGlBSXRHYVlHbklERHNncWo0QkRDenJhcWF6SGt2RW1uNS96R1dBd3VS?=
 =?utf-8?B?M3RWQ3NEU1NucmwrNksyNkhnTnIyaWhxTjZqRFh4WTBsLzdicEZGM3hodWl4?=
 =?utf-8?B?RXhEdk9VMTlNKzBLVHdGNmFUOExtTUIxa0pUUnJDNUhkcTB0UWpXMHFjQUNt?=
 =?utf-8?B?aDAva3l3d09kMVU1RHVjcnBQZFk3a0JqVXNuUytGQmIvZkttb0VFVkk1OFow?=
 =?utf-8?B?akY5ODFSbzQ3MGJnQmJuZFFLVk1wSWRPR081Nmplb1V1cXNMZkNIQkloNzd5?=
 =?utf-8?B?QUdneWsrck54bnhjNmxib3VTQ0EvVnVEa202QWVhTndKMmNmUFRXbHhLVDBQ?=
 =?utf-8?B?akF2Zmg3M0pXTkRiNkFrZGdHMm1hT01sbk1ocWxLVmVYRWlsQkowZzJIYnlj?=
 =?utf-8?B?WlZZNGlqZ3NTa1MvMkRlTWRXWVB6Q2o3Wklvakx2KzFveWU5bmtjZkZuSXBr?=
 =?utf-8?B?NVVoWDhKZGJmTHF1aFJ3T3FRWDdld0ZZVmpVck9IM2xIdjFZd3p1WVYrTmNx?=
 =?utf-8?B?UTF1MUlUdGovcnBGU0tCcHRmOE1uOStjZWkrSjhCWVN2NkJRZFdZazlJSmc3?=
 =?utf-8?B?aExSb1NSazIrR0xVS1I4VlFrVGw1UmNWdWZiT1VhdVl0bzQ1K0Jic2dWaVNq?=
 =?utf-8?B?ZlVVQUsxbkJWOHFnRW9SYWc4TmYxU0t4bzNMUHRnYnA5bC9tQ1BON2twWmVx?=
 =?utf-8?B?M25pZEgxWWlaQXdXUXJCSE9uc3prS2NvVng0dC9wR2ZQNlV0YnJTZzNraTd0?=
 =?utf-8?Q?b5LHFKGS6W0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1xQ0tPekZJR3NRaU0wSjhWaUVFbnM1ZVI4TVlobzlLc29aQlUxV0dHNlBy?=
 =?utf-8?B?MjRHSUlTS09rT0hhQkxDTU9JT2pPUFdvWkJyZ1d5NnZSek5EMW4yMFhlWEhi?=
 =?utf-8?B?d3FIZU9qNHRHd21LbEtZUmhDZXRTNWFVUy9ZVTVmWGhaNTd4V1g1Nm9BNjhV?=
 =?utf-8?B?N05FbnRvV0VxeWVxV1VBU1I3bDdOUzRVNkJDZHFieGxPangvWmd0QnczMzVP?=
 =?utf-8?B?UDdrcWE2NmNTdkc2UmhvV0dlTjdrTSs1Rm1qZVNZNUI0Vkp1ZGx2TkdrcFYx?=
 =?utf-8?B?d0hKTTZwRmUwWWh6N1NCVUJSUW96S2NFL2NNN0tFZ295S3ZIaCtwOTZKLzE3?=
 =?utf-8?B?cnJhYjg4bkE2NmM5djZJTXdYV1hCcmdqZTlMUVYzUXhWQ0t6OTJMMUwwVVRG?=
 =?utf-8?B?Zi92SU05TWhMS2JlSHo3V3RET3hITHg3VUFUQ2NoV1V0ZGt6dGRiZ1VjYlI0?=
 =?utf-8?B?ZEJ6aUpmSWxQWWZZMk9NMytKRXNnZXVPK2lHS0Z0clduOWJDdE1JOEtaSFhp?=
 =?utf-8?B?OWp1c3MvOXN4TUt5bzhNNnhQYTErNk1Oa0pQV2dLL1N3MlZ6RGZFMm91MjZQ?=
 =?utf-8?B?N0xzVGlFbndoUUZNYXlOR29CSlJuYldITnJsWkVhRnhwTU9IdDc3K091OVNC?=
 =?utf-8?B?Y0JmNDJQcElvYU5xVUpMZ3NlMmxSb1BCem5NeTd4QjJhZjhNeldCMm1GVXN2?=
 =?utf-8?B?clVRbDViMStTNGhkSFJVWXpaTWE5ejM0U0pQM3BzUzJWa1RLMnBnMkV1VXJp?=
 =?utf-8?B?STFMaDJSVTduZDYrYlp6bUZWVXRnZm1JRWpKdVJkck9lc2tjMDBKWGxMWFpF?=
 =?utf-8?B?aXAwV0svdC9ja2NiTjNqZFE0MmkvZGhyb2RIdFNaeTYxZlFRd29vdE4yMm5W?=
 =?utf-8?B?TVRwQThLRXhhSGpQdVdNN0NYYUcvdnZRSU1DMFJIcnk3S0EvMk5vRDJ5ZlBX?=
 =?utf-8?B?bkRqcm01WDM1TDQ2RmdoMGUrWjFmVE5sNHRkVmUxbFJDbG15VTlZOHFOQnhF?=
 =?utf-8?B?Rkx0SGt6dThmaGNBYnlCTFcrR29zeTJiNnlaMExVWHFGcDJINStBU21lcnRN?=
 =?utf-8?B?Y3FIdFJMcjYzdmQ3akZwUzl6NXhiK2JidDJ6c0MvRjhNZmN6SGlERGRRMzVt?=
 =?utf-8?B?alNKM2w4SlVpRm1lTmthZld0VXNESy8wYmFwUDFmSkxoR1lBaitRTjN6b3hp?=
 =?utf-8?B?V0xaY0l6bjUxVTdYb0hESXhZTEVCTUF3bC94N2lsSzlxVGNKZ1QzazA1bTNm?=
 =?utf-8?B?ZXpUTkpvdWpWYy8zayttNzh1cUJGZmhBbEE1NU1JbzZsSmYrVHBQQlVBYVNm?=
 =?utf-8?B?elp1K1h2WmRHUVRMN1d1RUxhRlJ4WEhCdWJtWVl6Lyt0L0ZPVzUrSXBvTE82?=
 =?utf-8?B?R0IzMWJnemJlK2kvd1ExR3UvR0thSHE5MEdjOHRUYUt3OUF2R2swT1dGK3gx?=
 =?utf-8?B?MFRnb0xRYUhzc04rMnNVUVh2dklhYmk2MVUzUlN3TnM4UTJJc2lrVnc5bHpq?=
 =?utf-8?B?RTBYd0NsMTdKb2ZTTWhPb0xyNCtoR2dNanllZmpoNTZ3OGpNQmlBa2xNWHVl?=
 =?utf-8?B?aDQ4YzN2ZWhDcGZaUHB2N2tsVzcrdmFMSzFjc3luSVNTVUF3dHZtUHBvWS9Q?=
 =?utf-8?B?OURsRE5qM0p5T3JMdjIwWExQOUR5dWpZcFVXYllpOW9wK25HSzlyc0FDSTcv?=
 =?utf-8?B?a25mRkN4TkozUllhTHFWcVBNSjBQKzcwTTg0Z293ODlTeEFZeEo1RDRvQVVa?=
 =?utf-8?B?UHRyT3RKa200UG01OEZ3K01OY2lGY3J1Z01JVnd6RnZPUUMrc3kxeklIdkd5?=
 =?utf-8?B?c3hEOVFtdUh6V29zSmN4SG12V215MFJYNmd2b2M2YnNDL3krS1NUMzliRUE2?=
 =?utf-8?B?ejlCTmJObnJoSVZLM0J1R0daalpReC81SHBhM3lqalBUMDY3cWpaRis2d1I2?=
 =?utf-8?B?cFVVaW1SSDZzMlhzWjVMVGExcVRSbmgvYjNOQ3B2a2sxZ3NpdnRiUGJtOFhR?=
 =?utf-8?B?dlRnWVZyYlNMQmJtR0NyVjRvYWRvTkRjbGZxWXZzemRpT1NwUjM3TXFmajNC?=
 =?utf-8?B?dnpyL3I0b2VyM1JNRGJlZk1JaFk3VVN1UENMU2ZBZEU4WElhelRjNllzMnlB?=
 =?utf-8?Q?JAts1HQ/f6oT+j9q499d2wwtB?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f8d4c1-bbfd-4b5e-341f-08ddda5478df
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 10:30:49.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJSiND9+g/n6EB7zDTj6pFpQcTBKpqgoSZjsNuwrPWYutdw/voiScjxvFv8dkMS55z1axbf0nQhRFwQJP2P7PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7594

Hello Jan,

On 8/8/25 08:20, Jan Beulich wrote:
> On 07.08.2025 18:59, Milan Djokic wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2058,6 +2058,13 @@ This option can be specified more than once (up to 8 times at present).
>>   
>>   Flag to enable or disable support for PCI passthrough
>>   
>> +### viommu (arm)
>> +> `= <boolean>`
>> +
>> +> Default: `false`
>> +
>> +Flag to enable or disable support for Virtual IOMMU for guests.
> 
> Isn't this too coarse-grained? IOW don't you want to specify the kind of IOMMU
> to use, even if right now only one is being implemented? Also - why on the
> command line? Isn't this rather a per-guest setting?
>
Yes, it would make more sense to specify IOMMU kind instead of plain 
enable/disable parameter. Updated in new patch series version.
As for reasons to have this parameter in xen command line, it is needed 
for xen smmuv3 driver initialization, where viommu initialization is 
done if 'viommu' is enabled. Also, for dom0less mode and dom0 itself, 
viommu for domain is enabled while domain is created based on this 
argument. We do have per-guest viommu enablement option for guests 
created with xl, but this does not cover dom0 (and dom0-less).

>>   ### pcid (x86)
>>   > `= <boolean> | xpti=<bool>`
> 
> Also, seeing this adjacent entry, you're inserting in the wrong place. The
> options are supposed to be alphabetically sorted.
>
We'll fix this in the new version with other suggested changes included.

> Jan

BR,
Milan


