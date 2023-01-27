Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E267E85B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 15:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485694.753096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPoA-0007Ds-2i; Fri, 27 Jan 2023 14:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485694.753096; Fri, 27 Jan 2023 14:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPo9-0007B6-Vy; Fri, 27 Jan 2023 14:34:25 +0000
Received: by outflank-mailman (input) for mailman id 485694;
 Fri, 27 Jan 2023 14:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLPo8-0007B0-Fv
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 14:34:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0dc7fdd-9e4f-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 15:34:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8311.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 14:34:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 14:34:21 +0000
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
X-Inumbo-ID: b0dc7fdd-9e4f-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtbqvTNE7IGEH3ll0frhByL9ctjIKRsWCKw/a3jQqOzVlb7qVCxrVVG92y1n2JdLqJQchpz19/+JRnzAZVbfj3YjeVvcS2SnFVlop+SBkTfHc9f64nJJU76CZ66Asf4C5uGvnBmWBjAvL5cpif6LS/NPHnury867PnyXzD0qoUxnKl8/Ju6Ecd8Nb4tPPTcpBzzBHwxj9ZhN/np40EB4P+alHLLt/RlPAhNEwhbGSoFXHwaQTc4zsH+bGUr+abZmM2wSXHZjtotU5hZ5i4CqtqpLj1kqgfJUqP4JqZmULQUUgmivhbwSokGcxfLP0AoBxCoeylhBfM++FueuCK4qJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+y4yvqopXpvgyB8ejzGsOVkvXAMiQzvJ5mjT0msAQE=;
 b=LLWwmvq9idV5EqDU6lA77QMoYQKAQC2q3zAKFGeiyebz5/hgORPM2EEy0F3F047O0nlwzYAQRLjxeOPRqb75zMaNonVZJDto/MQd8uUH8taS/0c2ho+x6qtTvml3oz/+Y3Brx7ndn8KBp+mEtGGeTDgccewKVh8FKB3m/40t2BD9D5d7HWrDOHo1EBQDfQ5hGHkLqYDys8P1p1C7N63yte/r3oTb3kC/UuwcHtD4oEWXq9ENkn3dIzzhjZW37zcL7+27iAftiz6X2xZcg4Xvh4bJFo3h+X4mIhG2ff75NEuctZs5cwDR/NLy84yGq37DUrzV/wSe2Sgq+4vr6+R5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+y4yvqopXpvgyB8ejzGsOVkvXAMiQzvJ5mjT0msAQE=;
 b=Pe6NJAPZ1h5rLQN+rvliWQi2OhN7KE7VLBVNMEBJZ/OD3HEy9N90qU+W8jnPQ7LdhN/CoWozmJiuwGI5RluHpV5r69zuXmAnPZc+10nXo32WyaXZ2Sz2A/to0617OzOXfb6KT3gAmGZkmob5rBVofZOyOqu1f+C1WX+mBnmlkOsA6s0g9Vz+RYLZqnQ2xtHgzommOH8msMAO2DgWjgBGnD6MMe5huMMBMYkpCsJnfEYJ0Rf1Crd30/A9IfY/5AzZA6pfteXaeV37guVs2yGfdzxzfLW3yWc60yotIp0euz6TPaOj6KE/C6WEHl0297bPlltJrU+Kh2FL2XRWO1cgZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0af565ba-646f-1540-0b0c-6a14e73ab5fc@suse.com>
Date: Fri, 27 Jan 2023 15:34:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bbeb45-d255-4005-e1b2-08db00739437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bVxAjqzRzh6mo6ZXTCbovaWWjhDdbtu1hTUZirKf9+8BSfH+yQNuGZXQqUP6sQyIpJ4t6DlfBkhA1NAl/rG4NdlTXtXRIvoGvpNLPIei6Pkyuhz+Wr1EF8DU6jHjf/u5VFvNwaQ9uZ512UMoidd3/k4LRoqHFgkrm7gG5YAU+k0GrlrPkOFaQ9qo1z8BD0QygxucAdBma45lcb6/jQZY5D4AMtdfP11X/wL87e3bgx/L8fKcaazxPlUf4XH3PWF0UnW7wyd1H2DbvBXGgOZbAF6wbwOd41wNPtvrFvCT7MXagygcWuwjjPzx/zSs8ohuf1ENddkqj1W4wjZm0+3VNWlq2KSQyuOndTTHy3S7Q+ecJEpIgIh2tcpm1FX9DdZHcdVfqhhTrizsy6RvzcdNCjogilheMH0munpv8SVvfwpQ8Zg3pKsl9qYN8WY2gukltaTB/0XM4RK46eNf4760DGsyMa5VMCG+1YXz2zvRy7ULFDt3G4+0H/yoMB073HSh9kfGyd/tTeClgIJxIla6MpgMqGtDWSoHDGerrxHaCTsYCVTgNnT+e50naCCpkpXuib4PBmf9pgovOh1tfEcU50+ckZO2GfNu+swkf7HiStP9ylKgxSXUh4BYcSTLIVJfeUZ/djeffNWiIVLTLuDB/EeWqctghLX/WUyMFGjFtsFhwTff9EtfV+Y5nLMLh9EVxkltIC+YlwqKuJkfSjKMZLyhtDtKbq+78t0P5xfhhXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(41300700001)(36756003)(66556008)(83380400001)(66476007)(66946007)(316002)(6916009)(478600001)(6486002)(86362001)(4326008)(54906003)(31696002)(2616005)(8676002)(5660300002)(26005)(4744005)(186003)(6512007)(31686004)(2906002)(8936002)(6506007)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2NER0hWUE5vUWVMQ0dIeWNoSjhNZ2FOSFdYY0R2NmtSTlhMQ3gzU3FxdGox?=
 =?utf-8?B?ZWJHVDBhYUJuakF4b1VGZzNaM1Q3ZzIra2t4MFJyRnplUUdvdkpKbE5uTHNK?=
 =?utf-8?B?dGQxY0ZhbDdYRHo5b3E5N2t2OU1kMjhGWnFvYVo0OHRkand3ZklLRG0xRy9E?=
 =?utf-8?B?eFgyZzNKZUFyelFmdnlHWkhoQXErakNKVUNjbkJ2czJDT2d5aURZWDFCZWtV?=
 =?utf-8?B?SzhkSUlaQ0NRTU53R3htOUVMQWJTQnRCZ283Q0NCVkJXNTJ5cm5EUjFyUzB1?=
 =?utf-8?B?VkR5dGlQUnlHRXoyV1VWYmpFUE5zWk92aHdwaGR5enNFODkyOUlQZEUrU2FC?=
 =?utf-8?B?bjVyRGlqMDh3NjJzVjNuNGJKZGlHMmttMEtTaGJqOVVUMFRyT1FYQ0JMT2U1?=
 =?utf-8?B?TUdUdWJVMCsrNHFBSXlaM2ZGSGJwTXo4bzBzT0J0VnhRRy95RzJ0aEh1SW1P?=
 =?utf-8?B?b25Oc1duKy9CcHFHcmZmblpsQ2M1M1RCODBqVUVIeXhieWdxZlo1QTdNeFg4?=
 =?utf-8?B?ZzY2NmRSc2xwN2JTckdDcGhid3ZmeXVnclE4dCtGcEE4cVB6Q2xyNnBOL3Yy?=
 =?utf-8?B?QmdSVWt1TW9MeGJLbmF6eXZSNGIwaTdDOVNNTE5HNjVFUEZTYko5YlRGK3Zm?=
 =?utf-8?B?ajdEOVdyQnNUUUNkSWRYeCtYd3hXeUlNY0cxdGZLM1BaM3gyeGI2NUdoRStV?=
 =?utf-8?B?WjNhdklNWE1DTjkzOFovbTBVNkVqNDliTlRaTjBWVWgyNnhQS1I5bzRxdFJN?=
 =?utf-8?B?aEV2VnNJQW5TUEJ2b0Ywb2hzczRZZVVtV05OSEtkekx3dFRUQmlSMkJFSjRm?=
 =?utf-8?B?MDBVRWloYkhsRVFnNENqd2kxS083UkFPZ0lpbklvN2VFTG5jVDlyYWhhaXJq?=
 =?utf-8?B?WEc2N1RUUVM1V0x1NVVFYUZZZDluSEZ0TldqWlBLb3FkaVBvejFnYUlXellr?=
 =?utf-8?B?SXB2ai9INmhoTGxMeFNxc1V4NFY3UU5HaGMyNjFacms1eXVlVFdwY2VtZzFt?=
 =?utf-8?B?VXNtY1Erb2QrUTBab1dENUVtdjcyekkrRXhoMFI1NDRodXNvUlJ4ZXcxazMr?=
 =?utf-8?B?TWwrYVpaM0ZhS2JLbHV6MUdPMEQwZDlER0dnM0VrVmVpMVVYQVJJM2dNa1VQ?=
 =?utf-8?B?bzJDeHZ6WlZwbGlmbjlXWDhMKzhKYjBJOHN1NEFoVHNQMWRPS2NRbDZ0algy?=
 =?utf-8?B?Y0xoYnhjeUFTWkszK2NuWWd3bnNKdDN0WnlNSjNpZW0yTmZpZDdVdXR4MFVz?=
 =?utf-8?B?Ulk5ZjkxU0pSOUo1bUR5MldMbitxdVVhNWtoR3BaVko5YVNRRlE3VmhwLzVt?=
 =?utf-8?B?VmptQVUyY1ppT2huOTJuZDNkNmZjYUVHQyszN3pQRXVYRVoxWkJvM1l3enM1?=
 =?utf-8?B?cGlvamd6K0pjQ05nSmZaSENFMWc5U0thVEVFWENZUTNjODBRRlo0K2Jnb1pM?=
 =?utf-8?B?dFNhT3UyWWNSN3BZMFV1d0ZpZ003YmdyZzdBWktEK1ZmZ1hyeVNEQ2xmcjd0?=
 =?utf-8?B?bU9yUUdQK0xKRGlEUnVMZ1ZlNjFsS2hTZmlLWldIRDRTdGU1ai9kejBEbjRZ?=
 =?utf-8?B?OWcvdEZZd0VNUWVvL1F5c29QNjdRLzNPOWxQZHA2aThiWFlSNmhxRFhPQldt?=
 =?utf-8?B?WGlTcFNVS2tPNEF1MEFZQWFmZnNTZ2hmOUo2bVUwdDJDUE9xWDRiVFJiaW5j?=
 =?utf-8?B?eDExcGFCKzh1U2Vtd1h2SlVnSzdQTzNaVnhRMHVjT2FoeHlyQmNWSno1VVRX?=
 =?utf-8?B?OHQrS0lYbTVRMzFqVTBRNHFWZy9UcEQyTXJqYTg2WSszUkdMZDZXRTlqNC9K?=
 =?utf-8?B?OGZxQ09JbjB5VVlPclVXVkJOR2pmVjVmUzZGellzbDc0S05NUy80SmlPakI5?=
 =?utf-8?B?MmUwTDNlcTdveUdrV0hHdEQvRmlUdXc2M1hJRndlOE5RSElZQTVvaXl6bjNI?=
 =?utf-8?B?cDY5R2o4L2F6UzF6UXVqanYxc0p4Qk5PVURoakdzRjVuT0QxS3NTb3JaU2Ro?=
 =?utf-8?B?V2cyd0t0Q1IrOVhVeHNDVU9FN3d0ZkFQZ0FRS3JZM3cwK3VOTXhuL1EzdDgy?=
 =?utf-8?B?bWErcnV6UzRuSEFWTlVpemdkOUgrWGk0RGZvdHo1TThSSVBhVk05MU1PNGdx?=
 =?utf-8?Q?hFI4ZRHEMQNQqc4WPfib+O4bD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bbeb45-d255-4005-e1b2-08db00739437
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 14:34:21.2392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6l6OioiwMYLJkPUZlMNJcaeBF03yt96GVtQukXYOKeQ8v+F9ckScPziUtL6UWlGv9APk93xowALA+L5/nu4vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8311

On 27.01.2023 14:59, Oleksii Kurochko wrote:
> The patch introduces macros: BUG(), WARN(), run_in_exception(),
> assert_failed.
> 
> The implementation uses "ebreak" instruction in combination with
> diffrent bug frame tables (for each type) which contains useful
> information.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes:
>   - Remove __ in define namings
>   - Update run_in_exception_handler() with
>     register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
>   - Remove bug_instr_t type and change it's usage to uint32_t

But that's not correct - as said before, you can't assume you can access
32 bits, there maybe only a 16-bit insn at the end of a page, with nothing
mapped to the VA of the subsequent page. Even more ...

> + end:
> +    regs->sepc += GET_INSN_LENGTH(*(uint32_t *)pc);

... you obtain insn length you don't even need to read 32 bits.

Jan

