Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D834966923C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:04:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476891.739312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFz2-0000zy-Vx; Fri, 13 Jan 2023 09:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476891.739312; Fri, 13 Jan 2023 09:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFz2-0000xX-TG; Fri, 13 Jan 2023 09:04:20 +0000
Received: by outflank-mailman (input) for mailman id 476891;
 Fri, 13 Jan 2023 09:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFz1-0000xR-Vr
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:04:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2052.outbound.protection.outlook.com [40.107.247.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42864f57-9321-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 10:04:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 09:04:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:04:16 +0000
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
X-Inumbo-ID: 42864f57-9321-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3Z99oOIQvg+/iWYUa00yVVIpSEWpgjmm+TB0v8EqQKCUpVZSIjFu2dGBcitcJpPG9+lX+4OUh2I338OhFQfP0aooxGgOIVuEIN6q8z5yWCMsCQ08CE0HlA94PGp8+MBElJIEDi1OvCrH+3zS8hTnARAgcgFxv3bFX2z+bti2M/b8esTXO5uWoOLK7nb0hwEM/Bw76s7xTHeQYhGga8Gq81ryfVhq3HlPD7VlQCoutY54HbP5d4Wcms3FTph/elB5KxWa2nzf+0ZPT3OlpAtJw87jBNw2JC1QJdxT7Dan1ElCctXGhGs/sKHQdG5kvi+Idg0TYd9WlWU2n9qk5ymig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikpCPRyBnn2PQBXs6zphf8ZMYfTSU9wBgd0hKfIBIVE=;
 b=miLAhXV4kWJ/uqD6Z5WrDDBjm7u/AN+zogL5m4M+g2G1jpNo7at8v8LAe8Y+VqpAQskEPsz4p0MC3AeJGlj1HPDEXi4BEjcgtKpSmxhN60QMFHpHaQ9W8gr7stPgOKyeB4C6hpLYMxX5fDyI11HaaM19axeJZ7Iwefc3o8Y/QR1WNUHGPMiUvBEG9hmCXMCulwfZ2blPAOslWIdzx27irc12+E96U1vFXe2r1dt3C7ZT++qEyHvQKFw9ROuSIu8vOlBjBnNXq9h3W5SyRjJjP3tIA5Bh/sAR3zmJUA4ma/gJWNaRckzjyoVueSXYIOMyDoSzwuE8bgVWOuIPORWPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikpCPRyBnn2PQBXs6zphf8ZMYfTSU9wBgd0hKfIBIVE=;
 b=yzwomtxAUiCecr9YolNHIKyXR6YVJ7eUZIQVeDT41/QTD1VefZmnJrXs4p1iX2knX4TbRrUfEFYYzTUpM8JwUDSfJxxrRDicB0QCabUnbIUt1gTBgoHYoow1zqiKIBGFi8z8WqIrc9RA4JSzMP8XlEBczBV7f5hBjU4lPkidyGzPKK3hrDe8JLgcruJca9jyWM0UHTUpLDw1d+q59Zoa0Y+ljsqikOqCgZat4JKUUMfP0IynuS8OQyN8o7LjFBFxy3ZJgmfIXgzSt8PgS58IcSFGyzNprDW5j54g1LbYp/HqAnzv33A133mz7RpUGZQomWRbLQM+3IheagoS/wNElA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <635fb465-9350-70b0-3c99-cbb87bea58d1@suse.com>
Date: Fri, 13 Jan 2023 10:04:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/8] x86/boot: Sanitise PKRU on boot
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-2-andrew.cooper3@citrix.com>
 <27d830b1-a32b-1368-3c0e-e5de15da5000@suse.com>
 <fcfe9344-ceac-aa80-404b-55fb7a75fdeb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fcfe9344-ceac-aa80-404b-55fb7a75fdeb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 938a1971-08e9-4977-3102-08daf545256e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	faTv1E6/ZC/DhrOwgDxA8a+p3o0XloAW4CeaD8pGxpd4Cx6lYVErYH+1HAEqfFob/aaizSC55486zkXnwS2tD7niqdqfDbYcfiLxv1XLp6QIriHfm9Rzr1coQLewVGOeRhUA1blW1UM8rUU7rMj6EnZ6vG4Y90oRIRtNI1jmJB0dey/oFx4lvs6AFNjka7xwuE2D26sdLy/L9O6UhrJQr+eIY+sxA8dgEBzj9jT74vBphggCLTIuhliadQpvxSA4wExZHUJtRPg136WwG+LD+/ynUaA8AIJhKbRiorxVKbrDWJj6ZUb5MwqA7p6om+h+sG0L5RY2jJEkzD3PRp5P37BhazVsMFj+52lsSvQW6NvBcrJj8P7cIpnd8rricEp7Nf1qFgxvhKoAuh+d/Kfjm15XJO03vBSsoOUwi2Xl6dv8rl9zcgqvG3LUSXw0fQuno/91C249vpct9fwSol4folUilC7A2MAk5TbGJKnXgy1N9h2VToEdjfoDym6TJu6S5Q4oXSrOV4veoBSHgAfNVSAdbxDO/M3pNsv2aL7uPY3aXgoDnx6qTOmSHl89UwIUPWV2JGYhu1QZLRhF3dL6uSil0KukrvsCjpveRFYAsIZRHEB6k61qgMH5ep/UPHosRZ2o8nFFh8t9VBErMBi8JJ8vFXEvF99k1WrZelksCaf5bqQ4fJb5+n3F2lj9GsFJROd6HHoqI1dWVEUvNlZCFgExr2H9ymgMWppy2ljUbtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(86362001)(31696002)(54906003)(2616005)(316002)(31686004)(6486002)(8676002)(6916009)(66946007)(66476007)(66556008)(478600001)(26005)(186003)(6512007)(53546011)(6666004)(6506007)(36756003)(38100700002)(41300700001)(4326008)(4744005)(8936002)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGlpeXZKaW5rS2VZNktnY29nYlB5TExjRjhZWFVsODAwdkVHbFUvVDFsS1hj?=
 =?utf-8?B?Rmw1UGIybHcwR1crY0p4cWw2Smx0a1FzWUpndTRIa21nbXFDbGN4K0FHbUFB?=
 =?utf-8?B?QWo5MGtQYXIrdHVFMXV0ODNINGk3bUJySmZHR2pmQVVBZExacDdWRVJwN3RO?=
 =?utf-8?B?UmNBRThwczY2Z2NjV240QjNDVUxHS0o4MkF1UGxKMTh2M1Bjamt5R1Q1MCtJ?=
 =?utf-8?B?TjdRWm1pU1dYYW12MXIxUGVWay9BSFp1dGRIQ0VtVmRPM1p0TmU1MS9ZbW5l?=
 =?utf-8?B?dU9MbS9sdC9za0lCbzZJU0M3QkpwWE13cmpGRzN6azkrSnJYQjdoWCtiZ2dt?=
 =?utf-8?B?b29rWFNBcUhoM2Y3S0twbjhZMkFLVkN0MDY0UWEwU0lPRTA0WjEwREhsRlZr?=
 =?utf-8?B?MXFMcDFpU09hUWtDQU5iSGxtay9IQXJtYUwzQTJrNmViSXQrVnlmUzlSOXp5?=
 =?utf-8?B?L0Q0RHNkRE4wNWp6K09Ua0czZUxxNzN0SE83VFY4NFBDak44bC9ZeERmUzZO?=
 =?utf-8?B?MHVLajFVdUhWZzBkZWt0ZlJ2d1h2N08vUUdZQVRlcFJFa2Q3WHF3MkNVZm5h?=
 =?utf-8?B?bFg5cy8vQ2RKUEp6WE5Yb1BKUVNHbVJPY3kyWUZBRGJrd25ZZ0NONXRTVUpS?=
 =?utf-8?B?VEdxSjR0VVlNZ0RDT0NHemJ2QkR5dmVjMzRKRFJXS2VxUXVGRXhURDNNazFQ?=
 =?utf-8?B?dTJ5NGhSbDBXWnAzaVRjS1lWWk9LbWZnL1d6MkVYTVZBNllBZE10V1E1cGsv?=
 =?utf-8?B?cFE3TkNoRUxSRkkyRlU4R0Q0d09qNXpFTFl0eVVTR0VqdDFrVDFlaGl2QUtY?=
 =?utf-8?B?d3RuZWJlSS9Wb0RJSkFtcFNaWFBkSTRqbjRIeXYrdHdBYnoyYTE4SlhQMURn?=
 =?utf-8?B?bmVQU1g4K3UwUjFTd21FSkRVV0c3VG5tYVo5ZzlXdTUwVE9KclBycmtXY053?=
 =?utf-8?B?VVNKYllCSDZ2N1dIVytrbzVqRFlMb3hZL1B5TEJZeDNvaHlSWGJXTnBvTmxC?=
 =?utf-8?B?NGZyblM1OFdKcGp5UFVIcndualBja1NuNmYzM1Yxc09EaTlJTWRmdmRhMHM2?=
 =?utf-8?B?bUVkek5FRlNyd3RiZlZLMnBIUnRDWUxESmM0cVdnU00yRmhHd2hQbmpNU2U5?=
 =?utf-8?B?UHJjZG90a0RsK2pOdGlQTFVrNVlYd1huKzdQUmVoaDdoNzdQdmFFZ3JRaVdN?=
 =?utf-8?B?UmxOczVVRWVOR2ZBb1hLcDJSdXRMbHZaY28vbUNJU3phT3VrTkFWL2RNeXNj?=
 =?utf-8?B?MjdXVVdkVHFPY1dQU1U1cWs5dFoxSjVkZzRGSXB5UjVUekpWTS9PaHp6WnVs?=
 =?utf-8?B?b1RvU082cFkrYkY0MkxnY0gvcHhWUFhVaWthVERFWVpXRWlrQUMrMCt5UTBm?=
 =?utf-8?B?T0k2QVFUYllNc0FZS0VtM2RWc1YzRnllZmo3UTNoZWhNbi9ockY2bGZhekxF?=
 =?utf-8?B?UXdYM29ITlFYbW5ockxVSDU1eHNNOVN2ZFVPUGRBMUZReVdBdU4wYlFxbElB?=
 =?utf-8?B?ZUUxM1hkdFJnTEdrdHpCNzJwYUU5c0ZwM05ZWXpoeFlzZmErTG9YdXdFZTBN?=
 =?utf-8?B?K2NLRXBEOGRST0s5YWNjRDEwR3VEL2Viam5jMmF6ZlNvc3BpNzNxNHA2TFlM?=
 =?utf-8?B?eFEvSEVaNzhPeFVVSURiS0ptOFpscEFEeUE4QzFJU0VIR0xvVFg2d20reXhx?=
 =?utf-8?B?d00yM2JkRXVCQ3dTR3pvb1lkVjJUWXQzSlBXQnp5THdWMHpvelE5dmNkUXVa?=
 =?utf-8?B?QzVkUTZsRUpCdmd0TG9kWTZvL3A2VXFDbk5GUXAzL0xyMFZKUUFhbVdLMjI5?=
 =?utf-8?B?MlQ2Z1pzb2VHUDlqVW8zN1BVTkprbWQwVGdZa09RRFZTNkF6b3RjbnZYbjla?=
 =?utf-8?B?NHRYTlhmVXk0QkhkUCtPdHhPRGE4c3hxNWxHcVNNT3UxeTJJWTlzcWpyZjI0?=
 =?utf-8?B?ZzJJSkk0Q3ZVNUx5aTROYVAxeWp1UHRjd1V5ZVI1QnVGWFpwL3dlK3phNXpO?=
 =?utf-8?B?STlTeDVyWWhQeDZYWkU3UCt3ZFlyNVI2dGFENVUwcjQyQ1FqN0FndXliYVY4?=
 =?utf-8?B?Mm1qZ3BkTEZxZEZsSjJGZmQ2RHdCMWtsYkdyTldTa21wWHZlQ3gyOUppSDVy?=
 =?utf-8?Q?NOAIAF2n90Z7iX1L3rNdMw3uN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938a1971-08e9-4977-3102-08daf545256e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:04:15.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wdfp9WTkKFcaZPyjRTrOBkFpx0kVavrIoglAWsSONpPEn88RD2/z7TN/ENDaiIw/4qFGiy9o2Sod4GILdYthFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902

On 12.01.2023 18:07, Andrew Cooper wrote:
> On 12/01/2023 12:47 pm, Jan Beulich wrote:
>> On 10.01.2023 18:18, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -936,6 +936,9 @@ void cpu_init(void)
>>>  	write_debugreg(6, X86_DR6_DEFAULT);
>>>  	write_debugreg(7, X86_DR7_DEFAULT);
>>>  
>>> +	if (cpu_has_pku)
>>> +		wrpkru(0);
>> What about the BSP during S3 resume? Shouldn't we play safe there too, just
>> in case?
> 
> Out of S3, I think it's reasonable to rely on proper reset values, and
> for pkru, and any issues of it being "wrong" should be fixed when we
> reload d0v0's XSAVE state.

Fair enough:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

