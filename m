Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7E665A55
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 12:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475218.736813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZRE-0007GL-EF; Wed, 11 Jan 2023 11:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475218.736813; Wed, 11 Jan 2023 11:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZRE-0007Eb-BH; Wed, 11 Jan 2023 11:38:36 +0000
Received: by outflank-mailman (input) for mailman id 475218;
 Wed, 11 Jan 2023 11:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFZRD-0007EV-J5
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 11:38:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2057.outbound.protection.outlook.com [40.107.6.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a1ddd81-91a4-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 12:38:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9521.eurprd04.prod.outlook.com (2603:10a6:10:2f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 11:38:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 11:38:31 +0000
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
X-Inumbo-ID: 7a1ddd81-91a4-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmorWcLXUTBm0fwhXjDg8q/RuRnCA2qvyAe32Oef1q19kzVOsqnYJNJG/1qL9z9rxMB1slBrEntBb1uSXAHCbIgFZBe6MvnLxeZAP+Aogv3MJbvVLn4epnprz+VlL9F70ujhKhdLcbnbylIdDZpmJmcNfSJKx37H5MTvrEIXD3r+dMx9UmBsBrezccB9fzk/e1p/m1/qUWE2u3oC3VD9Ha3QzC8hcNBkq07O+yMLOJLLRCQCFRYw0Nh08lNxlfaw87+G7QDeav3n7Z6Fp6pZ+kWWyNq0D+5L+m+IXFV09vacxFIHmMlIOQWtCS3wSehdmfVnCxBBr2OXwJBfQ/+cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsNHV6GLY/1LSfhSE0JxMz7TRDlapBwsAEehfvWhyro=;
 b=ExXA5dN0DkXUdHMV1RpmuhyPLWF+1bFrHr/sk/WE+z/3eL4YDSLmt8Y3pUtQooMTT6tQoNxuG41RfhuwhBOSB5jSSpLTr9DR5b2gKWilMTjFxBMm6+j0PvaZlc2R5Hdn3B5eLuCS2KRI+O2qXtrWRLTjrA6vz4LvhpWz9uaqbDD1LqSgeBeoIAUWnBDvcSGOhfQnmrBpcGkfdVtrhwYJ02eMUAF2799YEJzscrPC4S0lDedVxZ+LxfvxqUJHNSZpH+uOx6W89dFaEhlmarzqOeoIQqWwobawkocui91kLLvCZNRokq/R2/21YU2+75YvUgNDa2chsHni3lH6APoqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsNHV6GLY/1LSfhSE0JxMz7TRDlapBwsAEehfvWhyro=;
 b=U3/tihuM+zAng1mquLq8qNdycLwq5G8s8HS2UWSCRBPI6B3LheMDcSxr/Fym1YY7BLc/d3pWGSct3FxZoDJfpfk0plgY7wG8oJp27emlpGD9RFoIg1cspt/6d40hr+0/4EzBjoSxcngPM5n3Q2WL5jQVLcMDtWXNsgPZLqEKJc6vbfUXUeaeS2XSW2xXOaOdskakX+hlK1N2JZhMz2OJ5e2e4Wm7qZi43zJAfi0En1mW3jr2oLs0xAr04wOpR0HZqEp+wfNoPs+U4zgaQCKRLXVktNRLB3+9RCGzTWrpeez84KazHUvs81EVlnM6YtuQc+nfNEkID2CVpN4e6j0HOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <644334f1-8e1d-3203-e942-0eb3ef5584a9@suse.com>
Date: Wed, 11 Jan 2023 12:38:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/6] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii <oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
 <ca2674739cfa71cae0bf084a7b471ad4518026d3.1673362493.git.oleksii.kurochko@gmail.com>
 <c333b5b0-f936-59f8-d962-79d449403e6c@suse.com>
 <06185fcfb8cbd849df4b033efa923b55c054738d.camel@gmail.com>
 <1b6ee20d-2f32-ab38-83ec-69c33baf42fd@suse.com>
 <0398c48c-cc5d-a4fb-354f-54e3c5900d18@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0398c48c-cc5d-a4fb-354f-54e3c5900d18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9521:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd39ce0-1def-44be-07c7-08daf3c85d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1QxpyuAnAkK+5rK6x/5wnfb7bHbfTmtAI6hQZMEwDX2aJwA252KeYg1hiorvNlY7NrdIdoE/wBCumRe40fkM4PRSxjr40R8En4PK9U3ZXAFNsg/yKlG4EoKZnngq2VQ+yJeAG8euO7MdIuxG3RH8ogKfNlAB3RBqh1Afk2CnlbY2Ky00TyJrcrbZTJrC2slVRJ3Kzs+DFXH+4ODxd6ED3hcPcAsdORG/UClpPeQhjQN+6DGhnXSn68bbAgnSxznknS63OB33DND5v8YoAizj8WAwk5P2t/xw1ejNwL1rms9wPzFNBEaUHxwrTh2m5odC2F/A2RlXjQ9wQDiRSJxmt/vU7TVC1XVqfQKI5rvoqJ9uKrbtsk44ITso99nzH45lTh/8SRGIAXPeEETbJQanDQ9vZHpxloWbO2Kb91Ed/00BDtVqNi3d3vcHv1pDeQ1VAaHxX9evQl9DCZHzFdcGzl1k1pWr+VR8yBwGRuSrYpqTjVtp+x/t06ZSgoGocqAY4+8VQ27SoBITPEg18Nb/b/mo15oPwuFnQmPvQRyyGKinI+xyOMV/jWdQDb57PY7O0H8V2e5yIAyFVhH1s+6G5fkxiy7mxaBgIRDlM2jLm4gEq2UJMhpu7fML42YRH/d2yhCeaYyb3YAMhmweZpZWqFcl/2GAaTzWNwSAmzoLTYFtn+B1ucpcxwGdord0EEiAPstGyJ0trGlasLgAGiehxBAYX79SjZMBHpKXYgKQwP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199015)(36756003)(26005)(186003)(8936002)(53546011)(6486002)(6512007)(31686004)(6506007)(2616005)(66946007)(5660300002)(66476007)(7416002)(66556008)(6916009)(316002)(4326008)(86362001)(31696002)(38100700002)(478600001)(54906003)(8676002)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTlzSWszVDdDeVJNcDlvYi90d0xpR3ZiNExRYjdlRTlqVlJQcGlRdFdIWnVP?=
 =?utf-8?B?YmphVTFPUVhlelFveHBVd3RoVjkxTEhMNWFCZEpOeStTTTBhSGE2Y0NmamRR?=
 =?utf-8?B?dVNvZ09xc1hyUFpjSTVXR2hhbnJud2t6cVFEUGxGQmdRWjFTay9Ya0tGOEg2?=
 =?utf-8?B?K2xmUXp3SlVpbXJvMmpYZTZIeW1hQXRwVTZqd3BTOGRxc0lvd3N4ZDN2Y2VT?=
 =?utf-8?B?d2htdUEwSVczaGU5ZGxxcXJwZHpuSlQvaHZnSDl5WHpieWFEc2lDdXQyeFBP?=
 =?utf-8?B?LzF5azFkODFLbTRNZisxK0JkVkhuK3JwYWdLYm1qQmhsMVRaVEE5NTQweUVx?=
 =?utf-8?B?MWFUSmtkWVoyRWJnbms3Vlh1elRrOXdFNGZuejErc2Urc21kOHk1UW9Pc05q?=
 =?utf-8?B?RGZjbWFBTE91Nk5lWEFsK1hKZldEVFNtdVU3YnZpUVVGQ0VmTEJxSVVwVzgx?=
 =?utf-8?B?NHVBY1dpQkVPQXoxZWNoeVc5UWNnTGdaWnA2T1BIaHU1dkwrcjR1YndhZHRk?=
 =?utf-8?B?QlpDV0U0U1JFWmJhZW1NMmV4ZlZEajdQOWh0d2lCWTQ3Rm1JNmZiUzFIQmd0?=
 =?utf-8?B?MWFiSHlDQm5hTDFxM0x4cUkvS1lYM3NMT05jalRZVEJITmVIbTNjS3pGaG5a?=
 =?utf-8?B?UXRDU1hTWUdrUngyNytPbUtnTVVXOTFWNkp5dHNzRTNCYmdtTDdZWEdpQXNu?=
 =?utf-8?B?d25wZmhmSXErOFBBdnIya1c4V05NMlNQeWF0Wkt3eHh6dWdsMzZnVkxjYjhZ?=
 =?utf-8?B?SHdCMUhRM0NaSVoxYmdjYk9TK1dsejBoSmFBNG1wRXZzUEtWNUU4WjNUZGZm?=
 =?utf-8?B?dkdvUHo4WDJFOVpocXF1ajRoNkJ2R1VLeVZzVXdCb1NmMWNjYVdzdEppTFFD?=
 =?utf-8?B?Mk1RekNQTE1kMXFGajNuZHNBalorcStSaHpSQ2lKNWk0b054azdlU3RoOGtu?=
 =?utf-8?B?TWNHdmNBMVUzeVdkMjlCVG1SbksyYXA5bFdzZDBTVmJuczRKekFTZlhvTnBq?=
 =?utf-8?B?VE1UT3kwQTJUd0NPZC9McFBueExTcGhpMEcwOHRVd3Y4dzB2bWxENjBsbXMw?=
 =?utf-8?B?MGJielNVdm5WNytBNjM0ZXZuVkhaWS9EdVA1dTJmTjhXbkU0WWFhOXEzZVRj?=
 =?utf-8?B?aUNMWDZIcXNjOXlCaG9uMllTbEkzNFp4NVA0NXoxOXBHWjhHVVBIcVVMZFQ3?=
 =?utf-8?B?aVZxekxPWGVDQ3pWdnYzTDVkWHVrdjVZUnJ4YklXUlU4cjBIdkN5MVd2bE9C?=
 =?utf-8?B?cTdxelkrOURJN05vdzMzRW93WVNNOXp1TStpQmtVbk1ydXVPVGp0ZXN0eEdB?=
 =?utf-8?B?RDAzZjBUd0FxdmJTRDNTeUwxcmFqS255OHQvaEkvR2k3SXVmT2l2TFdTSnlu?=
 =?utf-8?B?OWN5TUhBdFBPVVlNZG13b2tOYXdlcVJYUUV1YWxIbjFwRjFuQnFMNlZzMWpI?=
 =?utf-8?B?dXdFSGtmOWtjeCs0VVFkTGRuUUZ1TWUrY1FhUDdmN29YYTNLRGhDK0RsQWFr?=
 =?utf-8?B?bGpHcngxdmQvOTRIL2hIaHJHenpOajhJWlAvd2RCYWg1Yk1iak91b2YvSHJX?=
 =?utf-8?B?ZUQ0bm95eVBGOXhBTEJ5TmZ3WU5nZGFRRUl3Yi85L0ZXUWZ6czMrV2xsNnEv?=
 =?utf-8?B?VnNJVnBkalVNWnVFR1J6RklYT3BHNXNaQjZlbEhDV1ArcEhYa1JOVksxeEVC?=
 =?utf-8?B?eG9ydTYyS0JZVXJEWHFTTGhJK2Z6dzRic0h4bkxjMHVTalNHMWg1OU95cXZT?=
 =?utf-8?B?c3F4SlZJNjhxN0REZXhHVVJOYWdOMmFuZ2ZBais1MWxwZUJmMnhaRzJrZ1lv?=
 =?utf-8?B?ZVhrN2dSUzZYT2RkUUVrMUU1aDlQbDJHYVZNK21EbEk4cmR3b2V0QkZQZHV3?=
 =?utf-8?B?eHFlVWlOdUpSOFdBV0ZiV3lVNDhQcVY3aXRXTk8vcWh6MTMySHNwai9PRGE4?=
 =?utf-8?B?ZVQ1QmZsbVlHT1JxamlJQXJOMWpKWGlGdmNVZUxsUlJRSThjakRGalU0aGhw?=
 =?utf-8?B?ZWNlS0V1djMyNTN1OWFGU0p4Y3NUOU04TlM2eTVPWXR0dlMwOGZCREUvYno1?=
 =?utf-8?B?ZFcxRmFWNGFBa3ViaWJaOE1QUFpZVTdTODd6a2gvK1pyTWlMM1pYeTUxdTdY?=
 =?utf-8?Q?OqnWzY6W4fJhYWM6750JaCLMU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd39ce0-1def-44be-07c7-08daf3c85d15
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:38:31.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS5BT7ae0nD7cdP76EmTm+mRW7ypC0UVQ5EnOZOyzNUR4cxxIsdk8i8grUqMjOwN8JewRDDuIYxIH/WWVJ4TNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9521

On 11.01.2023 11:22, Xenia Ragiadakou wrote:
> 
> On 1/11/23 11:08, Jan Beulich wrote:
>> On 11.01.2023 09:47, Oleksii wrote:
>>> On Tue, 2023-01-10 at 17:58 +0100, Jan Beulich wrote:
>>>> On 10.01.2023 16:17, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in V3:
>>>>>      - Nothing changed
>>>>> ---
>>>>> Changes in V2:
>>>>>      - Remove unneeded now types from <asm/types.h>
>>>>
>>>> I guess you went a little too far: Types used in common code, even if
>>>> you
>>> It looks then I didn't understand which one of types are needed.
>>>
>>> In "[PATCH v1 2/8] xen/riscv: introduce asm/types.h header file" all
>>> types were introduced as most of them are used in <xen/types.h>:
>>> __{u|s}{8|16|32|64}. Thereby it looks like the following types in
>>> <asm/types.h> should be present from the start:
>>>    typedef __signed__ char __s8;
>>>    typedef unsigned char __u8;
>>>
>>>    typedef __signed__ short __s16;
>>>    typedef unsigned short __u16;
>>>
>>>    typedef __signed__ int __s32;
>>>    typedef unsigned int __u32;
>>>
>>>    #if defined(__GNUC__) && !defined(__STRICT_ANSI__)
>>>    #if defined(CONFIG_RISCV_32)
>>>      typedef __signed__ long long __s64;
>>>      typedef unsigned long long __u64;
>>>    #elif defined (CONFIG_RISCV_64)
>>>      typedef __signed__ long __s64;
>>>      typedef unsigned long __u64;
>>>    #endif
>>>    #endif
>>>
>>>   Then it turns out that there is no any sense in:
>>>    typedef signed char s8;
>>>    typedef unsigned char u8;
>>>
>>>    typedef signed short s16;
>>>    typedef unsigned short u16;
>>>
>>>    typedef signed int s32;
>>>    typedef unsigned int u32;
>>>
>>>    typedef signed long long s64;
>>>    typedef unsigned long long u64;
>>>      OR
>>>    typedef signed long s64;
>>>    typedef unsigned long u64;
>>> As I understand instead of them should be used: {u|s}int<N>_t.
>>
>> Hmm, the situation is worse than I thought (recalled) it was: You're
>> right, xen/types.h actually uses __{u,s}<N>. So I'm sorry for mis-
>> guiding you; we'll need to do more cleanup first for asm/types.h to
>> become smaller.
> 
> What is the reason for not declaring __{u,s}<N> directly in xen/types.h 
> as type alias to {u,s}<N>?
> 
> IIUC __{u,s}<N> and {u,s}<N> are needed by code ported from Linux while 
> Xen code should use {u|s}int<N>_t instead, right?

Yes. Hence in the long run only Linux files should get to see __{u,s}<N>
and {u,s}<N>, perhaps from a new linux-types.h.

Jan

