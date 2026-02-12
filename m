Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPXiCdgUjmmZ/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 18:58:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997E1301AE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 18:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229710.1535554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqaxO-00089t-Df; Thu, 12 Feb 2026 17:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229710.1535554; Thu, 12 Feb 2026 17:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqaxO-00087M-B0; Thu, 12 Feb 2026 17:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1229710;
 Thu, 12 Feb 2026 17:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4gJ=AQ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqaxN-00087G-Nt
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 17:58:25 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69f272ca-083c-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 18:58:20 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH7PR03MB7002.namprd03.prod.outlook.com (2603:10b6:510:12d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 17:58:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 17:58:16 +0000
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
X-Inumbo-ID: 69f272ca-083c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0LW2MjlVG0vJCttgm9hThXnWno6zv1N0AuJU9cti+n8Ai61EDiMP8OykuBT+qS+7BeW5bwfGc33bjCip4fMuFZoyE9pLtXqQTVh2zhonRFxINYTVOP4yT5AdJdQaS/aRmDm+b/LipwlkOnYdC5GMFvPQYpVRQYTgwDnrAKnlZL0Hp5TkjD0Klk5mXNPBhTph7VjRpXb1vaHb/CHeuPQ9HcPFaHROvfET5oE71IthkzIXCUZj5Pc+LtDZLyVTlZYkxLLx5hUA7tYpWvlUN+LGEZXKcD5LvQegfFsET8gwFoaTlyB/+wuOP2mihiO+k5fhluYnPLFG0SItjbYA0fqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvBd3QlpmlG1B8gHvEVeTSxvG7fazAu1yCJxhWhLSoM=;
 b=gtkTRsbXyLQ8j2f5o9QxvBcsufrzjJnrTlQpzbCAHywz5pNoWUXg7/+48aWxrR0Ex2n8jGcXV2Ja/JIPcvw4hXocbIYgUmSmRCZsYRI2+oLG0yau1hC6dv7NlTrrUMcCoT3U2WltftOeSSzNLZyjnxFpcIFjayrJQcJH+xczm0kLWQkPtRa4iq39hkg3+SCmMQFcRPml1xVr5cQb5s0ck1vE03Mn9/zp6l9i0TS6Cr4SVs9X6o0nVRhUVfLx2T7gYrN0VDi92PZWsvqgaeKg2b2MdlA6cc07VgQyxjgLMvkE1JgLzRnTm7Qr8i/JHZBVvuhJpAvkuQLwLF8zpMUAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvBd3QlpmlG1B8gHvEVeTSxvG7fazAu1yCJxhWhLSoM=;
 b=HTg8aPTo3pefQ7WBzJzW+QiheFQFO5nFPrC1ShJNaUIAPvCOacPUQz4AITfayhOW9ED7qAniTPtQwXBjh3wPlIHgdVD2PKXc6fMDedHmiVTfHKahhadY6Qokq1j68jYcakloNAEDos1zygRX4mu4doF2fme7za/M9C7L7F7+ly0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <61a3f852-915c-4d9f-8dde-01d000aa4fe7@citrix.com>
Date: Thu, 12 Feb 2026 17:58:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/5] darwin: expand cross-builds to also support x86
 and testing
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH7PR03MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e24695-4e8f-40c4-8ce9-08de6a604c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjBncGxCRWprU3RwUkpYT2FrdnhzV2pEaWErdXI3S3d3Tng5TGZxSmZmaXFZ?=
 =?utf-8?B?Y01Rc3BvYk1WUnVtdUZEY1RSVkNQYjd1VlNkemdSVkhTVDhxZ3p0N2tYeGRS?=
 =?utf-8?B?d0doVHIxQ1kxU2w2VVNzRXU4akMyc1dqMTNlRkFmMjRlWjdtS0YxeVdrbUpn?=
 =?utf-8?B?RjZaUzRJd2orNFVHUE9WUVc5V0UyemVFUXR3ZlptOEQ1UFFmbUVobGNFUjFZ?=
 =?utf-8?B?MXhZMnlYNjRPVjlrSEM1QlpLSitXaTZWVFJrYTMzTmRxZWFhY2ZyK01wTXVP?=
 =?utf-8?B?L0tvSXFmT3k2MkdESlY4RmFaTWtZTmx2c09EUTVqckZWcGRja3BZb3ROSE9I?=
 =?utf-8?B?UjVIMG16ZGpMM1BrZC85K01LQmQ0VmNJVnFwb1RjanhWSUVyeGhDWkY1ZUpY?=
 =?utf-8?B?ZFU5UEpQRHIxTSswM0s2SVdaQXEweGFacEpaa2FVb3lDaEJlM1hnV3JneU45?=
 =?utf-8?B?MmxtUHhUSXNScll6NFlBVkZ6d1lldWl6eEdtZWx3ckdBbmloNVpWVHl1blJj?=
 =?utf-8?B?OUpBb3lHV2pzelgwTnhPRFQ4dkRIc0hVbFUzMVZzcmFNV21rd2dkaU14VjJB?=
 =?utf-8?B?TmI5eWx3bGRVWUhPNzNFYm42YmhtT0RCYXdHTjNWaE9Pa3c5bm5NU01UaktT?=
 =?utf-8?B?cVFNbmJlU210dFA0M3lEbDV5NzNuMkJlWTIraEc3NXZrUUh4VkRpTFBqcWUr?=
 =?utf-8?B?SWRoQVRqOWtSalBMR0lkL1RiWnJDSFJxTTJjKytaclZhVW84WW5sd1Y4MzRZ?=
 =?utf-8?B?eXFKYmZta1JCTk9WV1ArSXFRZVRHWE51NHBFYW9QUlYvZC9mK2QxV0p2VkNC?=
 =?utf-8?B?Q2I2VU95L045YkR0Q2ZFcXZmTHF5bGpMczV2SWI0SGZ5cEZvNk5USnJFNG9Q?=
 =?utf-8?B?dzJUU0Q1UUVjTnZPL3lkQmVOV0ZjMEdpT3k2bCt3R3c1cHVjdENBNHJuWlBy?=
 =?utf-8?B?aTJoY09yQWdJU244bUo3VnZOOThKTDdXQis5RmQ0djFabUN6Y1Y3cllmVjFB?=
 =?utf-8?B?dGR2d2NLaHhYenhzUllWampHZUo3L0doN3VhV3ZHSklhSklEMktBLzRRczA5?=
 =?utf-8?B?aWV1MjlER3o4djFUdXBoOWF1NmZjekplbTF5aTFrZVU3SEFFK2JBNUVWanRR?=
 =?utf-8?B?Rno1dVBOSUJtWkhtNjY4a0FYdlJZUW1ORC9SS0o1aGJNUHVMN1ZQdlY0Qk9E?=
 =?utf-8?B?VDFtZzNjVG8ySTF2STZtejdaZGI1MzJGM3I5cDNrYnBIVnlnM3FaNGpBamNH?=
 =?utf-8?B?dzVoRnZBVDQvRjNQRkNFZyt4bFJzY2hoWGw2ZFVXM1lxamZISmY4c1lMWkUx?=
 =?utf-8?B?N21DRkwxVUMwRDVVa1dxQzE5SFRHVFJ3WnQ4d2ovR1dmb05SUEgxQjRmZzJU?=
 =?utf-8?B?ditZZTBiS1VHREVpcHJyR3NEZTNqeFRlWFg4bmhaZTA2WUg4TUhOd2NtNk11?=
 =?utf-8?B?SVVTMWVoNHFrU2R2U1gxbC9FajFpV0hWNktJelJBV2w0bzI2QUtaRjlUSUc3?=
 =?utf-8?B?L3M2MlMzanZMQTIyUVFFU1ZqZFFDQ0Jxamw4Q3MwcmJHMUN0ZXhrTVU3dlBs?=
 =?utf-8?B?ZFlscjhJOTIvUXpmRllGSlhQRU01WXdlQzZGcUlFRXVpeWF3NGthYS83bU9S?=
 =?utf-8?B?VnhCdUtldVlLYTNrUXg0M3lqbkNvY3VyUmZSWUIwM1FOL2w5TnhDZ3RlZ0lj?=
 =?utf-8?B?bERHTXZrUXBaeXJhRWh6SnRkZHlFKzBSaFovQVFPRFJvOTQyQ3RQN1V0b1M4?=
 =?utf-8?B?a2pML3RHcnh0emVxWW1RUWpvWEFMQlNjSGc4amRhYVVmVFNLMWNGT3I3Y213?=
 =?utf-8?B?NlJCcElUL0R3ZFRwMld0dTVRbkxUNzRSeVFibUJuckt3bHZCY3dTVmRnL0lN?=
 =?utf-8?B?VllzNVJZK0xrLzZTQjN4RUlzdHhEVm9Qa2NCdUNjQ2t1aytHRlY1Q3E0V2lN?=
 =?utf-8?B?QktTQjRWcTBPVlR5TEpLRytNVE9sTTZXZ0s0VnVKRm43ZlpOa3A1SGxYbUFH?=
 =?utf-8?B?MUt3bStLOGlnVlUrWGc0L0VKd1p4aTNvR3BiSjAzUElPcVRYZ0tKZ29Dbzli?=
 =?utf-8?Q?hT4K1J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVhSVmI4aHhoMENuUDBqaktva052MEx6ZWt2WUdMMlF3dElZZzVZd0lRRGJM?=
 =?utf-8?B?eWlpVjdXTXU2QXZ6VWxGOWZBSyt4MVRWVDM1bVNrRk9iU2VEQXdEbWlXaGc4?=
 =?utf-8?B?aFJlYmNRMitmS0xuMDA1VENhTW9GQUNSMWlxRHkrdWNKdnJRVmpMZVdBc2Nk?=
 =?utf-8?B?ZER6TzQwRDhseVRNNytTNlpHTStINFVEcitOSGllTXZBQUdjRTdUTFRsdmlo?=
 =?utf-8?B?V3NPTGU5cFR2NzZTV3FZRU5YNDZ1M1N5bXdyVEVDZ0NSaGE1RE05c1JLTHBk?=
 =?utf-8?B?MFVKRDVBRjduSittNFVFbVozTW00UHRIbmVHcm9Wd3dscWZSUnVTUEs4Ukdn?=
 =?utf-8?B?NFFNUmdEcjlGTHVKd2RQKzR0YVNESUo2amxpWjFKUEViREdRcTg5b3FSRk5S?=
 =?utf-8?B?cnlYOFlwOCs5YitLbjVOWlhOUEpWOXZkaFo0K3g1MjU2RUdyNDhxY2RkWGhq?=
 =?utf-8?B?UUVFaGRWQ0NRb2lPeEs2VzNIN1RySFpLK3ZoelpWQU13QkxGRGJ5WDdySmRC?=
 =?utf-8?B?MVI5TGdONFVUbElIT2VMSzA3dFBLbGkvTW01Yi9LcmF0REZrOFhyZ01NWWJ0?=
 =?utf-8?B?MFQyZnY3VHlUdWtHSmJ1bTlEa0lSbmpRelRZcUpDUHNFdFpxMkRQZWxNbUNl?=
 =?utf-8?B?UEx3ZjNhS0FicUxvenVIb01nN1NzY244NmZjNnZpYUl0M1dObnpBaVpOd3dt?=
 =?utf-8?B?d0I2VFlQN21lRjN2R005d0ZiVGtFU1A2Q1ZMNkQrKzBFM1dza0ZkNFdFUUtY?=
 =?utf-8?B?ZWM1SUdiRE9ZNlhCYlpEQVVKdVhra1dGYWZUVSt3QVo0Y1BoYVdLU0ozNEd4?=
 =?utf-8?B?U2h6RlRQZE1EMyt5QlZzNHdDb1gwc0F4UHoxYzdIWnBFSzNibVBQc2ROK2po?=
 =?utf-8?B?MjZuWmNYY3p1NlNVNFRyOEdqRDFWTVNJYTBrZG5IMThYbGtlaDZncnpKZ3hY?=
 =?utf-8?B?WkZvaFgwbkxDcVdpdVo2U0l5UCtwaUk4ejhhem1XTFJrSUMyZWhiZEJDdFA0?=
 =?utf-8?B?b0F1dXhDd09qcFFRRUtYVWY0TmxLSmRiTkpoSmVkK2NhQ3RxT2NPOGVicW4r?=
 =?utf-8?B?N2NlUEtvVEQ3aDgxSmJrQWJuOEhnMjlLWUk1RDAvOEVNOHJqdmg3SWhsV01o?=
 =?utf-8?B?ZE14TXNvckFRM3phbE9TUG9JWmV6ak5id0tQbCt4andlRll4dnpMVjlnZU5Z?=
 =?utf-8?B?Vkl3VU4yaXhraGZvVWFvN3pDWVZkcVl2a3lDZlhCcmRrQ0JSbmdhbkJKbjRX?=
 =?utf-8?B?U1I0QTcvclg2WkpZWnFqY2xsdGhaZXE5SmJPVGNSSTlYRStpeGZ5L0txc3Fh?=
 =?utf-8?B?bFpPR0lGVjIrQzJDeE5JYk1INEI3S1JqSjc2QnZwc1FLZERvb2RLY29oTXRy?=
 =?utf-8?B?YjQ3Y3pFbm85dUJMRnZZRm9oU2tIb1d6eXlBSTlHbkNwaGRSaDFlS0tkVk1s?=
 =?utf-8?B?cHl5MW80V25xY2RKU2Vnc3ljTzI1MnR0K2wrcGV6UzIvNGJjOXErZ3lZTlhj?=
 =?utf-8?B?ejNkL2xtbVZibURRQnlLNnM2YWRFcTY4eVIrNmdXSWhpKzF3VXA4Y2h0aVNP?=
 =?utf-8?B?c2tNOFYrWElhSG1JZDdaMzM5cmkwOUNuMjJQcm9Ra2VVaDdabVhZU3ZCcFN0?=
 =?utf-8?B?SHRjS3RsR2VYT0psMzd6YjU0WXF6akFvWTZHS2paTXV4dGtmMTB6UlM3VDhI?=
 =?utf-8?B?TmtiWUczZU04R0U2RFZTdmZLc3hIR3RVcmxhUURieWhlQjFqOW56REpEaklh?=
 =?utf-8?B?NUY5VjkvbC9IMTNKMVJlUzZxZ1R3YlZuSUY4UG1xN3lCL3JZOVNIZkVycWQ0?=
 =?utf-8?B?VVhnalBlZzZ3dEQwb2d5NkE1UENXZ0FpeUtuaVRnQWtXTmlITkhWZEVLczZG?=
 =?utf-8?B?STBxMkJiSFZXRHZxRUZDd2FSYld5NEhNcnZicjI1bXYwSlZDL3lieUZBVHls?=
 =?utf-8?B?S3FzRmxSM0RQb2hYbFFCb2FhZVRtajg4RTdRa2Z2VUc1cEhHS0Z4a1NmNEs2?=
 =?utf-8?B?ZndVOWhjTU5tYThINXVXTWU5WmtOcEtNa09PcEFMcjk0OVRHK2RvVUhuSDds?=
 =?utf-8?B?WWxYNlZMQk1RN3QrNFNQMHg5VEFHVGZCNlZjRnJTQTVINTM1NHlvcE0yelBY?=
 =?utf-8?B?Z2FqUG42cDE0ckZxZVMxajYvMXQycWR3Tm9RL3Jhb0EraXhCV0JtNm1ad0FZ?=
 =?utf-8?B?ZFE5ZVpRUENacUtwbW12cWJQL1pGbkNvbHdwdXJOVGlNdWFwOWJPVjdWY3Fi?=
 =?utf-8?B?ZHl2TUFmbWtacnlmS2VxbEpQYkhHOERvNGtSdmxhZXNqOW9wYk4wRjRsWFZs?=
 =?utf-8?B?OVY5ejlzRi9DUUxEeDZOMEM0U2drU1p5MHJ3L1g3Rnd3UTQ4OU5yUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e24695-4e8f-40c4-8ce9-08de6a604c83
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:58:16.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3sAztED5wt+fJ8yRGL8LtltXM1mcwmrT4em2XYQPCQgiCQeoZGVAMQhZEgrOHbblbsrfnroZVJDqfTlqNYlvnl24c93vGgXNC5UMV9eQyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7002
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[check-endbr.sh:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8997E1301AE
X-Rspamd-Action: no action

On 12/02/2026 2:46 pm, Roger Pau Monne wrote:
> Hello,
>
> This series expands the recently introduced Darwin hypervisor build
> support to also allow cross-building an x86 hypervisor, that's done in
> patches 1 to 3.  Patches 4 and 5 introduce some Cirrus-CI testing to do
> cross-builds from macOS, plus it also introduces some basic smoke
> testing of the x86 builds using the XTF selftest, just like it's
> currently done for the FreeBSD builds.
>
> A result of the updated Cirrus-CI pipeline can be seen at:
>
> https://cirrus-ci.com/build/6723050642604032
>
> Thanks, Roger.
>
> Roger Pau Monne (5):
>   xen/x86: always consider '/' as a division in assembly
>   xen/tools: remove usages of `stat -c` in check-endbr.sh
>   xen/tools: fix grep reporting 'illegal byte sequence' in
>     check-endbr.sh
>   cirrus-ci: add x86 and arm64 macOS hypervisor builds
>   cirrus-ci: add x86 XTF self-tests for macOS build

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

The CI tests passing makes this a fairly obvious one to take.

But, some further observations from
https://cirrus-ci.com/task/4903778798796800

[10:09:34.952]   INIT_O  arch/x86/acpi/boot.init.o
[10:09:34.971]   LD      arch/x86/acpi/built_in.o
[10:09:34.975] x86_64-elf-ld: warning: arch/x86/acpi/boot.init.o: missing .note.GNU-stack section implies executable stack
[10:09:34.975] x86_64-elf-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
...
[10:09:35.720]   LD      arch/x86/boot/built_in.o
[10:09:35.724]   CC      common/hypfs.o
[10:09:35.727] x86_64-elf-ld: warning: arch/x86/boot/reloc-trampoline.o: missing .note.GNU-stack section implies executable stack
[10:09:35.727] x86_64-elf-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
...
[10:09:40.836]   LD      arch/x86/hvm/svm/built_in.o
[10:09:40.840] x86_64-elf-ld: warning: arch/x86/hvm/svm/vmcb.o: missing .note.GNU-stack section implies executable stack
[10:09:40.840] x86_64-elf-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker


and various other examples too.  The warning comes when linking
built_in.o's, and while I could believe there's something weird about
*.init.o and/or reloc-trampoline.o, the complaint about vmcb.o is weird
because that's just a plain C file.

The other impacted (non built_in.o) objects look to be:

arch/x86/hvm/vmx/vvmx.o
arch/x86/pv/dom0_build.init.o
arch/x86/x86_64/cpufreq.o
common/unzstd.init.o

and it's not obvious what these have in common to be the (only) objects
lacking .note.GNU-stack.


Also, during the final link steps for xen.efi, we twice get:

[10:09:57.995] Warning: relocation to r/o section .text:00000048
[10:09:57.995] Warning: relocation to r/o section .text:00000090

which smells like the multiboot header.

~Andrew

