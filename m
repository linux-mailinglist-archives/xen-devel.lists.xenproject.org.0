Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC272735610
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551033.860322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDId-000293-Qq; Mon, 19 Jun 2023 11:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551033.860322; Mon, 19 Jun 2023 11:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBDId-00026O-Nb; Mon, 19 Jun 2023 11:43:59 +0000
Received: by outflank-mailman (input) for mailman id 551033;
 Mon, 19 Jun 2023 11:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBDIb-00026I-EA
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:43:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2087.outbound.protection.outlook.com [40.107.13.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91f38e45-0e96-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 13:43:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9360.eurprd04.prod.outlook.com (2603:10a6:20b:4da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 11:43:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:43:24 +0000
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
X-Inumbo-ID: 91f38e45-0e96-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRrPYqvRuKNneBtcfmQMmlLnrznhv9dqfuJraOBiA+jmqRZP3FX8/67b0tIvu1GD2Ce9BUYTp7RVsJtxVAuF35tYeInH4k+vFVFTC9TetVCigFGEIZcT1gM42dz/I1kYPzUDwYrKGi/dyu3x/4z7NqU5Jj50bgBF70w66gCuJuvmtojhlMUnZqeRYc5rIVjJWeAfKWNd98mH87XlU/72uaPSh0FgCwyGHjJNGyef0dPQqY8ad0fGjS9bCcgRRa6U0c4fUqrpkJJYryIqCFRkUH/o8io28CMrr7fTzBLhj2I5YHkk3pP4aWjdy8Uy5tNVZz1GQ+t0aMA7kDZ/VIvW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLg8KbR3kowrxvsOGbOqXn/Dc6gQZtQTySoi1YJNEWQ=;
 b=b71S8/UTDlQePcDUtJ8hc2fh+jiRne4Y/WYEhbcbh/Ha6BYdkFrWWiqgi3n9w1QcnoCQhLSFkNoT4jiKdLDOWVkLQvho3PdMRvUU+CPWhqtqIyW3xi2GaVikoBU0qQ6Q7IxFafiQFdubw8oOB0MclV5TePUypsCoPv0IgRgQ5utGufSDIJ+WN2myQH24BfTl4mGjPBJGFS5lBqCMrcmxDxCcG4jcbBWQyIomC86dbDzDhRlfOOspJIlG8lFYwR3DVWdwnIT0tiFB/6gL+P5DSSwYqALYPvwStc6yNf+7sQnZ6wS3IUeC9NBycgffKwNqxNjGX6Mr7ekKVk2Vy9uSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLg8KbR3kowrxvsOGbOqXn/Dc6gQZtQTySoi1YJNEWQ=;
 b=z4vIzCeHwN4YfpeRJayS8o15EmId33c12B+WaReP8op3YDHH9r8MeWyFDX7lCUeEmRw+6+emU20dnu2zX1bWVh6pPOuEKFyko5MUcIqq5ZQ4gHkfF799+zF6jGvV8VQnbLTBulzTwO6tRj5BIhDwxc5VTsVYTqS/1CjmUqIZVGtFhJX+kckVZBYOP/WeTP47hBoqZCIBh5GeYbkDob0FpwoVhQEqaO9PRErJKbk5hzsGlJQvhWH3fQEPUl0zjMPyCky/w6f2Q7iGM1K6YqxMD15Wq7D1rBCN3HtNqUvpx7pSD+Nm8Xe+G9i/WOCiIaIu2ctt/t4ocavLf0S6irMnxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a301891-ee61-9874-8236-c52a649f610b@suse.com>
Date: Mon, 19 Jun 2023 13:43:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0.5/2] x86/boot: Clean up early error asm
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230616182303.3546262-1-andrew.cooper3@citrix.com>
 <1ea82266-8b61-f70c-c5e2-a2b4e131d222@suse.com>
 <569941c3-a909-c4ab-aab2-c256caccdda9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <569941c3-a909-c4ab-aab2-c256caccdda9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 95eb2545-067c-45c0-708b-08db70ba63f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FQAKIBXcBJ5m2E7yUlXgcUob/M929Y4sZAdG5/RwMAtNuCJ84xh4Neno1HVFlvSca/hnzCqaC9Bhmgcwh9K3ZNvWMVPkr7Zu+sp++4K98m4YCh6ZJeoQlLo+ZQy3lcNtVLMXekT7kJuJ63p+3Xzu4fiAO/GK0KWdloBL+gm01rnYcZMEYEl7Hg4v0l11FElHJh7MV7CdbuWR/jTlwSJ9W2TQ6atED4VzqMQv3DhWhaSvy+fmOC35ZvFCTnkIz0El4Fct09KGLZ05D1iOtSeIx5hh8zlyqwd83ROeNS61aPOtfrIaLNiW6kj33NMYroVt9YF/mV8/GYKNr/ZOy7i2Oyjy4oNSQwMH1FZPDKj0EReq79744NzC28p6C2TtBMLaNUknyz51vWxFrpCiASZCUVtLcp5k4ffaVnZH45px53m/+inEwTl5i6NRpW0FQrcFumZwAny3byUXzCYev/lmwYV0RjfHRJekx4Lp1hOaMGr2lm9wUmEsK/bk2VIDpdh2Vhg+gB5ZajmLHrM+eW6RrV8ot9Xysx/B/61v4LmLKKNNhGpzq+QYwlG/jjnLF51+Y2B51fh9dOg/F1vSnzOir+qlRyEOVyD/2dZSOATup2Z6dyPTCitUa4rRn84+l9flBHX6+Qzqrmf9RUgsMXC0tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(2616005)(86362001)(83380400001)(2906002)(31696002)(31686004)(5660300002)(4326008)(54906003)(66946007)(66556008)(186003)(8676002)(8936002)(66476007)(26005)(478600001)(38100700002)(36756003)(41300700001)(6916009)(6506007)(53546011)(6512007)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJkMVpwTEI4YlJkS3I0R2RNRTFMRmFISVQybDk1dXZVb2N0N0NzUWloNy9J?=
 =?utf-8?B?SWRtZ1RWM1AzM05PZEhZaWlJbjJGdThYM3NXd3pIbGlIbXZCNHBiemJlellX?=
 =?utf-8?B?dmJObEM3K3hKNThMZFdZeTVEck53V0IrSWRmRmZsaVVLRTM4eVhVVXh4Mi9r?=
 =?utf-8?B?Y0h1QitDRWpzaEpibVovQXJkM0VWZ1pDbjBaRjFDLzc3TDZ3NlBta2JrbUlS?=
 =?utf-8?B?cXYxWmtzN1dLWVkxNjVNd1NFd0I5LzNhWHRGSGozakgvRm5aZ3hDQSs0eWlI?=
 =?utf-8?B?RXVWam95bXErY3JodEVSMks4WWJLdjRtY3NhREwvS3RVTk1lUkluSSs3L0FX?=
 =?utf-8?B?cnRxREFwZFhqOEdleGU1L0RycU9LWGRQbU9Ha0lwalFqQnFwY3ZlUThUZ0Qv?=
 =?utf-8?B?L1l6R2VCS2JJZlZBWDU0eGgvK1BRZmhHQjhEdEg4eVRHK1lqdUhjYlplaHZN?=
 =?utf-8?B?Tk9tZm00Q0lFOGlLd1NKQzJrbWE1dGlEaFVWRDc3YmdzNEdDUWM4MVBSVjdI?=
 =?utf-8?B?Z0Z0QnBXdEJsZkJ6cjgxZVVxencwY09hclE1ZG5SVGJ0Mmg5RXhrUE1SOVk4?=
 =?utf-8?B?Qm93V2lzUEdUZlBxMEoyUERKMG41SGNmN1F2WlMxU0IxMlRJTEZpOE5mQUdC?=
 =?utf-8?B?NXNESEx4d1lteGc2Qm95RGVPeWZVK202MDBTSURSZTNXbVQ2U0N4UFhOVFVD?=
 =?utf-8?B?eWRQZzc2NW4xSFVFMHVVZXFHeE9tcWVqWVlDOHRlWVBTYm9WeityRmFQZkRU?=
 =?utf-8?B?dTMvLzBuTVFzNStiRFE0elVucEtTSzVMS241SEl5Q0NOQ3JqZ0ZqRndyc0hY?=
 =?utf-8?B?Y3BpZG5lY2RFc1I2R0NlU1JEWjJWT1lBK3JNK0h5TmJiTDhydmRxK1BmRUkr?=
 =?utf-8?B?VWxpR2ZiYUwvUXNvd3YxSUdraXNrZ1I3d3ZuSVhMR21EVDBLdUtRVVU5US9Y?=
 =?utf-8?B?UFpCNUFyQU5sRkdMS0JTeHNxQlQyRGFwUVNkY1oyUTcwWDJQM1JrRkdXT2Jo?=
 =?utf-8?B?citIL3dIQW1xN1lCUGNiZFg0TzBMRWo1dzZUbjVTSTU4WTFmdjJJMEZaVno1?=
 =?utf-8?B?Z2hJdnpQQTZTZm5oeHJnTkp1amQwY3VqMFF5MGhiR2dzOTBEdDBzWVkxTGU3?=
 =?utf-8?B?U3pvVHYwalJjKzhiYTJmYUp4RjJIZU9jWmFZc0JsaVd1bmZXUk5yTm11K2ZN?=
 =?utf-8?B?ZjR0YXZVN1F5MFo1UnI4ME5aenVOYWRqOE9MVXdXQW9RYWhYNkZBWFJabGJW?=
 =?utf-8?B?OHZqOWVCVnpjWVNkR0g5ZDlSbnE5akMzK0NOd0NBVHlUN2o2QnZpajJSeStT?=
 =?utf-8?B?ZndpZlhPQnZJdmREYXhVNTkrTkg5LzVVZFBFS3haRHNHSmdoR0FiN2h3dnJM?=
 =?utf-8?B?UEJjWnZ6aFB1dXdVTEZhazZSbWVxNHpSRWxtdkxyTDk5dG5BQ2VpZmZwK2Jz?=
 =?utf-8?B?V1ZSWjVzQUdLTHllNWhPam9LbWdsU3hqeVkrc3NoVTMvQVJaMVJ6V0xVZ2pi?=
 =?utf-8?B?MjdOWnFkUnovZkNUc1UzYUROSkE2Qzh5aUwzNmpwSUVxRzl4ME5URGc1Mndi?=
 =?utf-8?B?eitrOHhwdnF3UHJTUGh0WFc1d2Z1TnBTV2RCQVR6eVROTXdSajlObGpJbEFu?=
 =?utf-8?B?ejh0azZ2QTRNZC9pb0pjTjJLMFlUZlBRb0JzSGp3azNBSG1vT09BWjNiVml2?=
 =?utf-8?B?a1lZQldzT3NhQkszUDRGT2Irakp1RXBKNjZKYjBnVHU0d29FblliUTdzVGNW?=
 =?utf-8?B?SjRMblBEbUtlNU51ZmlHcTNabi9NbElXTXQ0b1JLNU92dC85WW1sZ2UrKzBW?=
 =?utf-8?B?cGtRM3Q2VGFoSC8rbXBITEV0b2o5dmdJbW9zaXIvMk9wazdSUTV2MzM5UDFP?=
 =?utf-8?B?cDNXSUY3ckhXQVNoYytqbmFEUjhxWmdVelFHMzJPL1lUREY0eFVoWXRRNlNy?=
 =?utf-8?B?Qmtxa3B1cTJpakN0MUNWYzdCMWJEV0Zsek05dWtkcVA1aWdGZGg3dG50V3o2?=
 =?utf-8?B?aElocTRiWU1HcTE5UTFRSnFHT2RoNDB2U0ZJRit1YVBaQWR5WHRUM3k0TkNz?=
 =?utf-8?B?bm5BT3hUQ0NRd2xTVmNJbENLeEtWVGM4Tjlvbml4YTgyc0l2NTJUYmxyV2d4?=
 =?utf-8?Q?kUk23V4L0F0slrPd4u+Y+W7gD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95eb2545-067c-45c0-708b-08db70ba63f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:43:24.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrJdBYyGvfQ68vRMKfAdD/SZ+iNQSQCL6j0+Qn+8tW4pRJlJFcCAPtKK+69o7iYAvHTIML5H8NyJwcUyd6jOAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9360

On 19.06.2023 13:20, Andrew Cooper wrote:
> On 19/06/2023 9:10 am, Jan Beulich wrote:
>> On 16.06.2023 20:23, Andrew Cooper wrote:
>>> The asm forming early error handling is a mix of local and non-local symbols,
>>> and has some pointless comments.  Drop the "# Error message" comments,
>>> tweaking the style on modified lines, and make the symbols local.
>>>
>>> However, leave behind one real symbol so this logic disassembles nicely
>>> without merging in to acpi_boot_init(), which is the thing that happens to be
>>> immediately prior in my build.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>> with one request:
>>
>>> --- a/xen/arch/x86/boot/head.S
>>> +++ b/xen/arch/x86/boot/head.S
>>> @@ -142,25 +142,27 @@ efi_platform:
>>>  
>>>          .section .init.text, "ax", @progbits
>>>  
>>> -bad_cpu:
>>> -        add     $sym_offs(.Lbad_cpu_msg),%esi   # Error message
>>> +early_error:
>> This symbol, which isn't really used except by .size/.type below,
>> could do with a comment saying that it's intentionally here despite
>> having no real reference.
> 
> Ok.  /* Here to make the disassembly better. */ ?

Yes please.

Jan

