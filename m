Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C108777720C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581873.911314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0eP-0005vS-Gq; Thu, 10 Aug 2023 08:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581873.911314; Thu, 10 Aug 2023 08:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0eP-0005tm-E3; Thu, 10 Aug 2023 08:04:09 +0000
Received: by outflank-mailman (input) for mailman id 581873;
 Thu, 10 Aug 2023 08:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU0eO-0005td-5Q
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:04:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 798c9ffe-3754-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:04:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:04:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 08:04:03 +0000
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
X-Inumbo-ID: 798c9ffe-3754-11ee-b283-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxFjPyZQG+9NrIFwpo5Y16j5VZO9FGA1CvdpfUhi6NkRhsE+1PEiDRTSBf5BaqGNcZET9Yaf0Z7cE5WMMWxb5BglwbuZgCjo4FT6yTMm5OhgU153peB2YXAm81U7SMKmvFa98bv2J/URn4X3Bl2HvIWA5xfbwv6o80v3vIdTIiKFepSjjZa1Fu2teEyQWLyTm78yXGk+/ylhiU7HH+ZPh5ANlit07OwOHk7U5+OEVXAyOimNqBN6NizoAr2U9Llu1Z5WWV0CvKQ5phX03KdjesQkZTfwfvhdIsNdpEOjTzBzlq11QL1v3h+ha+twphcMp1J0Y6+1Dv1Op+HBiMbC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUc532/w6szC+JEuVUjiEnOWawjebcTbX3zIHF8+2PE=;
 b=R9SnGjegpLubivQjrK6VAewWlveoE2tbSRMkUeMYjgR+ObTgpciVBwDmg1fvwLskFVnpGATZD1tB3gnXmi9f2gR1pAe3Y8SluHBkz4fFMCm/f+ge5CZqFVGSTHgbgtHOMAt645rj1r3xNiMLbitOk5TzDdycAIi/gUJPks7ueSgrZ5gkWo19V7wZBytNzlZLwjRII4dxKj5dYhPbYw6/G9chS+j08lR5JUpyGgdvRH1d0MPPoK+eXy5JAB/4K4ym1JL1N82QBJgGWjKnrkDgrVoeRra1KnEAPqTO10IjWyWbKNxJFPaCxZaBZOb3VY3gAym9vZdSAr1XWMc0pbkvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUc532/w6szC+JEuVUjiEnOWawjebcTbX3zIHF8+2PE=;
 b=lqzmF2e6HYMKqUKOPZyJBDH0Shjupmor56Rm6r4SaFsGYIY4tDSo6w2GvAlvg4EYCw69LG1LxlelFprWlKryuJf+RooGUV+BjGK43KvQ5rXjbtuWm2BiZYQ7q/xkYqUNxPo9bItjmaqI3qSNy7sWtgbIMgv5ynaxWDzXjQhnk8GXzHJ4eRnAfR+2kR2H3rFlh0+kyE6qSp9SbFj2p58/jZxwcc7eVN6pDENo1xBmHX6ySZg4U7JV4sMO6mZS5A+oOwslzV5qAFnIFhUJVwxCiKE8g0AQkjlHjQk0M6Bx+BHYbzzrwXNITxpoUnjM6G583/04XIYXv2tRmXASU7H0uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec6b9b1f-71be-ea88-3a6d-ce3c17afeee8@suse.com>
Date: Thu, 10 Aug 2023 10:04:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/9] xen/ppc: Define minimal stub headers required for
 full build
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <9cd545a4a9ef55d06ea0b81044e22f64ee42823e.1691016993.git.sanastasio@raptorengineering.com>
 <aaabc5d0-aa69-5c30-8e49-635537868346@suse.com>
 <21365276-8338-12b9-b3b8-2a222e7eceef@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21365276-8338-12b9-b3b8-2a222e7eceef@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 39327daf-dc5a-44af-9397-08db99785c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uWUKMIrAGJycmAnnllomA0uLfqRtvV8DgSLMnGsY14AD4jI1tJGmP9R8Jhh0rhREksyC3GDO0bS4q3qrLFNtuh+a+hNS9u0lWjyOlxkkW15HQVzZXqm8mhmGDYhJn+UaGYx2ML9FOZwBI5O+ba6UfQ0Nlf8IRQamfUp7kLt+KLgDTWroTqxqd22pQq03qDDqzeOY157Sd96veE3cJPajXmwXZkIh1g/EOK7HQJuTwUysarKqa9cnRLA6Pb9T4+ekjLzdulpzcQOP5AgKbcLoOeaQP6eV9VlTjsIckUiNjuibjkmFwB3KkNPs283VY0Uf55xoHvDNxiGemgQu8Gltm4Fs7GZQiu6WVi9ImHQ7Mpc83jeJoHs5y/THxBpjqDLDL0VXm2IaCG4pdegBZ8wgz51kyZk/s5651vcmblMjV2UdRnM2C/s92ECrzJzyqhtH3VIe9tt1sOXO4sEDQ7Ww7sfKoZ063RM54HoCKre18DKIpfkkKqQxv8075BzD3Uxh1FTYq88ECmF2jsOfo46axMRRUNqoYd8rqxCmsCZP8uUTcjoXPY3tXkUzbOulVuXgW8Weq0xjKp3i9QRmTmgNiV3PKL3kERerWq8cCm7SkENIYv+ClnrdzbTbfueH4SoMOy47AoR0epNN165Ncfn9+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(186006)(1800799006)(31686004)(66899021)(86362001)(2616005)(36756003)(2906002)(66556008)(8936002)(5660300002)(8676002)(478600001)(54906003)(31696002)(6506007)(26005)(6486002)(66476007)(66946007)(6512007)(4326008)(41300700001)(316002)(6916009)(38100700002)(53546011)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXNEVEtTTzBlbGVOUlIvMDJvYjhBY1pTL3dQc1hOcGsza3g0bXZpS0l2a0U3?=
 =?utf-8?B?aDlYYXplRTNnanlCa3E3M0JlQWxWR2lEajdncHN2a0hWOHNRK09maEs1Z2Zx?=
 =?utf-8?B?NENYSkVsL0Jibnp5Y1o0b2swRGRKcVdMSTEreDVPTlVEVWdTYTVGekYvVnZs?=
 =?utf-8?B?elFuL3hLZ1MvbVl4NUxWWjRRcStEZFBkSks3NnpiblYvYkMrMndhWGQzR2tF?=
 =?utf-8?B?MkJ4OUhZSmFPQ2MyYXV3OVNQMFFGMXIvM3d5TEVUU29XeHhsZWZRZFYrU25q?=
 =?utf-8?B?YnNDWFVCOUcvanpKSjFlR1FYOVVBUFJrUmhUblhDeE5EUXJ3MldIelpaZExo?=
 =?utf-8?B?L0ZIbzZsc1hmNTZhQzZQUGt0Mi9JTWt6NHJ3dEl2aThCbVRSdUxIdEphU2JH?=
 =?utf-8?B?ZnRJZlpuZEltM3QxWGxIbEFBN3JSeTRJM3VsejlPN3U4cy9IZ0JoTnpaL2h0?=
 =?utf-8?B?Q3RJbVhIYm1BQ2tOeTB1VzlwZEJ4MEVwRGhKN2RNRnB2WXU3RUVwaHF3dVhC?=
 =?utf-8?B?NHN6ZkFvaUJDYm9NZkhFV1M5R0oxL0pxamx6cDlzUFNEZndTUzR0MnNqaVZv?=
 =?utf-8?B?OWxRbjNuSUZyZExkRktJUEVERkFGQVVmblEyZHAwdU00cUpoVEs5VWJCVlVI?=
 =?utf-8?B?dTk5eHF3WXpWNEN1dzJieGZkY0R5RkwyYXBOdHdwOVZZWVhYd0QxaEwyb0dN?=
 =?utf-8?B?c3ZiUFdadEtEaHZ5d0d4bHN6ZkVvRk1Lc1JDSTlubHBsNEM1emxGQW15cWZm?=
 =?utf-8?B?RU1ybWVWdGs0WlJPeDg1K2FwN0s3NTEyS1FQVXJXREk0d1VhcFVHS1pIUGhN?=
 =?utf-8?B?ZVlydWtiVnZVK0RDSlNUdTNndHIzTUZ4N2ZoY0Z3akx1YlRpb3ZUODVUUklQ?=
 =?utf-8?B?MytnQ2dySXVUalpaS3VHcnB5NFIxL3Z5RzZTSmtxeStwaEhCMGlBY2tBMjRm?=
 =?utf-8?B?c3NsRzFFTkRSWGRCYjZMenlQc2NJanNmV2ZOallXWVh0a0c3enJtSHBlVUZz?=
 =?utf-8?B?aDliZkJIVkNDYUY2QnBFN2xiSkprMDZBRTIwRGl6MVNLRTRFZ1J1R3Zub29S?=
 =?utf-8?B?aXZuOWFYZ0x5UGYxN1JlVk1PNDZ2aHlaK2lJVEwrVXVRVUJvTG5SaE9RL0tY?=
 =?utf-8?B?MnZkSVRoZlJJZVRPYzdqYWNvVm9Ea2s0NGtOeFdWclZVQ205RXV0RUNYUUdQ?=
 =?utf-8?B?cUFsV3A3REZvMERGMTJpV201eHhxMnh2ZmhPblJ6bDVTMmlWL09nZ1NGbmcz?=
 =?utf-8?B?ZldFa0RKNVhZc3poaEVFSERhT3hOR00xQ21DQ2FLUmVXdEFUZVVPY1BrQmFs?=
 =?utf-8?B?TzN5dVVsUVI1c2JqbDk2dXQ4WTVJNE5TSGZJTnZ1T1o5Ly9nTnRIVTFvMmd1?=
 =?utf-8?B?S1JNWFQ1bFZTZTNEQ3hDR1VEM2I2UXJLNHZsTHVwQkRQWFdpSDNTZXpTWDBh?=
 =?utf-8?B?OVZpeTArajRHbXRKQ3NPRmZqZzVUeldvY0ZnZGtVM0pvM3dCeGdVSmRJMkR6?=
 =?utf-8?B?dFpnOG83djlidnhwR3dJTzI4OGF0ZjVVQ0hJem5mMHUvRVhSOFk4NDN2UzBz?=
 =?utf-8?B?R3dlUzRkR2NjVUQ1RDNqRW45Z2NFQXVKdGxwdWdKWUJtMXI1aXpLOVpwQUk0?=
 =?utf-8?B?V2g3UmlqZ0RYaUhnRC9ZY0VmSmdCYTgvL1hucGVBUExwcy9mVzZhNDJ0d08w?=
 =?utf-8?B?eEhXalQ3dHB1c1RXNWhzSEwwZ0xROXJoRHJnS1dRQXNsVHNzUnhjdHg3THI0?=
 =?utf-8?B?QmJjVDZjR2NhcHh4U2M5THE0L21Dc0NKUDMrUWY1TWwveUxGSkJzK2pWMVky?=
 =?utf-8?B?aGtjSmlwMlpNaVJIVFl2dERnZVNTcVBLZEZpbWcyWUIydkNld3pkQURpL1pt?=
 =?utf-8?B?VU1IOVVCY0hvNFZkUkFrRkNCSllaMHJVMlZqbTh4NFdsT3ZSeTVzbDVrZWxU?=
 =?utf-8?B?UmFVUWZwWkdpSHk4M0VvZ0hNbjNROGxoSE9iem95Y28vZlFESDRkMER2M01Z?=
 =?utf-8?B?S1UzODFEdTQzcGhiZzBhSE8yZUdhbTlEWUcyN2I1VVN5TlRubWtONnhkckw3?=
 =?utf-8?B?aHE2SzZVQWF3SVIvMC94VmNUVzhvOWhVdUUzd0c2Wm91MytCYURYTE5SVjBY?=
 =?utf-8?Q?OuQiRP7t0K23r2/tfxzv16xLS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39327daf-dc5a-44af-9397-08db99785c83
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:04:03.1722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVRit6EkfkTFAxVs2utsI27aIJPgvFEkHDhyrBmANF7Sh0qnGK8p1HSg1oEx+CWziQ1iwrOBjySs59YpWb0Asw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

On 09.08.2023 20:41, Shawn Anastasio wrote:
> On 8/8/23 4:12 AM, Jan Beulich wrote:
>> On 03.08.2023 01:03, Shawn Anastasio wrote:
>>> @@ -15,4 +16,10 @@
>>>  
>>>  #define BUG_FN_REG r0
>>>  
>>> +#define BUG() do { \
>>> +    die(); \
>>> +} while (0)
>>
>> This looks like it's temporary. I think any construct that later needs
>> updating wants marking in some common way (such that it's easy to grep
>> for items left to be dealt with; you have such a comment in e.g.
>> asm/event.h). Of course if an entire header consists of _only_ stubs,
>> perhaps a single such comment would suffice.
> 
> Yes, agreed that this macro deserves a TODO comment.
> 
> As for the rest of the stub functions that this patch implements, are
> you suggesting that each file with stubs should contain a similar
> comment?

Well, each one needs to be (and remain) easily identifiable.

> Another alternative that I thought of would be to define a
> BUG_UNIMPLEMENTED() macro or similar and call that inside of all the
> stub functions.

I like this. Or maybe BUG_ON("unimplemented") could also be an option; not
sure though if the compiler wouldn't complain about the resulting
if ( unlikely("unimplemented") ).

Jan

