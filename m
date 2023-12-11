Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62F80C9FE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 13:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651755.1017568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfa6-0003Vi-At; Mon, 11 Dec 2023 12:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651755.1017568; Mon, 11 Dec 2023 12:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfa6-0003TJ-7s; Mon, 11 Dec 2023 12:40:18 +0000
Received: by outflank-mailman (input) for mailman id 651755;
 Mon, 11 Dec 2023 12:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVKS=HW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rCfa4-0003Rr-Vx
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 12:40:17 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd71adc-9822-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 13:40:14 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL1PR12MB5304.namprd12.prod.outlook.com (2603:10b6:208:314::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 12:40:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 12:40:07 +0000
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
X-Inumbo-ID: 6dd71adc-9822-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGS5C2rj6qhDNU283apUCPxlbDfd3uUPX1kQV1rjSXlZGEImHHc+CkYSgbdvIEg9StriWvuirgxz/17eWDVKTPXogRqhkmqkZ1NsMpMmIiZRiZl1Ne+2mNssXlWapazH4RNnCpqtcLLEDvcaK/WvvnrfurFN39DGNbBxTD3tXKsZFuMsbyNLTruSlXsLN89e72ACS24SwCcOfngOVcipbUjQEbdf6/PAaM0NBwSaM769fzQ1Y1AcuYBrvxHbnhjxXjoCeZ/PaPcu6zMTu10SPeo185T3CMh5kTU9bG2/HjzERoPMBuzGARbhXa6b9V1DkpkODhw/00EGXJ376V/5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XvMWXGDIju2aE70mBmpg28lhn/pGGvwqyowzgFqJN4=;
 b=BVlh7ZLrWI7C4fnT1IwbSUY2Hr+UfU04vmrUFylkxrpgF97vR6Me5qCTyY8LhdcN3gPDIh2BMGmEtVlTtdLmbvvp9eW1Tl38d9LIWtWw+yebBw2pYDmtLufO2TS38S7eaTc8fd0ztYINLub7F37KgEGvv/w2Pd0cGSXnVILaiL0Pg3Fp2HLpxhruMPXGJrqRemrbNc/iG0hbJWKG2vBFJKth9c2/XHLJM+9wkYErd7VOqbwHokrIEonWGMvJ/oJXmCkO8Fhrl0NdLugQqg9x5l/lPcS2BCrjjEvvtMLGLLbC2ob951r55TYxWT1QdR8Wa3gZCAB+iAxx4845GgBsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XvMWXGDIju2aE70mBmpg28lhn/pGGvwqyowzgFqJN4=;
 b=AOaJkZIsqdURetmYJnhXWhuq+8gWJ8h1bOY4hOaBOFJMkWBOR9rvMyxemPpQ4gMlaeNKtemwxGuV+yDhXR/gTn7yIKIUAFQ4mkUMyngVoncHdO+v8XEK8HgXHTelD1B0T+zwr7u0BT5Gbqm/awN2HhbmrMYZIBgDCHD4gohqBhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fe06b322-4506-43e8-ac6f-16db49dea45f@amd.com>
Date: Mon, 11 Dec 2023 12:40:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, stefano.stabellini@amd.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
 <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
 <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
 <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
 <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
 <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
 <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org>
 <alpine.DEB.2.22.394.2312051503060.110490@ubuntu-linux-20-04-desktop>
 <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org>
 <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
 <797e8621-e12e-4d5e-9c8c-4e3ece08009b@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <797e8621-e12e-4d5e-9c8c-4e3ece08009b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0489.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::14) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL1PR12MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 537e0fe7-8b61-437d-d466-08dbfa464e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OJHGhAvTzut1awkkodsAS+okMSy7qt4nDrgJURkDOcVTg7rizO50zUHyvTN9khcu/9zuLgRhX54wC6uFMzSe4Ot9KUA/DmVZZQt68FuBx/ym3E97m8OVfIbNCS0ux/F90i2Y8+LIjCQQbmISPo5ImzwEwp0a5JsfJCrvWf2HxpgfX+jV/Xa1HIINN2Y//DYh+jgDxIzC8EjKYpfFRuHjmL+dHmJ0vSEtbFqdQAXSMYpIuxa7ivKSAyjxTJBiU8cl+5XdOj+BAzjeZT6q/945B7e4V0UTBHexuJoBRWJvK3TJJp/r/OL/ImEAcNEzi8eJ16tPWbxUG7Ttqu0hyxTYjc9J3MLyRumPRb4VA+6cEpzHAqy8IdV3Khvlfp9nPsBsNeZ8xgoHNWaI+4941cFHlSana3Cx3zfgt3xdisLyxWN+xDbmX3uf+/3euv0cK1epQyTh9JMLwUxwkVGiCtRGA3zRPVDg3u4jP3crQBoF4SvlfsLWT2JWs1puFstQmOM+MNQoTebUZWqIx/p7qbpGljRjbtMzCmWzp/KT7HH1HhSbQ8P0lh0lq+0d51di6tlMjvLfKXeenCsmQ8C4sfuz0DGSjEZID6YQR8CXWf6mrLL9ZqmCS57oskZzJCGWBRwk/e0PVCNtjTHeKpnACVRz6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(6512007)(6666004)(2906002)(54906003)(66476007)(66556008)(66946007)(53546011)(38100700002)(31696002)(36756003)(8936002)(4326008)(8676002)(316002)(5660300002)(31686004)(110136005)(6486002)(478600001)(41300700001)(2616005)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjZmaUY2a01vR21NckhvZENSMWpqdVBISFdEYTNvNWh2Qk1GRWh0eVdCZmZ0?=
 =?utf-8?B?VGlHRUVOd3d2Q1IwQ2EyQVNhZkp6dEhRMFIya3dCbVhRampsNUZLY1VWUXdV?=
 =?utf-8?B?YmFQaHErd3d5ellENnIvSjkwMzNRV2JVYjh4dDBudEY3OWdKRFBqb1RUWE1x?=
 =?utf-8?B?WjBUdTdtZXRIQ3kxT25ybC8xZjQ3Z2t3ZExxa21hUjVnNGNiWVdOejRqb0w5?=
 =?utf-8?B?L1ZDeEQ0RXk1azZtRkYwb0tRbFVWZnRNTTNFQlJKczJTMkRNZitYQm5ZUjEz?=
 =?utf-8?B?eDlMbUJqT0xoOEVLM08wbXMxZmhVZTVKbWZjVVRRNmZoRktwODBITG5mRGJz?=
 =?utf-8?B?Z0xodU5WYVZDbHlwYTRZc0QzNExsREJDOXZIOWxMSFVHT1FQT3AyUjQ2UENY?=
 =?utf-8?B?RS84VER0eXZZZXlabTVFNDBYN0NqTmlRdXhSQTNoZjNUMEs3bXVRcTAvM2hI?=
 =?utf-8?B?QXpYT1ZzSWJhMlVuRm1ZejJTdmo2VXBGVmlmdWFhZEc3RXdLYnNjUmFpSG12?=
 =?utf-8?B?VjQzTkJRRXE1ZnR3RVVZREtEaE5YZGcrdVZkNkFHaG9WZ2xsUUdMSWJIYjRX?=
 =?utf-8?B?WEZLdCtudjVVUnpnV3pwZ1FqNmpremU4Zk9paUQ1UzFadUxzUFpzT3VKUnVR?=
 =?utf-8?B?b3BHeklxSlNDdy9lcUhFeGlBZ0w0ZTQ0Y2tJbUQwUkdoN3k0UlNmQit2cUdH?=
 =?utf-8?B?MjBLZEw1NldCRXBxRkc2L1BJWWVYWFRWMzkvak55eklveEt0aVppYVNYYml6?=
 =?utf-8?B?aG12NTJmbis1THYwQk5Md3R0UEZ0c1hpSmF3a2hJOExKWGxhakt4WDl6Q0I4?=
 =?utf-8?B?UkIyNHQxZXFyVjcxYnJvS1F3U3ZmN2w2bEdKcXRQcnk2RjJyVEVWWXNaaDdW?=
 =?utf-8?B?ZXZzTnJsa1RpRE5LVWhFRnQ0a09xMEVTWllvbXBSWTZxZGNTVlMvOE9FMlpw?=
 =?utf-8?B?RHFCa1U3bTJtL1BrTmZMYmJJUVo5M0JmQUlYMWxwb0N6YWtaWFdZMUFYUEtk?=
 =?utf-8?B?STVVSnhMN01IeUw0RnNoY3FnWmlKekRxMUNtVGcrZS9xT1lCWmRqbjZVWjRJ?=
 =?utf-8?B?NnJLcTZkblVGd3RDL1Nlb1kzNUNkRnZKblV0L2pjanVOQm9FdTg0aTN4d3g4?=
 =?utf-8?B?ODV0SlpXbGhuUGQrbUhhZ2lEMXBMekdTRDZSY29XOEE5clQ4VDNsZG1WSmRD?=
 =?utf-8?B?cFFheHF4dGV2a0d3R0xmMlJ4QUpFM0tDTmgwcG15ZHpTUzV5eTBqTC92RXFr?=
 =?utf-8?B?MkNOVzA4NnE4YnVZRHJac0w2eVFBN1NkUnRGUW1ublJjZUlQZkE0UUEzMTFl?=
 =?utf-8?B?MlJxSXFPdzd1YVRmQ0xJcXNxVnZYUTUreDc4ZDRrVytZNnVJV0Q0MXpENTR3?=
 =?utf-8?B?L2t5UFh1SUhLMy9QbjRCSVhOOE9ISzhYbGpMend3VmxpWS9zeXl2MjNmYWlM?=
 =?utf-8?B?b3V5Tm0zMWxjWjFITW5NelVSVEtKb3pBY0ZBQi9pcjk2RWdib1A5WFNISXNO?=
 =?utf-8?B?YlNxUzlwb2srUldMNDIzRm5pKzVQL0VEeEpDamI4L0E3VEQvVFBMN09MMlZF?=
 =?utf-8?B?Y3FOWUdySEROb1dFNXBGV2FCS05DNWdNTStrUTZDd2NDMDMwKzdtNW14OFk5?=
 =?utf-8?B?ZHB0c0hnRUVydGY0ODVyeVh0N2dUK0QzZmxsczA1eGxGcmRnV2xXZ0pEejgr?=
 =?utf-8?B?TmhIdUNueG9FV21uSjk5c0ZVVnZsaUZGeEZuOWxQbGNJWGczQ2t3VGlTczh2?=
 =?utf-8?B?VUZjYU5MdGFHSHhyRy82c0FXUEx1TVlROXVYaG01UEVIUnhRaGpldEl5SWlv?=
 =?utf-8?B?TzdRa25ObkxlMXZOVWF3MlpyYldKelZNNS9wWGlHUHZUTkVTYmpYbkRNYmM0?=
 =?utf-8?B?K3NReFlIV2FMQ0VYVHV1VGRNc212ZFU1UzFMdGVITS9zaDZ4ai81SVBqdHZl?=
 =?utf-8?B?cCtQY094dlFTOG9Dczl0RVJEN1NwQXFJN0poME9tY2d0bWFLQjRCNDgxcnhU?=
 =?utf-8?B?c1RvSFJkMVdwZldrQ05EWEFFK1dMQjBsMkpuUkE0MitGQjdkbVU4WG4wTkgz?=
 =?utf-8?B?bkw0UDA5SXBLd0FaK2d5MnlBTGZWUWg3MUtzcEltWk0xcEpKQzQ1dDZ2UlNt?=
 =?utf-8?Q?QvMH3Cigub0qcTafyyEIFgFpj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537e0fe7-8b61-437d-d466-08dbfa464e48
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 12:40:07.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OX6IfNGyRALEXZJIkNdt6/VcsZV7gEu4PEZBViU91aV0U95QOupvgYMiFfM2TpNwKq9gKY2+n5JaV5WG5slsLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5304


On 11/12/2023 09:33, Julien Grall wrote:
> Hi,

Hi Julien/Stefano/Bertrand/Michal,

It is a great discussion, thanks for your suggestions.

I think we have an agreement. :-)

>
> On 07/12/2023 21:41, Stefano Stabellini wrote:
>> On Thu, 7 Dec 2023, Julien Grall wrote:
>>> Hi Stefano,
>>>
>>> On 05/12/2023 23:21, Stefano Stabellini wrote:
>>>> On Tue, 5 Dec 2023, Julien Grall wrote:
>>>>> I agree that crashing a guest is bad, but is lying to the domain 
>>>>> really
>>>>> better? The consequence here is not that bad and hopefully it 
>>>>> would be
>>>>> fairly
>>>>> easy to find. But this is not always the case. So I definitely 
>>>>> would place
>>>>> a
>>>>> half-backed emulation more severe than a guest crash.
>>>>
>>>>
>>>> I see where Julien is coming from, but I would go with option two:
>>>> "emulate DCC the same way as KVM". That's because I don't think we can
>>>> get away with crashing the guest in all cases. Although the issue came
>>>> up with a Linux guest, it could have been triggered by a proprietary
>>>> operating system that we cannot change, and I think Xen should support
>>>> running unmodified operating systems.
>>>>
>>>> If we go with a "half-backed emulation" solution, as Julien wrote, 
>>>> then
>>>> it is better to be more similar to other hypervisors, that's why I 
>>>> chose
>>>> option two instead of option three.
>>>>
>>>> But at the same time I recognize the validity of Julien's words and it
>>>> makes me wonder if we should have a KCONFIG option or command line
>>>> option to switch the Xen behavior. We could use it to gate all the
>>>> "half-backed emulation" we do for compatibility.  Something like:
>>>>
>>>> config PARTIAL_EMULATION
>>>>       bool "Partial Emulation"
>>>>       ---help---
>>>>             Enables partial, not spec compliant, emulation of certain
>>>> register
>>>>       interfaces (e.g DCC UART) for guest compatibility. If you 
>>>> disable
>>>>       this option, Xen will crash the guest if the guest tries to 
>>>> access
>>>>       interfaces not fully emulated or virtualized.
>>>>
>>>>       If you enable this option, the guest might misbehave due to 
>>>> non-spec
>>>>       compliant emulation done by Xen.
>>>
>>> As I wrote to Ayan on Matrix today, I am not in favor of the 
>>> emulation. Yet, I
>>> am not going to oppose (as in Nack it) if the other maintainers 
>>> agree with it.
>>
>> Thanks for being flexible
>>
>>
>>> The KConfig would be nice, the question is whether we want to 
>>> (security)
>>> support such configuration? E.g. could this potentially introduce a 
>>> security
>>> issue in the guest?
>>
>> The important question is whether it could introduce a security issue in
>> Xen. If we think it wouldn't increase the attack surface significantly
>> then I would security support it otherwise not.
>
> For this specific emulation, it is unlikely. But I can't make a 
> generic statement here. So we would need to do a case by case basis.
>
> Furthermore, our security statement is also covering a guest userspace 
> attacking a guest OS. We would issue an XSA if this is feasible 
> because of an issue in the hypervisor.
>
> With half-backed emulation, it becomes more difficult to know whether 
> we are not opening a hole and replacing a guest crashes at boot by 
> something worse.
>
> Again unlikely here. But those kind of bugs are no unheard. So this is 
> something to take into account when you want to claim security support 
> for half-backed emulation.

For this specific emulation, I think we all agree that there is no 
security risk. So we need not add any security support for this.

With regards to partial emulation, we all agree that there is no perfect 
solution.


However, the approach on which we all seem to have consensus :-

1. Emulate DCC with TXfull set to 1 (no crash, DCC driver in Linux/Uboot 
returns -ENODEV/-EAGAIN).

2. Introduce a Kconfig (say "CONFIG_PARTIAL_EMULATION") option to 
surround this code which will be specific for Arm and enabled by 
default. This should be turned off by a vendor who does not want to 
provide any form of partial emulation.

3. Introduce a hypervisor command line option ("partial_emulation" , 
disabled by default) so that this cen be enabled at run time using 
Imagebuilder/uboot scripts.

The #2 and #3 can be extended in future to cover all forms of partial 
emulation.

I will send out a patch implementing this approach.

- Ayan

>
> Cheers,
>

