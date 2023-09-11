Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E18E979A87A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599468.934928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhVy-0000kz-Hc; Mon, 11 Sep 2023 14:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599468.934928; Mon, 11 Sep 2023 14:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhVy-0000hx-Dn; Mon, 11 Sep 2023 14:03:46 +0000
Received: by outflank-mailman (input) for mailman id 599468;
 Mon, 11 Sep 2023 14:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfhVx-0000hH-Fo
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:03:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e89::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 042b49cc-50ac-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 16:03:44 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BN9PR12MB5274.namprd12.prod.outlook.com (2603:10b6:408:11f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 14:03:40 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 14:03:40 +0000
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
X-Inumbo-ID: 042b49cc-50ac-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwTWktVUZPwsdhG/OueuOkBAJ/8vHE9VE9kjS5e8xCOiWPX3eXik99TYlARW6vOmxGbZqXFOVGPmhnvGmB1Ko7otk4dNLIZ7itYM3TURrDDgN3day/GzfQdzqG6onxdCwTuzmkhZ9QHWvHKMQLEjj6rm1+hnhDcJ2vsOyf0Zj3b9yAi/U/Vo0/q6Pqgs0XY4FRq77T7tSoegib4X578xQ1AzOWcOi8TwuKAjfsN5j8bJ9wQj1wHUj8DsyIod3HCktU6DYt1ujfpSSoj+SfDLqe9k07NE2+SZ47wzd6ZmZ8/+fKcjpnBNg3Jjsw/OcIfUb85tJaHTJChjdK2Hk7nROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mefa9bnp9MDt++lQp3ggEEWTzalF96Ef1xjeopKNYk=;
 b=e4bwP7ptyWAWe0OL2VLOfvrpDs0x0OLAs/96h0i9AGk4S8JUPhPAvx9VVJTJpOWt+caWmZppswhVLksgb9bZTQRcgHsTR2n5AwK51eaBnEzOOuGpCbHo5m9OtyiGOLfi5FFqYZu9x+z+ItlfE2dD2087aXcCpu4+FS+inJAbKwlaQcvGZqbbsLMwnvhM1xATrXuqWYRSNxH8HW6WV6y81rN8MrpRsvCxlRdIKFCXPEuMf5EeVHfMKOPRFD7ir571+WgH2WP1pqV0PyuaHInW8Rl6QAOGpCESpidBOYTAtF62Qy3OzLgQds++K9qplCGUO1jN2cmAp0QSq8MhY/Qvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mefa9bnp9MDt++lQp3ggEEWTzalF96Ef1xjeopKNYk=;
 b=mCl9o0NvCRPQ5T8kr9zasYUoRMmUuv6a28fIHracHucBY3QhysWI9zYg2dyfUZaJcX67eJKZqpR06zsHN9/CFA9ZWCj7Crhc1Z/J87GxJDL6tILTGAaSvEeFQZ0jKs5nGzlTb0FX+oLh0MSdts4bphJfg/heIgxmqMYvy9foZQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8da354d9-5b80-709d-8b0a-be1ba5694b37@amd.com>
Date: Mon, 11 Sep 2023 15:03:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v6 00/13] xen/arm: Split MMU code as the prepration of MPU
 work
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2309081515340.6458@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2309081515340.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0329.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::29) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BN9PR12MB5274:EE_
X-MS-Office365-Filtering-Correlation-Id: b0eaffe0-fed4-4c61-913d-08dbb2cfe6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NjEL/9PENmugN2/1SWPHfor6h+4+wgPPpU0rAYItXXsO/znpTDxzfWjP0glj+dthDUOX8bFRAcD/MNDxI1CXyBbFCatudDKuaW7MianMYKJcLyPguqYpDcuknzngVpBMu1IO8npEoBqdH6qbwKuIc8Q8Rqn2VhiX1+WNjvJhqdoVJvh9P1xRiK9vA1eUbvox68UzUBC3upU909wJDcz4Q1oVV/pXLbpB/GGfuo95NBXaLox4m8Z4pvlaU7YMJtdzbIjTc7LVWuQJDntM/qUmM1Hgn4d4YDhCBCZCMLA7qo/sAGrrC7otTVX2F9Vr2s5tAatc6cyTFLtp9ueOSZKDjyVuOynezqNVrwCvnC2CnSALWT76HQuMwtXb+ii/cwqalorE//z2asgv9+j3rXhLYtZTAavoS/S1Zz2GiYD5xrb2tFtf1YFFUXJm8pRQWl+UotXkZEb0Wt2ZGcOXjWJSDoeGhs5gXEwLWcnudx/myw1sU6BEpJqV9yX8X1mpbTgTyqkEOzNCScoMS/dAsC+d2LkfcJEyGU6M/+DLn7m9ISF4ws+gqayrGATaQVtCSwZqMZ871wFzvenR8AVR9zHkLl31/F9JZ6oFZK7ggeM8BPQ+4UFBB05ic/q0r5xqLTc6Lqy93xBD94/OOaaZob8weawBoiMSF+GG16Uzwf4fgBIeIwIrDwMug7Lr+20TiyME
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(186009)(1800799009)(451199024)(6486002)(6506007)(53546011)(6512007)(6666004)(83380400001)(31696002)(38100700002)(36756003)(2616005)(26005)(31686004)(316002)(41300700001)(66946007)(4326008)(8676002)(54906003)(966005)(66476007)(110136005)(2906002)(5660300002)(478600001)(66556008)(45080400002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEZxRnVtaVVMcnFUaEZhSXhiYTdoSi9TVFZnMlh2SS8vT3V4RExSNEx2NUtP?=
 =?utf-8?B?RjU4RGRNL09PeUpZdGdUdjBOOFdQY0ZZMU1rRnl6dHN6WVkzaUJHQ29iSE1w?=
 =?utf-8?B?cWUzVzhlamhoMHRQYlNyaUN1cG1DWU42bGluRE93K3RQREQ2OVFlSkhmZHFh?=
 =?utf-8?B?cjJQem91cDZxNmNqR3VGSW1NR1NPWHhONk04dytDOFh1QUVSaXZWQlJFbVhP?=
 =?utf-8?B?VVJONjBPdmMvZUFYY2NYYjkxZnVGSU92a0tWeFJBcCt4RktPYUdJejQwTXVG?=
 =?utf-8?B?elhHQ1FsV0diakcxRU96cEhhVHlBRXJEMUgrczR3bjI0aGNRT0tlNjhSQzN5?=
 =?utf-8?B?VGdWSGNKMHUxSHdKUkFCcGUzQzFwQkN1ZGljNElVVStaTHJlSVUvQ1lKa1My?=
 =?utf-8?B?UnBXUStyRSsrRmlrOTFmWGR2WGdnYm5WaXI2YnRlbU54akVkZEtaVUp4OGE5?=
 =?utf-8?B?eUZoYzBPMkEvaW5MYXNObmdzSVpDbGtyTW1sYUN4MEM2V3hsamVhRGlYUkpE?=
 =?utf-8?B?V2JMSEc5ZTZ2em95OVpRSktLMkdHcFcvempEcHQ5WkZSYkw5Z25JL0pCbDVN?=
 =?utf-8?B?aWNUMWhUS0c0eHMzbm1PYXVjVjVETE9JRnNCdCtEajZGZTlmT0NjTFV0b0xZ?=
 =?utf-8?B?Vm83elN0SFRNNncrM2tRamJBbTVFekM2Sk56M2dkVHcyREVEbDJZZmhhV0ZK?=
 =?utf-8?B?Wmg1bFF1SUx6aUFDWkhOVFFDdEdncjNQRjFWeHNtUDZPK3l4Y0JMNHFVbHJl?=
 =?utf-8?B?YzREQnFLbnBudW5Ed3o2N2FXWER0RlpWNUcxR2pOVGdmaG9XSHZMdE1Cc05r?=
 =?utf-8?B?TWhSOXNWSHJwdTBJRU9jMThiNFhDU0xsUHlWNTdqNEdkU1NkWjVMVTBMSTB0?=
 =?utf-8?B?Ylc3a0RFaDVza3loOWpYWEhYREo2b2F6STUxRXgwbzRDSVNieW1qWW1ha2Zp?=
 =?utf-8?B?eTZKL2JrdkFZV05USldZbjhnTlJZVVdldW1tUXVLeWVvaW9JdGluMUZENWJW?=
 =?utf-8?B?dk1SSjVqWUpKVFkyZmszL1AvL2hDWTFEZng3RDNrY3c3QmUzaWxSLzNuT09t?=
 =?utf-8?B?Vk8wQ21zcFlsSDFaZW10WmwyN1JrbE5McU5jOXIzR0lyYTZYOVcyOG84Y2lr?=
 =?utf-8?B?MkhSNzBnOW9pTkppdDN2R1ArQ3M2UjNYZlhZZHdKODNLR0hkblk1eWEwM0Zr?=
 =?utf-8?B?OGpnWkVzRTdVSzZZeE1xOElJa3AzOXd4ajFuSEtjQVdNZEg3eG05ZWxYRHYy?=
 =?utf-8?B?QzFET1hYYXNURG5kY2huUmdoSGMreXZkU1VUa1dQSlM2bWVIVFFwVUlIYXhn?=
 =?utf-8?B?RjRLTWV3b1RTMDlLYWVVaEV5b0hMenV0YStPaHBqaHNQaEdvQmxjNU82Q2R1?=
 =?utf-8?B?YjFMYWJ0eFpBRk1Xd3pHbEpTY1ZNS0xjaHo5WXpBZVh2aTlOajZQTkpyTEhX?=
 =?utf-8?B?RTZrbmg1ZEFKaGYzU2dnSG5JOWN5VHBLMWFrRndMYWZmdDV4a1hoYzV5UXdo?=
 =?utf-8?B?ZkZ5MXZ4Q2tUTGkreVRjYTFTbFZCdDgrUGFlU1NlQkZKYnBuRWEzSFJXdzIy?=
 =?utf-8?B?ajB4YXZ5QkpYbGZaUFA3eGNPTzlnS3k1N2NsbWw3QmNJTGlqSTYvQWZ2eVBI?=
 =?utf-8?B?VzZJMmI3SW5jNTFGbnRjUlVSM09YTVk1RVVEQlY0ZHUwaXdEdGlYTUNqa3pY?=
 =?utf-8?B?eE5HYWRVWkZjdG5YNDY4Q2dCVGZ3alYyK2EydU1tTmUxbGNRcWJjMWh5NWpR?=
 =?utf-8?B?V1U2d01MSUIweG4rN1MxM1gyckpUb3lTTDFMRUVxTzNKQjlSSmRDU1h3S0VZ?=
 =?utf-8?B?a1B4bjFoeVo2M0RpRUQrMXVPS2l6VlNZK0lKTjFoOXZJMWN5cEtKVXdxMDBB?=
 =?utf-8?B?VUtKVG80Q1M1bE5RcW1CSUx1OUFkOWVZQ3N0TGdXTFZEc2lJZC9SVWcyWWN2?=
 =?utf-8?B?R29YdlkrWFcyMER1Z1MyMy9XcHR4b25HMEUzQ1R3QXFYNjZLTFNRYmJ4ZTFR?=
 =?utf-8?B?MDR4aGxJa1B3SlBTNnIrbFg1RG9yREFvMkFNZURhcEJ0SHk1Mko3Qlh1Kzcz?=
 =?utf-8?B?b215YXNJdGpXZVF6Q2w0d1FsMnZ6ODExTEh6V3pMQno4Tk01cXVUWlBoZ2JW?=
 =?utf-8?Q?7sFFG+gCDyMozGsUKPA627Vrx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0eaffe0-fed4-4c61-913d-08dbb2cfe6ac
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:03:40.2700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyIrVhQsz1Ld0MsbN/fFsnabYTTVbqdC7tBJvAee9R1vAIT1SN3l2oevznNoX3N6k1/YqRSHnlyCUHEmGw2Dcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5274

Hi Henry,

On 08/09/2023 23:15, Stefano Stabellini wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> I committed patches 1-5
>
> On Mon, 28 Aug 2023, Henry Wang wrote:
>> Based on the discussion in the Xen Summit [1], sending this series out after
>> addressing the comments in v5 [2] as the preparation work to add MPU support.
>> The series passed the GitLab CI check in [3].
>>
>> Mostly code movement and function folding, with some of Kconfig and build
>> system (mainly Makefiles) adjustment.
>>
>> This series is based on:
>> ec272d8d4c CI: Always move the bisect build log back
>>
>> [1] https://lore.kernel.org/xen-devel/AS8PR08MB799122F8B0CB841DED64F4819226A@AS8PR08MB7991.eurprd08.prod.outlook.com/
>> [2] https://lore.kernel.org/xen-devel/20230814042536.878720-1-Henry.Wang@arm.com/
>> [3] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/982592897
>>
>> Henry Wang (9):
>>    xen/arm: Introduce CONFIG_MMU Kconfig option
>>    xen/arm64: Split and move MMU-specific head.S to mmu/head.S
>>    xen/arm64: Fold setup_fixmap() to create_page_tables()
>>    xen/arm: Split page table related code to mmu/pt.c
>>    xen/arm: Split MMU system SMP MM bringup code to mmu/smpboot.c
>>    xen/arm: Fold mmu_init_secondary_cpu() to head.S
>>    xen/arm: Extract MMU-specific MM code
>>    xen/arm: Split MMU-specific setup_mm() and related code out
>>    xen/arm: Fold pmap and fixmap into MMU system
>>
>> Penny Zheng (2):
>>    xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
>>    xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}
>>
>> Wei Chen (2):
>>    xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()
>>    xen/arm: Move MMU related definitions from config.h to mmu/layout.h

Except for "[PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to 
head.S " where I have a small comment, I am happy with the current set.

I have made the corresponding changes for Arm32 MMU (See 
https://gitlab.com/xen-project/people/ayankuma/xen/-/commits/mmu_arm32_on_arm64?ref_type=heads 
),

and triggered the CI. It looks all good (qemu-smoke-ppc64le-pseries-gcc 
failure seems unrelated).

I have sent out the patches for review so that the maintainers/you can 
have a look and review them

("[XEN v1 0/4] xen/arm: Split MMU code as the prepration of MPU work 
form Arm32").

- Ayan

>>
>>   xen/arch/arm/Kconfig                    |    5 +-
>>   xen/arch/arm/Makefile                   |    1 +
>>   xen/arch/arm/arm32/Makefile             |    1 +
>>   xen/arch/arm/arm32/head.S               |   22 +-
>>   xen/arch/arm/arm32/mmu/Makefile         |    1 +
>>   xen/arch/arm/arm32/mmu/mm.c             |  301 ++++
>>   xen/arch/arm/arm64/Makefile             |    2 +-
>>   xen/arch/arm/arm64/head.S               |  460 +-----
>>   xen/arch/arm/arm64/mmu/Makefile         |    2 +
>>   xen/arch/arm/arm64/mmu/head.S           |  481 ++++++
>>   xen/arch/arm/arm64/{ => mmu}/mm.c       |   84 ++
>>   xen/arch/arm/include/asm/arm32/mm.h     |    1 +
>>   xen/arch/arm/include/asm/arm64/macros.h |   36 +
>>   xen/arch/arm/include/asm/config.h       |  132 +-
>>   xen/arch/arm/include/asm/mm.h           |   28 +-
>>   xen/arch/arm/include/asm/mmu/layout.h   |  146 ++
>>   xen/arch/arm/include/asm/mmu/mm.h       |   41 +
>>   xen/arch/arm/include/asm/mmu/p2m.h      |   18 +
>>   xen/arch/arm/include/asm/p2m.h          |   26 +-
>>   xen/arch/arm/include/asm/page.h         |   15 -
>>   xen/arch/arm/include/asm/setup.h        |    5 +
>>   xen/arch/arm/kernel.c                   |   28 -
>>   xen/arch/arm/mm.c                       | 1212 ---------------
>>   xen/arch/arm/mmu/Makefile               |    4 +
>>   xen/arch/arm/mmu/p2m.c                  | 1736 +++++++++++++++++++++
>>   xen/arch/arm/mmu/pt.c                   |  743 +++++++++
>>   xen/arch/arm/mmu/setup.c                |  372 +++++
>>   xen/arch/arm/mmu/smpboot.c              |  121 ++
>>   xen/arch/arm/p2m.c                      | 1837 +----------------------
>>   xen/arch/arm/setup.c                    |  324 +---
>>   xen/arch/arm/smpboot.c                  |    4 +-
>>   xen/arch/arm/xen.lds.S                  |    1 +
>>   32 files changed, 4222 insertions(+), 3968 deletions(-)
>>   create mode 100644 xen/arch/arm/arm32/mmu/Makefile
>>   create mode 100644 xen/arch/arm/arm32/mmu/mm.c
>>   create mode 100644 xen/arch/arm/arm64/mmu/Makefile
>>   create mode 100644 xen/arch/arm/arm64/mmu/head.S
>>   rename xen/arch/arm/arm64/{ => mmu}/mm.c (60%)
>>   create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
>>   create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
>>   create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
>>   create mode 100644 xen/arch/arm/mmu/Makefile
>>   create mode 100644 xen/arch/arm/mmu/p2m.c
>>   create mode 100644 xen/arch/arm/mmu/pt.c
>>   create mode 100644 xen/arch/arm/mmu/setup.c
>>   create mode 100644 xen/arch/arm/mmu/smpboot.c
>>
>> --
>> 2.25.1
>>

