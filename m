Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BF587705
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 08:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379197.612465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIlBY-0001Xz-DI; Tue, 02 Aug 2022 06:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379197.612465; Tue, 02 Aug 2022 06:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIlBY-0001V8-9M; Tue, 02 Aug 2022 06:15:20 +0000
Received: by outflank-mailman (input) for mailman id 379197;
 Tue, 02 Aug 2022 06:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIlBW-0001V2-DT
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 06:15:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a2f3aa2-122a-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 08:15:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3334.eurprd04.prod.outlook.com (2603:10a6:209:c::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 06:15:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::1959:dab4:15f1:4acf%2]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 06:15:14 +0000
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
X-Inumbo-ID: 7a2f3aa2-122a-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHFfRsZnB9ZbFI21ZSOb9t7cWpTfOCgCourUlTUMC6Pp8ZNP0vZW87KHHDGZgNELwkzFvbOE7FLlBdFEwc8ZVDlDYlfHLYe5nBrSN8/HNtmxPRJ/lzuqQ+iJzJMkhhrA/dmqCULqmUtHR8megny9sokctI6CaTOQ7FyuHjQXtdyVZ5CKxZ6gNqp2w/c4v2T6F99WTSYpd2CghGXzitmmc9x4VKSeH7saIPI1/k4o4FcV4Ppj9LCAKtsFnoNO78UYe0TNvShp8Y3vPNsl2g3703dWy3jOpIZ7H4OPdRVmGjhmxtDWhi+KqkSnYBoClvxMD47HqnuaGXXALTkGxhexVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLZrbZ4STTIpu7bEe4cKe7n0b0lwkgJ2cRCNADyl6U8=;
 b=T4vAE4LyxUCYnmqGXBri+1mjN08sn1DpY6fVSaaWOVtPP9D6O1zsE0ePQVWGXGskPeS4AswWohMhSldq9oCBKKLWOPD/m8ENbD5xhnR7xn6Bk93H4w59Yy3eJFboIJ+xQo+Vs+AmfrBob9sP3xFoRS3W9Drw8MyCGOyrtHY52jnHMHfmK9LHgZiMsu935gHKJL0nAUAmkP1NrsL0AeLbAgTlahtv7DEJ0jonySz/dGb1YDN89YZZo7ufL0RthikCAViWZlujPCZYa/xFkc8Xxr7TYI7R0sQQnW9QMtPduo1384F+Kidi27XEcFDoaMDYcARPJ9Af6wNB5Wr/WnHWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLZrbZ4STTIpu7bEe4cKe7n0b0lwkgJ2cRCNADyl6U8=;
 b=j1FnYdRlH2Q0zF/9LZfaR2NYMUHSEVSuI/qJVWs9nUoVTc5/GfP1Ou1zjYgEuDS3VuP6ky5puJDNmHtZbNo65XXeeCpo+lK/AqJV0k9MqlKW/WgQ3yJRObm2stEBnq8E0v9fY5B7wWpjERT1rSttyyc/KXXVH7pldnFmQFhqZ8AhE74rYULPdP+nHjr6mrjVB/8kSVy8ZCUzpa4OSfMi1LjfrojoGNgTmeTh0Wag+i+FkQ/ykIbUJuIXDD6+sh03ThR1S8s0Y7fne9z62H/w539Rh2kPnVPQvfQe7U7MGAo2aJPnu5gnLg8L5qEgiKVtMJIZato6bL2J/dZepFJt9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52f7e4b2-f4c8-b1cf-60d0-548a6db8b4b7@suse.com>
Date: Tue, 2 Aug 2022 08:15:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10 0/3] Adds starting the idle domain privileged
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220801184928.28522-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220801184928.28522-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a60648c0-d4c2-4ee9-e342-08da744e5d14
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3334:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/BHhnAcKqg9FLkiXJHHZAb/vS+P7du1w8s8U6FJmYHGgkkby7gfng37TUY9COaNfrcDiEj4LuBLBcap8GS6GqBXYTfiBDuXYfv+mcQV0tmZFgU9aFML60/tLdg6qUQpzaowlj8Ca5URcnKhAP4/iorpAFHEdfCirGDBcD1M+IECruRWWkQE+e4DXCRrY6YRONiU2b8/gY0hpVg1pjy4eSZZH2FobZ7RU5hwIkPyfLhylMHwnF6H0m67tdyDd26oIBlzoH9OuKcxA+Lh3FY5Ff0kzQY9KyQeTiuobMeSadhzVul5mEiLdC+1slisrbZJA258OkN+BIUw4VeTnrwEkf4GN7DmAa+I1NF4uFS8XAReFW0yEr80V4g1DS8td9M9IgddERzqJthOZkhPxmCzxD+O4Irg02GGw6G9gIwyhRXRlu24z3x5tlzXntgB8f6WOdWLjQN3vmz93sZmL6WRu4BOT391YyYMx2V3B3urJ5NYxpoSw107FntVRIH3OcA5v0Q8tsxf7X4uSEf7C+LfD0fnfb8uz7ociX9SLsq/TMRSkdGEDD+yWjmxvR87+m4sU2xZxC/xM6gnPavmIsECq2vcC4GS0RwRF7X+sXJ1BuWEGOqz+2clm4CLxh84JTyCB8FR1H/rxfp3C4qTTdk1I3BRf1oM6qkjCh3eCJVgCvJgGipEhqPjLnbzaH0xEDiLiD62A/e0m699BiekD4dTebca6nEk/zKAsn1JSmycCPX/3ujeO4fPvNHxq7oSp5fx0YeAtofyHTEtyB1CtobLDX+YWZvR4NMUlHM5OGYJ62uO9zk+dpukWdiOfo/vitVePD7ty4HZoZI49ADJJUkpJmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(136003)(346002)(396003)(4326008)(8676002)(5660300002)(66476007)(66946007)(86362001)(66556008)(31696002)(38100700002)(2906002)(6916009)(31686004)(478600001)(8936002)(53546011)(6506007)(36756003)(83380400001)(26005)(6486002)(316002)(6512007)(186003)(41300700001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajhRdFJOVGtwcnBlQU1CT0ZiMXZNdzFkUG5xaXFVOFB0eTRrYjIrRUNIL2FG?=
 =?utf-8?B?U3Y1ZXRUcGRvN2ZXTTZuVjV4Y3FuRkYxdTc2UVpCcWhmVm1vbVRIK2w3SlVD?=
 =?utf-8?B?KzI2UTExdmFOL05BL2IySkptaHU5L29RRVdCakM0N1hsdVg2cXBvZVN1MVR2?=
 =?utf-8?B?eG1XbDM2cmRBdUZiVVF6emZnUkpQSFFSa2tTNGM3Y3B5cGErNnBFUFBBWWZn?=
 =?utf-8?B?bEZhQm5iSlIvNXJUT2lDOURWQVRQLzcvby9tdTVuMk5jR2ozN2J0ald4MVN1?=
 =?utf-8?B?R0ZFVlFUeVJGVGpYek1YZFF4T2JRSkpqUEVNZzBIU0VyTEdhOFh2UWR2dWJm?=
 =?utf-8?B?K2ZjR1JBRGk1eFFRcVBjcWtLemNKU1hIWjBFVWdCM1diSWYxZndDZ1FmR2dp?=
 =?utf-8?B?dlpvMnBPd2NSM09KamM4TEdiVHV0a0tWQTJDNVBoVmJFSi9VT0hMZ252aTdj?=
 =?utf-8?B?TE5ZVVI0Q2E2Q2hQWWRIakFFWFhnV1Jmd0dUV3lGNVpBcWFvSFlzT2V0YXFM?=
 =?utf-8?B?bWIzOTh5MlN6WHZycW5BUlhWMXZlNVgwdDJsSTV3UytXN1I1RnFwUnJPUmk1?=
 =?utf-8?B?Mk82aVpYN0V5ejRxL2o1WkFHbVZ5K3k3SVpPM05GemNTZzJvNFRDL2NvdUpu?=
 =?utf-8?B?YkxtYlQ1Y3kvQ2F2NjhLUHorNzFrb05ySEhpN0sycGtsMHVTZ1FuOHlwTW1V?=
 =?utf-8?B?dkFmdVlCOHVsa0dVTExkM2pkSWdkOGhBOFZ5aGUxMTZha2ppeVBPblJJaGw4?=
 =?utf-8?B?clpVSm1lV1ZvS2xHK0tjZVlGS3hGYjFWYk5ES1lVUW96cWZWOGlkK1p3R0NU?=
 =?utf-8?B?RVF5WTBTOW1RRlQ1STFJam9sZlBIY256RFFOa3VHVDk4ME1yYXExZFVkQjVF?=
 =?utf-8?B?c2J0bTlGTkxraDY2WW82aFVLblJRcXJmdmR6b2xsbUZ6bnhjeExRMTdQaElS?=
 =?utf-8?B?bXhxNjlTTWo3MWlwLzI2citHcmpTZFY4MmNqb2FNblpYVVg1M1diQkNGd01L?=
 =?utf-8?B?QTVDUUtuQndNejBDRWVsZ3BwYXRERHdQL2d1V1kzZ0o4d0VLanhBMmxPRW92?=
 =?utf-8?B?UmplbE5HVDdpZk5zRmxiZGovak14YnQzQ25TTXNydXFxb1g0YzJ5T3djU09u?=
 =?utf-8?B?bHh0emNRdk5LS3l3eE9jSG9YNy9BNXlZSmt0cUZpUkxyUnIvRWdSeXkrVEJX?=
 =?utf-8?B?UmVwb1lFOHJMeVI1NEVBUERHcnkzSzRPTmFVUXJCekpIZWFDa3llQ2pYeW1G?=
 =?utf-8?B?NGFMakxkN1BMblYwZ2xVbjJmSHB6RHhaNi8yUXJJd2ZDTnhXbC9VcXd3cW5S?=
 =?utf-8?B?N05uQ2dJaFVHV2dlcngwYy8rQUhycEtwNXBxejhZY2NSZ2dVU3NkV1QxWjV2?=
 =?utf-8?B?SERFY1BOS2F5STVKcGQ2Y1BBWmg0K0Q4R0diTktkSk9tNWJmV3M4WEZlY3I1?=
 =?utf-8?B?K0I0di96WnQ2NXNERjhoR0VjbTZCbldKb1JzVzlFeU5KV2dTU0tpMDNPbmFD?=
 =?utf-8?B?dURXZ21FQU84RG1iN1FVeElJSks5Tk1VZlphN1duaGtlOGxPaXZUdUl1RzVy?=
 =?utf-8?B?dTBRMHJIU3NXWDlRTmZ3TEhJUGJ5NTBXdzlOM29JU01zNmlrVFBRb1BGMmpk?=
 =?utf-8?B?aWlJV0VsNVp2eHVpeE9BNHliQTZWOFJheGg0NndjZjZZZSs5blRENFJsbVAx?=
 =?utf-8?B?RTVhNnFoK1BwaFRSMys0Nzh0MTJJU3k4OUVYbDdMYWJzTFkwbDMzdk1hY1JE?=
 =?utf-8?B?c1cvcWZzT0N4MWF0b1ZtMGg3UG54UXBWd0VCZDVicUNGWGJwM0ovbm5NK1N3?=
 =?utf-8?B?UVRURGt4UnU3ZFlva0tzSGF3RkYwM2ZGb0RvbVNxRWs3UTIzb2hJa0R1aG1h?=
 =?utf-8?B?aUxoTlRxWk5CME01YXNUVTV0Q2xlek1lT3pLNWtjSm9WTGJyK0VDRGJiVU1h?=
 =?utf-8?B?ZXRJY3RIQmdOTkw1WDlhV1hUN1dDbS9LcE5jaWEwcTFKcU96VnJvUjVzZUxN?=
 =?utf-8?B?K2JIeURQRDc1Y3lIQkVUeGwxRlpic2UyOFg1ZndQbVpCTUdWdEpodWFkdGJU?=
 =?utf-8?B?d1F6ZEFNSzhzeG0yZ2p4TXFHMUlrajJpbHg2Sk1BYy9XckQyeXEwQjErcUUw?=
 =?utf-8?Q?n+uc3gzeY1HeMYKw8XMlhTNZo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60648c0-d4c2-4ee9-e342-08da744e5d14
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 06:15:14.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/7l85lo4PbtEjVZR7ghNzKE/4ugBytz+0lxu+7h6oN6cHmYyW7Jb9H5ow/4CAUdkl4vvNkEKgANL1qw7qlaVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3334

On 01.08.2022 20:49, Daniel P. Smith wrote:
> This series makes it so that the idle domain is started privileged under the
> default policy, which the SILO policy inherits, and under the flask policy. It
> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
> by an XSM policy to transition the idle domain to its running privilege level.
> 
> Patch 3 is an important one, as first it addresses the issue raised under an
> RFC late last year by Jason Andryuk regarding the awkward entanglement of
> flask_domain_alloc_security() and flask_domain_create(). Second, it helps
> articulate why it is that the hypervisor should go through the access control
> checks, even when it is doing the action itself. The issue at hand is not that
> the hypervisor could be influenced to go around these check. The issue is these
> checks provides a configurable way to express the execution flow that the
> hypervisor should enforce. Specifically with this change, it is now possible
> for an owner of a dom0less or hyperlaunch system to express a policy where the
> hypervisor will enforce that no dom0 will be constructed, regardless of what
> boot construction details were provided to it. Likewise, an owner that does not
> want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
> will only construct a dom0 domain. This can all be accomplished without the
> need to rebuild the hypervisor with these features enabled or disabled.
> 
> Changes in v10:
> - rewrote patch 3 commit message
> - fixed typos in patch 3
> - reworked logic in flask_domain_create() to be simpler and not result in
>   changing the domain security struct before the access check fails
> 
> Changes in v9:
> - added missing Rb/Tb to patch 1
> - corrected the flask policy macro in patch 2 to allow domain create
> - added patch 3 to address allowing the hypervisor create more than 1 domain
> 
> Changes in v8:
> - adjusted panic messages in arm and x86 setup.c to be less than 80cols
> - fixed comment line that went over 80col
> - added line in patch #1 commit message to clarify the need is for domain
>   creation
> 
> Changes in v7:
> - adjusted error message in default and flask xsm_set_system_active hooks
> - merged panic messages in arm and x86 setup.c to a single line
> 
> Changes in v6:
> - readded the setting of is_privileged in flask_set_system_active()
> - clarified comment on is_privileged in flask_set_system_active()
> - added ASSERT on is_privileged and self_sid in flask_set_system_active()
> - fixed err code returned on Arm for xsm_set_system_active() panic message
> 
> Changes in v5:
> - dropped setting is_privileged in flask_set_system_active()
> - added err code returned by xsm_set_system_active() to panic message
> 
> Changes in v4:
> - reworded patch 1 commit messaged
> - fixed whitespace to coding style
> - fixed comment to coding style
> 
> Changes in v3:
> - renamed *_transition_running() to *_set_system_active()
> - changed the XSM hook set_system_active() from void to int return
> - added ASSERT check for the expected privilege level each XSM policy expected
> - replaced a check against is_privileged in each arch with checking the return
>   value from the call to xsm_set_system_active()
> 
> Changes in v2:
> - renamed flask_domain_runtime_security() to flask_transition_running()
> - added the missed assignment of self_sid
> 
> Daniel P. Smith (3):
>   xsm: create idle domain privileged and demote after setup
>   flask: implement xsm_set_system_active

Against what tree is this series? These two patches look to be in staging
already (and they have been there for almost a month), so if there are
incremental changes to make, please send incremental patches. Otherwise
please clarify whether ...

>   xsm: refactor flask sid alloc and domain check

... this change alone was meant to be (re)submitted.

Jan

