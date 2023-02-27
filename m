Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6F76A457B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502680.774586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWezM-0000oe-Bo; Mon, 27 Feb 2023 15:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502680.774586; Mon, 27 Feb 2023 15:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWezM-0000l8-8k; Mon, 27 Feb 2023 15:00:28 +0000
Received: by outflank-mailman (input) for mailman id 502680;
 Mon, 27 Feb 2023 15:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWezK-0000kp-SZ
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:00:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75d58f42-b6af-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:00:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:00:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:00:21 +0000
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
X-Inumbo-ID: 75d58f42-b6af-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRC5qHIioGtzUqXVRIwn2yvnb82hDVzM7S0siVnGz77pjCx69x1mXE7MmcVk2xI6avWjk9ZZHv4nzqi/oco8h7HahHS0c4WdqT1EXDhEdvL1bdpqvXKLDAPauAhgY2paR23X7LaHSSiWl9sHWR9XNCrRE9CXDl/qhSuxZXjnqIkO2CcfSdpklzOytecjOTZGvZ5JM1PDhDHqapXDJNFY3bh71JDqFbEd8+Ds2vb3sJ+7gKVLc6PRpaD8/BCchfu4lUy5bUBLqrAxyA95XcKN6TfV2VjuluLFDhCZ8UvW5h3oy6svvjD4kHV3e3yHq2mnBC6rZB08oF94LM7ZbhDbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OszXZPctgpmr94+qLqKPiPURi8jAc9g+E/ezLbDIm4=;
 b=CsTLui51g3vEulYMhH0vdYdrbWvihGAZg+OEh5WeSUcpupdhdv0n0nIaTuV1uErZld7888JuVcuu45iwOT/Gn2Vd2ku8GnZzdnBFlxBkSSRSTMTQ3J0c7x4RwrnwFvznDKvrDl6CHYUo1Gx22Er4h3L+V4iDgqcBctLRZ6Jv041eAjPzWIwggs1JKx5VIg7Kn+All6AZqG3nN+/SgKyXVqofjwYbCCLg39N59RaELdX0lQmG4X70mur/Bzu14VSIeKobDt47ouJ4U/YM1hqGS7DFncLKSlunJQCNhakGA4yedEWvx57QOECxFGmmNOeQMC92m2y0AmKaXTCun3PiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OszXZPctgpmr94+qLqKPiPURi8jAc9g+E/ezLbDIm4=;
 b=l2K0lFI3yySyr+mFSTA4BnaS3E7awn8PdHWaIXc16AAC+aw85zyX4sHigpdzdi7xQYklj2D0fpx6WQeHpPYcibZjgFlunHJUR0c0Frgm+7MTV9SqcOrJZ79UPXwk2oUw+hb/ZU4KHyoxyK3+hLkjTH5BgfIK5Yuul4nI/4MMaIi20SCSjDl3RO2xPHpudwHHak9MIK3lNU6BxthRf5bTFv/zROYBCU7zxEt2/YFe8ZqYhgi3sYARF3jJA7P8WLjOdAMdvFAAv1LVdKT+rN0btK5E5vp02MounKBRyPk+4bs86By1mfpkTmCyVveMcSRVov0jSCcvUQJZKMyihyylBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8bb1d032-639b-d6f4-28f7-2f5e5fbcbf4e@suse.com>
Date: Mon, 27 Feb 2023 16:00:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230227095315.6483-1-michal.orzel@amd.com>
 <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
 <113d8d74-19a6-85da-8b89-1a21bf95960e@amd.com>
 <bbf3edac-d992-28b0-91b2-ca97159fbce2@suse.com>
 <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c38e0913-e588-712f-6e0f-698f9dbf51ba@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b89852-4104-4587-5001-08db18d358d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lxbsg4dmprx2mQTXHiYWrFIk42BLzIStmoOuSG2ZGzNzX8Z9AmR4yr49qr2ziUwmiEIC8kMx2rLSdVh3oRkd1e+Bj3krA9AJ3kl6KeIJRaU06TXBysokv67h85ip8CekJZovIjpns8pyJQmrhLwA9df+401js+LuJuurAwwTSZrl/znVvqq0QQ4bADKZKop6CDRmSywCQQJabnz5vbHYv8OP6Oahx/2daypWHmvSJIN9497ouzaGt5fGY6V8+GcYpljRZ5Sw/BQvwEoQB8/BTn48X70MrMTToXSNYLLEnHfSM+UQXmJa8UowWBHjwPKJWTKMpwoonToUTCYNH3wVsGn3NidYvz7rQ0UnowLvPN4i41iG22uISLDGEQl8ntSshcD4tGrCkDTyrqhj0iGQkURJMCayIICz7PJxY1eIyjuGVfgCB3fWuie+eiWxpIQDiMAafSbIjHgRcPiUH6/GYomUQb049gYGbLJ09azhEbZP2KUhDskXJ1IgeZgJumth9WRbMbSEDtoM4PIyqq5xGguyOvuVfYriIaoqveirUOXIGswFFfsvTjhkypVQ66jU7sby4B7DZpkkgPewEOry5UAquNLBPBGQClv3kPbwZoeGerLlQStAiFFRaz+kD9qmYPx5u43dQEY+5VGcV9ZfS84JFLdxyAdnItB5Rqua+fnfbV3OJ1JdIhRFAqupTG9YCSjTPh3YJndkiW+OOHotnVnrnnAh9OwF5zUkuk6zHGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199018)(4326008)(41300700001)(66476007)(66556008)(66946007)(83380400001)(8676002)(6916009)(38100700002)(36756003)(2906002)(31696002)(86362001)(5660300002)(8936002)(2616005)(6486002)(478600001)(53546011)(6506007)(54906003)(186003)(6512007)(26005)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9CVDVJa3NGM0k5TStQUG5kRTJQakxPeWNJQ2ZoMEVrZlZnalE2VEUvRUw1?=
 =?utf-8?B?SXl5bm1YVlE5NTR3UHEzSkZYckRvM1JuM2RPdTdGMzRwVk0veEN0dnZ2VytK?=
 =?utf-8?B?Q2hmOW5PczIwYXdSVjJpWGVnSllPRVRrby9jOHQwM3duVFlock5sOXlpWGRk?=
 =?utf-8?B?R0VzNnkveFRqWnRkbHMwVTdmL2lkQ2dtNFVUK050eGxxVXZ0bW42emcyN1or?=
 =?utf-8?B?WmVPWFNYMFNjektZeHNtak5CYVBzWlphNHhSTUdUN1lYOU1vUEU3YWF5cEtH?=
 =?utf-8?B?blJmb2ZEbUlxc0FBRFg3eUVDT2UxR2hRYlA0VUl6MVl5Sk5OUlREVFFndS85?=
 =?utf-8?B?VTlROTRvY2k5bm1DcUZWWHpnSDdGT2FNTzBOMjEzSU54cnZhNGc1MnozOCtZ?=
 =?utf-8?B?MVhIelV4a2lpdGljNEhNbU5hdFJIZ0VuQUc2STlUZXo0K0k3TEQ4NjNmUWsx?=
 =?utf-8?B?UVdFWWpzSmJ5T1lWOUVTN1FVcnUzaFJ5SmNPZy9Yc2kyZXhPT3FMc2ovbmRJ?=
 =?utf-8?B?aTB5b1pTeHFiS0Jld1BzOGlFVHpueUNjaWZiTkxIZ3M1NUVZeXlkajJTMTZV?=
 =?utf-8?B?Vkc0cllNS05EdnhXQUJXWERmbkh2RndpL0FHTitHMkl0U1NiL2t5NTRZYUJL?=
 =?utf-8?B?dmpsc0tYbk1DaXVQdGYwS0tYemVoRUEvMi9OakpaYVFrWTM4dXRFVTdEMGlY?=
 =?utf-8?B?Nk4wTW9aSU1RQzBFbXpLcGJQREFHMDMxL0ZBajBrRjlYcWwzYUtTN0hWT05M?=
 =?utf-8?B?WGFNNzNHbUVSV2F6dmhrQlAwWi9IbUJZMG1XWStTL0lIdmNIYjQzQVE3cFFq?=
 =?utf-8?B?TEZhV21jZzJUdGhkRFZYQUY4TkhVVlJya3d4ak5lUENtOHR3ZHNId1ZHYkRF?=
 =?utf-8?B?T0Q1NXlhM0Q1K0tRNyt1VlRuc0l6NkM5ZmRpbVY3RktDbHF5WThHZlUxbzZp?=
 =?utf-8?B?Vk1URjJ0RmdWS1FYTzc5ZElZTkZucW5vejE1MGo3aHlHRVZzUlJreU5BTjRo?=
 =?utf-8?B?NUVmRExsOHFOVkNqa0w2QzYxNVljN2gydDNOYmRCcThSSGcyYjlwT21zcHZq?=
 =?utf-8?B?ek16b29PdE9Bd1VFNjd5WExKMk5OOTBnQmxFOGZLNUdGY0tXWkRzbmpacEdm?=
 =?utf-8?B?NHkreERMaEpQbktXVWdzdHY3V25UaW1ETnl1TlNwMWJUVEZkQWF0YmRaZ3c5?=
 =?utf-8?B?RFZ2K1liMEJDYURtejNpcjlpS3J3bjVkNmMrK0poR095bTN6SWRDS3g5NWZX?=
 =?utf-8?B?ZkpPOWlzM1BUVENwYVpVYjhrQWFmeDdPTDUrby9MRjQ4QVd1Um5ia0s4L1lw?=
 =?utf-8?B?ZVYvK0V2Ky9vT1JXRUNsbElIdDY0N2MwZkZpcXpkbnhPUjFyVUFid29zdGZv?=
 =?utf-8?B?RGpQWmlSblhlbkR0R1VxV1Q1cFJvdlVTb002MTIrRE5mc0EvcHRRUCtkUGlD?=
 =?utf-8?B?SVNDT2hLN3ROM2R0R00yR1JwaG5LNVprRUR2VEtjYVhheFRmSk40T3NPMFMv?=
 =?utf-8?B?UVRLSUt1ZitIY3hwcncyQjF0WXZMcUZ6SUZWUTcra25kWHZWNlpSOThHUlJ2?=
 =?utf-8?B?djAwZU1JZXNudHJsN2JibUszRk52QUFvaE9tNG1WQkRBdTA5OXlXc1BhcEJG?=
 =?utf-8?B?dVlyYWlFd3ZzYk1Kdis4cWlEazNQS0kxNTFxUzFUQ29qWFpSaHhNZ1lNZUlF?=
 =?utf-8?B?aC95OUk2b3ZmSnZ5TUxONlRzcUJrZFFRMmFWeFdoSmMvN1JObDNkMUZ0UUdC?=
 =?utf-8?B?QVNCeEsxR2s1T251cHB4OHA4S003ZnZvbXFhMnJnYmNBenFySS93cEV3YmM0?=
 =?utf-8?B?MGVPZEJ2UkdUNHhOMWtqNDZKSnFIT3NwSHNKMUlUN0dFNEsrUlRjbWRLN0N4?=
 =?utf-8?B?YmhqaVE1NHc0OG9zVWFNWFZFRE02S2VaRWNpczRLT24zbVgrdnBGcEJPOWRG?=
 =?utf-8?B?SjJCS29FQUI0Wk9MQVN0eGFWUmtnMXI4ZG9ZWHRLejR5Qk0yZW1yZVpjc05W?=
 =?utf-8?B?ai9sek9VcndCRmdKS2FzdjFqcGQ0OUkzbjB0cUFPSTR1bkk0aDU0YlJQdjlI?=
 =?utf-8?B?Wk9Cam1UOFptUlJJSFpvR0UxZ3NHQTF2VXdwTkhXalBoQ2d3dFZFQjlLc25W?=
 =?utf-8?Q?8F4zdKY8AcjQX+2rnIN4vdgJ2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b89852-4104-4587-5001-08db18d358d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:00:21.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sorgwzm0yPvzzIixwFuBUv8HXdPCgZGGet+JeNtRiL5wwreoYrFA20XnDf6BD2KBRuV51eFj4Mb0ldUT3ft4Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194

On 27.02.2023 15:46, Michal Orzel wrote:
> On 27/02/2023 14:54, Jan Beulich wrote:
>> On 27.02.2023 14:41, Michal Orzel wrote:
>>> On 27/02/2023 11:10, Jan Beulich wrote:
>>>> On 27.02.2023 10:53, Michal Orzel wrote:
>>>>> --- a/xen/Makefile
>>>>> +++ b/xen/Makefile
>>>>> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>>>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>>>
>>>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>>>>>  define all_sources
>>>>>      ( find include -type f -name '*.h' -print; \
>>>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>>>
>>>> As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
>>>> also only be included when selected (or at the very least only when an
>>>> arch might select it, which afaics is possible on x86 only right now).
>>>>
>>>> It would also help if in the description you made explicit that SUBDIRS
>>>> isn't used for anything else (the name, after all, is pretty generic).
>>>> Which actually points at an issue: I suppose the variable would actually
>>>> better be used elsewhere as well, e.g. in the _clean: rule and perhaps
>>>> also in the setting of ALL_OBJS-y. (That'll require splitting the
>>>> variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
>>>> $(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
>>>> has caused crypto to be missing from SUBDIRS.
>>>>
>>> I think what you wrote can be split into 2 parts: the part being a goal of this patch
>>> and the cleanup/improvements that would be beneficial but not related to this patch.
>>> The second part involves more code and there are parts to be discussed:
>>>
>>> 1) If we decide to create ALL_OBJS-y from SUBDIRS, then we would need to carve out test/ dir
>>> that is not part of ALL_OBJS-y and add it to SUBDIRS later on. Also, the order of ALL_OBJS-y matters
>>> for linking, so we would need to transfer the responsibility to SUBDIRS. The natural placement of
>>> SUBDIRS (including SUBDIRS-y, etc.) would be right above ALL_OBJS-y. However, when doing clean (next point),
>>> need-config is set to n and SUBDIRS would be empty. This means it would need to be defined somewhere at the
>>> top of the Makefile (thus harder to make sure the linking order is correct).
>>>
>>> 2) If we deicide to use SUBDIRS for _clean rule, then we would need some foreach loop, right?
>>> Apart from that, there are other directories that are not part of SUBDIRS i.e. include/, tools/.
>>> Together with SUBDIRS variable, it would create confusion (these dirs are also sub-directories, so why
>>> not having them listed in this variable?). Also, I can see that we do clean not only for $(TARGET_ARCH)
>>> but for all the existing architectures.
>>
>> I understand that the changes would be more involved, but I disagree with
>> your "two parts" statement: If what I've outlined was already the case,
>> your patch would not even exist (because crypto/ would already be taken
>> care of wherever needed).
>>
>>> I would prefer to stick for now to the goal of this patch which is to add crypto/ so that it is taken
>>> into account for the tags/csope generation. Would the following change be ok for that purpose?
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 2d55bb9401f4..05bf301bd7ab 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -589,7 +589,9 @@ $(TARGET): outputmakefile FORCE
>>>       $(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>>>       $(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>>>
>>> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
>>> +SUBDIRS-$(CONFIG_CRYPTO) += crypto
>>> +SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test $(SUBDIRS-y)
>>> +
>>>  define all_sources
>>>      ( find include -type f -name '*.h' -print; \
>>>        find $(SUBDIRS) -type f -name '*.[chS]' -print )
>>
>> The fact that, afaict, this won't do is related to the outline I gave.
>> You've referred yourself to need-config. Most if not all of the goals
>> SUBDIRS is (currently) relevant for are listed in no-dot-config-targets.
>> Hence your change above is effectively a no-op, because CONFIG_CRYPTO
>> will simply be unset in the common case. Therefore if an easy change is
>> wanted, the original version of it would be it. An intermediate
>> approach might be to add crypto to SUBDIRS only when TARGET_ARCH=x86.
>> But neither would preclude the same issue from being introduced again,
>> when a new subdir appears.
> I understand your concerns. However, I cannot see how your suggested changes
> e.g. making use of SUBDIRS in ALL_OBJS and _clean would solve our issue.
> They would reduce the repetitions (hence I called them cleanup/improvements)
> but as we want to keep tags,cscope,clean as no-dot-config targets,

I, for one, didn't take this is a goal (perhaps for clean, but there ...

> we would still not be able to use:
> SUBDIRS-$(CONFIG_CRYPTO) += crypto
> and use it in all_sources (because as you pointed out, it will be a no-op).

... the problem is obvious to solve, as outlined before).

> Also, why do we care so much about guarding crypto/ if we take into account
> so many architecture/config dependent files for tags/cscope (e.g. in drivers,
> lib/x86, etc.)?

Good question, which I'm afraid I have to answer with asking back:

> If these are no-dot-config targets, then we should take everything, apart
> from really big directories like arch/ ones.

Why is arch/ other than arch/$(TARGET_ARCH) to be ignored? And if it is,
why would crypto, used by only x86, not be ignored? As always I'd prefer
firm rules, not arbitrary and/or fuzzy boundaries.

Furthermore, considering e.g. cscope: Personally I view it as actively
wrong to constrain it to just one arch. That'll lead to mistakes as
soon as you want to make any cross-arch or even tree-wide change. Hence
it would probably want treating just like clean. I can't comment on the
various tags (case-insensitive) goals, as I don't know what they're
about.

Jan

