Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730697CA7FE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 14:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617502.960117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMjk-0008ON-7k; Mon, 16 Oct 2023 12:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617502.960117; Mon, 16 Oct 2023 12:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsMjk-0008M8-55; Mon, 16 Oct 2023 12:30:20 +0000
Received: by outflank-mailman (input) for mailman id 617502;
 Mon, 16 Oct 2023 12:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsMji-0008M2-FI
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 12:30:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2f39ed4-6c1f-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 14:30:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 12:30:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 12:30:15 +0000
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
X-Inumbo-ID: c2f39ed4-6c1f-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU9OulXySWClVarA13522OEIVnIhDBSE6P+4Cfdvhd0kS1ur+ZKEihCzllsztgpv3MLL23iy3YhvR3vWpC76Ge+Yihmv6XO/IM41/UYj9hjw9T6SikxGHJdqqroDdLkefMWwULo/1zW1jYSr19no+vxKeThiv2otU98L+qtBRBlld1FRVfCuTQG4ay+YPsdRUwaRzf9tKJAGDMuog5FLr9kSYcE9vHAq1Nq02bDN5/ZLs4wxTb7l7ymVM2XjuxlGvlD+oo8WvXD9Qi8XEMnFrtnTqcrlCmlvpJu6rOvRTTR1eO434FBNxyN7oUrZh0RTK+mC2YIxQqMr3n94Bh04Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJJZYpGMDMpQMlOlxJZmj0caqqy/PauBGDU89vQIbh8=;
 b=jCgAIu7LLBr8pjqSVHxNfjbqUpl8zZnWARLO8NNC4ezG8hg6UCqANjU6yp/t/3wXdMFgsk0bfNSaXNkT6zcjCEpXfx8/aECyB6+98vjsWHHdOR80iTkoYBdsWkEZI3O1cxuW5HgQXDf+FKUtVIePYawRuAn0Fz1kbHRtczhp9EqTlqJA2dWGpiitiorT8NvhYvBziZxkx++srIyG4rixrLsPZYK0NSQicnhXkrQnhDlWyUqKhV9+yAk7JRgCIikFb5caIpndCRgtSsNqpu49qCZqc+KuyQMHpMcoCvv5DFagDWNPx32OiASox6sPLR7mKeyQ+2sR6gNsKJFcsBGj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJJZYpGMDMpQMlOlxJZmj0caqqy/PauBGDU89vQIbh8=;
 b=EzHCnXes/s86sGhS1GFpoqGcNeqbC5nlKslotbTgETGDtnfSzT9vR+Uz0dn8EEUrMtpBoaz/Tz8QYDaQCyAmzbTdBHkoJ8GQijlObz2E5Jg6Zi4Xo2RWHxCdzxe/8If78mneuNmOnZxg6nz2MwzRRE0e+7Wg1HRpWL/nSynegfmoP0v/7TnV8f6/ibvcycxux6LB8R2kipoXgJytQkF4IIPg0qjl8hQ9NwN8eN0aVDxxkVtYKyTMHWdEbpRAoz48MwEq9Q0fJm0kNR1iVkkSihkPH0xveLAGEqeIU1wzEA455hGU7bNrv0abeLZexi5T20J4JRoLaolFD9ib0T3IEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6442445a-458d-3ccd-057c-f8d2ac208232@suse.com>
Date: Mon, 16 Oct 2023 14:30:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] domain: fix misaligned unmap address in
 {,un}map_guest_area()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231006130059.97700-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d7a453-54aa-421c-f785-08dbce43a60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bbFOC411eA8SMTbbJxnWQljbPImlne1/MJrrWqAQ015a/XDMpB4xz8Nd2Ia7prxAFgDWOTmRdRSxNPGsmCha0WiIIbBbkUZl6G67tJOMpe04AbxEeljc7mcyK+jOVJrOQDlLkCUbZ2OHFgm8chP1N6hT+bbDnraN8+8dJT3nDCU09W58Q+gJrk5d25zTHePR4OZ+/7IAZAlzPl3uQMBL6WkJOI5WZaPCV4RqSatH5uaew/Ah3jwaePLGA0x6FE4j9xuod3CZJWMzZRoZdO/5F7p6rvlyZ9Y3z17+X3QnPJALi46IM2fk/OeDtUuKIaLHzb4r+wOckZ8tDN/MmBXfgPobjAnObAsYdr58mpcpdczomRBao+3K4FLJXsqIt4Az8OhSy2ojJe4Swm3MSBIaVIGCYcf7+/wQvvfEKz1HICIoQfbAKQGnIkzYZ94TqPQZz/Wi3c6KTHAp7mYJEgucgGmD/ebOUkAGVhcqem8L7bjpTs5lSXvIqxvdQocMiKbLkd4wDztf1j6+C0bdfoKsfK9ea/8SLI/a1fqG68yZttfbVunWCFGjDLweqA00COHMkL5UKz5IikgGEbfr3qIHJw2/vWiQ92U1eJhoeLdWKarT9Eia49QB7LW2xSsxygJUwM/qHDlfY95AxhthjXUOEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(38100700002)(478600001)(2906002)(4744005)(6512007)(6506007)(6666004)(316002)(54906003)(66476007)(66946007)(66556008)(6916009)(4326008)(41300700001)(5660300002)(8936002)(8676002)(83380400001)(26005)(2616005)(31686004)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ei9FVVlnWjd3WXNlazFtcHg1bnNPVUs0cE5zUnJzcEhWOGlHcGVhc0E3dzB6?=
 =?utf-8?B?SCt4aW1GT0tPWjQwZldycmx4R0NjN1JINjRqWWVRMkpkamIxUUNqc1o1WHpm?=
 =?utf-8?B?Rzc2dlVHQmV5N1k3RXZQaEJ2WVYwa0h1V0d5TU5jQThwUUVYQmV2NjRscFpH?=
 =?utf-8?B?a1pZTm9hNWE1eTFNQ3Z3Nmt1OVpxYm9GYWQrWkRUVmNiZnJxSXJrMXhTaUJM?=
 =?utf-8?B?UVVOVzcrNS9KVGVpV0dHWkRSd2l6a3V0WUEyUjlYQ0JhaW1sN0J1RjBwSGpl?=
 =?utf-8?B?Z2FKdHcrQVpaRHg3UzRUOTFFOXY3MWE1T2NQNlphZzNWMDJ2VWxnWnM3c1Bx?=
 =?utf-8?B?V3FzYVErZUVINzJ4VE8rd2JHVGxLSENPMndxMWd6L090cVB0U3ZKMFdFc1c1?=
 =?utf-8?B?Q3FzeDhwb0JNODh4dzFnSnYwVFVLcWdhUEI4bnRGZ2dtREVkdU5UalY3T2xF?=
 =?utf-8?B?aWVUT1ZHMmY4MmhwODFleEYzakNzTEpTWWtvRVlhVUg4WGpZQ3RNR3ozQVFk?=
 =?utf-8?B?NjRCd1A0eFF1a3o2RjhxVW1VNkhDcWxuTDhnNU5WdkZtblVSMUFzZWVkdUpB?=
 =?utf-8?B?bHI0Q09uTmQrNzF3em9pZXBuMDU5QkdLcW9hSEIzeUtWa05la0xtSkUvQSsw?=
 =?utf-8?B?ZU80RmpSbkFtVUZHWGxHYnFOQjN0SXFLTVJ2cmdJQkphdGFQcTB0YkhjTDly?=
 =?utf-8?B?MnNTWUdkOHIvNDVEYVRhNFA2UmY3NSs1VlZvdjE0Vm9CbmlYV0p1WDVYWXM1?=
 =?utf-8?B?NjlFR0J1NkF3SnB3RWJFUm4vT0lIZUZVNCtFRVBFdzZWMEhQUUFKMk5yeUZi?=
 =?utf-8?B?U0JrVlNKZi9IRDBIREhxOUg5NzhZR2g1OUZ6eXZjSE9yUlZ3N0NRNGxJRmRm?=
 =?utf-8?B?VFcwNlFVYzJXd3dFakhlRXA1anF2YUYwRmU5TGZpRzcvdmtGRGZobXFPUDNO?=
 =?utf-8?B?cWpGWlg3S1R1TmRSV25ycGR3WGUwcVZlWE5PRm9TNnF3VE92RWVhclhsRld1?=
 =?utf-8?B?SDFsbTdIZzgxYWZsckF3Y0ZVOENuNzV5U2EyVzJ3RUU4enZTUXZUSjRGNGNV?=
 =?utf-8?B?bUIzK0JZMmNnWVBKQ1hxUmZQVmtnYnEvRmxrVW94YmlYM3Fic3lVQW5pSVA1?=
 =?utf-8?B?N2RGUmxiSGxQbDJjUndCMjdvck9vb2I4Y2c0ZDV6VjZhM2R3UnpBcEtTT2FO?=
 =?utf-8?B?RUQySGxUZzF4V3N0dktsS2czR2tLQkdoT3Y4RGtobmc2dEhmR2ZTTFE1dExW?=
 =?utf-8?B?UWRHK1UrZFM2WWpOMDk5R3lUVDBNeDF2eEVhWWhHcGZoa0cvV25IWks4SHdL?=
 =?utf-8?B?UWZ0eHJ0L2pNQU00dzNVNFUzLzMwa0dlRXpRSHdqTmsyVDRPb083eGNsUWtX?=
 =?utf-8?B?SWc5WjFJREozSjhDTG50ZEpHL210T2hLM1dlM3k1WU00WjA0WGRzZGNINXBE?=
 =?utf-8?B?VElyMWovTUp5L1J6bVBFYWhOV2hNRit2VUFtTjFUUm0wR1hvUjhYWTk2Nk1p?=
 =?utf-8?B?L1V1dWRJMTk3MVFKbXlaeWR2SVVINHJqNFRxOTV5YjB5aVpINWdXdFpiYVAz?=
 =?utf-8?B?Wkl5UjdaSUNnSGZnSGJBYit4bUNBU3Z2aHRvd1NFN1RKLzFHeWcyc0xiQ1d4?=
 =?utf-8?B?ZkZXMHdpZnlJK1h2Y1BuZlIxcWRIY2NtT0VVT3Nlbk8yWkl6TkZGSFppdHI3?=
 =?utf-8?B?bEszQlkxdzZldWd3RHoxYWdvOS9HTENKTVdHOEFxb0hJcmFIdzkzNnJLN0o1?=
 =?utf-8?B?UWsvdi93em5WUHFvK1lDK1c3NXJMalBuMCsrNzQ0Tkc1bUJicXBZUUNjOHl5?=
 =?utf-8?B?Q0poQ1lKL0tOYmFBSldQUERHdmpzSnNTaGJ2OUhWeFh2c3BpVmJ6bENjb2Rh?=
 =?utf-8?B?RFFNdGRnZnNORzNwTkxxU2g0V0xEalorcVRlaDIvbHAwV0k0aEU3RmhlbjBx?=
 =?utf-8?B?bUNtQXVVZGVYbWdUOXdhVktJU2E5dXQyaGZPYjR6djhwa0JjZzdLT3E1MGpr?=
 =?utf-8?B?UThOYW1qM2ZYaFViZmdzN2xRS2tRTWdvRWhhZkdneVRpSnljcEZvNEFwMjBy?=
 =?utf-8?B?Q3Z1N003dnZaelByVFlRSDBHOGxDM001VHRFWm9VSFd1U3pZMTlwTVZTcWRN?=
 =?utf-8?Q?g8v9fZU/AtPJHgFHQHFG+DD6o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d7a453-54aa-421c-f785-08dbce43a60b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 12:30:14.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D63bAd4POFpg2yPGROrVREWBCvZ1EfN2nMxdkTeshgpREzjcKcJP/+tw5kmDAfTwZxLHdFh/Oq5nEur23ydTQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716

On 06.10.2023 15:00, Roger Pau Monne wrote:> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1601,7 +1601,7 @@ int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
>   unmap:
>      if ( pg )
>      {
> -        unmap_domain_page_global(map);
> +        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
>          put_page_and_type(pg);
>      }
>  
> @@ -1634,7 +1634,7 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>  
>      if ( pg )
>      {
> -        unmap_domain_page_global(map);
> +        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
>          put_page_and_type(pg);
>      }
>  }

On v1 in a reply to Julien you talk of "limiting misuse" by not relaxing
expecations in Arm's backing code, but I wonder what kind of misuse you
think about. Aiui there's no strong need to insist on page aligned input,
and relaxing things there may simplify code elsewhere as well.

Jan

