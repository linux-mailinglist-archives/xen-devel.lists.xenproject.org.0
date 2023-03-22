Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF796C4F56
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 16:21:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513517.794627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0HM-0003gD-7j; Wed, 22 Mar 2023 15:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513517.794627; Wed, 22 Mar 2023 15:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0HM-0003eC-4g; Wed, 22 Mar 2023 15:21:32 +0000
Received: by outflank-mailman (input) for mailman id 513517;
 Wed, 22 Mar 2023 15:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pf0HL-0003e6-Ai
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 15:21:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 380e0d3b-c8c5-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 16:21:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7774.eurprd04.prod.outlook.com (2603:10a6:102:cc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:21:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:21:27 +0000
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
X-Inumbo-ID: 380e0d3b-c8c5-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4rsEGjijkEPyweEIbw6xGlQg7FGxdBIYiP/ChSqmsMr/EFQszCpEGGBYUFgtMJqfrjlFtvQTlecZEUs3MeGWvsvI8q4k4eiz9u6RU0OmF4t4NJFj1ACWbLTGS1XuQaBRHJhXxhZa5EDPdRfnarBLpCkyusCUHb7K0xLfi/m1rqp6rETahdMXEO61cBYK3Fadrm5daXNlvT7Dp4uWXGC9p0KjfpwXY705d/ULOz3a2pd98q1JQpVDjGeYvrXA7BG+l+91F34SE/Xca7tRbVkbvGmy5TeOZN9M75+NXCEDBHCcRM8toKPHzs827QeU0xQ+a8Z+DqZ70AF5pjd6DyeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai43Huxm1AZlXL/xvcOxgS3i7ZVwjIIUFpPEH0FGZoU=;
 b=lfe0NnPjAXBT6Otg24UXX9aBsioDSyqLw/N3BMSa+J2Oq8rl3ZH3D4+8B+BVoQMJeXISnMRihgBHRhyJMnUxBDeEq5ME4uzuA/WbHUiKaY4FPT6wJyU7Lxk6kk1v/GU7k7IerPIXkI6Sy8vjQkATZ29/GZb22XW//kFsyK3Za+XBLFNpkRjjTW4tjf7M7/evJtpXBfs9C1jB71U9YkwS4B21JLBs6L87ARGpp9QOT3P7M1Y2q/31tfIA8LtdhcyQqC2JxwUWJaunDkoDtT/CkEL+pRqgMo8sp5LRVzK5wi+KQoKNLn8ohc3QdCMIce4IGEUpMfBVs1Ev3aM9oEM8/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai43Huxm1AZlXL/xvcOxgS3i7ZVwjIIUFpPEH0FGZoU=;
 b=INP9f+cjJe2L4IEd3bEN8i8KprcTTf3utlEYCWIsUAr/ba0ZwfRjn04uz8IkamzYlnsTIJH+bG4lfEDLtmGxfsXJQyb4FWuK+pllH1Osqhy96yZO5g6o/UAJj0mMyGYe8FaW0sOYzhnexPD4GxMSy5xxQZtmwU58jDUntJsSO+pPq+HiHbIw/I0rS4T7freD4Sw8WMwpECCZKF4zeUc/f+58O+9TSDeyT/nIP7SRzeD9ItzGSJ8/NYdbbZKM+oyM1v38lqqNKAx+knob8aS1R/YJDnmJnsynWC+Fmo1SLnIVBVZNKjdnEIqs0LO0ApK/Zdgo+8aHTatOF1rcQR+vaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <313fd640-5ab8-009b-ed7e-24f1a9389ea4@suse.com>
Date: Wed, 22 Mar 2023 16:21:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
 <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
 <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
 <771418cf-9515-cc93-14c7-4bea60c30b2b@suse.com>
 <98a891792446e72d910ee49a62c7e3b3d2d6c186.camel@gmail.com>
 <486cf6f9-4e28-17b5-3ab3-31272955926b@suse.com>
 <4803eb7e39a66ec8d9db767e979d66034197a358.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4803eb7e39a66ec8d9db767e979d66034197a358.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d05a3e-0faf-42a7-46f9-08db2ae91b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JmkuS19OL/dbBGzmSmDkfCKMkHzBZC25WrykfNwJr/m6WKC334fnxlec0TaV1exWcPpJT2KTpCO1AePdZXdY/UDrKIHBzNPZaGPjovqUWVZdkgK7rvu2zWl1G5SSqyIr6qIp+d0kq9/QHePU/c/pXb3NuWTxKDOKiAqtWlbUnIbDqgs74AiKQpNRwQKQJvVi5eal+upv33IiHlgWKKvc7h0dNBBqW6Iw0cIY1bw9KIz2Fuhes94Gs7E4TeXeuwEnsjPFp/FzT+DMYMxth8IanE5B2k4x+mg2zdimzNMoQjMgm0mfwhMkxiWWHm6Lg93J0gPwdkILAUweaWLc9j2rjPUGdfeZrlIL2RsjXpnRp5fq2blhG/hAVnkMTbC2xiq080t+PaWmsuAji6x85nLsiR7aw3vblEHoxyXFeQf+ONzg/r5Yvj45Lr63ZtfUxFXSlSuG10pJNdp1tcjvKU1Fi5xBwg4beyq/adVOlrR90zg7QlWqwSYxmHDeKpw88Xjmr+/dnIciC2fH3XEeVMPmsUyjSue9wl2p9VKQ8UZxSo3pp5jLJMMWIgJ39zpRi8dI8YR9Hb5l7oMIr8eqSz0JBNxfcxfN82QB/WkbuV+/S2kISo/+t6ygY8NUG1zX5CdTAHk28tRGtUr56KNdAFTY11AieE5Au3BL9FoFsAFouOQb4SotKvPLyQQrpAGpi6JyOXNwbeY7lYULWeHUK/S6ObAMnivYtLCswZmtymK7LQY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199018)(4744005)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(2906002)(38100700002)(4326008)(6506007)(31686004)(53546011)(6512007)(8676002)(186003)(26005)(6486002)(478600001)(66476007)(66556008)(6916009)(54906003)(66946007)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBJQXArTFp3QlZHRlluSVpYNGdnVDhuOEFoWGtTVFFhaXNDQzdsR05uSWww?=
 =?utf-8?B?bmp4cWNLOGpQczRwenhqREc4Vk41RWJVZmhTUHJmUXh0Q0tLQ09rTHpJanpl?=
 =?utf-8?B?UEFlTjJsTk1vTXV6SlhpWFdFMklSdGRlazhOaFc2OFRQZXhKWHN3dFVrMllX?=
 =?utf-8?B?c3MxWk9wdmp6ajJUQWNzMHNnUzBoLysvaGtjM2taZjhWSTVYTTAxczRtem1P?=
 =?utf-8?B?dU1EUXNKQ2tmMDFQUDJtT3ZHWklIRWJLMEdTTmlUTUZpTzJEd2x1YjhQU3d0?=
 =?utf-8?B?ajZQT3g2blN3b3JGamFsTGd4MkxVMTFlZnY1Tnp0M29CZytROW1sOHdIY0NM?=
 =?utf-8?B?L0hVRjZGZkIzTEdDaWVybmU4MXN5MlhOUXZLdWdBbmI1R0JWVXMwalhiZzhu?=
 =?utf-8?B?MDVINE55V21vQUxkKy9hV2xHS3JzcWlmLy9MQmNkR0VCUzJGU0Z6aU5FcTFQ?=
 =?utf-8?B?OS84QitmYytLWERsZFdVclZWVmRaMkc2eHZUS3hYclAyNlpRNUl5bk5UcG8z?=
 =?utf-8?B?SEZoSEIvN3RZNDRYUkVtRmNkQ05WaXdweWE4YmozQzFkTlN1NUtvU2tBRk83?=
 =?utf-8?B?YW9JcGoxeVkvbHVNRk9YMmFVV3hYTWxpazZ5aHc2SVJPdEkxaFN3MnhuNlhx?=
 =?utf-8?B?K1VFTElOYjB3c29zTTZDM1JHNHZiT2ZMM1VWd2lTbXFRTDFjUnpORHB5Z29r?=
 =?utf-8?B?dU1MZzg1Snc0b3dPbHBvOU5kdUN6dmtJSUJBV3A5MnJzeUZDQTlUd3dpbEMz?=
 =?utf-8?B?RDZXeWdPa2FkdStweEpWeU1DMjc2aW1iZjg5MDcrU2VJNlF4MEpXazNPMEl1?=
 =?utf-8?B?MHRXVVhhbkxkUHB0Mzc0TnAzcGxEaWdYMEJPNmc5aGlCZTRGemwxbU9RMnVa?=
 =?utf-8?B?R2lPL21RWklySExrdjhhU2FlR3hHUGxwRkNmem9JN0s4T0t0Y05kdUVtSDBG?=
 =?utf-8?B?TkhFWTFzWk01Q1BtNzhxNUx4UGZWdE1nMERjeVVhWVltWThqb1pRMURpL2xC?=
 =?utf-8?B?ODFuYnA0dEYvb0VXRmxTbU9VcUQrWHVLV1pBb1cxVEsxbDBNaHhLam1sNHhN?=
 =?utf-8?B?YXVwQmJRWERSZ3dFWmdDUkJrZU5ta1I3UjRkME5vQTRCNHZOSEpFbzBPZnZs?=
 =?utf-8?B?bE1JUGdaWXlka0pZdmhSMHNwM1RBWmJ6OFhIbzUxbTYrRHlodW9mWlIwVk5J?=
 =?utf-8?B?WTZVNVZKNFBraHVTKzNmMk0rOTVmL0lYcWsyNXFMazQwdG5UbVRxWWdDcVZY?=
 =?utf-8?B?S1RCQTB4amlZbTRKNFR6dkEreWVNd3owMGRITzZTa0FJMXZGa1JyQ3BkVi9T?=
 =?utf-8?B?cStmcVR6dTBVUW5IZFZHU01EQXNRcThNSWxwSTdBSmFFeDNmci9WMWRKMUNx?=
 =?utf-8?B?WnY3STdrWHRheUwwYUNUQkx5VVlFRUNEbGNpaUkrRmtJL1Y1aTRXNzNuVDVS?=
 =?utf-8?B?QlNOZWZ4eUdvd3hiVDI5dUJ0aDU2Z3FJM2F0R1NnTzUwVmU0bGFpM3h0OFhM?=
 =?utf-8?B?NVowMXF1OWE2NEw5bXRhTDNZWk5NYXU4ajVpTjB2SE81aVRpQ1Yxb0ljd1pH?=
 =?utf-8?B?SzdSWmhWbnVRMFRBRmFTTUhXM0h1QmdQb3RBamhGbkhqSTE0RTgwMFhuV255?=
 =?utf-8?B?Y0JhZkxBMHo0OUIxNFNSZitBeXFsVkh5N2xGbFgxUUVoVkpFUU5OVlY1Vmth?=
 =?utf-8?B?d3QxUFRzanY3UkJSaHhMVS9oaVhLdUxFSlZwdkZxOU45MEswbUdtNkQzOTR2?=
 =?utf-8?B?WkN0a0NhUkY3bHZJZ3BMdDNLYVZlRkFjNFpaZGxPNEpXdjBrbDFFRjBtbTFo?=
 =?utf-8?B?OWpzK0pMVjVYeWVRclhjTjRxZnQ0aUhWbTIrUWd3L3dzV200eUtNZndjRFo4?=
 =?utf-8?B?ekN4NEVENCsvMGRFWm14YzhXdDVjMXVTVG1ZbjFLUTcxVVQ2ZXRRM29YR21N?=
 =?utf-8?B?RVJHNTlFdzFVRFlkYXdlcVlFN1BrVVNuVENhSmhyRUxmVEtFTER3UVlUQXVj?=
 =?utf-8?B?akh1OHl5clNpZ2c3UXFhQktQYTBrRm1RejZTSFpoWVcrS0NxaDBvT0FjRW1r?=
 =?utf-8?B?TkRLU1JjeTZzcU5ZMGRMcFVkeEpBU2dDZ2Y3L25hQ1kzb2FKRkpOWi8xRS9V?=
 =?utf-8?Q?ZtD6/b4dC+CPZ4aSGBncbsogP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d05a3e-0faf-42a7-46f9-08db2ae91b34
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:21:27.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EctU/qctCKXuB9I7aNao0Llc7/fsdar2v6zUbLuwfmba72Uia9CfYUPGUaombIzWtMNChb5mbLQ3yZ+2X65DIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7774

On 22.03.2023 15:59, Oleksii wrote:
> Then it looks like enabling of MMU should go first but in that case
> this not clear what to do with BUG(), WARN() etc as for them it is
> needed excpetion handling functionality and MMU related code uses the
> macros.

It's still possible to reconsider and do the page table building
and MMU enabling before entering C. Or to have all that in a separate
source/object file, which is prohibited to use about all of the
infrastructure. And of course the option of (re-)applying relocations
also continues to exist.

Jan

