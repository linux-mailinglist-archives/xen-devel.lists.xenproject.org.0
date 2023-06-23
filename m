Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90EA73B229
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554291.865409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbfH-0002ii-UD; Fri, 23 Jun 2023 07:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554291.865409; Fri, 23 Jun 2023 07:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCbfH-0002gU-RO; Fri, 23 Jun 2023 07:57:07 +0000
Received: by outflank-mailman (input) for mailman id 554291;
 Fri, 23 Jun 2023 07:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCbfF-0002gO-NI
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:57:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a5f7de6-119b-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 09:57:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:57:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:57:01 +0000
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
X-Inumbo-ID: 8a5f7de6-119b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnnp3kdzP43IgMeWUXvjTUO+IFyTzO8APSwy289z87h8UdzHo8h6FSTKIoJ44i/CggRFn5CU0wwMnJormfGOmTHINMxljz3jmGAGDetWFhb1pTRIlGCKJDRLw6j2L3Fze+BjGjOh9xOfnBt2mrB27h09xbT5fqmj1w/refDDSlwmrY8TY78OBJ2O14blWgnSWKZtzYhRdRWzO4T8H0Esil44BiqP49fMjuYuTWKiZOo+rdPIF4xHlI5vopPihlQr0jZ82Rol8D273Dl/0pXq6QPU+G/cSrTnv+epf+q1TZyX14Pi9jbGescdDkfpOVkECSnHd7LxaOI1rdsm2gLgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FssJMaV6xRWdGvhGGdzperiqmeOE3DqNHtp9269aV+w=;
 b=hhpd5kZruCLNsBM3cKdh9/43wgfpWrbho9QlN9EnTe1Y9FxLa19hZpBH4Gn1BVLV4wCPCVvADt42z0tmqAHt8UQ8stmUKykGa99cFqgBcWkeDV4ghk1/RNeRXl18BhOjufHJUlaHVKIZ18vC6djfqtBdV9LDuKtsv9jCJ86n4ooD5kJScXMCkRopIxfAxpYhdTrPvmH8OkAH7erou5qZ1/vdhHP8uLaMl7U+hH6msnZOBMjNrHArvTH0IDlKI+HhHNgiKwty0W90RIn6rA/flCBSlwBtfYLcyo5T7H4/DcEQ8qg8EIF/RaD3l78kGgRQgUmDZqSNRGL6oXC5OQZbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FssJMaV6xRWdGvhGGdzperiqmeOE3DqNHtp9269aV+w=;
 b=Z+upcZlYAuYr96lUGh5nowZlBj9iFsG0VknI5kx05/1hZ3xHzW4q6M+aS3lQM33Mp895LEyLz4rXHz4WJ2MWGEJui5PQP0c44EkcGiOox8rotH93ORvu8xCq2s2ii9SEw65vucaL+vjrRiiVLuibsXzxmYXbLjVVgNZwSqBpAa2wkyPo86B2OkuYc+UmXIWEn0pQrnEU9gNy0TRFxUo6jwrkoR4SGesweCRMCG3KQwBy7y3acPXZr11iMMZnQPq8MRSuNAfU/rjEB+lJk5cgsAQpSL9yb8sNDtPvew2JNnF6rjwakmhJU1refRQyYjG/t5PCY4A2+gv+GLPzto6T2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fa55373-0070-942e-8d12-c41516ac55eb@suse.com>
Date: Fri, 23 Jun 2023 09:57:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 2/5] build: remove TARGET_SUBARCH, a duplicate of
 ARCH
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230622153005.31604-1-anthony.perard@citrix.com>
 <20230622153005.31604-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622153005.31604-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: e76dc2a3-b486-4034-0ce7-08db73bf6d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GdIMmFKhTwByWcHd0r7XowR4gUxks/VKNXc2rQgpOrqd8Gpjl3xosQ16Fk55IY6LxFxUdiNhXNtRprBPYiMUHFiPAgMaGOlPtbwwIwHTKmc2POero7D7J8EDCr2ZhACfLaltZ0mW0XVTw3slExtHw+RqwXrWeyjF/ZcpWWfuDhOvpD5lE+6oN33k3JvhuDINoEn50XXrLIpluxOHa18jTxkXAaI1fXui/vzj8MB/aIJRUHut+RhyjZyIzTkzHQMezsnL+tA8Is5W8hBjq9Pn19k4WeSbBR8B9yfntVTC9IYXOW4SRQXauLeyLWtd7HQSg0TOjeFw46b3kYpz4Iyt9qA17RVr6FzaDTs6wZ3+kJgLIQbBFV/9XDm6gKzcTqBK3GorgtSMStL8tXDrGSLDeWGe1CvM4awDtfuqKQuDCTCyFG+jq85bbZuXJDvZI70Xy4gHJeFqphYv1IASj46mjxb3AjCd4outitE66CvkC964MpiLTqx4na3YogaS/7mLCY5PNkE1fbXAA7wZIZJbIDnHLGbrLnKEUIlf4A/2qJYRQ7r6w8sGY/Q97BZx8ezRyjjg1MYyT0oinXf6iWRePmCIKLJRtTH2WasKCxz2D5k79x5TSlMaZBonYdh+7wBK1YYYmDEn9Pvc4Z9/Cn8YOr56Lkq0JpW5/3KdQMezC5qzkw87JXwsDVOYJvAh4tRD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(53546011)(26005)(6506007)(6512007)(186003)(2616005)(2906002)(558084003)(8676002)(41300700001)(8936002)(5660300002)(6486002)(478600001)(4326008)(36756003)(66556008)(66946007)(66476007)(6916009)(316002)(86362001)(54906003)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkI0SG5PdjB3NFR0bFJlN1kwdFN4RDJ0YUtEMXBHcUlxMmxRTnYyT0sycmY1?=
 =?utf-8?B?VjRzNHplOTgxbHp2NTRPaWxIeGg1czBDMkFIbWk1djhTWUYyTzBuRWp1K1Fm?=
 =?utf-8?B?NTErU1ljdDBmclZDelNHQW1rM1E3aFRZQS9tc3FKamtzKy9VU0tMbCtjUGJ3?=
 =?utf-8?B?UzkvRkNlU2IzSDNnZzdLWXdkS2cra2tCOEZKNGExUHc4UHBlT3R1Si9EUVow?=
 =?utf-8?B?ejk0d2JhanhTWS9Ib2NRa2tWUWRTU0o4eWpXSzQ4dm4rcWZjaWdXOThxTldK?=
 =?utf-8?B?ZERRblRGa0tuWXBnbFAxTzd2VTJyYWZ2WFFYb3FzRHFSUEJVdmZIdHVJSkZ0?=
 =?utf-8?B?bEFOZjdXMEUralVtNmx5Y3g2ai8yTjdDaW1sRWI1KzJ6OGI3QWNsUjVxZjRC?=
 =?utf-8?B?WGZjTlljUU9zUzFFTDVIMlNvYzh6eURLdk9kcElUNHlLS1duSFBPNWNIOXBy?=
 =?utf-8?B?L05RZk13R0pwRFBJd1J0QWE1ZUtSZnpGandiS2NTbnRMVUVEQnlmeUFQbGtF?=
 =?utf-8?B?YjZteUpRRXdiQ0U5S0Z6SlZGaitnb0NCajhKeVJWRW9Pc0lFRy9sZWQ0dmlB?=
 =?utf-8?B?SmFRQ0lRVldyRk9aVlJ2OXNaZHJOMmNzVmt2cXFQN3ZIQnF1K0lSNmgvZXBU?=
 =?utf-8?B?bytUdEg1R3FtMXRWMjVlVTNvOENUNVdpSXJadUc5V3hDRHlWN2t6SkdIMWhl?=
 =?utf-8?B?Q0hNb0hpSThaSkNNdHVxT1BKR2IyMmhiTnZDMG5BdnBTQWFEZUhENVFiWmZj?=
 =?utf-8?B?eENxbWpCTnpFcCtoOVdxZ2NWazF0NjJuc3ZIRUt0SG93RW9ZdWVQZFhmb2FT?=
 =?utf-8?B?WjkrcFBSNjVkK1E1MFE3NkVRNDRRNXJMV0ZPUUplR2FIaTNKb05sTkNlRGpT?=
 =?utf-8?B?U2JGQlhMYUNJelFaTTQwcEJ4bUI4R3RCM1BHVHYvM0k2aHhHWVNJcXV6d0tl?=
 =?utf-8?B?L1FONVVlV014dHZLLzAxSmVueldnRmVITU5pVEVPY1dKNGZvMGVXelh6bEJn?=
 =?utf-8?B?NkNsVEdaeU95VWpsRlpET3pLWHFqZzVGZ2E3SkV6UlExNUtHTEw4Q2s0QXl3?=
 =?utf-8?B?U1hDckxNNmxGa3J5eDZtY3Z5YmVRdzZacHJBdlJRY1dLaUhuWnYzMEdzZFlk?=
 =?utf-8?B?WDF1WnlRRklKc2RrR0QvL0gvQWNNY2Q3RU1BRmttZ1BSUWVSQklvaGNnWUVm?=
 =?utf-8?B?QjZZSGJ5czBJVW1DQmlaZWhhMzhNcUF5aGRBSEUvcVVSL2VUWkZTTzBQK1pD?=
 =?utf-8?B?d1lPUTJGZTN6NGNKaEZKOVZ2NlpYTDI2WUs0cW44cTUxOGd6SzFSaVdIcmRw?=
 =?utf-8?B?SWN3V1VFLzJ5eTRlR3AzZ2JNdDNBQmR5YWtxR3JSbFZXK0pTMElBMHAvNjh6?=
 =?utf-8?B?WUJIMEFlVGJ2U3ZEVERVamRmdXdNYUxpYUZSUDVnTEZpUTNwUnFnMVIwZ1Vm?=
 =?utf-8?B?d2FSbFRqbWhjbDkzYS9VYnNuSFBmRjcrdjNVMnNLNkxWR2hQZzcyQXIvRE43?=
 =?utf-8?B?Y2I5QVA5WnpxTHoxMVZ5RjI0ZnFmcm05Y3VXbVdCaFNGUTVpZk1RdjhzU0pF?=
 =?utf-8?B?Ujkza2hBYnE0VWgxazVpQ1dkVDM5TnRlY243bS9vOXJhMHNKM3AydTlTRGRH?=
 =?utf-8?B?VFZTaUNqK05QZU4vWllkNExUcVVPamhUQWpZby9LRms1VTQ0UmRqQUFQN3NW?=
 =?utf-8?B?dEJzUkU0ZjhVdjZvMkpDWFVYY3V1ZGxqM0FSOG54RFgwVUhPLzJFUSs0dlRJ?=
 =?utf-8?B?S29zeXRpa2J3TityNnFZRUI5KzJtQnRDUHk0KzdoYWVoME01OXpxU3lUS3pU?=
 =?utf-8?B?Y2ZsamcwUWRmT05KR0tmNHl0Nyt4ZGptRUtVcldJdEhqSGlaQU1Yc2pad0ZB?=
 =?utf-8?B?SWoyeHRZV25LdDhPcHJnYjR6OW5XMEhYRkpmTTFLQ2Z1RmFSVTc0VUYzbkRO?=
 =?utf-8?B?UXN0cWExT01KL2dWRlQ3M0w4Z0dFdFZGS2F0a1J5U3hFVW5TRE9wa1JJaDB2?=
 =?utf-8?B?T2pKWVAzWUQvU1ArYjRUemRLdGVWbTU2alJCWWZ6b3dGS0NLWWo5Rzhmem9X?=
 =?utf-8?B?dlJZM1BiN1llV2JnbHVqVlY1RnREWTdBa2dYSFBrbUdaYTJhaTZGeTZwS2wv?=
 =?utf-8?Q?N7CsBZbeBi1gEzAV0frLVj9RI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76dc2a3-b486-4034-0ce7-08db73bf6d73
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:57:01.7273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5RWvvLQk2fViRFYM1/Fd1+AvLGkAX78xA7XnYeXNG1/Z4ugh6YhaUIvVzgWUY7kEdK0u8jPkXWt1Fa2xmDrDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

On 22.06.2023 17:30, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


