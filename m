Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42F75AFCE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 15:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566599.885620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMTgu-0001D4-5L; Thu, 20 Jul 2023 13:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566599.885620; Thu, 20 Jul 2023 13:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMTgu-00019y-1z; Thu, 20 Jul 2023 13:27:36 +0000
Received: by outflank-mailman (input) for mailman id 566599;
 Thu, 20 Jul 2023 13:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMTgt-00019s-58
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 13:27:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f1d2a61-2701-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 15:27:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8270.eurprd04.prod.outlook.com (2603:10a6:102:1c7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 13:27:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 13:27:31 +0000
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
X-Inumbo-ID: 2f1d2a61-2701-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZkf/fnhjWYnNWuFkP3tGGq+ku8hKnfXT7cgy8QBa8j00B2dm0ToRgyYV4Agffd0wS05esY+A83DFp5xODHWO6NQUpkCNEugg7IJhmLETqAAPyZswqPXw9umVDgREdpShYWRh8h76gUlyQ3mkZZ0zkFCpEfC2fPlicTnCqaT4/0VJU0HM1X6PePfSseldjYfMxUzMHxrAIWUTJqgtHcLaHUaMpMTXsZcjxgxldAndrCly6Ni6++ejPMULuQzAE12J+YY9RckMj9ORScfeSJcfNHQZsAjhXVNwiO6b8JCOl+3Ok/enNwKxFYoSibebpvQE02ns/I0/+y7UePXp1zHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rggqXSpnfKDvnqpml8bOxYDB9mTW1feRAlb4rApz+Rw=;
 b=Fq20PDSHFK6aGMrV2s130agncjKNHaApIxRw4vtYRxi5j85neLbt450eFWj5cQ+5qJ2+49rV9ZPDVL3mvTbQhhsHkOlZ2Oxk18FKKcQqYpS7tLmXiEOJcX3czE1BEzcaa7cUUeilCnbq6k6/YRET9Zjr7FBLC1c99RhpZS9Z197Fr8kyHAoYGeERFotsXg8ojevESKopXRQkVL/ZHUEGEUCANHDb9AiiShKLe/IfD3HRcdwKwSk0p4eBnnvLkHpu7Bs5nnO61QliXwox6p2qcqQ7LRSazuxRt0V9YkWDlQWJ2vLDbauK7zCbsBnH3jVIC+5g8YTVB1xaQg/G/S0CcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rggqXSpnfKDvnqpml8bOxYDB9mTW1feRAlb4rApz+Rw=;
 b=VvuGpABRv7qQajAUC7FCB1wplbbwgdEsgAebIKbb7CJgEtCa8kqcgnct1rp9jXlxQcPX5y7DDmRiw+sFFhYTNnh7Gcn18slaj0XXJNT1GoGSqpTGzsZ1d0zNwvCzU21fO+LX8m96Ryrhdp6W1uRSaRCJhw9Ub/vzoSgu43ihJnxv9bsjrMpyJb3ZFtr/92tacdPETnRdlxdHGO95Xq7MkqyP6SWU6T3WO3UFe1x6O97DOOwKbQ5Y8meGF3ykYmagTNlCnumKoid1xMkaE9HAyANLiT1vYSCctXZ/1fZFQjKArZH2UZElvCTqrZoFRdrXXUn30qXE4PiFZ/J3i1xcCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08ec7e54-1abf-5e1e-e1ee-7026a69e0279@suse.com>
Date: Thu, 20 Jul 2023 15:27:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cef171-d53d-4c45-5ee9-08db89251233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ngl0o1YqifsTBEWiY+miMw6RFsxgkT364J6cImF4G+WwKWcPUGxchWA6bTROw+y7SoTOdYS8l9F7ToMLhSOYKSqhLUAIFAmWkqWQ30wqwK7t0qY4R2B8rt1ICXlL+9fONYFLsVo7HdjoZWhsONgSjukG5SWzyYkcSH9M5Cbsta35HjE8tOWk9M27hSqnbc/wotFyqLHgQfZcO9YtwQEPEA+TG8N3WPsgRM4qPqVn/tywROZ4Hco0mM5oWhgdFMYbC4c+CXWYxYmolgttVxO838YX5aD8t7J2iqNZ2Z7UqaBK+/WkOsUlYPiwv7R6rmWThVKawE9oO6bSeHw45iTazrWfIVbBcxK75OTkD8i5sjVyFW3mZI62yLQ4EqJvhVaEqZ25ARwJhZr12CFITbGMwcfJcQiU98lmB/2v/JVDqTc0zO5xCs344vAE19VYYTPkjPKGHtiwSkVm4OIOcIXtFt6KsGF1VR+vgEZWTofM5svD8Hox3lNmuoDXDQ+ZbEYYsqwnmD7Shuognz/ZQ8p7osSpQGS3iZpAcQrHFY8KSOQFgtlt86m+NQiQD3BbVW3IH5p5R+dlayFWdt3MOD16fBJue2qXE++TkBQEs0Onu4h296+h4HTUWMO0LUv55DY0OZvCi9RFYCdFXziSWirIlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(86362001)(478600001)(83380400001)(186003)(38100700002)(41300700001)(26005)(31696002)(31686004)(54906003)(8676002)(6916009)(53546011)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(66476007)(6486002)(6506007)(2616005)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVVqZGpPbDlKeDlzNHlIZkVGSC83NTVWZmI0VDc5VGZvWWVZM2NyUlRjVkV1?=
 =?utf-8?B?bXRZSDA5QkdOaEpXUG0rR2pWVlFrYjhDdEtNQU4vZHBHK2poVFBueGRTWEFp?=
 =?utf-8?B?ckJiSTBRTWswZmxGeHVkaTR5TFZIZkw5UWlkVFlobkF3OTBBbUpDd2hvb25X?=
 =?utf-8?B?WkZrSmgyb3dhemZOdmVNYWpiZlJvZ2lLM0dDRm8ydXQ3NDU0dEtPQXF0blJJ?=
 =?utf-8?B?dklMaXFrdmtlc0xPT3RTb2o3QklOOVhTeXN5SGh0NE4wR01YbnFEWTRQdWpn?=
 =?utf-8?B?YUgyOUVPZlBBTlJyS3YyTFh5bi9jZzgyeVNhZmdyQzJzalF3L2RxRnI3bVg1?=
 =?utf-8?B?OEtLTVRDT1E2QmdLODlIdlY3WGoyTXA1amZrOUk2OFlvWFpaNzVVV0NqYW1w?=
 =?utf-8?B?Qi9MaUx3RGdGREZEUGFTOWlpNHF0UUtseXlIZDFMNzJXSk9LajlmQkMzK09a?=
 =?utf-8?B?dnJ3ak5QMXVWYndlVk5rcmpickM5SjlXbmM0WVZ1bkt4MkwrbzJBOTd0NXNW?=
 =?utf-8?B?cTBHNXBNM2RsbnhQdUNvYi8vZlZMZk5HS2pHcDcwd1krMHllVk9hOXdtdHVZ?=
 =?utf-8?B?eFZrWm8vNEE5ZEhzUjNDd09tZ2lwVEkvdWJmdUtRb1VXZWtYN0RsNHBGOWp1?=
 =?utf-8?B?RWorNmM3OHkvNkdTV2xEWUlYME9JbTVKWHZjUXkxbjVmamNld3Nqd1RTWlRT?=
 =?utf-8?B?emVTVjRGdURrbWlZOW9tSzlWRXZOT0t4M28xZ2xGQnJ1T1hRcnVCclVIdGZI?=
 =?utf-8?B?UmEzUVY5YzBzaWdBRHArcFhaa0E4clc5QUFRNkt2VkhtanAzS0JhZHpYY013?=
 =?utf-8?B?MWVyZHh4dkhmamFaTzJsUmFNMUtBaG9Idnl1YjBHWSt2c1F6RVJYbDZzT21n?=
 =?utf-8?B?S3EwVzh6Tk9UNzFmek9oYWtZdXVWVERmUGM3c2RUTFB2MWVpb3R6QVRaajNW?=
 =?utf-8?B?dHhhNGV4aVZDQWFvSHJENVRNSDhMK2QvQS85NXFQbm44MFg5cGI3djc5Yyt0?=
 =?utf-8?B?aVJQNGVTNTdrQzEyekpIVUFRN0l0NmRrWCtmaTV4RWVtMVVtcjc4YW5wZ2Fn?=
 =?utf-8?B?ZEgvSlBrZEpkV1dWeVc2OFdvQmxlSWVuV0hQR3ZzaGtuekt1b2R2dEdnK3FH?=
 =?utf-8?B?TU9TWGpCa0QwNXRsZzRHWUk3TzVXelhYT0JQdDQwckVaMXhkdUlJL2lPV1Ew?=
 =?utf-8?B?WURZYy9ERUwvY0JZTmNocVYva0lZMUdUL1RLSUZuNFAyWFlydVRrMzVMWWIz?=
 =?utf-8?B?ditqSnJ3YXpzTGlINHNwL3pMbHhTNE5TK3RaaVovTFU0eUVOVFdOS1duRkF0?=
 =?utf-8?B?MDZRTmxuQlBYR1o5eEE2STlacjRJTjBLcXlWa21QaXRQcnFPN25GTkxNczVJ?=
 =?utf-8?B?OVNBSTdZbHF0ejJWTi9NbWhRUTdBRllJeTVYbkwwbXZUdEZ0dlFUWVdlRjdt?=
 =?utf-8?B?V2NnTlQ4RWlJd3lGT1NHTDc5L2lxS0JYbWJqQUtFTDVCbmlsNTkzUkVEQ2py?=
 =?utf-8?B?S2lldFQ1MllnK0hyOHBTT3c0YjNveUt6dkl5d2tlMnl6MGpJUEFxVmJ1djAw?=
 =?utf-8?B?YlFqYUQyTlM0TkYyaFFPc3MxbmlYY2l2M2VhcVE5N1V5dU1rK3R3S0w4dVZF?=
 =?utf-8?B?L245REZvVVFMQm5iWVBTYldJcGY4NStRT3IwbnBvdFRmRlcrc0hVN3NCYjBG?=
 =?utf-8?B?QVFHZysveDNNSmNVQmFualUwZW9kbkY2NUpvWjBMS0szanVCUy9pUWZUbjJo?=
 =?utf-8?B?Vi9sM0lwbm1YUTRRdVc2WmticmFXZ0ZWeFR0M2IrZnlnRDluZFdMaFJrSUp6?=
 =?utf-8?B?SnpsR1JtLzdNMURTVC8zSnNwQzFGNk5iMWQveGMzdEFacU10OU5rcUZzRVdU?=
 =?utf-8?B?d3JQZDEzRmtLOHpiTnVVeUJwUWx1TTBycW5NV0hpZStaeFA2M1hhcGk3ZjFP?=
 =?utf-8?B?MnkzczBGNlc2ZzFZd3A2YlRRdGVlRzVraGh0K2wzMDVKOHVhK0RvK2s2T0Vu?=
 =?utf-8?B?VncyN0h3QmEySWlpTyt0RmloMElUZXhMT2paV0dhZlhPNWRmMTI3T1NvUk43?=
 =?utf-8?B?M1dOdndPdStpWGlwUTV4WHh2Unp5QjdkcisyWDVQdFI0WHZjZG5IYTRXVmZx?=
 =?utf-8?Q?5qM3IosSWvJUpQU2FkdAFtu5k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cef171-d53d-4c45-5ee9-08db89251233
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 13:27:31.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +w2R+DSnPID7U419b09pEbLG5DhItP3593aJmBNAa0xvxmzCEIc9TbQPAbHuKChXHfg/l4sRUiFFMxfZyo9K8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8270

On 20.07.2023 13:20, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
>> @@ -447,8 +476,16 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>  
>>      /*
>>       * Find the PCI dev matching the address, which for hwdom also requires
>> -     * consulting DomXEN.  Passthrough everything that's not trapped.
>> +     * consulting DomXEN. Passthrough everything that's not trapped.
>> +     * If this is hwdom, we need to hold locks for both domain in case if
>> +     * modify_bars is called()
> 
> Typo: the () wants to be at the end of modify_bars().
> 
>>       */
>> +    read_lock(&d->pci_lock);
>> +
>> +    /* dom_xen->pci_lock always should be taken second to prevent deadlock */
>> +    if ( is_hardware_domain(d) )
>> +        read_lock(&dom_xen->pci_lock);
> 
> For modify_bars() we also want the locks to be in write mode (at least
> the hw one), so that the position of the BARs can't be changed while
> modify_bars() is iterating over them.

Isn't changing of the BARs happening under the vpci lock? Or else I guess
I haven't understood the description correctly: My reading so far was
that it is only the presence (allocation status / pointer validity) that
is protected by this new lock.

Jan

