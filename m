Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9F75C1FA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 10:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567413.886418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMloT-0006Jk-7G; Fri, 21 Jul 2023 08:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567413.886418; Fri, 21 Jul 2023 08:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMloT-0006Hd-4f; Fri, 21 Jul 2023 08:48:37 +0000
Received: by outflank-mailman (input) for mailman id 567413;
 Fri, 21 Jul 2023 08:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMloR-0006HT-3v
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 08:48:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f0889be-27a3-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 10:48:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7074.eurprd04.prod.outlook.com (2603:10a6:208:196::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 08:48:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 08:48:29 +0000
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
X-Inumbo-ID: 5f0889be-27a3-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRLgz0HnpTlyceeD208nB2++m+jDf0DLbaReyYhX1J2Z1Xm0TSpre5PpTdloWR9fuQzgjxXY36473oIRqwGLI+lm7cDazBGt2uJYNhn+iOm1oNRuX7l/zNQnvFfhCxJ3dsGoh7s88TAcgjXhsREmSFE2fK3LLr4WdHZgFoWlk/1xrfB6gTYB/OE8Quq+33QzEkc3/qNLt+UKHbXn3g4GjAePwZWPPGgV/oOmKLiIiBa50cIrC1jTPjjgW4BTheTGvn47bZq1wUWEve4gZ++g3fXsG0BUcnYImbmfi6QEIyUiy4D/S9unGTo0Ycpcc2A9tu3DD2zZxnkblVT6mk3CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+oZB76d4fwc3fm43fnQwwm3jFf+WcExKC0WCwYj3NE=;
 b=dIdqUPWpRqo/IjdGCkO7XtSxz8d/nhVmCYuOzq6AZsm43GgrlRXiAvdBnKWfSxFeHWmwIUSlB0FDuh+o7MbQuXSW+y2Td8rZS9E7UveBdmVBjKoNreg1pf1r39mgL8AMIqC/2svx6lCWKJi1D0w18jqDGPn8rIeoC5q7S35BqzLWFXjn7kDKrv8nhr6LWggaqX2YItBjxmbxO3bpshRMVVKAt/9YRkKyBlWGa42SoA+sFr9ITirierKm3jWWTjkZhDEz8QM+IMuLZvdGKcs6IGdd16Puph/7/9j109XGvvhSaeRjvnnBfQ/5tCP7ErDHSspsiwSysQXH8RVo+RI+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+oZB76d4fwc3fm43fnQwwm3jFf+WcExKC0WCwYj3NE=;
 b=IY48wEoyE/0vQqpboBJGd0iig0lmMXXDr86TRp4toFKcsk/sufBixqMihIcWjneyzgvOmWQAW+g5V247DHf+IWlKOAYHyITYkfx/MXiUY7jMcBTh3TAaIPwxQ6fj58PseEq1eJD8iEct2Si6yExhEY2J8/P04J6wARrnT7UNGGLLu5idtjTnZD9XgK52CcYRQJSAUoricoYsZHD5cxw/QOYOemmkXBVcqLhwFWpCrQyLaV/1tdv6yhIRU/mvKIZ3K854I5ExhIRGMUxOD2T/beLvsthmd/hIIbA+qJyXZwQ9ENaUfEYL6WXN/zLGsaVCH7pjWamBhgQCxsjusZ1L6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e2a8ec70-6af1-43e9-42da-2a9b265ebe43@suse.com>
Date: Fri, 21 Jul 2023 10:48:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <e9331a8c-69b5-b803-7989-7e3b95b815e4@suse.com>
 <ZLldU9ZNM5BRXqeY@MacBook-Air-de-Roger.local>
 <96b95858-c83a-5703-f6b2-6bee852e62e0@suse.com>
 <ZLo3NY2KX-3fuMGr@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLo3NY2KX-3fuMGr@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ed24d9-2cff-4d14-1db0-08db89c741a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+d9Tgqgni7VE3TbTiLx2qym2dW9+DzCn9lHQIWe1/rQ2LR41YhfiXBeobVFqL948TLIIJ5al5pehr1iG0MOi3SqhFkjc2nzU33aRkyRYtYBe+2nSvL1r5g2b0/97ZY4BEIeUiqQZO933DmpyPHljjcnA4SuBx2mgCMm2vo+FOEYHYY5dmXiUpVFMABPT5UBXkZm8DL/BGW7dwWuUyRcG0a8yEWXOLt/YXDtCOvSr+vP0KmAIHFVaGXAAoI1HglLLWAfm/vmkzbLna8+e1ZfK+jHBltS0hDzazegCLVRp8xy9mDNu5GBZeGCjW3AarBzvJy6AD1uBnix46iIRd7tMKcJ8wh983KpWPujhmZFl45JHl9Ut0cjgCOUAgkw6Fao2l2/VDZFMKYzdfk5J10QwiLUyixC2zF+6q8sIP8G38BW/hR6WeaRf4E3ZBmN2zrRKwfVJG2siZUi4YUvtfRl6c+RxtUZfhma3L9QE1ny2Nm/SRc/s9IbbzEaHhn+JZu5q4XnL8MYmV4OlCOSHd+j3RDMmnAmY676lKy7tgNdQeTtj+Muf9k/vcOVBHKJukwQoZC56upsvPud6qHuxb9hPK6d3+MqGNifuGpCbjSNTdBhhVxKGrQCEiE7r3L52rMJF1bHOOkGvnTAgazvUTzyOsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(53546011)(8936002)(8676002)(6506007)(41300700001)(26005)(5660300002)(186003)(31686004)(31696002)(86362001)(38100700002)(54906003)(83380400001)(6512007)(6486002)(478600001)(66556008)(66476007)(4326008)(66946007)(316002)(6916009)(2906002)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJ5THM1dmpHVHBUd2Mza1RRM213TTZoN0ZUZkJTdFpUV0dUNmVrWHJReFo3?=
 =?utf-8?B?YmVDOThZQk9KWXZvejJ1SFl0MzUvVWhYbUpRU0VNcHRkcVlVc0hLczJyVTRs?=
 =?utf-8?B?YVVROTBBOTVJbkcvMTUwRVZUanU5S1hpRlFJVFlibVpuK1d2bDM1ZDJxU0Fx?=
 =?utf-8?B?S3dBVmhIQm81YU1YNnFGMlFCTGZhVW5vT055UlkzQVBjeFFyOG5xbVRXVzVX?=
 =?utf-8?B?R0FIYzlVZ1RXbDRMcEdPNE1KTEhaZ05ZNVBKbjM4V25MYVZUMkRUZ2FGNFJD?=
 =?utf-8?B?V2t5VHZ4dlBGODBRQUFiaUpicGRqanBpRFBrbUhCZGIwbG9ZeGhhT0ZraERQ?=
 =?utf-8?B?Q1ZqcGxZMldhNkZkVjhLQUNQeHBuc0pXL3h4aERxTWNRcDVpbmpRaWNzOUFJ?=
 =?utf-8?B?Z1NCemhyaS91aGgwd3hRWUhoeGtycEF5TWk3VEJIY3FxYys4NW1jS3I2RlBV?=
 =?utf-8?B?cVhNWnlobDFTOUZEaVg0Tzg3Mk96U3FOK0JiZW5nSTRwNWhwSFV4TXozRlNN?=
 =?utf-8?B?ejBoN2JnU0hKTVE4ejVTdjVVMEJaQ09GT0NSN3ZrdGlHNm15djIrdThjM3Ax?=
 =?utf-8?B?WFhJS1FHY0s5UXB0eENJdTZhV2lJbUdwQmFZVkd5NWdHMXNTZVJEVjZodFpX?=
 =?utf-8?B?cEJEdnBYS1N5SE9hdHM1cHdzUXhUTHA0MUlmQnhab0FYNzdTVkMwTndQM2tR?=
 =?utf-8?B?c2NZRjFJZlducDNhWWVKYmV5ekFoMmhBMnQxZU8yME1CS1plMUZkZkFhSEJ1?=
 =?utf-8?B?NzY1Y240MkRFMG1HZ0QrcTk2VHh6bFoyNUllSFVHVTlzekxnZUY0ZkFoTU14?=
 =?utf-8?B?bDN6M3hEY3dRaUx6ZDVFbTRJTFJYaUg3b0l1Smt1dDRTekVvMlBsWGxmM0I2?=
 =?utf-8?B?WVppNEVLWDJ1SjQ3MGUrN0hLcko0RlZYWWRab3YxS2ZLUUI3ZGRtNkFnNC9o?=
 =?utf-8?B?S0E5eGJPVUk3Q1lSbHZiNzNmOUxYZE44S2ovZ3JIV2Z4TUtXMUJGNjd6MVBT?=
 =?utf-8?B?V0JKQ0x2RXg3QmFyMHoyOGFhUGVYcjFqYmZ1aFlHemhZV2VZK2l3M3p5aFZL?=
 =?utf-8?B?bFlrNktOUWV3TUhaTDlxN2h3MEZqTXFSSlkzSnExdHVHeUxyYXlOVkpNdVhh?=
 =?utf-8?B?MEw4NUFkUkxEemIyQ0dNTzlsckdCN2hDQmpLdDlZeWlIS3FlaW5BOWl1cm1h?=
 =?utf-8?B?bmg4RW9BUUQ1QzVYa1psYkJybkE4YUtJL0hURFNIeDhrZzl1TkxkMnNMNmxp?=
 =?utf-8?B?emxNc3FsYkw2cUR1YlE3bm1QOVF5anN3WnlaQkswT2hQMHpxZW50Z1hDWkhF?=
 =?utf-8?B?YWVGYnRyalNFNURBVFpCN0dua1p6RllmKy9UQURVRGhZK0Zwd2pndGs3OXFn?=
 =?utf-8?B?TFdhNHdYZlRHUmVEc2I5cFFQdEU5RVQyNjNxamUrQlphNStXUlFuSCt4c3Ir?=
 =?utf-8?B?NEtPbmZsVnR1YTMyZ201dFIyNzI0Y1JUQStrejdYeHMxaUhuLzZiOGt1eUpQ?=
 =?utf-8?B?dnZ5TW1JN3dvSjZ5S1lEU0laaW9ObUhzTWh6OTBDaFNnWnR3a1VrMXNxYXA3?=
 =?utf-8?B?R2hGTncwejk4UDhwaDcrb29KKzRldUhjejZjNnNkcHJteTA3RDljNXlVNm9Q?=
 =?utf-8?B?Zjhoc3BiVE02WDMzeGRFQU1JaEZ2dnBZQ1ZNazY2UFdPUlRIS25UWGNaeFlq?=
 =?utf-8?B?UlEydStoUkFoNFdSYURtMStwUHphRVZIRE1GTFRBVERXQXdGdnBTY244NCtF?=
 =?utf-8?B?U25IRmJQOWZjWHI5aEc4UHJ6VStIYkY3Ykl4YStpOFRYWnZua2NBZXQ5L3pk?=
 =?utf-8?B?dEhBQURGM09CWDF4TnlZTUIyM05tQ0QzektnVG1OclNoa2pBN2ZoZStGU0pt?=
 =?utf-8?B?a2tJVjYyeEtBL3Jybm5KY2hObUNpekV2cEpFSW9vaEQ0Q1JRcFNvTGwvY3Nl?=
 =?utf-8?B?QkJSMkpTaFkrM1ZjOXR2d21wR1lPUVd2N1ZNMUY2MnJVN3RwbkdBTHhDUWVH?=
 =?utf-8?B?Rm1Bck16K1hIcTdTKzBFOGt4cFJxdEZPTEppbkYzcXM4eXQ0VkFDZTA2MjQ4?=
 =?utf-8?B?TzJXdHN1NjJJaTczUk0xTFZCQ285cmV4cjhPcGRtYk0veGovODczNFhzOUo1?=
 =?utf-8?Q?FJn0fKBTphqvo9pvRfM/XlIa9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ed24d9-2cff-4d14-1db0-08db89c741a0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 08:48:29.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtGTZMnOyI1MJScJXMxrXbx/GMubRQROidCf6Ihsym0W6koggAAFKCCAzpE6iEFM9LHTL4QKTjTs4dt6/c/nWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7074

On 21.07.2023 09:43, Roger Pau Monné wrote:
> On Fri, Jul 21, 2023 at 08:02:33AM +0200, Jan Beulich wrote:
>> On 20.07.2023 18:14, Roger Pau Monné wrote:
>>>  Strictly speaking however the init
>>> handlers don't require the lock in write mode unless we use such
>>> locking to get exclusive access to all the devices assigned to the
>>> domain BARs array for modify_bars().
>>
>> Aiui in the present model modify_bars() has to use the vpci lock for
>> protection.
> 
> But the current protection is insufficient, as we only hold the vpci
> lock of the current device, but we don't hold the vpci lock of the
> other devices when we iterate over in order to find overlapping bars
> (or else it wold be an ABBA deadlock situation).
> 
> So my suggestion (which can be done later) is to take the newly
> introduced per-domain rwlock in exclusive mode for modify_bars() in
> order to assert there are no changes to the other devices vpci bar
> fields.

I think this makes sense, just that it doesn't belong in this patch.

Jan

>> Therefore imo in any of the init functions the assertions
>> should either express the real requirements of those functions, or be
>> omitted on the basis that they're all called out of add-handlers
>> anyway.
> 
> I'm happy to omit for the time being.  Iff we agree that modify_bars()
> requires the rwlock in exclusive mode then we could add the assertion
> there, but not in the init functions themselves.
> 
> Thanks, Roger.


