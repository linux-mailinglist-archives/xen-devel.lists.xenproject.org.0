Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E438694AB6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 16:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494709.764876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaXY-0002rO-CY; Mon, 13 Feb 2023 15:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494709.764876; Mon, 13 Feb 2023 15:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaXY-0002o1-9c; Mon, 13 Feb 2023 15:14:48 +0000
Received: by outflank-mailman (input) for mailman id 494709;
 Mon, 13 Feb 2023 15:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRaXX-0002nv-8W
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 15:14:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26632a9a-abb1-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 16:14:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7749.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 15:14:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 15:14:44 +0000
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
X-Inumbo-ID: 26632a9a-abb1-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHaq5x0G4y+DEWpQv7qxXwRh4ATCu5DdaQ7AC5UJ9KQrXy1TrZIiBVCdEhGTHglQmiKfHkBssnSHMs5wv3rfRU9AfjJ9FxCzGtbahSzD+ZdGixhnkvxUWdcLURtbEQENfaCLIWCOR55H/3yng0D8SpFHg1dz45UzY7nt4IEvE7N3kw7d5oc+g/lxZLOE12sSEXP+NIbw75gd5grI59zCunBauyiFq36PAztIiRUZYr2P+zOTCSMwpASHXtLDoI/Oj58ptt5LR3KVBAPP7437xlKXmwkahtWbEZOYGZmUeYYZsyONU1QcBlwCLrpBebF0Wui/SG838aJ9WA2IQDoi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spa3gAD7DVlHrXt8S850gfXusBgd9j7WRe0hO//yQg4=;
 b=liuUdovEVe9omqOmm0muOyCi/3NS5jvewPMetgF3VcJ34Vy5geqy4W6r5GZ14XEEMu8tpEMx1lKyDpVOT+sZ8rnqvgjvH0CQiZhXHitwbWqTt8Sdx8gejL5QPkARoTfBpGyN+nPLidXMSJKbvYMv6fNtJAVSkItYWSQ8HWQ4Z6ocd+CeAzR8glikoX2vXKD9EGqc69wXQV2cH4AOp2xcsR2bmQqKplDJE0+7JSMreT+5u32yWradd6bRKrt8De+xKBkUaK+Ji1AlqkT0vNDOfkrC/qBeGn/EfNP+IzIN7Q5moynUQT5MssEXXv1TPaIOKOnxCDJ2HxeOM/86mxeM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spa3gAD7DVlHrXt8S850gfXusBgd9j7WRe0hO//yQg4=;
 b=Fmf/e4fCK5s5GtPVEWOGPptdvktDWqR1RYKyhBrrCksS8evv9QlCH/36xsUHczzdsfHO5kJYt79N7Lsp/jeUpdfghDDI5YklaMHvv0vLFj/oeQAJI2Nkx+OsxaHOfZHWELEJFjFhR9hmm6B+DshjepHq7NLodQuylOBPGfITobHkc/wOcmnqFyB030/CervfY9pqArcKlknRYs7Izp4WaOmJrxX4+eXF+XR8FtFKRn7j4xeEhiwHBUUPxUzxHDLvvVgJc4vQ1m+xd8XeWhVAK1/pqrkXLeCZVapTQr85FpD15sNfvX8uzYOuDB33Ts/RSWV9yMyyiKmsUJuPdjTuMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1ad0a12-5fee-89c4-3a78-58f61f92c882@suse.com>
Date: Mon, 13 Feb 2023 16:14:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
 <e0ab939d-30f0-f9d9-1913-6e63e7023d0a@suse.com>
 <1b079086-ffb7-2716-8092-b69ede4aec8c@xen.org>
 <72b13300-57b5-022c-75a1-7fa588752f27@suse.com>
 <8f062433-659d-fe4a-4ac0-7a6b426e85ed@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8f062433-659d-fe4a-4ac0-7a6b426e85ed@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: cf45c5e5-aa19-4735-d994-08db0dd5099c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hU70iZWrMphLol9IBwieCNCPaWRjyYdJbB9Z+Ky++loJlGrOSTD6YYIL/as5atLV+DDaI/dwCRSOyuzY7XxQV2ttDAGBb8FFjGO/tdTC/ggXASNmXgK1VlyNipfo3UCx61LJ1Ty1zVlzy7csyEfS5PsoQCXi539rM87Pe7We1wcNf7vcpbI95RTOtu587UaneD2SVIjUtitycPDSXj9DtxTkh+6wJUOpPzujHzlkHBMRTSBg2XjMD/9w7eFa3ohW46Wop4Q1gpIlnIu9SOMQtj+waz8vurp+2ahhzTv/oHJZs0N9+PgGWLj/xwfZCdTDbsJribTDKVmag2Mr1cjt1pLIfgeRrb3x7W8Gr/idSZShQneCswMLg8NEahXTxiDcGAIf9PBMcRgieJgMMz0N29k5Ds0Iz5hg04kR0bYdgpuuVvktd74qBqJcK9mVI11GcJsKVOc4IJXab07aJ7V60vLRPaStkKG/Gny+6Xtj3APIOjI7P0LhLeu/lebTJvM3j4v925qqtsQ3hbVKpjn/GfNo95RsMOjuGdcgcL7/CJjohKuTLU7e3+bJGjst0AXqZ0jtmkXWlUSn2nr3k6JmUSvtfDNLCOG9Os3CoYEFtmOEtwMZm58SlfnARYXLuYJcpGldb1E6XLZ+rJlEtmaJn9w05Ji9MTPkKyCC733pJTpENor477sPkdIriuy1PAwPCBkZED5sX9Tq7bR6pNHp5Ee8gWByA0qmFD/di4rm+NafnrGOVo0nLkA7GcZRoYBH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199018)(4326008)(41300700001)(6916009)(83380400001)(31696002)(86362001)(54906003)(38100700002)(316002)(66556008)(66476007)(8676002)(186003)(66946007)(6512007)(53546011)(6506007)(2616005)(36756003)(478600001)(6486002)(26005)(2906002)(31686004)(5660300002)(8936002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUdvWWZkYlAxTU5aeEhhOE9WdFd4bkpVL0poU3pOdndXQVlBZG5JVmxJY1V0?=
 =?utf-8?B?aFlhQVI3MVJyRHpScUV2SlZmdEh6ZHhFd3k3UEtBOWd0SlFQRVIreWZhRU9o?=
 =?utf-8?B?bnpwSGJtN0QvZnQ2TkhZOStiNzU3TUlQYXViaTFRUUJ4Znl0eHRDN1hCUy9H?=
 =?utf-8?B?cTJCanlqUEsyU0xuOGNUZnpWaCt2a1pqTHlKcjNsbjlpeXFmZUJzSk10bVYw?=
 =?utf-8?B?clR0VG53Z2l6NnM2YitDMG5HczVsY0NnZ2tWeExhSnRyL01nRi9HNUVieFds?=
 =?utf-8?B?QVpXNGM3SUJ5V3BXLzBBWWNuUzZKMi9vTmI1VHJqc3J0YlNqMU1NaURuZllw?=
 =?utf-8?B?ZVlMRWU2VlJDY2RXWWU3UEIyc2hzUy83NWZGNGw2Q1E1WXh0b3dZTUE5NFlW?=
 =?utf-8?B?WlBMdEpHaFlwZHN4NHllcmFmd3VWVHpWblgrUnZEbUNacEZoWUtDc3pQcW1X?=
 =?utf-8?B?ODQvZW9CT3pkRnEzbCsrZzUxeWdQcmE1MzJLenVnNzZsaS9sNEtRcXlSOEI4?=
 =?utf-8?B?NUk3cEo0eXg2bWRFakJTSjd5QmpuVThTY1Iwc0ViNXUybHZGSkI4U2N3cXlN?=
 =?utf-8?B?elpGSmtIN1NtTUQzMkl1cm1RQzhoeTVSZkxLeEtnVVUzeFQ4OUxyQXgwYlpG?=
 =?utf-8?B?Z3kvc2tncjhlYnF6Ly9FdHBzdXI3VGJVYzNHdm4wRTJpLzdpVzFpY3paRUZj?=
 =?utf-8?B?S0o0OHlVdTh2c0pSWGxXU3dEWWdtUlhhOGlGZmhYazlHUXYzR2U5V3d1ejJL?=
 =?utf-8?B?Z3RlQ3JVZGJPRnJCTFlubnB4ZG9hOTRNUEYyVVZ3dGpkTFFmMWg3VUJGYmRo?=
 =?utf-8?B?N1ZmZCt6T0VGc3RER0N1MVVGOTEwZmpPV2VKcE51VVRocDRhWm16Y1FEN0gy?=
 =?utf-8?B?UHdNT0ZweVFzeGdXSDU4UWROSkRNREsvc0tNRW94VGFGNFBpbmh1S1RtUUo5?=
 =?utf-8?B?ZTE3aGEwY3hhcTdtQWo4ZHEyUTVRTm9OOFlXMHZsbzBzL2ZzRWlaU1FlS0xu?=
 =?utf-8?B?NHJvczBMRncvVEptUDByWFJ4TzBkaEV5UE9SNEhzU1NRay9Hbm9NODFxWWlH?=
 =?utf-8?B?bkIyOHB1czhqTTgxaERGUjV1L0hwenpnYUdkcTJZOE9BYU0xMkIyV1d3cTNH?=
 =?utf-8?B?UHJoOFBvVXdUZ25WUS9iTTlTckJET2o1akNjMTQwNnN5bCtabWNWWnNtWmkr?=
 =?utf-8?B?Y1RXUDMzbVFuc2lLRWI2ZHJseFlIYzc5aHpEWkZJcVQ5TCsyODMzQUhlNk1L?=
 =?utf-8?B?UlpIWktnWUZwNHRlMklHb01SenF1S09UdkdEWitIM3hLOGZpOFRaRmhzd0kz?=
 =?utf-8?B?dnlML2dnRmRtNDJBcEFLNXhWdjJscjJ0K01xRlVsZjdvQnFmRUplei9YNVRG?=
 =?utf-8?B?QkVVZVJzaFZHbzRMWmsrbWpuZFF0MDBqRG42SE1iZUNNT2ZaRWprUzRGWi9v?=
 =?utf-8?B?elcwUzhKTS8xNVhiMTE3Z2RvYmxWNlJIS29ZOXFOWnNGS0ZsUkhoaWZ0NGZQ?=
 =?utf-8?B?V0ZMRzdNUnhKQWhYNFBSVjRhVUlzN2dwcEg1L3RMdm90WDNDVnQ2cjJrZ1RQ?=
 =?utf-8?B?dHVQU3dCODVrM0l2VkVYMWJXWG9CdmtCeEFUbTFRQkdGT1g0czBMblhPNVFJ?=
 =?utf-8?B?OThQYkluK2RBdHFhRmwxTGVpeVJpTDJIVFUyMUo2QkczcUl5bnRYWC9XN0Rq?=
 =?utf-8?B?bXBwd2NPdkRGUXl6TlBqMXo4UmxlU3dGWnJ3R0JIYnpYek03MFNEeDgzUU5y?=
 =?utf-8?B?amw0cVN6ZjRLeXhXR0ZBV3BFUThmR04wUEsxQlZLelNGUkZGNnAzUmV3c3pl?=
 =?utf-8?B?NXNiTUUrcVFYVG1qWXE4YkFVS0RZNUphdzhKamE5YUlXaHJFeTljTDFoeThX?=
 =?utf-8?B?WG5iZCtEVVZKV3VUSnNUQ01KVmtueXArSjc4ZVYrcUVPb1RmaWVxS1NFRzZp?=
 =?utf-8?B?UmxvYVZmMnZGNnp5TXRXR2c3T2xobTIwTm0xdll0b3M5Z1JXQVk4cTdXbEwr?=
 =?utf-8?B?ZUhzcjBXWnkrOS8zZzM4aUdVSUNuNzZXTkhjbDZlZDhrWXhVbGdkL1FRNStQ?=
 =?utf-8?B?anFDSDRrZVNiZXdVUkhFaWNMTi9NamM2WEtYc2VhRXB6S2FmMFRIMlVrL0RU?=
 =?utf-8?Q?zZPwOgrFw66U7qQg2bfz/0W+r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf45c5e5-aa19-4735-d994-08db0dd5099c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 15:14:44.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcsi4ECpjqATPlskz8FYb8MptALX9NLYCOuQyoQqXctZhvBFWMtJZ2WMwSLMPugAYhGkZvTya5/gcUkvJXVXxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7749

On 13.02.2023 16:07, Julien Grall wrote:
> On 13/02/2023 15:02, Jan Beulich wrote:
>> On 13.02.2023 14:56, Julien Grall wrote:
>>> On 13/02/2023 13:30, Jan Beulich wrote:
>>>> On 13.02.2023 14:19, Julien Grall wrote:
>>>>> On 13/02/2023 12:24, Jan Beulich wrote:
>>>>>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/include/xen/bug.h
>>>>>>> @@ -0,0 +1,127 @@
>>>>>>> +#ifndef __XEN_BUG_H__
>>>>>>> +#define __XEN_BUG_H__
>>>>>>> +
>>>>>>> +#define BUG_DISP_WIDTH    24
>>>>>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>>>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>>>>>> +
>>>>>>> +#define BUGFRAME_run_fn 0
>>>>>>> +#define BUGFRAME_warn   1
>>>>>>> +#define BUGFRAME_bug    2
>>>>>>> +#define BUGFRAME_assert 3
>>>>>>> +
>>>>>>> +#define BUGFRAME_NR     4
>>>>>>> +
>>>>>>> +#ifndef __ASSEMBLY__
>>>>>>> +
>>>>>>> +#include <xen/errno.h>
>>>>>>> +#include <xen/stringify.h>
>>>>>>> +#include <xen/types.h>
>>>>>>> +#include <xen/lib.h>
>>>>>>
>>>>>> Again - please sort headers.
>>>>>>
>>>>>>> +#include <asm/bug.h>
>>>>>>> +
>>>>>>> +#ifndef BUG_FRAME_STUFF
>>>>>>> +struct bug_frame {
>>>>>>
>>>>>> Please can we have a blank line between the above two ones and then similarly
>>>>>> ahead of the #endif?
>>>>>>
>>>>>>> +    signed int loc_disp;    /* Relative address to the bug address */
>>>>>>> +    signed int file_disp;   /* Relative address to the filename */
>>>>>>> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>>>>>> +    uint16_t line;          /* Line number */
>>>>>>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>>>>
>>>>>> Already the original comment in Arm code is wrong: The padding doesn't
>>>>>> guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
>>>>>> size.
>>>>>> Aiui there's also no need for 8-byte alignment anywhere here (in
>>>>>> fact there's ".p2align 2" in the generator macros).
>>>>>
>>>>> I would rather keep the pad0 here.
>>>>
>>>> May I ask why that is?
>>>
>>> It makes clear of the padding (which would have been hidden) when using
>>> .p2align 2.
>>
>> But you realize that I didn't ask to drop the member?
> 
> I misunderstood your first reply. But the second reply...
> 
>   Besides (later in
>> the reply to Oleksii) suggesting to make "line" uint32_t, you zapped the
>> relevant further part of my reply here:
> 
>>
>> "I also wonder why this needs to be a named bitfield: Either make it
>>   plain uint16_t, or if you use a bitfield, then omit the name."
>>
>> I thought that's clear enough as a request to change representation,
> 
> ... "May I ask why that is?" added to the confusion because it implied 
> that you disagree on keep the pad0.

Hmm, yes, I can see how that may have been ambiguous: I understood that
reply of yours as requesting to retain the _name_ (i.e. objecting to my
thought of using an unnamed bitfield instead).

Jan

