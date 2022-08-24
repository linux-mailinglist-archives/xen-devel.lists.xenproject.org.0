Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7259F476
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 09:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392252.630482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkxR-0002ms-IM; Wed, 24 Aug 2022 07:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392252.630482; Wed, 24 Aug 2022 07:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQkxR-0002jW-FV; Wed, 24 Aug 2022 07:37:49 +0000
Received: by outflank-mailman (input) for mailman id 392252;
 Wed, 24 Aug 2022 07:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQkxQ-0002fG-Ax
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 07:37:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10084.outbound.protection.outlook.com [40.107.1.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5692489-237f-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 09:37:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Wed, 24 Aug
 2022 07:37:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 07:37:45 +0000
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
X-Inumbo-ID: a5692489-237f-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQpczegMfgAd0pwY/xBGX+Mb/a7mQATVnPYbe3svtbBqTOnUM62VvPrvx6P7pFDFg+TrSRB+tLfB93RY0uuUO+WjJpIxrywqb1raOXeAhA7cus9yszgBB9OEenRwbIAL03VLDGTZCrj4VgVWC4u/pu0+CnkTGxkhEKQFw9KRWBPZ05nm2eCGewzlAe7mCbhZBCll3xQ+pgzs9NjGi9sAUKw2lxByciB6SNa6mgAe8t4QBe/QKt9KYc7rJUW/vpwN5g2cxpfjw65Rf4kwhFlb8kzYGYryNV1cYLByoR2nV2bvJU8vkeB20iUSMKbGrtKkBi/x+7gRr6/x5ejJIobiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU5+3H1iUxR1K9573tw0Lom9BwwPLdGPI/yST3cfnpY=;
 b=BRU6OM+IvgcYheHbI2c2yqph3e9QrRsOANP54lUZoUovBAW+PNk9PU7688tVvAdRegGTymxIdWy8Asm9TvJ5il1Px3LmJu5WD3fyQk2P1yoEUYPfTePRpv2+3UmO8rSrQBK739tUh4TIShL6zgrU8KbgGDIw8hdZ0NJxHylfdzQpMtg7HVj/z8slxPEbYvgZVY7r30kG0mQPEHZt0/B6apHX5Z+txh2xFk1LpjhzRmJSidES4rx+KJMC12PdJS916JyBi1D62xF2V/ylk/ouJFGcaigk1/gNaoHSnIXj8eu1RsDuKAOPW876VvrtzmFUCxGeBuKkc1c4zIOrwUstog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU5+3H1iUxR1K9573tw0Lom9BwwPLdGPI/yST3cfnpY=;
 b=1UKuB/HrIQtidLbUdDJHvfXlOZHCTuOfbk7bv/VgDcCbqfdfzOAX0cBK5e19NyXxJZ7YxvE/3wmgbAKO0eMQJTvLAMg+LczbdbNYEhpg/sZK9Bag3rBnDC4oxoLvsMFQYOLa+98twqa0oNMmt5am4vuRyBebCM/HzSHvC0vYJu3gz/et4god9f6LmSeExIpaoDdNnMzPpzcdkOlqqbwcZMVMO8SxwsaHFmBr9ZDUAdzpGXDz+CfaTsb6Ly3f6Iusg/zIsQUqja+8x8EnZ094RnFqUfv5eBuZBNpPedLssiEWlWx51uFFTQnMjgJMPEFZ5jUhpXmHSqkDWrl9+eimXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a4cbf36-ff90-bf7d-b7e6-5d8a49880f2d@suse.com>
Date: Wed, 24 Aug 2022 09:37:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] libacpi: Fix cross building x86 on arm
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c3d431217010f669de809a76c2f1c15a0313ae53.1661246753.git.bertrand.marquis@arm.com>
 <844e0164-96b1-8a56-a9c0-0f432b9e648a@suse.com>
 <B2DC2AC4-E59C-4C96-8993-D4812D73E799@arm.com>
 <74994bdd-8c70-7f5c-2146-157a36c843a0@suse.com>
 <87AD61AE-5C50-4F04-AF60-300C6A113A85@arm.com>
 <C7766EB8-B741-4443-99C3-EB14C1EA9804@arm.com>
 <348e6d5c-d846-3d8a-e26c-316ba6a98938@suse.com>
 <F1E1B306-5C4C-44C1-B4BE-E546B0B67C97@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F1E1B306-5C4C-44C1-B4BE-E546B0B67C97@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::41) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d742db1-3a68-4294-3e8b-08da85a388db
X-MS-TrafficTypeDiagnostic: AM0PR04MB6929:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yW6o1OePB9LMCWeNpwwNMx+vSvI8YqpsVCPpS0PiJYgcl8juBzxbTwhdguRjKMcN5d9vqiKZJt+EdN60mAwhhXudboXhKcWVZuFLRQ4YIpQ+2KtQuSA0Wi01LGgaBHuUcSWhthypnDBddPFD2b+C5eyz41PbBLtXre2kUV7NLodHpPKWhwhcWnpaItiZhvDUi5VE68MZ6BLc2vo+GLLzccDR3Dscp37+indRR6Dp9cxwr/hPU7LPyzKNEERUxgscyKMWDkO1HRi35Cx+BuGscd9a3YSH2eHdjqptbMk9BrcZ0PSEtiVzuXwPOnMuRf2CQzVdX9kOvdxWAfSI//CZgjF8EiT8aS9WvSCRnULgmqoUM2uwTrKW60cQN/R/Sa2CpnVcqlPueqXZrmSBBHakBf8AD+gVnUDH7fd6xrvIKbyi/ktN/1ddQPowOu31IuaSuUsHpksB8yTcjJsdAX38gZh/CcASDsCoRlQ2t580ZWhEQgkZBrAT+ko+GUFM1Mkig/1cQyEQfKHrE7HJGYcpKT15gotVL07y1fKwIRocvJwEiyZmNz8e62CkxGVZ+4vVQTsK7+z9zVzvezW9E72BhVcedrl3PcH/DgVp6Hn1mIGLxATqk1LlKp6MwKRWb4aNrOH8hvY4gaiO6EseATH9a4/HET2laDbwmN3Vuk6BCjf1lrPLUbZB7Vg+sXAlQIlwLfdIi+OzwKQ1YPpzMcAprZ/DS/glASQlBmvyefUKIwqeLH0lNttvOudpZnqvC3vNIkVWh4FhI5Sh4D9slunKrGnqlj2cY3CS9JTUu0S67rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(136003)(366004)(39860400002)(6506007)(66476007)(54906003)(6916009)(66946007)(31696002)(8676002)(4326008)(316002)(66556008)(26005)(86362001)(6666004)(53546011)(6512007)(2616005)(186003)(478600001)(6486002)(36756003)(8936002)(41300700001)(2906002)(5660300002)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2NOZjNlQjNFUUZ0UzYvZmdXa2UyWnp3YTc5eHdBbmxQc0tsTk9hTjIydXB2?=
 =?utf-8?B?djZGTzdrUDc1ZDFBMXRBa1BheEJpYytaek1QR0o5WGludkhkZldXSy9ZbWlS?=
 =?utf-8?B?WkROUFNiZjd3L3UySThGTlRhODdPdzlPQXFibmtoUnJVaFpzK0xKM2xUd1hi?=
 =?utf-8?B?Q1R4YXR2eFJ4SVlYNXNUUHlVdFl4TVNBVlBMU3BOWTFUa0Q4ZFhVUVpDbVlv?=
 =?utf-8?B?aW5SVkg2TEZlZ3VBMGlRNDlkUXpJYUlTRDhjeEFQdVJEU0JHNXphMUZpbWlw?=
 =?utf-8?B?ampIVVNubDhRSHdETEtrWjVJUXAwUC85UzB2c25QWlkzMTZ6cXNFNHhoYWJt?=
 =?utf-8?B?STE3ckRWYWNWMDVyUTgva3g5YmdtKzVhOHZNZi9sK3FTVkJIS2kxOUw5bDhM?=
 =?utf-8?B?eUMxeHpDUE1ITUZmN3pFSHo3b1JyaERBS3lwZDcvK0VjcTg3QWdPVXJKUmYy?=
 =?utf-8?B?Y0tNTDZxdTlPd0czakl0Q2wyUUJjZ1dTLyt1d2VOZ2ZEWjN2dXRPTHFNNXJC?=
 =?utf-8?B?UkxZc1NMcFcySkN2N05YWHVUK1hkMGw3UmxUU2tJTHBhaTBQcWIvb3BQK3Fl?=
 =?utf-8?B?SThTOUlZd1E4MGwrTW4wLzEwakV2SHEzOC9yc1NHQ3BBZ0tTamNoeDhGMXB2?=
 =?utf-8?B?MXpEQVFyaXNUamNiNDNUdi9SZ05yZzJ6YjhhaTc1YWVFaDNadEo1emJ1RWI2?=
 =?utf-8?B?WkJyMDgwQmFNT3dDRDA1VGR1b2d5L3ZlaFZ1T2tVTnJGU0hWRTVMUkMvc0lZ?=
 =?utf-8?B?V0JhVmRrZmFZYlQ4Y1l4aGZ5SGlqYWZFSVl1bjNib2VDUWtaNVozNDArdXJY?=
 =?utf-8?B?T1p6Rk5YcDJZTVg5ZkN0a0NqcC9WZUxsbnpFQlpTTkxQTEFMK09rMFFDbHlS?=
 =?utf-8?B?dkczMXpJRTgrOXVTNS9vMGdUSWZlZ0xEQmVTNDArVVFKTlE4QW1rZDRsUjJz?=
 =?utf-8?B?WDdCVTA5Y096QTJtOWo3QXc1NHhrM1NNQklteHdYYlRXMVh2Sy9RUXRPZWJY?=
 =?utf-8?B?S01ERFR5aW0wT0FMZjRwZklONVVtSjZKNTArUEZkUkpBejJXeGlTb0JIZ016?=
 =?utf-8?B?L0hML0M1OE5LZHBYNk4wN3hjYUdFd3pYWnJtb2QydlByRzlpVkdZTStuMmg5?=
 =?utf-8?B?TkxXUC9yNFd1KytabG9VMkxnOC9NeERTdFFnVlZzMGJRa3NCOXUveUt5dXJR?=
 =?utf-8?B?czNsYnZYMFpJc055MWRSbU0vcnFpUkpidjJIbTdWWVMrMXhWWTFoMlVta2Jk?=
 =?utf-8?B?cm5QMWFCdE9la0NsU2RmVWdQbFlTaGJ1UXZKcUFYWlBzbFZINUxEempac0FT?=
 =?utf-8?B?d0k3dUl0ZVdSQ1F0RDc4OFh6NHlTclBYUkJiMHFFUUxZd0Z6NHJQMlV5U3p6?=
 =?utf-8?B?UTBNUWFjS2lLTXRRNjBlMFlpNUxteTZNbnlSaDUwdVgzZmQ1Y0ZiZlNQNC9N?=
 =?utf-8?B?MERrUGZPRXc2TUxNUHpNcHZqcDY1Wi9hS0NrZW82MWt4U1BHcFRTSE1zdFNW?=
 =?utf-8?B?UUlSdHIxWWZhN25hdDd4WEl6dGExczROZnlSTDczdTE4MUJPRGxDYXVDaFFz?=
 =?utf-8?B?MTRzYm1qcHR3dmFIRm5nemg2N2NtdUQ0L2loNm1sUmR5dzZIcHQrYncxb3p2?=
 =?utf-8?B?b0hxREhGQk03bDd5SWJGYzc3bStJdXhtZitTNmlXQVZhbWJoaWdkQWpEUjJj?=
 =?utf-8?B?RlRuUWpIU2NTNVd3aFhRT1ZqTGZJZHRneC9qa2xldC9WT0NpZ3A2V1I4eDAz?=
 =?utf-8?B?aCszcGtLT3hsOVZIclUzR28rSXdYWjViK2RkMzJpaWZWSmlnUHphdjBrZzdj?=
 =?utf-8?B?MUEvTXBWRURSNXk1WnBaU3NpSHJoYVVPTUVIRnlOTk84bWUzTjBVSXZWN0FH?=
 =?utf-8?B?bTlSd0xKMkdTQUhLdWlCeFB4b05TVGVNdE5JRXpOYXdqaDZuVDlnZmxqU2ww?=
 =?utf-8?B?TEUweXM0K0ZTejEyTnVhWGpqYXJmMXpmU04zM2g0aE0wR1hpUWpMTURjc0dU?=
 =?utf-8?B?dUZ1Qm42cXN4Tm5BVXR6T3JGTEZCekovYTBlam5mQkxkVHA5MnhkcE9Ic3Q4?=
 =?utf-8?B?eEo4WTN2U3h1RFY2ais2eWJTS2pGcWJteXg1M2NwYzlGUjlXL09zSCtWekYy?=
 =?utf-8?Q?QubGHPR2aID2lYTsaAGDtKrDD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d742db1-3a68-4294-3e8b-08da85a388db
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 07:37:44.9517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzkIFomg0Q0DBVYHShbZm9sCQ09wqmG7j8Uq6w9QRGK5ScNaomt/jcaN2OCmhqagAYRNx+uVdQskScIqtO4XYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929

On 23.08.2022 17:56, Bertrand Marquis wrote:
>> On 23 Aug 2022, at 16:45, Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.08.2022 17:09, Bertrand Marquis wrote:
>>> How about moving those to a xen-acpi.h header and include that one in xen.h ?
>>
>> In principle okay, if there wasn't the need for HVM_MAX_VCPUS. With a
>> suitable comment it may be okay to live there. I'd be curious what
>> others think.
> 
> The problem with this already exists in the current status as this is defined in
> hvm_info_table.h which is never included from arch-x86/xen.h

You're referring to it being necessary to explicitly include both headers.
That's not what I'm referring to, though: The tool imo shouldn't include
hvm_info_table.h, and hence the HVM_MAX_VCPUS would need to move as well.

> Including hvm_info_table.h from xen-acpi.h could create include path issues.

Include path issues? Both are / would be public headers. But as said, I
don't think any new header introduced for the purpose at hand should
include _any_ other public header.

> But as those are used nowhere apart from mk_dsdt, I would probably skip the
> include of xen-acpi.h from xen.h.

Hmm, yes, that's reasonable I guess as far as XEN_ACPI_* go. Of course
HVM_MAX_VCPUS is a different matter.

> Any chance that those XEN_ACPI_ are needed by some external tools that
> could get broken by this modification ?

Requiring them to include another header is, I think, a tolerable form
of breakage, the more that such breakage isn't very likely anyway.

Jan

