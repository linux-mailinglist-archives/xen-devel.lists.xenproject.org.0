Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DE7648D3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570802.892962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvYy-0008L5-SF; Thu, 27 Jul 2023 07:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570802.892962; Thu, 27 Jul 2023 07:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvYy-0008In-Ob; Thu, 27 Jul 2023 07:37:32 +0000
Received: by outflank-mailman (input) for mailman id 570802;
 Thu, 27 Jul 2023 07:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOvYy-0008Ih-68
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:37:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714792fe-2c50-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 09:37:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7144.eurprd04.prod.outlook.com (2603:10a6:20b:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 07:37:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 07:37:28 +0000
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
X-Inumbo-ID: 714792fe-2c50-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POjhJz5Wvx5/BtSC5WkXEexH+tzu+TaVgCXhbJa/xQlG+F5GIaw0f7Yh71toDRBN+TETnD2/MTidXUGK8wZSVFVruEw8WZo3M9rqSIF0bp7OYMOahrCyD2YApZRjLYYZkzE3/+17xoMivPN8EnLM4f/5Z2L+nLSPoM+4Q94GqvFwH/l5pSF+u9uF8k1uvItpLtSvE3nXG/OP0xvPHLSYs012F3irRqMyV2BTFf0SowDtVIIO3+8fB2O7yFLxBL5jPUm9W9jNPdS5pLVb7AH3s/nKtDF1F5Eud0h7cQ93uZajBdwXXT6o450wkJXwM8Jb/ZwIJ2jW5y5tSnOSvSuxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3t8Tm0erRdGxFTnPkL7fis5y1VjtbTpebza6W88aH4=;
 b=eD3gDIrLecTOdAUsC/o/jGa9N/2rvrrWuuRpaszHGocMd5kY6Sh2N59D6Q8xxy7pfAKGXIVkqKLXI3rnKsh1oN5+W5QK1/oxW1/o/WLxXqhWsL0UnHnWNEonc8kS6QzmVeGnDhRO+hXYfkOtRov+xNDtP4lw52v9a2kAiR3aIsi81pVsHy3fc32+lEBmGE+VJNBSzWHhQ6Fea4Ti4icMtHkoXuNN8s2SvyR8TAUEFy0cmuVku0DqylQ3uNbmWsxXKL8s9Tr1XUNiYiHR2Mi+T9RZJFaRZMjru6Ld3Dk6I6xIXmkcP+vGiVqGzhe/nFxkFNOSeO9YMdib/EI3Tl/ZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3t8Tm0erRdGxFTnPkL7fis5y1VjtbTpebza6W88aH4=;
 b=pD2r3mTJ6wkwBzgiub7a2D4Ko611EMyDMvY084UD5MJZJE1YONY7HWLFuFQTsmNG1+n3noILXQRU2KTk2wh7JeDK/oZQOAizla7wrVTVfbZVUdwxvWZY6PhHSHkdYeltkafwjc5iv2ae3eApr+EuU57vWnpHIyEP27xR8UaRVCE5vBtpJnv268A+QU0cMcRsK9vUcQp6JN0lz++TfhwYx1GzTvrLKGTB5buUez6C8DTiN9+d9FUEvKUBI+GBUXf7cip4y+hlzdjywQYElHlbssCcUPvRZno/c4YtY0TVMB34nXXaSdvKvmDyqBfPh8+WcgpbOXMnnaQeVNarx9YhVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
Date: Thu, 27 Jul 2023 09:37:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/3] new CONFIG_HAS_PIRQ and extra_guest_irqs adjustment
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: fb029cb4-6539-4f86-10c5-08db8e7453d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uVAdC363rP7ddyFEAmvI6cjjK/kF48TjELXAW/KWBdAK3Wz0QEK7iQxL4f266e3yKpHwKNspPYJdw8j+KUhlUepQPB9c0eBAIs+1tAK/CzH74eKLg3mQhJyjP4tOMcfUzrZHhRJuVP4F8Uq6rMhC9yG6fvuRbZmBzOw4X01K1pVbRmrJRtSDtrm6X4o0fFNTiJL8Cr72ri5Ss5ATClwGHSm82umVkBqFgSVN9RoHOiGHTkyQWZjsRg+YCTIDswu2uxIhctsEzbqEz3MgxmduTn4ap/qPko+ux3WXXbOsP64lYDRuURJod+WLUO2ey00erJKzEfGevucnkUOqH/2j+QaHl9D9AjUB1waYPa+6PzxRLOW8wIqipIKYo8NXprtHIhgYpoQhxFidU5vBxhfcH3fj6aD6b/3LKsCSSeEnMDGPs2OnNdXWTnkOskPbIh/zAVV5WvbJnMDYggNiRke+kYA1FdRF/ExxpZdWUnMOjRoULgyTE1EBZ3XZxpeOurQiU3phkrKC95sLQFh9VzdpTN+ZtCBZ8Le2EvURg8huh8YvTqIeQK49kNVSysAD9IvdEgIDjUjYjXGS8WQXHTxKoizmnoti4mKXGCN9HbxwrkAe3GAo0eh09PfuHqQO8Nbdd0MowBmbTZOKmSE4b95jxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(54906003)(38100700002)(478600001)(6666004)(6486002)(8936002)(8676002)(5660300002)(36756003)(2906002)(86362001)(31696002)(558084003)(6916009)(4326008)(66946007)(66556008)(66476007)(41300700001)(316002)(2616005)(26005)(6506007)(6512007)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlcvM1VrRkxxNDJsaXBGRkdDVXJacGpiZ0NEWXNiRXcrMFZTeGlCZnJScFZQ?=
 =?utf-8?B?TVFMZEdZVWEwcjdNNjNTNEpWWjlTM3ZTMU9ORHNJSGN2a1BtYnJpVzdJbmZq?=
 =?utf-8?B?M3BlSE54NXdjY0s5L2RNcHF4dXRpYnlzSGR3ZTBRMkVndFdMV09hMmFQYmY3?=
 =?utf-8?B?MjdQa3p3TXZqYXY3QzdPcVZEYU1JODBaVHIrelk1c0YzUFYyVUJIZURnOHVE?=
 =?utf-8?B?bW5HS2NJekhoSG5PNVd3czRnc29IZXE2NnljY2swN3JYNHYrWkgzaHJaWUhP?=
 =?utf-8?B?djVlU0hWM21mdU9nRVNuRm11QVFEQ2V3ZUxwOUN6enQwakxOSGt2OXhLcjlH?=
 =?utf-8?B?U0RZZXh2aUlTZ1hnMjVMeGdHU21IM1FmN0NlM1l1OWtWaFNjeVFDVmJlMG5G?=
 =?utf-8?B?anNVN2R1Y3VJc2oxOFRDb2V5Mmd5Z0pGb1h0L0VBUC91UzIxaU5wYkV1Z2d0?=
 =?utf-8?B?MUw2a1NUbFMvTVU4RjdJMksya1RMZS9jYU5ZVHFnZVBsMlhuWUZPYkVGTk9v?=
 =?utf-8?B?dXdRaUlxekU0SFZBM1VXZmFtWnRTRldiNnpySkVoaDMzbFkzVEI0T2pmVE1Y?=
 =?utf-8?B?SzQrekhqbmlVN3BMVGNhdHA3bGJ3ejR0aldKaTgyRmZ5MHM4ZWhGeVQ4MGxt?=
 =?utf-8?B?UldLRU1ld3NmRFlyMU1HMnNKQUhGSUxYdERLeU12WWNjNmwrUEJidi9hai9H?=
 =?utf-8?B?dnQrN0hETCtid2hHTTZGQlhCc2VieXZBc2RKemNHeGVycUNaakthcWhGempp?=
 =?utf-8?B?QTEraGZjemtoWnRId1RJSVpsTGZaNGxHNzVZUEtHZGsrVFROM2lMVmcyNFpD?=
 =?utf-8?B?Y1Jxek1IaWlZd0V0TUI1MkMzeXN3R284OEZuYjh3ZmhnVW16UW03aFdyRzVX?=
 =?utf-8?B?dURpQTlXeTRmUktFS3NaQmVpN2VvVFdJZFc3RDdJbCtid3owYUpJWm1QWW1B?=
 =?utf-8?B?YW5ZS2R1NWdscU9JdUF3c1ZYbGo5OXZRN0Z0TUJ6cGdHczc0Qk5ybDRpU0k3?=
 =?utf-8?B?b3JSa0tKUldUOXpiYVFHSitOUk11dVp4V3ZsdVprbFZKZWRsRUZkVFViaUx1?=
 =?utf-8?B?aXpUSTc2bHk0MVhoYnMrZjd4Unp1SjAzRklJNkNvaVFvckVlY3NLeFJNaDhz?=
 =?utf-8?B?QWhIa0g1Sm4rcHJyNWMvUnU3cTV0WTcyS2d6RWRlWllRQmhFKzNMZmtTVnc3?=
 =?utf-8?B?eUtmT3R2UWsvQlJ5ZzhqQUU4bjRDYlByTmdYUmowcnF6NTQxWXBNcTE2OVlj?=
 =?utf-8?B?WTNraHVNT1I1R2kwRFVWd1RRUVcwbFRTTGJOMDlxTkJHV0todlh4NTRMV3dD?=
 =?utf-8?B?VnNHMjhrMHVpcUhxU01LZWFrM2pkckVPaENjQWFONDQwb0FZeHZsNzhCcEhh?=
 =?utf-8?B?ZzBobDhlWUdhOVBEa2VkcXE5SFdnWkI5azlMNWZYYVdmaFZqandkSW5CVFdy?=
 =?utf-8?B?L3N0Nk9RcVgxRWRqSzVRaEZyYUlTaUpneEtsN0htRVF2c0QwVWY1VlhNaE00?=
 =?utf-8?B?dDQvNlpoaThCc2hxVVRITm9GM1NYTzFucmorVEt0dUVBMWFoTWFPWGprTDVY?=
 =?utf-8?B?dE1HM0hXT3RpMDk4Z0tqWmJzelZ5QTgxMXdJV1FVMnVkdG1HK1RleTRVbVlD?=
 =?utf-8?B?aktXQm1Rd1UrR2l0WEF1bHpDYkpmNG1WTG9KOUVFemVENHRlSzcxNURKTlVC?=
 =?utf-8?B?Sjk4L1pGVUxIUWFRb3JxK3V4ZUpzTUszRzRhMFRhVXJHZWNvUjE3eWgvcHRL?=
 =?utf-8?B?c05GcjB3WHFUU3o1UkNmMmFCMEVDcWh0Nk13WVc5bnRvMTBKdlVTTXpyREo4?=
 =?utf-8?B?UVVpdUZDV0lYMlhuQk1WR2xGaStyNzZDUTVMZ0JtT3FGUGhIOC9MS0VyaGJn?=
 =?utf-8?B?UEc0N2FMdVhqT2Y1Z3hoWnZlM2YrSlBnTnRsbnIxSTNubGNBWUZqN3M4RXk2?=
 =?utf-8?B?MmxUR3BudWFOTEFMZEswa0haRVVmUE9qcTRPaDhJUW15QkwvckZZZ1Rud3hr?=
 =?utf-8?B?eGRxVTUxcEdjN2tQdWg4V2RNZHhxdlU0dU42YWo5TVJRVEJqOHI5QkRXaVU0?=
 =?utf-8?B?WjNVeFBLTHNqN0NEdU5BbERleEQyMlZ3alcrcGhpUEZQVWhZeXo2TEdRNUtI?=
 =?utf-8?Q?QOMefDsxzq8TEHv5iCiH0BWn1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb029cb4-6539-4f86-10c5-08db8e7453d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 07:37:27.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kB7oyT5WtJUVFW8VE1cQaeEYEE4/mw21hEaK8D6rldcztvwZ5VpbX+RkX5+yUIdhHMEPuppj0JmFMDcDzlBBvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7144

New patch 2 addresses issues found while looking at pirq_cleanup_check()
in a Misra context.

1: restrict concept of pIRQ to x86
2: pirq_cleanup_check() leaks
3: cmdline: document and enforce "extra_guest_irqs" upper bounds

Jan

