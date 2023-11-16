Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6BF7EE1C9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634230.989613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3chC-0003hR-FK; Thu, 16 Nov 2023 13:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634230.989613; Thu, 16 Nov 2023 13:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3chC-0003f0-Bq; Thu, 16 Nov 2023 13:46:14 +0000
Received: by outflank-mailman (input) for mailman id 634230;
 Thu, 16 Nov 2023 13:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3chB-0003dG-4t
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:46:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 804fbd85-8486-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:46:11 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 13:46:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:46:09 +0000
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
X-Inumbo-ID: 804fbd85-8486-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe27FRw9NVn0wSXmJ/J0iW4hOvotUrHXE+bruOKDZJi+4um16Zm2uTUqknyTuXHhjVfcOmBKIJPsZDJTtfUWswr1Eqd7fbGY2PlogxhcK82x8V8eMXcO/F2i9eMnE+p+2nxD2qrIHgoItkwtGQJOFIkqQSZIwlqzF+Z8gWXzrx0AL6Ncor480xmP3KqAnm4zZkrS2Qlj6wyrxyBtadE2WeNO0/EAf9bMHUURLPM1QD/a+zAR1kvv+lnZCZ0NgweTrZt2uKSJ4xpI5P6e6im4i48sM07np2IeCuv8TVmL47YaBPgLgY8TY+W0m0mcux3oyYtBdAUd6UNOsyE0Ua0ZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ35HW5/VXYEY1+3qai12wgann+ykzB/YgLcoRE3Z2A=;
 b=YypLyMtfSSZ4h0Zz3m6zbEXGUzmMLYLkPfhoqjzkBlckupHDxMs8uXWheBcD9kE/lbQ95J8vQlPKvgL51tdRdvJFD9uZxfrfWyHAmJimf40mJKbeOx0LtBOIUEbodnc7Wg34kdGQG0Bsts8gnd3gY/SSGOW+gaupX7Qnhg4N8IOFLUbLLPRH5cwhl43EthEooiijv6p49Aoz9mcwPQ3T7m2+LEhXT/hWLFruu0ofnPn+3JQFfuZix+0zuj7uHMT/mdMP1NNDTC0EmZ7lH7NQOAzdQmx2vL7qPOxLsKWPo2XTFFh9ghqr+F6Lqp6W2Fh0cqgm24Hu4XG8/g3rXDkjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ35HW5/VXYEY1+3qai12wgann+ykzB/YgLcoRE3Z2A=;
 b=IO8YaVec+JU9yP0oH//oSZXa7qvx5K258qvw9kHRHREby520ITh0t5NCQS6XZbgpf5ny3n4j3DSlww8LFpVwwTRsJTy1aF0M4qYo/tF7U76hy8lokC1CZbegIGPHje2Ga3XhOTmqHUVFa7QJzhFgqrZC/nSJY+cSyPtvyf9J7QamxqdvzQrFNCslOQdAovrneJwpNHl7LpsOTJBAfLauDIEHA86k/9S/FYhcCpf0rXMfYH5rdYyGmATwts+TVHjEkVz0i7q5j1oAhvafmqgEiaLpL4wQinUFeuxmVVhDUsJINZ/n6Fut7fdwLV854WYDL5BF9n+2s8fgMXeWt9q5fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9810305d-4b36-4e23-b807-a7a00f0ba6b6@suse.com>
Date: Thu, 16 Nov 2023 14:46:08 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/5] x86/HVM: introduce hvm_point_entry()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff9fc7b-6111-4301-79a2-08dbe6aa6379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e3qhI7JW26AfM8ghP3Z1xB1gCDj/zdp3mD67d+QxFX0ee1OY4ykwXeRontvX03ZX8QGSTV2EHRY1k3VznjkKZUGopAZa73+CE2OpQYiduc5wcMmBOYbytl/FGz+wVlbwAksrM3F4uYlSfoF2UFjdkqm3ZZDW5QJ1Jelufgw5m9gtBhOnpxlMGNK1S+P0RmE7ubkk5LdLl3G6JjVo07OWYTubmm5I8fJqolgKkwp9PlgHkJNdHljZu9kVaZty2vKRf/a6keciaumqTl2p0SasPVuS4ABJJZDx/NjaEnglAo0NBbgRN1OUYO9IVA5j8w7N2AfQs9GemunI695CCiSFAnhyUwMsseDgkhaIpJerfZ+CGDfBCyYKdVtzsGxE4lpJR6NFNqhYmZ/nlCWUHNzWRhornI6AK4XuOL0qwuQBwuyGrtfWjtNsdVyuyKNkuvVtH6t4RClycPY47B85W3H+8sSiagteW5I2U6ia2xfs2GMIiGE7BPmd8+q2pkAqDPCAz9YjajFLMiXUEtIYJIM1dmOGvYwLR3E9PxvQaNiYnxS4UAsqlEFrWnUIaB6LUAkVSa+KFVHG8l9VcXulJKUur34PikzpPIzhzhFNN4CfHXtIcdj1CqOmZB0kzy26XLcS08kXO2m/DKymyMh89qKlhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38100700002)(5660300002)(2906002)(31696002)(8676002)(4326008)(86362001)(8936002)(41300700001)(31686004)(6916009)(2616005)(316002)(54906003)(66556008)(66946007)(66476007)(478600001)(83380400001)(26005)(6486002)(36756003)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUNrQmNaeFZYZEVRUXZUelRjTS9JUEJFOFdrSWFseEZxS092VXhWcXlMSXZR?=
 =?utf-8?B?VGVacjkwOHVZaGFtNjBrWXRnYkxReGhvdGNEUE5saUxUSlhtR0RwQXlMWWht?=
 =?utf-8?B?T3IzR3hwK09oOFJYcXYyNk1Oa056UGFsL3RGNkpDTlJFd0M1T2dtNFpGWDMw?=
 =?utf-8?B?d2FzZDlXOGg5ZkY4MkRkSHR1YUVTN2Y4RmFJUERmUzhROUliNExmRWt4SEFS?=
 =?utf-8?B?UERScDFleE90RFBsNWVZQlNsRTRlMmZzbkIzWXRibG91Zng2RVZ2VmdIbFdr?=
 =?utf-8?B?alY1T0taM0NOZWozRWg4b2t0KytqU1pjdlAwMzhUeGJvTXFvelBXd2Judmhk?=
 =?utf-8?B?ZVZqS2FWR1U1b3lNaUxlSG53WjZOQktJWEtUUXIyZnFqRFhPUkJMazBUcUNO?=
 =?utf-8?B?VndRVEVod2ExVWFleGkwZTdqMk5OWHVUSkpQR28wTHhrWnQ3THBVNWl2VkZx?=
 =?utf-8?B?d0FvbThibTdraDlCdTlhTXBNSTRBK2ZPcTlqUWJSMEowb2FuT0M2NXowd0FV?=
 =?utf-8?B?MmFLc0tTU1g5bVZZbFRmV016QUcvaHkrMDNHUG9UKzJhbzhvVUhyTmhoZkc5?=
 =?utf-8?B?UER3aUtIdXlaRTJVc1dCa2d4eWw5cTF3bk9lUWw1K1NmdkVvSU9SRXpyVTJk?=
 =?utf-8?B?d0VkRWVpb0pJY0UxdVVGUktaUy85R2tlRVJRT1JrcmFBNlpVLytRQXE5Qy9V?=
 =?utf-8?B?R0w3M1h3QlZLSkF0ZUdZWnI5dUNDY2M3dnByd21wdnY0OGZvR1NzR3AyUDlK?=
 =?utf-8?B?VnRxaXM1eUFvNUVVMDF0QW42ZGcvKzNnQ1dyb05sTUpPcnFCcVB4aUpLdUt0?=
 =?utf-8?B?aSs0d2lNYjhGZXpuMGFWRmJCWnAzcWNWRFNTZ3pYQ0pOTmxEMENyYW1EQ2pC?=
 =?utf-8?B?WVN5ZWwxOTJUQ04yMCtIdE9hVEFNYVcySkpRZnBGZ1JQRVh5Z1lBTTBuaTNL?=
 =?utf-8?B?dnFSb0p2ZEVLeExoQlpSd1VhVHVDK2dlbzh4cGFSNHMrRmQzVWoxdmo2Z0Jk?=
 =?utf-8?B?M0tlQk9PbWdVWkNOSmhXTEc3b1lGZ3VNbTFvU2FnbllxS2R6UjhIeWxWWU5m?=
 =?utf-8?B?Q0RnSnJnZXBUdkRaRGdNV3NnTkM4bUVRNTJTMUlnaGlZMU5GVjd1RHEwaXIw?=
 =?utf-8?B?aTh6YitnTWlRSWJJYkc3VnJBTitOdEs2TkVqUlVMWE91clBIbXo2aUJoS2wr?=
 =?utf-8?B?L3dYUE1vSDRtcjRGK0xDSU1raVU5VlpSaGNkZ3RZUW14NTdTMjV0K3VwQ3ZR?=
 =?utf-8?B?bERYdE91WGpYUXkwcEdTZkNMTWNSV3VueVNxT3M3TWxrak1UMjRIQ2ZURTJF?=
 =?utf-8?B?QWprN2JxM1ZLcmdpWWx3WTJXT09ZRVRORmN3dzdWRkVEUHh3aGdyNFBOeEN4?=
 =?utf-8?B?NktDdVB2UUFGM08zL3p2a1dqVVpJWGQ3aU81OXR5UGZER0RvZVQ2YThMVFhz?=
 =?utf-8?B?cnBKcEVBNW8xNlFpM3ZrTCt1T0w5SkpIaWpNQVVpa081Q21BSS9zSTBNYjRl?=
 =?utf-8?B?ak0wN2VDZVBUVno3NG5RMVljeUhVbmNhMzlqT09SSGNmWVBiZjE5c0ROZmVh?=
 =?utf-8?B?eFlWTUZwcEdlK09zbjJEYzBqQ3d4MHJoajZhTWFKU0V3aFJjTzJ3SGkzWnNJ?=
 =?utf-8?B?S05xSW0vNXJDdldIVWxCUkdPc251N1M3K1MxWFFRTDFPTlVBNmR1N3R4aGI1?=
 =?utf-8?B?UnZIajdtUTlRenkwMm5WR2tEb2IySld2U1VMVmNzaW56Q1hQWkVDM2Mzekxt?=
 =?utf-8?B?eU9xU3I2cDU1OHNiU2FsRyszeHgyRGJBUms3L2ZZUFJZWWtxTlRxOGhKOVJX?=
 =?utf-8?B?cTA0MUR4ZTFDWTFaTlJ2a3FvaEh1NGpOYThuMVdkNVZod3NrYVdIdzJmTzd3?=
 =?utf-8?B?YXZ6eEZlc2NKZnFzSUROUDQ5QkZlYXdJK3IvYUxMU3licU9pRDF4cnppREdK?=
 =?utf-8?B?VFZrSTFCWXFoRTNJckUrSDRJZTJ4TktENVZWZGRiU0lvR2NrMm1Ucnk2b2JJ?=
 =?utf-8?B?eWkwV0dzaDdnSU9HM05ETmN6Q2hNM3lMZzhRWmRGdWNERGV6dk9IdEtOdC8y?=
 =?utf-8?B?SlZmdFFkZ2pSTW5ESm9vYkRyWWd2WGVKZE5VSkhScFhvWDgyeVVBYmVEbExW?=
 =?utf-8?Q?NO5hWHHnTHPgYrlb+OZdAPivY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff9fc7b-6111-4301-79a2-08dbe6aa6379
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:46:09.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7I8HxJx4gzryg0W7r+C64KZIp/4AhK/xKE8bMgOZPYK+gIv/ZTCBaZeQ6vooXXLSmdxzPgRzmD0eq/DeRUeLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973

... to accompany hvm_read_entry() when actual copying isn't desirable.
This allows to remove open-coded stream accesses from hpet_load(),
along with using the helper in hvm_load() itself.

Since arch_hvm_load()'s declaration would need changing, and since the
function is not used from elsewhere, purge the declaration. With that it
makes little sense to keep arch_hvm_save()'s around; convert that
function to static then at the same time.

In hpet_load() simplify the specific case of error return that's in
context anyway: There's no need to hold the lock when only updating a
local variable.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -637,7 +637,7 @@ static int cf_check hpet_save(struct vcp
 static int cf_check hpet_load(struct domain *d, hvm_domain_context_t *h)
 {
     HPETState *hp = domain_vhpet(d);
-    struct hvm_hw_hpet *rec;
+    const struct hvm_hw_hpet *rec;
     uint64_t cmp;
     uint64_t guest_time;
     int i;
@@ -645,17 +645,12 @@ static int cf_check hpet_load(struct dom
     if ( !has_vhpet(d) )
         return -ENODEV;
 
-    write_lock(&hp->lock);
-
     /* Reload the HPET registers */
-    if ( _hvm_check_entry(h, HVM_SAVE_CODE(HPET), HVM_SAVE_LENGTH(HPET), 1) )
-    {
-        write_unlock(&hp->lock);
+    rec = hvm_point_entry(HPET, h);
+    if ( !rec )
         return -EINVAL;
-    }
 
-    rec = (struct hvm_hw_hpet *)&h->data[h->cur];
-    h->cur += HVM_SAVE_LENGTH(HPET);
+    write_lock(&hp->lock);
 
 #define C(x) hp->hpet.x = rec->x
     C(capability);
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -15,7 +15,7 @@
 
 #include <public/hvm/save.h>
 
-void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
+static void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -30,7 +30,7 @@ void arch_hvm_save(struct domain *d, str
     d->arch.hvm.sync_tsc = rdtsc();
 }
 
-int arch_hvm_load(struct domain *d, struct hvm_save_header *hdr)
+static int arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -277,7 +277,7 @@ int hvm_save(struct domain *d, hvm_domai
 
 int hvm_load(struct domain *d, hvm_domain_context_t *h)
 {
-    struct hvm_save_header hdr;
+    const struct hvm_save_header *hdr;
     struct hvm_save_descriptor *desc;
     hvm_load_handler handler;
     struct vcpu *v;
@@ -286,11 +286,12 @@ int hvm_load(struct domain *d, hvm_domai
     if ( d->is_dying )
         return -EINVAL;
 
-    /* Read the save header, which must be first */
-    if ( hvm_load_entry(HEADER, h, &hdr) != 0 )
+    /* Get at the save header, which must be first */
+    hdr = hvm_point_entry(HEADER, h);
+    if ( !hdr )
         return -ENODATA;
 
-    rc = arch_hvm_load(d, &hdr);
+    rc = arch_hvm_load(d, hdr);
     if ( rc )
         return rc;
 
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -39,6 +39,21 @@ void _hvm_write_entry(struct hvm_domain_
 int _hvm_check_entry(struct hvm_domain_context *h,
                      uint16_t type, uint32_t len, bool strict_length);
 
+/*
+ * Unmarshalling: check, then return pointer. Evaluates to non-NULL on success.
+ * This macro requires the save entry to be the same size as the dest structure.
+ */
+#define hvm_point_entry(x, h) ({                                \
+    const void *ptr = NULL;                                     \
+    BUILD_BUG_ON(HVM_SAVE_HAS_COMPAT(x));                       \
+    if ( _hvm_check_entry(h, HVM_SAVE_CODE(x),                  \
+                          HVM_SAVE_LENGTH(x), true) == 0 )      \
+    {                                                           \
+        ptr = &(h)->data[(h)->cur];                             \
+        h->cur += HVM_SAVE_LENGTH(x);                           \
+    }                                                           \
+    ptr; })
+
 /* Unmarshalling: copy the contents in a type-safe way */
 void _hvm_read_entry(struct hvm_domain_context *h,
                      void *dest, uint32_t dest_len);
@@ -127,9 +142,4 @@ int hvm_save_one(struct domain *d, unsig
                  XEN_GUEST_HANDLE_64(uint8) handle, uint64_t *bufsz);
 int hvm_load(struct domain *d, hvm_domain_context_t *h);
 
-/* Arch-specific definitions. */
-struct hvm_save_header;
-void arch_hvm_save(struct domain *d, struct hvm_save_header *hdr);
-int arch_hvm_load(struct domain *d, struct hvm_save_header *hdr);
-
 #endif /* __XEN_HVM_SAVE_H__ */


