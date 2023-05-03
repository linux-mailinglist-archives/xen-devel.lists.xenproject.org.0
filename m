Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA416F517A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528973.822800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu6ul-0007tB-IP; Wed, 03 May 2023 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528973.822800; Wed, 03 May 2023 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu6ul-0007qI-FY; Wed, 03 May 2023 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 528973;
 Wed, 03 May 2023 07:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu6uk-0007qA-OG
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:28:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c5d2d85-e984-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 09:28:34 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB8PR04MB7116.eurprd04.prod.outlook.com (2603:10a6:10:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 07:28:32 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:28:32 +0000
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
X-Inumbo-ID: 1c5d2d85-e984-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImCULAaXzgubtsZRDgZSe3poikXKaqzTyOFOpP3ttUfarNMuGj4AI6vGwJexNpi8FIqgc6jqG+AfidU6e4TI6snK1a3JohGTTN2dbkqeCvqCSvTeBUJ6U4CAL7gAIDi/HrPrzkPWm4n/53TApEPh92kVxbzhX0Q9juU4BA3KGDTEhg5U84sN2z/q/Cy1wAQjC+5p3MV8KiZUbUJwKlql5bLCd2w/NJlQhOrA3BggIXeHCNdjXsRsVAwfU3tC7e+SKSmtpzYpFr295deYkKCSgg1dtZLDOCg6BNr6kAjZNBYiddGn1Celm4QVucfAjarzxXUOMYKgKSW+RTEi7rcFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYDxzoDfSntGovRDW6SRfZYPYluyZM7hlhUJpC/rvBY=;
 b=odZqeaoco9TfplBEEH+wN2Wxghicz6nH4WkD3FbBoshjvEmsUObSE+iPHlLMNYLF16vp1ZNrZCqI+O5AMr1khsL8isg2kw4tH+NqpT5xy2nu1CWV6/iMy4kXRFH+fpGi88u6ylcCOqfHqx3Z+6OsZJTBpjHOZwBrAKelH8o/ySxOjcP5GDJPPMpp3itt6SvF7rQcR5omQ5CsQ5w3XtGr2W6K9XymU4bbKm+smBVQY9s50OjWHs+PkHBErjbHpwRSxKXCXP+vV9r6SrQTmsiyTvcYWMDQGE0+M4oFIHfFr2PmtQ1n+YlrClq0b5++sXavGkJXiFrXuzOcKRIxVCxiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYDxzoDfSntGovRDW6SRfZYPYluyZM7hlhUJpC/rvBY=;
 b=OeTwGPJEza4xRhOWFbJFxicoaHsdT9U5R9INUD8JwgKgz9h+CvMGT0C3ny2rAnOnVloACdCfMiwZ2gXf82CuMLT8TQUtUDWtQCkNHIN1LbGiQdTW9r8EyPWyOjTHyVbBMlz07dIabuC9n6FylFiDk54jIvYHjUi1jlE3TDWAbMpWbPERI+sv0JZQufcYuHmErIjMrj6/7+4gHRU8Lkt8G5YqMNSxjVkuodpovPSwDvz3A1xx1XadNiyEPQomqIu2YrKTZlwAwv+4L88h4Av51dVIm71P2Zokb/1fvMvyRQs4A9e5tCjxgSHTYxN1M79Pi6fPQ93jf5y6fK1RPOaUMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b08fb315-0ed6-1d7e-f977-14bf5e4be848@suse.com>
Date: Wed, 3 May 2023 09:28:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/2] acpi: Add TPM2 interface definition.
Content-Language: en-US
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-3-jennifer.herbert@citrix.com>
 <f9e72c6c-9915-9995-06c0-0a0ac037bde1@suse.com>
 <91620112-039e-9e8b-9bac-452ea9ecddaf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <91620112-039e-9e8b-9bac-452ea9ecddaf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB8PR04MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ae5f8d-2c46-434f-ba65-08db4ba7ff5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fbkuy/bRoeSiw8p5wtBUORJfFKBYxuosjG0o0PS2ZiK5eDLhv310HASGxMuf8CtsU6A/u5jwpRrYlvv9o8jUFTbcz8owzmJUClFPPc1g229gRKBaHmjwPCeWdi93O/yXgImGBVJc+eel8xe6882Zz5WaYizcP5NhLErVxvDtnKLiqo6ZyeQ6EBpbUxanDTD9y3JkBp/kb9qog6C2Ik9jnw1uaI442jRy5ESHTf38uNlzSG6oC1ZNoWtmkQjI6CXmt3wM+kpjZNbrcnRbKTss4iZFuKGHgjVEnTbSmrJTZRF9owyG0FHRY38wDe5JzVsyepOi5S9XLK2rtpjHosBclfckLh+0xrTwu7sI9clLGJy/ysLTCmjWNddkgIg6zFfdrfW1z9ECpfsPNgT0+Mok5+/yEhFislmecC5vhuT02y7UJTHXmmWLOhQZjxzbosYePTsgWaj+OdoPOfAqi5D+NEbR4PE2l8Hs68LpEVWlq83u2djvNdpDyGdTNYeX++/AQJs0p4sGn+rpDyVyMBWoylIIIq5b/gEqRHvGEDQMFFxVQjgv871Rs4mVSWVAIyVEsiKh+GOribBHLeK2nPH/N2Fm4zmPgpSyUyfr/M1+l7wKdlp2lyXzDpUDuRl2ZMIUzYZfba2l5ibDDDNZKXvDxSVWkKpuB2mITgg30YIuhec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(316002)(66476007)(6916009)(66556008)(66946007)(4326008)(38100700002)(8936002)(8676002)(41300700001)(5660300002)(36756003)(31696002)(86362001)(2906002)(6512007)(6486002)(478600001)(6506007)(53546011)(26005)(2616005)(31686004)(186003)(54906003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmpSenRBc0kxNGczKzhUeC9oY0U2SXBHWjZ4MFpBOHlBNVhicGljNnFQcGQw?=
 =?utf-8?B?SWt3NlBLY2NoUVJNM05ySkdzRzFCL3FvbFozeGNvOGpPWCt5Mml2U2xkUHY4?=
 =?utf-8?B?SE9FSkU1dFI2MmxRQk05eHhPSlpvVXUxQS8waHdSVGJINFB1ZTNsYi9JcHBZ?=
 =?utf-8?B?YVRRWVZaWFhZYmFpQ2hqd2l6aENsemhFR2dNOFFJbVVmYmwvNVMxZFBkVjEv?=
 =?utf-8?B?dTNQNXlNbUpHNlJnYWhyckxocXRtTkFlUFVKYlNnV3VHZVE5YUtEbVZpSloy?=
 =?utf-8?B?T1hhc1htN2lhNU5ya1JBdGVlL2FTYVF0Smx6Tk41d3RJZ1I2MTNVeFlHNkNo?=
 =?utf-8?B?U0JONmFLT0ZaOHExY2cvYVQrOGc0Qm9SaWpqMHZTSndMMlp3QzRyS1JuSkpz?=
 =?utf-8?B?RXZxV0dLNXVzYXplUUdvZnpjRnhDUTN3WElvc29XaS9rSEQxaHJRYVRxcS8z?=
 =?utf-8?B?dkVjZWxVUDN6c0pFcGlWTnk0SEJEV0tzeHJOdlBLWWVqSVlBK0VMS09nVWEy?=
 =?utf-8?B?Wk1QNlhzcDRoeE9kakVOV1lBb3ZOWmFCWEI3d0Z4ZFNUdDFKVGtNeTVCeWNT?=
 =?utf-8?B?YnFrcmw3TFNGWi9GcFBCUUVVbUMzZnNtN1lleGlES0hvQWtPenBRYU5penZt?=
 =?utf-8?B?RnptWnpUWFRUQmJGd1ZvSm1DNEkvYnpmZDdoSW9RUjNRTmpCZllubXpYQnFS?=
 =?utf-8?B?d3MycGIxd1ZvYkFjVjJxRHhWQ3dicHh0TnhJbXNHbVV1TWpyNEJwdnRhaDc5?=
 =?utf-8?B?SVFCZXBmelVubHkwbWcwME5tbFhKRkJ5dE5CSWZBNlhMSTNWYjVjdEFRMUEr?=
 =?utf-8?B?aGVhZloyZHNWbUtjL1ZwSWV2WnJQdFRLOXJYYUtYZXBtRDZIQjJ3cGdwNkkv?=
 =?utf-8?B?UzZFcDJwRVdOK0ZnakNLdXQrUGxCMlE5VHBEaFU4N1F1K3VNWlM3V3VJbjRn?=
 =?utf-8?B?QUxFazM1RXFGZlRMWGtna0pHMzVVbGpTRkkwcERPNU5XaFNmdWgzQVplaFRW?=
 =?utf-8?B?Tzk3NUx0aTVaUno4aVFBVUVjMmxINnZaWkQ0U3QvZVRqK2tZTndkUXBtbXk0?=
 =?utf-8?B?QzgwR1h2UnNtRnlBbVVRR1dZaEovWVNZS0p3ZzZRdnVCSVJzYjBsYWVST1NL?=
 =?utf-8?B?ZTQ2Y3g2aEhXeUQrQzdxL05YMWphVzZHM01TbmtSanA4YUxQT1llbmkvVURJ?=
 =?utf-8?B?UElyeWxxZmJ3b1ZoOGE3cUhZckR6L3dXUGxnNDdRemV1eWxrbDVCdXNYazlO?=
 =?utf-8?B?UEhYcHRpTDZPaEZKdDNmMk9mdysreEk4Yk9JaFo5cjVCTHFlZW1wQzllT1Jv?=
 =?utf-8?B?S0NUSDZ5aVUrSGR3YTVZekI0N3lQSWdWUTh4U3lFVHZ2cjdLQldiUkVJaWhK?=
 =?utf-8?B?d1cyczZOaGxpOGdRN01OeUh2ajJjL0EraVZFaHgwQzBvNXdZd1VJc3NxWXB2?=
 =?utf-8?B?TWJEWHNUNVBxcjdRbUZOcjFiUnBWbnU3c2tMMWhIbzRHd3dNTjNBaVQybzgx?=
 =?utf-8?B?Z3YvZkFnTHg0UzFCOVlpZ215K3hVRzErQ1NGdHI4TnVYaFF3SmYydEdoak5m?=
 =?utf-8?B?SDl4QmhQY0YwdUZHNG50VmhKaEY5VEFGeDJUSEdxMlgzRGhSSTlvZmwyN2ZE?=
 =?utf-8?B?R2xjVGxQRWIxeTU1NEI2dFVpRHhOVkQzMGROQnRaUGZicUlFVkFNUHN0UlBZ?=
 =?utf-8?B?aHZGY0RVcTNLbVAyZkdjY0V2TnZHZEVEcHlsVTd3MzFrQ0M3dStRa0prbEdJ?=
 =?utf-8?B?TndJcGhoYkZOWGFLVW93b1JRTm1EeXUxaGNlSEhadkxGQTdsV1ozcXRmUThJ?=
 =?utf-8?B?aEdWNXI0Rm1vL3lPaHhUUXJlc09JeXViRzRLSjlVSUFHNlBiaytrdTc5MUUy?=
 =?utf-8?B?NWdqUys0cklQbkRHb0hNM1ZHMm55SmFHWXVSSHN6QmYrYTdUL1huOUJRWE5h?=
 =?utf-8?B?ZFBxbytpYlVETGh4UXVaZzBRVE5OdUVLc3FLTk9EaThFQUpQeU5LQm5PWkdE?=
 =?utf-8?B?cHFIL29rbVc1YWtaSEtFYlFiYUM2QWtVWGdUa2hST1Q3WGlQS2ZqOWx5NWV4?=
 =?utf-8?B?MEpwZHdpTkFJSXp6dC9JZzdGY3p5ZExEMTcycDdLdXpieDFMVzk5ZDQ0Rm1j?=
 =?utf-8?Q?gnlfOBVpJ6MpSW7KocQFxxUNK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ae5f8d-2c46-434f-ba65-08db4ba7ff5f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:28:32.0372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dRDS1gzxhCZD91CdmJwLdqNdS6Gl9MOOJyIL/EyjF6xRdSiw2+9L8OftWznN6guGr71PUGUhc/mZIFSNZCGHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7116

On 03.05.2023 01:29, Jennifer Herbert wrote:
> On 02/05/2023 14:41, Jan Beulich wrote:
>> On 25.04.2023 19:47, Jennifer Herbert wrote:
>>> --- a/tools/libacpi/acpi2_0.h
>>> +++ b/tools/libacpi/acpi2_0.h
>>> @@ -121,6 +121,36 @@ struct acpi_20_tcpa {
>>>   };
>>>   #define ACPI_2_0_TCPA_LAML_SIZE (64*1024)
>>>   
>>> +/*
>>> + * TPM2
>>> + */
>> Nit: While I'm willing to accept the comment style violation here as
>> (apparently) intentional, ...
> 
> Well, I was trying to keep the file consistant.   As far as I can tell, 
> this styling is used thoughout the file - unless I'm misunderstanding 
> your 'Nit'. (You object to a multi-line coment used for a single line? )
> But I'm codes style blind, so just say how you want it.

Right - strictly speaking those multi-line comments all ought to be single-
line ones, but aiui they're multi-line intentionally so they stand out.
Hence - as you say, for consistency - it's okay for this one to follow
suit.

>>> --- /dev/null
>>> +++ b/tools/libacpi/ssdt_tpm2.asl
>>> @@ -0,0 +1,36 @@
>>> +/*
>>> + * ssdt_tpm2.asl
>>> + *
>>> + * Copyright (c) 2018-2022, Citrix Systems, Inc.
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU Lesser General Public License as published
>>> + * by the Free Software Foundation; version 2.1 only. with the special
>>> + * exception on linking described in file LICENSE.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU Lesser General Public License for more details.
>>> + */
>> While the full conversion to SPDX was done in the hypervisor only so far,
>> I think new tool stack source files would better use the much shorter
>> SPDX equivalent, too.
> 
> OK, this is where I get a bit confused.  I belive I copied the licence 
> from ssdt_tpm.asl, for consistancy.
> 
> So I think i need to use a 'LGPL-2.1-only' but then it says its using 
> exceptions on linking as discribed in LICENSE, but um, which LICENSE 
> file?  So i'm not sure what exception I should be adding. Do you know?

First of all I think commit 68823df358e8 ("acpi: Re-license ACPI builder
files from GPLv2 to LGPLv2.1") was wrong using LICENSE; I'm pretty sure
COPYING was meant instead. And indeed the difference between libacpi's
COPYING and LICENCES/LGPL-2.1 look to be formatting plus an extra section
at the bottom of the latter; I haven't found any "special exception on
linking" anywhere. IOW I think using LGPL-2.1 here is what is wanted
(unlike e.g. GPL-2.0-only there's no LGPL-2.1-only afaics), the more that
you're contributing a new file (and of course provided you're okay to put
the new file under that license).

Jan

