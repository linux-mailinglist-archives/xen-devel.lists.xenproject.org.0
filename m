Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB2606136
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426753.675405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVLv-00005n-N6; Thu, 20 Oct 2022 13:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426753.675405; Thu, 20 Oct 2022 13:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVLv-0008Ux-K0; Thu, 20 Oct 2022 13:12:51 +0000
Received: by outflank-mailman (input) for mailman id 426753;
 Thu, 20 Oct 2022 13:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPXW=2V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1olVLu-0008Um-5n
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:12:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5031acb-5078-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 15:12:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8490.eurprd04.prod.outlook.com (2603:10a6:102:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 13:12:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 13:12:46 +0000
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
X-Inumbo-ID: e5031acb-5078-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HB0GF2tEcsirTk7wrbmm9ynoLUfe6wq/fPP6KtLa6JRiDdeBLX/0UgiV2hQVdsFIb8waq59STT5v06nzgd7Rv7WFJYb/XTWXMFM+PFEZ7bvNavdHp4bpEqGJ9Xs+VbR817x7+u3o+2PFqX99pvSydqG+/1GZD3ubRa7kq0X8blxSi9FelTbbx6vDTmMemS7yAUkpkGL6VkdQN9zjVIKnd1zGc2MmTkZqGfRPloPw4Dgkkg3WIcOFTeAbbHuSdcloPoBYIVIbWEHPE4QALhmS+0TIR0JBr0AwQfdgz4grE/TkwAWfVIQ+AsqUI2jK00L6csm36h8XDCH6/zyrKsUaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FAcjDvisNRFrMpLqdDa6n58UN2VORG/iWxnUfHrfKM=;
 b=S38o8BlNaCtESBOb2Jni1wHqPpE0iHeB9rkVbSP0QUizRx055ieIvxOibkK36MCsZqQ20yYEStencDWla57zZwuRmpMkXvz5nyuaefZFNorLil87aFVXxUF9b/FB7IL25Its8OzNw6wFiAC0pCBxFHF4eePsnzHg6089mVSbgdRZCwsXJbpi/rgSqWBcH2tqxF+utOL6k5tLQeYxCxlmfpE5TLA6gZ9bxZrsd10gba4+eUA4IU1R06Fu1VjCOb2o786TDWN2P61yongiry4zKigtzYwYTbzya/3tJl0EJaj2WNPqCzhdN9dx3ndqiXrdRVicUUsKgSP6rZvFdfdsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FAcjDvisNRFrMpLqdDa6n58UN2VORG/iWxnUfHrfKM=;
 b=kxn10ZH2Bajq5gAKSFljVVnSgtpLzj1xOHuYxpFL/hYcgjKPzGsnZob3N4/Uz0aaWKYmf0xjkANTTqckn7PMy/bOt6q4UWflPcTgW25DvTsn+L+JILDMJOFndF3rVzbU2a6hDluPoUIQom1abXOiFRngPIwfGStL0x3MiYPukA2r2n8CDchvX+BP+4tP5IKGgXse0B3fNIVCQmkb8QoPpdjOPAjn1fSAb9BvrpGEsT+PH0Z8cwZ76YgTzLF/kOcIw3yT6RcTnrmk01rn8II7wpTrVLKqrhdAcqipLSZbXVTpxTc1ABybgZDNfzTK15iJ2R+CsZE3CRuC7QTaB5Idzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adc567a7-c338-477d-bf8d-b73300c36f6a@suse.com>
Date: Thu, 20 Oct 2022 15:12:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Policy: A release acks for the release manager's patches (was Re:
 [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init())
Content-Language: en-US
To: George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>
 <20221018142346.52272-3-Henry.Wang@arm.com>
 <CAFLBxZZ59zkuNJM1vQSv_Syv8i0Q_dAFk0p-JXY4oFs0cCUSnQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFLBxZZ59zkuNJM1vQSv_Syv8i0Q_dAFk0p-JXY4oFs0cCUSnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0052.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd63cfd-0460-4e53-c32e-08dab29cc77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hLgDgEmfkDCWh8/jHRV1KEgmUw6v70eim48weuhnyQVAAGPU5FcY+G+duiPP2g6LiUi29b76zGs0h8jCBofDbYKzG4zrIFTfkbZFLrSmfVRvWVMSf1okFA5VgCK1MFlFex1cQDTf8tcsQpLkmylKX+hNFZc5KLE3O8/2OjHtUMJ6ICe3cWV2QBqsRCaYF/lxKoOWw6tID0rJQeNXhCLqNY4Nij2XMADVf8XCYWq2GuNM5Hky7Gmw1DQKgwz9OZ3wlheb25ILU+rj5Ovmnz2qFtuxJ9t6gUo+NWr9FIthST/PFwjySkuMgNaVG77O0IwLWbXxgQiYAOpIj2iq+3RIPV+qrpx9+n1N+hr3NnQsI6u2M/Q76UCE1X3Xs2pTTk18AmohBkSs1uVLxOqc1pAkd5Yu8yrE7dVtRtlHh8b9+yx5UQYUTzP6ZqRSQcoBQjxpa69LNaOv4PGXAPb2/V/Qp6NRpTCSyUAe8aWTSwBlAUTbCrN4cTyVF3PM3E+ZkmN55tymXi5bi8kSCwRp44A0blDEMPqnwk9IwWyJ6vBswDMFAERkt5v85aa0iAEPl1vVYUrbHr5i3GvkWk4PW0oKAXBrAOPyNfAhxkLqF2+TbMOGrtcGP+RIZYYnH+R3bSQPiR85Gwx2oGAvvk4FpBNu0Jo1BWcd8Yn9wBQqj3/8S5eran+lFE0FC6ngwhQr44Iz9OO6Y3IP4YBX8X2xZvKqOrt5zh0yxva19nI1coiT2LklNXoNukRUm0RzrmIy/8+SrDlZuxvDCzXwJ0/LFUn6cdukpwbrVtqoZPu4JzuNnfc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(31686004)(36756003)(6506007)(2906002)(5660300002)(86362001)(31696002)(8936002)(4326008)(53546011)(41300700001)(26005)(478600001)(6512007)(2616005)(186003)(66946007)(8676002)(83380400001)(66476007)(66556008)(38100700002)(54906003)(316002)(6916009)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3kwdGl6bWJGWFQvNVNjdjFTTVRWWVBuejlXU2IzTnh6aEVSaEVJb2tmakFY?=
 =?utf-8?B?ZkdxUjRpNmhCZGpKTXFYdmlBQnhxT2xkZVp3MEs1ZDF6dWk3WllSNUxKY3JM?=
 =?utf-8?B?eW9xeHAzUGxuTEw1SWFLVHVvVDUwMW9sSG5xNFhaZVFqbEhEZ3RUa292WDN4?=
 =?utf-8?B?SUZ6dzljWUJ6SEY2d2N2T05UaFBhU0wwY3h0ekIrbENNMTl4SG5USHhrSCto?=
 =?utf-8?B?cEJXTnRnSkZxcTg4UERFM1VlRjhjdkRwV211U2MvK3RtREIzQUF0a09WSVA4?=
 =?utf-8?B?cmlQajdGbHpiSDlkRWg0UktVbG1Qa2s5WjRrdHpubXdLeWFuOWIwVDFGSnRW?=
 =?utf-8?B?T1I5SkJBa2JzSjZ4M2ZKb05OdzZCMkg4aVUvT3NrdnlIcXRmMzdGT25TM1ZI?=
 =?utf-8?B?R2VaSlFXeDQxby9yQUo5ci9BN2l0NFpvK29hVmxsWjMxV3Y0cGNRcWJaSTBL?=
 =?utf-8?B?Szg2RHV5eUZNakJ5a0g4SGIyYWFMaFhzaFkwL0FVaTdIWE16NlZsNU9SZXJL?=
 =?utf-8?B?Wmo0eS8weTY2SGxZelVqUDRvdDM0NFRpWFV2YjZGNDk1aFZuRjBFYXdrMWFB?=
 =?utf-8?B?UmhZZVMySVN3cENVVUJyd2hlNXpzWW5SZ1RmV25sV1ZhaHUydEFvcTNIejdZ?=
 =?utf-8?B?eitzcWZTeHBBNm9OWUZSaTNjaC9ucis1eVdtanFCOW5CcEJsbFhUS3ZUZzY0?=
 =?utf-8?B?T2RNNVFreVhsV29jeXZzczJGUndzRkRQVzJJbDhuTWZYSWJnNlozUi9wbWt5?=
 =?utf-8?B?S2pYUkFIUTlXRy9aYjVNYUhIbWpZeG1rbEpyMjQ1eDNxRkVqTmlmam5qOXRq?=
 =?utf-8?B?TUxFZE93emRNekEzZUJsSWQ2eXpoY3h2QUpPckV6a2lFTHZJYTBaSUFKNFdh?=
 =?utf-8?B?Y2hqQzNhdzlBYk1vTnF3NnhYQjR0bXM3WkdkTThrK2l0MkFKMU5OOTdTbkFL?=
 =?utf-8?B?L3R1NUxUbnE3MU8rUEkvbytIKzBXaGtoelFMZHNjdU1EL3RGMFNvRFVPSnpU?=
 =?utf-8?B?ZG50VnAvVzVYNkVkNDVpb3FEOU5WZmRGdXBVRlhjWk1rNEFoLzgvZFIvVUQ0?=
 =?utf-8?B?Vy9mUGhtNlV1b2Z1TGc1YS9Eb2duVndpNVJrWW8yOFFERlhIdlZuYzhpaFRJ?=
 =?utf-8?B?MW9GZXRPK1F1YTNDVzNtUVBwRFcwems3RS9mNUpFU2RTVUozSVZ1M1RGQ0xI?=
 =?utf-8?B?RVRDU3gvcXNFcnBwTzhhTDFKZFpCOHYyM3RDL2thUC9odlB6VkZwRnZNaFdi?=
 =?utf-8?B?ZEg5eGl1YXJqSXVpVUVHQmNrbmZGYlVCSzBuRU9qMHQ2N0pXVFhIM1Q5MXpW?=
 =?utf-8?B?RjJHaHRlQlFtYi96anNHZWNObXVXSGlZQzhHWWZCWDdValBiaC8wRUJiK3oz?=
 =?utf-8?B?TnZ1bVFJMjRZdElxY3VGdmErZ1hsRkNsSW5OV2Q2SythZ09LMTUyS3JQS3o1?=
 =?utf-8?B?L0xLQ2U1ZnJKMTdVSldPMTJadmduMDRHOU5HRHc5Vy9WMy9ONmdCYjljUWNE?=
 =?utf-8?B?MHVhSWtxTStNZklXYVpib042UU13dW41Q3BNTENHeFpueXA5dlN2aHE3Ullu?=
 =?utf-8?B?aFNBQmo0NWkzTXd5VEZSamFhaVN2b00zZk5hVjN2VzM1MTdrbERwNkF1Q1dz?=
 =?utf-8?B?SEhLQjM2dGZ0NDBuSXNzMHhPZGtNQW5mdTRQT0JVVXB1QXVXOFM0UlAwMmNt?=
 =?utf-8?B?MGprcU0yQldDUzE4dDlzVEI2eXB5YnZ5NjlHTEtxV1pzR2Y4bmdlSmVBRXhn?=
 =?utf-8?B?Rzg5VldoaUFhbmRneTBuczF0NDRZRzFVQzdOYWxEWm9lcFl4WUkwYUVEc2Vv?=
 =?utf-8?B?cVlVSUF1WHZ5amJXT3lnekZtVGtVSzZQUndQY012Zk8xNXVqN3pnSW0xMkNR?=
 =?utf-8?B?UXJTOTZiaXFxTFlKVi9MMkRzdkFCYzZmbUFWQVhVRWc3d1pwY1VCOU81Qm5D?=
 =?utf-8?B?aWZkcWNSS0E3b3ROSVduS2hjeUhoNTR0MDR3cTRSUjFja25IM283UmUrZXV6?=
 =?utf-8?B?c2ZNQTBCTllZc3JlcG11d0RKdHhNeWZrQitMSW9hRDFza0NONk8xdmFaV0tF?=
 =?utf-8?B?L1ZaTHd1RU5tdlZhTWcyVHc2K25OeWZuTU9oYUZ6Vm1XZzNObStoVkdOQjJE?=
 =?utf-8?Q?4QAfZOUSMohVh6YZsw25hLkpv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd63cfd-0460-4e53-c32e-08dab29cc77b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 13:12:45.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YpG8zN3HDsjZ0rsl0p0D6QxmrsF6rLClyKBhEHd2ziVOJ9F+MgL4dbBcwXmy0l3AqCBwQwsGPcp8bNHCB5VeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8490

On 19.10.2022 17:28, George Dunlap wrote:
> On Tue, Oct 18, 2022 at 3:24 PM Henry Wang <Henry.Wang@arm.com> wrote:
> 
>> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
>> when the domain is created. Considering the worst case of page tables
>> which requires 6 P2M pages as the two pages will be consecutive but not
>> necessarily in the same L3 page table and keep a buffer, populate 16
>> pages as the default value to the P2M pages pool in p2m_init() at the
>> domain creation stage to satisfy the GICv2 requirement. For GICv3, the
>> above-mentioned P2M mapping is not necessary, but since the allocated
>> 16 pages here would not be lost, hence populate these pages
>> unconditionally.
>>
>> With the default 16 P2M pages populated, there would be a case that
>> failures would happen in the domain creation with P2M pages already in
>> use. To properly free the P2M for this case, firstly support the
>> optionally preemption of p2m_teardown(), then call p2m_teardown() and
>> p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().
>> As non-preemptive p2m_teardown() should only return 0, use a
>> BUG_ON to confirm that.
>>
>> Since p2m_final_teardown() is called either after
>> domain_relinquish_resources() where relinquish_p2m_mapping() has been
>> called, or from failure path of domain_create()/arch_domain_create()
>> where mappings that require p2m_put_l3_page() should never be created,
>> relinquish_p2m_mapping() is not added in p2m_final_teardown(), add
>> in-code comments to refer this.
>>
>> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M
>> pool")
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>
> 
> 
> Henry brought this patch to my attention because it needs a release ack,
> but it doesn't seem proper for Henry to be the one to release-ack his own
> patches. :-)
> 
> I propose that a suitable rule would be:
> 
> "If the release manager themselves have submitted a patch which needs a
> release ack, then the patch needs a release ack from one of the Committers
> who is not involved in the patch."

Like Andrew I think a self-release-ack, as was common practice in the past,
is quite fine. These are entirely different hats that the person would be
wearing.

Jan

