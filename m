Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F3706B85
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535947.834023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIQs-0001pZ-5E; Wed, 17 May 2023 14:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535947.834023; Wed, 17 May 2023 14:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIQs-0001nW-29; Wed, 17 May 2023 14:47:14 +0000
Received: by outflank-mailman (input) for mailman id 535947;
 Wed, 17 May 2023 14:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIQq-0001nJ-BM
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:47:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d06ae2-f4c1-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 16:47:10 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 14:47:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:47:07 +0000
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
X-Inumbo-ID: b2d06ae2-f4c1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEaoRrcKCdnOP7dvoaiBG6oK3cMrJTMb16XW2aK9U/OMn0vYl+87ufUrkcX8r2gd893JZBSiwt0fehE8nbYS29AD+ZJiMhvHfmqVJRi7MQ4Uz1eu8VyVvmJ1/ogwqaPiBPhySmXPdLO18IPKVECAejoeVb9Gp4HqjTwgJBCfl9FKuIf3lVSh+BH6H7/MNeHW1wl6FMMHhx3+dwDs3qa+AXUejRsp+MjYvWzrYaqvpysqihFiX7lFTAFCppFhpGtnO3htUAbc1jVzI1OTLDH9pCvfTs8DvgJoIcm1nrGF/HbZNvVuaGv0PIfO82i8KTAKl+l0HmQbZUuqQ3iRe770iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Diqu4DfQoU/0R08zs8A2/lkKlcPSB6xmZp8ddCjo/AA=;
 b=I1Qy/Vv2s5kbgJSXSHRAwNsfnQ/q8GacmdmMgwSO3oglo0cPbELvTJAWvmlJ1znqLyNbaOA7pRinyGVCTIUcxywlQsVaf4ytTeQzGfxvmP2eQisbjMaQC852ZpemFF//ioID0dQu8p+oM25iRITZYhBFZfzBbkl4JoSJCK8Ui8UUs4DcGcH9oYDaeoT4d2PPURAKKwAZZHcU07FygiJuPlYj36joL9dqQ23daNTaVwOkAhM7GuLMSxEQ001pjipykCU9gi7DeQUoVLHZTYHE2aXml/1WBXfq6cDI2NoFoPg6UZf33VbouXRsHqkVLgeCYjTfnCzG6tGS3nqal3EGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Diqu4DfQoU/0R08zs8A2/lkKlcPSB6xmZp8ddCjo/AA=;
 b=fnoeEGzMrCNGG8kPVVxkoxnOEzjt7pK/44Yu2dm8L8k3+nESQQmzy0JacpZuxxnl3n8lcj3GuvM/mvk0aDa1uqO9F3xEzbYY8Tg1k5wy55hOlQC7PTqmM48h4qlszisUaP4cShlTPf2RFuTkDninij7uftQnJ+87LfLxYPq8EUylIBYya7ZbnZj7dl1gnBPdNECoZKI4SsChFdKST4g/wOaGUr0mrrm/Jmx9LakfyturaMcXkH6qxVoPAFw1iM+8ahE4EMn0xhXYTIGlM3uzTb+rCcLQ5UmCOO5nO9UdaMtpCJq3lxx0EzMRLF0dt0HGspqYEvEyMX0UAR/0gV/vsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
Date: Wed, 17 May 2023 16:47:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230516145334.1271347-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: eac4f8a5-f15b-43c2-719e-08db56e5961e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FpkPIwothdesJJearRTgJ6oTH15wMIHC3w3016rxiCEi9FxBUEwsMeid+YX33BjZRrumSC684ke1Z1a/ONE2tqn+vS73DW/cbKerndmsjbpZatP8e9tv8HDs6d9ku2d4R3ak3JWacfTVqc7gX9qa7bCYFyhYsEv7BwmmWlLgfqKeKp+P2YRSauudXMS/I4dXZqsXvZ5uNhS4cQy6aubWym/Ll/sl1XoyJ9tcxO6uHrIrvFuPQ1ujyKivx7HEbSk+PMHfullxvGuuCsAc8Z+gUSn2b5CPKjbBmKnlfV5PM1yjZZCPggZ0dyJJ2agj+j7yGV65UEfqIC0Oo1eflCP2Uaw6q9W9QiubU0wTgA4R80Wxtm3hHqtYuNQRdEsczmYR7Egc9ZsSKCgYqrmhj7uzVUSGh1vFyI/UTkFuGqjIj5r1inJj8JjekiTxydpL/hilq2K2kqfFb0x/ggbUL/ctR6nG3abwv38Lz+1fndeqEW+GayXy/0+ibOWhIkRO1SlEwBSNWzgLkaQBFdodBlmpho2TnjVdSoBVE3Tq32Tkdhety3BJJsIJCw27odgZ13MVAFGrRqnZgVDoqF4pbNfq/FdvHUXG5FbWOgYz9khgyzjXM9DGq+5bnstI8tFzBNQ1HeFDJ7dAZQHFCrd+TbFCP7vnsJCtJspgqvR15a85t0DIEl2sUxgt6eTAS1Co4P6TWNmfr2q6AhqGOOe7moRrag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(4326008)(478600001)(31686004)(316002)(8936002)(4744005)(2906002)(6916009)(41300700001)(66476007)(66556008)(66946007)(54906003)(8676002)(5660300002)(6486002)(53546011)(6512007)(26005)(6506007)(186003)(36756003)(2616005)(31696002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVZBT2pOVk5tNU1qRzRTalJBR2NseGJSNnRQWkIyOVVtMWJiYUhiUFJOZHR4?=
 =?utf-8?B?NlJyQTZNK0JOOHhvUUpXakllU0gydkx5dE1yRDRRTENWODVYZG9ib3BuWHN5?=
 =?utf-8?B?bDFNNGZKY1IveDdTeTBiU3gyV0MxMm5MaENaeGJvSlRiYXI3d1phclJYcUJi?=
 =?utf-8?B?MC82b3FHbHF1c2FQZERDVG5oRCtlU2d1alpYVlVWTHVZaG14eml4UEVyYldW?=
 =?utf-8?B?U05kQjJhVjJvRytMOGUwM0RqMmVNakRoRU9EYjZ2bzZLMlpSSmY1Qk5QVm9Q?=
 =?utf-8?B?cVJUY0FaT0VZSk82cVRHNy8yVlNkODgzZ3k5NjBSYm9taXlzWUwyd0duSmVy?=
 =?utf-8?B?ajVvZEdSRWJJK04yMjAvalpWK2xmVWNKdSsxVXRiNE13Y2tNSlNTbTV0YitP?=
 =?utf-8?B?OGJ3UDF0cGRZWlZoaXJiNC9rMzJZTG53Q2hnOHJuSWc2aUU3VXZ4YzZnN3Nv?=
 =?utf-8?B?YkQ5SDM3WEdPaGtkaG9ySVJmb2JpRnluNU5icmlVdlJiMU54YUJIVnlaT2RX?=
 =?utf-8?B?d0pRTHRPSk5UVkgzL2JMOTVmT2pEbytUdkMvd1F4dG9UOUpCWnhWdjFYenhC?=
 =?utf-8?B?YkFPWkFUelZrcHVHRW82M1Y4MEEyVlB1WUV4RnlqSHJ3WHB4SlJKMjg2VDBU?=
 =?utf-8?B?djIvTTFjMi9aSXlUSGpNaUFDNkwrTEp0U0duMEg2ZFU5VG9GRlBEM3lmVW8w?=
 =?utf-8?B?WnpaVm5hU3pzZEkxN1NuL3hyMm96RVVHa2d4SnFTWXdJWkcyMi9uR0RHZ1kv?=
 =?utf-8?B?VkdVUkxoZjUyanBHMllKc1NQbEs0dS9Kb3A3TDliWVRoWGV1MUdWSHF1cWZs?=
 =?utf-8?B?anJCVWNTVmI3Zzg4d1J6OWFKRFJHeTJXaGtDSUFPMFFDdVhKSS9BUmZudHN6?=
 =?utf-8?B?TUYyVDQ0QzFqcDZ5SlIvdlM5bURPTFhsRFZzK1drVU9xbUl5amNTNjVWMXNs?=
 =?utf-8?B?RVZhSHlmMS8xSkZLbGppZ0FldVc1SkxiejJ4U044MGY4Tmd0a3FyUE9YWnB5?=
 =?utf-8?B?Vm8vcE85L3lZa2lkUjB0ODZIdFQrZEpzU0djblIxT1B0SXRxODVXT2wrZUV4?=
 =?utf-8?B?THlKbkc1TXhUdWVobmhEZzNQejdPMGw5SFpwWVp4QkdYNy9VVVRMQ2FVNURh?=
 =?utf-8?B?Z3FWc2M3eUhMN2l4OGdVaTRIMDQrejFkU3JlN0lYUTQ5TGNZdyt4cWpmL1lY?=
 =?utf-8?B?cExKWlltZmRMVkRyaEFoanl2NThGMU5sSzVZWXFRS2hsUXFNVFgyZ2lhOE5R?=
 =?utf-8?B?eXQ1clJZOXgzeHNaMWlsNUtXSUdETFRTVzFSajhJcmJ3WHorZkpWQW5ESG95?=
 =?utf-8?B?NlZIaXowd3YxWUloZmhLUjVXeUFhaThUSjlwR2VOYVJsczRsRlFINUl1Uldl?=
 =?utf-8?B?UmdiYzJSNW9PYzU4YVJRc0hoQzVhZGxyZEw0Q0tJY1Z0QjNSQm9Ud1daS2lq?=
 =?utf-8?B?c2VhZUNWSjI2dWNQT0E5NEIydkhBZjRyT3VMY3hyUnlaV20zYWluZzh1U1gz?=
 =?utf-8?B?clluSFlob2RRdlVVZUpoRUpVTTNlU3F5ZE1tOXJoRnR4WU1FaElMWVFWd1lo?=
 =?utf-8?B?dzdiUXY0YmNweVJ3N0JwOEk0RlhJTkF2aXJ6MGl0K0g4VGpndGdUbEttVml3?=
 =?utf-8?B?MWRacDAreTNkN2pHRmppeHFWaFNTYUxSMDlGbnZ1VW9Tbmh2ekU5Y0ZOcEZ6?=
 =?utf-8?B?Z2g5QitxZ1Nsbmp4SSswLzhpQzF6ejhtTW55Y0c2VytCR2RScmFiQnRwdUhQ?=
 =?utf-8?B?VHFhT01VdTF6a3VTd2lhb0dmVzBpMHRMWUxIWWRlaktydlBVNGdGVlRXcVF6?=
 =?utf-8?B?UCtRNzJwQnNJVVNRRjhXelJFRE4vTFM3RU56aXBDNzl4Q1pFa1JsZ2RDbmpJ?=
 =?utf-8?B?L2NSMDc5TDF1UWlERWZncitLN1U5ZVAwVzMwUlVncjgxWWxuUUNCVTFySmZl?=
 =?utf-8?B?eTdGQXYrdld1VXNkeVhmZVlJRkpTZU1EcllCRHJPMHd2czRRV3dqbnlTc1ZY?=
 =?utf-8?B?eDEzY2xWSkZNMmdpOXhrT21pWWFHNjc4VnlDOEpVQ3FyTGZieko4cjdmYXZ0?=
 =?utf-8?B?T1hneUlOWElPelpacU4wemQ5WlFrNjNwM3lLTEtlelhzWjhZajNTL3Y4Sk5Q?=
 =?utf-8?Q?aadyl3kyQMaXpOMRDsdchP5iD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac4f8a5-f15b-43c2-719e-08db56e5961e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:47:07.0471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDrWGMEIoOc7d8J9+wfIZWtB9gKlOYvWZt8fK/5y0doOD8ce6LZJ20+eziYiECRo3+g2Sd7BtSFNEVAXyhojBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7908

On 16.05.2023 16:53, Andrew Cooper wrote:
> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
> +    if ( cpu_has_arch_caps )
> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);

Why do you read the MSR again? I would have expected this to come out
of raw_cpu_policy now (and incrementally the CPUID pieces as well,
later on).

Apart from this, with all the uses further down gone, perhaps there's
not even a need for the raw value, if you used the bitfields in the
printk(). Which in turn raises the question whether the #define-s in
msr-index.h are of much use then anymore.

Jan

