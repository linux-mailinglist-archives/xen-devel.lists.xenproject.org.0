Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F77CF4C9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619075.963651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPyS-0006nb-Md; Thu, 19 Oct 2023 10:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619075.963651; Thu, 19 Oct 2023 10:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPyS-0006lw-JD; Thu, 19 Oct 2023 10:09:52 +0000
Received: by outflank-mailman (input) for mailman id 619075;
 Thu, 19 Oct 2023 10:09:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPyR-0006lX-7a
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:09:51 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3129859-6e67-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 12:09:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 10:09:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:09:47 +0000
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
X-Inumbo-ID: a3129859-6e67-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdEcmroDke+mtqgJjhjtK8t/GQZddYR6zFAwVVz5LcVPf1+wcSdyel7Nh8bfAwSiOqywoTWzSP78HG32Fd5E/ld7rTi2vcshmYUQemycQPpfIrHQFE7ckQjPH0SfIHqoPdIuU4lexqjSss4x/DLUwYniniStJ6ESUSkuxKWUj8TDL69ufQPlqeLdTQph0RYdfO6upqMovCLWHnwKKxHGal7MxwSbPseTwr5SpP4accgSjRHEdv5kG532CJKEn8t8Y5hBnyxhysPjuDoq6H0PC8moGjF1vzyo3OTTiKrkYUUlbVnx15oeFEDht40G//nBQDK4ObfR8tx98qEvDCR25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OCeDJBhsTdZBNp/OY0T0KSEoMZYq8hN/KYPp/Fz8ZA=;
 b=lplauD2MTYGkPcMavvye79beA1lyCptmwacAQ+i7bxGxQF8eTLFkzbADYEM8+/uYRchJgdlWLxasb80eKScGBe1hq7r2oBYhDhKuWPz4qmMLnOU3CiKUj/TR0LZVuthpOn/ed067sg1BlXLptjD+JHsypedbsznUMmF81tqTZpFyrRapM2F5X5zvrf4MeyWU1EZH3xICBwSTF6KxCvLz2WqTYTLLhgcF+zgF8D298YLwH679FDUxH45fwvk4S3A23T6hhjfjellSpH0WenORnPy478LaNDYULpvuzCMfD38poDLPIKciLdlRO9E65XA0XxBYwsP7ElPyX8LaWsGIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OCeDJBhsTdZBNp/OY0T0KSEoMZYq8hN/KYPp/Fz8ZA=;
 b=0C9dqpvUr0aH2XEln4JIxJmKsmZyQ2B/9iu6tlHFfWra3GGXLUrL0uqP3dXv2PJpxD+svSzGpQTK4j3YY7hgGug1B6L6fL/SOtv/gVT3WM+FpgxWfrLR/fsdFlYEpahcv27dl2AZhUhHusOFXK2/UoolzhablEQKNRTM6qe092Ib5b/GXvBaoyClCcJj7I/4i5WCfpgZfe3w6tj1uDdgXUI0OL1AL4yqiJfvL4jWk8JPLSrqHOBpae1Af0nHdN4rRYQ9KB7DSX6Vg0KIEg5Yppi0p1uwCGxoQhpngbg7OAKnO0m1qHJtdUkoHwZGrECSP4EnqZjmCdZkZOqpe/wCnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0efa2ef6-8815-4b39-bb53-f1d5902e71c7@suse.com>
Date: Thu, 19 Oct 2023 12:09:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 15/29] xen/asm-generic: introduce stub header
 xenoprof.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <0b7805d6bd5f16d06656093d964d5d90030958d7.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b7805d6bd5f16d06656093d964d5d90030958d7.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ece903-448e-4ab0-5232-08dbd08b85e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JaC03C7HFVnGUh70Pwq5VOsGIto7InwN/+3YVviK687yhvOFBUBqRRCXlCtAwl/HZgVfTkVoa7HycH6y95irxv6klHGXKqYPC9y10HWGkXwwpa+/vnhUKamZV89DawVsbjWH4lR4O8JPxqMwfz46VFzzsnRwZ68p+tgTdHQqp4yW9L22VUsGyycT82t22hQkgeC5NPkc8cnecdCp6Iq2fozSOxsWM7P6PacgLm4D+DclaqSwY3JUtJ8eCEIdt3EoEyIe/x5VjIWRlWQfzaA5KpFOuR5k+J8j8AIld6A/hPg/aK5MQyWgHPOqZM2bGSbcPQy0lK+nHDZsAZT0PFZ7NyiHrvGU0qAscMvhrWzby3WSEdQ0z0S8Ia+7lf9/2wANFx5nB1eLCkCcoVP54Dt8F9DKX24/4OctV4mxwGiyF9XK6NaErVDkb+MQ3Q3UOPOoLutGhBXBJWseuOWieM0DaNF1KCsajP3JaRmqkoE63qNkQTjLKny2X/Ml2hTyMyx9lWs0oCaDU9iUFaKMq+Su175/iWJJPgbIn9jGue6Neo1oqSmYe/vVD6RV4oUQn167N2ftlE+ovp7B9mEphkIGKhi3fd1QoL5X1OYaZGXZnt/OtlVsrJlIcJ7dhqP7f3z0cntW1MredXQPxGr8atIER7YxGJrb40k+zYiwdsTBvBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(4744005)(478600001)(6666004)(6486002)(38100700002)(4326008)(5660300002)(54906003)(8936002)(66476007)(8676002)(6916009)(36756003)(66946007)(316002)(66556008)(86362001)(41300700001)(31686004)(6512007)(31696002)(53546011)(6506007)(2616005)(26005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXZMamRnazIxWWtpL3pQczk5VWxRV3ZGVEtHbEpkMFV4bFZRa3VFMmJHNDYy?=
 =?utf-8?B?akFrMm5qRU5BR3diYk1kZ00zbThGaGZIb0NrZG1CNyttdXlqNmxBSHMwWWEw?=
 =?utf-8?B?VFJSdlJyd2grQ09kdFBCTEM1am9ISVVzWWljZ3AxcFl0ZGhKTnNjeEYwNDhz?=
 =?utf-8?B?QlMzOUJwWUE4cVdkNi8rU3RTRjhqYzVxOUR3Vkk2dGYvcnRSNXIySUhlRWU3?=
 =?utf-8?B?alk5WHZIYnRTQ1hTRjhXTVFOcTcvK0NGc3A2ZE10WjVOK25FYXV4RGFJQmQ4?=
 =?utf-8?B?OGZjdHhBN3R4eWRWR3NQOEo0TVhhTFdHUDZxVjYxZ0pHWUh4dkFUUGZjaHk4?=
 =?utf-8?B?RnhjKzBOS3pYMllybFc0dDVPSW8rK1pBQjQ2SUpFWXVoYzk1eGlxNC9GT2xP?=
 =?utf-8?B?VDQ1TDUvbGtSS040WWU2REFvem5LTzBjWFhPa0g3Z2JJbVdEQ2hiZWY0MnZU?=
 =?utf-8?B?MjQ5a3IySW0wRm0xbkdWY0wyNTJqZkl1RzdwRHZLWG1UYVA0QVBFSEhSL2xj?=
 =?utf-8?B?a1lULzA0RkNMRGJsZjFPUnA5WWl4cVlUelhnejcrT0Y3bnhtUXRUL3ZZZUlU?=
 =?utf-8?B?dHJqRmZ1Y0RvelBDL0xid1YzU2Zkc0lLSnB0VVB3L0J3MTJCQU1KajNjb2c3?=
 =?utf-8?B?aFVRNzdCSVNyRitIbGxzTXBadjhkaXBKRVBjSlhpcUpIR09rakFMNXNGRktH?=
 =?utf-8?B?OWZ1cHNVR3BNOXNBN251aUVyQkkzMlpROTZoQjlPMENWcHJwb1lPSGNGemEr?=
 =?utf-8?B?UHpBQmtpNHJRZ0gzMGQ4MnAveEZQSkJUUnRrV1cwTlN1bnZDOFFNWHNwZ1Rk?=
 =?utf-8?B?U2NsOVdBUkRRRG52T3JpR1V1QUIvR2dSblBXQjJpaE9yMm5ZYitKNmtkYjRt?=
 =?utf-8?B?bzJFMk04aVJSNXprRGdmNmlDbHc0Z0h3MnM4ZDIwajVHNnJIL3UzWDZLZWZK?=
 =?utf-8?B?Zjc4S1loVlpuK3hJTkJwWmN4bjRiNGhvbk1hWTA3L2RBOG9xQnVDbk1RNUFD?=
 =?utf-8?B?TElJYnRJbFI5OUFINEorcmE1b1Y1OG81aWI3T2M4dkljTHloQXBqTWRFN1ZD?=
 =?utf-8?B?UlpDTTdQTCt2NlJSYWIxS1Fzc0NHaW1oOGFSd01MbWc3UEF2bXFVWE1HVDB5?=
 =?utf-8?B?eXJrZEVIVkE1TVVPbWMxcE9kQ2NDMWgvMFI5QXhSUXZBYnV4c1RDTEZmbTBy?=
 =?utf-8?B?di9zUUg1TENha2J3Q0tiY3JHNVNpcVlvMWVaWGlGbGMzWFpXQ0huRk9jMEZ2?=
 =?utf-8?B?QWhBUm1QWlBhZTNKdDNKMjdWTzdVUjU2NmtaS0dTL2FRRFJ4VEJWTVRYU01R?=
 =?utf-8?B?S0F2R0U3cnp2MDZCM2MzWlhIS1prZWRoOEo1WTh2NWVnNytLdFg1ZUVLbUxv?=
 =?utf-8?B?TzcyUm14d0FVUkI0eC9nb1pDMXJYalh5bkN3c1c4WkdJdWFiUVpPZis5dGky?=
 =?utf-8?B?VjdXTGxEZkFrUmtYbnB1b1RmSGZUSVJQdGZnb0YyaVBBZWJEazliZ3NCaWxX?=
 =?utf-8?B?Y0d0ZTlsNkViT296emEvbUFMekpES2M3ZDFLOWwweWVtTno1RWdtcUVZUy9q?=
 =?utf-8?B?elFJZzBDYmkxZ0h4UjljNjJTVXlEVzZXbUwwa1hKNmNsdjhXMFdwZUpwOVVX?=
 =?utf-8?B?QWJDcnlSeGV4N1hPeSsvdHRnQjZ4d09nOFBrQ1E0WWN3MUVhTlA2K0kvc0JY?=
 =?utf-8?B?SjN4cmJsRDQ2cXlnOWhzZkJQUEpra0kyYVh3R2hydkRlSjlVYTVvdlF0aStD?=
 =?utf-8?B?QVV1MXFUVnFmUVJlZmJuaTIwbGE2MEhVK01iTDV3YkpGM0hjdGZtcGZDbmg1?=
 =?utf-8?B?UmsrL1RjM3R3YlpCaUF4cTZSSFFNM1N1c2FzR0wraXlxTHg5U21ZNytEQkNR?=
 =?utf-8?B?UVlHeGRWdkN4U3kvT01GdHAreThkeFZ4cW9hcmtDSkZSUVVzUGVVTEtLK1FH?=
 =?utf-8?B?YzZ2SlNXRXg4TE93TWNsWG5zcFFVc044NS9OM2JBSUpVblM2YTlTSVU2aDFu?=
 =?utf-8?B?ZFVhSVRRYndMRDNEbVd0V1RBcXEzNDBrUTNlbHRwaFBtdUVpOVErRzdJbmpC?=
 =?utf-8?B?ajBmVTluajNialpjajlNQjRzQ3FCYkM1WUxjZVdmWEh6bkVGdDd1SUhCVWN2?=
 =?utf-8?Q?waK6YknWiB5TbhQmrUXA0HFOD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ece903-448e-4ab0-5232-08dbd08b85e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:09:47.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiFmQFrQP6ffmGpSU6FsPDC4XlRGbQY/pV39uFuq8klENqeSpCVQn1xgYV11XhKD4hpvyRfwuyLzQ/37CfZZew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/xenoprof.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_XENOPROF_H__
> +#define __ASM_GENERIC_XENOPROF_H__
> +
> +#endif /* __ASM_GENERIC_XENOPROF_H__ */

I've made a patch to move #include-s in xen/xenoprof.h, dropping Arm's
header (and none going to be needed for RISC-V or PPC). I'll send that
patch in due course.

Jan

