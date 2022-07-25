Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F2657F9E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 09:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374422.606465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFsDO-0001Tv-QZ; Mon, 25 Jul 2022 07:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374422.606465; Mon, 25 Jul 2022 07:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFsDO-0001RC-Mw; Mon, 25 Jul 2022 07:09:18 +0000
Received: by outflank-mailman (input) for mailman id 374422;
 Mon, 25 Jul 2022 07:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFsDN-0001R6-8D
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 07:09:17 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30059.outbound.protection.outlook.com [40.107.3.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1c82b4b-0be8-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 09:09:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3781.eurprd04.prod.outlook.com (2603:10a6:209:1f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 07:09:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 07:09:14 +0000
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
X-Inumbo-ID: b1c82b4b-0be8-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+/7acfxsIQK2M/5jZC0tweC4YBF+WRhAqGntcgb0c233cYicCHQHDfvFlaYNtQHHH7/x74VBHq18GFKjGF5C/uL+LNaJPM97vF6IFx/y5/p3/qlciTzk2Ts7rC0Wao6GvcjZtmMohsdQYZY2QpLKAGpVJ6REKohqWP47nTpXwSqtQfvMy5fTcRUhJvrtT+KyRQN3eiCdJwT/HldnF/Rms8cCa05F0Rt6hqQlOfJXVwELKTVZ/LHS0So8aQBo1BPD0sKStozMPCrmpMpf5PEyyLtAWUKfvfEoxRMAh84SWcKs8YGLXRb4O91XZaVDDwbFizidIeX4ouIjNMNq/Z0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PIj7R1l1yRdtgBX2XEGtcGEBOffcS42TzhMTVJ3Ok4=;
 b=lAWcJ2XYBBHWLoMOcFjzxCTAIoWsaACbN72EeKp2TetA9KBY8ZdsGL/folVSAA23ya8RU72+7q41YPDIhQCOhXcv8lk6jayy/o3vDISkRteLhM9l9QugAf16nbztS7WfehShLJ6+4mR3XnPqu3AKt+LnoeFdvHWvjMbX5f6PIYTKDv5QLzMlToQsJj+kckdyatmZIRoyhos2B5vJn9YGUGY66xGkwvLDaR4aGul4rBua7QtvSf2fynelMvdTpKL/i/QOV+s44ZSOO7cSLvWDU7hV7HFpWfKth9+apN9Fmz1w/T5RzAkVLeLugwyGnaUpZ+SkyiNs82IVt3tG7r6g8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PIj7R1l1yRdtgBX2XEGtcGEBOffcS42TzhMTVJ3Ok4=;
 b=QAToo+6cO+mhM+M3Y2ePQchBJgnTfWNqeDjbICL9p4fSEyojbFqr3NN2OSggMh2Xss4QRfYJvwUA+wFAg1hR/yhcN0gKRz6LtSTHEKZ13TaG9nnIyvefJuP3dWnkxTSfum44f6GuWjGuLnfknkomIc87aQpfvMP5zq7qOJiQpCYDPfMyX7A1NWhakePGGPjUgWVnpEZo5crmdwFdTeZBHs/oazG8/AFDE0yqRWZlJLwI/uI9QzPy+7NX4QGqPybOIvsyszfR9xSjqaEIMDxkte7Q3/2QFY4DaMFQLtUXXoY7+859e/tI+lBlG8KU3I3YXfcAuuT83QtqYAp0V+mXxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <009d5350-70db-f614-a8a0-77a6337ac8c3@suse.com>
Date: Mon, 25 Jul 2022 09:09:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 05/18] x86: refactor xen cmdline into general framework
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-6-dpsmith@apertussolutions.com>
 <681d9e71-f618-ff33-59c4-bc7f793d45c7@suse.com>
 <f6bc8761-b5cf-42b3-7e3f-596bb07528e2@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6bc8761-b5cf-42b3-7e3f-596bb07528e2@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 710f198f-1186-4771-32b2-08da6e0c94ea
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3781:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mTERptAooCFM7gPgaztOX60Ov/ZV/cbdCRde10abHte8u5fLrzxD+L/g2LiY6BqvVXZgsAmtldBQXgv4/IYRj8HqmtDoZxxjNFqp4hfmtSM1crKHPAnrutvXmMmGKmVHqlWYI4QrR8iVHgggSWbvaHX/eaUCH5SWduSR755PB5ZISUpHeNt8VlFQCTqu9zQDC8WCisS8eJL48B774s8WVKcudvfnehqWnnrQzabWept7LzRAW9YIZT9m70B6l94XBIAXPgJpcWmKdkTK7ES9cw0tigN4chnFikFqkJNfhDkVbiDUGLvaREYau25WKYt6soeKI2q45W5cr2rtjdVWg5W4P6XxiyEcBg9qUxxq/SYIAlN6F+3VjuC/Mrqo8pNE9I5xdydc13drIOz5DXWdDPGGFrEtUab9MUWlNvMbzwgITtGzVsJrjqqwCSr8IT3wY891i9j0x1wnPFDaIIhAUZf8SkveYSZAh6xhKwfKd2195SngilmIDMmOWoUVAnBX+Ys6IBFSPIOksSok1XKnxWG9Id+VThqwqBVjFpKTB5ZMPRduTksHG9dEqegDgx5PBPW3eDqRvcj6iCDM/kNwEMnE/OstQdwv77SQF9eabk8W+yZ0HbKRXaYh6dj38s3MAFduRhNeG3J+EwHbj6r44eOFMjLt+43QRHN/DF1pV70rbK/aXqjxAV3gkDrJVMqUbus0JDsaaZD0E+Rx8Q6xAZ8epuGyhLa3a51tgCUq0W6UJ+fUHevv2/jUO5RJguhYwHQVW1JCiZquW77v2Cpd7/s5rXiPv/jB0V3nQJsV+diLcX6luKJmslkKIGAB/rjflKxBBQVvGvvEgkAk3CXvwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(39850400004)(346002)(396003)(54906003)(316002)(6486002)(41300700001)(6512007)(2906002)(7416002)(66476007)(6506007)(4326008)(66946007)(26005)(8676002)(66556008)(478600001)(5660300002)(8936002)(31696002)(53546011)(36756003)(38100700002)(186003)(83380400001)(6916009)(2616005)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXhPcnNBVGJuVzB1eFF4bTRsYU1kNGl0RGd1YjZrQndjVC9wWG5MK1ZXQjlq?=
 =?utf-8?B?cllFUzdqa0dpZG5xQlREVzV0Q3QrUG1pb0RITEI5eTJIVFZWQWR6WE1nUkpT?=
 =?utf-8?B?UWNyT0cxaVZRYzhYVldJMkY0TDYyN01WWXc3YmVYMnhaVkdNTFRZNnhqeXhR?=
 =?utf-8?B?eVcrWjA1anE3Q3UxenRJOXpLL0hLcFB6Y1BHbFBRRzZxUTdBMkd3aDROMGFU?=
 =?utf-8?B?cUMxL0NzWlJvT2tOWlRWRkpHb1ZQZnNhemhpUkV2S05WZ0tsZE5QUmdUekRs?=
 =?utf-8?B?ZFZtQ2JPNVpHQTlRN0JVbGNLZG5VaWdSLzNwcXlvUlFqUkpBbHBTODBxSm43?=
 =?utf-8?B?WWFOQ0hiNkVaSENkbWJISmNrbXR5RmR5U3ZZeHU2bk9jVStpWXRMM1hhOGxK?=
 =?utf-8?B?T05uR0VZek1rMG9vbkUzUnpzTE5NQVpvdnV4dk1OenRobEgreDJVUEtVMGVG?=
 =?utf-8?B?NEo2alBReHA1TS9JbFk4Zkp3ZjFmdXM4dUNIY0gzYmFSWkdKby9NNXA1YS83?=
 =?utf-8?B?RzRRdmFOQUlGdVFDYWRUMTNCdGNiYWtXQXBMVWtFT1orM3RUUXY5TE9SdXlH?=
 =?utf-8?B?d3B5RlBVVW4rbUdXZEhzbmhXcFFOM2ZXN2VablMxSW9kSFZsTlFuMnNVOGRp?=
 =?utf-8?B?VnlHMmloMUFLa0dETGY1aGZpZFR5YkphMVRqMUwrRURPdzdMWjRWcHY5WTlS?=
 =?utf-8?B?eC9lTHJZYVl3eDR3Z3l1dGRzNExMU1lSYWpiSTRJSEoxRDl6eWpVVU01dTcy?=
 =?utf-8?B?UjgxK3BBRWMxbkwvNDF5dE13Z2pSRDVNbk9pTXZJdE51dSt2MnU4LzJyaFY1?=
 =?utf-8?B?dUhzV3lZV1IrU0NHZVA1L0lDQXFoZU83Q0tiOXhCNGlJVDhzd1p0QXZYSEpp?=
 =?utf-8?B?TjhUeW1mbWxVVjY2UkptbWhGR0JFcFVJejFJRlpyODBKRWcwR0FOTFVXRys1?=
 =?utf-8?B?MnpJdTVQK004ajB1ZVZtcUNFNzlyZVNyM05zNXBrS1VZT0w3ZEcyMjQ2aFp5?=
 =?utf-8?B?aWJobDIzY2xxVGhQU0F2SzNJUWdSOHhzVkJ1K3BiN3ZYdG5oUGVPcThOV1dp?=
 =?utf-8?B?NzdUWHJySFp4ZnBsNHlyV1RvamJTWHI1ZkZNT2xUOU9IenNSYkVLaVAyV09p?=
 =?utf-8?B?RG1vN3BIdWFwMTZ4eEZEWDF2MXBpVkJiUU11ZFlwVEc0UnNRNWJRc3FXSWJu?=
 =?utf-8?B?WDhMNzdqTFJmMUlvSUxKN3pjVGs4cjBJeFhOblZzNU9QRjdWUkttUW51TTEy?=
 =?utf-8?B?YUZpNXVsM0xCNDNZa0xRUldaL0dzNWkyZThkK01ZV2d4N0RvWE53Vy9zSk5Z?=
 =?utf-8?B?YUhaNlpVUFM5dFkvMlp6bUx2OTM0N2QrRlBrMmVYYy9PbEdXTXAvWFJQOWc2?=
 =?utf-8?B?RkR1cnNLME9MOHhVNkdhMWZmQTMrRGNlNzRnVlVneU43OUhtQU9vQmJQa2RR?=
 =?utf-8?B?M1ZteGV0OEtJcWx6SElEb05uNWpaU2t4Ym40aldjenkxYzZ4UXRjWlNpSHBZ?=
 =?utf-8?B?U3J3dlBIM2plRzZDMmlGTEhvYmpqckg0d3dzVkNGN3hoNmoxQ1lUcndzR0J2?=
 =?utf-8?B?TGlVeEppTlZRNHQ2ZytaQzJxSGJGeFpyNElML1p1VWViQkFBSS9zTTQ1cENW?=
 =?utf-8?B?YTNoQ2g0ZWtVb3h1bDFPN2liZHU2Z05HbzVHb1dpUytqVzBwWEZ6Z0hBblcx?=
 =?utf-8?B?R2gxMW1KV25GclhYK1c4d3ppR1RxNzdIN0RkU3g2WjJ1UjdVSFFTTkZKR01h?=
 =?utf-8?B?aHV3bktsbGNYQ1JJUW0rd0Y4TmxrNTY2anhQamVQVGlSRFZIUjlaMGc1aGdC?=
 =?utf-8?B?bDBHZ24rV3RlWGJGQ0hzTjdLUVNpeWorY3JkcG5JdC8yYmJIR1hNYkQ0UTE2?=
 =?utf-8?B?bVdONkJzeVRPcjhRM2htbnJSTW55MFVINU55LzdXUEFONXlzUVFpYjJsejFV?=
 =?utf-8?B?UnBUNFNmWkdvb1dHMitRSFZMRVY1dkNlc3hvSTNucVd5eXNtL3dXR0tUeUJj?=
 =?utf-8?B?c2cyeGtzeEg4VVRUeXJ3WWR4UWdnK2tmVkJ2M2RsZG5qMmFLZjlmWFpSL0Jh?=
 =?utf-8?B?aXZPRW84NkpWeTlGUmYrQ2pGS1ZFZGQ1MGtyNHNDM2tSQVdLdUFuanczQjhp?=
 =?utf-8?Q?5AF7wSw1ZZ9r7t/03OUDhnKpy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710f198f-1186-4771-32b2-08da6e0c94ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 07:09:14.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UXHGdUEggFSP+sNGNg4DJxv7JObCRlP2w4dW3f3ApKGzQDJmvMeaMIJqssK8u4Sd84Gjj3bP/owtJhWoZKnLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3781

On 22.07.2022 15:12, Daniel P. Smith wrote:
> On 7/19/22 09:26, Jan Beulich wrote:
>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>> --- a/xen/include/xen/bootinfo.h
>>> +++ b/xen/include/xen/bootinfo.h
>>> @@ -53,6 +53,17 @@ struct __packed boot_info {
>>>  
>>>  extern struct boot_info *boot_info;
>>>  
>>> +static inline char *bootinfo_prepare_cmdline(struct boot_info *bi)
>>> +{
>>> +    bi->cmdline = arch_bootinfo_prepare_cmdline(bi->cmdline, bi->arch);
>>> +
>>> +    if ( *bi->cmdline == ' ' )
>>> +        printk(XENLOG_WARNING "%s: leading whitespace left on cmdline\n",
>>> +               __func__);
>>
>> Just a remark and a question on this one: I don't view the use of
>> __func__ here (and in fact in many other cases as well) as very
>> useful. And why do we need such a warning all of the sudden in the
>> first place?
> 
> This started as just a debug print, thus why __func__ is in place, but
> later decided to leave it. This is because after this point, the code
> assumes that all leading space was stripped, but there was never a check
> that logic did the job correct. I don't believe a failure to do so
> warranted a halt to the boot process, but at least provide a warning
> into the log should the trimming fail. Doing so would allow an admin to
> have a clue should an unexpected behavior occur as a result of leading
> space making it through and breaking the fully trimmed assumption made
> elsewhere.

All fine, but then such a change wants doing on its own, not in the middle
of pretty involved refactoring work.

Jan

