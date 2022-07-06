Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1902D567FA8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361824.591535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zIc-0001FA-Km; Wed, 06 Jul 2022 07:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361824.591535; Wed, 06 Jul 2022 07:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zIc-0001C1-H5; Wed, 06 Jul 2022 07:18:14 +0000
Received: by outflank-mailman (input) for mailman id 361824;
 Wed, 06 Jul 2022 07:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8zIb-0001Bv-Jf
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:18:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140050.outbound.protection.outlook.com [40.107.14.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb588d55-fcfb-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:18:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7382.eurprd04.prod.outlook.com (2603:10a6:10:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 07:18:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 07:18:09 +0000
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
X-Inumbo-ID: cb588d55-fcfb-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCkA3BppV1zOgZuhpOj8fF1VdlCZq0qWEJbdxh71UsUA5fxFSXZoeXKqBFDDoCDc/f1Z6zOl+TnPIk/ZUd5KdjAirhpJeV+I7dMC5DjfeV902KPCCh/Jnt+CyLHzXFpzBekt/rvabnmg/c+XeKqVV1LbFmZON63yoqSGXaRiniJjnbyI47sIKix1eE7SBAZHKjbJUqtTauH09Wn/XPxIHZZKJlGwJhcsymqkGMtYyLMDGHEvKTbt8OQhRE7U7echmSy3E2YsjeLMfi28jZ/srP/W0siTW3Id2wx4pM9u68l6zyQCZKSlgOoaPk3UNPQaUPHvNi/VKhZFuuljQamxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M6YCCVgKCUlDjov+0FNJ1IkfPOdPvSMb4x+W+yB22w=;
 b=KCKpQC1WxXbWG/seDyc1O0fR4+XwlumUvgYXr/tQK5Q+To1H7rnQ2/K0vvgmKE3ql8vR99tpvf2j+167vYyKAZjoeWErR48WKh/out+W3xOQDgljEa+P1eGgzzdtXh0GYmTiRMaPVXivYMwUP/6qcTYlWa+x63h20CTet92UOggUdyoauDnfBPFTfWVkqX0y5wvPR9bVUN96sWXlLk6GnHUikTzF1BnLxbeyASs1AEnLluODCocJuNC5B/lBx27coSDGOu3Gnigg5NSq8Ly49oCgPIOT/1LErgWDUdNtUyoO11mjTfh382z9MulorZusWx7i2V8vfOkMqQwtcXLh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M6YCCVgKCUlDjov+0FNJ1IkfPOdPvSMb4x+W+yB22w=;
 b=KyRMMB8igtjBFeG91iZvWtq2rcVQr0xr95i5dBnUq0J5Bkpsrrkm7pm+lUE2MpV7L9LfU3hq/Lqg4rFWS6J/ElZCs3RIw3i51zXF9dxHsP7c/SMVyeEZy5Oa5EbWVP3pgTYxd0jVqNHYEb6BHktEMfde/Bkx+kREDIwpMVOh00x45nAVJncLglkno1ghKrJ/O53IOpclAM9hz7YX63A9MGOsc2tOR7T3UN2NFN9aR8+RmyczSod9tW5VV07cHZjLFI3KM3WTdEQ7sBERrrctDFBguimx2HymfdQ1cZDonFvH2Q3/BksHDCOl9UNfeBRqkhL+7lMyEvk8TXAT3OL4Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <540e8f0d-8a1f-f80d-c6f2-05192600c4bd@suse.com>
Date: Wed, 6 Jul 2022 09:18:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] xen/char: pv_console: Fix MISRA C 2012 Rule 8.4
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-5-burzalodowa@gmail.com>
 <47ed7737-5422-e4be-c99d-0e448616f5b5@xen.org>
 <fc36b54b-5bc9-d30b-3524-79711abbbdc8@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fc36b54b-5bc9-d30b-3524-79711abbbdc8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 906ba17d-a1ab-4d12-3128-08da5f1fae09
X-MS-TrafficTypeDiagnostic: DBAPR04MB7382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsEtb8YzVTFWp7vOVEnyWSk4iOVNN4IWfMnZp+2SK3oVc2QDwu8Tq8FtrYBhDYvAY8WlRpz7zJvsKWlgklgC2qLBIeRVuzA1C3dtUAU+Ffw+zD1Eya4xQgMStzGDWPgGReOeQyC84nLi5L/xaW9KLLCX9R6NeFdNrEGPR4g2PuRznH9Ue2/A5MxA9meTAc6b7mWSvAMGrMQ88TImFqZ/sAdhNiADR4Rg3IiQ9pPxd8EYwQDFnp9XOENg0+Ebm3hUe6GPQ28i5IKlkKoMpnBf0d0EiCIWGHp+vvPcsoxGDM0oP3CXNk+wI/1WAM94OfsvMSJPzh//GTbXzxSFgnrZ53tlTl8192cGgQ10xDeCo/gopofIlzTwI9Va0k0IR9A6fiFe/tRtQcGZjuPqm6LCUUk/BoIO5fC0iTbm29JvOSuURHsB1MdQYNPfTeoguRuKrYMCM0rD9sBDf+2kMbKITUamV9kdL0ATib4VnZKTL64c/axbsIyUw1rANoy4R2wQKGPlE3SrjFb0KIBhmE44mHcDL1iXPDYBqM8GXEHP3j+IehgaVaycpoAmPXsYRY7O1aiuEMWPZwRv59Bx6OyIRqvHvrFoSKeBB/D6aoIdU3LSucWFc+Auc327+zoFub30K9MRPvsBARJNRtDloV5gP7Ddfn2jNc1kBw9MXMi3ICrW6pzH0pvwtBO3H0rU830SlkFNym8Xm9l4qTsHjqgLoj5bf22n7nvbIfzoq5ZKYUwFO73Abo3+485iHU5XSm+V41b4uambI/8k0laYi1PVz1cxYfC7BZ8wn80DFkTpBY5CXIRBED5MyRKa6uWP56RlmSp7YIFdNYUlPbfnSB9i6Zq8numczLdBvrJG3+qzqiw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39860400002)(396003)(136003)(346002)(41300700001)(2906002)(2616005)(38100700002)(6916009)(54906003)(36756003)(31686004)(6512007)(316002)(53546011)(6506007)(66946007)(66556008)(8676002)(4326008)(478600001)(31696002)(86362001)(66476007)(186003)(83380400001)(26005)(6486002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWYzN0hEUVk5SFVTeWlpYzYvWU5QakplRXhyRm4rUC9EdTQ1RkdnVTI2VXYw?=
 =?utf-8?B?VDZ4R3ZtdnM5QTg1bGhYSldTVHQxK1l0ZUhxRjNlRVZJMXBMVDExaE5TbWxU?=
 =?utf-8?B?NXZFWHh2WnVvYWJNaFdOMm5CSDVHY1lhNjIvaGJPNis5clFtTXRXdUlLUFlI?=
 =?utf-8?B?Z3d5Y0FiS1MwTlJQQVBJN0gzenJCbDZXTGpWUXZOcjEzM24wUC85RTNuUFdI?=
 =?utf-8?B?SjNYdmc1VzhZZ1MxdHNBWVR1dXpFMzBwQmVmeVB4eUJmeExsZkJIM0pTRDNU?=
 =?utf-8?B?VWJkMDBpVSt2cisrVmc2YUtyRWZDT1F3eU45RE93bHJiM3NUTGl4OUh0ckla?=
 =?utf-8?B?MUZmNWxBckZkbUVScElSeG1GU3hTQ3I3bHZhMkxMOS9TUTZueTlXS1I1d0o2?=
 =?utf-8?B?ZUx1eEdRK3pFWVAreXl5K3RNWlhmTzUzVnNhZmNRMWdJZm85MWRUcXVET1FM?=
 =?utf-8?B?M3BJbXU1dWY1UzBreXNQRW80UFJzR2FkT2xIUjFYcmZNRXI4bm5lZCtWVXdQ?=
 =?utf-8?B?ZE5PZFlVdExudDcxRno1R0pQeCt5Sm9Oei9RMkE1VTVDdXh5TFhabFFMbnlV?=
 =?utf-8?B?NXExMWppM3ZZbEJWQjh2WloyUGNlcEhjN0hBQ0F6YlZReFJZSlZZdjVhWmJ3?=
 =?utf-8?B?ZHpCRVJSMExrTi9JQk1GaTNIRU9UbjJoZldGcEZnaWhhcmlHZXRPMWtHZjFR?=
 =?utf-8?B?SFpHUXNQSGRUWkhjNklsYnJ2M1FHaHNOM2hKMjNBeVBVR3N1TzBNK0FjV3Nq?=
 =?utf-8?B?R0x4ZkE3RTdySGNKZGd4dHdaN0xmWE9WdDVCSytGMWFjTitZVlppVG5jNlhy?=
 =?utf-8?B?bVg5cEJiU2tydVlUY3hPZ0lET1dQNjhhcUVtQjhrb3U2TUsvRmN0TUNIU3lL?=
 =?utf-8?B?aFlNeHZwOTg0RVZjWFdyVXZTdmR3d0NJTWZneUZZQnpGSEFIL2hncHprdkFI?=
 =?utf-8?B?VU04c2lFbytLMFZlK1pkeFVmeXB5aktFaG5BdHpFam0yZDh4NEQ4cyt4cVNy?=
 =?utf-8?B?SW5SOUcwVG9Ga21vZGpSRGtIYVVKczV5L2hYa1FFcC9UU2ltdjBsOXBoRjNJ?=
 =?utf-8?B?QmN2SjFQNVI5cXlhdzFmWUlKd3NOMUIyS2FZWFlxWVJ6QkhWbytKeXNQN0w4?=
 =?utf-8?B?Wmh3eWVESElNUG91TVl0QWl4c25ObzVNS3plSUFtYlNGdS9lYVdiQ0ROWVRG?=
 =?utf-8?B?WmIyWHN2WmFFSmhkZS9zdlU5eVVkNUtydVYvcXZibnBKZExYK3E1aWlRMWhx?=
 =?utf-8?B?Z3FzMDBTV2QyRnoyVXBmaVpCNmNjNXI3eEpZenpBZFF4QWdvaktaYklLYjJz?=
 =?utf-8?B?aHVudlczbU5yaTZXaUJtNlROL1hqM1l0bHNTOUdvTlZ2eHh1Mk1GcWtobmUx?=
 =?utf-8?B?Uk9pREVobUVlbmNMeHRwdSswVGZHWEJCdUw3RWZzejVySzAvYkhJL3BZSWdE?=
 =?utf-8?B?VWR0WjBPL3FhaU1BUDA4aUpRdE9yakZHRGttOUszMjhCZlZqM1k2ek5sMFZT?=
 =?utf-8?B?aUZjM3ovY29CVWN0WENRSXlrRWJpSnNyMmVnWnFxK0MwNnVjRXlMVmx4Z1Vn?=
 =?utf-8?B?Y1dBVlhaQm9pK0ZEbFAzZURqZjJRMS9JcmU4VHhvUStuNW1tYW1tSWhDSmRl?=
 =?utf-8?B?UTVKdTdzNVpaWlg4bVIyZ200M3NQc1dNM2FqdUdCQkY2REd2Wll4c29zajY1?=
 =?utf-8?B?V2RXaUoxc0M4OEUxVVU2WU5KQXhuNy9jUWN1WElXdmd6VHRXZzBFOU1rL3dW?=
 =?utf-8?B?bDhJTnRNcVkxSXo0SzQ1RWRBT3RFSXgxUkRXeEh4UmpWeW90YTcveDZrcnQ5?=
 =?utf-8?B?b2IxZSt0cVFPZWlUV3ZjR0h5V1RpR01vWUlXdlpOSE5yS1lET3NlMFEwbWxp?=
 =?utf-8?B?TG9yRVlUR3V1MlJxYlVYdUg1c1V2WGtPOHh3cE9zWHA4OWVyUDg2L0xrSW1x?=
 =?utf-8?B?U2xFWTNLc0hub0J2bVVBdDB4UUZqU2d1cXduVnRvcGZZcFpEMFZ4dVlFMnE1?=
 =?utf-8?B?eEtxYkt3cUdhT2pSd3RTRlpUVndjVUlTTVQ0MmJIUUZSa1NrYzJtQmxYYnV4?=
 =?utf-8?B?Y3NlaDF6M3dmeUVnZDZURERIMmFnY2lpY0FLVTNBY2FXTHp2UXRNZFRSamlX?=
 =?utf-8?Q?MPYysuLe5BJk7wff6Zl+eGFW8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906ba17d-a1ab-4d12-3128-08da5f1fae09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:18:09.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTWRyqteN9PxRwZpySVbeD/ooeo3KBeLhx1bw5bEQJmacD649tHtHyLrDFI/q8jgYaNrS4cKvjtU0yEvHUZtRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7382

On 06.07.2022 00:02, Xenia Ragiadakou wrote:
> Hi Julien,
> 
> On 7/6/22 00:38, Julien Grall wrote:
>> Hi Xenia,
>>
>> On 05/07/2022 22:02, Xenia Ragiadakou wrote:
>>> The function pv_console_evtchn() is defined in the header 
>>> <xen/pv_console.h>.
>>> If the header happens to be included by multiple files, this can 
>>> result in
>>> linker errors due to multiple definitions,
>>> So, it is more appropriate to resolve this MISRA C 2012 Rule 8.4 
>>> violation
>>> warning by making pv_console_evtchn() inline with internal linkage.
>>
>> There are multiple version of pv_console_evtchn(). The version below is 
>> only used when !CONFIG_XEN_GUEST.
>>
>> The header is also included multiple time within Xen. So I am a bit 
>> puzzled why we haven't seen this error before. Maybe this is unused when 
>> !CONFIG_XEN_GUEST?
>>
>> If yes, I would remove the call. If no, then I think the commit message 
>> should be clarified.
> 
> You are right. I had to clarify that this holds when !CONFIG_XEN_GUEST.
> So when !CONFIG_XEN_GUEST, the function pv_console_evtchn() is defined 
> inside the header file and the header is included only by a single file. 
> This is why the error has not been triggered.

Irrespective of that it is as Julien suspects: The function is only ever
referenced when XEN_GUEST. Hence the better course of action indeed looks
to be to ditch the unused stub; we don't even need DCE here for there to
not be any references.

Jan

