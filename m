Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E249F715B56
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541063.843393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wSE-0001OI-5y; Tue, 30 May 2023 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541063.843393; Tue, 30 May 2023 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wSE-0001M1-2N; Tue, 30 May 2023 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 541063;
 Tue, 30 May 2023 10:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3wSC-0001Lv-Re
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:19:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8086eb5b-fed3-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 12:19:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8514.eurprd04.prod.outlook.com (2603:10a6:20b:341::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 10:19:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:19:44 +0000
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
X-Inumbo-ID: 8086eb5b-fed3-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIy4fJ+xmZuxgdfOaQuSQEQGja6ZWlgEmeSXM5VfAQWJUnjjsUMNH1XyCGY5Cxs+gttYyAHkS0Q9MfAZVUH82KT4fd9uvoKN/r4ZxxsbE3Dcqf2SHekaHconemcqx3GJYlFWZ5Eu0ZCC5bjSetHKzpBhZe7PLi5u9Ax6/504zTPdysOLB4FSuahrGou2iFUjj50vKHYHHIR69a+T2IzPtmtDgjvQxSUGbrLa2TLt48hBVepzVKmkg9/sbkrrSkrPDRGH5eAiGfvwRFFrUFPJqEvHkZuyXTuyuc9LVS4wH07V011ZsxpLxVCgD1YvJi/ZJBkiOcXBZAaRiOyUmCbIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvf5QyvswxG8whsCsjN4fxdDd7c+mulTeP7S3kU1ISs=;
 b=YZI/v5vTEj2zGS6KO/YPvt78FsIH4zlsiBNfFmkfHsV0EZarl7wX6A2wTPNDniBe4mAf6k/4ghMP9FU3AmH/eaEGoBZZK9vrPs9oB8LdZ9cCbkgn4e0WKgtxNh9fhd6fpmHZxM2p15+DQ1QmHLow4Qk44NM1EsaCQEz01+NZYcz5N2/eMcutUBdk2kIuOliPluSZmopxCV609AstkCwYRfpDrsZ9sKQwSCIWKbqz7gPA+mlELE1wVgfb4myXx3KlHdivxcj/zC9cRIzXgsUotKI65bfFSI4kStfljWZpjvOI6x/JpSwonc2FGEEUO7DjtMUvEem95YhC/eQvFsHSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvf5QyvswxG8whsCsjN4fxdDd7c+mulTeP7S3kU1ISs=;
 b=VUfSZ0FeiqqoddbsR7drTKW8by7EdSNxaSiPZdoQXIKufMJ+0gNkkONrADmN6gts6A/1MLXJ2NgkDzG+j0xKHubN02hUozpW1F7ciU7YlO+BxnvW5HLtQqLUfaGqYDbPtPqdipyL0a7yr4eVAbTRoMudKN0wl36uGmNyh5O7qZvZl0NFZl0kgFNHVSi2O7tyMhSouB0QUwDgAuBnsIH0/ZDZGWjWeHKJNcMxZ6s/Rdj0xOdPi1S6MXo+zW3MlKRsKYyEorOuTBKbH+UskgNHEXTkpCvNKj9euuI+GWCmCvs4DVvzMR9Vo8B9inUwLpJ9OYzJ4ksqDj2A7IvUGa6sEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <938f1e39-147c-471d-964f-7fad0fdba4dd@suse.com>
Date: Tue, 30 May 2023 12:19:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] x86/spec-ctrl: Synthesize RSBA/RRSBA bits with older
 microcode
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-4-andrew.cooper3@citrix.com>
 <3f38d4c1-dac7-611a-1882-a5e6de16d4f9@suse.com>
 <aedc61dd-7c9a-f1dd-6430-fc3c56624a39@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aedc61dd-7c9a-f1dd-6430-fc3c56624a39@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a75d28-d226-46a8-1550-08db60f7632f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LXmBxEoTOrUI2jckncFkEdersT2byXNWffAZO6d4Wu1IrQUb0a745PPhegJSoPj4LtHYROIRyr92o/rXDKfTqqBGdt8NR9mH0DiEP4HNoNKRM15HaCuJexSI8cTfe8ZbPA/VVOiXr+sbpzkIeQ3pIzsAzFeyfQDfdaAR7iKwGcva1KtC/HGXvtob+K8FV2XTCkmYLLipxPzDevuTxx/XV6OgSnnh+dQeAAKuKU+aA7Lp7BOKpwftppIwi3ngg4AXsQbMEDZK9ItA2DbEAjnVh1/sa42UxnzraMXEBWlblEEaItKZFU3AeT7IAjte0Od/hLw0G3sQq5ftMYBG8T53McvEyyNiqxDHxsFeRCSr3VT2hkrD+AR2OVBnygd3SQfT28oSBLMZ/LhZ2iSXckBwRCgEN8Ri9BBINeNNfIyG+O7D3+aNV7k8FYiaE9AvbxtCicauZbpqu19/ABxBqgOvl72I1irABqdl2Iya9uWmp2nJtLBQeEyqo1g9UZUfDTxMiDFsO9D1nGdOhnVyKAvwibLAoU3uv2Omp47nL2iZ8JvI4/mD4bdXuVSd/3KyFOs2I4l4VC+st4tLH+SEMzzpYQYhsBUCHGJIJPKW2ypGIOZKr4IG470nub5OZeG12TVN5NG3HWJkfI9ZGxpPPXeatw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(31686004)(36756003)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(316002)(478600001)(31696002)(86362001)(53546011)(6512007)(26005)(6506007)(186003)(41300700001)(8936002)(8676002)(2906002)(5660300002)(6486002)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2F6SjVNQkdObUhDR0ZweERnbkFPR1BwaFZhN0lIdHRwVm5XYytTUUpkTGNy?=
 =?utf-8?B?V0x2SWwybUZvOVRWRTcwUld1ZnZDR0twcWZUcFZZYTQyZEk0V25DVVZHazAv?=
 =?utf-8?B?bGVNQjBKSmZSVUVQaVJlb0Z4S2dkbUMwdGF3TlI0NDY2alljcmZMbnBNb3V1?=
 =?utf-8?B?cEU3RVcvUHhCQXQrYitudVZGNG03eHhNSjk3SnJGRk1IL2Z5TnR3Ry85L1dH?=
 =?utf-8?B?alpVV3N3KzVIWS9lb2JESTlxOXhGK1ZWcU1SbkJhcS9QU2tPNHIveVkrRFV0?=
 =?utf-8?B?Q2FTa2E3OUxQZ3lTakgvc0ZiOUhRMTgvUUVpS1hIOExWRlhvTGx5cGtqVGE3?=
 =?utf-8?B?WmwrT1VXaU85L2tMaXVONXZJZjI4L29wNXBRbzlxYy9ZcUFjOXhNK0J5ZXgy?=
 =?utf-8?B?dTVLaXlOYjV1WXlNYjc5clRiVGppZE5aMFp6Q3hpQlRkTldPTUYzTjZUK3NU?=
 =?utf-8?B?dzdEZk5sQjZKTWNsSm1CeXBLejREbDRnMSswWnRQUTNrSnB1dWNIRzU3RGVi?=
 =?utf-8?B?NFI4aFdHTFA0ZTN4YmUvcTJwSVREdEl0bElibnhWMUxJSU1VOGhCY1pqYnhT?=
 =?utf-8?B?QmNTaXhEdmVwR2pYcG11dFl2ZVpZSFpXdlo4TzBFcXdEZU1qcjZ5RnAraHZ2?=
 =?utf-8?B?NU1QWWVBU1RtTmNuZ00yRVRpMUVGVVJhbjBvZm1EaVY5OGs4RnpSSDNzOURE?=
 =?utf-8?B?SXk5RFpJS29waWpvSzV1cjhxWDZ1WlkvK1R5ZzhxR3M3R2Z2a0FwWFZ2cEQz?=
 =?utf-8?B?NngrNDNKVzk5ZFpJNjJHSlljTUVKblVYZ3FONXNxbUVPaGhscGZmZkZlQ01a?=
 =?utf-8?B?WDR5RkpIY1VpbGg5MWtFSWtJbnZ2bVJKdHB1U054Umx3d08xbmhDZUpaeXVh?=
 =?utf-8?B?akVRTjFIN2UzY1A5Y3prVjNmWEtsaVJTNEpWUkpoS3dZWDgwcHo0dXhCWHBB?=
 =?utf-8?B?cWl3SUg3UmxzYnhTN2FrdWZaY284azJaMFRGbHdWSU1kVGtuWVNZeUJZbWRK?=
 =?utf-8?B?bytaaXRKT05LdXI5YnBoaFF3TWxZWHloZmZnQ21qZHZPZ0hGb1hHL1BRSkgz?=
 =?utf-8?B?RXRDZS83YWRLV3hqMmV4NGtETENwN0N3UkN2L2FXVThXcDg4SGUrcHRjVmth?=
 =?utf-8?B?UVhEUVpwNzRkaTJ3bzRLTDhxYnRuU0YvTTlTTzNyQjlhc29Gb2M2UGNjdlg3?=
 =?utf-8?B?djRTQVBBV3dJZ0lpTXIzY3dGTnFpVXlVcFN3dTVKYXpHQnN5cnFOUXRscFRk?=
 =?utf-8?B?bms0R0pOcGZidzdIMWQzVkF6b0tFendBTmZhS2tJSyt3bWhJak9tTmNqRkpq?=
 =?utf-8?B?QUpoYS9DWnVTWnZzV2ViWDRLVEpWMUh5bFFkaXk3RmdwbmRyR0pLeFo5bytU?=
 =?utf-8?B?MTNoM0ovV0U4eWxyT1JBZVNWNFhNYUlCc1A2UFFqekhjanNXNUdoOWRyZ0VX?=
 =?utf-8?B?OUxZV3RmQ1dUa1p2SVVLMjdHbFQ2QWs5RS9hTkZ1YXRJOWZXY3dqOHdkZ3Nr?=
 =?utf-8?B?QWhyMllGMjB6eGNQSmtzckVieG5ER3crTHovWktiM29PYzR5QXhkUjJvbi9B?=
 =?utf-8?B?dmVvQUxWSVc3bVhGZXdManExVzZFNFphcFhOSWtWeXgvY25seXNpeEx1dUQw?=
 =?utf-8?B?M0JhTEVpZFJ3RE9TaXdyUXFXOGtZYzFYUHZ0SHRNWlE2NVo1c0I5dXVmUjNL?=
 =?utf-8?B?WWNZeHBJekVLcnV4UlkrM3Foc2VibmNUN1VoL2JUV1pUeGJxNW03eUlqcWwv?=
 =?utf-8?B?cTRwZ3dKbCsvdVFuTytrOXlJYkFXTE1RL3Q1OXlUbS94dGRwVXhKeUpKclFG?=
 =?utf-8?B?d2VrbHMwZCtqRlQ0SHBjbUppdU1JVFBZZUhFczNaR3cwK0Jwa0lzRHREbjFJ?=
 =?utf-8?B?V0R6RzIzMXZCUDIyN0Z5c1NFc3U1SHdIZXN6MlppZEEyWHNmZkhXbzRvTGZ3?=
 =?utf-8?B?ZHhvOE0wVldTUldycHh3SHBEbDhlM1RHeHNSMmZhL3lvYzIxZlJsOHlPTjUz?=
 =?utf-8?B?eE9kYnNrMFVJOFovZzFrQStBNmptN09vc3RoQzA3NTRXMEdTeUd5WEl1K25E?=
 =?utf-8?B?aklFaVpsZzNLeGRnZGI5N2pqamRyQlFpOTFta2xYRUpaeS9vUEV5aWhoY1Nl?=
 =?utf-8?Q?lbIPS01gqsMGLqOpFB60YpcLP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a75d28-d226-46a8-1550-08db60f7632f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:19:44.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/DTPcxHazvQbnY9x76k9D2sKKUdMyjyQmSm/y91oAu4aZFnn5iHAoMf/entpCioZVCeoca4MRRp8IfI4lNq5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8514

On 30.05.2023 12:00, Andrew Cooper wrote:
> On 30/05/2023 10:18 am, Jan Beulich wrote:
>> On 26.05.2023 13:06, Andrew Cooper wrote:
>>> @@ -687,6 +697,32 @@ static bool __init retpoline_calculations(void)
>>>      if ( safe )
>>>          return true;
>>>  
>>> +    /*
>>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>>> +     *
>>> +     * - RSBA (RSB Alterantive) means that an RSB may fall back to an
>>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>>> +     *   this property.  Broadwell too, when running microcode versions prior
>>> +     *   to Jan 2018.
>>> +     *
>>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>>> +     *   tagging of predictions with the mode in which they were learned.  So
>>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>>> +     *
>>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>>> +     * behaviour directly.  Other parts have differing enumeration with
>>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>>> +     * to guests, and so toolstacks can level a VM safelty for migration.
>>> +     */
>> If the difference between the two is whether eIBRS is active (as you did
>> word it yet more explicitly in e.g. [1]), then ...
>>
>>> + unsafe_maybe_fixup_rrsba:
>>> +    if ( !cpu_has_rrsba )
>>> +        setup_force_cpu_cap(X86_FEATURE_RRSBA);
>>> +
>>> + unsafe_maybe_fixup_rsba:
>>> +    if ( !cpu_has_rsba )
>>> +        setup_force_cpu_cap(X86_FEATURE_RSBA);
>>> +
>>>      return false;
>>>  }
>> ... can both actually be active at the same time? IOW is there a "return
>> false" missing ahead of the 2nd label?
> 
> I've already got a question out to Intel to this effect.  (I didn't say
> the enumeration made much sense...)
> 
>> Not having looked at further patches yet it also strikes me as odd that
>> each of the two labels is used exactly once only. Leaving the shared
>> comment aside, imo this would then better avoid "goto".
> 
> They're both used twice, not once.  You asked why it wasn't "return
> safe;" in the previous patch?  Well this is why.

Ouch, yes. The labels themselves are used just once, but there's
important fall-through from above here.

>> Finally, what use are the two if()s? There's nothing wrong with forcing
>> a feature which is already available.
> 
> It breaks is_forced_cpu_cap().

Hmm, yes, but is that important here? (If you decide to keep the if()s,
which I'm not opposed to, would you mind adding half a sentence to the
description or maybe a brief code comment?)

Jan

> Also, I considered having a printk() here.  I've still got it around in
> a debug patch, but I decided against it.
> 
> ~Andrew


