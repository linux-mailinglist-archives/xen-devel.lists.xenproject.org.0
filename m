Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF91575F8A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368120.599313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIvT-0001By-BO; Fri, 15 Jul 2022 10:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368120.599313; Fri, 15 Jul 2022 10:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIvT-00018T-7X; Fri, 15 Jul 2022 10:52:03 +0000
Received: by outflank-mailman (input) for mailman id 368120;
 Fri, 15 Jul 2022 10:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8RKo=XU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oCIvS-00018N-7q
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:52:02 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30042.outbound.protection.outlook.com [40.107.3.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27a72ded-042c-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 12:52:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4752.eurprd04.prod.outlook.com (2603:10a6:803:5e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Fri, 15 Jul
 2022 10:51:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.015; Fri, 15 Jul 2022
 10:51:57 +0000
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
X-Inumbo-ID: 27a72ded-042c-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb3Eyn8Vsah1eRby7o9fGZsIniuCSAB58clkhz8l+qAdK0WhSqnnGxfVsljLsbxnpsrhC8wIBKFzNsFU+QVBdIJLEOzUJ4U5C4et37Gtnu/mrDx/hdNk+VfM3Wm12/QkvGu0+/2mHWAP5XuB6Qda128mzxHEUBHVyXVIGhdaafJ6XA3KofH2hLig2Pd5GkK3a+Yu2lkjgkBwmhLXQzZW0ZwOnuSteDNIoT3qeEwqB7ICATkzTRebRjTi4z2F9zc6KT5yMy9qGKtBBI9ek0LXjRURHBf6UiS44JBGZXUkKIxxkw98d3rQHn19aYDxODxtM5u1+gUM5omV/c1yX1t9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jp1LeJhPFHwfYBbhRNsYQf6Nf0QdVhWm96SXmKJGxPM=;
 b=nihH/j5+gq0/vV43eXznsNHM/HHRmryMkjDSQaxH+3+GNc8k4mXO7bIq7xoIhTum1XrU9JgwE+TyOtgK6aDdQQ7661+aGYwiKtIWlwQ8/QrqaKrCApECEtk+z0eOHTJo8ucYC8RLvcEESF1JjohS0vMM8P7MpHE1sRJ1H1BtFqoWO0Al1er2xMWUzmpRwYzv4qZ412YgUG9snobCPZkUKBH4QV5XJ9WqOCln6N5NhOWg77toOP7w5Kp1c9WTFJvooCxgzJf+oPedkC+O8/yyVKNChoCHrlaXmyN20vraBWUMXchoZPY4ExikgUCFcbeIKS9hwC1vgvVyNJIYrc1XzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp1LeJhPFHwfYBbhRNsYQf6Nf0QdVhWm96SXmKJGxPM=;
 b=Wkdeyzibhm4aMbKiKzD1Q+dUR6eLZElm2whjf3POVrGIV5FUsu4zC8Ih75xdS5wg9P3fKhHb8ueGu4CZT8C2UDtyWTmCCUNiY/ZayoCuwXTLzOVSaYh4JVgZs2QtTThD0/xyqJ8Z3dfZDS4D0WDKhLDt6ASI5kBaMWlnvYewbKYyWFCU9nwcKQYR2JgkoGKaciYmiMEBiTIlbw9YgFco+oSwHJqDjWteg8awiHd7/jI8DPOSUFrR9fLYa5ztV51KazR3yjwhn1d3ewRkcxjageadxfjehwooOtCPuK6rs94QaIbPhmbDPPrhqU45hUvx/jazVMfmqdkQFrL94+RMzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41ea1e23-83fd-d4ef-c279-fad7f5611a43@suse.com>
Date: Fri, 15 Jul 2022 12:51:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
 <d4767bc7-0f0d-7fde-4a9e-c6d4bc7ca2c2@suse.com>
 <a3484e66-4c02-91e6-2ffd-f82b1f96058d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a3484e66-4c02-91e6-2ffd-f82b1f96058d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37858928-664f-4806-0685-08da665009e7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tUd+7bJTTrbAT+3b8PX8IybUDxp9eaF2cAog7r6TJmckeAGi9XVRbU8W9NcH87i7gIv+FtbStqW+eqBDKoArKttGYMDZdYbfJFc9HH34LXQV7jo7+PGBFqaVLkmEG/CggXEQm+0AOyD8dU+521sShKXH7ifHRdBZQV6lONsTjD6WhpPKFangLtDToH/8iSFwmb3sZVwWvV0JYmZeTJrUB9dzog/KnbORbn66LVWP5oZHtdGalp7oDh2XCkopQnnZlvmjTxy3MqkgZmO7+78lOKVlz9Dhlh/N80m7DvauE7ri56ujq1JgiiYIn9fN/kOUhb6xrAdYwVbX6Zsteduap0ApQ1SREh/t4aEXMfFdDi6QOkiyt67m4h3j0X1H82gh1ARClQ3KWnjVDylFo4g+YSAScNUOb33/c+zC64SO3I9fhgfJb+bm0hVq4uUd+LV+e87EfamjiVGdsAbBgzpjpdRNeaLEL0XjU03IvVLfmvyANRyq4IiQHKP/YGx2KS4jYgePOI1Tmbvfcjoqa0rDBPyoUlcTUxYoaoKI2TKaJI6BQIqM/LCAuOjlA9dHFBHAoam8Vmp1e2zN5CLYaEVsS6nDRnnmZkr1PFvAPC9OYVzl4tC7U6xKWQQFG2JqLUPVZQJZ/n8U7XuyjEZhaVLJVhAER1LrOxOuyP30dnxvfSC7Ucy95f0mvwLT2OFYSR673d58go1LqzBk+9Es3W49iSXg5/uXs9cNY1NabEcYupi+cw6fRpXp7GRtEerSROpy/3tF3aZwSNV1aWYlXRLFb+hQeVaxJUmvsbfQjGRDzWHQ+PiCx6cWQRP15QlfzzXSdkARu3iEahknDLWB+b5xWwkKCBCLWkbgNBXs3yLrKws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(36756003)(2906002)(478600001)(6486002)(186003)(83380400001)(31686004)(2616005)(66556008)(8936002)(8676002)(31696002)(5660300002)(316002)(38100700002)(4326008)(66946007)(6916009)(54906003)(53546011)(66476007)(86362001)(6512007)(41300700001)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVRvUjJoYnlJUEUwclFCYXBtZ056VmNsemVjYXJVaTJzUVRhY0RUQ0JjYnlQ?=
 =?utf-8?B?QTU3dEgwaTNWbDFSUnJONXZmb3FTVGgrTWZGRTJDczllRmRSVzMzcjdDZEN0?=
 =?utf-8?B?MDFDcDNZdVNGQkU2c0VrVEpRRnVWV0pSQkU4SHlGb2NNSGRjRTFhVE9JWXFF?=
 =?utf-8?B?UXlWL3VmOU80UjFvMy8yNFpKdEx2V1VrLzVkQmQ5Wnk2YzlQYmZ0TDVtZ3hs?=
 =?utf-8?B?U2FKTFNVUGNtRFIwOHNxa3E3YzZjZ3djcnFtOGdISW0rTVhta0trZzgrU1ZX?=
 =?utf-8?B?bDhqRWJWVldwb1N3TGtqc2Vlc0pMVUlrbUhpcERwSnVtNUVSZG56OUlnUTN0?=
 =?utf-8?B?ZjNNMExONmpPbVZ6QnBkanFMMnB2RU8zT1ozM0xDSndJK3ppbXY4ckRxdkkr?=
 =?utf-8?B?NC8wSlhLWHBNemc0eTgrWkphVE4vdnFieVczMm9JTUNJM2YwQlZTLy9FYk44?=
 =?utf-8?B?aExyYVoxMWxlbVM3ZThzZGpNY2RXcEw2Y3VzMXZSMTA1SXBzOHRudEdBNndp?=
 =?utf-8?B?SWwzcEpSYlZ4N3g2OStFUGl0YmRsaXdMelUyTGFPdlR6L0VOTG9zZkU0eGJx?=
 =?utf-8?B?U1pBRUQ1ZFgxMUlRdzk3RCtiRkFYaUpGUHJENHpXTDJQcFhWbFFRVkk1UXNL?=
 =?utf-8?B?clYwSmovclEzY0dFTnhqK2prN0xOTC85bEhFVmE1R0RUaS9PM3FHbk1BOWhy?=
 =?utf-8?B?ekc0ZHIzZkxVdEEzV1FCWkwveTBRdlFwR1NBYXdrS0dNUXgrZHZObzNjQ0ht?=
 =?utf-8?B?YUVxazdJcjluR0tPSitGT0JvNm0vcVN3QXI0U3AzVEY0Tm1vbXJtZFZodity?=
 =?utf-8?B?NGQrcTFONlBBeHcwUVowSFg4NUx0elJEMDE0SE5UZGxVZ0hRNGJkN0VrQ3Vq?=
 =?utf-8?B?cmRWaE42TUsvaGh4dDk4Ym92emlTK3VjQjYwVGdMbTFlWVlGK3NFNW1QYm9P?=
 =?utf-8?B?MHJFS09oRUFWZWNyRlc1d3lOKzcxdFlWa2JKRDg0WDY4QWZCb0ViTGI5VUNp?=
 =?utf-8?B?bFBKNFZPb3VkOTZRQmNzd05qZkIvY0l3TURZL1BPMDU2UVcxL0RPcldtOHp1?=
 =?utf-8?B?UURpL0I1UWhMUlF6Tk9vYTJzQUU4cS9FVy9KNEM2ZXg2WmdWUlhYTUhwNVdm?=
 =?utf-8?B?WDRldXBnYm1jdDZZTTFFalBMdVJuZXRveERaNDh6N1RiUDlISXNyRTFkMHhl?=
 =?utf-8?B?bU5vK0tsbW9lMmErd3A2V3YyYkx3VWRVejN0dmNSZER2dkJ5R0dDRFVIZHhj?=
 =?utf-8?B?Zmx3b0ZnYlhFbmJkL1dpL3YvemhhQjFTTXhGU3ZUVDZ0aDBOanRnc1Q4Qzl5?=
 =?utf-8?B?MHRxd1phSTRVS0VCUFhRT3FsdGNQV1gwK2lZbE1DQjFqaGEvQ1NmQlM0aCtL?=
 =?utf-8?B?Mm05K0FFVDRIOEhUUnVSMU1OMEVWdVMxNDVsZG5CVElNUC9pN0E3amhJL3NY?=
 =?utf-8?B?d0FLcndLSmRHUWZtbDNSVXgvVlJOclRkc0oxQ25Za2VsUXRXMm1UTkU4djA0?=
 =?utf-8?B?bDg1VmdEQ0k2WnVTRUxHRG9kV3RrdnhlYkY0R2FkWTRoZmUvczc0M0FxQU1x?=
 =?utf-8?B?WG52THFZVzFwOWp0TWR3Sm82UmNtclQ3TWxMZmQrUVl2YTBOZ2h4Q0JGR3hS?=
 =?utf-8?B?YVdyVFhtNmcrczdSeElma0diOCt2NzZ0ZXlxUlQwQXoyK2ZKK1grZXh3ZmJL?=
 =?utf-8?B?ZXRybVN0ekVKb0NaUXF2MlBLRllWZTFVWlV1anUxZzFKQk1lWngyc24xL2dw?=
 =?utf-8?B?WXAwcGE2aTBKdkswTStLeW9Mc0xNeC9sVGRnL0U2VC9IcXlodVJHK2ZmOEhU?=
 =?utf-8?B?cXA0Ly9CNm1jZkh6WlpneGd3TVliZHNSc3dWL05na1dUQUoyZVViOG9kYlY3?=
 =?utf-8?B?RWtiZjI4NUlrekZLZTc2ejB6T0FNWlZpNHZ2TStaMlpaV3F6Yld1TzNVK2dv?=
 =?utf-8?B?MHJUS0lHaGxxVE1UYjQvTXBOallhSXJ0ZTlBUUNyVDNNRnlKSUNaYzNQUmlK?=
 =?utf-8?B?NTVnTk5lMkxFNmtmdkoxK2hESzQrM3FrckIxMjdPOFYvVGtqSzFNUTB1c0g1?=
 =?utf-8?B?NlcxVU1zNTl3bG1ia3EzSkxKRU9SSnFFUyt2dG0yeXl2YUFSTmRGQkx1aTZO?=
 =?utf-8?Q?6gtdn1QJRBwqjoGUoD+xCAjPP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37858928-664f-4806-0685-08da665009e7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 10:51:57.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KswIYAGRqbLND8iEJePod/7bokqkOfWS7nPa8FM97CrzOFIeybIhvpqNFYXTq6uFBNY/E/oMFDmy3E0kTpcAJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4752

On 15.07.2022 12:43, Andrew Cooper wrote:
> On 15/07/2022 11:14, Jan Beulich wrote:
>> On 14.07.2022 16:39, Anthony PERARD wrote:
>>> --- a/xen/tools/check-endbr.sh
>>> +++ b/xen/tools/check-endbr.sh
>>> @@ -78,7 +78,7 @@ then
>>>  else
>>>      grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
>>>           -e "$(printf '\146\17\37\1')" $TEXT_BIN
>>> -fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
>>> +fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
>> I'm afraid that's not portable to environments where sizeof(long) < 8.
>> The shell isn't required to use wider than long for the evaluation.
> 
> Yuck.  This works at the moment in 32 bit builds because:
> 
> ++ objdump -j .text xen-syms -h
> ++ awk '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1,
> 8), substr($4, 9, 16)}'
> + eval vma_hi=ffff82d0 vma_lo=40200000
> ++ vma_hi=ffff82d0
> ++ vma_lo=40200000
> 
> so the top bit isn't set.
> 
> And going from an 8/8 split to a 9/7 split doesn't work either because
> that uses 4 bits and we've only got 2 to play with given .text's 1G
> alignment.

Why does text alignment matter here? All we care about are offsets
into the Xen image. An I guess we aren't really at risk of going
beyond 256M in image size ...

> I know it's disgusting, but how about a BUILD_BUG_ON(XEN_VIRT_START &
> (1u << 31)) ?

In the worst case, why not. But that would be an odd restriction on
changes to the memory layout (which we've done in the past).

Jan

