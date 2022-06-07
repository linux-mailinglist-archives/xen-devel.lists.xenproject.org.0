Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353853F699
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 08:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342857.567953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyT6a-00060Q-Lk; Tue, 07 Jun 2022 06:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342857.567953; Tue, 07 Jun 2022 06:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyT6a-0005wz-I7; Tue, 07 Jun 2022 06:54:20 +0000
Received: by outflank-mailman (input) for mailman id 342857;
 Tue, 07 Jun 2022 06:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyT6Z-0005wt-5G
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 06:54:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6896684-e62e-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 08:54:18 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-RzqjxCpYPnOpPbKmyHVerg-1; Tue, 07 Jun 2022 08:54:15 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7683.eurprd04.prod.outlook.com (2603:10a6:20b:2d7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 06:54:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 06:54:14 +0000
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
X-Inumbo-ID: a6896684-e62e-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654584857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SC+WSNVhO9GML4oFShhKwiJYTk/8SC67TBz8JVyBbsg=;
	b=Cg3t9JXCeHYqYNdcFTpmChAkvyIM1Bf6IeMOemZO8E5vho2syibBxImMfs+HZgu/hCsPLx
	C0fFYUf/nzO4drYkv3PBJYy2zbF4a94rrtzoeO+MZn5yO5VOnStpVp6qHfptTkhwYW9XcK
	BVCERBPyz6T12laG/WRc3UijEqPzDlA=
X-MC-Unique: RzqjxCpYPnOpPbKmyHVerg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvseONVHoJKEuqnpiD0xNWqSULxAEd65vM6lSZXr0WAqRWoNdD0b07PBttztLvZQy4bb4/hp3ZqXqY/2em3ql7HyB6WH18GhnaP3Os1cjmomUCKkIoW5kmncqrNJ98NYdd+8D6gVnLqyCk5Lj1mlU1paIJGIeV8Da1qj+Os0mdxLqRuB9iOTgun0WdJ2G/7eTlkNCC1DwgpPToCpYRwdbIWdmd9d1kbj+AuVBX9jUcwF9ygupCBaKwld0suA5sHLl/dWMfRkPth8A2l3THtwtLW/l59GidXmDiaN+8IlSISUkCS/Y5gImghCPKChsbgv91d9XjfZoO81VUHE8/HP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC+WSNVhO9GML4oFShhKwiJYTk/8SC67TBz8JVyBbsg=;
 b=HOm8p3Zs/BPodXanjP3AWoLoRAfw+SQlA9nqy5UA2KzS0PvNFf8yfXYBjr4mrIIJ9Jefiaj9sRCiHjmMA3JK+aUyRv/uXL2qgQGOPibTs9So56YGKO3v6Wu9zCXIX0lUlSRouTcFt4BB8cVzyhC3kJxggQZtpun10DfA3Md1YSBwhkuqBNxwcqZ0VOUre1rAdGS+1J7badKorJTIDV7g2GCAzLs20iceBMOgsLJiX4/yB559Ns5nDYdZ0yFZyeD1XUWh85Z/yipmAbP88PrQwn2QSq3hkEGzCpNjBwftUbmoESS8KmuaavjdQEnX7C4Iw6kqoJxeVKcfIMxfShF+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC+WSNVhO9GML4oFShhKwiJYTk/8SC67TBz8JVyBbsg=;
 b=h5CzfMsy441O9KkmsvVkTpoVZYPVoLbTxx2LybMWLsj0/Hj43OjSu6rhbybRjCRaOi8wtoFtj7UHKu9NuM7YWa1fQS6pEamZGlQ09XoE/KnIwPnFcVaYh2RMf0Bdb/s8PcIj72KhT2/Y71y27OFziWtRxqztRT8FfcYiAQ5dBxS6r85p/ZNm/kePLkOC2BnVg21PAO20CWKNMmitIBzYB8amEApTkwAgp+sgVdXQ1vcN0kYB7M5CClEb8Jg+mlW9t1rHjvS3HRtixP97JrZbDe9EP6DDYBWblCBInGzhmW3Oo6V6+2uZ3TQoXqZGkYIr1L0wAUon28b4POUfr++00A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe0fbfb8-859c-7b24-89bc-d5c68c7b133e@suse.com>
Date: Tue, 7 Jun 2022 08:54:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-2-roger.pau@citrix.com>
 <3c8b0b72-0a9a-3dfd-bf5c-b6cc40a4ce3a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3c8b0b72-0a9a-3dfd-bf5c-b6cc40a4ce3a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0056.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da99d1ad-21ed-46b3-7028-08da485288a9
X-MS-TrafficTypeDiagnostic: AM9PR04MB7683:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB7683C20546C164E3C0178C97B3A59@AM9PR04MB7683.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JAKTED8QVrW2KCo8chsO3nef9TwWm6ZAqcgKv7Qnkg7BsJL7nqVO1Z8PIIWjBqlZpwmFGhEXeSYKtq7hT7Qn8AJvZ731APhnz49SJ2d0tLs+/iBKNTQ3gZlCZE7+uSWwjZmGAw2V3LYEeHBflLx9Mz4hWGU+LXLpyF8auz2c5PMbBamdHENAJ78ZFF/ZsnBvQvuQLnanUA6d9Kw7hPPIXPwTTe/UOiqEKYHtVhAvg2xY4xxzvVe1BesCTNVKAG7S4YjjtRisgZs8nLmBO158TrlUh9lwC+MUwzTg9YXdg56ZYIgRjdKk6LqsbWMddz7/2tKmmL9NjagdQniuNdn8KiYG3A1SlhgCYbGVLkSIwSrEmuZr3et5xngzDAj6yHhuf81JYD7BtkbJES1GVkvFOPYRMt6Q5Tkhy9KYWAe9He48IBYH5qywaqgFtez/rtM+RFLwTOLN5yS6YzqITosPZZNwYkJC07cA5NUEC38ZNFlJ4nsT8Qxcg1Ya/PrVkumIgGCd3UDVZNygZrL3mD/aV7wG7+l8i+MDn9fAmidSIjNlgvjttukbbk2Sc5IT88fAy0wBwB6UCL0+76p7MFs1cGZmyJiJLlLIzNFXNUQyVXE4NEKHrUN+K9ncuDBZ2Ww6VoTSBkmhSmb6Lx04NeDAFer8M1tniKAYSzzQ4eNTBkyV6qz5qTRVBjTt5JJFjmz7NMAI3tuqR47lIZrL1pht9ZCRJZQx85GSArXGc2GjN6P2FNz7oVNrviP1LW1V9j9f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(53546011)(6512007)(2906002)(26005)(6506007)(6486002)(86362001)(316002)(54906003)(508600001)(38100700002)(6916009)(66946007)(66476007)(66556008)(31686004)(8936002)(186003)(83380400001)(2616005)(8676002)(5660300002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2NlWmtHKzNEVUYyWFhMNDVxUkFKTFg2NUhwWExjVGxjZUZGa2pNeDFHR2h3?=
 =?utf-8?B?bHc4RW96WmNoeUNVekhTM2ZqT21UT0pWTEdhQVkrU0EzQXNaSXJJVTlNSE9m?=
 =?utf-8?B?aEFpWVZQdzNZMk1Vbms3My9jeUlMb1ZTdlYzMVJnbW5ULy9zcWxhY0Vqak9h?=
 =?utf-8?B?eHQ3WDFOcWlvYW5oU1cxRjBNY2NUa3BLNVlpZFdUcXJRUjBmcUtNK240Y2Fr?=
 =?utf-8?B?MGl3MjhvejdwMmN0UWtlNFJ6UVF5aVBFUU1MN0FPRUdHTW5ha05oeDhHRVNh?=
 =?utf-8?B?RkExS3c4RnY3NzhuV0o0RVQ2V1BONlNlOU95TGdWcCszaFAwcDZzaElkc0Fo?=
 =?utf-8?B?OTNqaWRTUW1uS0Z4MGZZb3ZtWHA0VWZnQmhYT1hrbEJoRGgvZ0REUUZwN0JL?=
 =?utf-8?B?SFZiNnBxR1BkVXlkZjJ0RTJQTW05SHlTZ21VazZCeHArRmJQbGR2RjliSDhM?=
 =?utf-8?B?ZnQxZDNJNFpJT3pmMXVCdTcxU3JlY0VzSWg1dFhYNkNMU2JucE00My8xYXdk?=
 =?utf-8?B?VzdwNjk4UzA2SkhYcWZZWXduZG95Mi9CTFJlWXQxa0Y1R1l6Rnovc3ZLV05s?=
 =?utf-8?B?eW5tVlVzSHVuOWRxdXl3R2tEVUJjSEozR3dDa1NTQ2RzT0tuOTJUekJoWWg0?=
 =?utf-8?B?VDRUbDZhK3BWektRMFVxc3ZpOTlvcEdESUVGQUhsVXVqVitaN2dodXJzK29K?=
 =?utf-8?B?WTBLYXZ5dHVVOHpLWmhNS2hYUUxFazhycTFtL2NRSFhTaWx6ZllMd2I5NVZQ?=
 =?utf-8?B?VHdhRUc2Z3dvdkFLOHFpQ2RueFNaaEJNV3JjQU1JNGNRS1pzQ2tCRkxGNHpU?=
 =?utf-8?B?OXZhNGFFaU55UTdtR256bFBFckNydktSbE9keTM3RjhxRHgzZ0FEUkNhV3VG?=
 =?utf-8?B?T3J5bDhaK3doci9SOXZZL2JaRVB0R2wybzIwODlnOEo3SkFqMVYzWDJGQVFt?=
 =?utf-8?B?eVErMzNvR2t4eExFUFpxVEZOcEZ5WVVxdFMydDFJRWZEbUd3a1M1YXFjL1l0?=
 =?utf-8?B?UWFPT1h3S3hwa0pBeXlCVk0zTEs0ODg0NjB5cXlmK0tMaWZLdDhtZGtSSGF2?=
 =?utf-8?B?WHNiWUxZbEx5LzJjbzB6eDBRU2Y5aFlwRms0T25EZDZDVTJodkY3NGlFMm1v?=
 =?utf-8?B?clFLblNLR0pIUGtBT2tnL2pSblV5YlhEbUFPazlLMitZaGxxTStkMndNZm1U?=
 =?utf-8?B?SDBmZG9taU1FQlFTWVRvS1RVUGk1MHNwZFIwRm96UDBWSDg1UGNQdDJvMlN5?=
 =?utf-8?B?K08xeE1leitCMGxtTXRrWG1TblB0eXB4T0NyaVRTTnU1MThKWGp2S3lBMm4y?=
 =?utf-8?B?VHQxNDJsTEpCeEdDbmk5WlRHTlA4cS9nRk94alRxNFVzTzU4QXBLVklPQUsx?=
 =?utf-8?B?WjNuVWNqK0VKMXVoSGdUdDBNN0tsQXFYdkN2dWpaU1JveVR3ZkorWUZoY2dU?=
 =?utf-8?B?K3l3RTlGdHZTZ09rU1FJa3loTUpBcjYzajFXT1NOK3pCeEdpZ3hIbW1mSGlV?=
 =?utf-8?B?eWFmYmJicHRqYkJwRGtLRGc4K3hacXphVmJJMStyLzRlSExRWlgwSlhJZEhD?=
 =?utf-8?B?ZThLVmZobTlkeW9YZjh4azltcUhFSmMrYkk0cFQvcE5yTWdVMFpvaFZoNjA4?=
 =?utf-8?B?THVKZVJQU2daYnJhSHdxUHN0Ymk2Y2tRdm05ZUhuUmJjTngxZ3I0ellzeE9J?=
 =?utf-8?B?NVdwZVB0NksweTFPRStnazBpekJBVmQrL2ZUdWM2cnd3cFNidU9EN0FjL3FI?=
 =?utf-8?B?aHdROGhIcjhyTENyR0EzWlo0aUVFdkFNUjNGenpnb003b1ZlT2ZsRk05eFBt?=
 =?utf-8?B?cU03TVV4WU9BeHBLRVBRRGRRQ3FHL3dTK0twTlEyTHFSSHU5Nzl3cW1sT1Fq?=
 =?utf-8?B?VytPQS9ucXh2K3hFeFNacHI1d2txZXRjWEgyWHQ3cDdBNldkbnlWaElzQk4x?=
 =?utf-8?B?c08wSW9aczhNWFNGZmtCZUdUeVVXT1hBOU9ZRytUVER5ZENPbnVwdXNHZFkv?=
 =?utf-8?B?ejViV0lIYi9CZytMVzhIZDRyRTNmeGVMdnYrMEFOSUd1anBJY2orc3h4cnNh?=
 =?utf-8?B?NVJ4cmN2MU5VK256Rm9NUUhZUEljMXQvdXJQRjl5YmkwRTRmVTZPOHJPR0Vn?=
 =?utf-8?B?MzZSV2ZwZTBZUVMzQVBQcEJhdnoyQWI3R3VIUTlWRno3TDBhTSthSXM1Z2hD?=
 =?utf-8?B?bHlaMlRycWFyV0hDUHVtcXlBOWVkNVZvVGNKbEIvcnlhYjlUcGZzZmhzdlVv?=
 =?utf-8?B?MHNPZjZvclFqWGpQYTR5YnhzQmxLZGp5R2ZrYXBQN0F0bnY3YUpCY1NFdis5?=
 =?utf-8?B?VlVXRllKVE1Pbjh1b2ZiK1RBbmV0MHVwaEtEaDZONEZtNzkxcnhLdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da99d1ad-21ed-46b3-7028-08da485288a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 06:54:14.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX1aCwO1X3tk8ttiuCbrWMUNI6OFTYU+FAMYHHORlf8L1NlgUZ8rgzu9PnXQ26ZzqGLpRfQIgIXuElLXBgPEAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7683

On 06.06.2022 15:27, Andrew Cooper wrote:
> On 26/05/2022 12:11, Roger Pau Monne wrote:
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index f08a00dcbb..476ab72463 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4065,6 +4065,16 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>  
>>      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
>>          return vmx_failed_vmentry(exit_reason, regs);
>> +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
>> +    {
>> +        /*
>> +         * Delivery of Bus Lock VM exit was pre-empted by a higher priority VM
>> +         * exit.
>> +         */
>> +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
>> +        if ( exit_reason != EXIT_REASON_BUS_LOCK )
>> +            perfc_incr(buslock);
>> +    }
> 
> I know this post-dates you posting v2, but given the latest update from
> Intel, VMX_EXIT_REASONS_BUS_LOCK will be set on all exits.

Mind me asking what "latest update" you're referring to? Neither SDM nor
ISE have seen a recent update, afaict.

Jan


