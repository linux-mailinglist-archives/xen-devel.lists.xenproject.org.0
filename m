Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64013FB3D1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 12:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174973.318884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKeUQ-0004wi-WB; Mon, 30 Aug 2021 10:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174973.318884; Mon, 30 Aug 2021 10:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKeUQ-0004ts-Ru; Mon, 30 Aug 2021 10:26:06 +0000
Received: by outflank-mailman (input) for mailman id 174973;
 Mon, 30 Aug 2021 10:26:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKeUO-0004tm-TM
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 10:26:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac72345d-097c-11ec-ac7a-12813bfff9fa;
 Mon, 30 Aug 2021 10:26:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-hxr2Y-b6NIOmwF4on6NuFA-1; Mon, 30 Aug 2021 12:26:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 10:26:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 10:25:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 10:25:59 +0000
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
X-Inumbo-ID: ac72345d-097c-11ec-ac7a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630319162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLrku/NvfMX4Qjs3PYhnrd6aOUTfYSAryYiss7ZonqM=;
	b=ch5CuELblv+n/ri7mCuFtKHL47KDk8jHntXAcY/VsIGpuxmgpFMZqWMpmOJjt/vjpAHtFS
	NbCf6ygT6LyARkv8HdqE4tLiLH2/KXGydw2NzPWSGgFUzb83Kfkn4MubM194D608Sb4jtr
	B+SSZJJko8dxtoONnUiqXRCOLD59ySM=
X-MC-Unique: hxr2Y-b6NIOmwF4on6NuFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/M13oZXGR8Mta1x4L08jmQ3U1tHfwKyX467psPo3eySQVxS5iHhXSaPOS7+Vy79tTRq+1kgzv4NT1X6DNYXMq3lK3TnoT3Wobn3glVxSKVugRz8PER2BLdp6cr5nc5Bj+D5NL+W8MiXlSMsCgf9IDGATMk469WNT1Utk4DsiAojzmQj3xmBN7QJ/3YuHguVDW2lraCLEEfKQ2Bj/t4/Y67OrtwQTnNgJ0KocOrA9HqvCmhYAcrX/Zb4gd5Wkd9r4u6pBEpFrJ475FIq4RbCyXJtv/esoBHYbGv0cpMTapOc1mvHDTEFDTzlc6wJ0Wa1uLdI0S+jsibKabaQfwSBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLrku/NvfMX4Qjs3PYhnrd6aOUTfYSAryYiss7ZonqM=;
 b=WYTc8gAQwtpSNV3Y3cEj32L4XGggoxL1bhyOGS0uEWVeStBMfrt9V+2kogovcgR43e9w1YznJcwoj1TLQcDUIV8ATVeXTQiMsWChPyrnJgic8EQT3tu/7mDC4YrQXZaJS442NhDjdNP5szfaDzLLz+ULMOigR13tdbw+nI4BQ+jyu5Nu0Yuwy1ffj9qHw0FwvBsD8/9ItYPnRplM3NloWrb7Ud9QrAPyGwgfabOFspt/5BjtdiVXzROnP5tGeK0DFbIv2EQ0sH4Oqqe9LHL5KmgDbyjdfQrlQd0/KAWfZ/DiE7XPRkw/HDkZh1aQylutPCl5n7qup9VVsh1P2QuUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: XSA-378 fixes breaking PVH Dom0 (was: [xen-4.15-testing test]
 164495: regressions - FAIL)
From: Jan Beulich <jbeulich@suse.com>
To: xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-164495-mainreport@xen.org>
 <6bf7f023-a00f-4853-fbe8-83d9d2aff370@suse.com>
 <953dd8e9-1c44-3881-6b62-306cc31cdb2f@suse.com>
Message-ID: <e330a346-66f5-6d22-b95c-3bb3bca4754f@suse.com>
Date: Mon, 30 Aug 2021 12:25:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <953dd8e9-1c44-3881-6b62-306cc31cdb2f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2310b10-e3bf-49f9-0934-08d96ba08f83
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59029832500738499F4DE711B3CB9@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jdkh+TO7vTn35xj7wVib2HCd636YIwRLRBP6gADb89TBCWLdXOdpvpTBWZttf2r7BenPR7NilJ8aQ2TZDsjys38NAYhEvbFun5SOETSj4dDqlGXu+E89K8dBcXSnoyJD+7uDUdkJ+KzBAq9bM/4wU3GwWxFNRkbNpT597uZEweUQOkJF7RZX9Q020a5/JWb1LnKJaA22LF1EHY9bJQklAcpyt8qenPPW+9zeRmI+TBK9woNsU0L+SnPfdaATXg68eZYRlqCt3UCfLldwOZbyFt7Ys0blWVnkkA7pyrE4EXX4Exu7wSVsjkUk/kzYZIZtsIIpRmfUfCozpFxLkrYlpYKexzTScaXsT6fEaYl0P+ad/VOSlB8twe7n2rqxnwEt1vZdPJdO6P/cs8DMKd5dUUBpo3mtXK5Tk0VvLGFm/BcKk9rOfKDtzWeVMa6n8gftQxNBxFsO8wdzNwP+2pmSkZrvs4sUIk1Eco1hTV5CbjfP6YCl5U7s6Jw0SLlOGgSAghpSeU9aGq5K22emwhySf8rXhM/9sz1dwQIqDWGbNDZvCZKrJo+gnGvVWTJSqJdfbmsnro+1AH2NxO1nsvCOTJG4z/8UNzKGm0uGNk/E6ShyOGGxcDrT4Ry2sDj1RybPkCdd5i2nJpR+nHPSi4KyWJfjC3YZG4Csu9JLm3OLT89AxC69AHZ3GxkGGLdqfOYP78/XfB0F/xc5jNYVp4EJk6S5S7iobfE3/Q+R47DeFpSs9wM3sykqCt1sCb/FtrwTFrVr+NnXtmItZsZVs/kmefYyEnBzLEfwzP6MbYk5tSDi2k4HQV3rBcVF/ERReD6K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(346002)(136003)(366004)(478600001)(31696002)(16576012)(66556008)(66476007)(38100700002)(31686004)(316002)(83380400001)(2616005)(8936002)(956004)(66946007)(966005)(6916009)(86362001)(186003)(2906002)(5660300002)(8676002)(26005)(4326008)(36756003)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkwwTnQrWlh4OTJyaFJydDIvWHpjVERlS2ZSRnVQK2l1S3psTWJGYkx0bEdy?=
 =?utf-8?B?SWFOZEdXa2FOOG1uaXpTbzR6OWpodUNVQndjZXNIbm53Mkp2ZkxiOEQxYTUw?=
 =?utf-8?B?dTZqK3JkTlhadmZUL1liOCt6K3FWeTliQXpWM0FpbmZDTzRscFU5MmNVbjBU?=
 =?utf-8?B?YzRjcUV1WmI4ajFZdlJicXNaV3k4RDZiaU15K0RMaTRoOGRNYW9MSHJXUmJs?=
 =?utf-8?B?TWk2ZjcxaWdlcGduWnpHVGJwY2llck9ERDJTUkFqeWpPR3lZN3ozRURFVlVJ?=
 =?utf-8?B?ekpjYURRVWR4dEphNW1Ma3dYc1NrbVhUZ3k5b2NidHlNK2JSSnpmNjBZRFFN?=
 =?utf-8?B?K2VMM1FKUHB3djFqbWtGVHpMZkVYcWExeWdETVVqYTlJWnFpaERWeFdiTDJ6?=
 =?utf-8?B?cUxra2FRdzF0S3QyT29DQmR2bS9NUVowK0d2TlgyUlhSSFE2ZElQeUI1Unpn?=
 =?utf-8?B?bFFQYzNzazlCdElYSnNWWW5EMk05bzExM0phcnBjVGdWZXFKTkw1dUJEdDAy?=
 =?utf-8?B?RVE4K1hFdHVHR0xScUxlVlJmSmo5THFsSTAyUCtCbUtSc09aQWdxNlRSMTdX?=
 =?utf-8?B?MUkrMkw3N0Zhc0dVQTNMdUZheWVsYTB4UmwvK29tWDdXM3hMQkt1dXJuM3o3?=
 =?utf-8?B?SW1XZkdLZjJaMXMwcmd3KzJIRXh6bzBnL0tFS3JyTWFqSVZxbDljakxFY0Zw?=
 =?utf-8?B?bGNJUWZlUkdieDB4dVFtRTVLK1U3SHIzRWhOcmhDdVpoeXpoV0pvVWJ2SUNJ?=
 =?utf-8?B?eXlka2dGVFV3Y1ZFS1RnQnd6UkYwR25ZZW9pT0F3dGhzOWk5dTlyZFBCWWdI?=
 =?utf-8?B?bFRRSE93MVFLRThtdDNwS0lKY3NoZUxQeXBvZEQzV3ZQbkZmL3VBNlpnNmxn?=
 =?utf-8?B?dFRIbFBML1QvWTRLazVPL2ZVUG1pMStQUG5EcFdUczFOby8rS1N3Sit4cVlH?=
 =?utf-8?B?Wm53MEtBeU0vckFQMTYxelF4ZnlMdGt4TytIK05rOGxqdlc5Q3MrMHlmc1BD?=
 =?utf-8?B?RTVLZ2Z2RDhwNkZKMzZMdmNJR0FFRVIxbjZIcTNmN0N5UEpZOW1TQmpTU3RE?=
 =?utf-8?B?NkF4MmpjanhjUDRZRHhwbFVWNVVBNEFqYVMxMk5lN1dRTGdBNVVXeW5YckJi?=
 =?utf-8?B?RWR3eWF4Y3NGRU1rcU54elJwSit0SUpXUDlWKzkwVUpSNURPT2xBUDZ6T1dt?=
 =?utf-8?B?UzFNdmpONlY0RFJ2N084YTllMjh6LzVhSHhsK0FLZDl4TFFIdW5GT3JQbjVr?=
 =?utf-8?B?Zzc0N2xtNTcvNTVZcVZNWDJHQVJ1R29IUHNqTEE4UVQ4UHZKakF3Qk5tM0xu?=
 =?utf-8?B?KytjNjRXa1RudDlVSDI1aW43R05NMVlvWTg2ZjR4cTJmSm05a0dOdUgxclY2?=
 =?utf-8?B?Tzdla2sxaXY0M3pSUWwyUDk1YWJocUx4Z0syZXZUWFNBTWE4b1gvTUNRakZl?=
 =?utf-8?B?cndGUXFFcDNTZ0I2bGhkMkVzdGJqdjRJQWRoT3NhSFp1cHFmQi9pNTdJRWZz?=
 =?utf-8?B?Wndwb2J4NmoxOGFNQ2w2QzlZRTJLNkt4eWIxQjdQemJlU3ZJQ2ROQnBBb1Nx?=
 =?utf-8?B?aUNScUg2RWppSXVkZGhvK1RXWHROYzRPYlk3blFxN1kxajRqamZOVFM0aTEv?=
 =?utf-8?B?aExoR0s4c3ZiRUJDRmppSkdWajgzZmRWcGJZUkVrWk43dG9xeUlEUUE4bEky?=
 =?utf-8?B?cGUxL0NWWGpPNk9KNFl6UTVGeVF0TDJjRnFiYk5JV3EwRWs2RUlhb2VsZlJB?=
 =?utf-8?Q?1Ghh1PFsAJ8S04VIn64XWsiO9HvviH3Ko9D4jMC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2310b10-e3bf-49f9-0934-08d96ba08f83
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 10:25:59.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik1oira2/Jvl8tQbaD0SAwqmZfQUCcGZGpRviBM63uayevdqppzVYSmqp70GnQIj3e0bhXraLBb078X4SIyxug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 27.08.2021 16:46, Jan Beulich wrote:
> On 27.08.2021 15:29, Jan Beulich wrote:
>> On 27.08.2021 08:52, osstest service owner wrote:
>>> flight 164495 xen-4.15-testing real [real]
>>> flight 164509 xen-4.15-testing real-retest [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/164495/
>>> http://logs.test-lab.xenproject.org/osstest/logs/164509/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>  test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 163759
>>>  test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 163759
>>
>> This is fallout from XSA-378. During Dom0 setup we first call
>> iommu_hwdom_init(), which maps reserved regions (p2m_access_rw).
>> Later map_mmio_regions() gets used to identity-map the low first
>> Mb. This, using set_mmio_p2m_entry(), establishes default-access
>> mappings (p2m_access_rwx).
>>
>> Hence even if relaxing the logic in set_typed_p2m_entry() to
>>
>>     if ( p2m_is_special(ot) )
>>     {
>>         gfn_unlock(p2m, gfn, order);
>>         if ( mfn_eq(mfn, omfn) && gfn_p2mt == ot && access == a )
>>             return 0;
>>         domain_crash(d);
>>         return -EPERM;
>>     }
>>
>> we're still in trouble (because the two access types don't match)
>> when there is any reserved region below 1Mb.
>>
>> One approach would be to avoid blindly mapping the low first Mb,
>> and to instead honor mappings which are already there. Or the
>> opposite - avoid mapping anything from arch_iommu_hwdom_init()
>> which is below 1Mb. (Other mappings down the call tree from
>> pvh_setup_acpi() imo would then also need adjusting, to avoid
>> redundant mapping attempts of space below 1Mb. At least RSDP is
>> known to possibly live there on various systems.)
>>
>> Another approach could be to stop passing ->default_access from
>> set_mmio_p2m_entry() to set_typed_p2m_entry(). (And I think the
>> same should go for set_foreign_p2m_entry()). At the very least
>> right now it makes no sense at all to make RWX mappings there,
>> except when mapping PCI device ROMs. But of course reducing
>> permissions always comes with a (however large or small) risk of
>> regressions.
>>
>> While I think the latter aspect wants improving in any event,
>> right now I'm leaning towards the "opposite" variant of the
>> former. I'll draft a patch along these lines at least to see if
>> it helps, or if there is yet more fallout.
> 
> There is more fallout - with the initial issue addressed as
> described I'm now hitting another similar domain_crash() in
> guest_physmap_add_entry(). There's no question there whether to
> check that old and new mappings match - they are different. Here
> PVH Dom0 setup really does what the final XSA-378 patch is
> intended to disallow: It produces MMIO mappings to then replace
> some (or really most) by RAM ones. This means I'll have to
> further adjust how pvh_populate_p2m() works.

And with this taken care of I'm hitting the original assertion
again, now in the course of mapping ACPI memory. This time the
collision is between RMRRs getting identity mapped first, and on
this box an RMRR region being enclosed by an ACPI NVS region of
the E820 map (and hence the _almost_ same mapping getting
requested a 2nd time). As a first step I'll further relax the
adjustment to set_typed_p2m_entry() still in context above. But
I'd be really thankful for thoughts by anyone else on how to
deal with all of this mess.

Jan


