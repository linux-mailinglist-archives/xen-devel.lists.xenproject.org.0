Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C892D819ED3
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 13:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657764.1026834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvTu-0002bU-Ve; Wed, 20 Dec 2023 12:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657764.1026834; Wed, 20 Dec 2023 12:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvTu-0002ZA-St; Wed, 20 Dec 2023 12:15:22 +0000
Received: by outflank-mailman (input) for mailman id 657764;
 Wed, 20 Dec 2023 12:15:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJf5=H7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rFvTs-0002Z4-Pl
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 12:15:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe59::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707442fd-9f31-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 13:15:19 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 12:15:16 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%7]) with mapi id 15.20.7113.019; Wed, 20 Dec 2023
 12:15:15 +0000
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
X-Inumbo-ID: 707442fd-9f31-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpapZa+/whCzlLsZkQJ+CxuvjLURJO+mk46iub3bh6BOqADZf5QGz2mavLQmQ9FusFaloozMUXVIKjHhGY7s1Mb1OO7KyEtU+04fgy7xRpHJ5L+DxZkuLVQhNCXM5DRhqs6n0sflxZAHL+cCq3b0Zh8Q0w/CKfKCDGUYgErgb0AaB86qe2D5ODFknjMnzInr23M56YG92tKKWLBJ/4j4ytUWtROYSXhHkrzNAZxUyecqt1EkTZXtLZYP4gM45h/3t9XwgfN/f/oBY23EZ2GRffkpwxwbibaiyiIPYTdfvcN1vFBciWSg8mnzcWR2tzcwQmsy07u2eEbf/hDLX6kjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSPdmTySxMdDvCivwvw3SCHwQluQFzir4+IwY01BAgw=;
 b=lz8ZZAJxkHnUvm3DA2MrN8Axz//FIl0e6M3IJkOquWyLSIxGKCla077Y9CmiqcllXdqIipWiesGJdxMaT5rAjfBAj0+LH7T7M0Z6Bm55YTLQxf3kreHLyPWbQYbyR6iuI6NaWRRgqRnPO5zbnRRQNBY4eqrRQYf/0IINdTopi5ZWtfEA/lInO7Tavw1ujKLmehzhZquG0glyuMgiE4Cf9KLOyzF8eNGUpxdLgMQZoeZegU4rIHO8peElgF16fG+N2b7nGRo+CBHDZez7wImvTKHuse0kEN1Lya3uRPEuRNJtgpv4/QD8vf1f1aP4pz7rBwgAouKRHh5Yy9USZo87pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSPdmTySxMdDvCivwvw3SCHwQluQFzir4+IwY01BAgw=;
 b=fMjhpbaln8PZ63hYABFfo6ybTR/4qH2fFt0dSUMja6w6GQZ3usqRbtxV7gLLwJDyzkFCfraPSXPY1ZcA+TiB7B2JNq6d/4JmsgJZCnYHK1Inp8+BsS/lMdvD9xYMQYtOrcG+U5kk6h0aHp9YwZoFWO0dgMB764WqL2oYqbzHCas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <34f3342a-b86e-4e74-bfba-d55e0de55600@amd.com>
Date: Wed, 20 Dec 2023 12:15:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
 <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
 <5E9E5368-8AD3-490E-8034-78F5BAF23006@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5E9E5368-8AD3-490E-8034-78F5BAF23006@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::23) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3e5af9-36ee-44e8-8cba-08dc015552d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bl8QheDsTLahIVpOxzu3yb4PbSFonlFVcwP2ep9CiieoNNZN9xZHQUpvE8PtrWsaKpv1z3Zj+lPID7D3rnNzUsrQ6q7Z6QEJh9YnK6/cNbphd5AO1rqJJlv4hm2E1yelXG4rObdIss83S/IaMFHTnn0u2/9DwAg7NUaoIWBpupyX8mMYLpL0OlEWZNRIqaXx8NMXfrFWpnf2x8vq48I+KuCVgySMsuGop7JPv3sDiaxeSdbbA1gZ8R2DzEQS2Bq0G9EkslQGYZJxnCMPMYNG3VMMqBir8ulu3aIg0BocKfx9NYbY0eig5P1Ii8E+7y0n1cMaPVlPlP/drwR6R/oIsiSjv5L/BwSXWHPOuVkRZO8LMmzxg2rKaCoblS0tTMnWwkyCvKSjIZ6E5iKM3P4vLjFOqqOkLS/Xa4Us1OmysPDEmakFwlUoDrgGd3cGk6GXL6NmifWdW6htDxmeKr8FwN8V0IEoVUeVTkaHKCBystz75Nub9gbi8SgzCE34tZn/w5n6dTx+e5XZZZTulsWfPVMYbuDqINdGi79iudiQEGi4rpwJti1G292Psmdo+s+WcR4EYA7SeVpSPNuHyJXW1GOEzGDrq0/TIsZ7me1nSeHi8e5NwRyd50QPgGaYE73jd8gfzRFT09C+whOjKi8Ctg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(26005)(6512007)(83380400001)(2616005)(31696002)(36756003)(38100700002)(4326008)(5660300002)(53546011)(6506007)(6486002)(6666004)(2906002)(8676002)(8936002)(66556008)(6636002)(66946007)(66476007)(316002)(54906003)(110136005)(41300700001)(478600001)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTFBVnZQRmwyaE8xbGNDRVByYlYySUV2S1djeGhSMWlONktSRkEyWlBwbHVy?=
 =?utf-8?B?eTZvTGhVdXd0TG1wcmVwYi90bFFJTkMvaXRBSXZNN2lUWDFEU25teEc1UUZO?=
 =?utf-8?B?QjNTQ2hLYjBHb2JXODhwQ21OTVpOOEpTdXhwOE5pYW05TzZsZlVIejVCNUQv?=
 =?utf-8?B?bTd4aU14ditCMUJLZHcxR0lhZ1I5QjhXYlF4WDNHemViMFNLQW1seDc2RFF2?=
 =?utf-8?B?SzQwc2FucXFGWklYRWl4aUc1NDJ2UWpsQkVobmZwQkVtUk5QNjVwZ1d6Q2c5?=
 =?utf-8?B?cGpQamdnVys2UUZmRElza1Z5OTJtRk9UZTJGanFjNE5lWUE4WFJNSWpQejZ0?=
 =?utf-8?B?NEpDYkQ4WklxTjE1Q0VpcFNldmhuZGJtSE1WVlBLajJ3bE5scnoyUjFRTGVx?=
 =?utf-8?B?QUYzWlRqUm8vbUp4WFNNZjBYbTIxZWFkVExlekV6VkE4b0h6OFdhd0h6bmtO?=
 =?utf-8?B?dndzTHBmU1pjQ1ZOK0xrTTJHYytDc3F3UHY0OFY3cU8ybFRONVYvNFVIdTI3?=
 =?utf-8?B?ZTdFeEZoQ3FtYitJSGJ6VVhoWDJWNVhkSFVpNXFYTFJqTlo0a1ZnQTlOZ3dQ?=
 =?utf-8?B?NDZKeVRMMlpOWEwyV0Y2MjV1WCtGcWowR1FpZlhza3FmRTVNVlBSbElHV3V4?=
 =?utf-8?B?SkcvWlhTZUFkUWFDS3dMdHQxRFBFeVowM0J0cHlyRVNzSVMxeWNGdVNvVzBP?=
 =?utf-8?B?RGcrT2NIYzN1djVpS3VwWlhjaC82ZTBHSm5vblErT2J5cVZ2SGFWUTc0cUtL?=
 =?utf-8?B?V256VlkyeFExSXQ4alhqTStYZ3ZYaXB5VzRoMTI3dXFtMm13UjNHSXd5L1FM?=
 =?utf-8?B?akVONXhJaFVLU05ROFBxcm5EL2ZyUzd6UjZkR0N6OW5xWDBielRPa0ZMQjh5?=
 =?utf-8?B?dmhBSXpxM0V0SDIrVFpvV1JMcGVzb3o2bEw1MzdBNTJPK0xPN3NKODRRb1Jk?=
 =?utf-8?B?UnVsa05LeS8vNEwyVFJQL3B4bzZPL2tCazQzUVRQd29KRVhHcjRzaTNLcTdh?=
 =?utf-8?B?Z0I2ZytySDFXRUgyV0xIWi9wVDhRMDhMOFM3NW9wRWJHN2RXdU8xdmJWK295?=
 =?utf-8?B?T25pR3Nxc1pPRE8wV21QazBEK2RqQldLdkNCNW1iNG0zL3hIYlMwNnRJVTFz?=
 =?utf-8?B?Lzd3Y09MQnI1cEozTFlJd2E3ZExHZHZZc2h5OHpnSHhCS1Zkejc1M1pPQVNx?=
 =?utf-8?B?T1FwVysxWTVVaS9NQ0E1OXFISXpTMXBlbHcwSzUrTVdKMC9SYkhxN0R1dXov?=
 =?utf-8?B?SFJSeVZna3dyMzB5elRPeUIrZisrcXVjRzNpN1BwVS9KMGJodWJZYmZWWmxn?=
 =?utf-8?B?ZlBPVG9TZDVPNUpBU3JIdFFUUzVPaXR4cythQ0hCL0pUQlJ3OEhPOXIrRDho?=
 =?utf-8?B?b2FRa29HcWd1aHV2NS9ueEdCd1lsNWtYUExSTG9hN2ZTZmJicnRhYjMzUHJH?=
 =?utf-8?B?MTZlVjNYSmFqQUt3WGNSMk5JMTFBZzNRRGNDUGtDQ1YzUVlJOFdHUjBoejRy?=
 =?utf-8?B?Z1YxTnI2UjRTT1JVR3hsRG9SRHFiaGRYZVQydkhqOW5PL3ZQd0JGbHIzTFAw?=
 =?utf-8?B?VEpWbGlLdmZ5elhGNjlTU0cyZGlNaE1hcm83dUdoNzBtYkhuOUZYQW1NM1d4?=
 =?utf-8?B?dWVyQlVkSmlwU1NaTDhhUDFYNVRvaTVoWjVpa0FFdmJBbGJraG9TNzRVWjcy?=
 =?utf-8?B?R21velR2dllSZWMwVGozZXpCSmlRc0dsZVk4ZisrSHE1bC9ZeGVEZEZGenZo?=
 =?utf-8?B?ZGtscndpQ0VKbzN1Q2N0YWlnTkt4RDEyRnRpeGFySGFzRVFvUkxQVCs5WExX?=
 =?utf-8?B?c0lYdHFCbG9IUE5oRTRrak5xb09za2UxbWZQcTZhemlmalpUWjR2bU80S1B2?=
 =?utf-8?B?eXNtTmYwdXlKUkpFcVlpOTNhdjBZajFFalByaXhEMXlTWWJqU1hoQUxBcjdJ?=
 =?utf-8?B?TmR6aENMMklUL2lIVEV4Vm9Fa3Z0RzNDejFCUHVIVWNtSlN6R05hZFpUV3pB?=
 =?utf-8?B?WHJLckI2d2tYSWxNUzYrWUYzT2s5L2F6bnZ6akhaSnkrRFRmUWI3U21qdjBt?=
 =?utf-8?B?bGJqUzYvQTk1OUFnenQ4dWRPSnJ3eWdpd1RkWnAxTXZmTUtGdnkwL0J0bkts?=
 =?utf-8?Q?YUekMGOqRTEFwNvKvVQ5AV+4Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3e5af9-36ee-44e8-8cba-08dc015552d9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 12:15:15.5778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HavIsQhFNO1TplZfG7KsPfR3qUVSAhx87DzY1fvPDtOEJntbZfQ0364cM+n+rtjMwEPZeKGNk6oSx+uOSPuSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865


On 20/12/2023 09:43, Luca Fancellu wrote:
>
>> On 20 Dec 2023, at 09:29, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>> Hi Ayan,

Hi Luca,

Thanks for looking into this.

>>
>>> On 18 Dec 2023, at 20:29, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>>
>>> Hi,
>>>
>>> Refer https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
>>> for the previous discussion on this issue.
>>>
>>> Also, the linux earlycon hvc driver has been fixed.
>>> See https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3
>>>
>>> Changes from v1:-
>>> 1. Split the change across 3 patches as per the design consensus.
>>>
>>> Ayan Kumar Halder (3):
>>> xen/arm: Add emulation of Debug Data Transfer Registers
>>> xen: arm: Introduce CONFIG_PARTIAL_EMULATION
>>> xen/arm: Introduce "partial-emulation" xen command line option
>> I’m a bit puzzled about the order of these changes, wouldn’t be better to
>> Introduce the partial emulation Kconfig and command line args in the same
>> patch together with something that uses it?

You have read my mind. :) I wan't sure about how to do the split...

>>
>> I think here you wanted to keep Michal patch untouched, but I feel that a
>> correct split for this serie would be maybe introducing Kconfig, boot args and
>> one of the arm64/arm32 emulation, and on a second patch the other one
>> (Or vice-versa)?
>   ^^^^^^^-----> for the vice-versa, I meant 1st patch Arm64, 2nd Arm32
>   or vice-versa.

I wanted to keep Michal's change for the arm64 as it is. And introduce 
Kconfig and command line in separate patches.

But I agree, it does not look clean.


I am fine to follow your suggestion ie (Option 1)

Patch 1 ---> arm64 changes + Kconfig + cmd_line (authored by Michal)

Patch 2 ---> arm32 changes (which will use the Kconfig and cmd_line 
introduced before)


Alternatively, I am thinking like this (Option 2)

Patch 1 --> arm64 changes (authored by Michal)

Patch 2 --> arm32 changes

Patch 3 ---> Kconfig + cmd_line (which will touch patch 1 and 2).

Let me know what you (+ Stefano, Julien, Bertrand) think about the split.

I don't have a strong preference on how the split should be done.


- Ayan

>> If there is something that I’m missing let me know.
>>
>>> docs/misc/xen-command-line.pandoc    |  7 +++++
>>> xen/arch/arm/Kconfig                 |  8 +++++
>>> xen/arch/arm/arm64/vsysreg.c         | 32 ++++++++++++++++---
>>> xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
>>> xen/arch/arm/include/asm/cpregs.h    |  2 ++
>>> xen/arch/arm/include/asm/regs.h      |  6 ++++
>>> xen/arch/arm/include/asm/traps.h     |  4 +++
>>> xen/arch/arm/traps.c                 | 21 +++++++++++++
>>> xen/arch/arm/vcpreg.c                | 47 +++++++++++++++++++++++-----
>>> 9 files changed, 117 insertions(+), 13 deletions(-)
>>>
>>> -- 
>>> 2.25.1
>>>
>>>

