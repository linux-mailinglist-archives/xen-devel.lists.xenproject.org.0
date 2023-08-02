Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201976CB7D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 13:08:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574884.900517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR9i2-0005VP-Oj; Wed, 02 Aug 2023 11:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574884.900517; Wed, 02 Aug 2023 11:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR9i2-0005Th-M5; Wed, 02 Aug 2023 11:08:06 +0000
Received: by outflank-mailman (input) for mailman id 574884;
 Wed, 02 Aug 2023 11:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR9i1-0005Tb-J8
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 11:08:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9de9540-3124-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 13:08:04 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6873.eurprd04.prod.outlook.com (2603:10a6:10:115::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 11:08:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 11:08:00 +0000
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
X-Inumbo-ID: d9de9540-3124-11ee-b25f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+wGWGAb0xlQYkuiDYSH34mxH55RlX5OftpDlPqeSjorco/9PSgz23GbqJqbQr5G8kog9MVCMhb4G93MfOuPmLTYSIvvfILyWJr3oPEXacc1XuVSt5wh0GnsvvXwr+deb09p2gRhIhGRGu2IcE8QVDOMrnR4d2FOW/bwqBw9y3330hk8CXLhUm907ZP9NzbedZRkHZ52Z0zX9vTBSZltYqNQbonAAMC/2dot0kcjERkFyOU6tfLzB6tzekbLsvuxlUo14Vueus8VAxhEQYZwd0RyUjA/PeziEcYP5NO6xoKj7LSAzBvBx9XqYwS1ru0EV/VxCiJuK3LG3bskYlcBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PplYT8/GebARzSPmiPx58erRYbxhvjke7VWAyczDLiU=;
 b=XH5408gCISSp20mwTlzSeFDQPQHOwKcA3JUXhoGqCH18V3OTSPSAe5jhVhHKGrC7smZKw+c5Esqj0tbamkZdMDy8cOWkB8K3umS3IgkcBSKDo6vSuyQeOLdsVP/QkEg4+2p/M/UVqo7yhQEqHeJpkCkVbPc7BpYNGnS0eKLe8sUx76zZtMov0QFsJ3ydMjxKW/di0wsA0upwBw2ua0LFgCmTLQTYYdOKeZfA6CZvj4ExKnDnCObFVW4cHrtVE+emAPExsxXIBHGXBXmNSIkt9fBm1OaatgCmIL43lczDdGL0A6GI12SG7TJhDLBUTVJB1l4AMILcfWcE51fD2nwwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PplYT8/GebARzSPmiPx58erRYbxhvjke7VWAyczDLiU=;
 b=SOFk/I/H1iA2ErNnnzH/QjS4zjaEtw9ATokiW904427mHgOGQlwq/HPMObQEPtAS+z/ztMVHER8R9+0iYNOG2rvN2ikrjrutps7Mq1yLv+fOavqbHlKm5VbVkZR2kF7IoT3RwA4hfc050tainhUnxSXQ7w2SU381nNk/yyP3mPBaRfdGFetV9CGxRE9WqUuW6q8/Cnqg8DRwAzVByKI8cwzB0R4gaTxonXqdnJdNOS/Jb1nnRN5rMxIR4QF1OEWwzP2WJlSWm9Clsw/8zst/3u0b6UD+3xLmvFtlz+pOMo7mOrdKT8Fh7AW6qVbZSPsYAdpIngdNlkBlLINOgh/xFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <20b1d680-d69c-264d-7764-ff2143ded9da@suse.com>
Date: Wed, 2 Aug 2023 13:07:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2] x86/cpu-policy: justify a violation of MISRA
 C:2012 Rule 1.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <30fdada8b08b2060c6f1ccc2ecb06d418efd97b0.1690966632.git.nicola.vetrini@bugseng.com>
 <5ff38731-fed7-91eb-c933-28d191fb429b@suse.com>
 <796058860d0536799e40fc14f169efd2@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <796058860d0536799e40fc14f169efd2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c44db7b-7d32-480a-ec45-08db9348bbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnFMXHLgM0MYJS5yrVKEPaHLa0sT423PNIEIhg2biWxQP4wVDvaEfBN3Wvkn2WpaURumRbBN5vlrA1Bigy0YmlLBhae5/YNZXJP1jChlxbxty8gb9BLw60zjWD8DUhy/eO4Y5jBWe1svwySCPVxp//uRr9fe+hC9Pqs1XOkeRxz5NreRe8l4nD7IsNH4QOwT6AttxAuCjekSQ4bNreiFVuJ/0R7wlCLUiAoTz3ngUPNdB+q87Q+giNjiqXA9PthOpfnw1+Xm7ggoTGoBgJgAa/61PTVlbdVL+61s/IEr0u3sVfawJ0CJ6yg5e48dJzFCg8XUyCBK92OUYmxwu6xQXXjyfeMb40WUd7B2/EdfAbCLiET4x935ZVEMc5ybAT8xCn8ucysQZyWRtwUwaMiXSLWtdexqiieSUkoBUBawrzT5mo3YjAMpSVYyuEw6yl7kMD3f1n+5qls2zhyuCGupZOZ/EE6FhOWp38UOKRxXDcgYK28WcanQ4fnkHTp9SUZndtFKvD3L9+2jumSmCteubRBHC4fC/Ccsb3p4M5qG49Go4KpOZAkvvHPEwdZwulgvkD9gCghRyGxy37jI6fkrmaXmBJI9uOhAyssfW29KYLJczTLw+l09Q1ws7LSwRqSR78ird+XfA4ckiNEsTJFSFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8936002)(8676002)(5660300002)(26005)(41300700001)(2906002)(31686004)(7416002)(36756003)(2616005)(478600001)(54906003)(38100700002)(316002)(86362001)(6506007)(53546011)(6486002)(66946007)(66556008)(66476007)(31696002)(4326008)(6916009)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzhBeFFzSkN3anNkL1R3eGMwMWJEM2c3SDZmQUF1elpIcTEzWk1GN3EyTXpr?=
 =?utf-8?B?S0hrWkxUUW1pc2ZJY3NWbjNVT0ExemkrRXR2Z21mbThnQjMxZVJhcXkxSFJq?=
 =?utf-8?B?K3Z3UDVwaXpwVG45TUFzY29CT0hJRXJicE93UFBHclpnWHowNVI3Y0xodGhM?=
 =?utf-8?B?bmMwMXVKUkxGc01xeHZsS1hVT0pGOENLT1U0Zkt0aFdRRXRZMmg0SElVazdM?=
 =?utf-8?B?QlgramIvOHlkMVhYQkJNZlRtaWNVS2Mxd3gxanBVdytncXkrNnRkdmtLYm5u?=
 =?utf-8?B?T1Vna21JN1BkbEJucFZSK0dIYkNuSWZYK3JNRGl1djZkYk9nVk1ieDZXRXlI?=
 =?utf-8?B?UEhZS1RkRXhHSitwUVpvUU11eWE0NGd5c2k3cFl5eTg2SjlQbk1kaVBWelFN?=
 =?utf-8?B?N1RLYjl1cGtPWmhCYkhaS1dYZnB3WE1hR21NYll1d1l1TSthUE1EZ3l0ZHlm?=
 =?utf-8?B?Y25paG9ieUUwa0V6N0xOTTVpN3lNc2d3UVNSTGkrTlhLalh6V0laRWR5dUVl?=
 =?utf-8?B?cjB6MHFmaERjbWZyRE1DZGROQi9ONHpLOEdSR2ZEcWdOUnJGS1ZTY0QxQ1Yx?=
 =?utf-8?B?SUhGUngxZlpnTVNua1RPaWwwQkhOejAzR0xGOUxBZDkvY2tXK0Z2VXNLT3Ux?=
 =?utf-8?B?dUxnbERJVG9OYzF6SFVrdHJpUnExWUxCR2Z3Z1RsWDZxNExpc3ViblpiQjUv?=
 =?utf-8?B?RzVRc3RZYmJZWFJwbHJ2eWNGb3dhV1FUNkVLUGk4K05HeXhaL0FXWU9PQ2Zr?=
 =?utf-8?B?L1ExS3NlZmxMLzgvcndtNHdFZXRsUTVnU1lVTWRUcFRPOWx4V0RxUlVXMkFq?=
 =?utf-8?B?Y0V6RThYMDZ0N3h6YU9BNzZ0Y0dDYzJJSmVqVEFEeDVPL05qZlA5MjVUdEZV?=
 =?utf-8?B?Vll6M3F1ZGNWK2VvZzZsUUZFUStFanV6eXJrWWNLTDRZU3prS3NCaFhQbGNS?=
 =?utf-8?B?UkpScSs2bVJZYlVwNnRiSGdHSm8xTnRNU0FEeDRodGFUT3FpZm1rY0tUKzZT?=
 =?utf-8?B?NWt5RW5wV0JMamo0VnJES1llSytyb1lybWpBYmI2bnAzK0MvdGZRdEhwZ2VC?=
 =?utf-8?B?bzAzNThMc3QyK1FYODRqQzFUeVBtNkZPVk9IbXE0UjVZTFdEMzUweGJGMlNv?=
 =?utf-8?B?L0Y2T0ZMS3dBNk9jUytlRE1ualBKcW52LzNSYjdHRWtYOVkwWS9NUDFhQ2xx?=
 =?utf-8?B?U3RhL3lhenNFUVd4cngyZzZEd1hyS3lIbWhNRURVWlZwNHZ1L3hHV0lCejdj?=
 =?utf-8?B?MlBzbW1qV24zRXBHMXFlSlhMOG9xdlk3NEYvRDR3dGlZY3FCWDlJSVVnTFBx?=
 =?utf-8?B?MnZ2N1JXd0ZpR1NsVjNpN1ZVZ25ZSHlyZ0dpTFJnMjlnUDZrbVhsdlh0dlc0?=
 =?utf-8?B?R0RaclVlY3dKaWU2TkJlNWxUbEt2N2lyWXhacFlvUENraVBybm5oZHYvdkFh?=
 =?utf-8?B?QXhCV0FPWVIvVDJQdEQyNEptNkVjVTVJaThjRGlXTlVxMzYyT1FDUXBhU3VP?=
 =?utf-8?B?cTB6ckgzdzM1cm5VVnlVMHlWZ1lGTVhhcU5iRU5oMVZ6VGY5Q0hDclZud1RB?=
 =?utf-8?B?R2hYNnY3WHI1WnNDOCs3cEFjSm9zc1dFUkxRRVMxTDloYnZLRm0wQ0NlZzRz?=
 =?utf-8?B?R2pGYWRqeTFHVzRKOXlUMnlqTTNZdGw5cEdiZjE1OUJwV1lobk9VYi9mVzkw?=
 =?utf-8?B?M09rb3pTTTkrWEJIdGlWSlR3aThvWXZVdkJNTTM0UWczWS8wdklhYjJ6RXlk?=
 =?utf-8?B?WmhkV1A0cXoyVVhsV0c5eDdWQnZGejZVRkpTTVJ2N0p6dC9KazJRVUZuc3BB?=
 =?utf-8?B?WDBQUUhhL0R5SGZuM0hSWXcrckxsSU1GL2VtbDQwb3ZnVGVPai9rWUFtOEJj?=
 =?utf-8?B?aXRPNWwvcVhvN0RmMU9BcVhGVTNoSjk5TWlhV21oeXJ2bm9oY2dnRXE5UjlH?=
 =?utf-8?B?VGNIQmtBTUl0eW9TYVN4cmhENHFjTGJYZHAyVVhEWXJFdU9SSzA1YTY0WnJa?=
 =?utf-8?B?S1k4U2tHVEo0QlRyN0ZrZjdDUlZqTktpWWN5YXUwQzF0MzlmT3JZR3o0UDF4?=
 =?utf-8?B?RkQ4YWp6YWh3RG9uc0RkV0dleDZkbkxtZzRoREd0b25ESG82ajFqcHRZK3pq?=
 =?utf-8?Q?KLe9p486lfQ6x+e9SCyo9uoZn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c44db7b-7d32-480a-ec45-08db9348bbe6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 11:08:00.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiHqRIKho245qKADx6ZYHh6FzbgrjOax9nkn/H7eZfHI5MWdmr/iADdSGgZ981DKr1KPQsbi9oHzu/xe1L7ayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6873

On 02.08.2023 12:01, Nicola Vetrini wrote:
> On 02/08/2023 11:47, Jan Beulich wrote:
>> On 02.08.2023 10:57, Nicola Vetrini wrote:
>>> The empty feature set 'str_7c1' in 'tools/misc/xen-cpuid.c' causes the
>>> struct declaration to have no named members, hence violating
>>> Rule 1.3:
>>> "There shall be no occurrence of undefined or critical unspecified 
>>> behaviour"
>>> because it is forbidden by ISO/IEC 9899:1999(E), Section 6.7.2.1.7:
>>> "If the struct-declaration-list contains no named
>>> members, the behavior is undefined."
>>>
>>> Given that Xen is using an undocumented GCC extension that specifies 
>>> the
>>> behaviour upon defining a struct with no named member, this construct 
>>> is
>>> well-defined and thus it is marked as safe.
>>
>> Especially after realizing that I was wrong here (I was under the wrong
>> impression that we'd generate a struct without members, when it's one
>> without named members, yet [to me at least] only the former is a known
>> gcc extension we use), I've sent an alternative proposal. Let's see
>> whether in particular Andrew considers this acceptable.
>>
> 
> Well, I don't know the exact discussion on this in that MISRA meeting 
> (25/07 iirc),
> but the outcome I'm aware of was to deviate that construct because there 
> are possibly
> others like that in other configurations/future patches.

Correct. The goal wants to be to allow for such future changes in as
seamless a manner as possible. By tweaking the script generating
these struct fields, we can eliminate the present instance and avoid
any future instances showing up, and we also won't need to remember
to add SAF-* comments at any point in time.

Jan

