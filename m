Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1337805532
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 13:51:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647818.1011473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUtJ-00029K-5e; Tue, 05 Dec 2023 12:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647818.1011473; Tue, 05 Dec 2023 12:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAUtJ-00027T-2t; Tue, 05 Dec 2023 12:51:09 +0000
Received: by outflank-mailman (input) for mailman id 647818;
 Tue, 05 Dec 2023 12:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iwiP=HQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rAUtI-00027L-3i
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 12:51:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f35d75fb-936c-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 13:51:05 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 12:51:00 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 12:50:59 +0000
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
X-Inumbo-ID: f35d75fb-936c-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6IHlrgSy9a1MwSDvm5hqjkO2BSF156Lc074zx6F6bAwg+9jDOTUgaACdDWqxcUJ9LKXDN4GbmOmU3arq+l7Drcr55BV6Ckh+UhKH52Z7DiCL3jgUwGOQXTHthoVHukSICOnCyy/dHPPcNkbeGsXSNU1PhTVnFi2+Q0GVHlw2uheb1vPaHT7ODuB0PETcwR7P6Uj/2RFH68SNLGTHFX7GubuN167xAORtY1kVXBJxIGMayFaJvAi/hHsaciSgvPHeSixXpf7VTt7lfpCxNsHLkvrokfs5yz1Cs6EJHVX7Ow7mG5MxLatazsQ9FdDItaQQCsWmvCUmBpp00QVRsLLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRruaQ6Sd30IO8DwWloQV6HUOYIrN6z/l1RBijTxObc=;
 b=MElHGqKcq3L2QvzpDesiS+969bJphJyHktiYNQ1snfVVpBuE5cykokG/d8Q95SV3h2j+zEUlyTLDxuT7wRz/W3CTYfxNwqdmAqIHKOII0NjoydVBwaQgNU0DaQ4ttZuK7qiwt8vL+gSo6wHoZ96FObF1VlK0Nmmu5rB1GAQq1v+wD3GpRzpI+ePo+fBQFywZRbIp7S9XU0K/LAepAT6IbnBqs1OBa5XX6aUvmPgTOiXKhXfnIgt/ilfcGvrPBR/I+LRx0p5v1BONi9lKV5p2oNdKo9MfoX9XcmnnZdTw+6r7s+hVR+4pWOJO4/IkPxA1NiLoW/jLXzlOjXUm1r1eCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRruaQ6Sd30IO8DwWloQV6HUOYIrN6z/l1RBijTxObc=;
 b=OL+SCTq8UosAp4rJeQSgczJrCxiLZlfVI4hh8JuRtsM7qIX/aTh005BD5IZT7uxdJ9HJYJ8AzxmR/9cPpaVQM3bhbRHNRNrfYLrF2BEXaWxt3HOHLHDi8lCMkAo0MU0/AnIWzeKDfVHoTCTtmFgEPjw8YfamjO9mctJBDJzvOLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
Date: Tue, 5 Dec 2023 12:50:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 stefano.stabellini@amd.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
 <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
 <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
 <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
 <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0312.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::25) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 3344bc55-8230-4551-1ef9-08dbf590d464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nAreizocERUUPTT9cmYdPwJ72DQex43yTh6bwp+r/jSI332LiK5G5FTBb17UjjI6EeiX22EMbwXyo4DYYvx9XMevEupIBtSlmP49ThWWh2BTjxunQ/MUdH+e6H6MG9DurzcBB5ItJRqLCq7yj9KfL6JU1DvLBxKvd0wYna/Mko+tfS3DSKpqGcXZ23cnKLFhYRyEdrLO1iI3vPg7qjFIoWm7172/sSP9off9wCCn9szbeNnKL3nwCtec/I7I0M+O1JiamlRO1EKggnxWrG1E/v1CK/N6EZHaq9EyDGspN5RSnvEHS0Xip46nyDV9a+9R+1QF9lZsUkhMHGR+44rDesbX1A0aNpv4f3jqU8ubfVVmIsOKWtAx3ggS+TPb0bMx2PnGSCl/Y0OxHIdltMAcchSpy/JkigbxuoYJhQ6HMfMl2a4o9tGQb157lJHJGDBbcHW3tiM0g8nijEefpC+T2CPh9L90GJ7+4ZeAZyxZb6DhSAvxU1LntfMhLCZhJDw51ZC9kf0POcAKHLzTQKNRB7v8iTI/vlt9yZkgW7dGtz0TjZsA7wKaNJybUv5F5GdVHz+jJ6a6cPdT6MK6FG2n1n1kLGCrTO5NEyGg1HFRaUpzyxJhl16GPRkHHg75z4h50xahHDKwOrrbNE3TZ0DhHtsXF//qHamJBqp7XJvuUuAoJI95WzRs/MQTranYWOmj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(66476007)(110136005)(66946007)(316002)(66556008)(478600001)(6486002)(6666004)(5660300002)(41300700001)(36756003)(2906002)(31696002)(8676002)(4326008)(8936002)(2616005)(38100700002)(83380400001)(26005)(53546011)(6506007)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTlPUzV1ZVczTTJIUUsrbW8yb3JpeXlqUzdLL096ckV4MWpOUzEwL2pXUFh1?=
 =?utf-8?B?Wmkrd3YvS2E5a2t4UEtZbnI3VkpkNWRTZFJYTkNRTmhHU0JtTC8yUWRnV25o?=
 =?utf-8?B?SVpDeVpvTG1nM1cwTTFVU3hhYllKSlVKQllQVWk4Kzl4RnRCQmNQNFcwMmJt?=
 =?utf-8?B?TVM2RitvUTY3NzViUzlIVytFMTdUNjZzMVZ0eDFudkhVako2aTZ3M1E4c2o5?=
 =?utf-8?B?Nmp1aXFoMWxpdU9oSHNsT3hmdUk3Wkg1U2x2VHZHODRXVEEzVkcvT0gycUx0?=
 =?utf-8?B?L2NFWTFDdjBHbEc4MUQrWVV6Um8rNDJ4RWRnZmVCK3JqWC8vZXJ6MkFqWi9V?=
 =?utf-8?B?RS9wWWhNdjJUbmtRSG1mZThMSjJPbzV4dGRRRExMbWlaTGQ1ZDl4V2VjY3ZM?=
 =?utf-8?B?T3pOM2RFQTIrVUh2bUNUa2UxNU85Y2dGSWhXcU1pUjZwcWIzUHdGcGlzWmhs?=
 =?utf-8?B?RENtYXN3bUUwWHpBVHpUbWhPSlRrTWRZTHdHK2hvTXFYUWIxZ3k0QlBEeXQ2?=
 =?utf-8?B?dGdNUFozK1ZNSXEyV0VWK3NGYk9YVm9ENlNRWVRyZTVnbWxFRkxHRm1kMjhS?=
 =?utf-8?B?YzdVY09wb2RYdEJFOVM3SytGRHdlaFlrUDAwaGkvaG9SeFhvVlhUbGFjcXZJ?=
 =?utf-8?B?Y3VmdHBoMnQyYkFIZmpuTEhWclRjNjRGMjVzdGRMUWtvWkg1YXV0dmdmcE5t?=
 =?utf-8?B?aHhOVFl5Sjdvbm9JZUlPcWlaemVMaXd4UFM4bzZ3MWozSFZiTVVTQTRJQVAw?=
 =?utf-8?B?dDZabDZHMWwrUzhLemtxY0hieXI0QkJGaS9oUm1ReldPQWN4UHNSc2p4YlFa?=
 =?utf-8?B?OW93VVY3aXFGUDBySDZVazZVR1UyUW1JZDBpbWlyUUc2cllXWjhiUjVyQmta?=
 =?utf-8?B?TjRLMDNNUUcxQjgxUHJFdXhIRUczRGFseFNhQkhmNWQvZS96SWRZMHdzQmxm?=
 =?utf-8?B?REVuQUlLYWVYUXR2SzR0T0wvT2lLcU16SzdFejIvUTZPdVQ2SW1YSnZibXNs?=
 =?utf-8?B?amtQZ21wNmdkZ2ZzQitkVEVEUGZYYUMrL1RYNVBERTNzcE92S2t0Vy80eElS?=
 =?utf-8?B?alJGYVZqSzl1SXgwM0tiOFNUU0hpSkJYdE1taVlEaFFsZzBsd3JvbGpVcVJs?=
 =?utf-8?B?NmNObllNVEFvNmJDZmFSbUQvQkUzTUVmZ043aE55bEx2SkY1L2h4MEswQWRq?=
 =?utf-8?B?THVaY0tOdzVmZTA4OUk5alpXOGFxbjFnK0tWRzVLN3llaWsrbnUvNkJ6dWdB?=
 =?utf-8?B?NVpWZXhvODV4K3NyaVdXMDY3SnJxOE1taDZVUStYMkZ0MExjSzhlaWxSa0tZ?=
 =?utf-8?B?QmV5S3pLbHF4SmVCdWprQTR1S2dXWWVRbUkzWDVNcGtpV1ZYZmNPOUJPYkxh?=
 =?utf-8?B?WmY4N1RwV1lkK1pON3F0c0I3dU15WTRYb1RWYW52SHpmVVFSL2JTalZUSDR2?=
 =?utf-8?B?N1N2eEtOeHN6OXdCNUpvd244azZqSWxXNTY3LzllZDNhZTI1WDdSelBOMlRo?=
 =?utf-8?B?NWZLamRvUHF0Tm1UN3NpYW5IS0ROZDhCdy9IMWE1ZXphVHA2NGNGZ05ORS9w?=
 =?utf-8?B?YTE5TjlEcjF3OE9JTHk1MlBGWkt1UEVvYnh5T2l1ZGdHaGtaVnRNQm5BWUtN?=
 =?utf-8?B?bit2NnAyM2pJajI4ZDdhYStKZWEzb1FoZVd5RHFZSDcyV1NmRjFQVys1SEE2?=
 =?utf-8?B?TEJ6VndVdzlKcFdkSWp3OHREdHZxT1NibjNOanQxNUMyMnNxVmRDSldoaTJx?=
 =?utf-8?B?QkYwKzg5N0tIcnZFdk5TSjVyM1JNb25lbjBmdjloZnhBRWJOTUVvSm1uUUxL?=
 =?utf-8?B?WDQ1SU4zeWlIeTRmOEdLYXlobjdIZElzWXQ1YS9kNlM5c1F1OHQ3OFVicWtB?=
 =?utf-8?B?OEN1Um5CQjZxNmlZVEpMUzdvVWw4QTZ5cktscjBGNWZiY3kzMFZwOVprWGd4?=
 =?utf-8?B?NXJXVnVCYkhIOTVyY2s3dlJIL3Z0c2FtK0tDeGR0enZYaWFDdE96ZGozRjJi?=
 =?utf-8?B?S1htRkJ5UEFVS0NOV1ZYRXRGT1dKM2IrcFp4UEJlaTdMOTIrcjFhZXdxUFRR?=
 =?utf-8?B?SWc0NHJXczY1SkE5aFUzdzNyWTE5d1NSRVdIWGNOc3ZUR0RYamVTTkxpTUc1?=
 =?utf-8?Q?exqL7ZtE/Exn72FVjJfmIqi1E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3344bc55-8230-4551-1ef9-08dbf590d464
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 12:50:59.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9H5JhANImiuQz1C2dBWcPNQ5/1z57Qrf0Fodz2Rz21yMF0TxKRC3JJm1DF9EEnSB8zd7VmiEPXRnYQ/kwG7JbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221

Hi Julien/All,

On 05/12/2023 11:02, Michal Orzel wrote:
>
> On 05/12/2023 11:42, Julien Grall wrote:
>>
>> On 05/12/2023 10:30, Michal Orzel wrote:
>>>
>>> On 05/12/2023 11:01, Julien Grall wrote:
>>>>
>>>> On 05/12/2023 09:28, Michal Orzel wrote:
>>>>> Hi Julien,
>>>>>
>>>>> On 04/12/2023 20:55, Julien Grall wrote:
>>>>>>
>>>>>> On 04/12/2023 13:02, Ayan Kumar Halder wrote:
>>>>>>> On 04/12/2023 10:31, Julien Grall wrote:
>>>>>>>> Hi Ayan,
>>>>>>> Hi Julien,
>>>>>>>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>>>>>>>> Currently if user enables HVC_DCC config option in Linux, it invokes
>>>>>>>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>>>>>>>>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>>>>>>>>> an undefined exception to the guest. And Linux crashes.
>>>>>>>> I am missing some data points here to be able to say whether I would
>>>>>>>> be ok with emulating the registers. So some questions:
>>>>>>>>      * As you wrote below, HVC_DCC will return -ENODEV after this
>>>>>>>> emulation. So may I ask what's the use case to enable it? (e.g. is
>>>>>>>> there a distro turning this on?)
>>>>>>> I am not aware of any distro using (or not using) this feature. This
>>>>>>> issue came to light during our internal testing, when HVC_DCC was
>>>>>>> enabled to use the debug console. When Linux runs without Xen, then we
>>>>>>> could observe the logs on the debug console. When Linux was running as a
>>>>>>> VM, it crashed.
>>>>>>>
>>>>>>> My intention here was to do the bare minimum emulation so that the crash
>>>>>>> could be avoided.
>>>>>> This reminds me a bit the discussion around "xen/arm64: Decode ldr/str
>>>>>> post increment operations". I don't want Xen to contain half-backed
>>>>>> emulation just to please an OS in certain configuration that doesn't
>>>>>> seem to be often used.
>>>>>>
>>>>>> Also, AFAICT, KVM is in the same situation...
>>>>> Well, KVM is not in the same situation. It emulates all DCC regs as RAZ/WI, so there
>>>>> will be no fault on an attempt to access the DCC.
>>>> Does this mean a guest will think the JTAG is availabe?
>>> Yes, it will believe the DCC is available which is not a totally bad idea. Yes, it will not have
>>> any effect but at least covers the polling loop. The solution proposed here sounds better but does not take
>>> into account the busy while loop when sending the char. Linux DCC earlycon does not make an initial check that runtime
>>> driver does and will keep waiting in the loop if TXfull is set. Emulating everything as RAZ/WI solves that.
>>> As you can see, each solution has its flaws and depends on the OS implementation.
>> Right, which prove my earlier point. You are providing an emulation just
>> to please a specific driver in Linux (not even the whole Linux). This is
>> what I was the most concern of.
I have sent out a patch ("[PATCH] tty: hvc: dcc: Check for TXfull 
condition while setting up early console") to fix this.
>>
>> So ...
>>
>>>>> In general, I think that if a register is not optional and does not depend on other register
>>>>> to be checked first (e.g. a feature/control register we emulate), which implies that it is fully ok for a guest to
>>>>> access it directly - we should at least try to do something not to crash a guest.
>>>> This is where we have opposing opinion. I view crashing a guest better
>>>> than providing a wrong emulation because it gives a clear signal that
>>>> the register they are trying to access will not function properly.
>>>>
>>>> We had this exact same discussion a few years ago when Linux started to
>>>> access GIC*_ACTIVER registers. I know that Stefano was for emulating
>>>> them as RAZ but this had consequences on the domain side (Linux
>>>> sometimes need to read them). We settled on printing a warning which is
>>>> not great but better than claiming we properly emulate the register.
>>>>
>>>>> I agree that this feature is not widely used. In fact I can only find it implemented in Linux and U-BOOT
>>>>> and the issue I found in DBGDSCRINT (no access from EL0, even though we emulate REXT.UDCCdis as 0) only
>>>>> proves that. At the same time, it does not cost us much to add this trivial support.
>>>> See above. If we provide an (even basic) emulation, we need to make sure
>>>> it is correct and doesn't have a side effect on the guest. If we can't
>>>> guarantee that (e.g. like for set/way when a device is assigned), then
>>>> the best course of action is to crash the domain.
>>>>
>>>> AFAICT, the proposed emulation would be ok.
>> ... I will need to revise this statement. I am now against this patch.
> Yes, the problem was tricky from the very beginning and I somewhat agree. I prepared a POC with one solution
> that Ayan extended and sent to gather feedback (hence RFC). I think we should still wait for others
> opinion (@Stefano, @Bertrand). I think the thread contains all the necessary information
> to decide what to do:
> - do nothing* (guest crashes)
> - emulate DCC the same way as KVM i.e. RAZ/WI (no crash, no busy loop, guest keeps using DCC with no effect)
> - emulate DCC with TXfull set to 1 (no crash, runtime DCC in Linux returns -ENODEV, earlycon busy loop issue)
>
> * I still think we should fix DBGDSCRINT but I can send a separate patch (not really related to the DCC problem)

Regardless if the linux hvc earlycon is fixed or not

@Julien , would you be ok with option 2 or 3 with a suitable warning ?

Also will wait for Stefano's and Bertrand's opinions.

Crashing the guest would seem quite severe imo if there can be a better 
way (option 2 or 3) to tell that DCC is not available.

- Ayan

>
> ~Michal
>

