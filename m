Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775372DEBE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547958.855639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90uj-0003GL-0C; Tue, 13 Jun 2023 10:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547958.855639; Tue, 13 Jun 2023 10:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90ui-0003DK-TR; Tue, 13 Jun 2023 10:06:12 +0000
Received: by outflank-mailman (input) for mailman id 547958;
 Tue, 13 Jun 2023 10:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q90uh-0003DE-35
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:06:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8d65192-09d1-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:06:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8532.eurprd04.prod.outlook.com (2603:10a6:20b:423::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 10:06:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 10:06:04 +0000
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
X-Inumbo-ID: e8d65192-09d1-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6HH0fW8VTCz5ifla/oSP12vjpSwzI8oTFjbn0QZGSBUvKHNrHV7CZQII0qIkcGoMtR8bMXVbqzKUgv/XGSR2qK4yWbhkxa+Zgq8g9xMSPGoFLcrVJ4SdoS+ugYOgzb2YZsAFptmpumfneqMNjt0DC60noLlU3YGUMmFc1IQzGmk2H/EThw+LzE71JXLjHtt1XcGgpGqvrsdU5h4nwnwNAuTMtpN0Jngps7oaY+LXJhFOAVD7q7V1/vXTTOqn1WtX6vZLl1qm+YeQopISoJkMwznaK8O5GSrM3gXnTDIx+0+xL1TGdecupze8zkxagk4leRwLY9qXGC3VFYOoKZ2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPq5WlDWZyQk+lL2kINaGD+5Uwn6jSJ76FkWd71Gt+k=;
 b=NED7cyJV/TpBXZb5WvckOmVet78Ilpu4sAVbNcRkaV8r4PEgqRSJ8J8SeeCOk1A1UPsll8Yup5EoFCCSrMM5OHjOjFH09LmDAdk8tWvzF31ho/OcGl9rp5rbc82tYGvcjRBQJQnWI11gOt7oeu4K509QYCu8nZeGzZcFFBy4F1fYZHvt8aGFqvKqEoKRwGn7nsL2RAleIbaqEfI0DDZDbb5wLzHnXOisZDQWfcm77vlCJUIzRcQd4lI2wvBJYfchFI5A7XZXJOKH/y878JNkc0RzGgTENGzEoq3h5HSOOFsCjEXu96erVYNOua0+LSPOpnCpRrTNaJiBqJDCHaKvnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPq5WlDWZyQk+lL2kINaGD+5Uwn6jSJ76FkWd71Gt+k=;
 b=p37gFADh9z+BYo12tmD8DDIJVyRFxtdHSeQo4cvsaEDubww/sEd4BluKDJqegBFvb13diLKeAP2G5EcWNjSXXFfvoxWf1rt5mDfezsslnKWe8C9rDtAV7oXFUSlOBDQ4GRyZ7Ltr4sIASi+NBDy7a72lei6WKq7oG1UB5ep47SfX6g8nSy7kye99rZo6FL+sYgO4ziunyfZA76z4D89Ehd4OBETkyyy92clsY3eNm306/ce/7mGXTUZMoG20/M6hc14e/nJUWAvdU4cKnjUJuayvH5S81sSlwUS3hVsx16Ev0qkp/9u34OWyKPIB+riR6r3fdyBAiAqNObNiaY1V0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcf5ccad-0da1-e102-7581-b4fc86ee6506@suse.com>
Date: Tue, 13 Jun 2023 12:06:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: nicola <nicola.vetrini@bugseng.com>
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
 <42cb13a7-3b62-8d48-a1a1-3094a7bd07fa@suse.com>
 <c1d32438-fdef-fdc6-d4e9-e09fd13db9a1@bugseng.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c1d32438-fdef-fdc6-d4e9-e09fd13db9a1@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c014f6b-f2f7-4de0-d098-08db6bf5cbfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mfKZu4GK4GHPUAoMc5jyM+SJWieuqukTf/s9LzadILqfE35ffTtjzVUMKw+8NA3Qo0U0nxqLc8i0vTmlkzqepTjVDzfOYofAXRW8whC7sN1Qq3oeWZ+akvx8AoK/Hzn11k/xZNV/YKvAh4mowLq5lwmFqCEPcGivjmg6vSzD/muWR6Jd4mEHseiqEx2xOlw8FBDkTbzpHtHOzltXRmp6kLRLALIqZ5Gt4fOZTD0nf0jkg/YF6YW912Uzo8fKR/1xLrMY79grbBnk+sERomF3r0P1p6XJcHTSvXOWbnrNb7OBphQT3nSUrELuL/1CphUBGo5HzHQp7bCUgIEVq7/cO4/g6/qTLDWD7rFPG9dWNDpPmv1nE//UtlavexusRQITyVT/GcvUqEXMRzA6H1aVy0Fljn/Tuyak44fQZeIOc98QPjcYlAAleZlD9hnM/eqJQjgGWtIIClLIfWgYc8I4uOFP1NjMkPMrFFGwztI2x1ZtATgKbRPWRm4GgM/pfGLnpTKg+b+OEp1RNS662ubZ7PiAIZRegAhw13TAky67sA+71qItC5j2Fel1bYb0Wa7vooJHXCPmToLTgnE+86wEN2akLGw3ZZQLxp46hTM3sQbzCUUpIL/Xjzb7cLX3iH2GEEVZY5bJIvA8MXKOLUkTkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(53546011)(6512007)(316002)(66946007)(6506007)(2616005)(26005)(186003)(83380400001)(4326008)(66556008)(31686004)(66476007)(6916009)(6666004)(6486002)(31696002)(478600001)(36756003)(2906002)(8936002)(8676002)(86362001)(5660300002)(38100700002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzFTbTNReTNrcWNHNHNaZW1idFNRZzVIMGJpTUtqMjZrKzM3QldnT2VoT3lW?=
 =?utf-8?B?QzNScWN4QnVjcFY2TlB5MlRJVStyR3NDdGxlUExaVVFMeDZVRmpWdjcxMmlE?=
 =?utf-8?B?bm1qT2NHKzZEeDE0YXNQMGFDWGxqU3ViQnZsZzN5SldqYnAwVmwyalV0Nzkv?=
 =?utf-8?B?SnF5K2U1aGNRaUxmUjdEeHc3eFNZRlhQOGpSYlJneThDRnlmaUd0RTFzV2V3?=
 =?utf-8?B?QnlvcytBRC9zYS93THhvQ3IwWm1FMG50TDlsUEhvaHNJZ3ZCZjFSV0xSbmo5?=
 =?utf-8?B?d0RUOVRha3h4eVhSa0l4a3UwWmRDdEVSNGFLbnBRTjVUZFZ0VXFucGJqU05h?=
 =?utf-8?B?WTFsb1k2SmdSSEQxRWpxb2F2Y1AyVzI1bGhxUkV1VlVOR3VDeGIrU213QXNk?=
 =?utf-8?B?N1NiQy9IRXlxVlJBeVBMUFE4anZaZ1BxYStUaEdJY2lQRXBKYXV2NmllUi9L?=
 =?utf-8?B?eDZtQm9NSURtZjBLRWRGek1DQWVPaEZUSlVoTkl6bnk0VTNBcFpiaEFWbVVh?=
 =?utf-8?B?Z0c2MjRLaWppcldhSlZpTUxjYkIyL1BxL0NabGdsZVU5Q1Z6dXZWOHFod1Nt?=
 =?utf-8?B?dVNlRUg2anpiWUlIWlVCR056cm1jWnVSYnUzakt1enlpdXFhQkd3UGlMU2gy?=
 =?utf-8?B?VDhUSG5lb2MzaVpRUXBqeW9vWkZYVzhGWEIxRnhtV282aFhtU0g0Z294VG0y?=
 =?utf-8?B?UlJicEp1WktEbHR3K3p3dnU5ME1LREJPa0lZRFJhSExFT2QvZm5xbFd6SkNI?=
 =?utf-8?B?bzRxN1VJMTJ3WUUzcWNmcHM1dUlNSitTYTl3ckRsRVVieVJJRGRrTFljQlFt?=
 =?utf-8?B?eE5QWTNZa21hYjNxTzFGRVVma1JpRjF6NmlGLzdOZlhvNHp6aWJKdXR0L1RW?=
 =?utf-8?B?bGVPYXYxWjdabDRxOGF4aDUyNmVQbEkrd3N4SjJQVFJYQStPOEtiY0x3NVdZ?=
 =?utf-8?B?SC9hVEVRb2J6di9vREcwQy9hcXZIdHJlU3hnb3NSM3hiRTh4MEFqWVlsd1FC?=
 =?utf-8?B?NmpheFVINTlsYkRNQm42Z3R3S1FHV1g1dDh3QWlvMVNEZHV2TlFxUFJtc1No?=
 =?utf-8?B?VUdlV3I2dzBpMUh5NFc1U3BzYnBNcGVVZjVKcjV4TjBMMTcvbnB5amhFTGl1?=
 =?utf-8?B?UU50cUVaUU56UndnbEdpbXViT2FQMktkdHpPUnY1WXdocFlTbXcwRURqQkJ2?=
 =?utf-8?B?L1ZMRkRRUjNwWmpGMXdzN3N5KzBsVVpzbVhZKzd6b1RlaUFSRzl0Q1M0NnVi?=
 =?utf-8?B?YTNVSXRWK21uMFpSRjA4K011TlluZE5GeGtyUVprOXV2VEROZjVVUTg1ZFlO?=
 =?utf-8?B?K0ZYSFpVNmVkcXBVK1hVZ28zOVI2NVp1a3JoM1B4RGY0SlN1dWYramhuNWlv?=
 =?utf-8?B?aHlaVWc0S0FhRnFoNExwb1I2eVd3Z3JzeXQyWXJ6TUttajZ5MFpqMVpCeGtR?=
 =?utf-8?B?aVlGK3UrY3hTM2dFTTdhRzNudURxZGlZbzFyWFRocTlNWU9JaU5NK2dqcjFL?=
 =?utf-8?B?aDBOWjJDNHVJaE4wcUt0eVp2VGhKQXFabURKdjZmUXFQemV2ME5idWpGbjNC?=
 =?utf-8?B?YVYxWGhzbjVTNUMxZHF3KzB4bHVEZjhveVlJZXp4VU1iSjRvNUUrLzVsSk1R?=
 =?utf-8?B?L3hLWGZSQWIxQlk5U3k4clJ3YmxrK3hKZzhKQkYyUXFtOC9kRHBtQm82bmY5?=
 =?utf-8?B?M2NWWkR4TnhiMC84TGlRTythaU5jSUtKMi9aS1hUR3BTU3JCR2NvakZITFRI?=
 =?utf-8?B?bUp4RlhjNW83Q3dITm1NZlRmdTYzc2hXaEc0WkxkeXpMVGhyTDVlbUxUVEZn?=
 =?utf-8?B?TlI1dCtCQXo5d3h2KzJpVUZnVlFCQllHQ2lLOE12RFZ2dG1DVHFGWlQ1Qkhm?=
 =?utf-8?B?THNYVnBTVHVFTWVxWW44VGVvd0tYVlNZa29uUlZNOGZRRjM1bVFFYksrMTZr?=
 =?utf-8?B?OUtNUmZBZmFwN3dsVEpsTUVSMTg0ZnovcXVtemN6a1lBT0lIUGxBbDlOMjlT?=
 =?utf-8?B?YS8ySXRnQTJNN2xaWmh1VVpsNytkR29PbnNOOU1KUmpHUytLV2krcUxSYXhz?=
 =?utf-8?B?eHJLbytETER4N3ZaNTNFZ3c4dGYzUitFYlhZaEdXRGhUdjZWS2NTSXovbXBa?=
 =?utf-8?Q?x2y2qFtlJuppVw0j/zczUWPzV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c014f6b-f2f7-4de0-d098-08db6bf5cbfd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:06:03.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifctsrV935xUTUkIVSh09hKW2QKT1DVBnfRgC6Hd5urhvkrfY9k1nqt9+5t9z/BzB2lCzxY7m6awMH9sbh5DlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8532

First of all - please don't drop Cc-s when replying, unless you have a
specific reason to.

On 13.06.2023 11:56, nicola wrote:
> On 13/06/23 10:27, Jan Beulich wrote:
>> If you split this to 4 patches, leaving the URL proposal in just
>> the cover letter, then I think this one change (with the adjustments)
>> could go in right away. Similarly I expect the arm64/flushtlb.h
>> change could be ack-ed right away by an Arm maintainer.
> Ok. I do not understand what you mean by "leaving the URL proposal in 
> just the cover letter". Which URL?

In your description you had a proposal to deviate the // occurring
in URLs. The latest when splitting the patch, this doesn't belong
into any of the patches anymore, but just in the cover letter.

>> Here "propose" is appropriate in the description, as this is something 
>> the patch does not do. Further down, however, you mean to describe 
>> what the patch does, not what an eventual patch might do.
>>
> To my knowledge, there is not a standard format to define a project 
> deviation for a certain MISRA rule in Xen right now (this can also be 
> discussed in a separate thread). To clarify, I meant to describe why I 
> wasn't addressing these violations in the patch (they are the vast 
> majority, but they do not have any implication w.r.t. functional safety 
> and can therefore be safely deviated with an appropriate written 
> justification).

And as said, for what you're not doing in the patch, using "propose"
is quite fine (as per above, whether that actually belongs in the
description is another question). I view the word as inapplicable
though when you describe what you're actually doing in a patch. But
I'm not a native speaker, so I may be wrong here.

Jan

