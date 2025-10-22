Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B428BFB4B3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 12:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147822.1479971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVhJ-00039b-GB; Wed, 22 Oct 2025 10:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147822.1479971; Wed, 22 Oct 2025 10:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVhJ-00037I-CL; Wed, 22 Oct 2025 10:04:01 +0000
Received: by outflank-mailman (input) for mailman id 1147822;
 Wed, 22 Oct 2025 10:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+n4a=47=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBVhI-000376-Hk
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 10:04:00 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 699343be-af2e-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 12:03:53 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 BL1PR03MB6008.namprd03.prod.outlook.com (2603:10b6:208:30a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 10:03:50 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:03:50 +0000
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
X-Inumbo-ID: 699343be-af2e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adUaiMNsgfjQcHUuhg3O5M8k3nntemIcdBVNxkyUn7jx/s2UCOuTTsNkhgDLbJ+qe4MZmL5MBRnWzv79GxZZzHfijjoOCh275nOofcCtWPWW8v/XJeRL9mR9VzjtRDFMgAOXfn1xHy+EjtbUuNVAyoqd89H8GNYAu9dSHhA21kSJl84J+4wtDI/R9KOu9NMro8JYN5fIiY2nXlLUfoCO9xEXa52UyJDdTAfdR7b/Yex8b0g9eGodlmRTzRhGEXgnYnT2eHJGD4xW9d7DrDwiaSUaBkQs+96DvS5Ym2kgLL3DlWtya5uK9U5OdQ9NLurvsnb22c0TlRskONK1RJTtpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBBImox+fihdQ9qDhw415JrC/z8uBTlfZ7bELqq6vRk=;
 b=h7Gre2DLZXdytmFfRQpHDc/KbJGLjrw9uranVR+ZUNiFqIArH+i/eq5m71C1XBZduxYQxZkrN56w+8nqHUqBBGTndhBEWzHw7NUhhA4LPyMCs+N5v5a6WZXrSM+ECp9K2tgZmY+9R44iCBBumaLlXr3qzAw+QUGvZeS/f/Vc+SSokVNWcZ5K8qef9I1OtQLxwKP88dPwNpPy7+OZi2RBnPhZzIPDYhYAlAdg16e5N6NCCN+YEzjVlv7Djxj5ULw/XqzbqRLMN0T2XY/Mm3ZNl4R5/PDGbeUhfu9sLGKIfpbh+iCrkyb59XHIBsiLM1oi7JylzNZQkAD6Bm50doeEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBBImox+fihdQ9qDhw415JrC/z8uBTlfZ7bELqq6vRk=;
 b=oGuh9QnbTWs77CzIQavO06Qd1vrTuiiPIdhwlDUlPZ4nbSPdUf/OBKbn5kk9XJojBTEf0/X9Q31d9NXynIsbOiSFUdpUGMGfXLBfLQ3w2xIf7afKRglkWKQtPtYiAf31E0KbyS1IWaMkmLniDYEhP6aKoyW6P259R9dV6Iv00DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9bd9bbec-79e6-4b77-b42b-d6cc0456e4e3@citrix.com>
Date: Wed, 22 Oct 2025 11:03:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix randconfig build problems after introducing
 SYSCTL
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, jbeulich@suse.com, roger.pau@citrix.com,
 Penny.Zheng@amd.com
References: <20251022043947.949583-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251022043947.949583-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|BL1PR03MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f898b19-f2d2-49d7-6ea2-08de11524c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0pBTmwySWJyK1NSeHBZWHE5S1pCZVJ3RjZ6a0IzRlBVenROQ0RrR0NpVWlI?=
 =?utf-8?B?QTg5SFZmUUxweWxQMHVleGtaV0kwQnMyZmxoekl1WlhheTZtT2FrcklhMEFU?=
 =?utf-8?B?TkZHN2pvaitTZnhvTFVIb081TzFGaHRCMUo2dlBkYS96ZWI3dEVuK1dLbDdr?=
 =?utf-8?B?djNZY0xjVzlSR0ZvbDhrZCtMRU9nc2lDRVRpbURGQ0ZTMWpubVpkNEFucjhy?=
 =?utf-8?B?eGFvUzdNOEdGQTI0RG9pT2p3SG9PVEI5QUtCZkxqZVNwWFJXZDk3SHREallK?=
 =?utf-8?B?bm1WUGdWMEV4U1o0QnZ6KzdqRWVNUzlHaDhUekZPdUpSVkJjbDJJZCtDUjV4?=
 =?utf-8?B?UitOYmQvb2tEY0hlWXN3ZkwxazBYNjY0UDdjTDVkN3JGZ1IxNE5Zd2piOHZ6?=
 =?utf-8?B?VkNBSGhVUGFKMUVJdVVKMHphbmk0WjVkMTA3akdIdDVWbjkvcllIS1pWMVVC?=
 =?utf-8?B?MzBSV0pRY0NRdHBpMGRjb29wbzBNNVpYWHkzQm9VQ1RZTThzTHVEZTZzRk9R?=
 =?utf-8?B?NGVNUUxvZytaM1dNZmJKcWFiVlVsaUE3Q05LZnJ4MDBJTU9mbkxFUFlwY2dI?=
 =?utf-8?B?UzB0cWMwNjIxZDF5S3NUQUk4bXRqVnJLeS80MzlhUEI1TFVVUU5CT2NJRU9D?=
 =?utf-8?B?Y2RHU01HSFpXR1UvOC9HZXo4WnEwMmdhbEkxODA4cEZ4akoxQ29rNHV3UTVw?=
 =?utf-8?B?bDdKT0JueDIwTXk1WndmYVNYS0gvNW5qR3J2OUcvaDJiRyt3ZXFPbGE1STVK?=
 =?utf-8?B?Lys4YXh1RjNMU2JEZHlxSFVzeVlKSFdGb0dDVWgxdlhNOUlPZWEwMmZ5U09I?=
 =?utf-8?B?dkh6aHh5dmJDVXN0ajUybkEwNDh2Mi8zVnNWd0dESGxwSlVGTjcrK1hLTDdq?=
 =?utf-8?B?NGtDc0tNR2FVWEdDckx5ZThBR3VMWVZSVFoyMFNuN0xWV091QU1aTGNVSUVa?=
 =?utf-8?B?NGRCQXAzWkpVT1pISFZEc292TFp3Q1VzTXh6ZXdCdlJja2NZM1NIcFpicDg3?=
 =?utf-8?B?VXlkdnhIaTkwclBMM2h5eUNCR3pUQzhsUnJ4R0Zac0cxWWU4eG10b1BSd29r?=
 =?utf-8?B?Vy9BSDBTWXRka0NJTmpJckRWUFV6WWJkR3ZiVkdLMSsyclg3ekRSUmEzaWNU?=
 =?utf-8?B?ajdtTTd5NlRFMVZhVStpZXFBR0Qxbk5NWnExdFhYem5lQXJSL1RxbW05Mmpu?=
 =?utf-8?B?eWxZNnN6Z1BkYWZ0bjhHd0lBUHBTQ0x4UFVMcURIdnlYTlcrN2RIV3VnWjJB?=
 =?utf-8?B?VjdrMDNDNWlaWWVmYzF1SkFGbldvKzVMaE1XS0xVTW9nVTIvRlExclpsUTgz?=
 =?utf-8?B?L3ZRNmp6Z1pZYmtZMVpJdHF4TGxiMHZzWGdUTzVmZjJqZ2N2TklhTUdxUlpr?=
 =?utf-8?B?MVRqVUJWRnNUN2NSRUFsZFlFbXVUQTBNT215QTgyRk1VODRKTUlkNjU1OTJS?=
 =?utf-8?B?UytYcjNBM3RvR3ZZdFdMbCt2bFZwdklSVlRTVmRDK3k2RjlXZjVZV3hhellq?=
 =?utf-8?B?Q2xBZVljdDlNZHN0U1JKNnlvMGpGaEFOaUxFT25hM2gvODFsU2VMUHBVZ3A1?=
 =?utf-8?B?VTZhZDIyTUcrZVNlQnpnK3N4UDE1NEIrRUhrbGthVXFLMlp2V2trdVdOaXdo?=
 =?utf-8?B?MjFwdFExZDNKc2lEU3dTVEI5ZVBINnpXOUpQZmt1WDVXV1kzam42ZG9BOG51?=
 =?utf-8?B?MmZJZ2ttWC9CRk9JaGRSS1NIa3JsLzFNUHg1ZHhzUnB1bXQ2cllMY01kVmht?=
 =?utf-8?B?R1pFSUZSaGZjeWhRb0lncHMyK0VxN0ZvQzZLbUI0bkFtUjcwS2hIQnZpbU1j?=
 =?utf-8?B?ZUVkME5ROE1IcFJRQXFSTjQyc2ZQYzFZa2pIeW9NU0RVMVVmQ2Q1WXF1bExQ?=
 =?utf-8?B?N2lqbVhDZE9ZQ2VYWG9XT3lhWnJUK1pEcWVIMzVtZmtMRFA2c1lIWTEzOTU2?=
 =?utf-8?Q?YjBMuRAOzKgs3z9BRgxJlp7z2IkdEfW1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzhYMkEvNjlOV2VCajNKb01YYXZTVVd1ZytBa0p5SmttVUpOOG5VR3MyUzVL?=
 =?utf-8?B?OGRHWm94Z2dLQXhuTHgrYjBkUlUyTERpUHdHYTNCRW9vVHNRQk40cTVlUlBk?=
 =?utf-8?B?dThUS1Y5eHpoN1dBM1BLeVpNUUw3bkVza3h2UEhjNGEySVgyM3g5NzIrS3h0?=
 =?utf-8?B?dmpLQ1FnMU5xUG9ieWFGc1dBVkV1bVh2Umd3ZGcyOCs0YlkxYlB2V2xtendS?=
 =?utf-8?B?T0NoS0tXN3M2ZlVkS24vOUFOaHZScmpaNys2eGFDY3N0d0dBMldEbndWeCtu?=
 =?utf-8?B?bnhDTERNVjBIS05GU3hvQ0t6cXlKR3B5ODBJMHg5eUljcUg2QzgxUnVVWkZM?=
 =?utf-8?B?SEw5OVVQRXVSR1VaN09obUtKR1libHhYN3ZFYUp2bUFpK3FvV3RJY0Zrbk9X?=
 =?utf-8?B?dDBWeE5xVFdlZ25tMSthbVUya0lTenJZZm5YUSswUmw3R2FNVkt4d2pHQUQ5?=
 =?utf-8?B?UkFhbk41R21BUFlEQ09Jbk4xWU4zV21OTStUbWlGZUx6ZWpvMDdzdFQ2Mk1p?=
 =?utf-8?B?aUlXM1BvS3J0MEtYNmJ4d2VjUnR6aCs2ZkhYUGxCOWZMbXdMNjVLZkNBUmNm?=
 =?utf-8?B?bWtkbWFRY3RkT0YrV3FCSkdtbTN0U2Yxa3pDNXRDS1htekd5eERKMFk2Q29i?=
 =?utf-8?B?OXhjc282RzNLTjFhZm5DMzBlTVQ4Tzk5SUhURW1qUkJ4N2FqMWRhSnQ4ZU94?=
 =?utf-8?B?M1FnU0lQelRXSFFvTTF0eTBleVgxbFZldVlXb1k4NFRzamFabVhiTStKeXlz?=
 =?utf-8?B?WFBvditHUDVJQjFRVlYzZ1RwZFNMRUY5SGVXdzBBVThUSmErd2hKeFFmQU5I?=
 =?utf-8?B?ODg3UVlqOWRGVW9HcjI5dXVja0JUQ2hDcTdRWGNiK1B5WjlEVWhqUUkrdEhj?=
 =?utf-8?B?Z0t6dW9hTWZ6TzVtODRKMy9BTW44NFVzbHdudXRYVWZqL0tFaWw3MzQ0c2RE?=
 =?utf-8?B?TE1RSjFyNWphVm4yQkVjeVlYdHhjWndTTFgrakNueStnK1Evak8wRDJ3SHQ2?=
 =?utf-8?B?TEZJckNLNHBmL1IvSzZnTTF1dWZscG9sU0xaME9ha202QXNzRTZ4YllYbENv?=
 =?utf-8?B?bytzL0FHS0RaRnN5OENUUWUvVlJhdzNoZHg2U1FqNHkzcEtUMEhqdGQ4V205?=
 =?utf-8?B?Y2lMREhpdWlDL0JDaEJqUWM3Q1hmWG5OVGdJWnl3YWtPaDdYWEY2K2RMK1RO?=
 =?utf-8?B?TWVHNkZ2TVVyZUp6UnJobER1NmRDMHo0K3Y0eDVkUDlDK21BSUUwQlFyUmFu?=
 =?utf-8?B?N0dmOE5nWTh5Rk9FYmFKbm5ZZGpGKzhVRlNvV1VRY0I2TU40Y3ZnT2UzZkpB?=
 =?utf-8?B?WjhacjhDZ0hsL3IxdWFTUHBwbE9OTGxrMTBiOXVPUXRWRUxvaG5zemRpVHFO?=
 =?utf-8?B?cnhsQlJZRkNTSVJLL0Y5TU0yUGJEblFPeDc2UGM1NGREa3NkRTRueGNnU043?=
 =?utf-8?B?MFhjWXZ4ZzNjVG9IdllXVGRmR21Od3RwdngrYjVBR2VyVFhuRk9hRXpSQU1t?=
 =?utf-8?B?a2FXVXp2YlVmSUhoRTRaSVJGR0srd29XNDNzTnJrZTJXdVBhbnc5MzdaMzYy?=
 =?utf-8?B?eXNtNHB0TXdWMk9Ta04wR3h2bUsxb1cvaHRaQStaWTdBV01BWWgxUVdjdlVE?=
 =?utf-8?B?UURNOFc1VWpXc0hTTHlycXVhV3pMMFVlUC82RExYT2krVnlXdFNKOWg5a0Nn?=
 =?utf-8?B?ejkyd3plTTBFVWk3RmJWWGJBMFh5d1BvTmRHNm1GZUJQS1JUbEo5WWg4RmdT?=
 =?utf-8?B?RFlFZjMrZERSM082RWZydVRTcVR3UzJtajA4a3FsWHFTMkovSERnWm55Z2Er?=
 =?utf-8?B?MzlzbWFaMktlVmJ2cnl1QytuZExxMkVXNkloYnVSZWZ0SS92a20vK09TSkUy?=
 =?utf-8?B?M2t3Rkl6YjhIOUhPNHNYaWNFVGxVeUozNkJzTElIOUpoVWFYUTN3U2NJVHZD?=
 =?utf-8?B?Nll0MkRMbXpndG9xby9oZ0xtS2YrUGh5RmtqUXdydlQrUW1Ed211aUpONWIx?=
 =?utf-8?B?VEpzVzdBZXNOWVovMUswcHdKMW9NVThxdnk0SWlSb1JEZDRaZDV3MFZETndM?=
 =?utf-8?B?L2p3K1E4ajJGNERMcTdYdUJQcml2alFiVkhPVm9Gdnk1aENoc0pQUEEvakYy?=
 =?utf-8?B?YmcrbCtZbk9EaVIrK3BWaFdGSmllV3pDSzlLS0FtZ3JvMGlUU0F6SjZPSkNr?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f898b19-f2d2-49d7-6ea2-08de11524c35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:03:50.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhxzS9yKaPtU6F+IOrGGGAS5njt8BThBfmM/rOLjhfWJwTAqfegRQzkGx3warhpi5I5xQh9ujUtLz+oDUtd+CLvbBj6PQixvbaLpa1112Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6008

On 22/10/2025 5:39 am, Stefano Stabellini wrote:
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 3f0f3a0f3a..c2689a3f1c 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -144,8 +144,7 @@ config XEN_IBT
>  
>  config SHADOW_PAGING
>  	bool "Shadow Paging"
> -	default !PV_SHIM_EXCLUSIVE
> -	depends on PV || HVM
> +	depends on (PV || HVM) && !PV_SHIM_EXCLUSIVE
>  	help

Committing this would need an XSA to revert it.

As stated in the help text, shadow paging is needed for the PV-L1TF
security mitigation.  This includes PVShim.

The default is wrong too.  I ran out of energy trying to get it fixed.

~Andrew

