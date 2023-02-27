Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A206A4680
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502775.774745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfon-00087p-O6; Mon, 27 Feb 2023 15:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502775.774745; Mon, 27 Feb 2023 15:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfon-000858-KX; Mon, 27 Feb 2023 15:53:37 +0000
Received: by outflank-mailman (input) for mailman id 502775;
 Mon, 27 Feb 2023 15:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfol-000850-J2
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:53:35 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe12::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3fecd58-b6b6-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:53:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:53:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:53:32 +0000
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
X-Inumbo-ID: e3fecd58-b6b6-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfZv7X5g+Fv3HOsWTGQYTN0quJ4tdsDOzPYTqqZd/ceK8aut1Eg9uIlfYivtumlN3EgVZS4kvbfE56x0g4ik/dyAthMOrODqH0JfrqJykGJrPcHxwYPpU9Ovc0fuTYrKhCyaW8Ib+ytixogfeFYiePpBNhPag/XbUVEhD0uHKNi55g+8YTYKV0xn5rW679Br5mjhfxiww1xqrWHgwXSlFQ7iRauD8du/ImJtugYhZnmWaADRZqpEgSZGvh3wbL7jWKCxPUElCHPZLCQ9Uy0HO51SrBS32ALZ4D0Or/Hdglo4cb1B3uQMdFXd6gwXMEL7xb+CkIhhmYmRIzS2WUP7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVQD94cnUTwXOOQ99Y0VOWY/TTwyQj+vYJVQrzsYpOs=;
 b=h6fH44AVpKQN8ry2W/k++2ZD6vUX+T/CcfZqgpPjTh1KJKbJflIl7TPTWuk8p2ws5hr8fffRtRwctFO8bJ6PyDc8tB3mlUN8S2kBPW8k+AOX2zGucukprvaxq1PJtulQlegVJv0Vhnl6i3nBxHB0kqT5o9Jp0OtDshtnojwNzmlghLRVbmclBHNsBGGbrW2XSBKrUhWpm+TrhSVE4THSi7VYXUBo3PwbJwCA0im0a3aWvm+lFTCXXBpev8TyPYBMaxAgaY1Eqdm2WHMNC5lJLeHCHakNjUYXqhqcpz0wQYQhqAOXhcV/xx5o/tdRYXOyRWAKqYJpb5ZlHdRrem1AkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVQD94cnUTwXOOQ99Y0VOWY/TTwyQj+vYJVQrzsYpOs=;
 b=NPG5bNGDXYPBGZ4HCkc2ivXoyG0L71iB3UbcRrfU6LffiO6pyaM417RvGUwkfNqvYsrcCNtfjR3fUrWuHzDoZP7iWkvWoBh0pUAcUkTe+bw3dN5lKM7UO620iV1s/AIdG7ZGS3gRmW2R3hlph1+hgjhvKm3HX9U/nuMGFRScgId6eoOkeK08T3Z7tU6nsR4KfTbpzS6V0MS7otRsypYvkfNYZ+vZ1M6RwmWcXnojV9ToghgpXHeugOfTi2ix1icFLHPyKU0b9I+8H++FTcUjmbAd1iC11okfh94XR9ftMStscMUQxDOr3UBAfMxOdRkAOpyVXRcXghSH0BQMzFQ31w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a0a2cb9-17e9-31c3-5876-cdfcc669ddc4@suse.com>
Date: Mon, 27 Feb 2023 16:53:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/4] tools: add offsetof() to xen-tools/common-macros.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227154153.31080-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb37785-ecdc-461f-dec5-08db18dac728
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lVkcxZDKdiqbW0zaUgz9/bWxd1O8ECHZz6iNyg7/JlGINB07hLjSlaenh2h76Fx6M7TU4fesP1PwARbbGNR605YtOlMbkjci4QdHaowUPlHZgSlcb7+xTszDTRVs3brsI6BYhhQ90DGEq5ifnUZeE70WDAd9PUtZOi89IYzyKzaC8gXf1lVbn0YrmpA2XPCtaqVvustrqC89tV3Noq1dCNWcFnm0Of25pEb8aJrECSa3tqjvLYh1ZIv+iEv9sp7olyeMkFiE9ni1QUKJSh/oYFxwBP0IaWo6lABqU3nqGsecwtljKCl66zdke6ABpenIFH3t97RuwSLzqvwWYT2mJmrBiqgS8q7auwz0dhLhs1qELXF8E0AsnE02fSDqB0FwILmFKGsUc6aywPMyYYwBzbtOFxA1qyTpbEi44KzNPp5Vnk1EDgMmtTlHtMwrL1x/4lVV2rywYHuIIjJJA8yTNceFwFOVi2/Ks0JWsO2S9f+DX895XEBsgd2HMVZpzzI3voYfnJ5ewZX1kEP5yRk//kNuQhPvCmb94NkDMzjj9Y6mlKpYgS59OaG2xveLYT0GOYPSmBAmr4SsXwfG8quYBHFDlsL5bFBEJbGaxZVynO0AamIeAA+3WVP1YBH7/8eBZhBq6LY2u1efnZklDd6ZsNarwxYSmd4ssbFFweB6xmdAiCq2eMPp12zFrRFBnsYOIl/OrI0iktNxdgqLBDz5cU7ZaIwEfxeqoGPJI48rons=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199018)(66946007)(2616005)(86362001)(6486002)(37006003)(316002)(66476007)(66556008)(31696002)(36756003)(6636002)(478600001)(54906003)(41300700001)(6506007)(8676002)(26005)(53546011)(6512007)(186003)(4326008)(2906002)(31686004)(38100700002)(8936002)(6862004)(4744005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0xFNGl6TlVEN3UrbCtaUjRXa2R0YlorNEdwdEkvcnlYYmJNNXBpUTByZWRX?=
 =?utf-8?B?cHZXVDhiTmNCMG8xL1dPZWtCWDhTY2pBR0NsZnZCZVNMNXhvTHZjMXk1UWFt?=
 =?utf-8?B?T1FadnczQ2d5eHB4dkZnUXlYUjZyc1JQRklHYVhjUWJqVjNZb25aaEZrTDZM?=
 =?utf-8?B?NDIwYUoxc0JsV2tDNmQxWTIwbDRMc1F5Lytqb04xUzhBdE9FOG1FOTdhckl4?=
 =?utf-8?B?UTc3UHp3M2Z3TGVIRFh6aVFEM2dGQnRiVERoM0NKYlZHNis4T1BTN1VvTDdM?=
 =?utf-8?B?aWpOeExkd05RKy9DMU9JV3BHc3JEZUZlQnVkdnRYRk9ycWZCT3YvaHpFby9q?=
 =?utf-8?B?ZkVXOEl6WDg5R2hkT1NxKzQ3RWE4R1pSbFMybU55dVQxWStnUmk4VkVNNjhx?=
 =?utf-8?B?SzRPaFd2akl4YzVYbmliOFl0Mi8yTFJpSS8yU3lhMnFYdTZLejNWSnEzWGYv?=
 =?utf-8?B?bTcvQTV2WFNIcEwvdUdoVzhsejB4TjQ0QzFTNHByQy9KNEVEUmJuTUYwQUgw?=
 =?utf-8?B?WUpOalVjVXlyRFRoMWJ3U3dZMjI1TTlQMlpjUy83T2lrZlZudWZmQnRiTVRz?=
 =?utf-8?B?MWgrd3E5VWUvVjJMQnliVE0rM3dLK3RWUzFDY3ltKzJVUUlRbk0zSzlYMEwr?=
 =?utf-8?B?ZHB2SEc0VUlDR1Jqbk4vdmRXcXVlRU0xY20weU02bjNvQXFvZldVa1o1ZkRj?=
 =?utf-8?B?ZmNPb1AzS2JKUHJZUklvSE5MbkhZYnEybU51SldBdE4zcTgzNEQxODcrdytK?=
 =?utf-8?B?K3hXNWxJc2F1MHpQK3JmMS9WU04xWEtDNHZBRjR1dVYyQWErMFZ2MHdGR20v?=
 =?utf-8?B?SUV3SkJEZ0hLaGpxdktKSGtWblhMck9VU0NXeTJWbHlpeS9LVGMydkNERzRN?=
 =?utf-8?B?NUlhdUVpUHZuVzFQWnJmYUxBOS84bDhCaHRLclRtOWFXdktMWEUwbXVWakJ6?=
 =?utf-8?B?Rkc3UFQzY3Bvb2s4aGk2NklKNG5WZzNsVENnNVYycTAxL0EyaFYrQ0E5azVK?=
 =?utf-8?B?MTRXaFFXS0JkNlZUUVBsVTdpVkxkYU54L3BqTDlGWmphRWlNZ2xNelU2WWdL?=
 =?utf-8?B?ZkhNODZaZEdhSVZDWHUyUXlwcnFKRGJDck9pdlhhdlFQZ1owZUVZeHFEdG1s?=
 =?utf-8?B?cnI4TTRNSWVRZU1xeTd0bkdqcWxCTTZlMEZ4MzhmYTRFM0tQZGtFR2hvT1J6?=
 =?utf-8?B?aUozUkYzWEI4cTJDTlVVRENWZXlkZjJjODUvK0hGUlRVdFMwV0tZdXVTM2RZ?=
 =?utf-8?B?K2Vrelg1KzNLUGVqWmZHcElGcE9CUlpHc3NJSWJqZ0xmMzRRaUFpWnBLQkV5?=
 =?utf-8?B?RkJVODladHl5WmpYbVFNQkVNMVhoc3hrbDNKL3NuVDB6WndhUjYyMmZvMnF0?=
 =?utf-8?B?QkpQaC9lVDEwVktFMnJxcG5lQnQwM0h0bDBaWWtSRlBGNVQzOG15MDNKb1J5?=
 =?utf-8?B?cmRIMzlIdmw1V05rWElJbUJGUkpSWEhydUFsRDloYjByY3pnZ3dnd3ZIUzJY?=
 =?utf-8?B?UDRlbUt6b0JIN1lxd3ROSkcrVldieWZYbFdweFFlM0MvYjFyMTdsei9XeS9t?=
 =?utf-8?B?enJuNFNkKzRrNVRWMHhJMHF0a0NXM2gzRGdxUUxlTWYzejRDUXhmZVFGK1lR?=
 =?utf-8?B?a0E4d1RIcWIyTHVoTzlIb2FOc2NTaUZaYTFpR01UdnNsU2tpakdVY2lmelQw?=
 =?utf-8?B?bkdHRkg3azczSWVQY1NxZVNGQ0s1dktJSjdHY0NuRUhsNEQ1Wmhwa2VzV0la?=
 =?utf-8?B?VE5GZ3dLbXg1MXpTV2MzekN6T2FqRnJKT2ZiVkVTVzA2bi9Rb3BpZEdMcDR5?=
 =?utf-8?B?WW5mZzdSTHRmNzRyNjVKUlJ5SU8zNW1IbVFFa25EOS9HU3ExMFpVeXJiUlJQ?=
 =?utf-8?B?ZGhmWlhZVHVSSisxNDhYbHFoa2lqQzQ5S3IwU3JVSmhJYllmWUszclM1QmpV?=
 =?utf-8?B?bjhvK05zanJ2WThqWjNER2hXcHRvNmJkbFZKeFN1dlROVWJFN2NpdHBtS2FO?=
 =?utf-8?B?SEJYcXZVdFhqcGxqdjIrbVlIcmtnbWg3QVRPeGFzbVVOOHNDRUZKSTJtOWZi?=
 =?utf-8?B?RGtoM3dydWJ3TkJ0WjBCUnREa1dvUWtZU0VuRUZYOUdCK2diNXZ5a0tYRk1I?=
 =?utf-8?Q?TnX+ZPzdYhzfLwyyGjiGa3VSo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb37785-ecdc-461f-dec5-08db18dac728
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:53:32.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QVb8JbuFbDinh8Tf6rQnYQdc3/IKZRyfFvwsf3KTHyj/8KUBxpZAiKGbfG5yyTDGuALmsj1jz9JuTiMi3UkbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189

On 27.02.2023 16:41, Juergen Gross wrote:
> --- a/tools/firmware/include/stddef.h
> +++ b/tools/firmware/include/stddef.h
> @@ -1,10 +1,10 @@
>  #ifndef _STDDEF_H_
>  #define _STDDEF_H_
>  
> +#include <xen-tools/common-macros.h>
> +
>  typedef __SIZE_TYPE__ size_t;
>  
>  #define NULL ((void*)0)
>  
> -#define offsetof(t, m) __builtin_offsetof(t, m)
> -
>  #endif

The C standard is pretty specific about what a header of this name
may or (in particular here) may not define. You add much more to the
name space than just the replacement offsetof(). If this was a
header used by an individual component, this might be fine. But this
header is meant to serve all components under firmware/ which care
to include it. At present that's hvmloader (which we control, so we
can arrange for it to be free of collisions) and rombios (which we
do not really control, and which people also may not build routinely
anymore).

Jan

