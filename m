Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF642760AAA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 08:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569452.890199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBlO-000515-Du; Tue, 25 Jul 2023 06:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569452.890199; Tue, 25 Jul 2023 06:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOBlO-0004yk-B6; Tue, 25 Jul 2023 06:43:18 +0000
Received: by outflank-mailman (input) for mailman id 569452;
 Tue, 25 Jul 2023 06:43:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOBlM-0004yc-Nc
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 06:43:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849d2c97-2ab6-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 08:43:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 06:43:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 06:43:12 +0000
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
X-Inumbo-ID: 849d2c97-2ab6-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mat5TGBb5kQinOncVWKIudZNpL+TycH+/i/PIkWw3joISboM29W9Hqw2tEKbMbEsNuwJxzf4+ic/39GEV1rS11cfMsaTiOSmnl5N8sjbPhZ41PG67rtv/d+/cZf5Ich86xnlm8h/iXCgrnVigH7k6xUXo6iv2MRNmx9EzY2iOH00sKT8mVcuY1YMyTQRDWN32sDY1PomN2A9h20lZvY4DyrJgAtcH0J0DlgpRwBxLNvWxYQS8paOnKr1Y7gW0S0xo6GyqQ/iW04aCgWH9naspcgEesX6WZsc6WAERnOHn/e+OmxYWd5JthBdsOMgYt2K3O0nA7DyeGgVKgg9RkP4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqWXcYfpK4ztMAnhZGAzcZh3J5RSTOKhD6SWS3tr2Fg=;
 b=hsfrEg0RTQxnorgBTl3olDY1jiDDu36/uKjV1XNs/+4ElhBdKx7d/yUc7IjKkZB2gB6BfVYU20yOSzgstes5uP42BBcX/flekDLztZKbrCJgwtVMQyYyhB5fOotGviqEJT2nqGdR4IgFcQRkle0Hiosy8cDP0uaUuDlhdHuuOxxPFa3nJm8wTJBpg0xaPfoAkAmmbRQd2pBX0JvZiDt1X+zGmD8h2dacfR0GAVkj9THYALkiCZxdZWnTj390WmQTyVowlRb/WXZqM9AYEPwfZeUb4KcaMCq9GOhUbY0a27XSj7nO8yZ6FJ5GYNBbV/7o7glNYaBEapZsZPpF4/4uFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqWXcYfpK4ztMAnhZGAzcZh3J5RSTOKhD6SWS3tr2Fg=;
 b=tHuFlvbrhR/CMRiRyKKjGcdBr46znxIJXjvF9L41kWTlr0GPzv6SvWWaYL0ucZSRHC1sjwSlbzojrk3kIbORtnFDxnJ6/tpQUollX7TtBrsAbaEbWVdTbfZlOHLiYV9QmwP40K9qCiumyr4ELsicljtZJs65Cl267mrwzWGE+qSD6QIRcLXQSr4VEd1yRkT431QG3XER2y0gmp5y0e4xDGwGr8MwBYRIDxrUqJr/Pi6Bd5SPyYwhSGRSZyOdjLXC+/zYBAQybwbzzSnaxxCqpFzNU+SwM5olWeKMDjOK9zN9SlLS4eK3IOnRWkflioPIZZCz4Xh466EwIPqWntm1Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <873d6b15-957e-9888-7a36-0aebacbf3666@suse.com>
Date: Tue, 25 Jul 2023 08:43:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230724165235.25262-1-alejandro.vallejo@cloud.com>
 <20230724165235.25262-2-alejandro.vallejo@cloud.com>
 <4a31893d-a784-ed33-bd47-5db85b3c02b6@suse.com>
In-Reply-To: <4a31893d-a784-ed33-bd47-5db85b3c02b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a81d49-32cd-4cbf-f708-08db8cda6a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/TUzznmo9H6WmBvlLmxKHCjhw+w5qJlNX11/3bHYalRvn34ipQMzw12Tx2v4laSyjpnRAY/WrkEn1iWpDrDZR8NbzDxUtSeZyYlrbAANGGuklrUb01u3BNpmytStDwqm0M/BMHkEZCGn9RNADoQE0YGpwUBEKY/nLJEkknnZCvnAdgcUaX8GAYoFhX8TUQ0KKaP/RM25/AANV8ravVq4iGT/UTlGsA7TmTcQnQlvltjSU+40DFiNwM0S/EhEyi1GFVGJPYr0wTeKefTcTtPN3piWUz/vtW0FaQDXAJICoDxd5IezNKnf6pnDwb8Gv5fiXUtKr15eaN9G8y9IdQ15x4w6mhU/Q/85hi8HzcvAYlYXa+Qwl4gYW9PeHTOXhz8q2VXeaPyu8qsjCH3InmbCHMQY18mdKQTVN/DThp49iUcU76FekUZ2dJXaO88sHe4siiEyVnrhQvRGa3b+s9jVdcJgfw1TK4KruYxYVVgrfelEpNV5DuYkgH4T6Ul3OuzZayeM4UhAsF4Owxg+fEskKy75oAdTqNBOczNm56ueO8bB9fBuQ5hWU/s0h6i3Boa6EQUHlJ2ngM1sDCwJ+33g9WnXMf5aQybTJ3jmurtJRQo9lnrnIowedz4EAMbRdS7h/uaCXDjAMzV5rh9D6zfuhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(26005)(38100700002)(2616005)(53546011)(83380400001)(41300700001)(5660300002)(66946007)(66556008)(316002)(66476007)(4326008)(6916009)(8676002)(8936002)(36756003)(86362001)(31696002)(54906003)(478600001)(6512007)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vlo5TFZjeWYzdkNKVU9DVkl1bW5Md3hqaVA5b1FpaUxSa0dBNWk0bkVYMFBp?=
 =?utf-8?B?Vk9hcEQzOUtpcXl5anRYaHQ1K290WWtqMVhxbnM2RnpTZ3VVcGVzQXpCdDBB?=
 =?utf-8?B?dEdwSzVibjhFM1VnVC9Ea09jQjNJbUYwTUpWNFBKRmpQYWI4SnpjQUcrRFpZ?=
 =?utf-8?B?SnIxRWRxdEJ0dkZEMWdWSlFONFJ0aExFU1NoU3VPWUQ0R0lyTzZXdi9kQ2Zo?=
 =?utf-8?B?aVNZa1h0ZzZiUzFyaW9aUzlmTmZ3bTJvU2Jja0dBUE5jaGxFRUdqUEgrZ3A0?=
 =?utf-8?B?TlFCZFptMjgwVStTeExiekN5d24ycXQzVzNZbXVQZEliWlNDbXZ6S0ZkNGJ1?=
 =?utf-8?B?eXNjb3JQNlNUVHBXTVJuNlRBaFNFTm9kT2UrUVlITGNxZnRITlVQY01mb1B1?=
 =?utf-8?B?U2VqcUYrZWlURFFFaTFORWNDRURCN2pqa2xNOXdiNTdPaTkvMVpiRDdpQ0g5?=
 =?utf-8?B?VmFYV2RFYXNicWs0UHp3Yjk2UHl4SERWRkYyZVBKWVlEN3doSmR2Mk5WY29y?=
 =?utf-8?B?aUwrN040UVhXL09kZEFvMWtaLzZET2RVb1RhQ2ZKN25aUkpsSWZsVG9sMFpn?=
 =?utf-8?B?UzFyNS9HNTlJUFlNYW9PcngvUmEvSEYwc2s3T3FWaExHRUtuUEozZ0JQcnVJ?=
 =?utf-8?B?d0pQRU9DYkpDU3VENG5rcVBzME9TeGtROERrbG41K2tCQ2NJaDFXU2VVWnBH?=
 =?utf-8?B?cFNzNjU3dnNOdC9raUI3eE01aGlWUFdlTXMzNi82Q1g0dytra0NNVEp4Wkh2?=
 =?utf-8?B?NHNZTlRkdmgwWjBrMWovd3czYllYNUZlSlVaaFhNcnBNWkpKLzZoc0FpZjdj?=
 =?utf-8?B?N05QV0wwYjJUTXNJbFdrOW15bW1nTi94L0FOTm95L09zVENCSkI2V1lnZDBG?=
 =?utf-8?B?WnNRSEVuZ3hZS25RcWhWdXlSY0RKbUhWRzFYZWZMTW84MFBHNGU1NkpyczBK?=
 =?utf-8?B?UHdsVllMZHZQVkNGODNTcDN0TFhpYWwzWjBCYkVaN3hEeWlyd3pWTitON2Vv?=
 =?utf-8?B?b0lrOExHcjJQL1FtaDV5MUFNdnhOSHBJd1Jod1hXaXlIeFhkS1N1MHd2MEZN?=
 =?utf-8?B?N3hBMjhJbzJUTXM0a0lIUktSWEJYVmFpMXpSVFZmdE42ck5Kc2dTY3g5eWtX?=
 =?utf-8?B?TmJoREtLKzVWNUIrQitTczd3QjRHQ09XQ3hSenU3Njc0T2RIdWJLQTRxdVN4?=
 =?utf-8?B?bXFWQlhTL1k5OVpnaHNNTS9ENndzZmtKT05LQlYxVnlxTjE5SDcwM21WdzFR?=
 =?utf-8?B?Z0pndm9vRGgwbWdzd0MxTnZHV29EVTlKb3pyTlEyLytUV0syN1RqM1pNVkw1?=
 =?utf-8?B?empDNDhBWFpYeWRzZWU2aEZ5a0NUeEoyd09aQnZoeWJMczNESThaVU96Z1Rz?=
 =?utf-8?B?MjBRNzBEZEltd21FOWpMa3N0NlNhNEdhNTI3b0RPWTM4ZHNqQ0YwZnhaSytD?=
 =?utf-8?B?T0k5cG5wUGVHbUZWVjBmczV6Z0p4R2tiWTZUTzBSa2dHOXpXSWh4OXVqYzJS?=
 =?utf-8?B?Wk5aVnk2dkZvMVNIYU9zT0dGNWhtZm1vVVVicHYrVk5ROTl0aUU0UUVVNFJM?=
 =?utf-8?B?SnNVWmtjR1FRWHZQSHdPUytaZjBhT2JabWh6ZUtpSHM4ejJjYUVmMENkU2VK?=
 =?utf-8?B?TTN2eUJTSjJ2Wm43bEZQa2FmdGdGMlRKZy92QnZtMGlrQ3V5bUVvZHpyWUQz?=
 =?utf-8?B?d05JeXJ2R2RNN2syVUpSUksvcFRrVXdLNWpOR095VkZZSWdoQm5FQVB4VmdC?=
 =?utf-8?B?N25CUGNwREZvcENIejF6bVAyUnZaY25Rci9OemJUOU9NZ0ptYzlhQjFpK1I2?=
 =?utf-8?B?U0s2Rjk2T1hPNzNmUEVyZmRKb0g0dm9KSEd3clluTWtlb3pPNTgwb1NxNklP?=
 =?utf-8?B?N0JwTzlKUWFMUVdBS083bHFDcE1qK3RBWUhaTEhoaG9qc3B5N1ZIWkxqUkxa?=
 =?utf-8?B?N2VGdjlXam1zTTVubmU2M0hKUDVQN1NZYTkydXpSMU9rZjg3YUhJbGs1VG92?=
 =?utf-8?B?YkFrNlRxMmFNR253T1d1cW5WT1ZPTHcwRGVBbkx6NWR4aFNSZHRHY093NVBu?=
 =?utf-8?B?aldaU25NREQ1TDQvaTdKNE1YRmYvUGJMYjlvR2R6ZXlVT0M1alRNQlBpbmN1?=
 =?utf-8?Q?PLgOMfLJVS8S9SOb+aQzdlVTA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a81d49-32cd-4cbf-f708-08db8cda6a9f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 06:43:12.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/P3TabtPwsyimBYBInHopdD82mlNauutnvv/rNEEO20ZNV+yO/9hxGashZVCmHmg4CmoUwIh2X52GVLvpXbvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823

On 25.07.2023 08:40, Jan Beulich wrote:
> On 24.07.2023 18:52, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
>>          return -ENODEV;
>>      }
>>  
>> -    microcode_grab_module(module_map, mbi);
>> -
>>      ucode_ops.collect_cpu_info();
>>  
>> +    /*
>> +     * Some hypervisors deliberately report a microcode revision of -1 to
>> +     * mean that they will not accept microcode updates. We take the hint
>> +     * and ignore the microcode interface in that case.
>> +     */
>> +    if ( this_cpu(cpu_sig).rev == ~0 )
>> +    {
>> +        printk(XENLOG_INFO "Microcode loading disabled due to: %s",
> 
> While we have tentatively agreed to adjust what _will_ be emitted by
> default (subject to suitable justification in that change's
> description), such a patch is yet to be sent. As it stands this message
> will be invisible by default.
> 
>> +                           "HW toggle");
> 
> With the comment talking about hypervisors, what is this string supposed
> to tell an observer of the message in a log file?

Looking at patch 3 I get the impression that you put here the wrong of the
two messages there.

Jan


