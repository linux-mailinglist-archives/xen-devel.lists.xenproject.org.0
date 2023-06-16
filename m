Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590A732CC6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 12:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550067.858947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6Im-0000m3-Si; Fri, 16 Jun 2023 10:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550067.858947; Fri, 16 Jun 2023 10:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA6Im-0000j1-PA; Fri, 16 Jun 2023 10:03:32 +0000
Received: by outflank-mailman (input) for mailman id 550067;
 Fri, 16 Jun 2023 10:03:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA6Il-0000iv-B1
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 10:03:31 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe02::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a35e617-0c2d-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 12:03:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8862.eurprd04.prod.outlook.com (2603:10a6:102:20d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 10:03:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 10:03:25 +0000
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
X-Inumbo-ID: 0a35e617-0c2d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRrOOB6aK+vejteOZdkeQ53a9iXTlrDwnhlss44BeXsBgqVPgTAOdsPK3Ga313+EO0MqNQ7Tv3X9l43eZybhnjh+lfEZyz19BLFO3V+AgyFTY7A5hXH/PlBJXGxVY6xCVXJavAkCK2z5yAspoUzloryoMN+Nvjf0DXMxLhHifxdlSwRFNW8vBuJo+CuqE/89o8jYNQDW/dMSVkSPFeP8ACgoPUfWIj/cKojsxVwPvKGUwPNXGaXE9Q7Q6LCCS8cwjSbEs5xDMakHFYnDBTrV+nZsNp0sMQ3Q6K9nZxsGsnJqtAEggAf2U8J2Lajr29Ia/kbRZ62pPwf/CFRskEVhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJwJM5fP4xmY+pa2eVCUivduNqcf46JT4N73cZvqJNQ=;
 b=Dy3OGOcRI811Yis52okI9bynykILiylTWrX5YemuZqWUCyzO7FXFm0snmRVBC0JolPkPdg3YpZS4wkezL1/nErQgaXlR6vishGMqYRZ4vHcK0CNyjKBPyacKI5NNHKna0Y+fPeE1bcLXJbhd5Jg2Eoq5U2sFsm71jg5fsz5Df4mxJ0sfXjlCvmTJTskCLvRaXXz3QvB+MOOwJFGPe+kC3tugj31JrfuKxnUS5OO+FxcZtccJyyqBECfeaDOv2BeWAfx77sacOP7SWy+8h/IsFX2a+jaSzZjzNlqnYB6SJT5MckFljy/vAXWZFmBNmUSIpLU5A9XG4LWUpnVuS3nB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJwJM5fP4xmY+pa2eVCUivduNqcf46JT4N73cZvqJNQ=;
 b=I/oQPFa5+X6+NhZ0Vjxs9ue0Pke9h9JbCehj//vsnrkKKveaws5zukejdyY5x7PCTtJTXwSQXdxTVwGgLmDYesVcHTcD+6nol+IxylAOZVMFwTxM9OUXeGt/LMoGpkX+jju6aGlqGWkt9Mhm9YkzO67fPuE+bwNGsf9Uv+EWOyma1v84hrQp/N+l5MKUSYRbAAU8dXDXnXCoknJUtZZa3o/AGsi/Y0fqZEbd+7lIpwyBdW6DXa+jLHUdMy93DgBqtMm0i6QWnkMF1r/MH3VIXT1oMk21dGy9mdAZfXG5+8TOckE4/6E1mglWr4PESqEuJiOOAEPcQrr2SoGy1Eo1tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a7fe98d-28de-dd7a-addb-9122226d5419@suse.com>
Date: Fri, 16 Jun 2023 12:03:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <7eaadcb4-8580-b240-4451-5a98c66ebe5a@suse.com>
 <47325b0b-2ccc-6485-da59-2c0a367c2bf0@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <47325b0b-2ccc-6485-da59-2c0a367c2bf0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: eef35b81-bdae-484b-99c7-08db6e50ecfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p4Kp37iZ1jsz3Xe+wJrFPPkTULdtelhBS33RIShB8y+Fa9v+wYbmkqPg4n6TF8Wrnu7+NNMtRasZwpHzpz5u//E8ONdCPZZYlvRYqQdKdHMZvPYrFRVY4cmedGuotgORuYREI/k6tWg2HwyAmL+8kCePVpgyHGFWDgY0KZBo21Ikdq1Z7lF23O7UEMtECk+PD1y2EaG55MMenuotbMXYwOtrIopD7cBHNhXUbSmmIOLOZwaeXnf0g0N/x/7imJzgUQ0AuAwv/kXpGSwKQTuPbKVc1DSBHuFBS+cV7melXboR9rMsaowZf27LY60/4scDY7yDHBgPMbBaoJ6LF4dXK6PXG8G37DVuMkXgKPdvMB3cmbtnNt5Tgt0FKyiZgnPFvhy+JDjaOmlkMmeDy1Gp6cspb9SMU1L/KqTchsh14uUASoUtCQd+ixUPNWRw3HtXd2eG5q+sT+gNDZ5SMnNBgMYJHUhRrPLIawHFPD41XKOSDww1wRpW0WoRywLPwB9WiaHfAwo34LlEBGDlFLhd0PnXOsFI8RCpdp77Dol+djvk8Oyq1K7XU3JKn+ic97ZrLPCpAVAOwgLQCv9xeHGjhN6DA7/l/o+877jmi4vzXWF3SCXGs3XlWrkWv/swIzj1UGd0NZyk8mpMrcYfrNqIUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(5660300002)(478600001)(31686004)(54906003)(8936002)(41300700001)(6486002)(8676002)(316002)(6506007)(186003)(6916009)(4326008)(66476007)(66556008)(66946007)(6512007)(53546011)(26005)(2616005)(2906002)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alBWUEQ5RGVvSFlPV1poaTQxQ2o5My9GNlNHYS82RmVqYk5nRURhWFB4Q0t0?=
 =?utf-8?B?VTRWS2NhK1g4VFh6by8waVFUMU1LUnBVb2hjNUJBMm9TTXA2RW5CcVYveDFJ?=
 =?utf-8?B?OGlOcGZHVGJXUVFsWFpBbFFNMHFkNU43L3lBOWxvTWJJdXRFT3ZJRmk1cEp0?=
 =?utf-8?B?RTdiNzgrazJ4TVFPOFRLeDUydEI0enJJbmFoaG5DQ1V0Y1JPYXpsc3ozNFBD?=
 =?utf-8?B?akxKNTN0VkVCSkhQMkdFMjJmSHpRVFNnZGFqbzRELzMwc0EwVmEyWDM5c1Ft?=
 =?utf-8?B?VWw1d212MFQ1TmFPNDZWQjZVNFgxT3FIMWg5L0tzek5iVmJNblZWMGppb3Np?=
 =?utf-8?B?U1Nmc0NGczhBRzl1NjlCVXhXZkw5aTIrbFlzaFpRbTk1T05tSG5mRXdoYngr?=
 =?utf-8?B?NUxwMUtnVVdQQ3FRRGduUmhrRDltWVVRRENUQ1J5Y1QzeHZhM0tpUTg2VElF?=
 =?utf-8?B?d0VJbVBiejI1NHU5c05PVWF4YUFtNVFQdC83Z1N6ZTJ5TmZtdEpnTXdNMUhX?=
 =?utf-8?B?QkcrWUt3RTg3MHlyWlA1bXlyWVVMYytJczljVHYwb0lId2dnVE5DN3JQVUhD?=
 =?utf-8?B?a2tPY1cwdnRQeDZ4RDQ3cUFPYW5ZeDNESG9RMk1iS2FLMjFpWXpuUDcxenhQ?=
 =?utf-8?B?ZmVIT01hR0dMLzFxNnNGSnhqMWhOejFvdkFNaTZVWWlBVnNpSitKeFpFOHBZ?=
 =?utf-8?B?cHZhSXN6RE1OcEdUVDV1cXdHc0ZQOHphaTMxQ09pTjE0ekpXL1lNUzNxTDhs?=
 =?utf-8?B?cU8wQWtwbWY3Mk9wcWlTOVlrK1NWblV6MDlxNjUwN1FyNG1JcGtmcGh1WVdP?=
 =?utf-8?B?YWJBYUdVeGQvaFkwbW13Y1UzVVZCY3h0WkIxSXhQZVhqblhsaDQ2bFpUYzUw?=
 =?utf-8?B?MkQ0b01IQXJvTFBPbGw4dDFoZkFYNTVvaDY0Ni84ZExGSnBnTGYyVGVBU0k0?=
 =?utf-8?B?MjZDZXFuQzd4ZHowV29SMGhZUjd5andSRjZsUCtOREoybXc1ZkpOTjFVb0JI?=
 =?utf-8?B?VnhrMWtQVXRzbXhwNGNCR3FUanRWRVRoa242c0E3anRkdSswOGhpdFYyaE51?=
 =?utf-8?B?UEdhbDM4KzVUR2pFSzJRdmNGQTBOUzlMNURuZGkzdlF0SkdMTU0vTUlEcjln?=
 =?utf-8?B?ci9KNzQ2Wmw4eWRKSkxIRGlHWnA0N3RRVWptakhLRTRzTHk4RlltRzllekVJ?=
 =?utf-8?B?b0t2YnlUblNRYVppMlY4dk8rWVRmdzZKT01ZOEtuZzFkbUY1QzFMZGVYWmhE?=
 =?utf-8?B?TTEySUM5VUFFNnlsNG5jaEY3SE5EVmRJSGE2YXlSWGpqWElWTzVXNjRkWDgv?=
 =?utf-8?B?Y1dhRmc0T2EvVWR3NnMwT3ZKVjBNeVVMbzgwWGdRNUVyNzZKU09BNGhRNkpT?=
 =?utf-8?B?NitNcnk1Ry93MXZhZVNFUlVWOUIrV3c1anBrdmVBa0xtSmtMOTZDWE9LNDBG?=
 =?utf-8?B?ZlFOampaME5VbTcyTC9uaGpRSHFQSmtTYkZPdWJnYTRucXNZUjA1eXVKTWxr?=
 =?utf-8?B?UzRKRG0rRzRHbEEwSFJSQ3RWUnFBNFBVQmxjcUFmb2EycnlWeXBhSU9VRVZw?=
 =?utf-8?B?eC9EMVYzTEdhK3lqdmxaM1RzU1l3bG5zaDNrRnRnS0tna1czbmFjMXhaa2wy?=
 =?utf-8?B?ejZoMTNyZFBHblU1dnZsaGtsK05HQWtGNjVDMkdWK2Iyd2s0YlZDRW9RMzFk?=
 =?utf-8?B?MEozdi96Qm0vWTdKUHYzSVNiVkg1RGE4d2xxN2IzTFNZTmJlTHB0YmdPYXJR?=
 =?utf-8?B?UmREcUVPME00NnZwYmdieS9MaE96SEVFSElhVm92NjY2dUxlZVBJM3VPVlFE?=
 =?utf-8?B?eGM2V05kSm5Vb0Y5dXFBOExuMkJUK1d1NjRlWk1CdjJndGNubmJLN2ZrVFd0?=
 =?utf-8?B?cThQbGdlL0tsTEMyUFBDaW9nYXBjUnlIOEsrRmo5bFo0RkJaeEVJY2E0VFgy?=
 =?utf-8?B?UWRuSW9aZElaakNOZFdYeU8vNVZaU1VreGQrVWZYTy95M0Q3bC9kRkw1Qis2?=
 =?utf-8?B?TnJjWUl6Tkw3SDhzR2ltNmFCL3czUThSeU95WVF3Zm5OTjVWU0VlajhMTEtK?=
 =?utf-8?B?clgwOUtIQ0h1Z1FtcUJ2MnRtMkdXYndYQ3NCVFhiaEJnL3Q3ZUcvTTdEdUFP?=
 =?utf-8?Q?Lfe+zNDKatPJMSzfSYaJq8Z2t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef35b81-bdae-484b-99c7-08db6e50ecfe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 10:03:25.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spVSzZo+pB1YbmXcQiGldiVhXTzHCECWVLcyY6zIcYUIshSaqLuSFq4cOVEdqUiAp0Ouab+BinX2PhQuiIRWDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8862

On 16.06.2023 09:45, Roberto Bagnara wrote:
> On 16/06/23 08:53, Jan Beulich wrote:
>> On 16.06.2023 01:26, Stefano Stabellini wrote:
>> Another is that it's
>> hard to tell how to convince oneself of this being an exhaustive
>> enumeration. One extension we use extensively yet iirc is missing here
>> is omission of the middle operand of the ternary operator.
> 
> Not sure I understand: do you mean something different from the following
> entry in the document?
> 
>     * - Binary conditional expression
>       - ARM64, X86_64
>       - See Section "6.8 Conditionals with Omitted Operands" of GCC_MANUAL.

Ah, yes, that is it. I find gcc's title misleading (because there are
far more "conditionals" than just the ternary operator), and hence
when going through you doc I didn't spot this (I'm sorry), and when
then searching for "ternary" and "?:" there were no hits.

>>>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>>>> +     - X86_64
>>>> +     - \\m:
>>>> +          non-documented GCC extension.
>>>
>>> Are you saying that we are using \m and \m is not allowed by the C
>>> standard?
>>
>> This exists in the __ASSEMBLY__ part of a header, and I had previously
>> commented on Roberto's diagnosis (possibly derived from Eclair's) here.
>> As per that I don't think the item should be here, but I'm of course
>> open to be shown that my understanding of translation phases is wrong.
> 
> I was not convinced by your explanation but, as I think I have said already,
> I am not the one to be convinced.  In the specific case, independently
> from __ASSEMBLY__ or any other considerations, that thing reaches the C
> preprocessor and, to the best of my knowledge, the C preprocessor documentation
> does not say how that would be handled.  I have spent a lot of time in the
> past 10 years on the study of functional-safety standards, and what I
> am providing is a honest opinion on what I believe is compliant
> and what is not.  But I may be wrong of course: if you or anyone else feels
> like they would not have any problems in arguing a different position
> from mine in front of an assessor, then please go for it, but please
> do not ask me to go beyond my judgment.

Well, disagreement on purely a technical matter can usually be resolved,
unless something is truly unspecified. Since you referred to translation
phases, and since I pointed out that preprocessing directives are carried
out before escape sequences are converted to the execution character set
(which is the point where unknown escape sequences would matter afaict),
there must be something you view differently in this process. It would be
helpful if you could point out what this is, possibly leading to me
recognizing a mistake of mine.

Actually, maybe I figured what you're concerned about: Already at the
stage of decomposing into preprocessing-token-s there is an issue, as
e.g. "\mode" doesn't form a valid string-literal. For other, unquoted
\m I would assume though that the final "each non-white-space character
that cannot be one of the above" (in the enumeration of what a
preprocessing-token is) would catch it.

Furthermore it is entirely unclear to me what it is that you suggest we
do instead. It can't reasonably be "name all you assembler macro
parameters such that they start with a, b, f, n, r, t, or v". Splitting
headers also wouldn't be very nice - we try to keep related things
together, after all. It also doesn't look like __stringify(\mode) would
be okay, as macro expansion shares a translation phase with execution
of preprocessing directives (so in principle the body of "#if 0" could
be macro-expanded before being discarded). (Plus I think this would
result in "\\mode", i.e. also wouldn't work in the first place. But it
would rule out other possible C macro trickery as well.)

Jan

