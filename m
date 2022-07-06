Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC81567EA4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 08:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361786.591468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ybb-0001b2-PG; Wed, 06 Jul 2022 06:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361786.591468; Wed, 06 Jul 2022 06:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ybb-0001Yr-MT; Wed, 06 Jul 2022 06:33:47 +0000
Received: by outflank-mailman (input) for mailman id 361786;
 Wed, 06 Jul 2022 06:33:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8yba-0001Yi-A3
 for xen-devel@lists.xen.org; Wed, 06 Jul 2022 06:33:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 958490ab-fcf5-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 08:33:45 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU2PR04MB8647.eurprd04.prod.outlook.com (2603:10a6:10:2de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 06:33:42 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 06:33:42 +0000
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
X-Inumbo-ID: 958490ab-fcf5-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTOc4cD0eI9s5FUrabso8vUMpNAMVNE0owpULnCoaZB/jwq07+7Rw6gvq6VOEV7YxwB1Ybbb8IR+b6XVRSPTUwSV5ONjSWh8sRtyVfirmOGh2OL6yKtyAckVQwFXAlBgdnT6ejsDCU+bLZUv/Qg6tpBZMS/kUiIs8uBt5QllP/+dM5xZYaiO0HIJjq4k/MS07n89QFFdf5QMzA2EhRuWb1ZozXL6W64gfef+Y6JcrbjxOiCVTrcqGYSnvvjn3IHJYcIUQY+Fh+ovAuN/sWJ4ThCs04f1Ii0icpCkpZYG0foCFDgV4iSTqrPN8MPN3bEfEvwCjsMY/GTvGMX9MT2psQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INVfxvlkXcwzrlGO3ailGoI45hIptv/7gcrFGKyVzOM=;
 b=LYgRf8mMQFd7AaovfmdjwdKhzXY3wAnb+HPVckv9D3YDyZmar9amnC50Wih///99+zSFjqpTGUM9BxcmFWqVUvzxoNmPYZcB6YWfWTsvxOv1mMlxKW+9JTH/zE4qAIP9rriNqOl3WdFN6Kf23XKmGOhM3FzcMQ7ANRnNkngoPUVxWkzr2mm1J+QNsGHglTitGcScc1X6K5PThn1mW/FUptqu+xsiipRH2FWZaJmUEpXmGbAhiVTW8hkSOMkpo2qA7aagxXB6gc8m7zrY6J106zEg8bb/kVGEU25UVuBD8wNy4WebH0zNdUD5NXrMjpPnuCtitrLbzwzxaRaC18lTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INVfxvlkXcwzrlGO3ailGoI45hIptv/7gcrFGKyVzOM=;
 b=Jbm1lAjHTakUaVeBUQKL3PrJU/LRj+8QDUeg7l45MLXwF2eAEIpwxvXeYzSZk0IO0JEz/81gNavz9jUfCD2HTDEuDxhWzNIxOydm0565/2AZHKoA5E7mQjmGZNaD91B+7XmDKHEsu8E2HivdlMC01xap3cw+9w9J9wb5/qw/LQh4obzDkfBSEaNyoLxNAIBNbauoL3Q2pnZ+09tD+dwKgZ5CKj0Vmy/ezIoVgUWB5LgxPdpiE9e4OHTo6oWuesz5Tmc91jVXy2ShpBj0zqDRy74x2Jbv1XgtslBaddi18bwisL+dK+ZoAO1EC9lOE6nDO4kvBTJXHVFEU0w2kZymqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca4e8b79-c831-8c09-6398-b76852dfde53@suse.com>
Date: Wed, 6 Jul 2022 08:33:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
Cc: xen-devel <xen-devel@lists.xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local>
 <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local>
 <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
 <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
 <CAKhsbWZOB4NscA04Ez4e0q1LUHWjH1ugUdY073hoBYUqOEGxeg@mail.gmail.com>
 <YsMP1+6/Txj5s7q/@MacBook-Air-de-Roger.local>
 <CAKhsbWZmoC3JzZAZ5T1R0aUif3joJq-oncaYVpMcPZ0A1OXxJg@mail.gmail.com>
 <def66a62-e6d5-38bd-2e78-9ad9a7eff14e@suse.com>
 <CAKhsbWYROUgYti7UE3Of25wKw4uE84UPrC5DkkSLrzR5fS1Cgg@mail.gmail.com>
 <f689313d-cd8e-80b9-d2ea-7120610a487a@suse.com>
 <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWYytY8_3DTqpq4u+SvywuDSK5dgy8dzm1T3TFdP5MJaDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91928dd3-e2cb-421b-dfbb-08da5f197866
X-MS-TrafficTypeDiagnostic: DU2PR04MB8647:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TMrvHklb/1Tt5auFBRdcWSDPvCaa0ECElScqJKOukMheQwZ99Z1A0mYBtdLpPbnno90/Fyn1ZvCCVfNlc+mwrUjnK60PVR8bATb1/cR8BoBZuoCmKzF/sX/FBkAdijFW11G30IUznwBoi0JxM5onIUe/evIwnp1bzZGe+Vlv1QdVfdS+HA39+19Po2GWLyfEpUxeqr6/KLMyyKad8jHNocaA3TJDwIVX8fAgd1+PEIeA5cUPhZ/m2H8xqrpOhsFee/47UMkGBeDdJgZODs+stuHf2iLkYQ2fU3zeO1aBJkuq32jW3Nsg/km4Mq/ImOZVF5O78/k6DABnI6C5Tc+CImHzifB8oHMJ4yIIPQ/YM8Tz4B3fojlnSiKSZzzAw9q2LOYNAXBc9hSOPtmnW/2YD5++PuHF9dDGbqU9A3bGA+AW5/iovdm3zWAvAMc8plVU/+tNRgx/pOMA4et4gsMdEWKoP4xL9Bg1ZqpPRFfxUryeSCuhaVyPQCtsnsvdIdd9BCIntjvsA0yJKzlQub+X1s51SNWtESuq4BLj/MfVkflu79qzQbdYhpYwhG24Ckr5v6tljcpMHGs+kevZzj3bPyFEPo7YHvc2ixWtV3bZmLYWHBQf7mGXppixdSdPU9vRVSoJ+4kMs/hTStj3AJ+E9VpnTga/t4rr6HRePyTOT0txBs1VbV99AFqZM7lxFF6FJYqLw7B2abyctOn4U7uOQWcoK4swwTa84Udm23aDN6N1Jf83WucMEB8OkVAC6xxeBhJkTPo4KgX8cmpDs6KIEDxPB+W6yvtH0vOs5e9qiNlypkHqGkEYWG9dbfN5OUzXlziPy+L0zdK2gwkEiYuwKv3ExYgp+JejvsFhLdDTS/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(396003)(366004)(136003)(6506007)(31686004)(36756003)(6916009)(54906003)(31696002)(53546011)(86362001)(38100700002)(316002)(8676002)(2906002)(4326008)(83380400001)(41300700001)(66476007)(6486002)(5660300002)(66556008)(6512007)(26005)(66946007)(186003)(8936002)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDV1bTFwVy9SazlBZldvVkd5a2pHYTcwUmNwdkpIQi92Y0UwQkRWeHZxRHow?=
 =?utf-8?B?VXBLZS9sUERIZUhNbkFxMmxJMStCR3F0WkwrWG1wZDRTUDl5Z0R4MHBER2Fy?=
 =?utf-8?B?cDZvY0tjc2VEVCtVay9lcXpURzlGMmZlMHB5TVRXelVQVkgvdTFIeGdHcW0z?=
 =?utf-8?B?TGd2QWZKNDVPdWNiNkxxc3loV2d1eGQwdlF0NTJyMW5nS2hJbExZcHhlTytR?=
 =?utf-8?B?Wm1jL0k2elJOaEZmSzlORmk4ZTBENUN2bHNaOXdsVDBpRWY1NzJmcjc2b0ps?=
 =?utf-8?B?TXBnRkZpUFRvTW1yKzJ0b1o5TFlrNCtkR2Z0TGhCMkRvWmVxaTR5STlreGh4?=
 =?utf-8?B?cklmS09jUnQ5QVRyL2FVMitKcDU0TkhINE94TnB1K2l0WTZLZXJPNG9IMmlS?=
 =?utf-8?B?SDRRbVFIMUx1bFVjbEJ4M1VFSjBBOVhUYVhLMUdsVDQ1b0VYaXZ2SVh2NUFR?=
 =?utf-8?B?cEVoUVVRaG5kUkhDSFpwbVQzdlNWYzRJQ2hKR2J6eGxQMVBHWHpkWXlZMzJN?=
 =?utf-8?B?N3JIb0szajM1UFNZbnJLNm4wM3paWjRZODkxaTRmRENXbFdIWnRjaGY3SUFy?=
 =?utf-8?B?bEpxazg1Tjl6U2xVRTgxTlBXbmNBbnVNc0JVYzUveGx5d21UcHdvRC9jMGhY?=
 =?utf-8?B?dXcwL1RwMVdHRi9SOUUwVU40ajVUd0k0NEs2YVhFc1ZraEZKNFQ4d2wwWGxJ?=
 =?utf-8?B?bnlvb25kOWVneG5aMlJrK2pWdnRjVnBsVHZiSnJWdmdhQm9OL01vQTg2UXo1?=
 =?utf-8?B?KzJmLzJpWFkwaGQybUVjOUJxWTQ1djM1Nk9Yc0wxaEorT3dqelZzZDZ1aEgw?=
 =?utf-8?B?a3VNb2dsM0hXbkE2L25XNmc5WnN3OTV3dVFjMzVWMDNINUhlTitrS2VDL3Vm?=
 =?utf-8?B?dHJiTXd6L2lqM2p6UmlyNXRKQXdkaCsxOUVMZ05ZZUIrUDEyTWtCTFVYTTdl?=
 =?utf-8?B?TTZaQ0ROdVNtZ0YrWC9aNlpleE1IajRNUHovZ0IrV0ZqRmdEdmh2cFlzU3kx?=
 =?utf-8?B?TENvVUVSQ1JCczRKYURseDYzLzRsdzNGa3hxeWZrOGJOVStrTmlBRTE0K2Rk?=
 =?utf-8?B?YU9YMmx3UTdUcEE4R0M5Q1gvajN5WUMweWU2SGgwUG8vNnNoUTdINFB3UEZC?=
 =?utf-8?B?QW5tcmVsZXNaaUVkTkttUU96Qi9ZM1c5ZW9pRXozVWxGU3BUczhiSDU1R3lv?=
 =?utf-8?B?ZGl1MFpSL0lIN2I5V0RuNGlpTERWajRtUzR3RGFYQlF2Y0p5Sm9tazMvNVZM?=
 =?utf-8?B?ejBqeUt6SW9rMURkbGpQakJMQkpWc2s5K0F2VGt2T0ZRRHpPWTQ4OVd1U2lS?=
 =?utf-8?B?dEpCRUFmYm8vS3VUK01jQko0YUlMekozcmJCMmN2aklsV1RFTHFVM2JiTVFu?=
 =?utf-8?B?UlY2TjdSRU0wVG9YV1M2RG1qZFNNUjJ5SEN1amhTc3ArMXoxUDl2QzJPdkZm?=
 =?utf-8?B?aHJyOVhYckRDakp3SDBYdGpRaFAxSUVHNWMycnF6a0Jjdk1HQzBZMENQcUtp?=
 =?utf-8?B?UVllK3JMVnVGcXUxTlFqa2FOQ2dSamdOMDJEeGpmc2hLMDFOZnBJbVByZkZk?=
 =?utf-8?B?Z3VtSmZncVVmYy91MVkwekkzcFR3RWpjRENEZDBBT1NVUHpYcFozdElRTXZ0?=
 =?utf-8?B?NXlEdXdWaytpUkd6NFZsN2xLMU1KWTlRM1dlUlk1KzdQSGtBL1ppZWdkQUkr?=
 =?utf-8?B?TXIwbEVZZTR1SCtsU012bGRlMDVORlQ0dmZBVSs0WFZaSm1YOVRuMXl4QW52?=
 =?utf-8?B?OEt3QlhicEcxZm4wRUZvU0Q0WVg0SnpVbzRLbldyRlE2TkhvMnZOMXhJUWFu?=
 =?utf-8?B?K3NYT24wWnZsZER3cUx3blMvc0Q0MW5WYmtBb0l4YUdyczJOb2tDRjBsZUww?=
 =?utf-8?B?U2ZrOUREMjdJbEZiUnZuYUl4ei9ncWFuaWpwUDBZME1lQ3VVQitFQkhDUlRw?=
 =?utf-8?B?YnBEZEFrSkpGUzlIb1VXa1Z3cG5mUUZNcnYrV1pXcFdxc1lBRmJmN3dVNEZv?=
 =?utf-8?B?S1kxaGNPMUVkMUQ0cW9NU2FSSy85am1OcVZyNG1yWHJjeDR2dllSYjJNRFUv?=
 =?utf-8?B?ai9sRFZuOVhvaVlaUHlQMHFLM2xKR3VmdEJpaE1WSWVBTlkwenhUdmtya3Jx?=
 =?utf-8?Q?PzeJshTzRG4UJvUkqWt5Lpu3q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91928dd3-e2cb-421b-dfbb-08da5f197866
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 06:33:42.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMKd1EQsjwpEVkNup++SRobyA/scpPaufxbfsWFjrmsV5yw+5T6Hf3VAdWiSw3o51jnRfxMISnhYrd8OjTur/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8647

On 06.07.2022 08:25, G.R. wrote:
> On Tue, Jul 5, 2022 at 7:59 PM Jan Beulich <jbeulich@suse.com> wrote:
>> Nothing useful in there. Yet independent of that I guess we need to
>> separate the issues you're seeing. Otherwise it'll be impossible to
>> know what piece of data belongs where.
> Yep, I think I'm seeing several different issues here:
> 1. The FLR related DPC / AER message seen on the 1st attempt only when
> pciback tries to seize and release the SN570
>     - Later-on pciback operations appear just fine.
> 2. MSI-X preparation failure message that shows up each time the SN570
> is seized by pciback or when it's passed to domU.
> 3. XEN tries to map BAR from two devices to the same page
> 4. The "write-back to unknown field" message in QEMU log that goes
> away with permissive=1 passthrough config.
> 5. The "irq 16: nobody cared" message shows up *sometimes* in a
> pattern that I haven't figured out  (See attached)
> 6. The FreeBSD domU sees the device but fails to use it because low
> level commands sent to it are aborted.
> 7. The device does not return to the pci-assignable-list when the domU
> it was assigned shuts-down. (See attached)
> 
> #3 appears to be a known issue that could be worked around with
> patches from the list.
> I suspect #1 may have something to do with the device itself. It's
> still not clear if it's deadly or just annoying.
> I was able to update the firmware to the latest version and confirmed
> that the new firmware didn't make any noticeable difference.
> 
> I suspect issue #2, #4, #5, #6, #7 may be related, and the
> pass-through was not completely successful...
> 
> Should I expect a debug build of XEN hypervisor to give better
> diagnose messages, without the debug patch that Roger mentioned?

Well, "expect" is perhaps too much to say, but with problems like
yours (and even more so with multiple ones) using a debug
hypervisor (or kernel, if there such a build mode existed) is imo
always a good idea. As is using as up-to-date a version as
possible.

Jan

