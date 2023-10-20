Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B857D1594
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619924.965803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtu2A-0001yN-W2; Fri, 20 Oct 2023 18:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619924.965803; Fri, 20 Oct 2023 18:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtu2A-0001vt-Sp; Fri, 20 Oct 2023 18:15:42 +0000
Received: by outflank-mailman (input) for mailman id 619924;
 Fri, 20 Oct 2023 18:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7N33=GC=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qtu29-0001vn-8D
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:15:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab0035b0-6f74-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 20:15:38 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4515.namprd12.prod.outlook.com (2603:10b6:5:2a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 18:15:32 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::7364:56e9:5097:3562]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::7364:56e9:5097:3562%4]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 18:15:32 +0000
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
X-Inumbo-ID: ab0035b0-6f74-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvZYDQop1RcHR/8xcJZhvCbUsprz7z3D37Muy3vKLsq91D1be2I7qCD8tqq4ufeAWuwcaKln99NpcECIaoMpQHjKWTwuTZtXqgR2IIXktSqD1Te3o3quZ7BtEAeHJAarccaX7WPuezn6MMYUKD0oCCU5p7PlHgRiA/Y7HlDg2sRTsx1Gmp6xyvyPcGZGI5zL51cmaVwjiQOBtn2mqtyJC449zmVaJ4X24xDiECARUxj7ogVJqsvUUgSECJSARA7qfsPp8J8CZ7++zJ7E7kPi4QI3hK5kfbFGV75YcH9MNqThS7ccmY1YOYGx+Kb/RbCgdoUdRwXP7sou6AQO0TmV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmwKfZa/DtF6GybwdS3XlOJuFOpxQ+yAxfoJ4CmS64A=;
 b=Y+tRSKtuXCOXxvaS4SG1R0fFf6WfEjQaNpusQSwZA0dIiTYC5BEPpViYMNUFHu1dTih/f1LvS7VD4MCAEw4CxzMaDILp3sJiPzB6UZn63SG08MCHDl6uwgNcf9mUzD7+gF2e6NRQ+hBp1MlealdCOUh9b+gPH82j/hmeFG7DyKQMrmTsqj8GSlCluojgzzrJ6JIOnzf+EpgBp9Vvn+h1N/YcHzmZl1hev5NxQ27SkndFtcug7QrnfjbdEa1X+p/3TrAPROVIx0/NMPBTysJN5DE6gNqZXhIA1vY+EMQE2o9IaW8NDWAVtC/l3Q0KUvLi0pLBJApNO2UlCb7vOqCyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmwKfZa/DtF6GybwdS3XlOJuFOpxQ+yAxfoJ4CmS64A=;
 b=qQ68o6UvNjAlP3SZ8Q/L6ow/9chm7Hqlpsjs33YGbWkYt8vl2Qz28R62xOkbv0wuwNx/rFhom1mITtVwHmIzfalrs3tGEaMZEEgfuNLJHLTFLBUFICD+HmHe+K5d3BXEQ92lKuqfraMUxdEjxmWfhF/AfV391VHEMoWp0vmF/V4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4c01b3d0-3163-4379-9faf-c48229ea1d00@amd.com>
Date: Fri, 20 Oct 2023 19:15:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: QEMU features useful for Xen development?
Content-Language: en-GB
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
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
 <799b1754-7529-0538-1b5a-d94a362eb74d@amd.com> <87r0lp720d.fsf@linaro.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <87r0lp720d.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4515:EE_
X-MS-Office365-Filtering-Correlation-Id: 347d3cec-c72e-4ad2-ec81-08dbd1988c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BmvffvNXK8lqbNg4pWWebYGcXkQ+FYVcPoFhsHiriEj3xT3vwIlcCun8PaVPWW3EnjjG7OqPkTlhEdBY5+4gUV1buN0e4WbFsi0bNGWF41YbXsdmrFT/+X+6u5eg7bBS+y+Ls8kNmO9/q5EEUDUcWsMeCTA3jtsXBDGs2SmocuTziofL3vV0sHXTG/sXiYe/4KceUYPk4kohCpSwazstqH2HjcCGCp4xL19ptFOHJBDqtmxlQKtZNLn0Z/BNP8GQG1FTcEWuAoVsv3vczw8J1myYQOE3Mm+RannghziItyXSidZef8r1hopANRg2WxOhIXROEp0L9FVhxbqxAOGgWkEzdSJ2+ucmdtYxAgLz6phTaRfvs8kS97zyqmaJZ5yVp+rk6ghGy3byHwpMdlbmZMuIFAgHz8s+Y5yLOGCis/Rea7hRsGPn/B5f6+tqxFGCX7h3ry9CBkfjKc3q0YJDSeFjIoa9Njc1gGVZv3xUvkrrrG40yV/LSMteUu9vFFbgGz6uTP06/lL/qNfmbnuvR58n5fp5kQIk9r6trrMtH/YP2Bp9caQ8JZDDUH/X9bEKhfD8CJGa4nT56lckhnQzl+dgZedXCF9mJThAwTD6aMcSMtfxewndQXYPVjt2kFW/FokI9/PH8URgx8Mw5n31BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6916009)(31686004)(41300700001)(478600001)(66476007)(66946007)(66556008)(54906003)(5660300002)(6666004)(6506007)(6512007)(53546011)(38100700002)(7416002)(2906002)(2616005)(316002)(26005)(8936002)(8676002)(4326008)(66574015)(83380400001)(6486002)(966005)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjlxSWpSYlU0UGdZaDJBS29MK0tXWjJKNmNZQW9nYnpkMCswVDE3NUI5UUlv?=
 =?utf-8?B?OExzdGxvSSt2eFJLYUFuanVjY2JZa05UcnFUZVRIdVVsZWlTS2V2Q2c5TWpj?=
 =?utf-8?B?Z3FodEM5cStpWjVnUzZLMXpJMHRMZTFuNm1mOEJma1Y3NG14N1RqT0pQbzda?=
 =?utf-8?B?NkZ5YTltRzRFVEMvQnJlSjB3UjF2ek5Ea1lRM01DLzdNQlZhTWJya3Y5SlF3?=
 =?utf-8?B?Mlhtd0t6Q2JKdi9WTzZTY2VkN2dWamlYUEc3Ky91Qm1aZXpRL0swTWRlN3Zw?=
 =?utf-8?B?MEtqSUhaanZ4UWxrS2s0eGU1SXhlaGV6S0VVa1NEWHk2VUFLcXVKZ1hPbjh5?=
 =?utf-8?B?TXlPd1h0SWt0ejJ0aXFNRUM0cXluRUhxcG52STFwaWV2QzBHNlVaQ0FQVUlO?=
 =?utf-8?B?U1dXcmVpeEhTaWl1WlhtWkdTUnd2SHVGUWR0MnRxV2NqSEJMb0xILzZiZGkv?=
 =?utf-8?B?UzlFdzQ3WDQ1aGx5eE1CdnBMeGwxTjVMRk0xaXFzeGxsVHAvQTJwVHN0OEUz?=
 =?utf-8?B?TlhDTmlWRkxoQUl6OGpqWE9qY1hkdE9tSGV3TmVvRGczZlFXTFF3NlA3ZDNB?=
 =?utf-8?B?NW10bm1FUjMwVyt4Zy9Wb3k3a1gxM1lTZ09NZC85cEdzMHBrMGJyeTNXKzFJ?=
 =?utf-8?B?dHBVSXB5dlAvTHBoRmRzb2ZKb2RLMkkvLzF0QndoUjFFSC8rd2R1aUp1M1ZN?=
 =?utf-8?B?ZGRkMEZYcHVkbi9mNXVxeFNuUnFNYnVUb3J2a3F0UlJ5cGNTdDNFVmxUTjV4?=
 =?utf-8?B?U3BhdUMvQ0tNT2JKTXBZWCtEM2lJUTdVRGxva1lBZ2tVZ2hMTWowV0VGRDVG?=
 =?utf-8?B?Yk5WRGpzczZSSFBTemNZSEY4ckt3ZG5OckRJekt5QnkvVmlpWUw2bTVEM09k?=
 =?utf-8?B?OVJ4RDFHYVZEcUZKcFF0Z2E3QW93Mkw1OW00QjhkbUVIUnlHbnl6RHlDTFF3?=
 =?utf-8?B?NVlTbnBWVnErS2Y0QUVUb0RaVm9JckI0OG9ib2pnVHJoVXFueHNib3ZPUy9Y?=
 =?utf-8?B?ZTFwRnFBREk3ZHJCY2FWa3AwQjUwdEEySS91MC84Q3lIWEV0Q3dlL096N2Vr?=
 =?utf-8?B?akJxYlJYS0NHemZRWWxFOHowYmlFaFBoaTBEVFcwb2hSTG9FTkhzRzlpRXkv?=
 =?utf-8?B?Kzk4dmp5UkF4alVVUGpSMzZBNHlUeGc5b0gzb0VvblR0ZFNWSW9yYnYweno5?=
 =?utf-8?B?WHJlTEp0dW1FT1RZUjYwZzdnZmx6LzNNUVFCRE9ZN3NwMlZ0OGZNNm40SGdU?=
 =?utf-8?B?UlpBRzR6NWZaWkYycHdSclg0V214LzNselRiVE5ZV1EwWHQvbmlCcnlvV3Z5?=
 =?utf-8?B?VVlMbGdibkhsK0xjNExENUw1VnBkcU96UU4wVHcvbkY0ZVptaU1SblZWVVMy?=
 =?utf-8?B?dW44OFIyays0b2tiRi9aVmd5SkwrWTVSeFlXOXNud1JBNWlpZU5Nb3F0RHlV?=
 =?utf-8?B?Q0xtOEwrQmswUWdOYzBxYm5vczFjUnIxWGxKT0cxVmczT0Z5OGVleTErMFdp?=
 =?utf-8?B?SmhUYU1HM3U5YXF1WEp6V1FxbWtJNU5ma3B3Ry92MlYxaUQvQ0VXbWRIRE9R?=
 =?utf-8?B?SlNvVUJJRzF5eDRTVll0Q2Y0QnNzZVcxd01IMmtkNkJtK1MyYjg4Q1lldUxI?=
 =?utf-8?B?ZkpwSEkvTW9QeG9UeXpLVVdhTEJWT2dNV1ZiUEViZEtEbWJUbUFySHk4SGJm?=
 =?utf-8?B?cXpGMmtianJLbkVHN1lRRDBYYlgydDJrekdGWEc5QmpRS2pWajVKeDhteVV6?=
 =?utf-8?B?UjVFUmtNazZsdmxlR0c1dGhDZWlrWDNveFZZeTJCVWVMd1VmTjJxQ3N0YUIw?=
 =?utf-8?B?eW5jUGsvWkNydWx4YXlMci81UUlGNi9jUnVxZXg5ZWk2UlBnamJyTW1OQmFm?=
 =?utf-8?B?cDRvcWxqWkgvNTFuaktJYVNlUXJaYUtGYTUzaHcrWEtSenRyWlQ5L29GM0Nn?=
 =?utf-8?B?ZGl5V3NkOUhlTmQrSGRJNFdsZklKcWtNYmthMk83T0wwcE9Cb3krQ280UjVu?=
 =?utf-8?B?NCtkNUpybmwwV3BLZU51Z2NwczlzVytqU2p5bVBUQk56d1VrRlg2UE5CRGVs?=
 =?utf-8?B?ZGRvWVFWRi9CdjQrSURKSmc3MExNOVc2MDQwYytBTFlqYjQvbmwzTytFUExP?=
 =?utf-8?Q?5ca3TJc937oc9kJ4wd+WOfCCF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 347d3cec-c72e-4ad2-ec81-08dbd1988c4c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 18:15:32.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ueYigUsBmEJ4WCHzFKd6VfwsnYW+G6MitDSHR5j8kIMvWDGnbDYOPn/cRrmkjL6lS9hmr60tZ1D5nI1JSuIFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4515

Hi Alex,

On 20/10/2023 16:15, Alex Bennée wrote:
> Ayan Kumar Halder <ayankuma@amd.com> writes:
>
>> Hi Peter/Alex,
>>
>> Appreciate your help. :)
>>
>> On 31/08/2023 11:03, Peter Maydell wrote:
>>> CAUTION: This message has originated from an External Source. Please
>>> use proper judgment and caution when opening attachments, clicking
>>> links, or responding to this email.
>>>
>>>
>>> On Thu, 31 Aug 2023 at 10:53, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>>
>>>>> On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>>> As Xen is gaining R52 and R82 support, it would be great to be able to
>>>>>> use QEMU for development and testing there as well, but I don't think
>>>>>> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
>>>>>> need EL2 support in the GIC/timer for R52/R82 as well.
>>>>> We do actually have a Cortex-R52 model which at least in theory
>>>>> should include EL2 support, though as usual with newer QEMU
>>>>> stuff it quite likely has lurking bugs; I'm not sure how much
>>>>> testing it's had. Also there is currently no board model which
>>>>> will work with the Cortex-R52 so it's a bit tricky to use in practice.
>>>>> (What sort of board model would Xen want to use it with?)
>>>> We already model a bunch of the mps2/mps3 images so I'm assuming adding
>>>> the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
>>>> tweaking config values). The question is would it be a useful target for
>>>> Xen?
>>> All our MPS2/MPS3 boards are M-profile. That means we have the
>>> device models for all the interesting devices on the board, but
>>> it would be simpler to write the an536 board model separately.
>>> (In particular, the M-profile boards are wrappers around an
>>> "ARMSSE" sort-of-like-an-SoC component; there's no equivalent
>>> for the Cortex-R52.)
>>>
>>>>     https://developer.arm.com/documentation/dai0536/latest/
>> Yes, it will be helpful if Qemu can model this board. We have a
>> downstream port of Xen on R52 (upstreaming is in progress).
>>
>> So, we can test the Qemu model with Xen.
>>
>> Also if all works fine, we might consider adding this to the upstream
>> Xen CI docker.
> We wrote up whats required on our JIRA:
>
>    https://linaro.atlassian.net/browse/QEMU-598
>
> Given we have most of the bits already it shouldn't take long to build a
> model for it. However I want to draw every ones attention to the notes:
>
>    The real FPGA image does not have a global monitor that can support
>    LDREX/STREX between the two CPUs for accesses in the DDR4 RAM or BRAM.
>    This means that effectively guest software will only be able to use
>    one CPU (the local monitor within the CPU works fine). This
>    restriction won’t apply to the QEMU model, but is important to be
>    aware of if you’re writing guest software on the QEMU model that you
>    also want to be able to run on the FPGA board.
>
> However if that meets the requirements for Xen testing and no one tries
> to run SMP loads on real HW then I can try and find space on our roadmap
> to do it (rough guess 9.1 or 9.2?).

Yes, this meets the requirements for Xen testing.

It will be great to use Qemu for Xen testing.

Please keep me posted on this feature as I am plumbing the R52 bits in 
upstream Xen.

- Ayan

>

