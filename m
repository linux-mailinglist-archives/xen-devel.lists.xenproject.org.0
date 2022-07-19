Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393845792E6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 07:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370317.601994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgFc-0002yo-AG; Tue, 19 Jul 2022 05:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370317.601994; Tue, 19 Jul 2022 05:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgFc-0002wz-6p; Tue, 19 Jul 2022 05:58:32 +0000
Received: by outflank-mailman (input) for mailman id 370317;
 Tue, 19 Jul 2022 05:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgFZ-0002wa-Lj
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 05:58:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce4cbeaa-0727-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 07:58:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4181.eurprd04.prod.outlook.com (2603:10a6:209:4c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 05:58:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 05:58:23 +0000
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
X-Inumbo-ID: ce4cbeaa-0727-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP22CRoj6w8u0c+0eOIaKeSl29rrJjifQV8HZmPcz94R1//Xt5goPgOm/arAxDcZixm44f+yNZaICepNjrjlddMTaZ0r54p6VzOmLFCEqW7XCkMBaaTKRPfSRBaRHPj+Er//OhA6ibAnp9lU+RW/o78E6y/o9jL0tXR/kjHyuySjl3V1WuhV+GU+z159v2Lxfz8RAHIKn602/YrbwhoS8DnZRUiudPOkHOKNFnncgacvvF+MjkxSBUGLYJxK7k3nDOdub6cXpJxjmHZQCs5Ta5d4EXSq4OdhEzjgzdnhBtGNDjuUxgBv9xes4oUa/v30REOUH7ckf83hWa+ihewNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwFHMVkJvvS8l9UJzU9hvb80WzO1QSLx7B3tDdkxNCg=;
 b=Yxdj/4GowEZFeLX48vDjEQzQ5Z+NGOHHNkqy1k4jS6Na/6w+xHeZciG8Bdfbje5A40S1qhorvjuxcSWXQ7gvyt/sGdRUOJPA8I6TfNsOL9p4tXlC+TB7tQQTv7TtRJB59Jpyr+ZNIIKwwJszP6hd770Melkbxq2Kv06qGwVlrOuTiwlXSTsOCUpi0hylJJCMvU2HtpQFJzpcfYZJ7yHmXBzlJHFnG3enEYCJQ+oSbNlRVGIFE2sSoiBdoHsawlC97OWKd7qGAGLJc8nxTa6AuG0yzEocI3BUKK07OS0vCl05dqBcJUhKTmHlqMBgZSoMdroDbUFzYkhp65iJudWPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwFHMVkJvvS8l9UJzU9hvb80WzO1QSLx7B3tDdkxNCg=;
 b=PC/bgUb1vsaBnp+Y3Xd7HnasvlchWFYdAaoBlotLWAnBJuZC29x/v5vK6j25NdIHyVD54W4EeRop0Zd/4F8xzBPLCnGpGQxzF4MCw0+ZjbDZGIIY4lyuE9s2RPlix4NdxGES7SMAoNP2iAwG/lC2KUW9BYqcW7yfjIdvxa0vNyG7JbXw4pOpaywI9B0FkBaQhWDTrynQJIEFPbWtOf+5fw5BkftYfnJ4bD5JcX5wmDc4Z3UB3uF4d9ezL+RUpq1U6Tg8ATyy6dLiK5hrcs4mcc955cpp+tV4pFcjGM0qnDozdDWTdEOZBx/IL/JjBRojgRzeVr3qnlql5Ny1psfYgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c65af685-be43-00ad-a2ef-614044ccc69a@suse.com>
Date: Tue, 19 Jul 2022 07:58:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Juergen Gross <jgross@suse.com>
References: <20220527072427.20327-1-jgross@suse.com>
 <6e12a7ee-8526-2214-8beb-f0f3d8ad3e83@suse.com>
 <456d3702-c4b8-9a59-a8f3-307517be86a8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <456d3702-c4b8-9a59-a8f3-307517be86a8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0524.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f924d74-ea6a-46d6-7e36-08da694bb08a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4181:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sdjekr0C+FSn079VCXtBszee9YTUDjb8zp1nN9rZfKVhY9czcSjUioE4tmaPuf4DpnYcMEjsIJwMjAuskykRQQbEZeuCcn7z1DfUP3f9afyekcMX/QhLkUlPyi6Co12QuFk3nL4kJV7TlZOIYwblJQ/3EScCiGwp1f5s2keQtA6YnGg/6kJZKYMFhZ//IlBPyU+XYOwhWhDe8Xb8RYGWjm/CW+721+1jd8mLbmkLJfpux7yu8KrCBibKlK2SZ2nrR2qd/+/IyT/fqhJAL2kooHQQqyL0VZch6WB3jKmJ5LzpfzR2+kEiQlX6XjhJDFNFASJNmfRgg6TAMibro+DC4+4gRQngE7PtDnUjRH9Zayt5y4skdm+b5/B2q7okjDVb1y3bzpXnyuxJCMIGymhr5EvAERHT5PL3Raeq/kVFMDqWoGZxLsY0wONXPsFsuqUfDyqKjlnJ+9GCJina9eK+Vu4HUdsIHFTtrrEwE+A04lg/c4JT97Vxv/hM9jRMhYSTuE341QVYHgob6kpsUkbnsdSER30NrXHwIDUrgqmKtTonkqKKtQ5SWTCGnc2G2brGk/t7QpmFK9CzYH1ussX4mj5nVOtxfuSBbrAizmXFBqxQczM2d1c79Nx2fjGDVKNFvpoMSIv7rGzqvKht89tTjEi8wPmdNwg2XTN88M/cAjR2X4pIPfKHtkHdIsShGfg9vnuIh0POKGTcMD9HAUtUq3PU+M2VYOFCKrz2pP4m2BZ0rJc1DWYU24wrmdk6WYob3psoH9t2JeDbjW37tcE0AbHb/mX/J2G6uD0TPY7UEgAOf0JkScyynKDujFkpffDsZnjYcNdhcCfe32t7y4XtUzB+CjYhsuX6nza72ywaB3K3Eicn4mkWptq+gt3ZGae65mZcDGQ/ZjEJAGH4zBKoPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(366004)(396003)(346002)(86362001)(6486002)(966005)(53546011)(478600001)(26005)(41300700001)(316002)(6506007)(38100700002)(31696002)(54906003)(6512007)(4326008)(8676002)(2616005)(186003)(83380400001)(107886003)(5660300002)(8936002)(66946007)(6916009)(2906002)(36756003)(31686004)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3hEbTNtbUUreHcyUyt4Q2x5b05MZjRiUFpyblpWdkNuaTRUOTdLVVdjT2lT?=
 =?utf-8?B?c0hnUVhkVVhNcFB3N0xTYS9BOCtFQVRLK3JveHJXOVpJWjg1V0d2dksrbzBx?=
 =?utf-8?B?REQzM29yUHU1NTdhTXppR0ZJeWg3N051bTF3THhRVnlwYXlURXBvQk1FYlhC?=
 =?utf-8?B?emYwZ21rRm1xQVVkK2hmZVQvdVVVWGtET21uOHYxWEZUQWxMRFhaR2hWd0pB?=
 =?utf-8?B?SU4zZGxWMVFwMXRqaDZDWmF1UVRhVXdadHhxMHhNMTYwdjMrL0pEeGFYMTZG?=
 =?utf-8?B?TFJtMUQ1SVpnaDhzOFU2UlpjS1VPeWJaTkhyb2wzeGhUM2pkMXVpN2xzbnRI?=
 =?utf-8?B?SWFsNDl0NFFMUUtjTFoyNjJGd2U1all5RlVuQ0oxK1ZUTm50RkxyaXgvVFdj?=
 =?utf-8?B?MVFqTGNINDBtemlGY1FjNDdadWN4MnhMRW9uVzRiYk02NEdoN2loKzhHN3Bo?=
 =?utf-8?B?UU1XUVo0UEhYVDFyTzZMWGdDaHFVcC95R3puakg2Q3RXMUxNeG0yYkREaUN0?=
 =?utf-8?B?cXFwanVVNDNXc1R2eVBDNVYyakI0S2laNW9LbXZCS0kyTHA5Wm9KZ21yWVJW?=
 =?utf-8?B?b3I3NHdjRyswUUJGVm83Tm52YWJKMnZEM2orWklHQnpmcmtpRmhnS1NHRzNh?=
 =?utf-8?B?bUdWSllQZUQ4djJZUEhMOFhjcmplUjR2SGw3YzczWExGZHVuV0dsS1JDdUcx?=
 =?utf-8?B?N2ZjaDNjRjcrNGtLMzlXQ2YyUlh1QWZvYTNvc1cyWXNkWkxxT3ZzTXAzdGt6?=
 =?utf-8?B?YnJ5bnptQ3VPZHh1eHM2NlJPQ21SWjZmdDBqTDZUQm9qMTR6Ky9tYUNRM1Z0?=
 =?utf-8?B?TzJWMUlKNVZmS0w0VEcxajNXSi9NdUU0WTRJbmliQS9lTnhWaXNoNWtrRDZq?=
 =?utf-8?B?OGY2OG1jaTluWVJJcVk2S2oxWGN2V0wvcXRTS0lLVDM2b3VOWS9HOGRSMzJm?=
 =?utf-8?B?Q25WRWVpMDNQMVovbFJSMW5ibjdESE1JUTV2Vk5zRUVyNG1NQjJvU1pBdFBr?=
 =?utf-8?B?c09TWVA2M0lNTm1IOTYyaktZaENNdXZaOUhMY0wxNnk0UmRLdmROaWh1K3hy?=
 =?utf-8?B?UUNzQkk0UGt5Sy9TYmR5V3puME5Va0RXbWVwbkpTUkh5dGVUT1JGd3FDaVJW?=
 =?utf-8?B?ZUpvTWJwZzg2TVBEblJjZjZXNlhKMTdJZWpmTkdwMklzYzNYTUo0aXZwcC8w?=
 =?utf-8?B?V0xkMFkyRURNUUxybXBYQ1BneHZDUS9Tc1lidC9oMXNoZDNFWUhycmx1Y2RJ?=
 =?utf-8?B?dCtZRkp1SEJxSGZxd0FjMmpuOEJuZ1FUWlRNbS9MWHgwd1RxN1JRT3dDN0hB?=
 =?utf-8?B?VE1ldUZnNmI0QlFiU2hEMDg0b2dNRlVkUFpTOWw2V0h5UmNXa2xSUitTbnow?=
 =?utf-8?B?MzY3NTFxVGhHNzVSWHNjNHlhR3EwQUhvbjRNSGpVS0Z5UkFJcWo2eUhRMXBR?=
 =?utf-8?B?QnpZMkVVaFdad0VVcU9TRUs0K2RHcis0M3ZBbDhIZVRSVUxEK3FadEs0bjho?=
 =?utf-8?B?aVJ5eUN0RXA3M1BJVEdzbyt5SDU2WWo0QndaVnJrdzUvelphYzJHTUhHZGpv?=
 =?utf-8?B?M2VIMG1ETXg4cVRGdENzZWJ2T3F5ZmR0b0RsTlNuVS93MkNzQVY0akpUalNm?=
 =?utf-8?B?Uy9mVTlRbnJQb3RrQUYvdzdBaEl3WEtiQjkyWXJEYjVUWkVLZFJVUzJ2TDlY?=
 =?utf-8?B?ejVRY1FjWUYraDhDejdrM1loRUJyMENiSVROVE9jN3VlZmpvWW1qcE9NbkUz?=
 =?utf-8?B?YkRRRm9DeHlmSDVOVFdzZjU4MkJHQjhmY0xDSCsvU2M0OWhGVDJyWTFKYVVB?=
 =?utf-8?B?TGRoZ3VydENXQjdXT05COHFFa1cvbnluRWpWd2NCaWlZY2ptQnVEL3VVOEpr?=
 =?utf-8?B?cThNZVNCekNpNlJMbm1UV1JvcHA5K2lGZWwxWkcvelZacmZqVG9HQ2JIdEpi?=
 =?utf-8?B?bFBHZ0NtS0V5YkdsQVVnaE0vVEZzYzZWVUw2azNZZ1NwcFh1OXhJbDBDT3ZL?=
 =?utf-8?B?Rjh5Vm9hZGtXSmgxMkVBd1JoQTBWdWQ5OElSWVNWYnkzbWdVZlAzNjU3ZlNh?=
 =?utf-8?B?anZ4d0s1M0ttVFJBZnNLcFI3T2lNTDdSQUsyWVRDdVhmYWZBekdBQVk4Y3Nx?=
 =?utf-8?Q?Tx3Z0iLnatY7e/s/1WE7WxriV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f924d74-ea6a-46d6-7e36-08da694bb08a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 05:58:23.3707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmAzdLEA1GXjDSPxpRKHyepCdlhmUm2xqjs5cm32tK2pn4NmsxHxRwYMOylkAaFZbds5h2XmEFsqyJ6t6uFzaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4181

On 18.07.2022 18:28, Julien Grall wrote:
> On 18/07/2022 17:12, Jan Beulich wrote:
>> On 27.05.2022 09:24, Juergen Gross wrote:
>>> In the past there have been spotted some shortcomings in the Xenstore
>>> interface, which should be repaired. Those are in detail:
>>>
>>> - Using driver domains for large number of domains needs per domain
>>>    Xenstore quota [1]. The feedback sent was rather slim (one reply),
>>>    but it was preferring a new set of wire commands.
>>>
>>> - XSA-349 [2] has shown that the current definition of watches is not
>>>    optimal, as it will trigger lots of events when a single one would
>>>    suffice: for detecting new backend devices the backends in the Linux
>>>    kernel are registering a watch for e.g. "/local/domain/0/backend"
>>>    which will fire for ANY sub-node written below this node (on a test
>>>    machine this added up to 91 watch events for only 3 devices).
>>>    This can be limited dramatically by extending the XS_WATCH command
>>>    to take another optional parameter specifying the depth of
>>>    subdirectories to be considered for sending watch events ("0" would
>>>    trigger a watch event only if the watched node itself being written).
>>>
>>> - New features like above being added might make migration of guests
>>>    between hosts with different Xenstore variants harder, so it should
>>>    be possible to set the available feature set per domain. For socket
>>>    connections it should be possible to read the available features.
>>>
>>> - The special watches @introduceDomain and @releaseDomain are rather
>>>    cumbersome to use, as they only tell you that SOME domain has been
>>>    introduced/released. Any consumer of those watches needs to scan
>>>    all domains on the host in order to find out the domid, causing
>>>    significant pressure on the dominfo hypercall (imagine a system
>>>    with 1000 domains running and one domain dying - there will be more
>>>    than 1000 watch events triggered and 1000 xl daemons will try to
>>>    find out whether "their" domain has died). Those watches should be
>>>    enhanced to optionally be specific to a single domain and to let the
>>>    event carry the related domid.
>>>
>>> As some of those extensions will need to be considered in the Xenstore
>>> migration stream, they should be defined in one go (in fact the 4th one
>>> wouldn't need that, but it can easily be connected to the 2nd one).
>>> As such extensions need to be flagged in the "features" in the ring
>>> page anyway, it is fine to implement them independently.
>>>
>>> Add the documentation of the new commands/features.
>>>
>>> [1]: https://lists.xen.org/archives/html/xen-devel/2020-06/msg00291.html
>>> [2]: http://xenbits.xen.org/xsa/advisory-349.html
>>>
>>> Changes in V2:
>>> - added new patch 1
>>> - remove feature bits for dom0-only features
>>> - get-features without domid returns Xenstore supported features
>>> - get/set-quota without domid for global quota access
>>>
>>> Juergen Gross (4):
>>>    tools/xenstore: modify feature bit specification in xenstore-ring.txt
>>>    tools/xenstore: add documentation for new set/get-feature commands
>>>    tools/xenstore: add documentation for new set/get-quota commands
>>>    tools/xenstore: add documentation for extended watch command
>>
>> Hmm, looks like I did commit v1 of this series, not noticing the v2 _and_
>> seeing there had been R-b with no other follow-up (leaving aside the v2)
>> in a long time. Please advise if I should revert the commits. I'm sorry
>> for the confusion. (I also wonder why the R-b weren't carried over to v2.)
> 
> patch #1 is a new patch. The patch #2, #3, #4 have been reworded and the 
> overall interaction is different. So I don't think the reviewed-by 
> should have been carried.
> 
> I had some concerns in v1 which were addressed in v2. I have reviewed v2 
> a while ago. From my perspective, patch #1, #3, #4 are ready to go. 
> Patch #2 needs a respin and we also need to clarify the integration with 
> migration/live-update.
> 
> As you committed, I would be OK if this is addressed in a follow-up 
> series. But this *must* be addressed by the time 4.17 is released 
> because otherwise we will commit ourself to a broken interface. @Henry, 
> please add this in the blocker list.

If you hadn't answered, I would have reverted these right away this
morning, in particular to remove the (now wrong) feature bit part
(patches 2 and 3 have dropped their feature bit additions in v2).
If you nevertheless think an incremental update is going to be okay,
I'll leave things alone. But personally I think this mistake of mine
would better be corrected immediately.

Jan

