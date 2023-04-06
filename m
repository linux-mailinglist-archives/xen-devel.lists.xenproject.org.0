Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487DE6D99A2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 16:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518907.805911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkQba-0001Fy-HA; Thu, 06 Apr 2023 14:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518907.805911; Thu, 06 Apr 2023 14:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkQba-0001DV-Dd; Thu, 06 Apr 2023 14:28:50 +0000
Received: by outflank-mailman (input) for mailman id 518907;
 Thu, 06 Apr 2023 14:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkQbY-0001DP-VW
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 14:28:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57183b7d-d487-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 16:28:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7764.eurprd04.prod.outlook.com (2603:10a6:20b:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 14:28:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 14:28:45 +0000
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
X-Inumbo-ID: 57183b7d-d487-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9tlqmYMa4a+dzcHIM/YNWEvRKX1eO6UviwX7D7S/mSeqNwBHGQIBc9TVNLjnilBeqvVTeQmzY3BTRfmzKnBAYiJm5x0jgqnv1+BGi7LBll58f6XL5+z2MXCtcvrq81TBakAkhVwddhn4vwvpBSbJn7D2Zh4yNLF24YvxV390UCc2FJGXtEw5In/F6oIBpsxajZ75Gp+yi9HloH8+k4T/wU4/HLENwZXSi/pSDhngSIl53CtV+lL/gOtF5P9MAalxqdVp8KpFR/rWTAakl/0iQ9hfIxQraWn68vNy9+HreUKqYNvVNCfYeR6ThSxomFLRQkKhslddZxzvusjcxqXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTFReQIaRtGB9vNQPjk8BpE+DVD5nFEnKxcMO3XVxCs=;
 b=i1gdlzc4dD5l57hRl4NBR+6KR2B5Kevn2va713rycesXIsTn7jpHLFl0MNc4w7e7GOZHVdQHe2lBlkhafS9Gw6neYPERdxChPaDF/HAbXvTaKz9ihXPTY3Ooa1ZLn9AhwKdMASNrCIhE7kSeZyqsvtpzZAuNzcPB2btMq32NUow4KF0vXDjU9RRLVs4nW8y4CHCAG5iJQMhEbD+lO0efkpb0n/WhcwHLrOcU7jhgkWIvRss1RGnJhltYF8yDSAyzMYDgRhPso5iCrH0FmirlmnrN+LLIjCnExV8Z5N79SSc0wzNhj2ABRh9uypQV0hcklbBWuG2lXVEnUDudkU3efg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTFReQIaRtGB9vNQPjk8BpE+DVD5nFEnKxcMO3XVxCs=;
 b=M8KqmYvYOCIqx/TaHCcmZss4Iej05KLuYXEPJsGpTI/To38Ljll7jPrGG0rU8L4J23WGkITJf+x1A+6injV1ovT5Ds3uetKWP6eav8pDhbyG/VkBzaMk7TQLWFG8SSUjNgOFC24lL3D/DhE+jROiNmKbWSM5r3OcDRho0bYMBXFyz7pFpCBa1qaCukP4SkEyx5sqUPjaDrdIR6i6vQ2LYIQ5U8+qKkfcZ6Lg1HgFvcSG33VuH5r16LKnHjRMycLByvI0NMMaKrGi7i1zYbqR34kZcJUXd/Yo2UkxrFFdVPKIwIi0b9yX9oQu+ezgRG6yCb6vYf3QQwSugWdFQfwsIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9edbf4a4-978e-e1bb-43b7-971bdab8f41c@suse.com>
Date: Thu, 6 Apr 2023 16:28:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/svm: Provide EXITINFO decodes for Exceptions/NPT
 intercepts
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230406132708.2251000-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230406132708.2251000-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: f821e5b6-9f97-4528-6bd7-08db36ab3a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bd1lfnTTcgKnjN7sOq4qn7Y3yQcK549xz6P2P0dLbp4bdWMr1reLNg0UtcZjVv2lb+y6Ugx6b5KWXey+qkqbzAV4jSai7EidCL/9nsZs5OkgBDCyDWxhxaihj8sWUVnjnxU3an3uULHupFugc2h43ktgV7RGPQJCrYc/gUTFNl+qYd70F7Pyw/6DY772KRg1sGhoVS4TPO9uRr8j6XPXzzRciUT4nyW99i39FmXZ2M0MBMS3jvN26UYxspgEgyHA9HXl+aOe5gtIBqzmsfAl+zr2cHvPSlfPZQPRVdYmV0pT+4iWH2/9VAXmq3zHrfLfy/2S6/G6GUtqV8Y4Sry7PAXzCT/x/C3sQQY31RonqCdkCLmvKH2e9l6D3kcNEAEidTp5hBuWTJBohXrrXGpoEdm9yV0b+texQZPPHJbE2Vlnl9n6eQAW8TdWxWaxTT+nap8MUF4gE1Ux2+Qov2Q7/GyvVwTr40h+g0XWIJ+HsscV+wr4+YB0OTUER9AUklX6V8lX3qUnvarHC0N26C55ZucP0ofis+jIrmH2S/p1xj+M4cqllf5yKJBxu7WrRfN44ixC9p5DAwStDZ4pDVwDsjhBgH0QZRfTaFQyuAh8haemspgH5hT0GI9qVih7fh9GrmjK2i8fdKGHMKuV6F+S9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199021)(2616005)(6486002)(478600001)(316002)(6506007)(26005)(54906003)(186003)(53546011)(6512007)(2906002)(4744005)(4326008)(5660300002)(36756003)(38100700002)(6916009)(66476007)(8676002)(66946007)(41300700001)(66556008)(86362001)(31696002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bThMZlZMaWxRd0FHM1hwNXF0azFZRGJDaDI5U3FuL2NRcnVRNkJrNkNsYWgr?=
 =?utf-8?B?YWNxMGc0aG95SkZWNFk0d1ZwcjdmbGg0djYrM044S0lhdldEeHlnR2NteXY1?=
 =?utf-8?B?QVU2dUJVVXFuN1I0VHdZZlZmWU9COG5KRkdMZ1EyVDJKb205YVlXNkVYcmNy?=
 =?utf-8?B?NTk3bDV4VGp0KzN0UVpxcEV2ZEhlNFRFd0NGT2FlSzIzU3lhaG43S25kUzl6?=
 =?utf-8?B?OUtwZHd1TXBjMStqZmUwZFMxZ2dlSXlxcTBrMUEzZTFMQ042RkxzN2pkbUtx?=
 =?utf-8?B?QzM3OEV1dmlwaEN0SFFnM1k5K3BZT3hMRW45UnFMRytGSkRmWXZ5MHpWVWVO?=
 =?utf-8?B?eGxXODNWVS9STUF6elEva01MSU51dkpMTURZS1l4dDl0REYybWJaa0d1TGpZ?=
 =?utf-8?B?UTYvSW1KSytOdFhCNS9CV25WSlY3aEcxK0dyNWRsWXI5ZDg2QjlmN1IzdzNa?=
 =?utf-8?B?NU1CbXNucUZnWGRqNklFKy8yN1R3bW9wbCswOEZOMWRJQkRPTGRZYWR1L2Vk?=
 =?utf-8?B?cnRPMW4vWjlmL0NCUWREUkhIOHlxa0dOeTJkWi9HVkhHeGRwMTRYcWQwcWlx?=
 =?utf-8?B?TElIWTVGU0RTQ3dJZTgzN21OeSt1OHVyZFY2MXhuK3ZDTHlsYTFtOHMxOGJT?=
 =?utf-8?B?RWRMZGM0WTlQZkVVNjNVazV2RUN0dzZKaUtNU2hYTVJWNmRKSTNHQ2R4SWJi?=
 =?utf-8?B?cEdPSWlYclcxTGdJOE9yWWk1ZmdFcWZiUDZXZzBId0pNL3VyR1VoMXV2WVR3?=
 =?utf-8?B?T0xGc3h2NFdJMnlaYmx0UVZWL042OG1NLzFEYkcvNi9tcVBKblpxRzFnbnhi?=
 =?utf-8?B?dU5GMXMybjF4Z0lObTFvQWNaZFlhdVpMVVIycDhpb0E5bitCRXJha3kxV3g0?=
 =?utf-8?B?TUlITGZtVU5yNXlOcEc5YXN1TFJJUXZqeW1mRnlFZ3UyRFVOUjN3YjlhL2ZE?=
 =?utf-8?B?eUJ1ZTBvTXBUdWVsbW9sNy92bThES2l2MmhvTmhiWDNRUWNzeDBzQmdsVnRI?=
 =?utf-8?B?Y1l0NVpNWFF3bmRqQWpBazNZckNsZkFWUVhlT1RueTVOb1MwMFNGWmN0ZGYw?=
 =?utf-8?B?UUVjWmI2b3p4TGhadHNHRngyRXFEb0JFbUVhNVU3ZTZnNzd0WkhKaDg4YkZl?=
 =?utf-8?B?QWlYdnEzQjZUN2FNMTBqQ0pIMzZrZDUyaVVWNzI0MCtoUUx3b2xSMUNXeDRl?=
 =?utf-8?B?YlYxYlBwVnp0S1hIVitJR0tQQlRCdXd6d2ZTelh2S2NPeVFvbVlOaXN1U1VK?=
 =?utf-8?B?QytSdVBaci8ycXNGRVNBdVdKdTVtY2hQSksxL0tkc3FMN0VtTE5sRzZSQ3E4?=
 =?utf-8?B?S3Z6RWlwSkRlV2NsbzhmTk5reTA5Vk03d0lENTJYUHNLWkE5am5sdm1QRWQx?=
 =?utf-8?B?WmIrc040VnoyMGxjdExBeDgyM0I4WFFFUTRzMFM1TUljOXdVYXptcXlkSlJ6?=
 =?utf-8?B?YVd4OGNKb09ZNWFaaTFneTFNNXJVYlIrWlYxUUNmRDJnZkRxSlBaNy9KaGo3?=
 =?utf-8?B?T0lTL0J5TlpCTndrUU96b3FqWVpMaCtaYVdEMFlhNW1yTGRuQjRGSDZINzBv?=
 =?utf-8?B?OFNLbStybm9DVnlsMnhxaGRrZWhSQkJ4NStmOURGZS9hZUJvMXVwTGJSeGI4?=
 =?utf-8?B?d1pVUzBQSWt2VEY4TVNab2dPQWVEbVZ0bVlyZ09NalJIalpiY25RVTROcVYv?=
 =?utf-8?B?c0lyV0NBbFNreURwajFLd3NHUWd5ZVJCOUhnTU11N0c3a3puYXpGVGk4bDJM?=
 =?utf-8?B?SE95RkNENDU1OE5vT3ZPV3B2L1dOOXVBdW1PUTZqdys4VjI0bmh2clk5VTY3?=
 =?utf-8?B?c0x1SmJPVHRFUEhWWExrcDVFUTlhZzN1U21nZlAxZUIrNHUvLzNhNWRpZTMz?=
 =?utf-8?B?WUJjWlVUNEdsZ0RHMUlzSjdIRWd0YjM5a3F1elhYLzR4Z3R6d1dlMUdKdWp0?=
 =?utf-8?B?bmxaOERmdmI2aW9HUDVsTEkwU1dLRXZhSm1vZ0k3QVZxYnpoN2ZEUkl4cFNi?=
 =?utf-8?B?ano5NGM4SjZvcVJsSHJKWnlTMkgxNmRkclpJNk8vd0lndDM5aCtuV0Y4TWJH?=
 =?utf-8?B?OTVacnpsUEovU3UyaEY0elFXZjh6WFMyTjgvQTFwMDNWL3NlbW1HVkQwclpm?=
 =?utf-8?Q?ss6eQvwPs8odul/QRvzgz+kKI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f821e5b6-9f97-4528-6bd7-08db36ab3a66
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 14:28:45.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3Hjug0Bdx1LReMT1M4mN+K1gr3cahc2K9MIHw7uxlWTLCqapfb6OzB9p78tbp3c7YSROS5R9TNQPekA+lRtYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7764

On 06.04.2023 15:27, Andrew Cooper wrote:
> Exceptions and NPT intercepts almost have the same layout, but NPT has bits
> above 31 in the error code, and the name for exitinfo2 really does want
> distinguishing between cr2 and gpa.
> 
> In nsvm_vcpu_vmexit_inject() rearrange VMEXIT_NPF to fall through instead of
> repeating the exitinfo1 write.  Use the fallthrough pseudo keyword instead of
> a comment.
> 
> In VMEXIT_NPF, as we're editing the printk() anyway, switch to using the newer
> domain_crash() form.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

with one remark / suggestion:

> @@ -455,6 +461,10 @@ struct vmcb_struct {
>                  uint64_t :59;
>                  bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
>              } mov_cr;
> +            struct {
> +                uint64_t ec;
> +                uint64_t gpa;
> +            } npt;

Maybe better "npf" than "npt", as it's describing the exit/fault?

Jan

