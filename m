Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9F94A9AC1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265618.459030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzLd-0000FF-AU; Fri, 04 Feb 2022 14:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265618.459030; Fri, 04 Feb 2022 14:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzLd-0000Cu-7U; Fri, 04 Feb 2022 14:14:01 +0000
Received: by outflank-mailman (input) for mailman id 265618;
 Fri, 04 Feb 2022 14:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFzLa-0000Co-V0
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:13:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1733bcd-85c4-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 15:13:58 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-eJh_Giq2OXur-nNN86ANiQ-1; Fri, 04 Feb 2022 15:13:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7208.eurprd04.prod.outlook.com (2603:10a6:10:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 14:13:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:13:54 +0000
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
X-Inumbo-ID: b1733bcd-85c4-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643984037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0I+uOicoGLR2gEmvaPGEtXmhaI6fI+wk9xTKrgKGjhk=;
	b=Osw2YyujS6zSWjNerHGn67y4Z/AEAL1pOEyr9yoAMm+F/1f1jjUmzi/X93khmvbKMV4Q+V
	y2Tk/smVINoRvq1QkAmR/YkNQIyUg/a/2Oj/P3wOsp3PIKMpYw219Z51wcDqpiPqAkKARD
	02z0iVX30fnw0TMgUGagJcN0NTnpsPc=
X-MC-Unique: eJh_Giq2OXur-nNN86ANiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWEDd3BIN9vCC1f/lOtzWdSxQq/py0jBhSSD1n5sHcX/OuXKaVTzixOuKLq3rCVFi7uVkYrUjmAJAdYI3818Epphv5UI0CsN6qzEjU/A3KZNlyrfjRxzmNvpKmx8quwY0SK5pQcdobTKAU2CnVJOo7Ky2x7YXcSE4W5Ai5TnpuSzdm+WPWWqdIoVgP82lJyeXRthdXDEeSpom85C681CUDGgb23HKNzUPAzswmaPJIO+a9JAE3mkYmqkqJxEe4evxYJY1FOdzYUyc1vXp+v3f+K4kucvqnFc/N/2QF7vpovuSabQpDfyvVX39ofXQRE92ZqSZNQqKJifSCjygbOo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I+uOicoGLR2gEmvaPGEtXmhaI6fI+wk9xTKrgKGjhk=;
 b=PGfVL5qLHEWKxQtza992ZtEPFFxM4UuI0IFM/dmoE9akUJ1+6GaLiQdkuyQVK4EmOAjJBju2Z6w6OlA2bEDUmX0bkwrHt/gLG2QYPD14kpiSYv01PIYS52nTblBTk4+/LwKgEUjZbi/A68pQBxHl5+HdzWpI83CQ1Wx7OCFzL4Pqk0udw18j9t0nAfgGgGbAlaRnQaP0SxpbiGCF4i/BcK/TRW+ChArygPm5LEgIa94czdG9gWLEona4sY5sQo3D6/8ninfIJ4M6q2skcIwuZ3NDdTKTn+/sLmL5PuDzrqWPnktCLZeUDNxky7byvJKNTezGa4+AYRfB3AX+uw7tOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1710902-3085-0f7b-54d3-d65ac5b09e32@suse.com>
Date: Fri, 4 Feb 2022 15:13:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: x86: insn-eval.c's use of native_store_gdt()
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <0d687d64-1cf0-8965-0569-bce27cf0a8b7@suse.com>
 <68c4f398-0494-e272-47e0-6803b6865f15@suse.com> <87fsoyd8rl.ffs@tglx>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87fsoyd8rl.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0170.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a81c7073-8c76-44e3-7c37-08d9e7e8937d
X-MS-TrafficTypeDiagnostic: DBAPR04MB7208:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7208D6778598AC23E3D5FF7BB3299@DBAPR04MB7208.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ziVks6Bs9bpUi5gf//gYBsyXQTRY3Ctcx1JLJUxHaujyXSqjW+CuSW+uUkPaXjcI3VxSuIOznl4UTDWBf2MXIS8ALd1LgboSKZDoaVnsxwMhYb8KLgn6tLPQTRm8Il+szRjResfKLgires883G4Q1L0+eoiopCnfZINHLFmcYGunUIHAN2FxluV50/I4gN+9frx5Y/me+2M+U5KdhQoJw1UpxJZyf179Btxc9e8QCu2SRqtDhqBIH8qnEjJbcrmjL+L7hM6+6lcOvpX4z+tHbOc1o69Zqei6m2GAj4FtIXAsBejAYrrK5Lq1BlC2fKAgomqeX4ByD4MC8n2spDX4M6uGd4mUz9dntpHxjH/e1VhqJzURMzX9z4EthIr5Nmilrub6R+IhNTMN/2m+ES8BB3tygZ32owCm/bAJI1uLJuDxNY56MV02NiMuqIVSh4XMt6Xso6HEtLaPkmq8HIBwjWYa7ndrZ1pPxqHy8aY4kC2iteeczjBHGHc008wpbpJsqrpsJu0AIiVxb2ZeMJgmRKSmTkMaOgLJBDo7LmviLYSm7yWCusBOTy8xpUVKK111hSqkEcLbflNXViM6nNJIBa06anmyc6P1PGwwBUk1bW+2fKhE3Xzj26lpj+h+5M0xseWMnC5nB3ZxKPhSA/afwkX288Niu9QsigkXt5PeLYSFYBmQxvtM4VfIT60KSo6XBgiuhDfKgku07y6brJk2iHgzqLRwec06gPUFCZfySY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(6916009)(66556008)(5660300002)(26005)(31696002)(2616005)(8676002)(86362001)(54906003)(4326008)(508600001)(8936002)(6512007)(6506007)(66476007)(66946007)(186003)(53546011)(36756003)(316002)(31686004)(2906002)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzJOMWQwd2FlUThNcmVlSzVqVzVNcXdNQzBNSzQydE9RYXdpN1lENDU1Q00z?=
 =?utf-8?B?WkJRUnVDaG1aQXFISkNueTVWa3p2d1hoRHE0eWticlh0UWhHWEozczFlbmhu?=
 =?utf-8?B?cEJ6MER3SEFXNDZDQmtGYWFpcXpOYU0wZTBseGFyNHFMNEFtT3U4ZlFMQ0N5?=
 =?utf-8?B?SVAyUTdmNm1kZnhwL2VqbFRjUzFRRmZYTnE2NmZtd2M1bkx0MnAyNnhkZWpw?=
 =?utf-8?B?SzJvNTdocGZxZDFTWEtiWUV3czAzOGp1WDlUdmdoRzhSWkVSUHBWOHd3RDhu?=
 =?utf-8?B?V0UrUXhBeDRsR3NTTUcwYTJWYlIzUi9UTGNqdUVnalpOYnRKRlJ1KzNjdmts?=
 =?utf-8?B?bGVwdGVrL1FPN2VEWlViaDhNMzBaMUcwZXNrZ0dSRGE0KzFCOGpjNmZkSmln?=
 =?utf-8?B?VGJmd2RHbmNDRW5weGVSSWRnYmMzTU4rL2ZmSFlnejBpa2M0UXRoYVMvOWg4?=
 =?utf-8?B?N3VvNHkzeWQ1NjNHclJLdXNIbmppV2pDTHhocWVLVUZvblQyeDM1bzVEdWYr?=
 =?utf-8?B?RW8vK3l0MXdRYUhnb213VGQwYzJLZnB5eXFIQWZwdG55UWZEN0pIeExKT2Ev?=
 =?utf-8?B?a21CdE9wWElLZmY2ZzZzMVR0MHp1ZjB2VW40T3U2Q21scEo2WGNmcDFKb2Mz?=
 =?utf-8?B?aVVHb3lOUk80eTBMZUV4dy9GL0NoTVdjU1lCTEJUN0NsUm44ZXZWdlBmY09k?=
 =?utf-8?B?YXBtYzJqK3Znd0RNNndWOG1CNTdUa0tBRlpkaDlobUZhS2liVFYzSWRrUzNE?=
 =?utf-8?B?Y3gwRGZhZ093WFVmMVF4d3pRWklxUjNlK2FydWt0M3g5WVhDRnBiSFlhU0V3?=
 =?utf-8?B?Ym9qTjNUODdjQWpFRjd2TGlFTW1qYnpiVVREVnNLQ0hIaFlVQkV5VmN0cWdG?=
 =?utf-8?B?YlhhUXNKTFNaOGdqZU1VM1gwNGROZ3hSNE1PNUU4TEh1aHo4c0ZnQkhwZkVx?=
 =?utf-8?B?c2x0UXB6VG9tS2N0ekhLV2V6cnhsSEw3V0Yzd01ZdXl5VUpqSE9KcW5vaTRX?=
 =?utf-8?B?WEw2aEtDUTFPK2wrWFJIWmpnVHFOUlpPaXJ2MTFvYmFUZ3daMmRPSm9raEJJ?=
 =?utf-8?B?dDNIei9vY1NqSENCU0xJV1pOcVptMS9NRWtYM05NM0NvSVN6aHE5V3IxOGor?=
 =?utf-8?B?TWFkd242c3VrYWVJUlBURGVwU0ZORWhFUEIzRGZpMmdzMjhCbXhoVi9LQXpw?=
 =?utf-8?B?TFRmNGNEQ20zZnJLMk0yRWQ5MnFLMUphVFlDVTVIZ3BwZGJVTG1YNTJuUWVQ?=
 =?utf-8?B?bkNrSDM1c3NscW5SN3V6bEptbnJHKzd0b1hNSkZnSFJDRXdXRW11d2FPUHdi?=
 =?utf-8?B?eHJEb2xJaEE4a05NWmNsYVdWdWdQSkZEcG9qUTBTRHdVem9hR01qTXE1V0JM?=
 =?utf-8?B?NE9NalZsNE1qeDBWY3hzMlVmL2tSRDdiOHkxVFBlTndFa3ZiZWRJVEllYjht?=
 =?utf-8?B?OHVxRUJZSzRSWUd1LzhZVDNaTk9EZmppTCtMNTc4ZXFCVTl5dk1wcDgyQkFN?=
 =?utf-8?B?ekdDK1gzMEhoamtSV0N5SFFrM2NiTTNXSEdsUDhlK0xaeTQ1MXZIdXFGOG5u?=
 =?utf-8?B?SEhPNzdBb3BncUpWelRoeXlBQ1U5ajEwY3JXSEUyaFk1R3dqUkpXYWZDQ29D?=
 =?utf-8?B?dkZXa1J3Q2xMcjdaUzRpbXVsa1J6RFhraDFYcGNPUnNHWDFOeE1PcjJVYTFV?=
 =?utf-8?B?UzlWTFJiT3M3eURnR2RJWm5iRjRJRXdvaTRwMFQ5OWV5K1poaEVTblROcnBO?=
 =?utf-8?B?K0VFL0NUNm5RME02RkxpS3IyV0hCU0ZyclBxQmtRQ0lPelN2elE4WkJlUGxs?=
 =?utf-8?B?NjcxS1FBeEZkZ0VmaFgrQXdlanRsbmZCaE1acEdYLzRxd0hOdERsRWRQTWFE?=
 =?utf-8?B?UGZxNENwSnJoWFRjb3p6NTF2dklmTWRReGY2Z2RwU0JrYjk1STUwWGszdVBI?=
 =?utf-8?B?U1ZyRno1RFJtdkIzaEloZ0YvNFprZ1Y3dERxQ1g2Wk9Wa3dCeXc5LzFVK09G?=
 =?utf-8?B?RmhkOXlJbG5mN3NVRW5PSzFIL3ZYbFhzcU9LWFB4dWJaQUhFUjc1R2ZlMGls?=
 =?utf-8?B?TUozQjVFU3pDR0pYN1NyN0p1a0NKOTg3Q2xLQ0QvQ0g4NVEyYllaZ2ZWN3kx?=
 =?utf-8?B?eUFDdmVqZElrNC9EVGxIV0lZY2RGems2YWZhSDNpTjNESVcxcllQYy83WGN5?=
 =?utf-8?Q?PYFfKkGrqNvh4ZSnezayP/I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81c7073-8c76-44e3-7c37-08d9e7e8937d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:13:54.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWPdn7O04mPzLHaJkgfFSee6csCnHylhRTAB/wHgl4PRvFhJgFCx3vFXx7VzA9TITY+LnAU2S1aKzud3NBFRMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7208

On 04.02.2022 15:08, Thomas Gleixner wrote:
> On Fri, Feb 04 2022 at 10:23, Jan Beulich wrote:
>> On 30.11.2021 12:09, Jan Beulich wrote:
>>> I think it is b968e84b509d ("x86/iopl: Fake iopl(3) CLI/STI usage")
>>> which uncovered an issue with get_desc() trying to access the GDT, as
>>> introduced by 670f928ba09b ("x86/insn-eval: Add utility function to
>>> get segment descriptor"). When running in a PV domain under Xen, the
>>> (hypervisor's) GDT isn't accessible; with UMIP enabled by Xen even
>>> SGDT wouldn't work, as the kernel runs in ring 3.
>>>
>>> There's currently no hypercall to retrieve a descriptor from the GDT.
>>> It is instead assumed that kernels know where their present GDT
>>> lives. Can the native_store_gdt() be replaced there, please?
>>>
>>> For context (I don't think it should matter much here) I'm observing
>>> this with the kernel put underneath a rather old distro, where
>>> hwclock triggers this path.
>>
>> I'd like to note that the issue still exists in 5.16.
> 
> I'd like to note, that I've seen no patches to that effect.

I could have worded it that way as well, yes.

Jan


