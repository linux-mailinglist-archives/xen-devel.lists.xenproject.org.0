Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0813FCADB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 17:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175868.320233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5iI-0001oj-IF; Tue, 31 Aug 2021 15:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175868.320233; Tue, 31 Aug 2021 15:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5iI-0001mw-Et; Tue, 31 Aug 2021 15:30:14 +0000
Received: by outflank-mailman (input) for mailman id 175868;
 Tue, 31 Aug 2021 15:30:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL5iG-0001mq-Rs
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 15:30:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5450fd68-0a70-11ec-ad4c-12813bfff9fa;
 Tue, 31 Aug 2021 15:30:11 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-uVGxvCHpMVi-NANfzYssBw-1;
 Tue, 31 Aug 2021 17:30:09 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM8PR04MB7476.eurprd04.prod.outlook.com (2603:10a6:20b:1d1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 15:30:08 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 15:30:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Tue, 31 Aug 2021 15:30:08 +0000
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
X-Inumbo-ID: 5450fd68-0a70-11ec-ad4c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630423810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YrHhJgw6JNniaTdTN/dAOYdsAIUG+a9r5VPgstCwwkc=;
	b=kLR2r0J8yoiIyQTXRVcK0FmbM/Boit/NvNglN3VN/XIvSl5dvZfcKS53cR75t2g4ULryys
	X8bHes2GapEs+ozbWCrTlfrv2aCWNAiFAXkc7kAv2vlfX6CjRgGt/c9T7DxxN/zmTdAeSM
	mRd8lbVJl5xDoKjbGDk90KUwR5SIT2I=
X-MC-Unique: uVGxvCHpMVi-NANfzYssBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjVoBzouN051jMJBD3Msed5ooT8Va+2Ysr87mUwltwxOp7DhQk/LzFXxU0/hza1BGyTXSw3CZo21gsLtWgOi0Aj7s7kCx8AVF+KJ9QLhBoUY3gFkfYq3RlPSOMouyQJ1G4y84oztCO6EK9g2p3hCBnmy7HuYKI5h/xra4sRFTCAUdk+Jqs7chVrJWj6UI93+AK7hpCDTmIQbO5ikzKQEGGNckoRGbED+FvniwRIZ0lN40MOOlSj9nmjqUmvc/l/cpPTIEpm8sbnH/hvfDutrvqjFc47hNtA/5YN2+EBSMdQKioz1wJcmp3JzjxDCiKfO0V97g0WTjvwEGwLMJyA5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrHhJgw6JNniaTdTN/dAOYdsAIUG+a9r5VPgstCwwkc=;
 b=Yka1cRprlzXEq08IOdZrMaeq8lT9uQNwTg9M6IpU4G/iQ2TchkO9G0bx4pjnnt/vO7JdZya4ftP64fVrUqldQ6ndxf7VRU6oN2zPsl3x4WC4Oi0ub0y7W6jx1vXvfKUmXwLyLsuiBoQA4zKI5qsCMVER8E1LVC082p4JCuPdn4AYlsNnoEfxwOwefFwXCEP67z26+sFKjPk3ro3USkn6vzxwrgQo2CCiVBkgR0IkXRySS9JlLkFi/cz7mCZAQd8W9LgAJvP0CjPfrr5sksfQF2Znp06UhMUzQcgR0zlRGqRSFPVyFWmmU0uePvUXiwr8IVBZB9MSWueNPFJoGUv5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/4] x86/PVH: improve Dom0 memory size calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a1c71c0a-8bc7-3f6f-ef5c-a0ef854fab33@suse.com>
 <abb0e218-d02f-a1f4-2d48-3d3d3c681b06@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67c30a53-b0cd-44b8-c446-6b6cdf0e740f@suse.com>
Date: Tue, 31 Aug 2021 17:30:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <abb0e218-d02f-a1f4-2d48-3d3d3c681b06@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::19) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80ded41-8f80-4e62-1503-08d96c943703
X-MS-TrafficTypeDiagnostic: AM8PR04MB7476:
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB747649718DCE6F8356257D83B3CC9@AM8PR04MB7476.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m/6SMu7lAI4c6Qt2UxjAj/tDHwOo6UI8Xvhbt/FPkZZwUWDmuPG9laStqEioq0yGC8cTLxBFYw5RSlVbM8v44y0/RFTkj4I82L6zi0RizdohtXPNoBSJ4B1kE4TgwpFVza3JLn9MFgTXCjtrjyGo2el/tagpi9gNnGv0pVpgnrU9rE/szaFdFzH16aixFnh1hrU7alKVMqSU1oLZGsdAn372UN7yEZ+bxnDD6/uQmreMPPVvGC2DbbY5s7QVUJMWISV465z6isMjJZO8BAyFMrF01NXXO3qceSXvgaez/QA+BH/mQdcL1qzOeU4CvmdTuPJbSKjmtdm3sI2M2D2FVRSUbjPDH3z2sZxOp/6jm+s72EWjSVH0epC6u8w45KUtirYrDetrwamEN3MLDaWqsnCeA3UoS2ykbawnz/tu2RODx/Un50/0YfaBKfwjBQFMhLzV0fPKwPOoXSLamqD8wFict6L+NX3NFtq7RjqEv7UU5knCLhOIu2nFXC6HGZfLcehJfn5l4dPBjQE+FYtyOrAhallqYpv9e1sICXA4UZqHdqrPzy58wJs0a5qSWrWtOl8p8XYW7cl5I32D+rjqpnr8fMg2F9V4W+ykfIPtwofKfBVgHnriaT/OvUKJqbBxDYTUsjMWgBWsBfWCXTg+T82AALoKpicaM1dxsoChPC5YC/GDyVTmHs2shpTdQnsoVFdxuAoDGGLG18ztXyjMTjQKF2Y5SffzhcnpVXMZRFmIrH2C/nFMCPzazQ01OzT+gxMdbtnyhK40Kc79PMWC/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(376002)(39860400002)(396003)(186003)(956004)(86362001)(2616005)(6486002)(478600001)(53546011)(54906003)(66476007)(8936002)(316002)(31686004)(16576012)(31696002)(6916009)(8676002)(26005)(83380400001)(66556008)(38100700002)(66946007)(36756003)(2906002)(5660300002)(4326008)(25903002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDN4d3pwWVBvY2lMRHdJSGFONGZWbnB3aWJQQXBTT0RpcHo0ZjB5RHJBTk5V?=
 =?utf-8?B?cnk2YXdWU0tHSnJFdHdFVm9pSWVJVnhkUWtCVkRUaW5MMnZDMFNaSFZDaDU4?=
 =?utf-8?B?Qk9OSXNlSGZMNkF0L1RyV3RPM3YvR0c5Z282dm9YVS80UWwreG1aNk40UTlB?=
 =?utf-8?B?d3FEaTdqcHhvWFR4VkNrWHNxUGxmUE9hU3hoWlVzdWF5U25PalI5WllXdkxF?=
 =?utf-8?B?YzhxYVgvbll2cE9sK0lzQ1lkNUE3OWNZUlVpTm9OU25Dd1ZTUDF2ME8vTHJW?=
 =?utf-8?B?S2Mvd1I4MTc5TmwveGk4eWpiVnNIbG04ZlNjUnc4MElieWU4TlhyYVIvV0Ir?=
 =?utf-8?B?d21rZFRvWlAzZmRFUXArLzVSbkNzVEhxTUxNOXprTllnQTFuQjF1cTV6WVdM?=
 =?utf-8?B?SmNCbkdyTkdwOElnaUZuN0doNHlOT01tZ3RES0owdTg4eVpCclYwcUpVUTVy?=
 =?utf-8?B?YmowRHU1czJhT205OU9KaHd1SFAyZDI5OU9TSUY3WDZXVytybW42N3FqYjl1?=
 =?utf-8?B?eCs0NS9iRmpvOGdHN2pjT0k5cWJrVUhnVUhUUjFQV3BuSGhEQW10Q2JyK25a?=
 =?utf-8?B?KzJTd3huRU1FL3Nkc1RhMnI3REVzT2ZSdkRPRWtKaEg0Qlp4dnVqU2JmL3lQ?=
 =?utf-8?B?OUxDdUozQUg4aXZRNW9lbXY5YTRKbVpkVnNKYTdPYjJESExuNFdnc0hqNEdr?=
 =?utf-8?B?Nk4xekNmY0wrbmpMdHRWVGluNmhVdkpJajd0b0JCMWxMeWZUbGFXU3NQYW9Q?=
 =?utf-8?B?dmVHYjBwckFQdW41RkhiVTBkZGxMTEVWTTg3STlmQm4wSjN0MlRENnVNalFM?=
 =?utf-8?B?ckxsU2pXMFBDUE5PaUNWREtsWU5PMzNxS1FzTUh3UCtQZ2dwQXNRRHYycjQ5?=
 =?utf-8?B?RTRranA3M3Y0elVoNThicm9BZEVNNzVvOGRraEZKWmgzSzZ4aHF6M1pTZmJn?=
 =?utf-8?B?ZGVLMklGcnhSQjBTTmIzRXNoNUN6Sm5TRW5udkZ4Sk56cnZIQzdmNVNwUkI1?=
 =?utf-8?B?UWt0ZVpHUlAwLzlxY3FDM2N1bnBlQWVwditwcGtRbFF2Y2VVUS91M1F3enY0?=
 =?utf-8?B?cVpOMkZJMHNVWTJ3b0tRZHo2ZDE5bGtBUG5RTlpnNFlrdlluR1RTQXJWQmxZ?=
 =?utf-8?B?bXgyK0RYYzB3NFJNaDRuYmJYTk55VkpzbzMwNTd2Wm1SaDdIa3lMQlJsUzla?=
 =?utf-8?B?VUZBUlNKdXB6aWd5TE5NZWRMZ3NDSlVuRGUxSjFCUDB5WHVxZ0xKbUU0cGdD?=
 =?utf-8?B?UjB5SFgrMnY3czUxbWhRMHZsMkVNRHc4M013aFlZZndCM2ZjcGNKSXM0SnFV?=
 =?utf-8?B?eGRubzNsbFFGelBENmRpeVZtQm1RUzVjUFFCR3o4Mlp1M0hnNmdBWkYweXBG?=
 =?utf-8?B?ZG1XRUNrc05CdHhNUlJnSE5UQ3RieVZCNldRVU5lMHh2V0M3WE4vSTN0WUt0?=
 =?utf-8?B?ZGJ0TzZONTZxNVp1TnRLbDQ1TUgvZzRIU08rZjVWM3gzRmcyeWN6cUFlQnBS?=
 =?utf-8?B?amwwNFQ5Ry9WK2JpQ2xHeGk0VDl5clBscnU2eUNGYlFCbENQajhpWlJoWjVS?=
 =?utf-8?B?S3g1dWFqZHdBa1ArR2IyL21HL1UzVHlFalJKUTRjMW5PN2NZa0U3V1pCNFhS?=
 =?utf-8?B?enlxSURMVk1IMHhrUzJHaW1ieGlaSDVtcnpIeTYzaWVjSzZGaTlsV1NWSldR?=
 =?utf-8?B?cHRwdWRyeUpYSnQ1eDVCS1J6V0REa1hYUHNjeG80R3p3RE93S0VWQVN0YlBC?=
 =?utf-8?Q?CSUr+BHZWLTs90cLYnzSpOSlHlhjbAF8BVABvB1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80ded41-8f80-4e62-1503-08d96c943703
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 15:30:08.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBg97oDGzn4n2dxTEf29pNkL8Ra6mMg30vnypFLF80mwla27iQaf8wMYWp77e38Z1p2BlPB+zNy3u0aPtrgsBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7476

On 31.08.2021 16:07, Andrew Cooper wrote:
> On 30/08/2021 14:03, Jan Beulich wrote:
>> Assuming that the accounting for IOMMU page tables will also take care
>> of the P2M needs was wrong: dom0_paging_pages() can determine a far
>> higher value, high enough for the system to run out of memory while
>> setting up Dom0. Hence in the case of shared page tables the larger of
>> the two values needs to be used (without shared page tables the sum of
>> both continues to be applicable).
> 
> I'm afraid that I can't follow this at all.
> 
> What causes the system to run out of RAM while constructing dom0?

Without any "dom0_mem=" we set aside 128Mb. In my .config that was in
use I default to "dom0_mem=-255". Yet this was still far from enough to
cover the gap between the original IOMMU page table accounting and the
value returned from dom0_paging_pages(). Since this is what also gets
used to actually populate Dom0's P2M pool, with the P2M pool populated
there wasn't enough RAM anymore to reach the Dom0 size which
dom0_compute_nr_pages() did establish.

Putting it in a simplified formula, what we did so far when sharing
page tables was

RAM = total - IOMMU

but what we need is

RAM = total - max(IOMMU, P2M)

In the non-shared case we already correctly did

RAM = total - (IOMMU + P2M)

Jan


