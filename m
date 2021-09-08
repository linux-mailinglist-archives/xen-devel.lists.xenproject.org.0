Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299EF403CE2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182291.329795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzsQ-0004Cr-4i; Wed, 08 Sep 2021 15:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182291.329795; Wed, 08 Sep 2021 15:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzsQ-0004Aj-1A; Wed, 08 Sep 2021 15:52:42 +0000
Received: by outflank-mailman (input) for mailman id 182291;
 Wed, 08 Sep 2021 15:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNzsO-0004Ad-Gg
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:52:40 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32b3c195-d4b8-4e1e-962d-46fe59da3bb4;
 Wed, 08 Sep 2021 15:52:39 +0000 (UTC)
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
X-Inumbo-ID: 32b3c195-d4b8-4e1e-962d-46fe59da3bb4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631116359;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fjAUA8/SCaXIMH4joHqSzWUdjZCpXtr4qcdp6nCSKTs=;
  b=DGsPWCO9YinwRIcL9RgY1ObaZqV/TMcV6N9HJ2RzuHquNvioTvJCGnuL
   vxi8ihvLQLKlwOUxflRZspxDbT6GPbvpwStNh1NKZFCFXAJywH3nQXI2d
   uQHgMCc54WhcrWt6bOWFmiblJNTSfmIj7rnDMIOqjkOrM6cRKj6xaQW67
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dyUNGmK3EyFGR/8cEav43aTX3GNY1ZUNZ5FobnGGBq3NfBFiED8ViNb/416gxE+Sf1LW75pwAO
 esmZow9MpEHL4r7pzhPKUvup9q2J1Xlww+HKnONjqX0tCtogzCW7i/pIb5jSPU10QIHwnS1+8m
 bRVIbM1F/P6THVfQnLKpcVKZgV4uiGiYS6oup3fbihjBRSRulp3Z9EfiLSCP4k6TTPO4RrQxrO
 B1e6tYDxMpNzVGFOqb+ZCgKPzQZUvJhkjTPKQCXPL1MFrK28bqTV3OogM3TsjabipvbQ+ORpwN
 oSYpwaQsAYllfUQDMhYhw/i1
X-SBRS: 5.1
X-MesageID: 52272560
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3fe38a7LKKbwfIBpKwPXwKvXdLJyesId70hD6qkXc3xom62j9v
 xG885x6faZslwssRIb9+xoWpPtfZq0z/cc3WB7B9iftWfd1VeVEA==
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="52272560"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKwTmdsHdGRC6HSo8ExStgLb3rLxfm/41Z6FehcPI+OajPCBikiq3QMlNogZ9Zai8eCE9bNj/tQ/yGM3jKvfIJXxVxMERzcXHp0mojErmM69RGYjLdSWr+a29xH6HXNyOGMpo4rACVxCF597KzkCJsKWler9zycLTbXFRngBZ+yq93atI5FXdMKi1hsXl4p8qXM44S6Zz99S0gAg4dC8jgGHxrsk4wBxsoqpoQtmSuiopFaVUA/kBjDtsAufBJhCeBOsdfwJjxq0hGBZ4QNJyhYmGa5m6Fsu1pWsao4flyJGrVV17B0ecxVLm6jBTkttG2wc608iaUsmjis3I7NLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cqjBOhqeeDex+h7447RBggMUvcd6fvUwsbvwQzNF4rI=;
 b=NeBl3B70lWpQgYMHd/9POp6o2reksvto2E1vOYKjDyKVJ5XUH6ipqY6+39Rez+2J8v3UpUqXwMCy0BBFrymM0RgmPaRXFyM9VntItV1DRFal2DEtMUaC657ME6MOvxLOBDd8+jFXlBvOaODVw32aNFWxSYa51fYP6Z/JugjmLgkrPGxPjd8dwg/hfojxJyUsPNe4NKMyg11obYMJAb/rzU0Afz4U2zXXR+pmSy5wQ3gtGJZm+JaCG66USLLsDnhR+LpUV2qJSck7sUk3FZiEmhyZLYSnqoQI0yTv2njhPAYxqqPp4w3YosbXNlucq/7ZD8MgIHVj1rOY9F9pyMP5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqjBOhqeeDex+h7447RBggMUvcd6fvUwsbvwQzNF4rI=;
 b=lxKCRwWgeOzZyi29Gd5hK8PPJxVptGk5cVuR/fVdeZc+DQTJ6lROWdJMAj5smPwsFtT6Lz1nCjoV/+KoEi8BQvI9QREnQlimHrSO/YJNXJv8OyVbWdArX8WWTTRwpX6YobG65XUW7lsEuoRwFsLSfS59/qo3IT6v/L3yAjzVXF0=
Subject: Re: [PATCH] x86/amd: Introduce and use X86_BUG_NULL_SEG
To: Jan Beulich <jbeulich@suse.com>, Pu Wen <puwen@hygon.cn>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908135931.26275-1-andrew.cooper3@citrix.com>
 <2289cadf-0dd6-0b5e-39f2-99ce6f522bfa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0b5c23d8-374a-27d8-76b7-e5a77951fdd6@citrix.com>
Date: Wed, 8 Sep 2021 16:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2289cadf-0dd6-0b5e-39f2-99ce6f522bfa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0255.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca70addc-f84d-4584-8d59-08d972e0ac7b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4296D94D9AA353DEA7678B51BAD49@BYAPR03MB4296.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UDKOJpyqHRCKa73Qur8P4K7HkCVzOPqUpc0Vj/RmDnXo/V9ZDtdtL/CtDr/Zuam8WHS7TPz5iVHAowhWU00mvVYyPoKAr8s+8VHuwkWdKMnE0X/9GeqOcsR+iHDarhfE5S0osJl4jOfFqPpggexSNWC0pB64H8BlUmfuUIh7aqe42VfDM8rVy4+zXmEZuzC7aNdYK8vLFyhQ0P5AhfkcKotXWzuhjJvNftfLQySyeuJOEG0e1h3aAWU4ssC2dDKBMj/RbKXN+0fhOfToSym6t/itkspopXcOOhpwPuyzzO90HOYdJMZdTpg676zy6GPhdTDB2YEf22RN6I3Vss9iPid/ck1jmDUmVjDOJcmWYSNLaPyd19tZN8/a2PT4mPnnkfQNwchr+lMRnpgRnqJla7YeMpf5MyIiWhizVZdK06zPWih6olUGliVQsUq2zS6g/YDkn5mqNFi69dxJd4BBe3CqJzcnNOdu/qQM0P/evASkOTRLzZjuyZC0nBs9rIt4TXZ2PGHN12unVrAn0AIgGf9O9YXxxxpt33YOKEdrNBC0xGRy61MWsa9aZnbHCHXME46dcmNMRRL364nhc5C7O3BbMv7nCixQjQ4OT7ppP/8lr8d81ILghxtw99qw24jdy1ijeJ0a5U+EyxZLhB59Skf1MQXcLtZzOVBz9S7m24mJiCvF2gOdV1eXnKgFq/sxAoCJzJV5JKfxB2SBrIS78c84xR2CVH7E2Mkm6m2aTiw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(54906003)(110136005)(26005)(31686004)(478600001)(6486002)(4326008)(66946007)(2906002)(6666004)(186003)(2616005)(956004)(86362001)(31696002)(53546011)(55236004)(16576012)(36756003)(66556008)(316002)(66476007)(38100700002)(8676002)(8936002)(5660300002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZ6V2N0bTUwV2FFZmZvU1M0UWRQYlY4djlQODA2TDJIQnluTjFya3JrclFP?=
 =?utf-8?B?TWxseEhLTXRBQ1JlTkdRSjVVTllYRGJUTEZpamtRV3FPZ2lBcFBTMnZUVUdK?=
 =?utf-8?B?Z3VTM0RUdUN6YXZvdHc2TEtIU1ZsM1BXT1h0Q2ovaERNMTBRd3Bwc1dkeGsr?=
 =?utf-8?B?UjM1ODVETmxrQnpRRlF1dFZKcjRGc3RQalJNcTRvQ2FWaXpDNWVBdlZSZTVK?=
 =?utf-8?B?b1h5dmV2cXVDVzRxNXZDV3ZvNmUyNm1RSFh0WVdzM1JmTmpHMlRQMTBJSzJN?=
 =?utf-8?B?MXNBYjRRWmZzdVAwYnpETTBodURPYnFSdFFCMzM3Qk1rcU01WnNiUXpHbUNl?=
 =?utf-8?B?WjJWcGJia203TEtNellBczRFWm5MN0Rka3dCUGd4RlFVMDJhbzE2WHBIU216?=
 =?utf-8?B?K2xDZ0pTY3MvTndUVUhpYjR5bVdwVTBLWFJEUVFYUHlMWWVtdkI1UUlqejZB?=
 =?utf-8?B?K0JNUUhrWGR6U0JsdXBFdm9Bc3ZzUTU1T1JjL2paS1huS1lEY09oblVERk0z?=
 =?utf-8?B?T01YeFlMamw2TmtmZTBUaXNXWC8vTUZFL0p1cWVrcXc2TjIrU1ErWGptaHQw?=
 =?utf-8?B?b3owbDl6VFZXQjVTVy9PWHFwTjlpM2hscnFxVWFReW0rcjFHRmpxOHlFVjFp?=
 =?utf-8?B?eW5HejR6UU1kUTh1S1pjNWVIaHllR0g1aFd3V2tvdHdHNGp0a2QzNmY1aFBo?=
 =?utf-8?B?TzE1U25SVmpSVEFzOFpydHNRS1Q5YWxNRGM4WUZYeG5heURTdG9SUVVHS3Rm?=
 =?utf-8?B?enM2MFRtZVYwVjJsOEhRQ0F4ME1aNDg0ZWh0ejlQVHovczZmYWhaTzVoYTBB?=
 =?utf-8?B?OXNRNGRNaFZQMi82dmQ4cVl3ZVJvNDc3YnltSlpwVVE1VnRXeFlpRHJncVE1?=
 =?utf-8?B?cDhpOE5Hazg0L3VEcU1US2doRmNGYVFTSjViaGRJVDBKa1FlKzhJZFFiSzAx?=
 =?utf-8?B?aHc0blRvVHVKc2tiZG5DLytyTk5rdmZwZDhyRkJMNmsxSm55QnZ1VzdqN0JK?=
 =?utf-8?B?d0d0UWl4aDBRV3Q2YU9HanNRQjNXRFVTSnJOQ0V2cEtVc1ZMNmVPMDU3dTJh?=
 =?utf-8?B?bDdQT3QwTDhxaDJQcTIwV3ZoM2VHVUNnQlJpZndsL0xCSlBXdnoyNENpU2Jk?=
 =?utf-8?B?MWJWVjdnR2lrSnY2RjJMcGlHUDM5MzZLdXltRjdEbFNYUUtmQzUwNGpvQ1Yy?=
 =?utf-8?B?Zk5BQlUzNzZDeThrODh6cFMrU3gwODNsU0JoVnQwREJMZmlMRWV5cDdJaU9p?=
 =?utf-8?B?U2xFQk03QkpmZlZneHo5cGZvc0JNeitKYmhwd2RDRVY4MGhWbTM2eEJUWUhq?=
 =?utf-8?B?c3FHR2E1K3I4VlF0Y2dHckxlaHd0TVA1VWFCOXY4bnBzNDVCK2h6dENHZC9B?=
 =?utf-8?B?bXpqWkF2NFhhY0JyaUZCTmlxOVRYa1hSWkRDTXMzcENhMVB2c0NrU08zNGw1?=
 =?utf-8?B?MlVwWTNHMVorU1NDa0lubERRS3IyWjlIajJoOWZKOVZYTnZ4S2VIanZUQ0Ri?=
 =?utf-8?B?M0xSN2FucG1qRVZKYk9TNkFtVmgrUHVQL0MweDNwYXR5TFJlT2xxczduRGlt?=
 =?utf-8?B?aW5jNjNzejlPaXA3UnkwUmRCdlp2UEFFRktSWUNyam1aZzgzT2ZLQ1NpU3c5?=
 =?utf-8?B?UHdKL3MvbFcyemNEb1FoSUxNa3JSVlIzUXBLcG8wMnlTNEFubmo1SzFhL2hP?=
 =?utf-8?B?N3VDbGpPYzZwV3FQT0ZxcGtVNGJtVFREQmNRUTY5UW9oUjhtdDB1WVVmekRV?=
 =?utf-8?Q?6ddkmnqkP3KsRxcnfxWMFRYHQ46udi1+GKZtI1h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca70addc-f84d-4584-8d59-08d972e0ac7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 15:52:34.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oXdQb41MckH1fYw5amRVPda3FPtVuXff02h98+HxvUG6dIGyTGEMf9JPip23O2rv/T6e7DJwEjfLfz2yQPdGXIcM1IVPd3jee8PUAJxit4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4296
X-OriginatorOrg: citrix.com

On 08/09/2021 16:06, Jan Beulich wrote:
> On 08.09.2021 15:59, Andrew Cooper wrote:
>> AMD/Hygon processors before the Zen2 microarchitecture don't clear the base or
>> limit fields when loading a NULL segment.
>>
>> Express the logic in terms of cpu_bug_null_seg, and adjust the workaround in
>> do_set_segment_base().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit with a question (perhaps to Pu):
>
>> --- a/xen/arch/x86/cpu/hygon.c
>> +++ b/xen/arch/x86/cpu/hygon.c
>> @@ -40,6 +40,13 @@ static void init_hygon(struct cpuinfo_x86 *c)
>>  	    c->x86 == 0x18)
>>  		detect_zen2_null_seg_behaviour();
>>  
>> +	/*
>> +	 * Hygon CPUs before Zen2 don't clear segment bases/limits when
>> +	 * loading a NULL selector.
>> +	 */
>> +        if (c == &boot_cpu_data && !cpu_has_nscb)
>> +		setup_force_cpu_cap(X86_BUG_NULL_SEG);
> Are there any affected CPUs in reality?

Yes - the Hygon Zen1 uarch CPUs are affected.

>
> And actually (only noticing when seeing the malformed context
> above) there look to be indentation issues in the changes to
> both this file and amd.c.

Ah yes - I'll fix on commit.

~Andrew

