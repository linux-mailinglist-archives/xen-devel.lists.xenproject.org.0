Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E45462AE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346296.572063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbBz-0004eK-EX; Fri, 10 Jun 2022 09:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346296.572063; Fri, 10 Jun 2022 09:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbBz-0004b9-BQ; Fri, 10 Jun 2022 09:44:35 +0000
Received: by outflank-mailman (input) for mailman id 346296;
 Fri, 10 Jun 2022 09:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzbBx-0004b3-TB
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:44:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee3083c3-e8a1-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 11:44:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0402MB3934.eurprd04.prod.outlook.com (2603:10a6:803:1b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 09:44:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 09:44:31 +0000
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
X-Inumbo-ID: ee3083c3-e8a1-11ec-8179-c7c2a468b362
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bA9JfcsYb64w4XZRrCT7V7Sqv9WiLP5i61iT+JpYWSnn2UvQSXvtXc45vRyVXWD6wu1kGoxWdYRqYF6h4DraHSpEXK3JA9bNpXsUDR+aWfp+anGSUEoD8Q6vjPg17I5AFkFX0gL58azNukOgy0cAMHTj8cwdDRi9rwMpzmm8vvqLqKNjqwtPh7Kgb5DJNKGfNQH9t4k41O09czPTJFF523jlT7SrNXOchzX+G+B0bD/W8o53/CuSADv+5ZsGWqQxz11snUzQ01A8Ptv+0UVsiT0qso3x3au84lFanLsfcBVrzxOP9AhABV1TtuX8CNVS/cczDNrCHITr+TznpLETQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omd2Vt6+O8ay33KHX7XNM3y+yoIHEFxI4gkDvfffja0=;
 b=GR5Bs64x+9phoQmYWJqvUzYfAQGDeXps4mEs6pjBgdCgTZcqy4vF0YQQuEAqjsvs0Mo7xsZzhRJyTQUA76eZrW4DidZ/l1h5m49Th+vvFE2n+Y6OZjcnd5lYaLz5UvpBqard5j1f5G22chefNea2sBsdCkiLgn1s+SkHsWUZcyDZlVdk93znDLpcYZFuCRVjPSygf9x4/UVvm9RxVHGT7Kw+65lH5we097bxXKhmbAkGdoicJomti0TDlYsxKbbGjML4v4ViJl5np9LYdAC2pFk4Ygp0RYfRhp2Dff2dSOlxjQT9hukP5JmjtIpq5VhO/erSxVbk1X4fcUizMnvplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omd2Vt6+O8ay33KHX7XNM3y+yoIHEFxI4gkDvfffja0=;
 b=XoxIogY9r0aDsqw5vklvSxIPEPHT4QkwBOVDipNw0pc4mFJvU8NvMY3Tu7UluW9wfChnCNty6o6MDvM4ETOKpaRgRvjKSqw8Ph84aGxwFCO90ZAcZA7y/RS9uPd/4lX+7trTaQlsdHLEg2cGHpiGqx5wr5RNy2lR/jlFmZUoYCOWboqF26NyuMTWAoIWb1op51N//4SHfEoHnq6D1/webgFt1mKnGZ9/AfxFhheO7UcVBdHn/J21NkbFtjpQrizxlgv/fwTkUpNLzIr/3evWnGSfBjkHnFGC3hAMT3j0jGSX7ZlZPfpE7nMP4r2gMf5Kvp1tnPCo7F+IyOP1g4YhgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
Date: Fri, 10 Jun 2022 11:44:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220610083358.101412-4-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:203:90::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb984c24-b4e1-4a82-57ef-08da4ac5d189
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3934:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3934D94A81A9B510DD100250B3A69@VI1PR0402MB3934.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vtFMW/NMwroEtuUugKRCgciAY5GxATNqczmosBbumnjo19rj72EouMe6YwMv0IhmKmQzr/7rdasTsTLGwZSmpmrcwO5JpCAqoFWvJu9zAWcO7gGw7ndMGQVxmj0KIONu6V2v9XGTSZL1fgtQKTWRfFuOkZEKuCQYG9GyVWoNvCiZNcBizdgWiesxHsjaH3svriZ9P1XANstBqWCv8h/TznP0r9hq++KFIHfMboJ+ekYy8d5uYV8hcXEj07Wd0kk2m3aLzS4BHzQ5DaE4pKgdxH7CJqslDpCWA8HpD6hqKk5eq8+2Xf70QL7VBD+fT+DkdE/5ByAvQUemDU+THbe8nx5QFNpy4jNj60OA4FcaDX5OKOHi8zJlmaCCRImiMKmUcujggHf+DVPGeSJL+6YZc93lerSafXOAeTi2kc3WIUvuREYzo5PiwX8NdsejBrifm6qakiyTLQI0Dd4h2g09T10fZJ7xxRkEf0Mge1eoqeHXAN+sP4ba34DdDvpVkPpncOPZdrz/h5BlBl0T5MoruErGNq8hNJSvKeqWNmvFK7SVCehJMRRbC5uX+o14GkDx5M1pHhTExYtBPR8hlaTAsMjTxXU7ibeGUYll1QrZwLQLyL2G4KMqn17JM7ZpmyIUq4//vZKda7SNSMEEok8xFyzNMnfzqebFfvKJXAKdKiVpeHWPXq+Tps8wLNdsdJpDPw9kc66OJWt0QF6Pdaov8XN5dG2rRW+nS6uAg5iPumDgABT+G+rhfYvkDU+nRkej
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(2616005)(6506007)(36756003)(53546011)(6512007)(186003)(31686004)(2906002)(6486002)(316002)(4326008)(86362001)(6916009)(8676002)(66556008)(66476007)(38100700002)(66946007)(31696002)(508600001)(26005)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmYzaDMyS0RZY3d5K21uY3lUY3B3aDlmSnNpQllNK1RaSkhrL3pqUUd3RHZQ?=
 =?utf-8?B?czlucy9RdGtNZDZiTGlmU2diVlY4Z2RTUG41MitlWkI0MXZMN3RTbGxkT24z?=
 =?utf-8?B?OVJpeXUyck9wZjBwTWRVQlNQTkF6ZS9kLzQ1MFpBbmV1b0t6WGxqcUxBS0dE?=
 =?utf-8?B?QkxvK2gyMnM5ZS9ycVVOYi9zWS9tUG1KS3puZjdkNHM0R2xNOWdMaGloZnVH?=
 =?utf-8?B?Y1dkWXM4Tm5HRXpnVVg4ZmU0dlBPWG93dVBtOTVWTTZSRVR6ZHV4Rjl3WSt0?=
 =?utf-8?B?bFUxSHRTNUVCdWxyQmoycUovRGlnbWk4cWdlK0tuaXdRN3ROTnJyRk5YbXJD?=
 =?utf-8?B?YXh3azIyR2k0NDBXWDNqMnhKOVM5SnpORXcwaUJYbTRvY3FJN2RFMUFFRGZt?=
 =?utf-8?B?NkRBNjFyZjBmdlBJV0hjejhSbzVhRTVwaDVpbjFnb2J1YisyWXlYMkkzSXYv?=
 =?utf-8?B?QUN4RXBZaFpQTUxkaUhUMGp0bCtWM1kzamtjdnY5cEVjR01sL2F6WlJWMnBC?=
 =?utf-8?B?SGdTQ2pvNVRJb2xnc2F2SndZRHlDbkg2Y0lTRDFZWE1IbjhqUVFxUlBidjdL?=
 =?utf-8?B?Y01yN2pmaDRnbmZrbEhZbVNrY1V1VE11RlJyaEo0RzZkaDVQUExiUWt2My96?=
 =?utf-8?B?b0l4ZWlmbmMzYmVhNHptRnlPRjVSZE9vMjFDSmtkSjI5T2swK0FXdjJBNGFB?=
 =?utf-8?B?MU4yRTNFb3FtYnhpMURsYlRDUzI0MGVEN3JlWlVnNVR3RHdtc0I4OWJVOStu?=
 =?utf-8?B?MzF2dy8xZzI0aW80ZmFGMXRuSUlSQ3J5SzRDLzBsZG45c2VDVFdxdGZUWE1T?=
 =?utf-8?B?SUV1Y0FUV1ovYnBTMVF2L3QzaXZ2T25wZDVob2RJV0JYQm9OeUtYVUo4dm9L?=
 =?utf-8?B?L1BEODlpdTcxek5HZjlEeHpWOTVQWVRCTFExMWZRZlBjZkdqOExIaEphNFhz?=
 =?utf-8?B?Yjc3NE9Tb2VmR3dGSE9CeStuRS9YbzdidFB5Mytna0xIOVdjcjZFU3NnTC9I?=
 =?utf-8?B?TEQrN0JoTTIycVNuVm9MNkRmcVFsQklGM1piT0kwRkpIdFJBcnRUMU5Zemc3?=
 =?utf-8?B?RHFHT1E0UXhuRkhzTDZrS3ZJcXZmb200aU9ETU9YTGJINXNiYWdBa2NSblpJ?=
 =?utf-8?B?bEJGRFR1VlhRc29tZ3pObjVQNFIwdHg0U25kOEhOREhxamc3bkwwVEFDQ2lU?=
 =?utf-8?B?a3lubkRBTnR3bWNLYVVFSTNqcEpZVXJPOUNUWFdQdUNvSkd2WFZFTUFOdGt2?=
 =?utf-8?B?K2pkZVhISE5BdXIyOStyc0U0L25MNjJ6U2hIU01KZ09IZFVCalE2L1ZMZU0w?=
 =?utf-8?B?eDZwUWFCaCtacWFzd2ZBenpabTN0N0NLVk8wSTdnNWlvZER5dCtBS0VQMzBJ?=
 =?utf-8?B?cGZ0MnEza20yZDVUZmphRDVpZVI3bFZYYzMrTURPSjRIbFpqSXkwTC9oNm42?=
 =?utf-8?B?dTcyOUlXalIvbmsvN2NkY28yY2doSnkzSHJkUGF3VTNqQ2NSOVJRcldZWEcv?=
 =?utf-8?B?SWYwNjRhVm5vejVzUU9xSW9NUjFuVDVWclEyVWthVDJ2VTNUQmwramxlSGt5?=
 =?utf-8?B?VEdyV2w0WHVjbm8wOHc1dzhtN0FibHlYWkZKRXBUN3VCckt5V3VkNXQwUnA0?=
 =?utf-8?B?d0xKUWV0bmdrZmtaMVF0d1VzSjEvVkthcVBlLzFsWEhRd09Mb3N6bFo3SGhD?=
 =?utf-8?B?UjZOZHgxYnN3M0pGczdLVllybkJwZEtzQmVzaFA3TXhNdlFJdElFV2xnVnpO?=
 =?utf-8?B?OHU3Lys1YmJSanJFcitvNWJmckdDbXhXdTdpNTFIUlNrUTA1MFNmM2I4SS9m?=
 =?utf-8?B?ZnV3RXVxRHAwR1h2SU5SUTA5YVdVOUdWcVVoRVVCSVR6MGcvSUtKUHZKd3Z1?=
 =?utf-8?B?dzJRTVJmeERLcVRGN1J3MkVCTjUzMU4yOElCaFY5dGtCaExyZk8rTnU4RXN2?=
 =?utf-8?B?eGg0TFNyYWNqS0Y0ZEcweEptRndXaEZxRlYvUXRWQlQvV29jYStEQnZQNDVB?=
 =?utf-8?B?SnV1RTJlbThzbjJ5ekJjL1ZodHdLd2NrWm94ZFhPTmt6MVpWcFFaNXdEakl4?=
 =?utf-8?B?QzF0TjhnYjJhQ1d5NDhOckZmSVJTRnpXRnJpZEx1RkkvRzNPRmRMVitJY0xq?=
 =?utf-8?B?TG5Yb05EcmhNSWEvK0lIRXFZd2p4cmtEd2ozTkI2WkN5dCtMbnBQNTVCakFy?=
 =?utf-8?B?UFNOUHg2eTBFdThtcGxRZFBOcm8waDgxbERQQ2JlZ2l5ZCtVbWZuNjNhK3Fl?=
 =?utf-8?B?K2xLb2hsUzZuUmpEa05nZU96Q2NhYU5tcnZtVEM3MGlwMVU2amprK2RkQzZG?=
 =?utf-8?B?M1FUTnhad0hhemhBRVJlN2Fua2NXaHJxbmxLdVA0SStwbUVEaWdPZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb984c24-b4e1-4a82-57ef-08da4ac5d189
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:44:31.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpTkBjq8IHKfDb+yIEXp5e095T68aqqZrQlrzWKH9/EJvRK331zhponCw3jmhBMcRnOyjj9EHDPkrY8h/dEbuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3934

On 10.06.2022 10:33, Michal Orzel wrote:
> All the members of struct tm are defined as integers but the format tags
> used in console driver for snprintf wrongly expect unsigned values. Fix
> the tags to expect integers.

Perhaps do things the other way around - convert field types to unsigned
unless negative values can be stored there? This would match our general
aim of using unsigned types when only non-negative values can be held in
variables / parameters / fields.

Jan

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -844,7 +844,7 @@ static void printk_start_of_line(const char *prefix)
>              /* nothing */;
>          else if ( mode == TSM_DATE )
>          {
> -            snprintf(tstr, sizeof(tstr), "[%04u-%02u-%02u %02u:%02u:%02u] ",
> +            snprintf(tstr, sizeof(tstr), "[%04d-%02d-%02d %02d:%02d:%02d] ",
>                       1900 + tm.tm_year, tm.tm_mon + 1, tm.tm_mday,
>                       tm.tm_hour, tm.tm_min, tm.tm_sec);
>              break;
> @@ -852,7 +852,7 @@ static void printk_start_of_line(const char *prefix)
>          else
>          {
>              snprintf(tstr, sizeof(tstr),
> -                     "[%04u-%02u-%02u %02u:%02u:%02u.%03"PRIu64"] ",
> +                     "[%04d-%02d-%02d %02d:%02d:%02d.%03"PRIu64"] ",
>                       1900 + tm.tm_year, tm.tm_mon + 1, tm.tm_mday,
>                       tm.tm_hour, tm.tm_min, tm.tm_sec, nsec / 1000000);
>              break;


