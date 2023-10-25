Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE9B7D6E7A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 16:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622944.970247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvebR-0006bQ-Q3; Wed, 25 Oct 2023 14:11:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622944.970247; Wed, 25 Oct 2023 14:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvebR-0006Z7-MM; Wed, 25 Oct 2023 14:11:21 +0000
Received: by outflank-mailman (input) for mailman id 622944;
 Wed, 25 Oct 2023 14:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvebQ-0006Z1-Eb
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 14:11:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe02::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dff57c6-7340-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 16:11:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9204.eurprd04.prod.outlook.com (2603:10a6:102:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 25 Oct
 2023 14:11:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 14:11:16 +0000
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
X-Inumbo-ID: 5dff57c6-7340-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZidpGwcZjfANEUbQzp1065BsEvsbdJ3bJqRANlpyRYSR8iXQzBEyU8Pyl5UU0w74xAYuQHxgGCqBMA+996gYgGaRgYHO/URZzVtE7kChTbna+bCQs17HCHnTCWsoe65NYq+AeoYX5cSKcpq/p5tRtfCM/j+/hJevXWPZPo81BwAYI3aGczpvw96vq21ptxiVRQdGwRDnUrzCgoYixMXKAYyrqYvFydTShIflwpZ7aJsY9Lmd3kKxowuOT+nAxLpB5CBQx14XR68C+F22/9axSINauFI7rI//gs/S5HJZkZfrzNyF+lBbEG3RU1VR45WyQwxSwKK/EK34cqC+KbU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Exbs2aNCUu1BzER//EojuRQlRMk2l9zw+4JRzgvNapg=;
 b=OO4B1QgwsnboYyRxxOhDP88I0o2hP++Bt7NQRImDRkKdKGlIihID10WtRO5w4ckVN/4oWLzPyQ52dHbpcq4vIKhy6mwfcIaZrf+wtOKHkNlOGqmak4BuwftYu0YPy9cRniDlucNGZQo9JJXtjpXMhh5Gz51KdgzaTUrL71dUJm0Cpih5FC+coyaDmfnFo1eA8kkX50zlvFL3IajZMFfCWvPAEVbK6rShN0yUF549E9QtgfdC86zWxYeQqygz71e5jbH7eMZVWyx3mRAn6n1OyaOOU3mVPVdzmAuy7/NtUBLPLtABasWn1gNmfzKRaE+0yef1fXjesgnXUj0QQ7/RZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Exbs2aNCUu1BzER//EojuRQlRMk2l9zw+4JRzgvNapg=;
 b=Wd96AJFyhv24XCM8m7wSs14jxoMJqEAVVOWInlvexqSVp7BuXV37nKIVzkTZ6/3chGIiHGL44jh/L1gEtsFwiQSiYmAwjsDO9145xBEn36JYbq3zdClNCkjH+QTMebgK1h2mmBNdOR6fkcB2FJiqNvWYO53Ufo+fF1Vf4WtWS1vtrakOPnLuAxPtRii1VVYMN+1jC9hCm5KGMRJFlUVRvyWN0QVmt0jGDOzMXhUe3O6UKwBApPpYrROj1t6YueweoBuM0/tsZ+/nTtJ/04skl+1TMu7cq/wzjMu2FYmVSOcs97SAJrbH//wbzB+1nE+jDBd9wUgDBVBzYMrM7LdZxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3787a618-e0db-b87e-384a-a3956f7a2fb6@suse.com>
Date: Wed, 25 Oct 2023 16:11:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/7] x86: don't allow Dom0 access to port 92
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <ba1de950-185e-8d8e-e313-aef54b18a097@suse.com> <ZTkO6FZBlUDDKJKU@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTkO6FZBlUDDKJKU@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d581cbb-55e5-4b68-6687-08dbd564407c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	svy9Q4RwDsz8YGTEO0EDIB6Ob+VcjamzAtFY2bKYhJJb/QJaYnsPbXXxnDcec6WMIKAJaPF9Abv+YxSOzeM4AYUnmGUzveJ9Fc2sbRFcaKlXMgE/6GwJjGaDwVbp30YtcY3WGUCQN4zHB/SG+q0RBb+fI1afTTkfSlOyqzuK+oYb4oDj2zFbm2bPwetfu594I+VbRM/s1aiNLmRMtUPjgt3do3q3xaA8XE1DSpiJzZiHt9wGgOCqafgob0krPf5pCtJg7PSU5WYGGyKWNCNM0DO/21tq2VX98lBDX8zT7ssdJVCqpGM1U3lFGciIZ6X4Bu0Xxe0GHnkcbmwrYxWCbz3k179EGz2eXShMLwV+vfJPnfC9WouI6i8dlqPFvboZHhSDcBTa5HVGE1WNj91r7a0qKbkpGCszxtTlsEBrHoISIea0VVw6MPhHJLCh722ZvXf3BITE3ki+uLDJXsk38HISZCBbcUb6BYdI7ts+JUuNv38TJvPDcqnN+Ic63fD9+PYpoceg4RDfYpCuuT+E4s84ToQnXaQtdAhqilUW0Y2P1SLXDsUUTcMlkxCOrgm2kZdRqZ9TEtPUkH+TS0DbD9OT7r5++se5T6U7i8V/TdGIEu002+cGKjPQ5mEijSULI3IM3S1vlfWSeK8u2asPhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(8936002)(316002)(8676002)(4326008)(6916009)(2616005)(2906002)(83380400001)(6486002)(41300700001)(5660300002)(478600001)(86362001)(54906003)(26005)(6506007)(66556008)(53546011)(38100700002)(31696002)(66476007)(6666004)(66946007)(31686004)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHlHays4NVJWdk1KU0I4dnR5dWxad0ppNmx1ZnUyakpjbzVidzkyRHc4ZlpQ?=
 =?utf-8?B?UHdrZTlVNmFwd1VVc2k1QjNjZlhZNFBYamp4TitPK1IxcmdZZkNkQmpuSkZH?=
 =?utf-8?B?NG5ndzFsUFRPcEFvcnFiVjNwWmc1MHZFM0hBL0hpdmpaamowdnVaT0xTTmp0?=
 =?utf-8?B?REJCdUpXbCtQSEl6b2t5MlJMZ00rYjgwQTUyUmFtazVpOVlKcEhhU3ZoNjY5?=
 =?utf-8?B?eE91dEhDOFJzT01EQkUzZGFiNUNneWl3VnpSenlxamtUUjRYMytkSWZjeFFG?=
 =?utf-8?B?ei9FZG8rZVVQK3p5d0UxdE93NFc4L0hkR0pNOVN1UDZuSUZRekdEZUx6V00r?=
 =?utf-8?B?U0dyaEd3dkpqTmRmdFR5V3RSeCt4Nnh1c2hOVW9wL3ViM3RNWnErTkpQRWlP?=
 =?utf-8?B?RDJmZXRhdUV4T2Q3NDRjMFhsMnBvelZvRjB6VmwwMGlvR1JjRXJXWXFCYkpK?=
 =?utf-8?B?UVN3cjZwcHZZSVhXWUlTQjdaM2pOWWRVOWgxeFFrbmgrSHd5M2prRm1PNHNW?=
 =?utf-8?B?cG1OczdTcW82dE5RT21zdHl0eGZPOG94UGFLNUhlMFV5Y1JYSzNjVWNyamNI?=
 =?utf-8?B?ZlloSTlPMnBTOGNTQlZrUk5RZUxPZXZxRGpvazZJQnZxWWRtRTdmUnY2Rnpn?=
 =?utf-8?B?R1lNTHRtekIxeXB5V1VsdjRIbi9DcStmUFlqK2FiU0RpN3FEVlFMVkNUWnVu?=
 =?utf-8?B?TjR1Y2NpZEU5S1ZmNlZnNzBpSHFVc2FsbnlWZEN1eUFlTUZiSUw0TWllekRr?=
 =?utf-8?B?NmpsaVoreC9mZXlVTTY0Vndra0d5a1MxL2ZzZUNaNis1aXlxL2s5RG9ra1ZG?=
 =?utf-8?B?eCs4ajE4cS9qaUovczFMOW5idUJBN0lNNzRSNzVOQ1MzNVg1TGorR0pTZTlM?=
 =?utf-8?B?MC8ycnBSQjJZUERtSVhHa25IZXJDWXpkSUxkT0x5cmxiSjRMUzRHUmdFUWNZ?=
 =?utf-8?B?Zk1ZSmFOVmZoMzd5eStJNzFIOCtTTTNjZFVJSkhQYkF2dnhRUXdIWHBCdE5L?=
 =?utf-8?B?MHZGWGxDRGl6NVNVQUxyc1NZV0VjYjVPb2l1WkFkUVJZbVNURXMzWTA1Tjht?=
 =?utf-8?B?ZTdRRElpS0cxZjVKTkJReEpteUQvblA3ZzlWNXlHdUFKWFVHaWpDdmlOdmN3?=
 =?utf-8?B?UVpOY2lmWHhsSEhFSFo5L1o3KzhBOVdFaDJKWERsbTdIRGFveWpsNW5TMWVs?=
 =?utf-8?B?cm5pYjZWOG1McStBN21BNVB0M0t6RnovNllJSDZjTFRkVGVoNzZyVzBkbHhC?=
 =?utf-8?B?cWVwNys2NDBscC9ZU0c0MEpXc1NkdTFkWktOZGltYUFVQWNkVDVIRDFhaEo2?=
 =?utf-8?B?UUY3TzhvbmZRbmZ5QkhLdVdSU0VDZ0s3UjQxaEgxQ1E0Ujc2bVU1MTd5UjZq?=
 =?utf-8?B?M0JWQnA1dkg1QitiUUlWYnVUc2U3cGIwK0xlbmhvQkpiQjEzL3dtcXdON01z?=
 =?utf-8?B?QndBd3NTeXZadFhYREltMkN2UERoVkVJd1VPcXJhU3dRaFFtZklQZFp4alRO?=
 =?utf-8?B?WlR0VElNRUtHQ3VBMC9JVlRCVWhWeDRMSkp5TjhMTDVQOHRhWVhjVlBPcmd2?=
 =?utf-8?B?b0FJbU5scFdGV3RjbFcrTVdqdFBvYWU5L01Va1N3TExqU1AyQ2M1KzRTWDBY?=
 =?utf-8?B?WE1MOGVoODkxanlYeXZsY1EyVEN1SFlUYXd0SEFTTkxKbnhQOE1ZU2NBSUVw?=
 =?utf-8?B?ZGF0Z0NPZVpiNVp1Zlo0Q2ZueUFDbEtreHJVeTJyL1A4UTRxNFowdzdzUWF6?=
 =?utf-8?B?eE9qcmptRUxPNjZzOTc0bk1EZzN0TVdVVG9oY0Z0Z1I0S0h1Z3JCZWZIVkxG?=
 =?utf-8?B?MDhwS2EwdHhjcnZlWmJJbCt0VG50M2ZUbmsxeHdOYXhPN0VQOGd3bm9INzE0?=
 =?utf-8?B?Vjc5VTkyb1pTbGV1a0orU2tjbC9jMGhsODNuQVJlN2hqQU1zMTFFTnJaMksw?=
 =?utf-8?B?R3NXdHhkTmtObm5YOVRwUEthbW5iUENhNThvaW1sYzZjb0VXVzZySm1lMmJn?=
 =?utf-8?B?dTc3SVNuU3YrMnRJaG5BQXFkTnBjUnlMeSt2bXF0ZHdzcGRjcnZqcmNyT3U3?=
 =?utf-8?B?Mk5RbUZJNi9Ec2ttdVRKc24zZ3hOYTIyOUpPMDhFaWhPR2lacWZiamZxUDky?=
 =?utf-8?Q?wnVW0J7+WGXb1R1wM4q/W4nYs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d581cbb-55e5-4b68-6687-08dbd564407c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 14:11:15.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXQCrX0yk+1oDUQn8/1m4kX4aZcEftxgN6jHmklWziM8WFKQULpXq2ARAiP90cNSLopjQvPW2R7uzidg7JzNnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9204

On 25.10.2023 14:49, Roger Pau Monné wrote:
> On Thu, May 11, 2023 at 02:05:45PM +0200, Jan Beulich wrote:
>> Somewhat like port CF9 this may have a bit controlling the CPU's INIT#
>> signal, and it also may have a bit involved in the driving of A20M#.
>> Neither of these - just like CF9 - we want to allow Dom0 to drive.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I'm kind of concerned that such ports might be used for other stuff
> not described in the specifications I'm looking at, I guess we will
> find out.

There's a small risk, but there's also a certain risk from not making
the port inaccessible.

>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -500,6 +500,10 @@ int __init dom0_setup_permissions(struct
>>      rc |= ioports_deny_access(d, 0x40, 0x43);
>>      /* PIT Channel 2 / PC Speaker Control. */
>>      rc |= ioports_deny_access(d, 0x61, 0x61);
>> +
>> +    /* INIT# and alternative A20M# control. */
>> +    rc |= ioports_deny_access(d, 0x92, 0x92);
> 
> I do wonder whether it would make sense to create an array of [start,
> end] IO ports to deny access to, so that we could loop over them and
> code a single call to ioports_deny_access().  Maybe that's over
> engineering it.

It would compact part of the invocations, but some aren't using build-
time constants, so wouldn't fit well with such a table approach. (I
would probably ack a patch doing such a partial consolidation, but
at least right now I don't think I would put time in making such a
patch.)

Jan

