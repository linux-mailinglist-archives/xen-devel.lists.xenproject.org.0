Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6C662B3F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473864.734693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEv2l-0000EE-9J; Mon, 09 Jan 2023 16:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473864.734693; Mon, 09 Jan 2023 16:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEv2l-0000AQ-6F; Mon, 09 Jan 2023 16:30:39 +0000
Received: by outflank-mailman (input) for mailman id 473864;
 Mon, 09 Jan 2023 16:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEv2j-0000AJ-8L
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:30:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1bc7c91-903a-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 17:30:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8882.eurprd04.prod.outlook.com (2603:10a6:20b:42d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 16:30:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 16:30:33 +0000
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
X-Inumbo-ID: f1bc7c91-903a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P08qqfpkV3nR2yLxeo2XiTX3EaTtPuUaTcZvOnfdakfF1TDN9MWn2flYaMXEQIMRVCK2GurN5tnFxcRJ3Is9lOqP9RwxL3ZjbfjfkDueRoo4nnFDPzwoKY/m84NNQRd45qvVL9q/uWNtk6sXw4q+JqLurJFUkbvoFW3yqznsCfXWMFr5OeXTKUqBhVudlNIXttNuxJASFoYriEaoYZwSbNRbvqm/uK6SB9DrKD6DzDxPEI662cSav/cCqZc0Z6wabJ3lZ4Q1g9CpJB1TjPl0N0F8oU43gLINPkCk2ks1ynXIS1F1EDKIK7kCTTtUjuQ+XgIUwZ9cneiyaJxk12Xytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgMU/SgV6KX0g0UGb94kr9WJ66aNKxszDwcL6jaddWQ=;
 b=FszD5OIaCx1xFPdMxglqcygRyVkvtpM0CzZzosp1ot8qsZhy9vTN2e+Ae+V7hyQDqSHafr3ntNXbhGUSFq0e6+v0J4NaDZKKQMwMciZuH+9s1y7LFpONvX8zKtmydwvJjdHXrQnBUzPnIN1NoLA8+oqas/N5akwoDngc44Fek+ItQ+trCY5e0gnq1/ZSeaaoA8XoiYatvMQ6PvK7O5ckcprrw388/8rI121gJEHSN5VB0180EXsdZ4agO7CVBfUGcpGwEqoVaRz/hHsr/WSGK/eNrWhEmUHSqxXDNFmPiGQGcKLMh3nlKMIqaQxXSvdFxQmc2I3emQm/FTXhOGIskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgMU/SgV6KX0g0UGb94kr9WJ66aNKxszDwcL6jaddWQ=;
 b=ENKrlq++bOWJaC/Wl58fYWYUu3Wu9R/XP/Q/aaFr5PDlFRBiM+vPkCbJ/HTI5rPhb5mkFgkyYSpbpI06Zr3byrjZe5MNC/JncpkSdD8pTDRgRG4bQjedHaAFHBTt2F+d9dY34YqBs1KPnX8w7FKp8EydwOax6oz0I0ShaTSKdK3nPW5eqYuab6Zl6zlxKkpareOa2VhYH4jcPIP0KTK4dd7qUw9OSv6ym2yBgTAgPB02wOm3c0EnLk+80TATSY1FMxrlilMO45VxoQ7frsrCyj0g4TkV/XhVgXOkIhqgKpq9pxu6knpNz7JPKWvfh5Zc6q5wRonsc4ccd6y715oESg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <caa35078-7b53-4936-a8d1-42bdf72df4d8@suse.com>
Date: Mon, 9 Jan 2023 17:30:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] x86/prot-key: Split PKRU infrastructure out of
 asm/processor.h
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-3-andrew.cooper3@citrix.com>
 <427dc257-b318-de55-7126-0446264401f8@suse.com>
 <b7c7d431-e7d5-9dd5-a33c-c61e53c42acc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b7c7d431-e7d5-9dd5-a33c-c61e53c42acc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 986730dc-34ef-4064-0ba9-08daf25ed4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t2xMNLbuWQAsK5GJPk9m3ApsT/QG3Xxs8AAdEzqigA3jQD6oLjVjGhAwNeJtdffzMrwzk7SF7sl3j2qhht+ax8TriouXhoBszY73QaRX4zQtTOXH+XDuYsEq/RWnLQgkQzjqIFNdCxbdiLaEURfsVmXI/bpF338sVOIUpkML9c1nyQfed7HfP38F+hO3MPQLIyVgK6TxmG6xgvmx3cMmhVVQd5jXFl44ZXb60AMhzZP83jUzbgzV5R3VdOSPvdcZX/c+ywktzPWEUKaRxj5w3tOFdnBhZvwjYQ3thZE4cQkP66MJ/PzOs6tefF3X+Rbx0tTZLuxbM9OMwsI21UhGtEQmMwjZo+o6in/6RD5FaWxM0w7P4OgdV6YN7vQzTKLwJu+dNtFWEsaC2USUhYL1Hw8ez8z1rtyOSClSElUH73etAiLa8VelnSCDHJLzIewlSw/Osy0xN70VE6pvv8JiprsTCwTM4gQWH0nEtHt9cB73/VkGd4ddYcoltvWEKC61LaZKIsdHayA+mczjAa2ukngHLeK7mgw4Mbtrwg5bpJtMfhfQD3NTvs7sZNGlDDNhd2jJP0yGEEsnY81m2SgVTND2VMbOXRcpTGzvLTZHJfz7gqC4U4tUakYGSVvf637EayuEABttL2DiG+rRpEFXud9tiVmtSVptB4mDlDpG9eQ4ydaVqoWU5Lv15Lh6zW8XsYXcnInp5MQSMmR+2vY5ms1K7JI1jd7M2QmMqewu1Suar5ufMFpwHcG2es4T4JrPx5A0xhND/F0j8Ftzkh1vO3YiUUFML4g2qcQPGqcePpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(66556008)(4326008)(6916009)(8676002)(66476007)(316002)(66946007)(54906003)(186003)(26005)(6512007)(2616005)(38100700002)(31686004)(86362001)(83380400001)(36756003)(31696002)(478600001)(6486002)(6506007)(53546011)(6666004)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFA0WGZlRDZmaE5sdFRPOUlpZmtoNlNSZ0lFQk5sL0lLWnFNakR1WEpFd2ky?=
 =?utf-8?B?TzB2Yk1rTEt6a2liRWVvTnpIL0k2STRjWmVDcGtzYnJ6dXRhaklFYmpMdE81?=
 =?utf-8?B?TTRyV1B2OWtaRVRPczdkc0pta3ZxaGtjMUZOSVYzY1hqY0QxaEZGNmI4YVVX?=
 =?utf-8?B?VlJaTmwrR1AwSVdlZExzTUN6bmhvSU5ub2RkU1dETUhiUVdYbVlyM3Nod1Mv?=
 =?utf-8?B?akpNUjRhZWpUbnViUlM4czB2Rk1oeDd6TzRteTQ1UEVqb0lDSFg4SGhXREsv?=
 =?utf-8?B?SytKTENlSHU4elI5YXYxSWl5R09FeG5QWGhlSTRUKzFZbkszZU4rcmE4M0FZ?=
 =?utf-8?B?dnNXTkgrcWxSZVhxczU3Tk1FKzlFYUVsK0lLb2ppU3ZMRExIQURlQ3BDSG00?=
 =?utf-8?B?RHFBNnBRTHlqaWJWMUtvN1JYSllTYzd4UTFNWFdORmpnN2FhSnNSblJTNmk1?=
 =?utf-8?B?NEJTbHNzYmswNFlHblFzVW1UUmdmYjZ4cTFvRVRhUktITU4vOHJzWWVlUzVM?=
 =?utf-8?B?TDh6dExabHhKSFlBc1grMXJCeHZVRmE2dVgrTzV0bUhqdG5iY2RmK1pTKzNp?=
 =?utf-8?B?YXc3dVpldjk4TlA1akhGbzRja0l4QXUvWVRBcUdHcjIxNTNsYjJwanl3RStw?=
 =?utf-8?B?YXQ2YVBKNjVpZmk4dzRmb0Rnb1dGYUtldGMzUUVBeElJTFJqQW16ekJFTlJy?=
 =?utf-8?B?SXIvZFlqWmNKWmd2bktPV1lEOUdYS3J2N1pqL3B0MUF2T3JUd2Y3aDZwbWxx?=
 =?utf-8?B?V3hldXo0WWs4NlprQ25URS9SMGdUTDVtcS9YaUw5VVBSVWJTZFFnZmljV1RZ?=
 =?utf-8?B?dzk4MU9vL0hiTk52ejlZZTM0YlVGRDJOMWJ6MW85eG8rcG8vcW9pT2hiQkNa?=
 =?utf-8?B?YWxDandnV0h6Z2RtTjM0Snp3QmpkOEQwQTUxK05tWjhnM0x4b21HTHY1SUlr?=
 =?utf-8?B?c3BjZCtqQ0NwQnhONFlDVWQ3SEJydTVrZVNZeDQ1Ynpoc1VLeTJiZVVyQlJl?=
 =?utf-8?B?UDgxeTF3cEVLRTZPUG9zK1NCczFnTHNlN3lTblFvUVNCY0pnVktuaXgyREpU?=
 =?utf-8?B?c2NodEJnemo4dWs3UG5BRWUzNytVcnZzR2tFakdSa3VzTFVNa2IybEtqNnBP?=
 =?utf-8?B?cEZNdHhwVlc2VlZvN0VjQWlqc0NlaVJTRWh5czhxM3pkV2E4Mm5iMHNmYi9K?=
 =?utf-8?B?dk43Yms3R0dyZEkrWUhEMXdDV0pveVlwcjVYMjdnQ3ozZHZCNEoxMStQbGNw?=
 =?utf-8?B?Mi96cHNka2hTSXcwc3dTMS9ValI1YmR0UElOTnBTTkN5YUxkRGhRaTZxdTVE?=
 =?utf-8?B?cHl6SW1McFVrMFE5MzM1Z3ZPTndZenJ0M3hKWGRUL3Y1Z3VqVFZ2cDNyenVI?=
 =?utf-8?B?WEdXYWdrcnltK3ZnNUh6aklDQW10Qzc1M21SQUZneWQ0NGZwbEVFRjJWT0l6?=
 =?utf-8?B?MzFCSll1TUhrc3JyR1l3Um5idXVMZ2pqbGF5WXBQM3lkUnpqU1dRRTA0TGxt?=
 =?utf-8?B?MGZvczdUb3Q3VkMyZjl2R044Z25wTXo0UzBaY2RCMFc2TktzQjE2VXZscS8w?=
 =?utf-8?B?VE1zc3J2a1RMTEEzMHZWNlZHL2srR0cwRHBrRmN5L2RrMEFNR0NxN1ZJUUdG?=
 =?utf-8?B?WVFEdlgvV1ozMEJEcXB1T1I5Yko2NGExSHRmc0trQzZuVFVvRnkydEQwL3FD?=
 =?utf-8?B?UlZsZVFNRFY0Q1Q1WDFKTUVIS1NCYXJ6c1pZQlpBVzJFcjczVWhFZ3lUa3pE?=
 =?utf-8?B?YUtDMWxacmk5S3lqZkFuTmVYdkJPdytqbGxBTmZtVGs4UU9TVitGREErbUpW?=
 =?utf-8?B?R2hjeWlKT0tWRm9FZUpsVytrNTlxTU1TU2U1RzJ2R2NtcU5wSFdCcE1RQTVo?=
 =?utf-8?B?cTZFdHdMNllHUmcxU2dOQ3l6UkFGaXEwK1ZMeG4wTHZ1azc0QVRkTGUwN3dN?=
 =?utf-8?B?QllSU3NNZmwya1hDbmdCRWU0L0N5ZVpvNUlrbDBtQlo3YXd2VXhRZ2Q4ckor?=
 =?utf-8?B?dDdYK1U4WHRqUVQrRDNLdnVHOEJiOEdhRVg5cEJ5enFCL3pRcWhKNmMyeUlQ?=
 =?utf-8?B?eHRRRFozekUzNkpwUHVITHdaWVlsd0RBdjFldXdKVGl2TnMvcmhab0czZWRl?=
 =?utf-8?Q?Eah3Gblf1m+M4KCovhHT73+TQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986730dc-34ef-4064-0ba9-08daf25ed4a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 16:30:33.7098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +L2lHc1DcyLzi6F0nb0S1soPtBkBkT1rFKLfWnRzpzLDo5QPqa5TdoBaKxUO1kK0RrvR0XQtDOeubbO02OEMrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882

On 09.01.2023 15:57, Andrew Cooper wrote:
> On 21/12/2021 11:28 am, Jan Beulich wrote:
>> On 16.12.2021 10:54, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/prot-key.h
>>> @@ -0,0 +1,45 @@
>>> +/******************************************************************************
>>> + * arch/x86/include/asm/spec_ctrl.h
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
>>> + *
>>> + * Copyright (c) 2021 Citrix Systems Ltd.
>>> + */
>>> +#ifndef ASM_PROT_KEY_H
>>> +#define ASM_PROT_KEY_H
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#define PKEY_AD 1 /* Access Disable */
>>> +#define PKEY_WD 2 /* Write Disable */
>>> +
>>> +#define PKEY_WIDTH 2 /* Two bits per protection key */
>>> +
>>> +static inline uint32_t rdpkru(void)
>>> +{
>>> +    uint32_t pkru;
>> I agree this wants to be uint32_t (i.e. unlike the original function),
>> but I don't see why the function's return type needs to be, the more
>> that the sole caller also uses unsigned int for the variable to store
>> the result in.
> 
> This is thinnest-possible wrapper around an instruction which
> architecturally returns exactly 32 bits of data.
> 
> It is literally the example that CODING_STYLE uses to demonstrate when
> fixed width types should be used.

I don't read it like that, but I guess we're simply drawing the line in
different places (and agreeing on one place would be nice). To me using
uint32_t for a variable accessed by an asm() is what is meant. But that
then (to me) doesn't extend to the function return type here.

But no, I don't mean to block this change just because of this aspect.
We've got many far worse uses of types, which bother me more. It merely
would be nice if new code (regardless of the contributor) ended up all
consistent in this regard.

Jan

