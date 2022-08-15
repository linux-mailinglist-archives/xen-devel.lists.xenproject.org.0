Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3095929C5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 08:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387040.623099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNTp5-0005cL-W8; Mon, 15 Aug 2022 06:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387040.623099; Mon, 15 Aug 2022 06:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNTp5-0005a3-Rl; Mon, 15 Aug 2022 06:43:39 +0000
Received: by outflank-mailman (input) for mailman id 387040;
 Mon, 15 Aug 2022 06:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNTp3-0005Zx-L4
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 06:43:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964ab66d-1c65-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 08:43:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 06:43:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 06:43:34 +0000
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
X-Inumbo-ID: 964ab66d-1c65-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL1T0GSkJzpZlwe90QkgULDa9X6bVPiurxwuiqLjh/f2Zs4cUi98luYqvOrly/xhrosMsjcbSo0jQcPxXNB8mJX+ERiNiWl4PWTwljPNtN2HCCIVIAUlXipkXrxI5gkw5WtmR2SP0MlBde0zvSu8rJNgZnisi+TNTqEd7HXsD/FOGo0gj8QY00K/0X+2Fan9ZAT9cy/vzaFdRnVKHBpQOUIBFNT4YkFgpYcTVVI1K69h5N9oRYVdUgz02+HzdJQccPaBgqs6Ua1BtOsWBG+zNZNn+DTMrEpStRCG0ToL1g6Ob95OTxmf7vUi+4OpsJsEpDdczr4FwhLNYMuJnhyuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gyH+t8kQ0tvFMhuleT/TOmVXvLCOykUtxmLXyht570=;
 b=FbSBCWdy02MDGQ2cYjufhRi90l8j8wVRnYSRAKz0tPf5wjLWaYfxWFuZCoqzfZ1gMGiVs4SGCmODkmSjKe9etkNlY7LJq8DUhY4elOqvZet/yKzrhkbVN1K6b27e8F/wVkHm70Z4xqrqLB4wWjLWQCHv9XNCZ+dUOzmz4AytrmX4YCKbbO5fy3AEy6vV0rdaA558rHQh3AFvVX6SWZ9JCcQHS2/p/VXpeZ5wclywTD6d0VCKGLEKJquQ8tiJdU7uguKqw2kKzMtEA3+xLnm/6Q6LTeNxhZqCRRQCKy3wFKijFtw3agfmzqskiQv+KMd8OZW4xUSvuHV2Btyx9Fb/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gyH+t8kQ0tvFMhuleT/TOmVXvLCOykUtxmLXyht570=;
 b=Niarn7rACbUmkf2SUyL0R/XW7/9GW132iEVIJpFjOR3GJdwle7hMc28Yi8OZfPDOh6JI3V2VO7bnN+y+wV4QZL0+YDd9rPER3ksnWV5IGdEuv+6Fq/FJwEHbTwB+oM91b6LjqedVix0y2rcDUfBAnBmLxpjl8qu6yZ308AbcNMEQjgOvFm9JFyH1swl+Q3EagdaRSvdyFpbT2Dc5bqvuIafCH+Nr//4FOklPVjGrLy6ZLbAFP8W0EEWhovOLnEN0tP1dISntIYLaZq0AI+EPs5kqtbx2X0CQ/rYuALpLPHpxf3xRMuFjENQqOyUmxE7cOXR4fQ81f9RTquFw/YqnzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <432ffaec-c537-0337-5812-18385ccbb534@suse.com>
Date: Mon, 15 Aug 2022 08:43:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-6-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220812192448.43016-6-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc101f2-23e8-4532-3764-08da7e89797a
X-MS-TrafficTypeDiagnostic: AS8PR04MB8609:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hu4p5Ih1EsRrEu6WGBFzl+7jhqkQ3YQI5IO936avmTYsDXgrDypOcW2V9Rc8d//V7Fv4eIzW5LCg0AO+2TTLiNQ65++G31k6LTarD8WkITjPIy9Ft9tz4H7yQ0iRtVGaJILY3MOK595cxcVfQtTpeiuP3EpgTGg7uMA0no4ZRos3nye9OUq3GKxGvnIzWeOS16Lqqn7pm+5A8DHJsH8Flw/1qti8F7pxTEO2NwWf6iv/2yL6Jw2lM2jLRiXz4vDpIS9vYMJMeXUFYRT4NbTpn1l9syP5+b6h/x34zgJTgQ66YbJj7i/pyJFiE2DX4JQ8DyZd1fZ9nIVNbmuUYQDkifAf4Azvs1BFR+fbyJMuqtcEgM/zS70qNW/QODGsqr8NsMUsye8Qao90+zaVGXWHqWN9Y0laZwQPAPtxZLijOYnAjPl1h4NwmRnH9fsz07rgJHJzG8lH9S5R40iSx1+QYpnJ8Zo4rU68ng1fjgqbCP10zp0Qf35BlDQlT94o3KEGIKZEr1N26jDqOjLW6PDjLYD/RWjQMICOebMoQZIkmsIZ+QXr0eWvRVFC+i73eFM8fJBFa0/sLgbwrg9cLwhFH7k6lzYhNDRyL6ca5usQGoLAQBfLhFFR6WMLTxuOJTaArdf3p2G5ekLpskmXhZcsxFimwZgb5NzdkcIb+io1qjS2zNZ22EEM9iWcRKNGWmcIwMOjlYVxFqL32ScevPdyYLz+XHKdkCmLGQZcsqZ5p7lqsGrF5J6cPp2x8NThrjwBic5UhJRRMkR6rCOddqKGUrCqr7lqQakA1HM8DBZ1ZMASdY+RKH0ELXCUZ29Or+6RNdkF823fjzlQ3wdmPDBZ9uLReJm4KA1kRFCJIeVfRSc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(346002)(136003)(396003)(38100700002)(31696002)(86362001)(316002)(36756003)(66556008)(66946007)(66476007)(8676002)(4326008)(83380400001)(6506007)(8936002)(6486002)(53546011)(5660300002)(478600001)(6512007)(186003)(26005)(2616005)(54906003)(6916009)(41300700001)(2906002)(31686004)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTlmbmQ3SmF2MW5tN0pMNVk0SUV5dlhrc0kxalZ0bnRQd3VyamZ2Y2htZmdY?=
 =?utf-8?B?V2orMEpVcmtvUWxtTHRhYW9icG9GeG5qaFdYNmkwK0oybmt2QURLTWgwTWpl?=
 =?utf-8?B?dkoweUZ0VDVGWG9xVHBlT1VHNVcxamVhOGlvZ1pOSWVYZE9KSkhKNVVLYmd6?=
 =?utf-8?B?WUQ3S21vZWlhWHVxa3lMNVEzMlhNMWVMU04rZEhRbnA2Y2VGSnB5TlY4azFJ?=
 =?utf-8?B?VnpqMTZ1WVFNbnVLNzNSSkllQmdXcnZWUHYzU3gxVnZUYXpUdG1OMm96UmhS?=
 =?utf-8?B?QmNqS1R4NUpvbVJzYkF2OEZhTXhCalVudGw3c2dXek9acGx6eGh0eDVYeXlS?=
 =?utf-8?B?dDRVb3RVMnEvSmxIbDlGY0c3cVJubTVqQlBPQTNhdzlqMjVuaFBpNGNER05G?=
 =?utf-8?B?WWVzNHRrRCtCZURZa2cvc3BHZzcyOVBoS1lCenhQV1I4eDlyaTExVkVhL3FP?=
 =?utf-8?B?MXR1djVQY0dHTzd2Zzk1ME1QWjVCTzlFamlYNVFxbGtWS0NvcG40VllRZldH?=
 =?utf-8?B?eEhqa0lCbEp3dUVoQjFJYjIrRDZrcGhaNDAxdGxVRWo2d04rUzBUbG5BYjhp?=
 =?utf-8?B?M1AwOFB3ZWdyeU1uWk96Q0xUNzRSdkdLSHlpTFNkV1krL01PdUFPNjJEalE2?=
 =?utf-8?B?RU1tWXlPNndoV2Izd0RMNWhBYzdWT25VSUVFQmpOc0ZkNWhhVVEyTUFUUzh6?=
 =?utf-8?B?YU04TzVvVVB3c2w0aFk0NGw3N3RBY29jSUZ5RUNySHVmL0RVdE5lUWhaQXYx?=
 =?utf-8?B?MVlIVzJWYXprRjZBSUpZUEliVkJIVFlYeWhvNTFLK2VEeW05THJIYVRYQlZL?=
 =?utf-8?B?K0wvTHVsOEN4L1VhRFRJWHRSR0lUTjVib0Z1UTliTFpGVDZjVWtmeG5HSkls?=
 =?utf-8?B?aEIwamNCemgvdnMrb05KSkh2blhkd24zNThWcFhRU0pXSmZjVUZ4TXBSNDE4?=
 =?utf-8?B?bGMwK3R2bUM1emVxRDRMQVVRYkZXLzVXNml3eG41M2xqMEo2eGp0eEo4ZDBT?=
 =?utf-8?B?MDgwYllZNGt3U0RSb2pSbW1CbjE2S3R3RUlkTzQ2VjVxNlVPVmtMeGNpZWFU?=
 =?utf-8?B?UUdZZnJIU2pQUE4xc25Pdk5oTi9TVUdyd282UTBMTGtXZ3dLZW1xM293akoz?=
 =?utf-8?B?dlBXUXV1YTBMeEdueWd3QTF0b1lROGFHNmtYS0hPUlNEMmh4Rjd1QjhnRjVJ?=
 =?utf-8?B?WGlQeVd3bmQ3c010czRPL3l3dVM0TFN6YlEwSjN0a3JMajgvcVhNYnpoTGty?=
 =?utf-8?B?eTdDcDF3T1FCcWlqV0dsM1A4OTBOZTd2amlaZUpYdkhxeXh6ZElNZk1naTFL?=
 =?utf-8?B?UjVTTXBIYWRCSWNuZFlwVEQvai9SMllZN3ZvNlhJTy9BcVRwZG8zNVpoNmJm?=
 =?utf-8?B?c2F4WWVnZ3FnNFhaZ1FySUhXZTlCeXZzWlZLR3pqU2xOTjBRSWpIZkFBa1ZD?=
 =?utf-8?B?MDVVR29DMG9KUnJvOExnNXJuV0k1cmhlb2pKNnFrekhtVTJCZFJwaTNhaE54?=
 =?utf-8?B?djdzT2ZEM2d1UVNoNDJ6QWI1R2tXNDNJdmZUWlAvTVFQUTdYNTA1LzVmZE5v?=
 =?utf-8?B?U1dKaU9sUVBIaWlUU0YxWTJTN2RXd205OVZkdXFlcEUvRUM4aXQzZFdlZUpp?=
 =?utf-8?B?TnZjN2JCNzNsWFduZCtHUHhLcGFuSXpoWEYzNUdwbUVNYmptQ3R0SmQ5aG1T?=
 =?utf-8?B?dm5PUGxYMmIvMldMUjMyWVZpUlJRWGt5WUZ1eUlHZ2NJbkFybGtCeXlIVGxP?=
 =?utf-8?B?R1hsdGNTb1VLZWtlaU00ME1KTVZ2bXlmREVMN01EMHgzUGVPaGFwaXh1TmJz?=
 =?utf-8?B?T3FEeGZJWDNsMEdmK1dpNGVOWndnMmUxZHJQS0V2L1JPZTk1WDZXRXpBN0k5?=
 =?utf-8?B?ejNyNDZKTTRXNU5IcHZFRCsyTXhxVXNMUzZGaklQbU5lRkNmRno1bXJqZmZy?=
 =?utf-8?B?MUlwOG5BM2c5bTkyVjFFbWJmSTEwTzMrb0FyUDRCT1FLMWtycFd2bXBtQjV6?=
 =?utf-8?B?VCtmdm14ZXVvRXIvamtsQ2Q5SzY5aDlKVldGUnN1Q3VPbk5vZXRJNUlEMUpH?=
 =?utf-8?B?RytOb0N3U2xudjh1SUo3UWpkdHhOQ0xreFdLK1ZqZ2xzQkRuT3NsOHFJS3Ur?=
 =?utf-8?Q?wpsQMZd0V8WIZV4mMXIyI0Aps?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc101f2-23e8-4532-3764-08da7e89797a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 06:43:34.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Elc1o/7daiJq3gL894ssybpzwZ3L1H8okl/yWo5gh9P2rzC4zL92KdBFcThdt0cp4VI0ZqeTO1uZ+xE6PjtAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609

On 12.08.2022 21:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the strings are in text right after each use because
> the instruction 'adr' has specific requirement on the location
> and the compiler will forbid cross section label.
> 
> The macro 'adr_l' was recently reworked so the caller doesn't need
> to know whether the MMU is on. This makes it easier to use where
> instructions can be run in both context.
> 
> This also means that the strings don't need to be part of .text
> anymore. So move them to .rodata.str.

Wouldn't they better live somewhere in .init* ?

> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -93,13 +93,10 @@
>   */
>  #define PRINT(_s)           \
>          mov   r3, lr       ;\
> -        adr   r0, 98f      ;\
> +        adr_l r0, 98f      ;\
>          bl    puts         ;\
>          mov   lr, r3       ;\
> -        b     99f          ;\
> -98:     .asciz _s          ;\
> -        .align 2           ;\
> -99:
> +        RODATA_STR(98, _s)

Nit: How about using uniform indentation here  and ...

> @@ -736,7 +733,7 @@ ENDPROC(puts)
>   * Clobbers r0-r3
>   */
>  putn:
> -        adr   r1, hex
> +        adr_l r1, hex
>          mov   r3, #8
>  1:
>          early_uart_ready r11, r2
> @@ -749,8 +746,7 @@ putn:
>          mov   pc, lr
>  ENDPROC(putn)
>  
> -hex:    .ascii "0123456789abcdef"
> -        .align 2
> +RODATA_STR(hex, "0123456789abcdef")

... here?

Jan

