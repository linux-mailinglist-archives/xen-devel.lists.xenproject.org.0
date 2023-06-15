Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B873120A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 10:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549467.858015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9iFT-0000z6-JM; Thu, 15 Jun 2023 08:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549467.858015; Thu, 15 Jun 2023 08:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9iFT-0000xR-GU; Thu, 15 Jun 2023 08:22:31 +0000
Received: by outflank-mailman (input) for mailman id 549467;
 Thu, 15 Jun 2023 08:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9iFR-0000xL-W8
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 08:22:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3fff3e5-0b55-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 10:22:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9940.eurprd04.prod.outlook.com (2603:10a6:10:4c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Thu, 15 Jun
 2023 08:22:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 08:22:26 +0000
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
X-Inumbo-ID: c3fff3e5-0b55-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JedKUNE9p6YcHIKRneretAmo2nw7DtCcrSD7cACq+rSt7RH0SZ/9QQQmSe6ef0DUAIo0mPMhjZN7h/zEHmHzxSINFhA7bVGUizYlZvi4Hi54JvysEJuqjQe888/3y6ibYrwpA5pVXjisoZV8SvScx849PNeRfNimpfuGlwKgk3EdJtirH2AfkVKRE1fMxdI2jcxlYTnZ1JXb3s/cgeQv6eYlFT8odn6WTbqgkAsBbFfW8EO1rJuAxMwXtLLZRdbfpxNxIGX8jBwSx3BHLt/oXZmbxTXCY/zBf1thqKS+v1o4vtKroD0+YjgPib3OJ9YgVT6vGFJyS9PGhmFhtCKpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIrFIpWMHz3XJx/JGfisJkze9hbqIriLrzyI90IHmxM=;
 b=RZIAKIkV5kXcxjtF9ahzX/XkBzwJz2LwqJloX47q8jzatmHjJ0kFE9d7nfYOtOCQ3aiYA5oJAvd4pEL05lb+Tj4nBJ0dHNOZ1FauD7T7Zn10GAbf7S6+vxit+Uh/dVxufnf/iBlkrDZi8ZAh6BArdRT8wTPIH3n12kque+Z7DMxSUDvuIcC1tu00mOqP+I/i5viST1Olbw4Qxbm5GWSqSH/gAczwi03U+P4iFJVuixZzTP0O2/SuuhZnTy5FvG1w0od+1FBjXCc6VzuM8BAM5NSJ34WlJx9E/nK3nt9G/0f79RO8zTE6SCmIpcq1BBzzwPLxYP8K1wnmhR38yumpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIrFIpWMHz3XJx/JGfisJkze9hbqIriLrzyI90IHmxM=;
 b=Ob20wu8nNatw5jR43NyolR7AOmIzLQ+IC6TR/8TaZJkX6To9uDliKylFLbDZ8WhnQyc/LVDH9bHU4tKhDhKNUhXegF3JT0AxkAWsl6pThj4tTlGn+/caaYJyWFiWhT9MQRiZwyORA2gPgUisic2mnn6NbxvGrw44wqcBC1E6Cys7WCPwDvEWUZm6+DfXDBWT87aBH/mO0R23G6oHPZyEr6COTMpHZrVbOr9Lx2qaGfUZj0z4SFUYfFGnMg/nZJBgLIavdxcHK6DI2nmC6zc/aeNk2092ues11sw05GuU40Z1N8vwZMiBngSp5eIQTCpMn2YDm85q5epo4HV4VawqgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7302e44e-3b27-84e6-72ca-55e6e5f148c5@suse.com>
Date: Thu, 15 Jun 2023 10:22:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/4] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-4-andrew.cooper3@citrix.com>
 <81f74759-766a-bc3f-f4de-199cf3f1bd75@suse.com>
 <d48c9221-c8ee-5121-8fee-a7e82dc31e78@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d48c9221-c8ee-5121-8fee-a7e82dc31e78@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: b3402325-6238-4301-f84f-08db6d79a6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FMk91GcHQfbH6W77aP5w2/QbCtrsaGEGr0XQ9Id9kafkR4yqNNUJIP5jV5qsLWYaFVMgaZ0vQWk+BQpUb6FfWP2HHBaRzpPNw0ORJKESxl8JI0b0Gis6Z1YK1YmRPz7jgwf2klKGzK+As/rIg/vyjLDef7Wdsgeostle6T7D+sMZk75kDHTzWf9I+te8q5gsX0Z8eVyozV2MUr0lKirq0NZlHh/goc2/e74Q/q7vD69zfmO0f3Moje2TQZtsIZyLrtL9bBdaEng3DdxLhOutgPX3kApXhMGT6o09p0Xm/wXiMXqal+NQIh8NISSKLw36tOTfwlCk/64+qf1qpC2J+84FDhqReyBMI5dRvDxFHIanLPjzlkl0k4O0+1u3yAOE0TNMGkmAbM3qO6QwVSiN8KBQBiigaJLEwXEfS+lV8gO26suDmYhsnKsfPuYffih0MwgYP83qhFIQ5mIXRj9cOWc4lZaOx20SjdS+m+SjhAmbHGiz+ofjH38rQZlAHqvD8fXBUTj0Xq2QgxwUDRgm6GkeF9LdRM1wzkogNYZRr5KQWLeVe38lAiwx3H3muuQ53JnmqZDOiVkMcGGo7jd+355/d7WXE60plm8VNHkRGqXCCkmpe6QA730SYHr9Ij0i79Qn92TdhpqWES7wVfp+iw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(31686004)(86362001)(31696002)(8676002)(5660300002)(38100700002)(316002)(8936002)(41300700001)(66556008)(66476007)(6916009)(66946007)(4326008)(54906003)(2616005)(53546011)(186003)(6512007)(478600001)(6506007)(36756003)(26005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpKZ1hla28rcmZaQitBVnRCWHRMY0JIRUlNVTZCOG45MWljNWk3VFZkN1hh?=
 =?utf-8?B?ZlRHMWw5bXRaQVF0VDlBSVQvd0FGbkFKY0luRFlVc3FWaDBtQlNCUDFyV0FE?=
 =?utf-8?B?bk5aTG9jUWZvRnJMVkYzbnRYUktXTGFtczNubDVKMDZlelIzdm1wcGFGaHlp?=
 =?utf-8?B?QnZuNjg3TkFuNklwRHBqbFA1c0I5RHVSNnRiNlQ3Q3dUWUZlVTVIOEdLaVZu?=
 =?utf-8?B?bDZFc09xOW1hY1FZTkRQYjg2THRuMnRYaGxTV2RKSXBhT2xhcXVkYW5pRHBv?=
 =?utf-8?B?anl3a1didDlEamxMMW1WUEZZbFNYWnpFcFY1TThocCttRE16eHdDSFY5M2Uw?=
 =?utf-8?B?VERSNlpQaVRmbFEvVzdBL1ZUNjFWNkdpN0Q3aVVsRk1WUGJ2QjcvQTZscU85?=
 =?utf-8?B?UldmV1pINmlhRTZ1ZDRjdTVDNVYwVW9PWExpRXFkMmVzVGFVK05qMWxycTJB?=
 =?utf-8?B?S24yQXhScGp1U1dhV3dsZGd4ZW5KY21VRXRPVWh6aVVKQ1c5S2VWd3FKY1hl?=
 =?utf-8?B?Vng4M0JQT3d2UWN6VHFzMmZrSVpnV28zbUlJUzRvbHk0Tkpnai9NTkhGZjN4?=
 =?utf-8?B?ak14K2Eva2YwbEcvQkQ5V21zV2VvZldlMWdqUFlEcUtNOVI0Slhqc3lhRHJj?=
 =?utf-8?B?L0R0ZWZKamU3SWU5S0hzcVNOUFF2ZUJsMTB3Smgyck9teE1GQ0h3WDFvNUcz?=
 =?utf-8?B?ZjdtWVJIOTBLQ0xES2cxSzBYOUZtV0VpbmFmQVZIZzdXajR1NUZYVEUvQi8v?=
 =?utf-8?B?UHZRZm93Nlp4OUpWd1lLc0JxMjYwSGRrby9wUEV3cG1wZGpxaG9WVmFmUHUy?=
 =?utf-8?B?MHBjWk1rMFBEQmhhbGw2Mm1ENXBadzVBZWduaHYvRjFzU0cxRm1ad3ZoMVlS?=
 =?utf-8?B?SHVPdmZrUHNGTGMyRG1ZTTB3QXp4YmRKZlU2R3hQTlZtRlc0NCtyWGxLbFM3?=
 =?utf-8?B?cllialNtc1IxaCsybmVQUVRCMnYxWmJRbkxnS0FiUnBjMXcvYi9yd2JIalpP?=
 =?utf-8?B?WDVIRXArNGJLTUxOVUVZdzBpR2Ircld5bW1lYjI1NEcwOUcrTU5BbGpEb2N0?=
 =?utf-8?B?ODRVdlNEdmJHL0JXK3JWczFRZ3E2OEY0bFdORldONlBiQWk2R0hXa0FieVdB?=
 =?utf-8?B?V2NTNE45M3Yva1pFQy9ZM1FhNmFyaVJOWVN2RjRweG4ybmdPTS9vVXNhNlBS?=
 =?utf-8?B?aFhNanU1RmNDNXppaHFhTGdzeXJJTXI3R3R5Qi94dmdpV3gyVDV0OWdnTlZY?=
 =?utf-8?B?NWhTVjJ0U3FtdGdDWm0xZndQUDdaRHdsQ0lKVlQzRWNFQ0ZjSVRmc0orU0x0?=
 =?utf-8?B?cWt3WTRyMUhJMjlrclVNUC9tZWxMYUw3WVZGcXpCS1JHMGlWK3liRG01ak42?=
 =?utf-8?B?VEoxUDc2ZWpuWXpkRzZkUndFa2NTQW1QU0VEYVpOVjljb3J1V04rRi9RdTJ3?=
 =?utf-8?B?cm5TVHJlQ3Q3Y0M2SXp1MGNNUXQva2RXYi9qZEdEOXJDWGZNUUl2cnJHbmhL?=
 =?utf-8?B?ejBZUVFwL25zM3RqZDM3OXhwWGhCc3IzU245c2pLS1grQnIxVlI1eEtqZHcr?=
 =?utf-8?B?TUFNWCtxSXF6K0k1M2ZZTzR2dWt4ZXE4aGNJT1VqMkZHQmhmWlZRcHBxaEhr?=
 =?utf-8?B?RkRvWVpTaHdid2R5NUh4eGJNTmVTMzBYaDYyUVV6VkZuWHFuSGtRN2NCWTBl?=
 =?utf-8?B?K1h1OU9ETkRPOG1EdlNRSXZ5UnZwcUljRVRtYk00bVhoZndTQVBTVFFTT0kx?=
 =?utf-8?B?eU9ZeG92NTJXbjNiRTREV3FFTXpzYmYxNWZydkM2b2VNRDRuSG1BSmduWHVu?=
 =?utf-8?B?ZkFPQUg1YUlxMDdZV05aYko0aWx3ZkpHM3R1MTlhMk9PcVVzMUlnQ3RlSGN1?=
 =?utf-8?B?M2RlOFZTcThhMVNBU0psWHlhbitobDJwVFZXQ29uczZNeEdIKzM1ZTZINGJt?=
 =?utf-8?B?M09jdkNLekQyVVFPcy9LbUs0OGNBSnQ1TmlYYjBsQ2VodlV5eXFyaUVSb2R1?=
 =?utf-8?B?RkxpZ3pBOE5JQllTUjNPYUZsbEdUOHJrUU40SzFFZlBWRU5qdS9kbnIwSm5p?=
 =?utf-8?B?by9PWXA4WFoyN1R1ZmtiSndIWWFLQ0VqTEFDQ3NpN0RoTFpNbDk5WHFmT2wr?=
 =?utf-8?Q?ImldA+Z1/+Iq6Q/X2yaGGQii+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3402325-6238-4301-f84f-08db6d79a6c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 08:22:26.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+DTVK+Ukvu+grCmaFel9/qZWzStrJr430dI/I0CRmlq+Tawr1My3FOYZ/FstnJBjW7zLS2013wB0xdP/f3uFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9940

On 14.06.2023 19:25, Andrew Cooper wrote:
> On 13/06/2023 10:30 am, Jan Beulich wrote:
>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>> @@ -593,15 +596,93 @@ static bool __init retpoline_calculations(void)
>>>          return false;
>>>  
>>>      /*
>>> -     * RSBA may be set by a hypervisor to indicate that we may move to a
>>> -     * processor which isn't retpoline-safe.
>>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>>> +     *
>>> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
>>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>>> +     *   this property.  Broadwell too, when running microcode versions prior
>>> +     *   to Jan 2018.
>>> +     *
>>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>>> +     *   tagging of predictions with the mode in which they were learned.  So
>>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>>> +     *
>>> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
>>> +     *
>>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>>> +     * behaviour directly.  Other parts have differing enumeration with
>>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>>> +     * to guests, and so toolstacks can level a VM safety for migration.
>>> +     *
>>> +     * The following states exist:
>>> +     *
>>> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
>>> +     * |---+------+-------+-------+--------------------+---------------|
>>> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
>>> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
>>> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
>>> +     * | 4 |    0 |     1 |     1 | OK                 |               |
>>> +     * | 5 |    1 |     0 |     0 | OK                 |               |
>>> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
>>> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
>>> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
>> You've kept the Action column as you had it originally, despite no longer
>> applying all the fixups. Wouldn't it make sense to mark those we don't do,
>> e.g. by enclosing in parentheses?
> 
> Hmm, yes.  How does this look?
> 
> |   | RSBA | EIBRS | RRSBA | Notes              | Action (in principle) |
> |---+------+-------+-------+--------------------+-----------------------|
> | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA           |
> | 2 |    0 |     0 |     1 | Broken             | (+RSBA, -RRSBA)       |
> | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA                |
> | 4 |    0 |     1 |     1 | OK                 |                       |
> | 5 |    1 |     0 |     0 | OK                 |                       |
> | 6 |    1 |     0 |     1 | Broken             | (-RRSBA)              |
> | 7 |    1 |     1 |     0 | Broken             | (-RSBA, +RRSBA)       |
> | 8 |    1 |     1 |     1 | Broken             | (-RSBA)               |

Yes, I think it's better to have it this way, thanks.

Jan

