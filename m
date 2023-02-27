Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C96A417D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 13:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502474.774304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcMR-0005eG-OF; Mon, 27 Feb 2023 12:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502474.774304; Mon, 27 Feb 2023 12:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWcMR-0005bY-LQ; Mon, 27 Feb 2023 12:12:07 +0000
Received: by outflank-mailman (input) for mailman id 502474;
 Mon, 27 Feb 2023 12:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWcMQ-0005bM-8H
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 12:12:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0b274a6-b697-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 13:12:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7125.eurprd04.prod.outlook.com (2603:10a6:20b:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 12:11:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 12:11:59 +0000
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
X-Inumbo-ID: f0b274a6-b697-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pv3sgtoJf4z0ggwr6+S0Ih2LrjPrsFyr3KWqcqPg77PlnAnzeONCfArgYgAyywrjjvbsxwvbOqbKQD8lBwMli6zCR+Xl/6hde0wwP/r1J3NEflstEhYbTo98ntiIm9R6zvebqsj1H9uE5ZbZ1BpB1pOEZ8oIb7vRrqSaEg8SynCz7jQKSONSqcVGJFDMKsebcPc0KfKkpF35JvMfrUPwt4gt9py1CUVthLx2+PvqmuEJ69bCGpmxc7lTvXOqUIpGUVcZJkbzHq1ckcV+u1YR8ioaw09+alM0k6mJPfuxIHGNt5vUcr9+/4Ee+jpPtQGNIoOFDjvK6CP+1xMG0QpIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oH3J1hc6CerhB80sZEz7ZsZZe1n75oa2tpTtMP1qaA=;
 b=AXLobwo47ZNonZQf5KrstYOyUpc9dZ6DbdTZ0bhDsJWVp6nHDB/+0JfU4+fh1tfQnHdaYen7tTWsvRz3AU5s6W4M79m7jQOsbjuEzNlCuEr6mlLAnff1E+MAMIEXMSC6iobEGS5EcbC/QTasRQyBjjL5sjhoVuOXIl6yYEDoFE9SKowPL7njeiKjNrETHmQVQNp1Xz01GRxNYqHebLznkQ3Lj3Pu/x3kVBy2D2UECGUwPHUyiykR7FpK5IKJHHEouYRegN1zzFXG59ZTtiuN5S6iJ3oV8mVc5cAy5FOmFzpYyzUPLB+PItGEehXb7vHeKn1aXB8TXeNO7HPx35Osog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oH3J1hc6CerhB80sZEz7ZsZZe1n75oa2tpTtMP1qaA=;
 b=STsy973bI0dj8hJ2vxgks+Ea5f5QTOfqBNccQvmBPq1s3qujlFw+jrQGZlKeYtQqc/PGo5bXTuMO1SzIhcBUIABHV04GgVEFfxipcgIaWq52+CM7awuHFFXva7xjH7x11ZTioQYup9NXe6Cmrksn8kLYdcWIQ5swUZ8fo5sGJVahTP51iB/DuOgouYZiYDV+v+3wK0ohhI1FOq8Y3jLBlIglgmQKYdhUcq1Z8zfIMKA1imGhb0fVC/sEeg1q5iFBIsMv8SyAZ6L34w2PN/+rJEJ1IfRFi/vKPww6GcsiDtFqGcUcWH+2naYhj6NS/leVFqAFNlhwbN9H5FNiO7B53A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6c27788-bdd9-e5b1-a874-7f48a27c66a9@suse.com>
Date: Mon, 27 Feb 2023 13:11:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: S0ix support in Xen
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
References: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: 459f9d73-a703-46f0-a42b-08db18bbd398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpzS/HVsIRmzGXw4RcK87AHrN2HPaugw7P3EHpYvyHCFIk/2J50LDLQz7uQe5k45P543Y4I4vlTRYQJZWv54UGFxnkmNrzCpHhDikA3hndaEhuYdiXuq51C0HeA6Db55dxKtDGG+LewpJrnodZvBNgxD+aLa0898AyJU9W9hc1lNa/vbJtvbg8lTOloR+ad2tMtTgn+q62FzSsXrpeXI9WXv1gSB6BOrd9cmKKQ/S8AUJLfhm9EX92XD/MdZF7KWtGj0vevw354/TegooFzXG/ENrHdEOsyvLdur+ZSGO7d3/iQfSo0NGGroX3/zcZIYLRNyFQgsPm4u9Km4tfGJ6Lqw42IXHVTPa3s5MlH7GiXHwwobwjerDmFygE128OfiG2RyrMPtqt1nTyJszVDELEmJYjgGaBTXKI/KjlImZlboKcxk4cjHYBDcpq1tNvfp8eYq9ZgkLSSfnjsxuvMqO/vLnvNvGbkPnsaVq9hlHeMkI6SKQUEZ03ARqr6gcJ/7jxnQqDAPNaORXux3wkSYCDCcquf3Nl9oczZrNK83H2MY2UJ4m5AaQPphfK5lbGKs2HgK2AKqzOwfWI1Ytrd+wDGEwzq0QTNWUs8sb0k6sjGbeXiIYt6cC98yTxWAs9qe8f55nOKCFvbIsw1v7iFit5XjDJTPQXdvvEwBGuoUPcVKzAe7zWO7RnHGT4moyNIfrIlY8AOBDMJdWSKH8Z3UPl1B967LDGE54YapFIF9Zr6M5TWJGxbHrrbxiogyctyv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(376002)(396003)(136003)(451199018)(6916009)(41300700001)(4326008)(2906002)(8936002)(66556008)(31696002)(66946007)(66476007)(8676002)(38100700002)(86362001)(36756003)(316002)(478600001)(6506007)(53546011)(26005)(186003)(6512007)(5660300002)(31686004)(6486002)(2616005)(83380400001)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkQ3SnMrOXp3VmhZZHFTZHorN21BdUljSkNFZ1hPamFmTXF1RmJsQXlFYWYv?=
 =?utf-8?B?Y0pHVUZLMnk0eFhna0tBM2RRSzRYTVhvVTAzMDg0T25DdGhETnpTOWtuT2k3?=
 =?utf-8?B?U1c4VnUrMHJuVktHd2UyL2hWOXZtRWJXQmtkQkN0SFRkUFE2RFdlMmd3dzBv?=
 =?utf-8?B?TzlRaXlvd3h6eERCbWI5V1NXRS9hdnZEL1VxOVpZejVKbzJpQU15MVhlY1Fa?=
 =?utf-8?B?MzRHRllKbzdmdDkwa2VLeHYzM2Y4aTRlRktJNE51M3lVcUw3UmgwT1VycitG?=
 =?utf-8?B?R281cUlGRUsvQk1HVS9TaGxmemdvMDhWNDVSNy81Q3p6RjJIcTFDV2NxL2pr?=
 =?utf-8?B?WkVRTlU4d3VvK3RNMkhDWjY1MXlDc2dJK0o4U3BnRnNQNlplSEx6MGVYWTNP?=
 =?utf-8?B?M0x1djRmZzMycDdXQXJmTnQvN3BGdGl0RTFTSzhaTlV5OVYrd1NOaFNiM0JN?=
 =?utf-8?B?Skk5MktQeXFOMFd0WHpoQ2NwdVNwNWxLaXBJUXNTZXVMOFgwM0Q4L1ArNDEz?=
 =?utf-8?B?a0M1TGtQbXJpNlAzREcvdXpnTjMrVEJQeUlhckx2c2sxb2FZTFYrWXdQbEdt?=
 =?utf-8?B?aU5OTXIwTTh0M04zcWU3NDhDdXpKQ1c1WEdqTldSMmdXZXVpTHNndWo1anpH?=
 =?utf-8?B?SmpnZHV5YnJqVjlGd0ZTMTA4S09ZZlhldjBxVnB3MkVqM3JkcEpwOXczOUNu?=
 =?utf-8?B?NkpRZWI2aUt1RG5HbkZ0RVFORDZxejZjV3NOUnhyYkszL202YVdCSzhyNCth?=
 =?utf-8?B?NWVBVllNRFplVlZjWlZ2N0dXY1FZaGtpdW0xVFpOdHZBV0xPbnpUaXVBMjRS?=
 =?utf-8?B?RjRQcytTeFdkNjFtTmtYcEZsdFA1eWJVditkYXRyakdOTmVCN1JjWkFOU3VP?=
 =?utf-8?B?WndlejhMbG05VkZvMnVhczgzUVFpaFVwNWt3RFN0T21ualBVd1Z6NTNqWUpp?=
 =?utf-8?B?dlJCVU1ZRC9JZGtRT2QzNVlyT2tNV3FFcEJrSEpTVGNIcXd5Y01yOGROeVF1?=
 =?utf-8?B?a3Bjd2NCS2QwUEhEM2cvcVptKzZxYlo4dmlYcnpSa1Z3ajkvOU9jQnRFSWNt?=
 =?utf-8?B?Z3MwS1hrbGVCOXd4TlZxNGxkM1laaXlQdHNyZG85U3pGWlBvL3NHMkI2WktW?=
 =?utf-8?B?bzF1d054czZYZ0pMNHBBSUp4YythYTRuQkZhWDBOL09xbVlUcmhuM0dxR0M1?=
 =?utf-8?B?dUVLWDdRVkEzYjVXWnFOSGNlNXJIbDZWUUZsS1NXWmVDOUZYbU9HY051VmRr?=
 =?utf-8?B?emlGUCtsWUpMeVlOMlJCek5mWExOVS83V1Q5U2RqT2V3ZnhxTUlIWTVCOWpx?=
 =?utf-8?B?WkVjSVFzQXVnZVdBSGFPZS9uK1BWcnhTUVZMWWlNbnprNE9LTFVOQmhFV2I3?=
 =?utf-8?B?R200OE5TbzhuSlNqVE00R3A1NFVmYkx2NDhqTkdNelNoc3Focm0rRytJeTlh?=
 =?utf-8?B?cWR6LzRrdlhaeTkrSWY3a2drZy8yUG1PZ1hsZktWN2ZZM3FwLzR1VHZmTWxr?=
 =?utf-8?B?V1R3OWJFS3Y3a1h4TkFmNUFiVllJRGVGWExKVTRhRmRPa2hMcit4bWhDOEhV?=
 =?utf-8?B?L2tpOHllNXpwWDZaTlBtZ3VUM0QxUlE1N0NrZFVNR0REd3R2TnJYWm1wU1Bo?=
 =?utf-8?B?eHhIbUQ2TDcxVjdJTXJwYTRXbTdhanVmSG5FWjFIeklQd2tjaElDV1NHOWxQ?=
 =?utf-8?B?T2VGU0xOaGFsVkYrM2hBNnZVUzJoMHZpT3dIWk1xdUhEL2pmMzRkSXVRcnhj?=
 =?utf-8?B?UTZnRWNockxnb2xJUFJnYXdNYlN6TGxRQllSQTBWR3R1bUtwWDZ6WVRUM0Jv?=
 =?utf-8?B?Q294N01hNGhsaU13UDkxejVZbFNaaFkrYzFYMU5GbWs1L3BsdE9WUW5RNE1w?=
 =?utf-8?B?MjhXNmtOVmZscWk4ZXpEMUtCTzBHU0dGL0xRK2N4QUNubitPSnBOV1JRSDJo?=
 =?utf-8?B?RlFTeFBVQXJLKzdRaWlDSmoyaHVLRzM2WnEyUzJzMENZSXJjUk1uUXVadmR0?=
 =?utf-8?B?K01ldmdHU1hRL3FxWU5KYVc2VUpNcGh0VlN3V1JMMUYxQlZ1YXdqRXFBYU85?=
 =?utf-8?B?cU1JcDA0ZnREemY5bE15ZTYwSTl3ejYwekR0QmYrT0EvZWI0VGV6OGpiUFAr?=
 =?utf-8?Q?ZZDEXyNx1oiLA7NWBHsHuK8BR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459f9d73-a703-46f0-a42b-08db18bbd398
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 12:11:59.1941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRnq/gNaYPR8gaYNCwGu9LNhd6hxCMcHIPsbILUCI3OIwCVyJN6CrmnUOJvIbL/+5/bvaAnUxPPid1VFTxYVQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7125

On 27.02.2023 12:48, Simon Gaiser wrote:
> PIT timer: During some previous private discussion it was mentioned that
> the PIT timer that Xen initializes for IO-APIC testing prevents S0ix
> residency and therefore that part needs to be reworked. But if I'm
> reading the current code correctly Xen can already use the HPET timer
> instead, either with an automatic fallback if PIT is unavailable or by
> forcing it via hpet=legacy-replacement=1. Looking at the rest I think
> the PIT isn't used if Xen finds another clocksource. Did I miss
> something?

I think the concern was with calibrating the APIC clock against PIT,
but as you say that connection has been cut. So I think there's no
prereq work left there; Andrew may prove me wrong, though.

> mwait idle driver: While mwait-idle.c share a lot of code with Linux's
> intel_idle.c and the imported code seems to have been updated (for
> example for Alder Lake) it only supports the CPUs with hardcoded
> cstates. Linux's code also has a code path to read the cstate config
> from ACPI if the driver doesn't has a hard coded config for the model.
> This is needed for example for Tiger Lake. For my current testing I
> added the values the Linux code reads from ACPI by hand. But that's of
> course no proper solution. How should this be handled in Xen (IIUC some
> ACPI things are handled by Xen and some by dom0)?

Well, there's first of all some lack of understanding on my part: It
hasn't become clear to me why Linux now has two CPU idle drivers
consuming ACPI data (intel_idle and the purely ACPI-based one). If
two are really needed, then I guess mwait-idle would need extending
to also consume data passed up from Dom0, just like the ACPI-only
driver in Xen does (and which doesn't do anything until such data
was supplied).

> I'm not sure yet is what else in Xen needs to learn about S0ix. Running
> domains need to be halted, that can be handled by the toolstack. What
> other Xen internal things need to be aware of S0ix? Like avoiding
> unnecessary timer wakeups or similar. That's currently my biggest
> unknown and it would be great if someone with more insight and overview
> could give some hints here.

I didn't think the higher-level-software side of things was different
from S3. Instead I thought it's merely a matter of different
interaction with hardware that's needed (which, as per above, includes
avoiding certain things, i.e. in particular the PIT).

Jan

