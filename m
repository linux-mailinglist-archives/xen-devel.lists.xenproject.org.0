Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4F761013E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 21:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431184.683869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo8Io-0005Id-Ex; Thu, 27 Oct 2022 19:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431184.683869; Thu, 27 Oct 2022 19:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo8Io-0005FX-Bt; Thu, 27 Oct 2022 19:12:30 +0000
Received: by outflank-mailman (input) for mailman id 431184;
 Thu, 27 Oct 2022 19:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oo8Im-0005FQ-Du
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 19:12:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b08f30f-562b-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 21:12:27 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 19:12:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 19:12:22 +0000
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
X-Inumbo-ID: 4b08f30f-562b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHds+dUwuccWtCj37Z1OdMZayIrOte/0kHUxMwQtwmyJOpt3N2mZHWnuVaz6sNytChAWZPX3PTNw1luaKf6QF8AYl1LOXgVaBv/3Jsuqb9++vMQ8vfJlBWwu/bnakC+duo47thNOwJy6PusWQw4aVy4K6AE5VZHegJazbIUgxtpNdzGdZcDzHuIltYue150A/ZaDIU67SpVpzBmQsF+BMydf3YPIBVIPQoIK8j+zZcoDhtHKfmcIxUT83ICRTnh5I8Ty1/1ImNuj7C8bobyzJD+aie69gpSPnphce9I6Bh+FRjTn6tYycdgwJFkwYSxF9S89bLHOF1Kx4TJ7HJVH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY3lAEWtu5RtLdURwFBuSeggbt985FW2mT1VEk8w7p8=;
 b=Yoqyv4VYpcb04vA3Xv+T7umzlx+Or9L1yn15HMFxQLrTn9nGv0uSJIQypBquEse7o52q0O5NB7uR1W09AZMt7nZePQ4jvb3D1zagCBj7ectzfujTXAxlBUlzPpAhV3OBsBFchEdS5WfysNme4zz0tqG3MddNRDulaTIeONvRdz+vsNSw+7D+eooUyfUe4gfNUBrFF71n2iC7K9YONGV9Ys05UFLzpgHVKbggfEIfgElvydaphPCsB6vPyNBFGI2JSnZ5R0U5uto6u4xeyme9HslJxCMWmAxxf/UUAbCw6RwfHKILkQ1htFdxj4FYOrq3otR9F8zW4TjBTL40YagmOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AY3lAEWtu5RtLdURwFBuSeggbt985FW2mT1VEk8w7p8=;
 b=Ik5iYj3P1jeULV3Sg1qFK57nCZrcDm1B/1yVc95YSOYA+R6X4Kz/YUDLr3DpeaPbeNgDRpMVcGFFA4J+6eMkd/rLKJmBczVVcQD2xDvLSiA6tU1+cSQKLaYbQYzlbfZOMrQUI730WTz/duQRKsvwMlV05Ey6vz1OT/6jSkuNhz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6f6e2f21-b138-0b89-8de3-58c86aa9f44f@amd.com>
Date: Thu, 27 Oct 2022 20:12:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: Julien Grall <julien@xen.org>, Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 Henry.Wang@arm.com
References: <20221026183004.7293-1-ayankuma@amd.com>
 <20221027104231.77c5cd28@donnerap.cambridge.arm.com>
 <da52b703-5de7-1673-f6a1-d6541f59f5cd@amd.com>
 <d9779975-9b47-bc3f-7cb0-508165ebc707@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <d9779975-9b47-bc3f-7cb0-508165ebc707@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 686aeb09-d98b-44c7-91e3-08dab84f2d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Jd5yS4Bi5YBgmgPVZ05rjaZzcfA4LM1iHttAjvfzxTXr8uXNLXOyBuo1SH0Nzkvqs/dP5+4XlbYXwcY3a/zdlEg5mKZTjnk9ZuMQugNG45g7fopQWKJUjGJLdv+9KS2cP0nLtkVvXehyJc0SPgZWY07eBqlucVJPXIShMc74PU/bbGU+ZR3+HheOvC5WsGSmfpBTo2XRPEBTdqL4EiwA3aow6zFUW6YBPwjvilNDwj75Eyr5ZZmtr10/ZZ3HH0kx5AHn8IjzWLxZqTG0SIi6rPf+NOaw+Jjm9wwwVj1sZHAHuzZ1VPp5gHoPD7Dyq9w1+PvW31OV8QtjZYqEhQTQkLqubS4bBV70w+GF+bGnt66lCBqQzHVXfWoo+OBRKNTB9RnhYDSCTsqo5oRRJGXDAagyuai1//DuxUKL6v8G+z6WNwyc17IzSB+s2CjJBbZwE9z5YgJJbqXgBk9rHzlZpMfdiCnABpH5i/xkMLf4iP0Tp3MgeounONI7cYb93radwr610tuoxnlvrrDhADdyejgOij0vd0pn1aNaKbXu/mnFkXKIon/DroE5uA8TxqT5ZF6W6caqbiJmMmNetLpT9jO9Tbk//Bq+a/CG/t/N8eev6cpliTnro1Z/rkuQ1/hb+2a+zoJQ20MBGHRIcbAWqgPMVvLLwN0JZ1R1l4wWjihL+tfGB6uL69MlpXjNR6JdOtUo64gAMRHJSB16rJQgumonquq0lgMPAVLKlfGBrCK/nbvRFYYssnS1PFZ/pGM0zv7dpNF+pcuvwlmutwzhZjsZ/XYyJhVFuxtTSHOzs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199015)(5660300002)(8936002)(26005)(36756003)(6512007)(83380400001)(38100700002)(41300700001)(2616005)(186003)(2906002)(6486002)(478600001)(6666004)(31686004)(110136005)(316002)(66556008)(66476007)(53546011)(6506007)(4326008)(31696002)(66946007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRYWGM5K1VZY2VYa3ljV3JnZElNc3p6by9CMUlCT1ZlUEJmenZuMXNnaFkz?=
 =?utf-8?B?UnliRjBIVWRjL29VUXZLcFVubkRzM1VqRHdqOWV4Q2p1Vk1OeUl6MnorMEpW?=
 =?utf-8?B?Z1lhZm9mVlZkU0lNb3o4RExWSjNaaG1nd29xTWQzZDU3NGdCQ2dnNzVXOU93?=
 =?utf-8?B?WlhHWUYvckNLd3RYUnlTYnFhbVNpMFZ6d29DbWRNU3RCZ0YvNU0zdVk4NGJ5?=
 =?utf-8?B?aVJIeHVQdEljWHRFR2dVMGpleVZPdDg4ODVMaUdVejgvNjZLYTBlNkVORFNt?=
 =?utf-8?B?Wjl6UEVHaDdiVGhQbUpQaFhuTHg5ZEFvenZQbzk3Uk1PWjhURE55a2Z2SFh1?=
 =?utf-8?B?SURiZzBOckpxMGFTRDQ1QzlzR1RTcW80Uzhja2hrSmROUkRjeWtNOHFiWTAw?=
 =?utf-8?B?U2F1M1YwaDgvRHZyR0I0UnZPSUIwSld6d1RmM2ZjMUVOVWFQT09ZanBCSVRx?=
 =?utf-8?B?RFhCVXhiN2JvQmhUaFJCTmtTVXgwNHZweEt6bjZKaDREK1ZFbjJRYVBRREdl?=
 =?utf-8?B?OFN0ZGltejZrcWoyMXZwYUlUdEIxUmV6dXZYL3JReGNZcjRLUzkvT3hxNGpD?=
 =?utf-8?B?MEl3VEF5ZGxGbHRVZUp3QzZjWUxoNUthSTFUOThtaEFrUFByZ3BReU1yL1No?=
 =?utf-8?B?R0tLUjBrZlk2QjFLQVQxdEsyNXp3M0ZGRVk2Ym43eStlTlRLSUQ0Qmdsdktw?=
 =?utf-8?B?Y3VOdnFLampHU2xyamFNZGVjY2VsUzZGcExtRUlGd0JyOEFNVW92bDF1V2VR?=
 =?utf-8?B?ZzBwaStZUVJueEpyQmU4ZDJrVzIyMkx5RVVJWVcvMmFBVmlpY0lUODRaczcw?=
 =?utf-8?B?RzVENVJEMGFjQ0ZUQWhUdTl3VHBYazhSdnlCOFhFdklTU3JVZUdkN205em9Q?=
 =?utf-8?B?M2FlSHF1MUlXYUl5RlhmeWcrdTRZd3JkK3E4YU1jRHppdlpSRnFMR1VsVmZC?=
 =?utf-8?B?ZjNlNDNqR3RwZ3N0cGV3V0pyVjdHWlFlbVdpK0lkMlgyeHdaWEpxazdSc1F2?=
 =?utf-8?B?ODlMVW9IbEdudFV0SGZvK1BPZHlYSTBMS3JGbXVFaTRPaEdGaW1GQ2phRDZj?=
 =?utf-8?B?dlR6UkJsOEdwN054UTVoVytDWGt6QndTcUNzZEgzOURaVWpWNjRJd2ZSaXJh?=
 =?utf-8?B?Yy8zZ1lIcE5Qc1VKS3FOUnVFV2twSitPQXVFeWFQREJlb2ZWVENrdzRXaUdi?=
 =?utf-8?B?cDZnMFppaGRnbDRsSFdaR3NiZytMWGorNFlZWjFtNDFqMXg0cnZLT0dDSGwy?=
 =?utf-8?B?eUU1bEZDU0VoUjdlclR2aHptNzkzTDdaMUpldkx4WjAxWGdBYmdVZDlpZEVr?=
 =?utf-8?B?dG1FQUtUM0RGVzc0eU5JeXRwRXRTN3NTNnBwZ2grZDlaSEVsdWlVOHFHQU15?=
 =?utf-8?B?ZVhkUmU3ZVFkRTlKK2dyTllaWGFvWDA5UEFwTXZvWTIrUVdFK1BDVGZvb05I?=
 =?utf-8?B?MXR6SDluZ0hWM2cycTRMQjhnM2NoWmFnZkMrZGFRMDhsNnVWV29QSEkzc0pV?=
 =?utf-8?B?V1F5bnJvTUNtbFQ5bWZ3NXAvajhvUExSa3NrSkxFYzkxWVZ4Y3RlbTltTklv?=
 =?utf-8?B?eEJyOG1wNDYxblhmYkpqS1V3WU9pcTZsMG1FTEM3eVQrWTA5VFZWdmpvK0Ji?=
 =?utf-8?B?YVlKa2dBM2tGWU5VT1JoS2hNMzkwNmlFdEZoR2JpeW5BcDlCTFBXZi8rVzha?=
 =?utf-8?B?Q0hXRG55VEZNU1d4TklPUkNPcTNYaGxWN0M2ZTV4MXc4bndiOUxjUUxuQWlk?=
 =?utf-8?B?WDFMajZRK05SMG9OVmVjUnQxOWh3YVd6RGlVNFE0R2NrOTY2V3YwaVR2OG40?=
 =?utf-8?B?WVZ1T1hLbXBpNStSZnd2WkVUMVU2LzJYakpMZE9PcUxoSHRjZnFxbFNERFRr?=
 =?utf-8?B?UDdJbTFSMmpDaUtkV2g3TTM5Z0cva29saTRGd2N6STZDQnRVQTQrZGJWYjhS?=
 =?utf-8?B?VmNiclpyUGJKcnJyU0J4bE9FMXhhK1NsVlFLUjJvamd1b2tpTUowSHpFRzZ6?=
 =?utf-8?B?aWJxdXp3djBXK21nVDFHZzBsV0ZnL3VMdnlJNlE0ZzZ4cFlCUVJBcWZ0VmFr?=
 =?utf-8?B?alVxc0FvRUtvM2hqSUtCTERGWWt2eVQ2dFRLcHh2UWdpcmJyUWZTeFpZaW5x?=
 =?utf-8?Q?z5bHiVyabdsRLvyU98x7vRZ5o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686aeb09-d98b-44c7-91e3-08dab84f2d15
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:12:22.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIFDcAMNOI12ckts6FiaE65mbSeteKfRjPOE4ye5ieZfm66e12mIEqRaxmrNK2/gnCV0fXE2ogUp6ec89ET4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022


On 27/10/2022 17:13, Julien Grall wrote:
>
>
> On 27/10/2022 16:40, Ayan Kumar Halder wrote:
>>
>> On 27/10/2022 10:44, Andre Przywara wrote:
>>> On Wed, 26 Oct 2022 19:30:04 +0100
>>> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>
>>> Hi,
>>
>> Hi Andre,
>
> Hi,

Hi Julien/Andre,

>
>> I need a clarification.
>
> I am not Andre but will answer :).
>
> [...]
>
>>>>           /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
>>>>           if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
>>>>           {
>>>> -            reg = v->arch.vgic.rdist_pendbase;
>>>> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
>>>>               vreg_reg64_update(&reg, r, info);
>>>>               reg = sanitize_pendbaser(reg);
>>>> -            v->arch.vgic.rdist_pendbase = reg;
>>>> + write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>>>>           }
>>>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
>>
>> Shouldn't this be "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" ?
>
> Good catch. Yes it does. The current code will clear DAIF (even if 
> irqsave touch only I). The I/O emulation is done with interrupts 
> enabled usually, so now they are going to be unhandled until 
> leave_hypervisor_to_guest().
>
> This could be a "very" long time. Thankfully ITS is experimental, 
> otherwise I would have considered this a potential security issue.
>
> Can you send a separate patch for that?

Thanks for confirming. I have now sent a patch to address this.

- Ayan

>
> Cheers,
>

