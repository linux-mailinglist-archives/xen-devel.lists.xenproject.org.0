Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5616D009F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516562.800875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1php9G-0006Bo-Gc; Thu, 30 Mar 2023 10:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516562.800875; Thu, 30 Mar 2023 10:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1php9G-00069B-Ct; Thu, 30 Mar 2023 10:04:50 +0000
Received: by outflank-mailman (input) for mailman id 516562;
 Thu, 30 Mar 2023 10:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1php9F-000695-HI
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:04:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d77ecca-cee2-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 12:04:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 10:04:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:04:46 +0000
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
X-Inumbo-ID: 4d77ecca-cee2-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk4/Mzse5TTJ2PHRhDafkmdhBZMvkpBXyeqPsF1P0Ko6U3lyn6efV7PXmPnvk945EEIQyoT74JQDJBwFx+j2Wjpjy6UAi+cSL4GtLfnOx4+hWhhKMf+e4wsSqCq2F4sYy0axVFVas9ahiZwiGczYoCY4HKVtDwgJ/GtF8jw4euBtTTwFWe2iZRWTS6AjTgnhrWAUK/u+AD50/YCF2kiDtm5FAWZ9dFFTqtcbyMe548+t+jOdOfyYEHLJ5ONHUZlWQuxOxn3jnvyPr1xTD0aDqmaXjq+WrFax05LHZ3UWHVvkUu/MBPEKNtQuWk6nOM3n/S1/Gl639chN2NgBPnhgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJxnHILv8YrC+nRl0RWcJEJl3oIOaH/Q1FGBUlFzHiE=;
 b=Tt+Tqc8YSSBCOn6Fcewox+hRo43WMy9Ch8jnvC42ewoZjnIu0i/BqHd5O3wjQ/lKYh0wE81TG/6iuucIXXW2iUx+zZ7Wpu4ise2ZorWtO9tOggeWIF1hW+oJ82EwzCgm2wlAT1yes9h7+YjRioZGajDTRXD5srdGqn7AGAzRn/Yj0yIQdRTaBUq+R3HRDK5qWIYTYzClvo8y7uWr3hsYeWHpUX8gi2iaMrbdl0jv++oeZLgnbfjurzEYi4n0mUFOi1AgzqDLQICjZFbfjWzOp9NTGY1pX+JEYUWeMGzXReR+TCoirj6F1q4wysczUBrjIv7oRYxmIrf5uHbFrS2klA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJxnHILv8YrC+nRl0RWcJEJl3oIOaH/Q1FGBUlFzHiE=;
 b=RZQXxa54mBG5FlLkeySv4dsuxPyoavveXh5R9iSluvmyBTxO08mTBqxITLzPd4P7yQ2t2AEeclyESStVO9xp8auTxTXq9S9Up45V/MOYsKJtJ3YZxoC5SmZ/Xd5+vXLCsc9e2gOL2Fesq7ii6ARoPbyylviQCgmrK4l6mKSZE6wmlanQUg7vT1zht9FqftQ1c0VTDq56my7YF/RO6BEr/XmFV7wtMwgTJP4f0k7r+nUSgRz/5bNrVp5umY96XGvq78yFkmaze3zzczwvDkGpoxjSrUYh5NNOt/1nqqJXCuBCADRn03m1okMEkpEfCLKUuFoNkHRw+kv+gYEMsdApNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf81c142-766f-9186-27b0-e3262ccf62bf@suse.com>
Date: Thu, 30 Mar 2023 12:04:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 7/9] x86: Merge xc_cpu_policy's cpuid and msr objects
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 42339b82-0e43-495d-ba4a-08db310630d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ik/I8QsjfPZMYpeKf/IFYpV6Vs9uU5W2e6lbQ0NhnHlCD+Dv+5lowr6BoiboF4HF70nomVQ9bGVEqtbNSPFe9vj3d1bl/ez/+iHUf5GpMLuMmBKKF8PRrcuEqyv5wiLSL/f9Mti/eAk2rj5wDNOVUsnhThjLlsVfJkA77cNvNqv32EGE/NVDhFMw8VbDOMzoeeS8oucP8iJBiEj3FwvEwfqzroP+ISijdDCrvvYps/zNqiGAQFzQjAii7YHJitjLAa2h5GiW+wNmp2JGmcmNRhgwia4O8wVSotWCClDMNial39LpDcpVitJMC1H199EfUrfpD7yxXkgnGxkeBFnwYYcI1kqq3/5uCHx28CHMujT05nCwpHml+uHL8+x4zJXI4lpNnAHY7IcK96DlERdrLR0/WL2UpFT9yIfqgaGIIWgNULUY/u+zDLVI8fhpzxVsloOY2vzFy5cpkyTgMAIC3EVgUiYhlSH1omwQOv76jVGFd/SH7tysreyY1DgLY8aEAchzT2PwdTMxAa8pVbBlpCqndoWX2ZN05YSrDcB2+xOQ2QrxYwfl7w/tPb5cRLI6vFT3HlCRst9Hz+DXR6B1VSQ7UIFowvn5V68Eo3h815YtEybj2x/QcAtMkmgsSwaLyeBm/oo5QnhFiuypLzy7xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(2906002)(31686004)(66556008)(66476007)(41300700001)(66899021)(6916009)(4326008)(8676002)(66946007)(316002)(2616005)(54906003)(478600001)(6506007)(6512007)(26005)(53546011)(8936002)(5660300002)(31696002)(86362001)(36756003)(186003)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGZlMXNqb1lLb21iWUxiTnRUeDdNT1BCd2htam4zdlBtYzNIeWJDQ2hQVnRP?=
 =?utf-8?B?a1RYY0FyMGNiaGVydEZvV0IzOElnRTBTSjhvMjBUTzlGZWlmb0JnSkVCdE9J?=
 =?utf-8?B?VUlpVGErOE1ESDVFQ0hxM2w3My8veXRHSGkwZmpad1lOMU1IUkpscFFMRkl0?=
 =?utf-8?B?eWZKdWsyaTFSUFIrZURMbTlQZmwrOWFuRTNWTGpHL2UwWVVNNnpTbUFvMGF6?=
 =?utf-8?B?cnlXdlZ0LytkWHpodkdjems0bCtYMHRrTWNNdE9LT2hGajF1dkVMRzZJUVVW?=
 =?utf-8?B?MEJDYkVuQWdxbnJObXd5UmhwVFJGZ1V3OVN4VU9aVkY1dUdKSlhlMml4YWpk?=
 =?utf-8?B?N2pKS2VGdGhCU3dvMXE0TS9qaVJDZ1VEUzZmVjBzcVFYalRqYU0raDYvNDhj?=
 =?utf-8?B?QjNGQ0kvVjlUZnlXYWx0aUcydlpjN3E5bjF6UXdUQTl2SWYyT2lTVnF3MmxE?=
 =?utf-8?B?SnRjRHlGWEVjZnFxTjVqWml2V1ZwbzFpZ1FXVlV1YkFzTnp4SWZMb29wc1lH?=
 =?utf-8?B?czNtVE1jU3UxTGFjbFh5R2hpODRaWlI4ZXVKWkJRdkVvYW1NVUFEZ0UxSkkw?=
 =?utf-8?B?WVBXdGJSdElWT3V1R2V0YXZhNTNBZW1kdnpnU29tbENnSFRmWXEvRDJQMEZo?=
 =?utf-8?B?d3BsR2ttNGpzeXJVMGJqTGVlMllDL3RGVUtqckF1czcxakIxdGg4RThVRW1U?=
 =?utf-8?B?cFhxcUt5RGk5Zys2bXVoTU9idGdOeldTL0hWYjhDOHQyS2xORXdnS1Z3SUhO?=
 =?utf-8?B?dmRVY0cvamloRVRtdUpudTJrUXZHSW1nY1BmQW9LeXdUT2dNWUtzSjYwNnpz?=
 =?utf-8?B?NnBMQXV2aFVSYjQyU3hqdjlvY2xQdzF5Wjk0VGt2UDR0clhhdDUvNjU1blZR?=
 =?utf-8?B?MW5TWDQ1Rm1RMWZFQklBK2ZyZFFXT1F0MERUNjljV1Z3dlRxeW1POThBcjBF?=
 =?utf-8?B?dkJyeVREYkt6clhFcGYwY3NoVmNhdmRBOGJTRm9hemtwQ1F0dXBlaCs4bzRt?=
 =?utf-8?B?QU9DRVpCZE9QSWJYMHAwM1lON1RxcHkrUmJYYllaSnRnazJQUVhaRGV6TEFa?=
 =?utf-8?B?T3ZpcVpmTzZiZVFYeU1zM0JkN1E0QVphNlZmRS9tbVJCbkE5dlZpVjFKOC9l?=
 =?utf-8?B?LzJ4T0pPNG5ZQXZoWG9SMy9IL2hrY0lUekNGYmtKYXpwYlFVaUNSRE9ibDE4?=
 =?utf-8?B?UE5aL2pLUlo1RXIzNmpFSWpkTDJKTEF0V0pUN0xXWFJFM1lFcUFtNWF2aVdr?=
 =?utf-8?B?dFNhb0l2aFMvOXBvOHRQSkhTRWhvZnFpVkJHMUJxOGdaMXNhWjVxdXlpZ2lp?=
 =?utf-8?B?ck9HblRuY3RLY25kUlFKb08yWTYwR29KeHdXZVZLQ0x4czBLYlkrTTdvb1Zl?=
 =?utf-8?B?bTZKWXJuTVYyVFl2RHFHWEVndkRwUXpaZUxKQkkvSCtFSktGNkUzOW16c3oy?=
 =?utf-8?B?blFTK3RvWEF4cDBTSVVLM29LbjBNNldIM2FjRVRGckY0aXFSc2licUxrS1Jn?=
 =?utf-8?B?NFU5YXllRTdRVWhGTDM2b3p4WGcwT0FVSlF3QXpSaWRwQ3d4aFV6Yjd5VWdx?=
 =?utf-8?B?TjFvT253VkV0YVpJRHdqbTA2YWV2MlEzSE5SMjliSWZaYUdOeWhlZ2d4eW9T?=
 =?utf-8?B?UnoweUFtZWdpWFdvNnBmOWhCOElwcU5HOVpSTWZkeXV5U29mVGowS2RNT2F1?=
 =?utf-8?B?RTU2RXdQT0orN0FncnFGTnBGcWZWcXJBUGo5VFpkTXh1NlA1Tk81U2Vlb09N?=
 =?utf-8?B?b3B1VVk0ZGRiaytsc2lzYWduTloxdHRBdkNQL0ZCaHdRc2hqdlJLWnRjUDRD?=
 =?utf-8?B?Wms1Q0dwTTlodnJpMWxVRlpuc2VTQkQ2KzBSUE9qRmtyTWhyUnJyTUJEM0Ux?=
 =?utf-8?B?TENkdG15OGEvMmFnYXBubTlJUlZZa1o2dHlIZ0hYRUdoSkw4dkNENVE4Uk9V?=
 =?utf-8?B?dzAybFhtWjdPWFUyenk0TldEZzN1UnVERjlnSi9nVGpRZXBBUVpucjhadWQ1?=
 =?utf-8?B?Z1BiQzArTXhRTHl3cjdsSU9LNUUxaHJKeERlM2w2L2F6eEFXcVJFdWw5N0ZY?=
 =?utf-8?B?WGtBK3FQdGk4ei9WTDRsUjVHSDB1b2xTV3NORmlmNUUvTzllaHJHZVhVUlVO?=
 =?utf-8?Q?S8TPnpiGhdWtBa4zRhPJWc0nL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42339b82-0e43-495d-ba4a-08db310630d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:04:46.3001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1dkNjmqkRHoYdARD8wc/33OS1reJYy018y+3I4ddljWw0SyE1eb7SFLwzHSJhO6q3TB8fgsMqkvU8l1RB9z8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

On 29.03.2023 22:51, Andrew Cooper wrote:
>  /* Sanity test various invariants we expect in the default/max policies. */
>  static void test_guest_policies(const struct xc_cpu_policy *max,
>                                  const struct xc_cpu_policy *def)
>  {
> -    const struct cpuid_policy *cm = &max->cpuid;
> -    const struct cpuid_policy *cd = &def->cpuid;
> -    const struct msr_policy *mm = &max->msr;
> -    const struct msr_policy *md = &def->msr;
> +    const struct cpu_policy *m = &max->policy;
> +    const struct cpu_policy *d = &def->policy;

Looks like you could reduce code churn by keeping "cm" and "cd" as the
names, which would also be consistent with you continuing to use "cp"
in hypervisor code.

Jan

>      dump_tsx_details(max, "Max:");
>      dump_tsx_details(def, "Def:");
>  
> -    if ( ((cm->feat.raw[0].d | cd->feat.raw[0].d) &
> +    if ( ((m->feat.raw[0].d | d->feat.raw[0].d) &
>            (bitmaskof(X86_FEATURE_TSX_FORCE_ABORT) |
>             bitmaskof(X86_FEATURE_RTM_ALWAYS_ABORT) |
>             bitmaskof(X86_FEATURE_SRBDS_CTRL))) ||
> -         ((mm->arch_caps.raw | md->arch_caps.raw) & ARCH_CAPS_TSX_CTRL) )
> +         ((m->arch_caps.raw | d->arch_caps.raw) & ARCH_CAPS_TSX_CTRL) )
>          fail("  Xen-only TSX controls offered to guest\n");
>  
>      switch ( rtm_behaviour )
>      {
>      case RTM_UD:
> -        if ( (cm->feat.raw[0].b | cd->feat.raw[0].b) &
> +        if ( (m->feat.raw[0].b | d->feat.raw[0].b) &
>               (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)) )
>               fail("  HLE/RTM offered to guests despite not being available\n");
>          break;
>  
>      case RTM_ABORT:
> -        if ( cd->feat.raw[0].b &
> +        if ( d->feat.raw[0].b &
>               (bitmaskof(X86_FEATURE_HLE) | bitmaskof(X86_FEATURE_RTM)) )
>               fail("  HLE/RTM offered to guests by default despite not being usable\n");
>          break;
>  
>      case RTM_OK:
> -        if ( !cm->feat.rtm || !cd->feat.rtm )
> +        if ( !m->feat.rtm || !d->feat.rtm )
>               fail("  RTM not offered to guests despite being available\n");
>          break;
>      }
>  
> -    if ( cd->feat.hle )
> +    if ( d->feat.hle )
>          fail("  Fail: HLE offered in default policy\n");
>  }
>  


