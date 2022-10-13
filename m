Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9BE5FDDF2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 18:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422312.668254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj0iS-0000TA-6w; Thu, 13 Oct 2022 16:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422312.668254; Thu, 13 Oct 2022 16:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj0iS-0000Qa-3v; Thu, 13 Oct 2022 16:05:48 +0000
Received: by outflank-mailman (input) for mailman id 422312;
 Thu, 13 Oct 2022 16:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzGh=2O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oj0iQ-0000QU-BO
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 16:05:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e361776a-4b10-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 18:05:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 16:05:40 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836%6]) with mapi id 15.20.5709.019; Thu, 13 Oct 2022
 16:05:40 +0000
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
X-Inumbo-ID: e361776a-4b10-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcXOLYUc9UUgFBacejQVrBAvoZQPMmcc4xEFP3gkKurfhrq2btOKBrdaNkh6q2i/OJNMQnPOPWiu1CZeZxe35EWdAxB4SBWUSlhzq1q47J8bhMljyHyIAUm0H28BhOZUUrkB/vnycEuU78ZPZpXTv7ZFkR28Qy5w2YQgCICVeNgS8vD3gR6smpNAPZ/FLdtp2FK5QB/P1aR+aAjSv0IvS7JVXV0vsTarWZfrAcjEnCG9+S3PcGTJ+2BTGJe505RRYEGKtUAENuLmBCxWoNLv9dcWmVjiBXis/27JRa8HFG7LQvOs4toKYVjdTA/VQV0Idrvv0ygLpdtCwsT2XluOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghb5Oa2pH50R2fze3OMD0bqlb7Lg/17nTDRJVRVWXxQ=;
 b=merlTggRJ2JuW6aMuKlPCOodvlgVjvg95inaXHucdYpP59dUoG5x9k0xkdw7gPyjljooBkXIXHlKlmnP6EuEPfbOrddXCCvcUO1BHNN8XtpeLBOr9JVqaqkL75euij6BmyL2bTzIcHGnjCi9/9BbyrF1VplZnjgSWQbz6m0Ibj6kEguR3WS6TwwjTq1H1RIGMO0b8u1My8UpUp5u9E7ggRmC2dzlHrfhyMSC4djsQH+f1r0GLrw2QVm75sUQRGWuujsICB+IozH+cSJaZSih7dZtXMZGHHGXdO3GCXsrJPHukKE5mgD8ZZIZYtT6DtuRVGDXHRMuaZeoEFdYFw+HiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghb5Oa2pH50R2fze3OMD0bqlb7Lg/17nTDRJVRVWXxQ=;
 b=JvqMYEIUV8rto2sFeBNKWHh5GONHMiU0+Y9UEpjmQzSClJyKRvK3AXIl4JhGggRZWUZcOzm2CYAPKBiJsHbBYHkHdA5LwqK4ihu3i63zP89nlZxvV9yCLCP7pXUlaDkQv+be8qmE3rfiyHdJFhpi7D5mDZfw5vipYGFVp02i7kA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8fda8e62-bc95-0506-da67-ddef0b1f73f6@amd.com>
Date: Thu, 13 Oct 2022 17:05:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
To: Julien Grall <julien@xen.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
 <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
 <e94b7c65-1c38-024f-6a91-16098045574a@amd.com>
 <96f989d9-4d55-acc9-a0f7-cbb1212480ad@xen.org>
 <28a406b7-0b9d-3c4b-4db4-67af6729e35f@amd.com>
 <28525ef4-4ecf-e55f-682c-93eeffbc09b5@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <28525ef4-4ecf-e55f-682c-93eeffbc09b5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 9065ad43-f3b4-4f37-8ff7-08daad34c63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JAgSpsOqcgSAjJDIAovURnqlamNoeV21RSBxAkrvn88/cWIE//7YUMSKGsDoxRh+FO4wuP0CDz2cGiLuuNGibm2XSTk8VmfvIdnWluuUeG653E1/PnPWc/BBpV6gvrzfttNYVNciO7wb/Wegf2ibdKE6wpEm3hahNjfVuDeEHaT7qrTLfoBY3OqSgOZmegykSv/SibivoSmmx97/0EGCQlgCCM0eue+7o6gbnnxt/g63bvtCWBb1h2BElJjvwts2xRT3p0t2iplu+KEEbbCkBHfedrAsC3WyNpTnVKow66OEArft567DKukEsEQIlAw3PxQL2/tn9THs8dAKWgWVCYORKUVv/4w30F3jif4X/KX4k8dOOEh1X4xp6c2+ddXzLgYwHO8lNn6fMrFwVzIAbVYJzD/LkTtBZq8Xy8q0NsRVdIwh/FzJZSKDxCCih/xzTl5yOnvSbDbq1EHYsowAr3T1EvYsGOzx/Or+GsSWNoc9EA8oopytsChyrC/FKF1pDRrXH0K14sUqCL2ntnuJubw1ZekFZIWqEeygiBOGnw6Xv5Bsd0kdpXFVbY1j+qXLPOzD47KPnl1Y64oJcdxbVnsfEyl45Hn/To7WbNynDq6aWWtiYPqQUhdXni+m2GWzb8HateiTzDfXLwLm5Zu3NrWhHPmkVJfVaWdUB2slrUnJd28nGU+gJ27tx0kmxPuw4UZ+rouDoI31JLHDKXgLw0AGihls0RW3+ByP1OBt+2Cg6bbxm3DNw8DtdEEdRmG4JdLFF5XUncxgo3QscByKoFv7e7t5Hjys1/MKqwlgt34=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(6666004)(36756003)(4326008)(8676002)(66556008)(53546011)(41300700001)(54906003)(110136005)(316002)(31696002)(5660300002)(8936002)(26005)(83380400001)(6512007)(6506007)(2906002)(2616005)(66946007)(66476007)(186003)(38100700002)(478600001)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0ZHK0hsKy9zNkFsYkRnWUZrNzBadDh0UWppdUMxdk9TRWY1SWRaaUFXa1VF?=
 =?utf-8?B?UUZWSTk3WnZ1MEg3ZDU1WFE3WVlDL2tGN3VrdTNYUkRNV0VtYTZRQXpBWjNV?=
 =?utf-8?B?Q3M2bEdtY3IyS2hSckdlcTFIVGtVS2V4am1TaW0wY3FQT2EyWTJQczVGUkxh?=
 =?utf-8?B?MFNvdHhYbkw3SEt2OXpnN2NSWHVkMlhrTUdmd3k1Ry96dVgrZWF3UVBnZ29S?=
 =?utf-8?B?anRKQjNHRDhkb3h4bkpGeDJTbklwR2dzWDVUZkFxcWNYbHlIcEMxd3pSemI1?=
 =?utf-8?B?T3VJNjJDVFJEVE5LcGRIeUViWXloQnFzUDVKNTBJckRYbWtGc0FGZW80T0dS?=
 =?utf-8?B?Umk4NGVvRzBqemJTVm5FWmVJcFluenAwdmhKbi9vVGpHQ3RBdUcyNG01MWRt?=
 =?utf-8?B?OS9DZU1tOTVkbnIwMFZKbFljNUlIMHZIK2NLbnNiQmxJZkNRQmlEM3ZIWUR6?=
 =?utf-8?B?aVY0V2I4czM3dHUvd1daQzE0ek43bHgydHluZE5BTHFkMHV4YmszVlFkS1Jq?=
 =?utf-8?B?QmlIWUl0c3Z0SW0rQVFMN1pmNktTOUZyYXlka05lU0tINURia3dBVlJhWnZh?=
 =?utf-8?B?WjdIV09oQ2UwNE51dDlscFYvLzZ6bkNsWHp6U3hzWFNBUHA2N2JSVVhTRnRS?=
 =?utf-8?B?Y1Y3STdGZ3dLZGh3Y2FZczNGdDhyYVVOajNIbnJ4bXB0QmZVekdheHkwN2NO?=
 =?utf-8?B?NnUrVnFJOGtTUWtLMml3Q05GbHd4WWRzZG5jdXFUcUo4dFNicFp0TFAzWEFE?=
 =?utf-8?B?bmp3YWw5WU1ZZnNsa2xQQTVkK3p4VCs0eDV1Nm1mVTlwMDFwOXM3U2FvZWoy?=
 =?utf-8?B?aENMb3pOdUl1OVdYSjFVMEp5RkRXM2QwQkdmVHM5TWFobXVmQ3NFeCtXSzlL?=
 =?utf-8?B?UVpsRzh1MlJ2aWhIMnR2dlE3aFg5VitDK2JQOTBVanAzNzlqNUQ3anhMeFFJ?=
 =?utf-8?B?WWloVS9RVFVzdE4vTERzWUI0N1dxNXpnU1lkd3l0UW1aL3dFYjFBb0djVTRT?=
 =?utf-8?B?ZldyNmc2VU9hUHJWWXRscTZWUDdOOXVPb2hHY3IyNXMxY3VLc3N1RjRrVlo2?=
 =?utf-8?B?TW8xdVgycVZ4M1p2VkhIaHRGNzRiWTJWL3pJTXdOcmVQVzJYMUZCU3E1N0NH?=
 =?utf-8?B?bGxzWGFyM2VhVm4zbGd1M0JhNnlXeDZRMEZEZUFTV05BNjNxa2tJY0trUDNM?=
 =?utf-8?B?TU5CM0ZOQmI5RjRsSlBNZVRjSEs5MzVKaURNclFSRkdCak5OZlYySmp0VGor?=
 =?utf-8?B?REVuc0lTL0FrbEVHNjVUVzh5R3ZhQ0NHalRFNnE3OTdtMGVQQW1hWDdOMXRU?=
 =?utf-8?B?TG91QlYxaUZ5dWNCV2I1WGpETXFMOVVhcUNHZkxhM0RIc3RHNUtDNFRpNTdF?=
 =?utf-8?B?NHFPVGcwTmNib28xWFVicWcyc3lhdHEwZVlzS0FpR01GekpYSWlCWnVYMzVT?=
 =?utf-8?B?WFpoQkxVL1ZlQ3VnMlVYME1NUm9jelZFakQzTjFaQnppbzU1QzFFdzBSc0VD?=
 =?utf-8?B?K3lJVTdhRjhuVytKOEFOK3lZUlJDK0xpSEtxbGV5OWdEcmxSeU5rMkdXVk5U?=
 =?utf-8?B?UVBxdENxcVJQaTU1R0VXS0NkZ01MODA1ODVGZUpFWWc3SkMzcmpQelJ1R01E?=
 =?utf-8?B?MWNZY0d3aisrQlV1VGZuRGFBME9KeWlGREp6ZExOcDR4b0RwQk1uRWVKbExY?=
 =?utf-8?B?UjhFRDZHNFBhZkNndjRyQWRkam1XaCtmSHF1bHI2TFRxL2ZjWm9odXVMWGM2?=
 =?utf-8?B?KzNmZlVtbDZxdWNDdjBjbTEzaThsYmxPblNqVm15OCtMY2JUNFA3d1ZMRXF2?=
 =?utf-8?B?OVJkcU9sNXpYbVZ3eVUzVDhDWjNKQjRGQlY5YkRNZ0t4UGRSZjhYOWJGdGhr?=
 =?utf-8?B?U2RhMjJDRU9qcitCbnJuWTA3c0VJbGNqQWEwOXlwcjhtcVlQanBwS0t2NnBI?=
 =?utf-8?B?K0xId2FvMVJldVFZZHRSbUp6bTg1L1NXVnpWdkEyZitUN2xKMHJLNHNTNTJ6?=
 =?utf-8?B?MXBxUlBJS1ZiZHV4V0h6b3BFQnZrMkNzeXVVVlNCcTNiTGhuK1FCU3ZvQXZl?=
 =?utf-8?B?aUJjV1JINFNuZDZ2M2hMR3gvaXRWazdLUU9ac3M3VE44OEZTRmhXZGFad3JV?=
 =?utf-8?Q?I+9HL1Q3sYb9oZSkPtgICQ+R9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9065ad43-f3b4-4f37-8ff7-08daad34c63c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 16:05:40.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g47bfFSfdNjTkQvHNLSYeGlvxdHIzF2cCeJHBNRKbUpg/ubwVgifccRV/hhrdxZFb+QpNRdn5ScDnikKLCAIMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655


On 13/10/2022 16:38, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 13/10/2022 16:13, Ayan Kumar Halder wrote:
>>
>> On 13/10/2022 15:47, Julien Grall wrote:
>>>> .Thus, the guest need to invoke sys_read32() twice (GICR_TYPER and 
>>>> GICR_TYPER+4).
>>>
>>> I don't understand how you came to this conclusion with what you wrote. 
>>
>> Sorry for confusion. I was trying to explain that the code does not 
>> handle 32 bit access of GICR_TYPER on arm32.
>>
>>
>>> If we had implemented vreg_reg64_extract(), then Zephyr would still 
>>> need to issue two 32-bit read because Xen doesn't emulate 'ldrd'.
>>
>> Yes. So what we need here is not the implementation of 
>> vreg_reg64_extract() for GICR_TYPER.
> Why not? Your GICR_TYPER is a 64-bit and the helper is the right way 
> to hide whether the low/high 32-bit are accessed.

When Zephyr issues 32 bit reads for GICR_TYPER for GICR_TYPER + 4, it 
traps to Xen two times.

So, my understanding is that Xen needs to read two 32 bit values.

We can modify the vreg_reg64_extract() so that it can return the lower 
32 bits in one case and upper 32 bits in the second case.

Is this what you are suggesting ?

- Ayan

>
>>
>> Zephyr will issue two 32 bit read access for GICR_TYPER and 
>> (GICR_TYPER + 4). So Xen needs to emulate 32 bit read for GICR_TYPER 
>> and GICR_TYPER + 4.
>>
>> So, we will need to modify the Xen code as follows :-
>>
>> |#ifdef AARCH32 case VREG32(GICR_TYPER_L32) : { read and return lower 
>> 32 bits of GICR_TYPER return 1; } case VREG32(GICR_TYPER_H32) : { 
>> read and return the upper 32 bits of GICR_TYPER return 1; } #else /* 
>> For AARCH64 */ case VREG64(GICR_TYPER): { do as existing; } #endif 
>> Let me know if this looks sane. I can then submit a single patch to 
>> add support for this. |
>
> This is a bit difficult to read. So I looked at your answer on the 
> Zephyr thread.
>
> You will end up to duplicate code for emulating TYPER and there are 
> quite a few other use of vreg_reg64_extract() in the code.
>
> So I am afraid this is not an option for me. If you implement 
> vreg_reg64_* then you will not need to implement.
>
> I would be open to other suggestion so long we don't end up with 
> duplication or any other kind of open-coding.
>
> Cheers,
>

