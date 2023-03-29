Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EEF6CD378
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 09:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516089.799651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQQm-0007jS-4r; Wed, 29 Mar 2023 07:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516089.799651; Wed, 29 Mar 2023 07:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQQm-0007gr-1e; Wed, 29 Mar 2023 07:41:16 +0000
Received: by outflank-mailman (input) for mailman id 516089;
 Wed, 29 Mar 2023 07:41:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phQQk-0007gl-Sx
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 07:41:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a1b9af-ce05-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 09:41:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8067.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 07:41:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 07:41:12 +0000
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
X-Inumbo-ID: 14a1b9af-ce05-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvJqda3PZ6dSQo0/3ZKE+hfFxgDWOVfgooKLe113jIYWgUez2/SKOr8oT/dTFzckJYeNqyhRxVFEzpaR1+KbzeDrtuhwJpPEYoiXLmI8inDk973hEGvUetHaktQ/nnTkU/FTgPOmSodmG3qy7b9VIZPdHoSn53ru/7QwT50lhX5FKvveC7E1gzAHlok7DIXX0xjwUkf5Bl4DCa+wTQtuiLa+pL7upkoTEDYc34pbgMe19OwUAHhpOUa8wmGN2OxzZXIkjX9ChdVBLKHcq+zyYwK6Wnx3SLmy/+w8KnKkiiYWL/sX7tKH7x7gGWtAPi/4IRxoNDIFZ6BWHvePy7ZzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTj7jQmZ+aNviIf7tLtuPXsyLxN8QFlGO3m2R0eJ89c=;
 b=E8cuQ6LXWvpBRIpX0CZzFr0FtL/vJ8SNH8y9zB/imfpd1IM8Jl7qLkE3Hi/X0vjkccGbUp/XSEpQ6W4gPEqYKKZl1nfvrB+ducjEitufFpmUOzObVsYAcNrcwNPT5JSIGVcoXndK3RXIN5mQUGDbNHppgUdpKUkz2WXRTce5bf+p92vayYQDkLmRa0PpToeXcMvgxXavdwuzDtBIhB9bhPtU5eXP6VqUz/bi7bpULzJah6ua8wrFmknvfp7mL6gl7ajHY+VFg7kDwC5iyQo4RyFvF50VgFBQC2WDLpmp7jte1jFOV9jjvBdcS6WKV40Ss9b972w2x/z+BdLrRac0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTj7jQmZ+aNviIf7tLtuPXsyLxN8QFlGO3m2R0eJ89c=;
 b=zCfKLO9blH1yqHCQiFx5CkIGD0xqbAMFaLtFX7/zVgKIRiUhYGPl/o8zFcehgmcKQta49vb2FpfpHGcf64ifMttpsTBM8QkcAmG//piGr1oSUqdAbfXmwLL+GPNkGnnoiZUPcf0qy76Uy4f8nBl5/RR+FDlDVB0NqEjDfUzddssuBrLBFvw3CwUm9SKBR9zdwCrFC33Gd1JObAEydOMoDyFN9OzNZlPP3tb6pYWqq8FXJ/WjPutaeAHwSwJdMvM1iJzzSa1w56v2GxlfBK4jvadob/QAp93RcUUOlQBYfVDttT+eSJCkCG98Y2BN0Prur2BWjr/Lfaf/fTH6pykcwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc3d6ad8-d89e-23b7-1570-784079c5a982@suse.com>
Date: Wed, 29 Mar 2023 09:41:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] x86/ucode: Fold early_update_cache() into
 microcode_init_cache()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230327194126.3573997-1-andrew.cooper3@citrix.com>
 <20230327194126.3573997-3-andrew.cooper3@citrix.com>
 <6b6b7da5-dd1a-1b17-b1ce-1b1adb687807@suse.com>
 <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c6661fc2-bdc2-b953-88fb-7250eb2fce1b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0155.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 53dcde19-fb07-4d79-de51-08db3028f802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F+w4yAVlEpgQ0AxYUmEBF2o91pbOBbsIkZWjBUIcp3XYtpApPjdWAyiF6AydmoBK/2BW/dNWAl83H0VfNdkx4+qCACWhOfZaXMiMGmbOiQJ8yYMWjH47LdtQn7Owkukf33CVqUW22sHziLGGjLR35SWYhuVc5HzAastn3rQ+y8+RvlKyLFCwHmv3QNsb+TBdewvkIFow1ehCp2StwF8m7NyGON5RRTapwz+scv8JWTfe/6nYUdL+QnVxeWOaDwnc8W2Yt0nlNRWnOzVPO3n9KQBlyXeC43BRt/6LODdkRa7RMbCzgoHJP9eOjSXKIVc1sa1NcqGb4y17TTzBRMj3bevnZ3KWfeUVXEx6MjlkWoHhHYK/w4aerC1Kg/Uq52Id0hv8XxH3BmoQVY5ryaPNLDFWp/8YWQ+lfGqrhiX8zDQ+ag2n2eMEgTMbrY1u+QMl0OIWOYelSnZB+qJc43dzOjNCFC8vVTMwVIm4dg6lKui4Lqq1PhN3jXpbzcBjxLSdpgXkEqfGkq2LFD2VN0DoDo94XO0kcinUFrVFWCbfoYrFSUZ57gSUmcrKgP6JnCcOHdBIA4kBdJ1n6vZ63rnMIX8TozGl/YBwBLXg9J0YAT3V1R+p1kjXXqpGqMMretyp//Fp2F5GJXBrOulr/Zybmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(26005)(53546011)(6486002)(38100700002)(2616005)(186003)(2906002)(5660300002)(8936002)(6512007)(6506007)(36756003)(54906003)(478600001)(316002)(86362001)(41300700001)(4326008)(31696002)(6916009)(66556008)(66946007)(66476007)(8676002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjBFTUlPOTVRaHZ1L0R3M0xVQTlxck9rbjhDeHRJQ0tSNUNsU2ZYNXZPUklI?=
 =?utf-8?B?MUFGU1I3bkFJUzMxaDNFS25NR3hkTm85N1phN0tWVUh5T2hBdXFTSTVJM21T?=
 =?utf-8?B?UjNBcXUzdDV4WUtUbUplekYxVU9HZ3dINkFZMUtyUUZSOGRNOEJtSzZCMjFu?=
 =?utf-8?B?c09Ub2FpaDFrY3J4aHlmYU1mNi85Um9hdWRPUDY1bHFJZnRHYTgzRDlDT21D?=
 =?utf-8?B?bEx4MnB3bHNzTGhGVFI1T0graUVxSktEalBFSmVTdFR6Ym9zV0M4VTRpenhq?=
 =?utf-8?B?eUxFS2YvRFJOYmZUa0lxYnpJeHdCOTV3RGVla2pOVVA1NlZBSlUrSnBoNHZi?=
 =?utf-8?B?WHR0a0E0RVM4M25oek91b1YyRkJobWVJSVZMQXFGa0hpZXNFQ2lQYjBWLzFV?=
 =?utf-8?B?OU9IWlJrdjBQSTIwN0R4a3pJNnVhWWozMm1jR2ZKQ1FjSWZDQkhPVjNzdXo4?=
 =?utf-8?B?VGN1SllsSWpXejUydWV3ZlUxb1VSbS9aeFVRNkNjRGVweVdrUnRIaFZ0bzJo?=
 =?utf-8?B?dGhTbTJDQ29jVnBVL0x4bkg5OTUzZ3R5bWNlelRZWFpET3l0THBGaG1YckIv?=
 =?utf-8?B?WGhGZHpzT1JtaGJGTUVGTTNzKys2alJVZFZ0SkEwSWp4VEg0SzlVTUpNNlQ1?=
 =?utf-8?B?V3ZEKy84Vm1PTGgwSkxtNXMvMlhaRE1zd29oUmYwOU1ldzBtTkRFbk5UMFR6?=
 =?utf-8?B?TUFvcDRtYXJhL0kvb3NuNkpyYXAybW5raE1IQlU3cWU0L0J0N3N1SUR4QytV?=
 =?utf-8?B?TVJlczlVdWRlWERGSzVhQVBoak1NZk0zNTJRQWxLQ1ltUk1mWWc5UE5aV0gv?=
 =?utf-8?B?dmtTcFN3d254VXBHTHRzMENONkN3d0JCTCtnVFMzNFB4WEVnODFzNnVSVzRq?=
 =?utf-8?B?OXd3b0NlV1JiUDJrbEcxTUlLZzEzMGI2bXFsbFVkbS8yd1NwZ2JZbk9ORnhr?=
 =?utf-8?B?elpRTG9vQW04U0JSU2hQdUhGaHdrL3hsVldHL2dYN2xPc2d6Rkx0Vzl4T05P?=
 =?utf-8?B?NW1nWFBPSWNCL0JNVzFtbHZzQi93eG9GVUg5UVorOUV3QzhVREtVZTRnVEZh?=
 =?utf-8?B?OExJbWFadTl5UThERWxPMWJQU3cyV0hoTzMyd0xyN1FkYmdvYXVtQ1F5akN3?=
 =?utf-8?B?ekZEaEJ6aHJrNmpEcm93Y1duSU1zeHUyVTV6QUlhL0dUSHA2LzZxamhHd2Rs?=
 =?utf-8?B?eHJvWmtNRnJGc1A1T003b3RINS80QjRyY3dMejdldHlvMTRJU0FycHN3bUFC?=
 =?utf-8?B?YjZMR2RUbm9iWEZJbEZwdnB5MVM0aFZnVGROdUVlNDlpRWorTHczdG03RC9v?=
 =?utf-8?B?czFmTFFDOHBUVUhaS0puUUZ5ZjZGTFQwTVFFenowVWJRSEJ6SEdzb1hUZXFj?=
 =?utf-8?B?YnpKWGNWUnptRDhYdGRKK3R1SDZpNG00c004SWh5QVgrN2QvQmE5UEVjZVFX?=
 =?utf-8?B?cnNUOWFob1RjYjFkYlhIYWVsNnYrbW9Kb3UvaFMyVktzUS9SdC8vemFyVFYw?=
 =?utf-8?B?Q3ZQVHJjUnZ6S3pDd2pqZ3pSS3RJd0FhVzBFQlVGckFCd2grdktJK1E3TnlV?=
 =?utf-8?B?R1JodlZUQmFGejJjNjdqeHdIMGo1SGt2VEFvMmNnK3A2bmRuWjI5a2w3bEVD?=
 =?utf-8?B?UVc5alFTSm5EWEtmNk80SUFodThSSW8xMmxVTndmOWFTSnU3dG1KNDRkSlZJ?=
 =?utf-8?B?eFNqTUhRU0d5Z1RLMWw2Vkg4RTVIcUM5ajN2d09mT0FveHhvTkxyekt2VHRU?=
 =?utf-8?B?VE9GSzV6SkVYVS81ZXpSNnAwNWZEN09EYmhoYi9KSk53UUJzZldyMFJNbEMv?=
 =?utf-8?B?VEl1dC81RW5QdVYwNk5rWU11anVjSW5ZWEl4UzVKdU11bUdyRTliU25UUDJt?=
 =?utf-8?B?NGc5NEZIV3RtbnJDajhRYW5vTkJ0Zy9xZC95eWlUYW1NbXgyUmtsK1JMcnNJ?=
 =?utf-8?B?ZGYvSUlRNXFTYUwxczA2bHlKenJJVUJzbHJPRVVPanhGMEl2SUUvbk5ta2hn?=
 =?utf-8?B?R1NrNU1wWTRjK2RVQWJYejd2ZmVRYlhXeFpYT3l3TG9hSExJZzZzMGpHdktD?=
 =?utf-8?B?eHdObWErUVM3VlJVcmVHSTJXNjlzcFFVT3JybFBlK2tiMlNoQ1BiQkMxSGFT?=
 =?utf-8?Q?efG/CDtKDfUE7JTAt01+QRsDt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dcde19-fb07-4d79-de51-08db3028f802
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:41:12.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlkwIQgA8l0ZWUdB99Ev1c69lz99P/UsRN8/n7cy+aWwEG4hCTHsHXgoQ3/Q8dI2EJ6+ex8CRbQk/MxKh6flMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8067

On 28.03.2023 17:07, Andrew Cooper wrote:
> On 28/03/2023 2:51 pm, Jan Beulich wrote:
>> On 27.03.2023 21:41, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/microcode/core.c
>>> +++ b/xen/arch/x86/cpu/microcode/core.c
>>> @@ -755,47 +755,51 @@ int microcode_update_one(void)
>>>      return microcode_update_cpu(NULL);
>>>  }
>>>  
>>> -static int __init early_update_cache(const void *data, size_t len)
>>> +int __init microcode_init_cache(unsigned long *module_map,
>>> +                                const struct multiboot_info *mbi)
>>>  {
>>>      int rc = 0;
>>>      struct microcode_patch *patch;
>>> +    struct ucode_mod_blob blob = {};
>>>  
>>> -    if ( !data )
>>> -        return -ENOMEM;
>> This is lost afaict. To be in sync with earlier code ) think you want to ...
>>
>>> +    if ( ucode_scan )
>>> +        /* Need to rescan the modules because they might have been relocated */
>>> +        microcode_scan_module(module_map, mbi);
>>> +
>>> +    if ( ucode_mod.mod_end )
>>> +    {
>>> +        blob.data = bootstrap_map(&ucode_mod);
>> ... check here instead of ...
>>
>>> +        blob.size = ucode_mod.mod_end;
>>> +    }
>>> +    else if ( ucode_blob.size )
>>> +    {
>>> +        blob = ucode_blob;
>>> +    }
>> (nit: unnecessary braces)
>>
>>> -    patch = parse_blob(data, len);
>>> +    if ( !blob.data )
>>> +        return 0;
>> ... here, making the "return 0" the "else" to the earlier if/else-if.
>>
>> Alternatively, if you think the -ENOMEM isn't sensible, I'm happy to
>> consider respective justification for its removal.
> 
> I'm a little on the fence here.  Nothing checks the return value at all,
> and nothing printed a failure previously either.

So how about switching both microcode_init_cache() and, considering
the similar aspect in patch 3, early_microcode_init() to return void?
There's hardly any use the caller can make of the return value; if an
error message was to be logged, it likely would better be logged
closer to the source of the error.

Jan

