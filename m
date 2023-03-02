Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CF6A8412
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:22:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504962.777443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjpE-0002Ue-C6; Thu, 02 Mar 2023 14:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504962.777443; Thu, 02 Mar 2023 14:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjpE-0002Ro-88; Thu, 02 Mar 2023 14:22:28 +0000
Received: by outflank-mailman (input) for mailman id 504962;
 Thu, 02 Mar 2023 14:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXjpD-0002Ri-7C
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:22:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7e11aaa-b905-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 15:22:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8371.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 14:22:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 14:22:24 +0000
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
X-Inumbo-ID: a7e11aaa-b905-11ed-96ad-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaoP84fPC4b4dXtqETYEqgHhlsgH55JH5kAx23rpS6gb/FZ3bTEqBtzXKAiNn+gr4OGcUylJRLeKwFQl5pvYcinbtz7puSuxc782Vs1K5zWAZVGt0TZDCoMPhSAdKwKqdNwm1C6u15sjEidiog7k8uwSxKPuUsM3QilIZDUnrPoMf+7QNfBXOMQp3/bygBWodxy9beEaMb6pY6HGuW20cbwFFKZcTvTtIICbgv2J8pVJ4ansQNIbWAK5Dvfnnx9m8UVMKMKm7lL3BPn+MsyuiRw1yVZryJurZrWBRWzMkOPOcdKj2gkpH1ebY7AmoeZtlKB9xQvr3HM5sWWI1iUtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liG8TeAInLyi+60qJap9mQUlyRLogwSl9dnPX6da9Hg=;
 b=a9S4itC75/QJ7BNaqOEkb8rkgh9Yv6pDN/R5Pp4CW+15ahDTMBVAFqiLkV1+tzOROdBiimjegHyjob0EcIg0yolq3lO6utObEls/y4zODBzCRXSqgZbSag9xFq1pfm8uPJkIYHlMAbhxYDpkHj+ScZMJ3ITCoguHIgHH/xFjWSIiP9bChE+m75QHXsvTRkG0bWMBZw0hoZ39kDMYknBWGUASeSAtOKfi4gH7oIsypepovoXwpKVIL5D2vvwCWKXWyg/AdtXWW5/IIXMNFfAjmvsa1QQ00XtwMUYvQ5wsm0In9If+mUEAK0hosrJdUh5HIMoOUmmsarDD+qKkAZGEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liG8TeAInLyi+60qJap9mQUlyRLogwSl9dnPX6da9Hg=;
 b=vzwv4YDdins4eh69aawT/t6yfh+JdVWAY48abSJ1yofU+ZLVGgPI4uIZS3YC6fvJN/jTSE+bvLtdzlQJokt4HJkRp3jTR9bGIDooO68IxV/hpSp4YJnku50cPNI1Su1kvl1Y9xU7hhkVnARUk7SAhspC2I6nt26xAWngtLS0kdT+BGjJbFba1GDcHxpFCNjsabPXKyiRHTMB0pbzme7KlkTDd0pJ+afYnBW4oExZ5i+YNtggDfbRiqjuYqv3X9yP3/k86ZrmdeDvH0NKpUJF9PRXiya3hrklKzlkK1ETA/qjm5/uz6t4M6w/NBb1OkLZwx8qUwI6k6zeg/vKvH1Yog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <270118d9-0a7c-82c5-aaa8-437644017af4@suse.com>
Date: Thu, 2 Mar 2023 15:22:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] xen/riscv: initialize .bss section
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: fce2b61c-fe4f-4680-bb13-08db1b298a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EzRR9yACt1hSbmJ//aLpxuT47R0vezc9JIeLCGsqpZ0FZtZJgkYhypY4zkYyu1hPtdsLd0yqewhbucRZDfxvOWqf9faMNdADxbt4n0j5hqWeuULqo6DxJAfHsbO5J+srx8a5McuxYMHN79g84dbt05RnVHIOmXqTT0eCwGZgf3PwGa8+K8QmJIwJ0eYdYX4qZ3Ckub7wz1DOjmh+wZORcf4Jr+sPTwmmGzKsvwaQ5Z9ZlkwHfKTFzZdk+ILO6QJI2wJdZntPQfdueSDL2kwqMX2VDEdJqv5rPvPqFixDzD28lqqYYcuuhn9c6tZ/bAprpqJAVNpTBJeAqcCimDrP7iiioyr85gz/AZm5EffSeMwl4f9pdpLdLoqe9L/zNngVV1l53avTt3F8y9UXuFioz7DHJdivrSlnyHkiIxIhBBQdr57cFThZ5xCz3xb3PKpIx1rAfd/HWm6FVDr7nQWMRN3GEZMMYhjpJOGVRhbPVHf6ai4gSePo22QJsjSscXDWpBnPAEayymmoeVjfz7U0mw5tZuOfY2iLEPNwxyGuplOUVwatMfZgOBk+RojmZtQQwD54duhKmkB0nDHTJiLfePPTm/akc2UVLBNxgdW3bISFAX2XID70aqU+y/JS8Gsuo2y+MsBVBEYTZxVxyV3QHyPaoBQ1Bqnsn4625KFwxccKOGcRXVskvq5KDWFhX9x6T16QJoxf/zoEsHWRcP24XU22EfjegO33kgo7TYtGaij63ZYQ55p1fpxTZrnU+Kf25pusINoqYM01Olnp2MYlzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199018)(2906002)(66946007)(66476007)(8676002)(66556008)(316002)(8936002)(36756003)(41300700001)(6916009)(4326008)(2616005)(83380400001)(6666004)(186003)(26005)(53546011)(6512007)(6506007)(31696002)(54906003)(86362001)(478600001)(38100700002)(6486002)(5660300002)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T28rOTlvQXh2dTR1c1NxUEJLVHJ1QkhvY2J6a1NkaHlianFZWW5vVndXUFRI?=
 =?utf-8?B?M1ZFd2sxZVFZRDU4cTR6Q0ZTUXJCNUltYWE3T0ZsUk9LZzd2Um1GcUFiaTFB?=
 =?utf-8?B?bE9lMFAwWnloMHlCUTNSb1hXcUt6OGpXM29Rb2EzRlJENkpPTHN0YVp2enlK?=
 =?utf-8?B?UnNlSHJCVmxvM083ZGNwcGNLcEtWVzg5RG9GajhjNTJjcGtJT1FiY1A0bUFY?=
 =?utf-8?B?MUdNNU9CbVBYRmxzMHV3MjdqWW1UbEJKaXlScHNnajE1QTIrNzV6NHpndEgr?=
 =?utf-8?B?bWdGOHp0ckJ1Sno2M2VDMzkvVzNSSlBWWDA0cWQ0VWJ1cDY4QkMzZ3loTEov?=
 =?utf-8?B?d1BCQ2FIaFk4Q0pPRXZaRk1zbWYvZWVqdFpieFRGTy82eW1sRW53bGl4d0ly?=
 =?utf-8?B?Q0VhTHdJU21uRmhQUmVyL3pRYjc2c0RlSGkyNlgwWjRxSkY1NDA1cXdTaitq?=
 =?utf-8?B?WFZUQ3psb0hIUTRJSTBBY3pTZG5zL1o5QWxjMm1CQ0d0THBMNDlVU2MrbWpr?=
 =?utf-8?B?cWtjWkRxSVhGNSsvakNZREJ1Y2dXajJVblkxeTc4U2kzaldXSkdlcjNkVzBh?=
 =?utf-8?B?cnliNWVNYWk0REZEWkkveEtkV21yQ3VJNVFIaWNjYVhFWkhOTHJUMjBrdUZO?=
 =?utf-8?B?aEZHVDZGbjZLeCtmaVVEbmFLbGJMU05Jbm05d0kxdnFPNmJPdnc0cDZKY0o3?=
 =?utf-8?B?WmJ3Q0NVZFExcHJHQ2ZHNWJCTGUwSkUzM0VNZVFzZzVWM1hzTFlnQUF5UEsx?=
 =?utf-8?B?bmpJWFBFU25iWUsyL2ozL0lNWXVzTzMrdGJMUUFGZGI4bWEyQlNSaU1sdVBx?=
 =?utf-8?B?ZnlIOHdqYjdOWVpGSzE5dUxrbDV6SktSSnc4d00rWGV1Rk9tUmZuYnZNQytD?=
 =?utf-8?B?QmJzdk91NHVOY3ZhRlI5SEJHdUtoNTZmQWdHVnlaUzN5Q3hDWllEdFZzMFRT?=
 =?utf-8?B?U1RtODYrd1dpeTVpdzhKNUJTajkyVkxBKy9GT3FtZ3J1REhHYmhDaDBTS2FF?=
 =?utf-8?B?RHVZRklFUEZyRzFpakQzbzZRaTFNVVJqWDBJY2NuRndFdUJSbEtJVlVzTU1j?=
 =?utf-8?B?RktvL3IxaWpFTXZ6OWVZZE5MWnVqRks0UVp5Vk9IUm1WRHk5ZlRVOWNOaFp3?=
 =?utf-8?B?TmFKa3hHUHBlQlM4emVHS0hhTVluc0lpc2FId1hRMGl1VkJZNitjL3NtU1Jw?=
 =?utf-8?B?QVJIRlh2M0llTFJHYmNEL0htUExQSGxuVjZRcDFjK3laNytkdjk0OFFUbFVK?=
 =?utf-8?B?VWF2WkJVb2YwdjdRK0tHbU9FSmpNa0p1TEtRYzlBOFp6dDJKSGNYVG9MQ3Va?=
 =?utf-8?B?WG5zMHMzUUxidE1IMmFrSEM1eDNseWpWcTVOQS9hanRET05pMEQ4SVFhYUx6?=
 =?utf-8?B?OXlSRW1vb2tFRFU5MlpHZ2ptVjBtcnZ5MDFYSTlRK09CVjVHNHJZOHpKZUZE?=
 =?utf-8?B?ZENrMk9RWHhPaDlkZlBhRmZaRUF4YmU3WHcvdW5xYjFSclh1TVAzVjJrb3Bo?=
 =?utf-8?B?Q2d3cndqMVltbE96dXRvSHdUN2owY0tsc3VsTjdFeEJVRTNTR3lhQUFmY0s4?=
 =?utf-8?B?K044blBsRUpEeEJIS3hIMjJiQmQ3ZDlUTk0wRUJUSEdXNFlzZ1lpbEhCYXpt?=
 =?utf-8?B?ai84aXNyMmxKYzUwdjdETTc4Q3YrVGkyUmkwQ0F1TXZKV2dvczIvazhmRmFl?=
 =?utf-8?B?MmdVTldqR0hEWEErV0lJNnc4Y2tiT1E1WmUyVXRiZTJuNkNJRWx1L0lrZ3V6?=
 =?utf-8?B?QUNocUV5REl6RFpxdTZSSUcrU1prM3R2WXdzdDVTV2JDdzR1RDBPK3NzY1pH?=
 =?utf-8?B?eithM21HMVhMdmZoeXRRMHlYdG1FclFuMWdtRUNuWVV4cGRCenZVQW5lOHJX?=
 =?utf-8?B?YUZnckpia1h6d2ZSOXh5a0RPR0FVdTZKZThYaWJyS0F3WnlnNzZEekJBVEFD?=
 =?utf-8?B?SUZxY1A3bmdJb2FaOEx1TjhleG13dzExQndUY1haSG9tV0xsN3NrQlFKWG9X?=
 =?utf-8?B?NURJZEFONkMzam5jODRQbzVrM0JZMTlRdGJwUndxaGh6d3F6UG5vTHFKcHc0?=
 =?utf-8?B?MjFSZXNPUU1FS3B1R3VJYXIxcmlMampZMkNhcmdZSFNEb1ZIWXJ4QVpBeUpq?=
 =?utf-8?Q?6tdB/6hZkz0oQjGYIqde/oYBR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce2b61c-fe4f-4680-bb13-08db1b298a8e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 14:22:23.7619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYc4OSQ6UaFs1xD7zqOGhAEAERSHjKwpQolJmocLAooAy3ijJMxldHJ0ttxe/Qt8SpUkqe2FV3LD9oZyw7s1AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8371

On 02.03.2023 14:23, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -13,6 +13,15 @@ ENTRY(start)
>          lla     a6, _dtb_base
>          REG_S   a1, (a6)
>  
> +        la      a3, __bss_start
> +        la      a4, __bss_end
> +        ble     a4, a3, clear_bss_done

While it may be that .bss is indeed empty right now, even short term
it won't be, and never will. I'd drop this conditional (and in
particular the label), inserting a transient item into .bss for the
time being. As soon as your patch introducing page tables has landed,
there will be multiple pages worth of .bss.

Also are this and ...

> +clear_bss:
> +        REG_S   zero, (a3)
> +        add     a3, a3, RISCV_SZPTR
> +        blt     a3, a4, clear_bss

... this branch actually the correct ones? I'd expect the unsigned
flavors to be used when comparing addresses. It may not matter here
and/or right now, but it'll set a bad precedent unless you expect
to only ever work on addresses which have the sign bit clear.

Jan

> +clear_bss_done:
> +
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0


