Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DAB78EA3D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593737.926806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeyh-00083c-03; Thu, 31 Aug 2023 10:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593737.926806; Thu, 31 Aug 2023 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbeyg-00081r-TM; Thu, 31 Aug 2023 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 593737;
 Thu, 31 Aug 2023 10:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hTy1=EQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qbeyf-00081l-C0
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:32:41 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52ff3fa-47e9-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 12:32:39 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 10:32:35 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9a2:f8ec:7c75:fe95%6]) with mapi id 15.20.6699.034; Thu, 31 Aug 2023
 10:32:35 +0000
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
X-Inumbo-ID: b52ff3fa-47e9-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1LSWwWCr4j2CHjmKryCwTLIC8WFrDLQ+J3s7Ptrcv8h0RWJZVeRTwPpSHfxM2GQkUDk9flMlySFv7kO1wNDS2ZNZXyLpjGN5gZAJRh6bNlCa+bK2K5VdiJqURXbeeeKealpjHvRvpy5ks/sWTgGZiCXvONA1SYb+KQJdm/q83PizAy9eaepUWkL8Xks28FyOZBHuIPEeOLKrvwWUcX2+CO386rgsHfDUgLLE6rRSOuIzHVP7fQi194hcqLEmCOZm5ZG7doi+CT+VVRKpLJ6k63GwQbkWH/CyQJkpgb5eq17Lva23ak9q+BWXUY598GmjSuAkqPT1a3X15ImfTUEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFPW1HXK22OeEdNPdtNZYqUJCpwGQvBoO+PziOCAtgc=;
 b=Kb3hW6mdT7nPjTdyIZedDnryTOt3cWnc9XvP69K3q116sm67jjRW8iuMjfswAcUTO09ZifGMD013/5QXYFBptGU32QAVkxAUnmXdeyJWQIBFwfHMSpaVvSzUabj2umyLnhfAhPITI1riIu07mQOjBMMzuJUkZK5rAy8avmGFEECwQuGaUJ+k43V76Abblh1m5dKN9AmuBo8bzYReyiGzslQ738r8gxw7bYJFzs8fYMaHbcL+8NI270uWVlvZ63xaU5EU6Nbt4AgNhL6zSpvMMx/3wy63Nn8Z+zE73RTME3+Zq/z1f4kKSdQGTrQiuxNbCF0bVUOxMSWFDU6QSfOTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFPW1HXK22OeEdNPdtNZYqUJCpwGQvBoO+PziOCAtgc=;
 b=GuNmiRrAnkrik0rn6pI/pwIOSACNWIhtLGKPzsAow4EPJ7iUP0PC5MqkJV5r6iKjLWXk5GzJzRGy736IsC/hPxzk7+Qy9FqkiEsdF1GloSM9QUBLSRADd/D1Y6DJvoxYenYnskTRJ17ghHZHfgbPbjdBeMOLVaXE5K1XbUjGDlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com>
Date: Thu, 31 Aug 2023 11:32:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: QEMU features useful for Xen development?
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <87y1hspiyh.fsf@linaro.org>
 <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
 <87cyz3pmgz.fsf@linaro.org>
 <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::7) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 2812b4ef-6ffd-4cc0-ffc8-08dbaa0d9745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mUqIkrgVZJ2j8HWfCSLTFz+PFMdm490frZpGDfvJRO4tBULtLdhu/TQYbkgn5zVSbUzGf28QyX6dFXx9YCp+vGJYSlm7wqby7F2zvhMnvEY6ABjciS5AmzJQm43CKxAEM8drM4lVW7kvcKFJDLeTxKSRDucS03PLZ5LZ+Q5t1LIH04WzptjjSA9iYbwkKLHlIuYNgGxyjyPTsokYqKu8HyJtV9T47F7IWwmMuDF7/xCbc4z2qLJG1mjfnYlyqy4UFa/NoF5X8ApyvyaZ8PQQsUBTZjeeGJ/6y8vfBDnuDpLEpfNbBYn59bGt/bm0Q3NjkO4VuzYg2njI+pl/XK7h2MqB/o1yxZgmZ4cZ688CUFHtmn1MrjRj3MOOtSjGRB+efeNyy1cbzJnS094KeE6ZS5wy4dCb2jmYh0S6SpnY28nFGHpWjR8h1jik9UIXvHK4Hg1f16B6c2MYaZKl3dN49D4ugYY1SRTJQ1yXEGE6LFKvE7SQZqvHp3y4LNUNfD7hDyUwhxEf04EzheZVMqizuHi7l00+WlgNi8Kb3LC7pa5voTV7K6gnKYGyomboEwsxJrpwAX1wiM/YTNk+lMIdNFPNHdpQiWUAKbISUGB+jx+FDefyYEjMyUTIjrQlK4rcJbGXcG1OSWgUASYlDt3G0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(1800799009)(451199024)(186009)(36756003)(31686004)(83380400001)(6506007)(4326008)(31696002)(5660300002)(53546011)(8936002)(8676002)(6486002)(26005)(6666004)(41300700001)(2616005)(7416002)(66574015)(6512007)(966005)(38100700002)(478600001)(2906002)(66556008)(110136005)(66946007)(66476007)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVlTOGhLT0ZxR3NXWExEbXBRSkoxSnhjUnRxUnN6Ym12VDY5QUR5VytFTE5w?=
 =?utf-8?B?VDFneHpBM0FmblNNa1lRZXFyajhaY2M2ak5SU2psWmFwMU1DUVhPc2MwV3Zv?=
 =?utf-8?B?d3JNUFhCaFpRL2thamViNnBoWjUvaWNWNTlFL3hUN0NGRWRLOXBpeXF3OVhP?=
 =?utf-8?B?MWUwa1paL1VlYThqc3plMWNnUmhDR2tZaWVOeFlQWkF5TDdadVB3S3pWUFV1?=
 =?utf-8?B?OE1BSGhPd0hGS2tsMFpZQkVLYzI0WGk2bFdEeHJHNUY0WUFVMzVRam03NCs0?=
 =?utf-8?B?Uk5iUXN6MTQ4R2RkYUZ2OVMxT1k3VVFvYzU0MVVCUHJxSjlTZnNLa1FVVzBQ?=
 =?utf-8?B?RTByVTJ2Z1doUmxsdlo0ZGh4enpZSG9VVFVvKzN2eWovR0gwMndWMGxhQ0cw?=
 =?utf-8?B?M3gzU2NEdk8vSkpDN2xvb3dvNWhzRTdvR3ZRTjJJR3pOdTV0RlFJTkNvOEV0?=
 =?utf-8?B?OXhMWFJLVGljTitWelkzYi9rNmoyTDd5UWtaMVBYb2doN2lmM2w5dlZnTmJz?=
 =?utf-8?B?ZFROSDlSKzdkMkNXNTNQa3c2TUpGR2owek1NODFGcStzdTkvREZEZVc0aHl6?=
 =?utf-8?B?RGZMYkw1dFI0cVBFQXVxNmhiYXNzbmF3ejF5a2pUT0xuZG9TajRDZU5Cbk9C?=
 =?utf-8?B?bDFQZS9rcUs2TW50dDM4RUMxN1BKaXB3dFZOSHpIRkt5RVpGS3liNVNUUm52?=
 =?utf-8?B?QWFMZzBHT3NjeWhGTmdQSlNDd2ZvdzVweFdQeStIbnMvTHF6bmlHNEMwNGlz?=
 =?utf-8?B?bE51cW5GUFlWM1QwZGJtUHZGaVFxWUNicG5INnJJS3l1bkthYk44Qmtyd0Mr?=
 =?utf-8?B?Wm52dFJvRW9FQlZLV0NKQzgxNVBtcFN4RkJnT0VVcGx5Yndxb2JaRUk5MUls?=
 =?utf-8?B?WDNpSm1ROExmNnJmU1pEL2tVYWttUjVDWGlad1hhSGVVRkpWNExtUEZTMjMw?=
 =?utf-8?B?eXFkYklvUEVIMGlnL1krY3V5VjkvRDA0YmF4REpmYXhhSjR1ZkszSWw0cUI0?=
 =?utf-8?B?L3J3WWlhbXg4N0RnamQvdTNaL3FMVGh2akppUEFtTWFESlVsaytlYjYvVXJT?=
 =?utf-8?B?TndUN0ZRclRoWU9kNlExdHFHcW50T1JmQkpXa09ycjdhVjE2NE1EK1BRMmt1?=
 =?utf-8?B?WlJzazVmb1VEeEZhNC94OVRGVXBucmpyYTdobHR4L1hpQ2dkejVESjdveFJ1?=
 =?utf-8?B?dXZvaWNrZDh4VFlERTdCQXd2Sm01bzhRYnJpZ3ByVVNZbDRUMmhZU0x3SStU?=
 =?utf-8?B?TUxGR2tKeExZTnRja213NkJocmNGVDFseE15My9RbFRxMG10TFplNkI5alZE?=
 =?utf-8?B?aEVZNFk2OHkvUnU4TmVLR2p2Q00zOVNIV0t1NHBjK0dxWkNudmh1eFFiejRs?=
 =?utf-8?B?cjNMZzdpRy9lZUw4TmZPSnhVc3VraThNeWUrcmEwa3FERkVxMFNDZ2tNOWhY?=
 =?utf-8?B?MVJJcWhzWmlYR0cvYWpFV1lSZVBDRUN5RlhFN1FRc2EzWEh3WEttOVpKQkNY?=
 =?utf-8?B?NjdYaStVQkhTSEhoVlp0OEIrSDNvejMvQ3pId2dYdUFMTmxGaklRZGpmTDU5?=
 =?utf-8?B?NVhmNC9jaXZPQTRjUFVJUjk0aVdjUFVGUUFaRFVRamtRNGNicEp2a29RbzNT?=
 =?utf-8?B?ais2RzRNTFk5cXBtOFQ2WE9ka0RrZjFlcXFTcGh1dkZqNDFlZTlsSkNkZjBw?=
 =?utf-8?B?OGVsV09JMDZSY3VMU1hDN2ptUjdDSW5GazBOMDFZUVluRnlvR2piZm1jdW9R?=
 =?utf-8?B?b0w2V0dwQ044dWpOZWdQeWR3K1VWWFNZL2s0VGNUdEw5RnQ0c2kvT1pUL1p3?=
 =?utf-8?B?RHVCVlVLMTJFMndyMG1BMW9vb1NWVlRYalVGQUMyaHlobSszY2tJQUNyT1dV?=
 =?utf-8?B?SjBSZENCRXRPZStkWGptd2VaVlJaNlhSYUNwanI0S29JWVlTS3B4REhuZkhJ?=
 =?utf-8?B?K2ZDMHV3cjN6ZjdrR3drN1FvS1UwUDAzczlGWEN0ajYwRHlyWlFsVHh6aURB?=
 =?utf-8?B?K1hpYThja1FuTVdCWDlwTUR4T1hMeU1BUC9DYldFS252WWNDR05LazE5eEtl?=
 =?utf-8?B?WmdwNDBJMzJsYk1CTkxSZ3RJdk5uSWxSN0NYV3UvVmJlS1BhYzBLOTVmQ0Q2?=
 =?utf-8?Q?N4EPwA+pbp6TTVu/424t96Xah?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2812b4ef-6ffd-4cc0-ffc8-08dbaa0d9745
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 10:32:35.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7ks4y0GAYScPNv6y0By9H+eL6xw229K0gCfYjbsDbsPZhqTCWZfODuGlwRteFWgpwtfAEanY+5+PHQlRQpD/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350

Hi Peter/Alex,

Appreciate your help. :)

On 31/08/2023 11:03, Peter Maydell wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> On Thu, 31 Aug 2023 at 10:53, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> As Xen is gaining R52 and R82 support, it would be great to be able to
>>>> use QEMU for development and testing there as well, but I don't think
>>>> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
>>>> need EL2 support in the GIC/timer for R52/R82 as well.
>>> We do actually have a Cortex-R52 model which at least in theory
>>> should include EL2 support, though as usual with newer QEMU
>>> stuff it quite likely has lurking bugs; I'm not sure how much
>>> testing it's had. Also there is currently no board model which
>>> will work with the Cortex-R52 so it's a bit tricky to use in practice.
>>> (What sort of board model would Xen want to use it with?)
>> We already model a bunch of the mps2/mps3 images so I'm assuming adding
>> the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
>> tweaking config values). The question is would it be a useful target for
>> Xen?
> All our MPS2/MPS3 boards are M-profile. That means we have the
> device models for all the interesting devices on the board, but
> it would be simpler to write the an536 board model separately.
> (In particular, the M-profile boards are wrappers around an
> "ARMSSE" sort-of-like-an-SoC component; there's no equivalent
> for the Cortex-R52.)
>
>>    https://developer.arm.com/documentation/dai0536/latest/

Yes, it will be helpful if Qemu can model this board. We have a 
downstream port of Xen on R52 (upstreaming is in progress).

So, we can test the Qemu model with Xen.

Also if all works fine, we might consider adding this to the upstream 
Xen CI docker.

Out of curiosity, are you planning to add Qemu R52 SoC support to Zephyr ?

- Ayan

>>
>>> The Cortex-R82 would be more work, because (unlike the R52) it's
>>> AArch64, and we don't have Armv8-R AArch64 support yet, only the AArch32.
>>>
>>> I haven't looked at whether GIC on R-profile requires any changes
>>> from the A-profile GIC; on A-profile obviously we emulate the
>>> virtualization support already.
>>>
>>>> On Cortex-As, in addition to a PCI root complex and an arbitrary PCI
>>>> device, SMMUv3 emulation (both stages) and GICv3 ITS are needed to be
>>>> able to test PCI Passthrough.
>> We have ITS emulation support and it was recently plumbed into the
>> "sbsa-ref" board as it is needed for higher level SBSA compliance.
>>
>>>> However, if I recall correctly SMMUv3
>>>> emulation in QEMU might not be complete enough to enable us to use it.
>>> Yeah, at the moment the SMMU emulation supports stage 1 and stage 2,
>>> but not both at the same time. This is good enough for PCI passthrough
>>> with a Linux guest using KVM to pass a device through to a nested
>>> Linux guest.
>> Is this a missing feature for SMMUv3 or something introduced in the
>> later revisions?
> It's a missing feature. The SMMUv3 spec allows an implementation
> to implement stage 1, stage 2 or both. We started with just a
> stage-1-only implementation because Linux doesn't need any more.
> Stage-2-only just landed recently. Nobody's looked at both-stages yet.
>
> thanks
> -- PMM
>

