Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263067B011A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 11:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608822.947569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRGU-0002b1-FM; Wed, 27 Sep 2023 09:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608822.947569; Wed, 27 Sep 2023 09:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRGU-0002YM-C1; Wed, 27 Sep 2023 09:55:30 +0000
Received: by outflank-mailman (input) for mailman id 608822;
 Wed, 27 Sep 2023 09:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlRGS-0002Y5-Nd
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 09:55:28 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa462d36-5d1b-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 11:55:24 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by GVXPR04MB9951.eurprd04.prod.outlook.com (2603:10a6:150:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 09:55:21 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 09:55:21 +0000
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
X-Inumbo-ID: fa462d36-5d1b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUrY8TbvxWNnxbThYNTwylmPDODOfvo6rA4LDqZe4iOsU7KRVV+RRYFvCjrhDq2AEokrqiX78qoHq/chmdMB9Ie5RqhNmQBjuNjm2edmCNLLWJwIOWIOcDsqkvCPV5xP3u3g2CihMds8iVHezuagG0o8CJKXcH2/UcpQprQBGBbRwo5LoIwvEXQGfyYAGEEmHtAkzhD1GaPSeEjlcoYNr2VAAzfWsw3XD+DeZ2eudbwr4af0uTkQ0k9LbQumhkBFQ4nc0ns7tF9rjxj6pjGw+jw+XzY/yU4PPwoWrr5k1KHyOIZSLQWH+B+6VLAoaqBPyGFcGW5n4KmmU+STt4EdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZK5W22VBLkSZiXmKBK83nYJ6ueN5kvZsNOsOvMCTUM=;
 b=Dt/QMsw8v0OyY3y7iu3B5Q8HIxbylLhgIszm5KZGhg7IAhe/Ppb8WheW2nV1EVQ32ITdjWqCyStDGkwEPxh8gvmitRuxsWKAxP+TWsAcLxjTowXyksFtVohg85bhmPtEv4/HNFkZNrg2x/kuZVDgNrExgBswYkQD/GHwMIMGEcIttsc1RmHpLF/HcnxqOmvhZG8HhBkCMlA5YFPtuNN5q/jc5YJH7HcyGB2F61cplJCRk+aA69RkoUvPyvk802wE1DLq84j3f6i/0vbvKLohPOfhHsWW0AJXd/KYJFmIYJfxsNWBtdbrem8iyzkOfrssIsYQFD+NVxmRWmT2ntH2LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZK5W22VBLkSZiXmKBK83nYJ6ueN5kvZsNOsOvMCTUM=;
 b=mtUmGCkPbdynlq9yix6DymSazUa9ImAWXr3RFTmNZsZVskf0/QvVl/8TgjtGtcSxx0cB7LCG5CgeysfAzJcwjZOzEIThMQRfOgdruLFyeVaznI39mWePPi++Aoj3kZtnxenLa78gQ2Kk+25FqlMa0IbEEjqxuOSdW2pvPVu7DEs0FYlfQl1+HLA9KVI6Z9Y10xyJnAWoyMVcDmb3q6K3treO2ZW8aTGirJJ6UEUGNiQy4+7AB5GYi7wU6WWvuf3okpBgTLnCRAnwyNIvi0rZeZizUGta3ABxMiUKDaf3gn57t8lR0C28OI62Qo5k0+P49f3YatvFSGAApa2Ztz700Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e1e0b28-bb0b-03f9-d62e-dd04846dd2e4@suse.com>
Date: Wed, 27 Sep 2023 11:55:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/8] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
 <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|GVXPR04MB9951:EE_
X-MS-Office365-Filtering-Correlation-Id: e710981d-c930-4adc-fe54-08dbbf3fdd09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o8t/Jo3b2odl2SMl398G21XetEevYdbR4sVoTTBYEylbXPdoCYnKD5C7zuKkltcX7/eSuuoMQu/XwFk1bc0p/HgAN4RiDduXIEcljKiQ8IJG/KopEn0CPV5pSxhOGMktESsNl9Y8eCrYfdF3hK6ydXOkWkQK/O9O7lsckIS7cGs+bGXiL5wHfUaQooOwsnQa+xTXwUItu/3vM6MltEIK4hg6MiEjLtbpFwZ91qLSqyLEZ+If6+XE/ltLY9klQDXRm1tWg2myZgm6o9dtd/J1EAsWSqutjZQjGseSepw4X1EYUK+m6cpxj7u7Xq5SVdTbocOJD0poohnz7UOubPO0oeZ6Nrd5irawxt0o6/792kWNIRytuT0ropWD9Lft2qAPkAs2agaO7VgFyHU7tuGt3WHVB1wrdiXeFv+86ZHoZGxCgGBwHKrL/xRkMB8Xe2sZ6iIiLlc8PYEYBfjR3zfWj1MxTAqaKCDeQ7intqCx6WOt6wEAC/g4iO1lmsQGt+McXRMvG6a4WtmLaWXDomjz5BGBJi3lrlLSDQGlyAn8WzbGTysSVfif0fyBMojjLwsbhBRmY+RHI/UlOkYEns5BMFOZQiA4lAVcrZGMRO5Hj3dXj6Y+OeRDAw6kRvlq9vT/cYO77wjqmm25aU06sCB4RA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(54906003)(31686004)(6512007)(83380400001)(2906002)(5660300002)(316002)(8676002)(36756003)(8936002)(4326008)(66476007)(6916009)(86362001)(66556008)(26005)(6486002)(478600001)(31696002)(66946007)(6506007)(53546011)(2616005)(38100700002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2d4NVcxaHFCTXdpQUJDNGU4eHpoMFVZRVB5cC9nV21wY0YrY3J4N2RWdFli?=
 =?utf-8?B?VTY5SGQzZUhtOWxhQUVEM0dva21aTG1OVEdCcWZmd1J3UURRYStINjgvbWZN?=
 =?utf-8?B?VjBrTzJlUDAyRFhiTG14R3AxZkRIRFNwZUFtQUZYaEg5NjRlVlZqSnNaOHZM?=
 =?utf-8?B?RmdSa2xVbkt4ejRORUs0U21ndE9NTElsNmNzMU9WNzkyQjlqZVR5YUl2STgr?=
 =?utf-8?B?SmtpZzhwVkJDcnJhbEVpNDlJSy9rYXEwd2c2UW5yT0w4MVJobExuL0Q3R3E1?=
 =?utf-8?B?SjQ5VE9DUWh6MERiQXdNN0I4MllwQWdzYm04WlJhLzNJSDZhQ1RuRXRXU3A0?=
 =?utf-8?B?V2F0anBOaTZmWUtmMkpzMmRsWk9iNk5MS1BhaTR4eGlaNm5mMFlXeTEwTTh1?=
 =?utf-8?B?ckY5NHU0RXZILzdFL0krMGdNc25ybzdLY1FRMmdJeWdlTVJidzNJZVVZblBm?=
 =?utf-8?B?dStiUndlQUpRdUZ5ZkF1dnJ6VTJya1JmengyOU9OQWIwbERnME1lQXNsckpi?=
 =?utf-8?B?MDUydHBMdUx1STdZNmphQlpNNnRkWjJ4aEZMUEp4UTBvMlNhMzErVHh0UFRj?=
 =?utf-8?B?RG1xSW1kbnY2bHB1Mnc5TTN2TEZRZkhEaGxYRW1SUkd1YWlBSGNWaHNCQmFM?=
 =?utf-8?B?VS9CV1FXVVJRSDc5MnZRNjdlK2d4UER3SGNiT2MxZXM0Kzk3aCt3WFhtRnJk?=
 =?utf-8?B?RDBOZjI5KzdIWlBGYjREcko0dTZ6eWFmdVhuYUNScDBTNmUxbGE2RUQ1czNN?=
 =?utf-8?B?RC9nc3NGdnY5eU8rSVFZdmRWUW1uU3VMVzlCVjc2c0xsSm5ma2FMTVNNTEZx?=
 =?utf-8?B?VkR0SEhGcGZ1cnFDVVI0NGFYd0poRm9TR09iQTQ4bnEzNUdnNjJ5RFlWMUhK?=
 =?utf-8?B?TXVIQ2NQS3lJNzBQSFdtcURQL0pHZnNIV2RpMW5jeHhCbE54NTlpNVZ6SEYy?=
 =?utf-8?B?anBxOVl4L0RlakVYTW9TREpGSUE1enZlQ3pITDRIaDAvVW1uUDZWQzZkenB6?=
 =?utf-8?B?QVBjQURhOHNLQ3JpdG5hK2ZCRUpIUGpDN1QzU2NpQ1p5bUNPajQxMUV5RXFD?=
 =?utf-8?B?cldmMVc4SzhETWpvRnZxOW5TcG5kUlRDWllKZkh5Nk1oMWtJMXZESXk4RTFP?=
 =?utf-8?B?bTZGSnc1MEpNLyt1Y0RpY01iUjA0b3BUcDJCOFpoUTYxa1JNQzNjUWQ4Ykp6?=
 =?utf-8?B?YmZjYXc4K3g5aXM0RlRoR1RRM1lpbWdmTW5JT3dYbVlHeloxaDVrL0wzbnZL?=
 =?utf-8?B?ZHppejFxbXVqM1NDQ3U4QlhLSG9acHlyUjNiMmZSZVUzQlpzNFBodC9ocjZP?=
 =?utf-8?B?K0lvLzh6TkVtZDNpYmE3R0VWS1pZSm5wcUg2bXFhVFdpTG9WMFBPa3N0RTB5?=
 =?utf-8?B?eVdrOWJYc1ZWcWhIRitsYW0xeDNYY1gvN3hSWW5qMUVMUTJPSFRIMENwbXNO?=
 =?utf-8?B?Ly9MbURXNjZZd2xORGsyL3BvMitTOER2RHNvbWcwZFBmb1NBMHhOelZHc3pH?=
 =?utf-8?B?OUxvbHpZcHdRdDFmcjVDTTBGVEJ5Ni9YQUc0cDlqZ3NNQThTWld3UGU1QTE0?=
 =?utf-8?B?ZnFhTkZ6WHh5QjFCREJQNWlNRWdtSnVCNktlYlkvV201U1YybEVXbTRoT250?=
 =?utf-8?B?NEZuT25GQVl0Nm1JeENacWNDeCtoQjVkNmJjTTFkTDc1MHJiZkZ0QlhnTGRs?=
 =?utf-8?B?b0xvOHR1czdDOWtIVjdvcEJMemZDN1l5ajVTdTFrVEpJcW1TMUlza2lqajdW?=
 =?utf-8?B?cERCUlkzeG9EczB4ZGRLZnlsUU9COTFCdG9iR0dVSUxNa3ZXeG5kSVYxTHQ4?=
 =?utf-8?B?NHdRcFdhYXFEUkNoUHdZQW1WeHJ6YlViYzVzY2Uyek5UajZ2K2R0VC9jTll3?=
 =?utf-8?B?R1lZTmFlbnBUeTFqdVNCUG44Z1NHZ0w1dS9FWTRKemQyYWxOWVhZQnh1L2tI?=
 =?utf-8?B?c3l3czQ3WGpKTUVaMzFBS21YMDVrR3RYVHc4N01hNkwvZVZYaEQrek5GV2N4?=
 =?utf-8?B?SXpqQlNWOUJzems5QWhOR3pyaXNvQ0FUYytkVnQzajVnbklKRXJkM2EycTJZ?=
 =?utf-8?B?emVzZjh5azZVckluOFYyUEZZRDROcTlHc0t5bzkzRXUySDJlWHRsY3U4S1hw?=
 =?utf-8?Q?VfdYTOgCRi/41bCBg7ELndZDP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e710981d-c930-4adc-fe54-08dbbf3fdd09
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 09:55:21.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ezhx4upBoYfVTjSlaxTOGYHSAiznZjNNlNsnrRzB94OccKtn8zc//WrjZkNPanYGOi3AfykVJTHLG2A4/urig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9951

On 27.09.2023 10:51, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:54:47PM +0200, Jan Beulich wrote:
>> In preparation of the introduction of new vCPU operations allowing to
>> register the respective areas (one of the two is x86-specific) by
>> guest-physical address, add the necessary domain cleanup hooks.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> ---
>> RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
>>      necessary: Aiui unmap_vcpu_info() is called only because the vCPU
>>      info area cannot be re-registered. Beyond that I guess the
>>      assumption is that the areas would only be re-registered as they
>>      were before. If that's not the case I wonder whether the guest
>>      handles for both areas shouldn't also be zapped.
> 
> IIRC the reason was to unset v->vcpu_info_mfn so that it could be set
> again on resume from suspension, or else the hypercall will return an
> error.

Right, that's the re-registration aspect mentioned.

> I guess we should also zap the runstate handlers, or else we might
> corrupt guest state.

So you think the guest might re-register a different area post resume?
I can certainly add another patch to zap the handles; I don't think it
should be done right here, not the least because if we see room for
such behavior, that change may even want backporting.

>> @@ -1568,6 +1572,19 @@ void unmap_vcpu_info(struct vcpu *v)
>>      put_page_and_type(mfn_to_page(mfn));
>>  }
>>  
>> +/*
>> + * This is only intended to be used for domain cleanup (or more generally only
>> + * with at least the respective vCPU, if it's not the current one, reliably
>> + * paused).
>> + */
>> +void unmap_guest_area(struct vcpu *v, struct guest_area *area)
> 
> vcpu param could be const given the current code, but I assume this
> will be changed by future patches.  Same could be said about
> guest_area but I'm confident that will change.

True for both.

>> +{
>> +    struct domain *d = v->domain;
>> +
>> +    if ( v != current )
>> +        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
> 
> Isn't this racy?

It is, yes.

>  What guarantees that the vcpu won't be kicked just
> after the check has been performed?

Nothing. This check isn't any better than assertions towards an ordinary
spinlock being held. I assume you realize that we've got a number of such
assertions elsewhere already.

Jan

