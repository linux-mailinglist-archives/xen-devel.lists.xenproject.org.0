Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A681A1B9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 16:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658120.1027168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFy34-0006ct-ON; Wed, 20 Dec 2023 14:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658120.1027168; Wed, 20 Dec 2023 14:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFy34-0006ax-Lf; Wed, 20 Dec 2023 14:59:50 +0000
Received: by outflank-mailman (input) for mailman id 658120;
 Wed, 20 Dec 2023 14:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJf5=H7=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rFy33-0006ar-GY
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:59:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b5b6d12-9f48-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 15:59:48 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 14:59:44 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::517a:f65:688e:c4b1%7]) with mapi id 15.20.7113.019; Wed, 20 Dec 2023
 14:59:44 +0000
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
X-Inumbo-ID: 6b5b6d12-9f48-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOAL/qqOWfQFahdPE8Xwqur4nZw/JVpvVGygR5z7sUZh95k7JENkxDKFuSrXkNLJCX7PsRdwZlRSo3XrSJpcycyrj9udzTjdPVJ5gcTg1+3C6bXYdcZ4+d77J6Js8JbmC7WkOo2pWsWQk+btG291wzArUhSN74FvVvbiHZl66UkYuX7oPbYpSUxEKmWnlE2tAWRxClIB6g0wiE8aD0bUi6//6GDap2fjwYGLLbhVi4AaNnri020/qiU5rpmr8NOITZ8TDb3alPgBGc3hWtDNcUvz44h8cPZ7No6VECcvgGguXexT5gNE/kE/oXRm3coHQURx1GZlW88sCPLe2ly12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLibqHQl5Lh7gdw75MjkVAELP7ICyRhFymEua1ELmb0=;
 b=Cv/cOeh3ftDhl/LvWBaK/nfJiciMKiCOgjoWdCKJHt2c2eCXpm7ZJDuCvaRvfNcf2t/oUfg9Fc0UZ9Grk6jifLhmeGM/gdxPCiBhZ9bDNkDqgdgI4BsdUsSoO5Fj4LI3200BNg1x5C99BsUXYsH93L++lercLAgdVjpDQzSBiidF/rS+rWThxUCMy33DXTwYbIy+BiimTFdwnNInQZiOaL6zqcbF7YO8qBocVyusLChzZyjy1KG4Xbe7wAfzb7NZ2N6kznssYBZWMkols+6Vfz/XkoTLxiD1pVVnIo7XthbpkWRH82fMLyU5lAFKzLYj5mhANtTEFF5Z2dJMxLpNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLibqHQl5Lh7gdw75MjkVAELP7ICyRhFymEua1ELmb0=;
 b=QKK+UOeKLlsehV0LXXi3SQDpV8TsBbyTiMcLSiat41C7tH77hFPK3N+TU/6xi19y9qaG8q1mUABhNtPavojSnVXdlMcGfRauMSbF9uD51GkJStiHEC897cXNxDVYy+KBiRAWkvjaNLx3BYlTDpMzTaHAV23bTtIQcGDw7riiz9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <94af5895-2562-4817-8f6a-6025ab0b8948@amd.com>
Date: Wed, 20 Dec 2023 14:59:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
 <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
 <5E9E5368-8AD3-490E-8034-78F5BAF23006@arm.com>
 <34f3342a-b86e-4e74-bfba-d55e0de55600@amd.com>
 <29076f96-3497-4b08-9f17-22577e3b90c1@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <29076f96-3497-4b08-9f17-22577e3b90c1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b741884-9180-4074-2b54-08dc016c4ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/nvEn/OMeuEzr1mbjo9irqR5QzNrB2OoEr3OaHlPIl8StUGryMSS2/9R/prJCDIhuarjKIXfa/01gpAH8/NGpSA1rmXHHn4KDboqtVRFyPA0E313PxQLHmS0B+wsHsYp/bDMG4cRQwofioF7v0dCqKgRaObQ7AN3Om2EDtMVgxCdxyvvXtNGpdBnzJE0IJwEOqygPkSI3GEqf+spKMHRVW6winzpBhpYpObfwYbeULMTJ0ITMMp9fa+cmofGaA1h2Lambv4/oyPDlbckdMbjzQmfNAutBr6mQjt8BQaYqIpiW/wogj4n8vOrODKXAe1s6277LGimlEdoWAnA0d7kHiZ5RoH3wULyAYBVm4RsDQ7WrEsAXiwTOnCOsN5bxwzIJZOlL/UJuzFiiaTcNzfXG5yxVfyVSE6JOLFoHy+iWKS7EKpm3rDb4ow4a5rJWA9Hm82wKxpPK9XWMKdlmgxlbk2gCr6urmF40vUarpf1ZXXMsDHHzr46ysjNyoHeyOE1eBnptQU1y80P50xXeePGbctFTusg4N1G29a3Mtb7xhcZH0tPA7wy8sOk5GWfvLSiGp9t5boT+2ZtwGJMNwiEUAgyGZh8euiuVn37XGOPbg8AgSZTSa+Hsbijk1I6S+dZQW2/ZpVI1veywx1nZ8SgsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(6486002)(53546011)(966005)(6666004)(5660300002)(26005)(6636002)(316002)(6512007)(31686004)(6506007)(66476007)(66556008)(83380400001)(66946007)(110136005)(54906003)(478600001)(8936002)(8676002)(4326008)(2906002)(31696002)(41300700001)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWRMdi9COGtQaURyWHZLUnFmTEViejZlbGtLd0Q1ZWJieTc0VlVITUlaTmJp?=
 =?utf-8?B?ZEIzRklwNExzRWd3NWtWQUFqTEx2Vkg5RnVDWmtud0NyUTdrR0tabVo4M0RC?=
 =?utf-8?B?a3R2bTZqaUFDZXZ2a1dLQlczd3F5UkdzUitKQjB4WXUxbk0wTzRsUUFRK2ZF?=
 =?utf-8?B?S01Ec0djL3VyT2ltQlNVRzNFc3R2VmpDODQrNFRxL09oZjFud3QwMjZLWXMz?=
 =?utf-8?B?WStzdG16Vkg0bGZ6Q3d4L2tCN2tVOWZuSGpCbEVkNUJZdWhqSkhDR3JWdEl0?=
 =?utf-8?B?RjNWZ1BvV2N3cTNoazVlSmN6UW5KZFI1VFZKUFZxcFZJT085NTFlQU56MVpi?=
 =?utf-8?B?TjVtdjgyM0JsTy9JMThGRUxJMU5NVVhlY0l6K0luZW5NMVBOQ3hVRHJoRVZj?=
 =?utf-8?B?a3JIVHBEMnUzR0dWbWl2OTUzY29pQ0JFVzRZZ2VuV01rdlNYK3dZS0RZeUJX?=
 =?utf-8?B?ZDY0Tjdybm5NdUdtOVN0cVhzd3pLb25yTlN2RUJqSTRudjZleVZGVGdNZEI0?=
 =?utf-8?B?Zy9DcjZZMzUzanh6N2dkWThSUVZpRk54RVVjQnltOGQxZWFKNHFNeU1jVW9H?=
 =?utf-8?B?enVnSG5EM0VyMkJBMjhMUytMMWZieVYyakJTejhCbkRUKzNldU50bXJ0MEFT?=
 =?utf-8?B?d1JzSERHOGZaTGN0aDVhbFY2TjIvRDdJWUNuQ3RNYVdyd3pwdFNONWRBVEVn?=
 =?utf-8?B?V091c0toblFFSW5zOFhaVnRUb3NkYm8rY2ZTK2UxOEZ2dEo5Wmp4QnJ5T2ky?=
 =?utf-8?B?d1pPNk5sbmlyZU85cU5iSFhCZDRDbk5yL0N5d2JmVmR6K3dvcWlEejNFN0VR?=
 =?utf-8?B?YzRZeTdPOUJudXVTcFN2ZERCOTlrVGxaMmt3YUR0ZEM0bFVwRVU0ZHR0ZGkr?=
 =?utf-8?B?OEZ3UGlkLzkwSlZ3QnJLaWNVQVdnQ1hoQ1g3b0Z4TGpqREtuZkx6MUJlMUNK?=
 =?utf-8?B?OWtQcGVQaDJ0YTB2VDBaTG85aEhkMWduY2w5ckY4bjRnNzFOcXlRdlFsYkh2?=
 =?utf-8?B?L282eGQ5YVRZM3V5enlCL3ExdUVqaXR1ajNSRWttYkE4L3RldXZiOTZTT1RS?=
 =?utf-8?B?NG1xbjd2Y29HSy9LV2Z6emhtelFLcVBXaWw2dEFSME1IR0ovL3dyV1ROb2hH?=
 =?utf-8?B?czFRYkJOZEpPdkhSWFpVTFhxUkdLbXc1ZTBYUlh6Tzd6OE1TN0E4L2RTUmdJ?=
 =?utf-8?B?MGxFNFU2ZXlqUXZjK3pmWmZSOVhCMzk5ZFNDVDA4M0xVemVZenBwN1I3TktY?=
 =?utf-8?B?aHhxdXh0NnAwVHQ2K2FUQmdzdkNJOFJrVkcxME9sV0FuMVN4Z1BScU1rWjlL?=
 =?utf-8?B?d3FWMDAvTnpaZndJZEtZUldOeFNUekpLQVpaeDJBNVRCZHhMUTNnajYvRmo1?=
 =?utf-8?B?YU9sck9BYWxZNEw4SkV4Z3pOZ1hvb3VzTzg2ZjdCKzFaRGxCVW1HemxsUXpx?=
 =?utf-8?B?SnFCSW1IN0paY1BZMFN4NHFWeEh6NlBaU090MFphd3NaV0pTSEFoMkpqdC9w?=
 =?utf-8?B?TnBvbFk3YlBIeTdUanFNcyttaG1vL1hPL1U1TGtLN2hxZWRkbFFqTkpDZzRS?=
 =?utf-8?B?RFgrQUIxbUhDeFJKUzlROWxQU1dISWRsckJhRHlsL3R3RzdqVEVLRDdsdlZH?=
 =?utf-8?B?cnhPblUzREhRcENZWHlaSWJNOWMzdjYzVnJFZDRmTFdkMDE2RlcvMEtsdzI1?=
 =?utf-8?B?elZjLy8rQTRmV2ZmNTFwOERPRlFHcXplRkZKcHNUS1VSZndTNmRaR0JtdE1l?=
 =?utf-8?B?b1ZWOGpxb0tGWG9DK3VlR2JzOFViczN4ZlJ0M3VUbTBPcnAwNzg5MmJlTGNq?=
 =?utf-8?B?ZzFSNFZ1RE1wNk9tQXlSR3Vja2IwbXZ2eDdDanBGUDl2ak1RcXdaZWtZZmVr?=
 =?utf-8?B?NGZqTGdBeTgzVkgxdU1FcllDbnNLeHYvd0V2Qzk5Zkp3dTRwMTJhY1RHa0Er?=
 =?utf-8?B?Mm5SRHVFeW1wSmR2R2t5cTBQSCtIMXA5TFhWTjhEN2NHOC9YUmVXYTRFelBm?=
 =?utf-8?B?Umo4WVdRTmdTYndZVUwwb21VcUpkS0t6eGxyK3pvOW5HZEtZME9LUkVZSE1r?=
 =?utf-8?B?Q1lyQmVhZ1ZWMStDaS9Va2IyanYySDlaa29ndk82V1VmdHZXWUlMenoxMWpZ?=
 =?utf-8?Q?oIZxXfiLQ7xf4rYOl5QQilXHG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b741884-9180-4074-2b54-08dc016c4ca6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 14:59:44.0817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44MLENH0qN7epdeEtEEUK+8U93QqcKj5Vi3tLRP9ynAi/izsHcidSYJG+uUPbsdQl+4Syq8ieM742szGz3Jcng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993


On 20/12/2023 13:16, Julien Grall wrote:
> Hi,
Hi Julien/Luca,
>
> On 20/12/2023 12:15, Ayan Kumar Halder wrote:
>>
>> On 20/12/2023 09:43, Luca Fancellu wrote:
>>>
>>>> On 20 Dec 2023, at 09:29, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>>
>>>> Hi Ayan,
>>
>> Hi Luca,
>>
>> Thanks for looking into this.
>>
>>>>
>>>>> On 18 Dec 2023, at 20:29, Ayan Kumar Halder 
>>>>> <ayan.kumar.halder@amd.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> Refer 
>>>>> https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
>>>>> for the previous discussion on this issue.
>>>>>
>>>>> Also, the linux earlycon hvc driver has been fixed.
>>>>> See 
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3
>>>>>
>>>>> Changes from v1:-
>>>>> 1. Split the change across 3 patches as per the design consensus.
>>>>>
>>>>> Ayan Kumar Halder (3):
>>>>> xen/arm: Add emulation of Debug Data Transfer Registers
>>>>> xen: arm: Introduce CONFIG_PARTIAL_EMULATION
>>>>> xen/arm: Introduce "partial-emulation" xen command line option
>>>> I’m a bit puzzled about the order of these changes, wouldn’t be 
>>>> better to
>>>> Introduce the partial emulation Kconfig and command line args in 
>>>> the same
>>>> patch together with something that uses it?
>>
>> You have read my mind. :) I wan't sure about how to do the split...
>>
>>>>
>>>> I think here you wanted to keep Michal patch untouched, but I feel 
>>>> that a
>>>> correct split for this serie would be maybe introducing Kconfig, 
>>>> boot args and
>>>> one of the arm64/arm32 emulation, and on a second patch the other one
>>>> (Or vice-versa)?
>>>   ^^^^^^^-----> for the vice-versa, I meant 1st patch Arm64, 2nd Arm32
>>>   or vice-versa.
>>
>> I wanted to keep Michal's change for the arm64 as it is. And 
>> introduce Kconfig and command line in separate patches.
>
> I agree and the Kconfig/command line should be a separate patches. 
> However, I think it should be introduced first rather than last (I 
> don't want the code to be always enabled even temporiraly). So my 
> preferred option would be...
>
>>
>> But I agree, it does not look clean.
>>
>>
>> I am fine to follow your suggestion ie (Option 1)
>>
>> Patch 1 ---> arm64 changes + Kconfig + cmd_line (authored by Michal)
>>
>> Patch 2 ---> arm32 changes (which will use the Kconfig and cmd_line 
>> introduced before)
>>
>>
>> Alternatively, I am thinking like this (Option 2)
>>
>> Patch 1 --> arm64 changes (authored by Michal)
>>
>> Patch 2 --> arm32 changes
>>
>> Patch 3 ---> Kconfig + cmd_line (which will touch patch 1 and 2).
>
>
> Option 3
>
> Patch 1 -> Kconfig + cmd_line
> Patch 2 -> Arm64 changes
> Patch 3 -> Arm32 changes

I like this option and will go with this.

If you can review the current patches, that will be great.

I will incorporate your feedback while sending v3.

- Ayan

>
> I could also settle with option 1.
>
> Cheers,
>

