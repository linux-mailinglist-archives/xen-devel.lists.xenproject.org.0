Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B257EAD24
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632283.986528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pqG-0003wX-ID; Tue, 14 Nov 2023 09:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632283.986528; Tue, 14 Nov 2023 09:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pqG-0003uE-FT; Tue, 14 Nov 2023 09:36:20 +0000
Received: by outflank-mailman (input) for mailman id 632283;
 Tue, 14 Nov 2023 09:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2pqE-0003sw-Rk
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:36:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 417d7754-82d1-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 10:36:15 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 09:36:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 09:36:10 +0000
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
X-Inumbo-ID: 417d7754-82d1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbfMm/NZkR8FxVCfsklDEj+bxle+QXVHlUacjM7KbzsKi/5rcJlyH8dsufCXJR/NOIYdT0UjrYXHasXmUnkXs6+7eT+1RXc8ZmQlD75Ju0L+Pq99Xd5LV6xht0U4VnUr8ARcZeINpb/SD/TsmWiyB6Z7+H3e4ZL1tRPEXiaPgEQ0njH94y55TvS8h6dFE82yjGbOFSjeJWX1DsBOC4OZw1k/D04rXUhEs6t/4mPISBYLL6TDoIgwxSJmLOKb7nZXxn8I1HPW7rpONssbtyVsCdrBBFQGY3cvv0guzzDSwvFKk01fiYKwhhwFJAea8s/SCQ/EUQiFt5R/JwZ4B1bFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8PVvPEP6qOan3iDkRjIIaq4ey1gM914yQVa5yGASS4=;
 b=Q0msDxMFZgtfETMHUTEKA2MtD2zGYDfnqXJEHc2NeRyzS/iJvPDxN28WfrdP1zTx66vGuuI5/7ZqyEvlNTE9qFiUdrl5YFomLgEKVejZS2Ye08FYoZHkvgKwC1x7qTaA5ONoRPlkEGPGRwbRn1KM87gfxgLbzIxvZ//HZjH79eALFLPm3bTFjEzWMqqwQ3oRiPg7+Gki2WuDxjElRUkxLJUQfPypsW/QiZolf9gV0qT3m19WT/DtCafPCk8vFAbnRn2Oj50GL4X4CJlTAZr7Et91tUJP/UgIir6AosBu5bKY9Ww7wfiykDKN1rLTQpTSQqWOy2Z7PILEtVDzZZFdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8PVvPEP6qOan3iDkRjIIaq4ey1gM914yQVa5yGASS4=;
 b=U0menqGKvoREzVOYp1b4Qc2efBFwSHrlZFH0cYxz9McrjVi3aN4znvJa0SrXcGYirwN6Yv4S/I3GxOBTUHb9BLm+8ryt61HsidPUUfp08y+xCLbqLBr8b/nO7P6mYLXAdVTjKv8REqE+4L7aR2YiQQsgLFQKHMxL6rCnwR1yLLWrG/zbr0t61sbqUJwCB0LD72eydEb+TnFva5ZLrnJZvIOYFo1i8Hjq5m3poPIqQZhAmA7dHMKE+C1+UrfahYXBr/kE0z0mpejBkSohc2lL6W/vkhQcPyscKmFzKKfDSTP2ftoYdZSj87+jmgJ5Cfjd9/zjKeAMsQJ10vGKVJolPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6695fcfb-0762-e48b-69d2-3871a3acaad6@suse.com>
Date: Tue, 14 Nov 2023 10:36:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] docs/misra: add R11.1 R11.2 R11.3 R11.6
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2311131540490.160649@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2311131540490.160649@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 887fad66-01c8-466e-4aa6-08dbe4f522b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5DBQOlyiqNjcKam1h1BUrd7PC7fJz89yVkRT2NHRNjEd1ERx6YYhiZTC2pTOkRUY8+mklX4BB8HqANh45YOqkhTOYz/hlfrz86noMv73mEWdvH2ZrOpfeIMixbx1e9e6VMvZ+Tk+fFQuVSnMKTRH6982bGwTgQ/fXNlUEpDFWhc2UmHC5TdKAeyTWyCx1nyw0R4Sv/UwpoJR0ibn4q2HT7DFDgr8HHBBRqjh/OouAFZMdfZZ3eJNlkiq9GORR0HAKgynlZqvYW+JZmH/VmZ1tV9KHdsEU9FvaQBO33wxGyHv9NswhqBmE/ZRaX2t2NEjTdaCukOqx3MCL0ztRwgZQ1gSwoyOJuBK0A0rmxfXwRAppkst1efGAKkhZGEO6LWWyFf5NZ2MwvYEaFnpFAKyIymu53IdKpraXLu59eqO5Ad+j+OfGflOQr0A3TSe9ncLO/wdTDnLjJ0JjbkgRgmpJsSkVHeZihWCZw5b4VjpoHm79KuR2qv4ydUe7DiYSilTo5PKZReapwpYsLKjgXphYELPjodW4kYcUa+A9Z4s9amGs7E6g9f2PBbuC9OL/nu71xX5wE8rn2N4J8YO87ASqQ+4JN1TXfD0TwHEAmEF6/C6hAaP92hAmeLFmhYTAmPKWB/SzlDMefR1C6W6CCB2TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(316002)(5660300002)(4326008)(8936002)(66946007)(66556008)(66476007)(6916009)(26005)(41300700001)(31686004)(8676002)(6486002)(2906002)(54906003)(478600001)(53546011)(6506007)(6512007)(2616005)(36756003)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHFBZlVEdUJ4Y0VyR1BIYkdNWHF2cHBMRzAvRDY4cFgzVFhTb3p1UEpiNm9B?=
 =?utf-8?B?WDJrTndMME44ZFRYaGFOQjJxdzNKYVA5MVJ5amxRRUpFalBGU1ExNExwcXVM?=
 =?utf-8?B?VXdNZk01UXpUd3NBcU9TczJoS3pLTjJxTys4TEtENVlyVllCWGRpWFJZdFgw?=
 =?utf-8?B?WTNPK1gwTFJLNGdLUVNTSUdUdExRWXpsN3l6MkdrNW5iSkU0Si9qY0Z3RWc4?=
 =?utf-8?B?UVhXVnQvQjUzTGNFWnVRYUlOREwvVW05YmM5QUdwdDRuVjIvV1lYUnpGQUFx?=
 =?utf-8?B?dVBPaVZwTnpaNFRaRExDMmhnamlqZUpoM2ZuNTFqcnhoQWhGTUE3V1F0ZXRN?=
 =?utf-8?B?L2lJQTl6Y1RXWTRVanlNcWxHVDNlc29sSzhoeExrSXhSbXNHTUhFNHRURmpD?=
 =?utf-8?B?V1NxWWtIQzdzZ2lDSE1rZ0RTZG9Kb2tyRGFLbXBiL0JKSUVDSzdhYUtIOHIy?=
 =?utf-8?B?VDFEKzNZbXdIenlwendqMUx3Z3NmSTBoWFNDMWJ1eS9CNE5iYWxFV2pXbmNV?=
 =?utf-8?B?Y3l4N0lOc1p6UWN3YjVCMWp2ODU4N01YTG95QzNuYkd5NE9LOGZjNWJqc0M3?=
 =?utf-8?B?OVJmSThnQVJZRytTMVJqZDVIVG51dlB0S1M2RGc1c1VmRzZDcE1CSlAzcHZx?=
 =?utf-8?B?d3NRckxuSFViRUpOMVJLRlZPZ1pNRndoMjIzbWZkbzk5NTBjL2p4ZEQyRHRZ?=
 =?utf-8?B?a2JBYnpaQzEwSzg0V1JYUUNrbGRpeW1OSWQ4dWtJdkF5d1dsSVE5Wi9hYnA2?=
 =?utf-8?B?c1B1UHZRSjM4azgxem5WMW1zZytsbTdWU3h1a3IrQzhMbWQyM1N3dTJEaHp6?=
 =?utf-8?B?alhwQUtsOFV0T3BoN0E4OGJrZFRtSWMybnd5UDNuME1CZm5LaUJzbjNDdFRj?=
 =?utf-8?B?eGdTemZCdm5peXU3TUI3RkFONTAyelJGbFg3M0FqQ3k4bkozQkw4bGI0amtE?=
 =?utf-8?B?THpiTDZrWFB0Y2l4NUpzVXRVWXVGT2pXcVVaMHpKOEZBZW9GRDB6NTgrZEdB?=
 =?utf-8?B?dTR6SmQySWlTTjM2d0xydkt4ZnY0RHZFaUpJRDJsNmxVSFdPT0Fkd2tqUWRI?=
 =?utf-8?B?U3FxNWJxUzVjbXVPc29oZDFTY3hKYnB3VHlnNCs1M3FwY3NCcHBFUlQwTzBq?=
 =?utf-8?B?ZW1YRGs0azFnMHAyOE1iTjdvS2dkcGlLU3VQcy8vZXFyY0FaRytkMTgwTlFF?=
 =?utf-8?B?RFROaGs4SG9HeUpJNXluenBWUGZkTXRCNTJ1aHQzc0tybFZXY2pTWHBnNTIz?=
 =?utf-8?B?L1hxKzdWVVh1RkttZUQ5UDhHVWh4TmtNVktDcVJjRzl3b3BTeW9LY2VLUkE2?=
 =?utf-8?B?MWpkcmdMa3B6U1gzSmViVXJXU0w1VGtSS1l4TWl1dkJVSExnZy9aZjFLNG5D?=
 =?utf-8?B?OFZ6aWJzbVkweU5TSWpnT2t2a1hQY2xlTE1hU1R2V0JvTkk5S281N1NLYk0w?=
 =?utf-8?B?RzN6Wkw2dWh4TEVYWmxpQ1BBelRDdzZwZjF1WjBjSXFxMVZJY3hOOER5WWtB?=
 =?utf-8?B?NjdCalVDR1NsclkwNTZNOFIrelI0eDlEMytkQXVBRFpBeTExb2ZsS0RYVHFw?=
 =?utf-8?B?c0pwU1FWOHFPeGEzWWRtbHNSY0xaYnhFUGZrOFFyMU5ONkM2c2pSbUJWSzZO?=
 =?utf-8?B?NGl0TlY0Nnh6UkdDUFJ3a2pUZThvMW1IVlp4bWFSTzZKWklKUTVPbTBZWjN3?=
 =?utf-8?B?RVk4RitpUXhZNUExdFlZRVdhV2dtbFNRdUFYT2xxZEk1VTRPZ0YyaENyN2k5?=
 =?utf-8?B?QzBwK28zZ01BRnhBeXZGWHpucTNUUjlUUFJWK0tiYWdocDN6Q2tmV1pMZTc4?=
 =?utf-8?B?QWo3RjQxR2dCb3JTOGh2ZDIxRkpNdnpyd2lCcWJpOHJJZVZtTmpnRWpIVXFS?=
 =?utf-8?B?S2NZRnRIUitpY0pqbWZzSk95R0tKNGdDSW4yMGRuSUljT2V1ZldGbzFlRnlC?=
 =?utf-8?B?OGZwY1hBeU1QUU1YZm40THB4RkF4c3lmYzgvT3h1NGFtSUNsaU93QnkwSTdv?=
 =?utf-8?B?emhsOHJFTUNSVE9KV3EvRDh1VS9QamF0Y1pzdjEwZTQ3UWdUYko3RjlGMGJm?=
 =?utf-8?B?eXBnRjN4RkgwQktRVFZYRE1HOWtLRE9Vc0t6UXRKV1BsKzNab2tTTXYycXNa?=
 =?utf-8?Q?YqZQLjT1fSih/aOWRyWsZyjqf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887fad66-01c8-466e-4aa6-08dbe4f522b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 09:36:10.4858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmHFH4OiV6b0X/vmsvHhAkZjr/tFG4DQHsncRP055D5nYamUQm+ghkZ5/erdFADmNHTHIBHeMcQomNRdNEDQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586

On 14.11.2023 00:44, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -383,6 +383,38 @@ maintainers if you want to suggest a change.
>  
>         CFLAGS="-Warith-conversion -Wno-error=arith-conversion" make -C xen
>  
> +   * - `Rule 11.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_01.c>`_
> +     - Required
> +     - Conversions shall not be performed between a pointer to a
> +       function and any other type
> +     - All conversions to integer types are permitted if the destination
> +       type has enough bits to hold the entire value. Conversions to
> +       bool and void* are permitted.
> +
> +   * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_02.c>`_
> +     - Required
> +     - Conversions shall not be performed between a pointer to an
> +       incomplete type and any other type
> +     - All conversions to integer types are permitted if the destination
> +       type has enough bits to hold the entire value. Conversions to
> +       bool and void* are permitted.

Assuming the rule's exception 2 really means void, not void*, the mentioning
of void* here is still fine.

> +   * - `Rule 11.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_03.c>`_
> +     - Required
> +     - A cast shall not be performed between a pointer to object type
> +       and a pointer to a different object type
> +     - All conversions to integer types are permitted if the destination
> +       type has enough bits to hold the entire value. Conversions to
> +       bool and void* are permitted.

Here and ...

> +   * - `Rule 11.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_06.c>`_
> +     - Required
> +     - A cast shall not be performed between pointer to void and an
> +       arithmetic type
> +     - All conversions to integer types are permitted if the destination
> +       type has enough bits to hold the entire value. Conversions to
> +       bool and void* are permitted.

... here, however I consider its mentioning misleading: "void" is neither
an object type nor an arithmetic one.

Jan

