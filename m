Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F37F0E58
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 10:03:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636497.992048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50B0-00056U-5P; Mon, 20 Nov 2023 09:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636497.992048; Mon, 20 Nov 2023 09:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r50B0-00053d-1m; Mon, 20 Nov 2023 09:02:42 +0000
Received: by outflank-mailman (input) for mailman id 636497;
 Mon, 20 Nov 2023 09:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9+lD=HB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r50Az-00053X-56
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 09:02:41 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8de41645-8783-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 10:02:38 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:02:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.015; Mon, 20 Nov 2023
 09:02:37 +0000
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
X-Inumbo-ID: 8de41645-8783-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7HlSXvLPeoHaVzWCjQi9eHdpScXR7vvWGd1cm3kbmpRsQAsc20jafY71/HWtqGcsXktd58+sfe3CYVE4OjWW7eShiZvG4YPIfhVukVmp5nkjSYVvTmtkHiyuqfY9aqiW+0JhqAaOavqArrcVUanJGspgvLS7souikTAOVDTTrkfgl52dL4QzwNy12FDIhWP6nSbebAXPF46Ex+Zel0Pc1MyhmkxaAxtYXcWCd16QeEdzoJ8hILYB9HPYp5gcugo2/4iFnwl5ya4eXKyRW4cdxR8fctjmx3/ERVTiPN+YbMaQucH/m1kdrneCwhCyDhjILXtAt46V0Q8WfgbJCL3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HICccsNUF/EOWkVvcxfIwhFU09YZGjCFraXnkhzxsA0=;
 b=QFAesjpsLRcWy5eRYmj3JBSvuZvmrUqWv9TxLDUB1vKEPR4aAXCs5R0+Nw+NBhNHpOnn+eIjNiLOzU5Kjcjke2oUdsf4ShROo1qmc4BqOqHcn93kwXdtrD0dvtort5n7tTw0TCTLZHmqWvKaoFSoQ26ulzBFAdIvL+GJ/VkzdI277yQRu64YAlBlPSsTt2adfc52NjZL6jHBjKHDN+XehQRHI93rVwG7inAVjF++6x1cum+ZodTkrtEnuS1leMzhfozyr9yBXMuiU3Tf/Gc5Zq/6/7PyD8GOXBGU+xCwF+GJVimPSNDEq1Ev2Q2eVBxSzL29TVnD9CikjyqQH0LlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HICccsNUF/EOWkVvcxfIwhFU09YZGjCFraXnkhzxsA0=;
 b=IVMtKGEBjPBHAWlrsOAbwvnBN8EIhUVrOWe3csX1pKRu7/vIM9wNSYRMdRLFB2hKDMeDOklKrxW6RfsHpUA7frL+jh5UuPPVc7GvTA8G8stN1v0FHwAHoDO3NhALnnyDO9FK0WgxaeZY9I4Hvu4loamKGmlwhNctHYMP1RQ+3urFJjaa94NPmamhsjBkLuTgcITpX/e7b2Gwq2qIBJ02M0+riwPUAG+DyYmHPU/4+1pipRfwgmkbUhRGKlIPjS0cVRKmx+gyfW+wOy1VYbDwUODBdMBzcrc3HmDSPYMmOWdqwGKI05uooBNV+rDPvGeoEn+W9m2kfb1xF1lSbMWRYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
Date: Mon, 20 Nov 2023 10:02:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2a6cc5-7b3e-4e16-5bb9-08dbe9a77144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	58/Th3gV2Q0EAHoEAgQIXIxDZABffTCqR4LfwXcVycvHZFhaBVb603KLcPeqTx4vwyQJBOaqTgvQ+dhbAN1qHu+shRQro68Ijl+2Va34SdvKZzM+lZ3zrrIRcIfvQP+eo+PjmGZIMSXCETOaQXXYVjkUR7g9BMxu8f/jI+muCqoB4pxQa8qN97ePpwWWNfC1lFR+r5pBCnBfzNXm55BlFcbQDdaWofJ9Mg2n9zZ9a/suvPgQY8RQW9xwcl+aRswi0xf+4frgihjlc4gxBmwnA5HUbVT1NfeOc63AVAr4WlJEETXwQJgyiFxl/nIl78ZBiFuE7LkOrv5Hljcw2eMyVF1OwgttYNHPebpNbYoJyueyBctVq9yEKO/j2rdXByRfBvbyHRp6yO6vUcDxE4TOzrkdEWWpQNIZ9yPuazZuIfJ4eoX7gL/aUcDHuXLY6tlRM4TMzeNYhCEoyXRB/EpIZ/NiFVmW1dpdkRtaY+uhXykY0WouGRI4smEB8ldWNjHofGTyET4Sk1ohU/nO0mdKQpkD4IHKsit77ziReBrfi9PgbYHFRrAw4IqrZSkuCTk0FE/BMhORM9wrCDOvdCoRcFPCVPNMeZqc0KZII85c/XV/gV1na2MWW6r1q/T346+vI3lL5+IjUg5fARAmJI6Fjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66946007)(66556008)(316002)(6916009)(66476007)(54906003)(26005)(36756003)(8936002)(4326008)(8676002)(38100700002)(41300700001)(31696002)(86362001)(2906002)(4744005)(5660300002)(6486002)(478600001)(6512007)(31686004)(53546011)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmlka2hReHY0SkpoZFJYcjFyRmVld3FOMnQrQ2g4S1BKM1RQUldOWkwzYVVz?=
 =?utf-8?B?bmJTb0tueUhhaU5MMVFyaXhiNTNJYUd2dTB2R3MydVdxdkN2bHhVTTRJbFlS?=
 =?utf-8?B?K3J2TUZuMWd3QjkzSHlMVEtWN05mL04zaDQ1NUF5aFJpZDY3R3pnWmxwS3FJ?=
 =?utf-8?B?blVwU3FSRlNUYU93NlFTWG53cndQQnp1VmlYSThwNlBScTU0VGFRN3NZZU9P?=
 =?utf-8?B?VlhldExmVFJ1WCt1aVNCUE1WdDh3NGVEek50dU8ycCtNU0Z2Zm05d0MyOHVl?=
 =?utf-8?B?MFpBd2QzWGRXb3ZDV2hQdnlyZFRvb3hDR3hPREd5MVJ1M1Z1T0hURjRxaWxG?=
 =?utf-8?B?Z2dCSWd1c2FBaTFMOGRlYVNseHBQZlVQTFY0dnZpekFlbGU0SEkwcGs4ditr?=
 =?utf-8?B?Rm1Bb0d3eVI0M2NqTVJ0bUppaDB1S2RLM3hwd1FKOEtGM05jVFVqTE5Bd0lJ?=
 =?utf-8?B?RGtvMlJxclBIOGVKczd4YXJTNTRlNTc2WVdCVlhXY2s5M1hZd1JnQVRQRUpz?=
 =?utf-8?B?Q3JaUTJXOVRuMVkzVURaenQxSklDOW9iSDhBRThWbllOc3BDemVtbmVWTFJJ?=
 =?utf-8?B?NXB0OUROZUhQTG16YXE2LzBBNFhidEJjcGcvRE9LY011VVVKd0Z2R0pNMVhh?=
 =?utf-8?B?WW80TklRaVI0SVFIdDFLdTlScUQva0N2VWpISmRUd01LQ2ZSdEdENFJ1WTA0?=
 =?utf-8?B?a0hRM1ExSENlZVZ2Nmpta0wyVkRjWkdpMzBzRzlzYnpwUHlFSHh2UjU3Uy9Z?=
 =?utf-8?B?N2FnUmpiQVdOOEE0d20rcjFDS0Rva0UrQWVBd2JTYktFd2FDeENMWVYzQlg1?=
 =?utf-8?B?VFBlR1RZUklKOHI1NjJWcXo4Mzc0aUpMZnFRQXBFc3kzOXBZMm5ETll4eU5P?=
 =?utf-8?B?WGZUQkk4NW9xMEZ5VGRCMmlxSUVZRi9PZWM5YjBVL1Q1YVNlUko2dENiNkRs?=
 =?utf-8?B?NnpLVmhCZFNiT3puSjVLM295elI5MEtTZEE5emlxc2l2L0hORnRCNVRRSjJ2?=
 =?utf-8?B?UHordms2VzZLeUJzcDE0YStjSWhsVkFlT0E0RE5UMWpoS09DRi9RWUl5city?=
 =?utf-8?B?UXhPVnJYaGNWckgzOTJORTRSWDMxMUVIVVpYV3VoWXBObmV5ekVuR1FFd1BO?=
 =?utf-8?B?MGE4ZGkxTGxCa3hOYktqbGR1Z2lCcUdoWEpCWTZuNkNRVnBqYm40d0J1N1Jl?=
 =?utf-8?B?dzFDUzQwc3I1Z1ZlQVlUeWE3UWoxWWVjWHJJZlBMRUQ4RnQvMkVRbS9FL1Ay?=
 =?utf-8?B?TDVhTjNaR2lVa29URkpqMUFTMEo3RExxNEdmeWFxbWlyVWRvUk9LZFRheVBp?=
 =?utf-8?B?QXRDaTFvQW0vUHMwck9hUjhXOVdHNkw5M1JqTkVWNi9hVklXNWkzR25oTTJD?=
 =?utf-8?B?eUNPNlJvNkFFUXZJUjlyMk9GMlA1UDZkTnNCZHpvMFc2YkZaRGZKMFBDekcr?=
 =?utf-8?B?RU5wVU02T1Nqd1ZuNCtuZktIYWtqdksvaDBsNzU0TzdyQWNsa2d3YnhQZmNy?=
 =?utf-8?B?ZmNPR0hwR0FoSnZiUjl2eGZPT2phQVMzNmFzV0dhMG90K0lreU0rZzNBTmlE?=
 =?utf-8?B?QzJkT1ppWDNNTk1vbVlLY0FhYVdZU1BMckhCcTZydHJjSlc4M0Jid2tlejhV?=
 =?utf-8?B?SjcxaXY5VElzWmlhTnBwdzFRbHFybDhOOEpUSEkzYmxaZzh5QzRlREJHNmZJ?=
 =?utf-8?B?Sk5BS2dLeGFoL2Y3cU1NaFJEMmpqQmMwM3F6OUFxaVgyT3dMb2RhTnc5REVI?=
 =?utf-8?B?VURhQlh2K2ZMMmpORlRmK2Uxc0VzM2NFT2xkaUdDdkJBS1B4MFJ2aktpajJX?=
 =?utf-8?B?RHVTTTh3S0VDM21oWmViVTNDUVFBc2dxeFpSR3BpSlNoMkRuOHVhdjJJRTdk?=
 =?utf-8?B?MWoxUVIzK2FZOVVGcEJ2eGZHRXhBa0lPVmdXREFSRFZFaTRkK0dXeTNuSG9O?=
 =?utf-8?B?K0d4M0xaU213NHBGZS8ySm5wNVQ0dEppakxDaE1BRlArQkplRkZLUFN5YUN2?=
 =?utf-8?B?Vm91TGEzSCt2VnprRnB4T25aV1hBUGVDQmQ3TlRhKzc5cnZic0VBcC9vWjU4?=
 =?utf-8?B?S3d3aWZObktYYlpjUlNLQWxBdURreHZESDJrQS9JeGZ6TXczay9lZ2hieENH?=
 =?utf-8?Q?L6heR0X5xiJBAIvmojPqMnV4Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2a6cc5-7b3e-4e16-5bb9-08dbe9a77144
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:02:37.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kY3hSA25guDMJot6fve/ZHhQJHAaP7izIljyEfSwAI57DQUi42SD40GeUlK2aHXJfvmuHGsOEhZ1EyExb3fhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740

On 17.11.2023 09:40, Federico Serafini wrote:
> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -23,8 +23,8 @@
>  extern gnu_inline
>  #endif
>  void sort(void *base, size_t num, size_t size,
> -          int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, size_t))
> +          int (*cmp)(const void *key, const void *elem),

Why "key" and "elem" here, but ...

> +          void (*swap)(void *a, void *b, size_t size))

... "a" and "b" here? The first example of users of sort() that I'm
looking at right now (x86/extable.c) is consistent in its naming.

Jan

