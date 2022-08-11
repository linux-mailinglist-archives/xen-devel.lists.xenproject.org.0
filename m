Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364D58F77D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 08:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384148.619432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1Vm-0004z2-RG; Thu, 11 Aug 2022 06:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384148.619432; Thu, 11 Aug 2022 06:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM1Vm-0004wp-NO; Thu, 11 Aug 2022 06:17:42 +0000
Received: by outflank-mailman (input) for mailman id 384148;
 Thu, 11 Aug 2022 06:17:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM1Vl-0004wi-95
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 06:17:41 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50066.outbound.protection.outlook.com [40.107.5.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d41e808-193d-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 08:17:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8590.eurprd04.prod.outlook.com (2603:10a6:102:219::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 06:17:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 06:17:38 +0000
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
X-Inumbo-ID: 4d41e808-193d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFfxjRZmrplYfR3emNxbaYMh6Gxm5+lAp1Mtg1zjXJOimuXkEQ6fUMVsqN1+e8lL3WFVzBM7pJyp6tkv0lioacQdZUULWyHNJwB4FQYs+dKskeLokjN7/9cKa8TMRPk87iJHTfFRBYDSlBuYycXOwKKwTFY60gGBirLJBc6UpfA7cxkNDryiJyCM+RP03RtPBLDb+IbLGQ+7RxgjdEUJRD+wRUgD71cclfRWxOfhVYT8WEnBVM/B3mhCdkr9/HgsnxWqPRrqww18GoXpuc/gmv7rIn8ETFmStkIxlfwfFUiQju7VYbGUuQNafla/xNcGi2myOLsMYI3UF+87ZHal1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDPgYLchmXejmk6IwI4ANwZAwXgkwnGeHSKr3HPchTI=;
 b=nCy/ZF8M83xvr4zNhWCSUXizGS/404JXGhWDImN7IJu7EB8SEkvKbb5Mj4L1xxS4qY2O/hepUUy+2Nvf3EQlFt4RkACMq0+9ym2a6F2sYVFKEb7REkX8IV3Uxg6hOUWrz2vnqz2EyXRyf+4NcMsGV5LLUWIlhpcbdYYR5UENURRP1+P4tDscpPJd6LGOzAlmFNXltqtj6YdFsYLOK/Y1FNCn0LX1XAyGQrTLoc96/2w/vL3ZXBoWYgmGVWZF/wF3rT76mIlOmtAxl2ZIeND0ABFLsdb22cdB5lAS7ACyOlzDBPFxkm0rBJS95Zzgqh8rVUyVMOgVbQ61Sg7Iiiu3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDPgYLchmXejmk6IwI4ANwZAwXgkwnGeHSKr3HPchTI=;
 b=fui3nUc4qAbVWYMmEMO0YditJ9ZUSBihWoCYQzghTjOmP83YoNcObZaHAox91uuEWCOk4gCb9I8kcpZG03Ka3spR0q2s/GBIMHnsAejpZlAh8HZdNa5vGf2YGvP4iYK/haTg8+pM5Arw6EeCykjYPjO6rupH/zKbD/cP5DemfDSFMCehqh7gwY/qY+25Wk/gglB2WVY2+53eQNoI4jrKQVgXMN2r0EJ9JHmhyNbRhU0hlDh4MpDPuwdWsMQNPeFG/DCGT7+rEvpFjzOVimd/TUaxlamA+lhOpBJzHs9l4V6e4w48E+U/KF/2Sih6KQ56m4IhHnIERHbk5PLMYJ2HKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3071efd0-b120-9c32-653a-465a53003a41@suse.com>
Date: Thu, 11 Aug 2022 08:17:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 04/11] x86emul: handle AVX512-FP16 move insns
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <3e7f95f0-fded-74e3-d4b5-da185a7ab8d8@suse.com>
 <46162a8c-d670-d207-d48a-3505e40a9aec@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <46162a8c-d670-d207-d48a-3505e40a9aec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee54232b-0cce-4001-efb6-08da7b613059
X-MS-TrafficTypeDiagnostic: PAXPR04MB8590:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pirj1d1LObYv9ow4vdAtjdT9V93HNL5ev08cIOVJuVtTx0omrwXWY9wzT5ja3X4jEKXlV/Qk5NuCpT6UMX5YAcE16gJsOOp1VklsmFlqn6BS1JTH67zR5rIguw7PqzylBmnEeEZST1rPh+i9uLs+vgazhEMWnelOK3pQNRAelsrIwhEk96MdphaCsuc6nypNf+dFH/BNheNNxT9yar/MUtW7mjHjzXq0kTqNVp0ySKipmuOSYMZ1/NNI/5nRlX+NVKw8s+ucDlRC9TghVfiBPuprLJp8nW1dvZcxUdM2W21WRBO7pmr3zTTV6pZzzM7KDAtp40Te5hk32xPzCxk09ePmWVcG4RuqwxZpiOEudq76QHUsPbXEACnM5Ja5iTIhbZ+L/ng/MdxK/3XG/EVy3Tn41FW+6JAH8K2cC4q6KB6DZCVmNQdTJ5+J3P5BSEG7QA2Qzd0Spb3Z2ka+d7pCQDrchoDGLBxI7vN6d5l+D9OcTfmmSRIGhxJwwzT/b4LJ2j1djKDLCcE6XMb9MvjdB6hBblFYM1VrT5Ce2junumWA1bb2/M3FSS5Hg2MZa1dmQwMnL/MYr6C1GD7y8/R1hxsEj58Onewx+OkY9xHCZthx2B6Nk7NNSAY8Ndu1HSe6uGZFyxxsD20Q4De0UuGXtGcUmpVxjfQrDkUFewSZO+//pi51aExs0i7ciY5Wa6MWlqK88AZ+kJK6VKJaUElhEXZAS+o07dcKxgw0D2FvCwZyYrzqhHpXidyn5Jdi1QYQe3bbkaTT3teADvm52F4+gScwqppTIYCCkrVX5MpUa9ouyXNncq/Qjl3AkylDuCWrEJbaGwEqwvFOyv62FOvzfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(396003)(366004)(36756003)(86362001)(31696002)(41300700001)(478600001)(6506007)(26005)(6512007)(53546011)(2616005)(31686004)(186003)(6486002)(5660300002)(66946007)(4326008)(8676002)(66556008)(66476007)(316002)(6916009)(54906003)(38100700002)(2906002)(4744005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEZPL3ZvMEtRWUt0L2J2cE9UOG5NU2Z2QmFhMWRPbldCN0F5Wmg3YlJweVg4?=
 =?utf-8?B?Q3lic1BVMjhlMDl6WDkyMG8ycDlVQjN1SDhUSlNYT0FwWHNZc2lNLzVPMzI0?=
 =?utf-8?B?cm5KcmRWK1lOZjVPa25mZllINUZ3RVFUTlRVMDNxa3RiVko1S1RuQ29tM24v?=
 =?utf-8?B?cHZDTVlqRnAxTDI2ZzdZbnZwTkVLWlpGbzh3U09YcXdDQm0xeHJDa0Z5Uk5Z?=
 =?utf-8?B?QzdLSkRKZzdQTVdEcC9INjNMMG5UZG9kUFFyRExtMkw0LzhnRnY3MWFYNm92?=
 =?utf-8?B?ZGdDWTQ1cnlnbkVhcGZ1Kyt3dTh4SHVzT0dJV0phT3BBbnJ2OWdPOGhzby9E?=
 =?utf-8?B?REFkcHFkSWVsU09sbFU1WnNJN2JXdWtZdG5xVEVVQUdOMHhQWHk1TmRYVlR6?=
 =?utf-8?B?d241QkRpK2JYYWhSckc3MGVCUitDV09jV1RCa1FldGt5S3RRMFVJT25PTkEx?=
 =?utf-8?B?cER3UXQwVjlFNnE2WlF3RGVqMFZyVlRsU1owaWx4ZUwzbGM4YTBPU1huSVhh?=
 =?utf-8?B?Wi91bGN5SVEwU0xReUtMa0FPYmZLSHhGOFBJMndUOEFVRVZSVUx6dlRUeitT?=
 =?utf-8?B?YUJiTi81S243blVFdmtFWVlIZGQvT0RVaWtWbDgrUG94aWhNUCtRSFBmUDhM?=
 =?utf-8?B?QlNJNkdnTGVEck9GbXV4aDI0REdVWGVOZnZHTVdvdWdvM0psZDBnVlRQQUYy?=
 =?utf-8?B?dWpqaUtYcEw3UGhkZXpxQzdsRmlkVjN4alBXQUJEajkwTmhjQVBuQXNTNVhM?=
 =?utf-8?B?S0xRa3pmN0JkNlFib29mZzRzdm9lWnpZS0ZzQ1RoTW55UHJJZkROVXg4TEo2?=
 =?utf-8?B?YU9lM0c1UndTMWQ5Yk9TZCtWNmlETmVUbHdRMTNzaEF2N0hyS0hmdVJwbFRJ?=
 =?utf-8?B?bUNlaGk1MituSHNjT0lZVVZDL1BtQUU4Y3B2QWZsYW1IM2ducE4wUk5qeWw4?=
 =?utf-8?B?Y25CYTByQ29vbGY3WXRDRUMvR1pwdmJ2R0FCdGFCREpZRG9yTElLMDlhZnRJ?=
 =?utf-8?B?T1c3QisyRWJHREhNL2RpWFF2LytObnRzY3NPL0wwc0QzUjhPQUs3cWEzSUJU?=
 =?utf-8?B?Wis2dmkydytGaFU0azJ4RE8yOUdmc0U1eTk1K3dpVko4TWQrQXN3VHJtR3J3?=
 =?utf-8?B?VlUrUE55LzVocE5hdC91WTZqblJybzNwbHdaUWJ4c29tb0dacWY4N01TMFJH?=
 =?utf-8?B?Ylp1djFpV0o0QXVDSngzUW9jeWcvdlF4NlZkdmhXajNrU1pNY0lvSkxvbi9h?=
 =?utf-8?B?cFR1S0R2QUxpWU0xMnIrajhJQ0QvYzF1TlU3bXZPUVg4VjNiQ0Q5Rll6Z3Jm?=
 =?utf-8?B?bFNteCs3dS9GZGpWL0ZoenVjMzA5WmpuLzRheml4ZTZQSjBGS1plMHRNaUJv?=
 =?utf-8?B?OTBWTDgyVHEzbGU3cENZQjZPTnFIOGsyN01HZ0tBV3RPNGRiWnAveGJ0WXVN?=
 =?utf-8?B?V2k4clBNUWxud01VS3kyU2hQS1pOS2xhK1FydWNCVHN6SUdHdElWZGdNSVUz?=
 =?utf-8?B?TDdYamNkalRlN2xOaUxDOFhCL3BYaFdYZ3pWU2I4dy9RRkVvRG1DellXY2ky?=
 =?utf-8?B?WGl6L3lkQ2VtenMxdlRZUmJ4YTZWNjYzQi8reTdtQzRVbGRRN0d6c3JUWDl4?=
 =?utf-8?B?OGpCYWJMU3h0Wi9XYTlaRU1KVDNPSUh1Rk9GZHZENXJJa2hocG9tSGdsMDVw?=
 =?utf-8?B?N3BHcjFxbnJITEpFN0hvUk1hNEN3cnBMNDFnR3ltc3lYNWJwOUhYNzF2Z2py?=
 =?utf-8?B?dDBYK29QZTlNcFU3dE1RUzZoUVd5TzQvMXQ4NXZlR1JnbTJ0dmhqeGVKRG1W?=
 =?utf-8?B?aUZ0b0RHVEIyUGg4a3I0TXp4ZnZTSHE4RWFsOS9paDR4OG9VVXNuRk82TEo0?=
 =?utf-8?B?b1JSNXZsMHFYY1lrdFJwTTVCdUxJZkZtSE9SeTNLTnZMTG5nTzk1aSs3RUdR?=
 =?utf-8?B?U1RuRURWa0E4TU1OMXVxVlF3aG5JYXpabzlWQWREdzRsSlhPRjNXWXFnZ0RB?=
 =?utf-8?B?WDhPRnNkdjlHQmFEN2xsVUx2MjZtUjA1Vi9wY3NxNWNOVzUreWlrMzBjeG1k?=
 =?utf-8?B?SkV3ZzcrQTREY1cxMHd5cHdWSWwyckJPWmZlV3YzaGY5QWs4SEEvTExDVmpD?=
 =?utf-8?Q?98SJXvpkBwQVv0a9mmbp19uA+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee54232b-0cce-4001-efb6-08da7b613059
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 06:17:38.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vT7BT0MkXIfxhVTJjqzgGsIQ1ba/WKE1BLk3Z57fzQHOAaPFdP42UsmCCG9M2J0t70YG16Rij0ixU7zdKZTcWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8590

On 10.08.2022 20:04, Andrew Cooper wrote:
> On 15/06/2022 11:28, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -585,7 +585,7 @@ static unsigned int decode_disp8scale(en
>>          break;
>>  
>>      case d8s_dq64:
>> -        return 2 + (s->op_bytes == 8);
>> +        return 1 + !s->fp16 + (s->op_bytes == 8);
>>      }
> 
> This hunk looks like it wants to be in a previous patch?

No, why? It's VMOVW which first needs it (d8s_dq64 isn't really used
very much). I could have put _all_ such adjustments in a single prereq
patch, but it seemed better to me to make such changes at the point
where they're actually first needed, to make the connection with why
the change is needed in the first place.

Jan

