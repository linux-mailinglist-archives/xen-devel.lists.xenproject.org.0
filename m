Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902786779E4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482769.748453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuld-0008F9-Qb; Mon, 23 Jan 2023 11:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482769.748453; Mon, 23 Jan 2023 11:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuld-0008Cm-Nn; Mon, 23 Jan 2023 11:13:37 +0000
Received: by outflank-mailman (input) for mailman id 482769;
 Mon, 23 Jan 2023 11:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJulc-0008Ce-Lw
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:13:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9d1d244-9b0e-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 12:13:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7793.eurprd04.prod.outlook.com (2603:10a6:20b:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Mon, 23 Jan
 2023 11:13:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:13:32 +0000
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
X-Inumbo-ID: f9d1d244-9b0e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0YN2RWMod2WpbWVZbMZdyvQyiX0elouOWxPV1aOIM2ta5R3QQvzWksRINh5cznfN3rtYvXvWOfHGfDEgWbgoGZ7srGa5RP5NJPoinPRIWQG46cn7PEvmCfLSXEocQloV53nGeHesYI80/7Tm/N7kSGG+O1t6Tw1CWgY7NKO9RPoy4N59idg3tKCkQvFzehgkW5tKymsNDNUwlsD4S24X/l7GY0/Pc9Vv3so5j8KpAhxg4gf+GE98hsq3ioV6m2SzX5FWaaOvIVn0r30NShnFD/xbOzQBRKsuGyCb6CQt/WLFdavLWuHkVrUaV75uB4MzA0mAUK52T0pJXDuFyQMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/84V8jh8KuNwpSSuWdYRMCsqzsH2Grd9uG091Yg3zM=;
 b=KL0ltV+mZEhqBIiJtWU0WV0Upydzh9a+tVXXvfhE8g9XPfAAxuzOwahRuaUAKq20cTABQQPjStVBgc6le0gtqgpuEu7dCWT/umHK6tGL+UEQIVnJA2j00OrM8JQ8WZ9WW0qz92DOGNGJvf0t4tUngP/wm8hXIfWicMN+tF/LQHD8ffHYUkn0USWZjrZFHv2OVOzKn+ih2+Cm4rLHo4B2Jeol+4aJ4g08nVVwQur1KDy1+Y4ytZEz9m6/bmaS+/Fd+ec3R4ajiSkyhpubBZ8F+wbVuElNzsKh6CrqO9QhXEiVIZ9PBua+fbft6/1KK9PQ3ABJ7hsVciFGeFNI1wDPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/84V8jh8KuNwpSSuWdYRMCsqzsH2Grd9uG091Yg3zM=;
 b=4AfENTZWaT2BmJ1m67gYpqNee3hRwtXpaESydCOwmHJEzi0OdDO2xcl2j3dzofzXHvQ6lN/VHinkRm4rNoQH40Msmbj+iZk5cgzWPYppjtMV1TK/aov6no8WTT1fHNfg3+U8U5m0SZcoZVOamy8vEIYAx7EghsHiaeTVmsDLYKETxszVYBE9jvoUvhX2MsmyQ3EMSz8cK7I1TKNWSRxyxx5fMA1TiKunQ2OwbBRFdEX6Y4Kg+zd1nlLP1P5dBIApVyI21CLzdeSuieyhGi79wlV0A0R5YsHmFMCzQ1HHAbLdtK+FdhdbZLN2SJN3uZLfQxrCP84exTvD9w57VRJAlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <189b2298-a84c-5fb2-7005-30c3f939096d@suse.com>
Date: Mon, 23 Jan 2023 12:13:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 06/14] xen/riscv: introduce exception context
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00ecc26833738377003ad21603c198ae4278cfd3.1674226563.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da3dc9e-ba2f-4b69-2a93-08dafd32dd08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99V9dxfziJPfp2+uzOCXgWzK7vUsk49Dl8aLK8DsO7BiqSuiAMhWGsvkikDP2XwIlo3LywN9cdy5JbD2C8J00lOD/46rHAGUPgnYLU9X1hKAZV8HNoUvvI6mKRubXJqRGuLM2QRjHVDnGH5NkqoIn30n3FWWE9AImuik3kZHIsqWwr3ZfcRF6mq3fBVfthtW1hVU54mzEAlSbywnV9OhXJ9EYpc0c+5HmeYRdXCj5TiECSU7YC09bk1b2LaJC0TMr8BsLE58akSBiYm+RpLyLgeq8LYHLBw77ghGvaZkyQDdy+3EPIq363AZsPXfK3hBO1/xFYl7oUQmqLw4JYNliwNXHLmZ0+xU6hznMPl4aeGXf//tN3esh4INN4obbEUXiHBd+CCJRhVOwfYIAHiOA9t08O1iHlD4rO0duzAOjd3vxnEgxz25KopSIYerq6Wc4D75m3hcYeZSAkn0VPX97GO5MTEsrd4QyjZM2eMiOa2P3GVS1Ym+gtdhamafQKEGDRVlfQq1Hy5J296OB4FrGU2xKm4XiFrA6rFy9dhNnU/0rm7PE1uayMk3//jtpI8IVnm4ULITPk9hxps4Hqz9NP4M0yMKBEgTTwSK52jUDpibXZveYMBRTyghfw6T/xfe8kqBbHDDyn71M9AMSHYyCnuZJNQydKQcGZOr6DLJCfDPqoXy2Mg0PIDv07qOlYRYaAuH9CQEHPwZlpxntUZ/sL3d/Q0Nc1jKRMzyS5h44mU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199015)(31686004)(36756003)(31696002)(54906003)(316002)(86362001)(38100700002)(6512007)(26005)(186003)(2616005)(6506007)(53546011)(5660300002)(8676002)(66946007)(4326008)(66476007)(6916009)(478600001)(6486002)(8936002)(66556008)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGhPOThEVXp3QkZSTlM5QVNCSkFaZU9VOEZyMWhVSXRaZDE5SUFFMysyNzJ3?=
 =?utf-8?B?cXROSjZ2aG45NGUxK05OeG92WC9XdXBoUTAxMEtzS2Job3lreVpXZWJxK2dE?=
 =?utf-8?B?ZVd2UndmVllhdEtFMkI5RDFJeTVoWUZkeXJCZUNHbS9WSGFGYzExQkZ2UXR4?=
 =?utf-8?B?azdOYzVIdmZ5UWZjSkNZR1VxendNOWNRRVRLaFpyZ1gyVExXcmcyNFo2OWhZ?=
 =?utf-8?B?b3JuUGVQVEgwVE5RamNzV2pSaGp6MFRqVmZjQ0hCaTBQYmZxNlhxYTBqU254?=
 =?utf-8?B?TnowamtKREFuWk9LWkhmeWsxMU5PclhZN3lZUEtFU2hsdXdvZTNabkNSVGM0?=
 =?utf-8?B?dGtJOVh4Ti9BbmwyNWxrcmVrQzl2WVhHTzdBOUwrc0RFZm1hY1U3TmxpY1N6?=
 =?utf-8?B?K3d4U0s0RmNWMHJGenNsak9LT3lkRUoxL0k3RTI2SkJGUGEwUXRSckNxSy9q?=
 =?utf-8?B?V0VNbFNleG5rZkRnNytMSWwyR1RscnhCL1p6M2x5U1FZRGUvZzlHNWhzQ3Ur?=
 =?utf-8?B?bGRKT2N0Yzl2ejN1akI5U1JyZ0Y0ZVJmUGM5VXhwLzdSVnhkMHRxaHFmOTFK?=
 =?utf-8?B?MFlTaTBNTHdDUGtRQStnS2l6S1V6QWdNSlN6K0E2T3EweURlK3hEMTFaWWlk?=
 =?utf-8?B?VWtUYWJtZ0xDZ09FZXRxWTVpaVNPTDR2bGZTOVY3blc2aUlTZkoxK09ET3RW?=
 =?utf-8?B?czRMdnd3dzBNRHZsZXpKQ2JVMnNjeUtCdVhSRXJJejJXUUxLcHBRWFo4cGQ2?=
 =?utf-8?B?SEQwaHVPR1F1eWcxNXZxcUJWWi9LeEJ5bHVDR1pFaXlyMFpBUTA0Y3pBTnhK?=
 =?utf-8?B?d1pSREVWNXBJY0VkSjZqM0ZrRTZ3Z2xTejZ2eEMvblM3ZU1LdjNTN3BDbTJR?=
 =?utf-8?B?VG92QXdBZ0s5amhaMlFPOE1VckpXNUZ0ampLOW1YUXlSR2ZTUjNLRHI1cHRR?=
 =?utf-8?B?Mi9BK3FKV1BOeFN2RWZBd0tlTUlQcm1PYmRZQUFnSldwbEpITGgzRlBEanpv?=
 =?utf-8?B?cXZXc3FlTFZad0dYY3NNT09YYmFqSy9zRk9nVUpJcUk1b3Jmb1loRGQ3d3Jh?=
 =?utf-8?B?U3R2d1JpZ2djRzhreUQrdnZ0VTFRTHJSSk9neEZ2K2hhZnhTQlA1cEJhYjk4?=
 =?utf-8?B?RDdrN25acncweENlYTJDa0srM09UY3JSUTNsTlRTcHFDK0hzdUtYZWhtMk5F?=
 =?utf-8?B?VG01TDdWaUhYWTFjRElIRy8wbW5OWURJZFRqUXlvbWRHaG9tamMyeFdRZ0Q5?=
 =?utf-8?B?UTRLTDRRME1DWFJmSWtnOHZxZ2QwNzBMU1VxUmZQOVpJNDhBcVBhbi9ZK0p2?=
 =?utf-8?B?a2dlR2NHUWFxTXVUY2k4U1Q1MERYa2JNTXl0ZUp2eDA5V0UwNWxDZno5ZWxG?=
 =?utf-8?B?VlN6aTVHeFk4QVUwMkh5OVlqRmFwUzQweUkyelFMdnBHUGlTNVg4N21zNVBa?=
 =?utf-8?B?Wkc0R1c2QUVmdE5UUU85bHFpK0RHcmtXNU9qYVp4RXpHWE9ETW5VYUdHRzhn?=
 =?utf-8?B?VE9venZ5K285dGJDbi9sMEJzTkQraUJicVg1Q1hJbVNJTU9VaHNiWnFpbFdH?=
 =?utf-8?B?dmJ5NzI3a3NxR2NBWVdpMWxNcGhXVWpDSno1LzZYRndBSk1wVjdPZ05GK2NO?=
 =?utf-8?B?NFBzaUFSRzFWL1llRkNEMG5hd1Z4ZUk1eFFWSk13SzVvZnlIeVg3bEJJaWJv?=
 =?utf-8?B?ang2Q01nOVl3b1VmK0tOT2Y3SXI5ZURMMWplSk9QQm1wL2k0ZU1rWUowbkov?=
 =?utf-8?B?VGpIUmlSdzg5UERqZ0pQWmdtdURSWlYyMkVWMlRYZHRoeWhUdGQzWWtKWmZo?=
 =?utf-8?B?NW1abVdMSS9pV1pRWEFzbWtYSERBRStaMnlLWk9oNzUvNUliQWp4QytwRkF1?=
 =?utf-8?B?RS84VmhsR2FuZ0tRNFc4ZVZENXZLS1JxQ3JISE5Pem42NzF0bmtEZkVaR0M2?=
 =?utf-8?B?SVZWWVJGWW4zMUljZFo2aWFZZDJyUjBxSE9XNEtBYXBLajUxcHQzL0NGYUFs?=
 =?utf-8?B?bGg5eGNxalFPTmtTNnM5MDdpbml2WU5UOXFsSnFSVWp0MmtvY0VRbnhFcmEx?=
 =?utf-8?B?dW5jZG5KeXVzdVUreEZINFN0ZVFBNHVjbFRrZW9rcWxxZ2oySjNpZTBLUkRK?=
 =?utf-8?Q?YRLUG9er3onpg+ghSNmM7I8QI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da3dc9e-ba2f-4b69-2a93-08dafd32dd08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 11:13:32.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dC3SnF3uRWZmnDHQZEDCIuWMgX3HLphg71nHzchyDrthZVn+AgX0oWGDSM6S4zWeGIZNQLHWGLNDLEZZWAk3Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7793

On 20.01.2023 15:59, Oleksii Kurochko wrote:
> +/* On stack VCPU state */
> +struct cpu_user_regs
> +{
> +    register_t zero;
> +    register_t ra;
> +    register_t sp;
> +    register_t gp;
> +    register_t tp;
> +    register_t t0;
> +    register_t t1;
> +    register_t t2;
> +    register_t s0;
> +    register_t s1;
> +    register_t a0;
> +    register_t a1;
> +    register_t a2;
> +    register_t a3;
> +    register_t a4;
> +    register_t a5;
> +    register_t a6;
> +    register_t a7;
> +    register_t s2;
> +    register_t s3;
> +    register_t s4;
> +    register_t s5;
> +    register_t s6;
> +    register_t s7;
> +    register_t s8;
> +    register_t s9;
> +    register_t s10;
> +    register_t s11;
> +    register_t t3;
> +    register_t t4;
> +    register_t t5;
> +    register_t t6;
> +    register_t sepc;
> +    register_t sstatus;
> +    /* pointer to previous stack_cpu_regs */
> +    register_t pregs;
> +};

What is the planned correlation of this to what x86 a Arm have in their
public headers (under the same name)? I think the public header want
spelling out first, and if a different internal structure is intended to
be used, the interaction between the two would then want outlining in
the description here.

Jan

