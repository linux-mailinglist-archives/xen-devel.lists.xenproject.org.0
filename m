Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3326758DC3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565594.883868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0fs-0007wG-N0; Wed, 19 Jul 2023 06:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565594.883868; Wed, 19 Jul 2023 06:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0fs-0007tj-Jm; Wed, 19 Jul 2023 06:28:36 +0000
Received: by outflank-mailman (input) for mailman id 565594;
 Wed, 19 Jul 2023 06:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM0fr-0007tN-Fj
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:28:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6d6919-25fd-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 08:28:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7924.eurprd04.prod.outlook.com (2603:10a6:20b:24d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 06:28:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:28:32 +0000
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
X-Inumbo-ID: 7c6d6919-25fd-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fT74U3fHwWg0goneAtyBljF+ZgMUpWHOVjWdpJvFfq5oL94HuozhcM0aQLCT8I4PyD+RZI3oyliKjAGseNXNP0DkFrusmtcSo3Y12sIYL2dZ90jg8nDCGMxQzqMRbv4+9j4gcWWdCjvpeJRpyUIVo1ISF9VKL5Qq+L1FtSws62MkRo/wnHRTR33ecfpbn5G0VGkWov8SJlAu2SZsd0m2xF90Q0WFMhdioXSEc2xtmwABHqldiJ/2xUzZQJCBgZ4OZf3U8/X+pJmrKhpeTrAv/RerL/M/2PfC1hGRFknTW3nSACOcDlJUE37gWC/g19q1uZLmVLtEKYFvvJrIlqQu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cnti6WBD7BbuSt64XJmyACwwfLUPvuFISE9Wd6tksE=;
 b=mdM2Ei4JVwF3ULSRo7jmrpDqGtnoX+h5sphynOMg80VZGqGiAOeBxVz5tfgphhKkP3FiuZqiLnpzKsUme1q/mIxuEw9ncdMUgMZDnx7rEq3+GB8D728++sobiQ3Wb00coIhy562ysILhlfNFwvHCVrJb975nHPl+6nhr9hLl6vmSLaNt+HhuPL2Fv4ag9uWRGqeq/9U7ht8xIQgfmvXKK+LE4nd22QsCo/ACLdmT0DQqZfQFPfmSuP3IsD+S/rnjx0OSGtSnILbwWzNum8INtqKTU0zE/37PGSxvNseMtJWCUnwblzvgcTlNI0APeL437NmkBFuwHRop4HSz+4itKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cnti6WBD7BbuSt64XJmyACwwfLUPvuFISE9Wd6tksE=;
 b=TbnGQDnm+xkPBXkGqkmDJrJcVIbm85PGlKr4l9m5NEicrLFZbJcMjgoEdT8uZ9rSC0xlX73UPD2iUrutbrLOk+ADHYW+q1HjaZHIYT+YD6DoQ0Z+OZWlEif2Ibmh718Aivjc/BoxlEqNjB7h8CrDOU1YmSPgeptVovOGEmf39eUC7RUs2+UmegQm482lBS4SqUM4JDSbl8rKHirktu8gPdBYq31VDfSZhKaF3PPg7G3wB/RTdbgeTmhHxaU1xojMU8q/ZkHWYwCvkomArWY3l4az1vRdAqO3PuZm5+NwAyN1cP4inUzBCaPcL6JHrl7UZaXvWIsvx1tXVqiCaK5kTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82d5106a-0fb2-bdc4-7fd5-315287220f73@suse.com>
Date: Wed, 19 Jul 2023 08:28:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/8] common: move a few macros out of xen/lib.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
 <109efb43-a519-73f6-2a26-2b420090ab2b@suse.com>
 <2da1f2f6-b039-96b3-cb79-f813e6de782e@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2da1f2f6-b039-96b3-cb79-f813e6de782e@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5395a2-8c12-49be-791e-08db88215f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GWyj4v8sJH7w94yw2jzgxpOr40nWSJpquiDZDzAHzpnjmTbHSgMrw4i7ATdNoYA0H7sbz1HjzWugPb73xV0ZiKT4JnlS6NlpC4lyZH8XyBZCis1QG5jjS1xMJ5ldyOoMwFcctkVlnedV1RKzggdH3rGZrKRrZuaHtqVxgFaegKEJofROaox8MEL+W0EoLx8+pEVZBNijqaSNWWh/V9WU42wFSGINkM5YgPJ0ei34Ies65/rNuXYtASVAVfYfh9PHVumQpSNBtfMrMJGTUGdJLLDcZppkJaCsrPuHR0FqmErLAzz3ncD6WDOdnqNOb9+02wszaKSW66ejd8nKGhXQaeiwmlHkX+Mq94zdvVWRVdSfAxyYaBEem/aVrszxh9QRr83grHwOWsWhMe/bOZ4UMTxGrWMqbGX1+CgOP2fRTSCeKZR/40oyiWuyUyBV0vJ0HIOJ7QDNz5H3Pza/w6frsDGaa3H51X7BTcpehEB8SuTWZxc7dHo4sLuTB/Y03Djr9n8ERaUefT2fw3w5vEgb8WMq2vX2h8QKmVQRWf37u3/ShA1zvgBIhqfm8JS4wZ3VL5N38C0MDCWpOmfxoSYRrfAEfGiC7aQhglW7z5HdCnv1AIt0wOoHIiYL9epLmsKJgEt9gZh/y73i0ctPt3cmyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(6512007)(53546011)(6506007)(36756003)(38100700002)(66946007)(26005)(5660300002)(66556008)(54906003)(2906002)(86362001)(4326008)(8936002)(6916009)(41300700001)(8676002)(316002)(66476007)(6486002)(31696002)(6666004)(478600001)(2616005)(31686004)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWJyakYyQkpQbjd4OHZDcGR3UEFvVWJoWHFrbVQxTmVib3VBdlVDWXp2a3ly?=
 =?utf-8?B?MnhQU2hhWWhGWGxZcnlJZ2tyRlRoNXIyMi9uMVU4MU5yODVYUDhZRi9IbUVV?=
 =?utf-8?B?a2k5LzBUTlJOdjk5NzFGTXFGUEJQVldtTS95dU8xQlNYWnRTMUF0TXEzQjdo?=
 =?utf-8?B?R0lWVzFBL1J0cHQ5VUVCdlpZeFdBT1hpWnMrR09mbUIxcHFtZk9xelVqSG0v?=
 =?utf-8?B?blRpYjNiUHpVUkNUV1VlVXQyanBiem1WUnNxNVFhd1U2LzhWaFZyNmVuRGZy?=
 =?utf-8?B?VFp5N0J5NVFMSEZYTm0vSUxSenZleU9pWGVRMlB2NUxJR3NtQUN5cEF4N3lF?=
 =?utf-8?B?VnNUU0pjclFDeEpOYldTUkNrOVhqNzFLT3RSYkhaTkZIUFp0cXhDQjZ3Q1Y3?=
 =?utf-8?B?WmR4ZGdNSWFKUnlISm9hZ3pxbUtzYTJKUHhrSTc1dmhsU1Izb3JZY0hWeXdS?=
 =?utf-8?B?UGpPbk5SQkFsUGhkR0xSd1FncUZkM1JtS3Rzb2hsc0o1bThlOEhpeE9aeGJO?=
 =?utf-8?B?NlNZaklQL2xBbUJyeTJQbkVQQ1NraGZpMFpJN2dmY3hSYmtKcDJnTXkwNGhQ?=
 =?utf-8?B?ZHQwWk84cjRtUVBDeVVpc0I0eW92RDl0K0FMdlFObUZDbXdUV0EvY1NMcjEy?=
 =?utf-8?B?K3N4N3Nmbmx0WStialJwNVU5V0I3bzBRUThlM0FKZ2g1VStRaXBjRDAwdE81?=
 =?utf-8?B?b0xYMnZVdjhCeG1jb09NNjZZT0FzRGErTXlLLzc0QXptR3M5aDlMc1c1VUNa?=
 =?utf-8?B?MXZvYk1qU2dqd2dvZ2xaZHZyaFkrcktBbk1FUlRWKzBUZGdVMldzVnZmc3Z1?=
 =?utf-8?B?K1ptSkFqWTBGNnFtNitzNUdrNWJ3a0dlbkNYUE0yZmZVYVlnUG9NVE5XNFNX?=
 =?utf-8?B?Y0xqMXBlZmVUY3M0eUovTUdGNVhpcGpPWDllRldGSXJJTW1ueHlIRWpmVzNY?=
 =?utf-8?B?Um5XMnlxSHFid3hpOTY2a1BteTNTOFNIY2I4WWpJQWlDcjVHRmovcGtjWEhG?=
 =?utf-8?B?NitNUXRia3pxZVNHaGgwTkdyK2hqN1JtNU8zYWdsTlNRRlVQb0xDUnNHejN4?=
 =?utf-8?B?Sll6OHE2Sjd4Qk9Kb1hvcE8zT0dJdysrME1FUW40cE1CVHlqVHEyd0oxS2tN?=
 =?utf-8?B?SVhROW0xVXNFV1JVd3grZ3R2RHMvY0ZYN0xlZ0JHSmlrOUxaM2k3akFRNFRi?=
 =?utf-8?B?NXU0Z1dLVUxXZG5ETy9XcGxxcElpcjNoT09RMVFOSDdhUVNad21jWG9YQTZJ?=
 =?utf-8?B?R3F3V3c4SXA2V2hJbzdlamwvcUp5aWQ5YkJvT0U3bUppT0ViSm1HYjhlK3hS?=
 =?utf-8?B?UUZFSXY3RUwwMjZzanJJaFVKSVFqZGgzandtaWVRU1dEclBhTFFybjljdW1r?=
 =?utf-8?B?VEEyaXJmN0NPNFJ6dnljUElRdURpYldtK1B3K2wzWktpTVJHaWhWcUZWRmc4?=
 =?utf-8?B?a1lEd2pVTHBwaGdXUHl6VlNGMzIzMUl5SmZWRmg2aWdmT2lMendoZENYQTky?=
 =?utf-8?B?OTlBekE1cG5ZSVJ2bi81RVVvbjByY2RwV3Faa2RlaWlHWExMRWpwM2t3L01x?=
 =?utf-8?B?WVJBb2JHU1U2QVVFcWNsTTZLL3lFVnlLWDU2T2Z6bTAwZW96Q0hzMUNTSlR0?=
 =?utf-8?B?V3l0YTdGSWN3TTlwOWZRV1o0aS83Y0UzSGZRY2FzUm96Z0tHSFpBNXMvcGRF?=
 =?utf-8?B?MEZyWjREU29aTUpBTTJrbzJKL3R2UGZlc3NiYmdQNzFlT1FNNVRmdjBFc2lq?=
 =?utf-8?B?OFpqQXVhaWZUaGVHV01oNS9pdWYzOUozaWliNktJVEZHOTR5eFNJYXM0bnlC?=
 =?utf-8?B?Ym1zOVBaUVhaSUpxQnZKUnB0K2o0b3lZRGphWGFOSjRmYXl1VFZqS0hTTEFK?=
 =?utf-8?B?RU9tM3BnMm5DZFQ2enVCOStzZlZ5MzFaQWc3Vm12eEZIUGo1REpnUjRkQnlp?=
 =?utf-8?B?TGJDRnBkeG96eHRjNnhqMlJOTHRwbUo4eGFFNUdTaG9GeHJXMEgwMVYycTZ0?=
 =?utf-8?B?cGt2SnNjN2h1TXVYUXdlRDNha1BVM3FLVGlKd1E1UjNNMFpObnZIMXNLOWpk?=
 =?utf-8?B?WldDM1JYVjNXLy9zRlo3S0JTUWNNeWptVXBybis2aUJldlF1ZCtKaUZwUDgv?=
 =?utf-8?Q?6VFXDIUirL0iwlMiv01/cBoNt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5395a2-8c12-49be-791e-08db88215f7e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 06:28:32.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y80MC5cG1yzydAAHtNK/5Q6b0KDCvUD4HqcZifWfvkPdODZ6ezg5U2+0/ru8vZcsZRgJxviLxPSGrmDUXx38Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7924

On 18.07.2023 21:49, Shawn Anastasio wrote:
> On 7/10/23 3:51 AM, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/macros.h
>> @@ -0,0 +1,34 @@
> 
> Should there be an SPDX header here?

Probably, but I wouldn't know which version to use, since lib.h doesn't
have one either. Not putting one there leaves things a clear or vague
as they are for others without the tag (and without a full license
header); putting one there would firmly state something, which then may
be wrong. Therefore I think this will need sorting in (more or less)
one go for all of the "license-free" source files.

>> +#ifndef __MACROS_H__
>> +#define __MACROS_H__
>> +
>> +#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
>> +
>> +#define IS_ALIGNED(val, align) (!((val) & ((align) - 1)))
>> +
>> +#define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>> +#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>> +
>> +#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>> +#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>> +
>> +#define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
>> +#define count_args(args...) \
>> +    count_args_(., ## args, 8, 7, 6, 5, 4, 3, 2, 1, 0)
>> +
>> +/* Indirect macros required for expanded argument pasting. */
>> +#define PASTE_(a, b) a ## b
>> +#define PASTE(a, b) PASTE_(a, b)
>> +
>> +#define __STR(...) #__VA_ARGS__
>> +#define STR(...) __STR(__VA_ARGS__)
>> +
>> +#endif /* __MACROS_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
> 
> Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks.

Jan

