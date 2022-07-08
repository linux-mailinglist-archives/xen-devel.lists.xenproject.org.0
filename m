Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2C56B3D4
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 09:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363281.593768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9im3-00088V-Mi; Fri, 08 Jul 2022 07:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363281.593768; Fri, 08 Jul 2022 07:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9im3-00085P-Jb; Fri, 08 Jul 2022 07:51:39 +0000
Received: by outflank-mailman (input) for mailman id 363281;
 Fri, 08 Jul 2022 07:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYmb=XN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9im2-00085J-0f
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 07:51:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2042.outbound.protection.outlook.com [40.107.104.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb05d3dc-fe92-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 09:51:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 07:51:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 07:51:34 +0000
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
X-Inumbo-ID: cb05d3dc-fe92-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWWcMvjIVbng4es19flMsjr2j30KbXssamt5bv+rhAd8TUU2xUrf7GdMxOrIkCtBkVzuUw+A9d/ehzpzP8fC5rB4nF9HrJBWQ7+96lDh9uS6wJ6L5P0+kiuqtU0hQkgInFnKmj1czfhC1/M+OGw0ITmjuY4DgSzVPe7eOMuOmG8zM4XHbgDJEU0wL9UVHYkpmFS+EuosTD9XEjl8r9nYLr6s6ha5qsUmZrTq6x7+aYla8v/XphaliAunbETGKsgesYNaJWuy5+6TzoXfrojUeQZHKWMJC/6CvnNeDtL8v4hg6/vIM4XqrEuN42OOFOR3orq5+bx/sNXh0HMO8j5J9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL2qY6tJQrjKPPOxPFNictHF6qbFchNvv9rz/v7tlME=;
 b=auYwf++YCwN4UOFGzoOC43O/k4fjLAUU01GQFTvFhSQjwr9FPJTZVmb4Laq8cr2RuVMsTXaQ8W37TJaDeoy/ZNtTmCI28TPxGAMuJpORX6X/0fJyj2HZag8xSbaRc9uFWZXwXhieTJrAICr26xG5oY4s1jnyfSGBS/Wx+Ep5q6GaDqJ0VgC1t1NHSmAEl9Gv7iyo2oqRaz73T7x8HU9v4LUjcWA00z4PiEq99a5GJI9UKVJU10E2t+46i3U5SYmdxe5KHpJGX950zHWJHvW3hCy6yNypwIKUdxDJzoNzwbrOXoNZyke9c7Sm0GRhxzZpv2KqUFLl+sikxcCqUZPMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL2qY6tJQrjKPPOxPFNictHF6qbFchNvv9rz/v7tlME=;
 b=xRmLxN4hzmqavA7xwsY2as3SRO0UUBiCV6x7cyhqMVzZcn0xSB52t6Xy2FY5UydQDOYF6Q2Npzj7SfG4IZy6YECshVE/zZ9kt6AfXJX5DRAEFn9b7iNf5O/GV0eZ3YUEjp7eBHgmn8sFUexX9uBmWOk3eDgV8ZwuggFIPO8q5uULDB3nfI9sKmPt0XoBHGCNfqVrqK2UyUQxM6IXHhl9OxvDP12zSeJT0RcXZ8OlOgD3F6rjbXlxOHdP7o6uPglb/uNS2WrXb9nhoueXBkxZ311WZOu+LC0IaDfR/ZlsJA6bUncK6VzrjUejlg8HpBl17yScLIaiO7bz8CKwgMqeNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73ba5d67-635b-b377-14c6-7dd488b10e32@suse.com>
Date: Fri, 8 Jul 2022 09:51:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Xen 4.17: Proposed release schedule
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991145C8063D6939AFFED8F92829@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdfcdccd-b262-4098-5c29-08da60b6add8
X-MS-TrafficTypeDiagnostic: AS8PR04MB7590:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uk9n/3kebr7FzOx6OwtMag2RmMjegHU9zqX7XL+VqR3GfApOnVEC/59SpQOzQMvAsluDv5KFiq520C29lhFEHhctjiN4OoeBRDMgzts40hZdwyW2XlT4G01r083vtYS6gRF6b4vlPlpCdAwa+9JYNTfz3Ao7ILZ1eZ1vkMZi8ohwG33LCpIBal2G3N3RG3IPYR/bBU1VZAnKLjenS9nduCOOxPpY9664/5x+KsOf9NQiGizSRNja4u6ZLoyxXc6UeiBiV8YH3OkA3gqRhs8P/eITKNPN1rpUrBwRT1jkbCq0MFSCkyKqjsnKUOjj5J3YbXacnUZLF1q9OqBU2Fe2RdG45lQrRWJ4jOmXGxiFhobfLUB7zhCbR9vZ3WME8aR7V254vWK3wuWszouZFVWzqm/BRrBzAYj8Ivkfv1PSRCP4gJUf4kI+eR+fRRHmha3qxm92fDJ9tZzEwAclTvoW43KqacqiPIlk6goem0nCG12nXx2pRG5COdrU2amT21qidcrE+im09LsGvzkH/kLXA73q5ZMC9s1zvr+QLfsOCj5QFkKvHarp3BkJjCEbsLIBAmGnXaxwXrfv+yF8ze0114pmIeEWI/N+KYWLTJdx95Bj2uwddJW8jpN7Uusv2cRU/xML40/MTMSHM2fodfLLadKsU4CWmkbzJdVRRWFXdop/BymSQUdSQkQrA5NpRLY7JAF6EN6vaQZesVznoenxXYEAdCzRn3nY9OGYGpCe9QDByxs2e/Ay48qzUyo7XQr3ZAY0rJzoS9mOOBStGduKQoUUp8seMIG+r+5kkixqpoarN8j2DWsCFkh8+xL/B3VxKupBDhvG4QBJTlSaujOvQ7tbFfVJ64y3tVafRQLq7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(136003)(366004)(396003)(4326008)(6512007)(8936002)(6486002)(478600001)(31696002)(53546011)(6862004)(66946007)(66556008)(66476007)(186003)(54906003)(36756003)(316002)(26005)(83380400001)(31686004)(8676002)(2616005)(6506007)(38100700002)(86362001)(5660300002)(2906002)(41300700001)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnNsbUs2K2VvNHI3UWI0UkZJWU1yMUc4Sy9ZbitMTDRSTENkRTR5Q3ZEWHhq?=
 =?utf-8?B?MmgzMzhaejdUdGpKZXdTZ0VUUFBMOXkwMVlPTmk4UjlYL0xMV3dzL20wODNx?=
 =?utf-8?B?QndEL0NYTG5jOVNYbGUwYVMwU0h2enVFK3VwS3VDL1lib1FRMkFpSERDdjRM?=
 =?utf-8?B?aFJwM0tFa2w0dThyVWtUZm1QcVo1cmhsejFkUmV4Vm4rQXhOZU0yRm9QQ2VP?=
 =?utf-8?B?WmkwNWllb1J2L1JSOWx4RlA2VUtudmEyQ2RibGhuN3VMQ2l6ZU9ydWhRZW5O?=
 =?utf-8?B?eUdGMlQyYkJXbnVVNEl2K3Y2TG9GbGxBMWEwTDM3QjhpcDZCYkY5dFdqMVd1?=
 =?utf-8?B?VVVzNFBENkdndjkxNStVeW5PMUZVK3J4b1FZc3ZlTjFCQi9TU3V5b0xubE1T?=
 =?utf-8?B?a3JjZG1wb2owUDhMOXduVkF6UUhqdU1pUmNZU3greUZUL2UzdUsrRWtaTlMw?=
 =?utf-8?B?TXRxMjVhV1NWQWFJOGlIYlVJcmRMOTV3UWlpbVN0SGFXUjlNQk5sNTRiRHJn?=
 =?utf-8?B?d0xlK3dLM0Z5WjRIOFlEOFcyTzRlWmMzaW5QTHhVVTMzaVRnZ2NlbHJULzhW?=
 =?utf-8?B?NWNRRHltZmo1MDlFOXpWbnhKUjYxc1RIOENQdmlqdVZKcjI3VnJmbXpvc3kz?=
 =?utf-8?B?eExzekREN2YyY3ZHNTlyMlluMDUzTTZSRkZJT3Q0MVJ2VmRNMXhwR0QxbGM4?=
 =?utf-8?B?ZlU1M0dsQThZelFRdnVpZUhoa245b2VSOTlFb1R2RjJ3Z3JNSnMzcGVQVjMx?=
 =?utf-8?B?bXBrU3AxMkhoWTlNVTRIckVnTDlRUHNISnV2Ynp5ejE2M1k0am4yNGdJSVdF?=
 =?utf-8?B?cFhEQm9NU0xzaE1hOGJKZmljYThKa3U4eU1EWmRPYlUyTDFlb2lnd2QvZmNM?=
 =?utf-8?B?ZVh5RXhWMFE5TVRac2FtTHdKVlFrYVRnYVIzWUtNN0RDVGZDOVlvWWtLVW1E?=
 =?utf-8?B?bk9WbVk5UDNWQklSVU44NG1KKzcxdWNTTFdkd2pSM2dqbzhEUEJaT1AxOUJJ?=
 =?utf-8?B?SlVDTjhHUlhkMHhLa0NFQTBlYm9rQjRiRzl1K3dpem9QR010N3c0VGtZdUo3?=
 =?utf-8?B?M0VKZFpxRUtLaGFRSU9yU2FVUEhZWHBUM0hYd1FZemMwalVDa2RTcGo3d2NP?=
 =?utf-8?B?Ny9uRExtcStiL3o2VUltbUlHeFFrMFBWdkRoNkJiZ2ZuK0UyNHNoK2hRN0kv?=
 =?utf-8?B?a0VpT3hsdmdXTGt0KzVXWnRQNTNBKzRVS3NidisyWFhNOFZGbHA2dlkrT0Zn?=
 =?utf-8?B?ZFFHbUMybSs2Z2I0T2JDVVhWcDdLM3NqTnhURXRybVdwbkJJOUVabENZLzVh?=
 =?utf-8?B?NkljczZuSDlCZUlVVlM1UUVBaTBSbUFNNVhrNWJ0YjFGQVp1VjZOalErd3Ny?=
 =?utf-8?B?Y1hxTGI2QWFKSWNrLzRmaExYdWZFcDhQZDgyWlRrUUVJWC9LaXBFTGl4T0Yy?=
 =?utf-8?B?T3NMbWo0T0MzazRQMlZkd2tSUFJzSy9lTng2eWRzM21iU1N4MzB2VndVcDBH?=
 =?utf-8?B?YmpISVRKSHZLbVFWQXU0Zi92NTltVmgzakFGNjNWYXFnRllsRDRYZXJwNlFC?=
 =?utf-8?B?UXFIM1ZRaTAyenU5akNEVDlsc2syOTF1bFZhWXpxWERNTXRlVWJ0cU1QdkZC?=
 =?utf-8?B?cFlxWXIxdEtueHNrUm15VzJTdStHUGk4ZDdycUduTnBRT2tYOXFzTkpuUDFv?=
 =?utf-8?B?bDNxY09UcysyaEJzQWJYZjNWa2Q4b2FqTXlUeXBNMTM4Vm0yNXUzSGdHZkZD?=
 =?utf-8?B?cjFmRTd2MjNER3kreXpPdjIwTmM2b1Rra0d6QmtIRXNLZC9QbmMzZENrY2Y1?=
 =?utf-8?B?R0ZYeENyU1NWWlFhT2dXTGduem54Vk5wVkZIZ0hoNmFzZTF6YW5md3JKaVFD?=
 =?utf-8?B?Zmg0UjZ1QUZoUFFtckhCWFVCL3J2K0ZvbUVPcDdjalpCVzdWRko0K0NGZ3Fl?=
 =?utf-8?B?NUNjM3FjSGZiN3JUUHdtNCtKTEVaUXpvTjBySFpYdHk1dStZdHFsYitiSnpq?=
 =?utf-8?B?Z3Z5bUJnelVXMTEvV21PNkhPalBBVkpQcXFpT2JYbmdVZnhKMk9WWkNmQzZl?=
 =?utf-8?B?OVFuR3JtTWhhWHlkQVpSWlhoUktWdmpSdFRsaWpXQXJwUW5tWmorejRSN3NC?=
 =?utf-8?Q?YGMIUQsQSU16eYXJs4l+b7EMd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfcdccd-b262-4098-5c29-08da60b6add8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 07:51:34.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Dn3VwqvNvG8QvrtGXb5FhTc8hb/VnGSujsNy/shAdvYzl475qKFLTzpaUF13SmU3USOkOkXlLqVZrzL2jNEZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7590

On 08.07.2022 09:35, Henry Wang wrote:
> Proposed option 1: Wed Sep 28, 2022
> (+9 months from Xen 4.16 release, after Xen Summit)

This would break our 8-month cadence or shorten 4.18 by a month (or
more, 4.16 was late in November already, and we're liable to slip
anyway - simply based on history). Therefore, as discussed on the
call yesterday, ...

> - Last posting date          Fri Jul 29, 2022 (+3 weeks from now)
> 
> Patches adding new features should be posted to the mailing list
> by this date, although perhaps not in their final version.
> 
> - Feature freeze             Fri Aug 19, 2022 (+3 weeks from Last posting date)
> 
> Patches adding new features should be committed by this date.
> Straightforward bugfixes may continue to be accepted by maintainers.
> 
> - Code freeze                Fri Sep 9, 2022 (+3 weeks from Feature freeze)
> 
> Bugfixes only.
> 
> - Hard code freeze           Fri Sep 16, 2022 (+1 week from Code freeze)
> 
> Branch off staging-4.17. Bugfixes for serious bugs (including regressions),
> and low-risk fixes only.
> 
> - Final commits              Fri Sep 23, 2022 (+1 week from Hard code freeze)
> 
> Docs/prep only
> 
> - Release                    Wed Sep 28, 2022
> 
> 
> Proposed option 2: Wed Nov 2, 2022
> (+1 year from Xen 4.16 release)

... my personal view is that this is the better alternative, considering
the circumstances.

Jan

> - Last posting date          Fri Aug 12, 2022 (+5 weeks from now)
> 
> - Feature freeze             Fri Sep 2, 2022 (+3 weeks from Last posting date)
> 
> - Code freeze                Fri Sep 23, 2022 (+3 weeks from Feature freeze)
> 
> - Hard code freeze           Fri Oct 14, 2022 (+3 weeks from Code freeze)
> 
> - Final commits              Fri Oct 28, 2022 (+2 weeks from Hard code freeze)
> 
> - Release                    Wed Nov 2, 2022
> 
> 
> As soon as the release schedule is decided, I will post reminders one
> week before important dates.
> 
> Kind regards,
> Henry


