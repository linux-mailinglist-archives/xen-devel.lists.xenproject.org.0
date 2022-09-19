Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC45BC495
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 10:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408557.651295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCOI-0002qd-Tl; Mon, 19 Sep 2022 08:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408557.651295; Mon, 19 Sep 2022 08:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCOI-0002op-Po; Mon, 19 Sep 2022 08:44:34 +0000
Received: by outflank-mailman (input) for mailman id 408557;
 Mon, 19 Sep 2022 08:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaCOH-0002oj-Bb
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 08:44:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47e9288c-37f7-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 10:44:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 08:44:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 08:44:30 +0000
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
X-Inumbo-ID: 47e9288c-37f7-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Le723PQ22HoGx4s8C4ChAbxC32rjvM6e0NrsyvGgM4r6uo+6ZJq3EDt87l/WW+949dJQbhwkmquck8pUNI4DW3pwej60V6UNYND1dfN1FXrc+cOZwXu4ZwZvpGDgQ2K5hXYFEIonY1n1oKStjVWjOBs3qRtt4L2HSyiupGW7yHlJja2LJpknu8B1lERHi6MBDRszklvcjdeJDriedSmKgCPtArc73Y7brqXrEKm3VfIfSnTBMhyDFd8SJ8TQbUe5UsKFR2CMzKX0ZRmgw72RR9hYstQBZe9LCHgBnziuLnV9g8XX2/dT7tVTAF9QuEmyumu/ywwYqzdW/PzPcFqg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C8Z2z0fbTbmBFnSHAFbE3QlZIU3E7qCgbv4J5hAaDg=;
 b=Oih7MFGSLFg+M2FvgEgaY/ZiFjmHMU8WFthdbwWi+ZGdF84PNp6f+TILLYNKGMhyvv/SVvHdpmVDanefEdhbOytL2IblDgMQ8ihiV0/VqrciETPsZWzvW+TMeb/3YfcOxmgbbXFRUDu5Af8vX+FY4vj3aNZNlsefThF0Lz1pwKCRGzDnNp3IKDX12XQtNWffYPtI3OVrx3pTxUPsNZiF3aYuHI1mzT4TWm4fDVyQAijdHXA7nMyX1n+Vp5iA1QI88Sf4xVT8fgVTwt9xkldl4ND1WyXEP0HqRKAB60HFkmDIoVEF1Idgb0hQvKyD74yA4YnqDptQ7WmGseBUx3Njrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C8Z2z0fbTbmBFnSHAFbE3QlZIU3E7qCgbv4J5hAaDg=;
 b=Qb4/EIB8xUujt8oykXwv8guj+HxBgdb4EmASflIkElLhUaMiFCIXZFKCnk2gKL8+iaBBkOdr7ekGu1d7P4ur3SCbvVfDz24n/s/3ydVq6KywcAzCf49jIECYtTNEUkoZvxslBAAh22OeIWatxFntOqYB4rIMQ+17D+oBooY3CSP6uLVfzA5TO2nDfvB4JPc76YEcZSHic40hrrlDcFYEMNByy7F7q0IiER9zrFviZTei5Lk+9xt0mTNVwNSotgFBj1qo4MXfcmixaOOz5FD6D0d2PDamV/PN0l3oeWV5qSFN6Q3OTSIinmGOiU+x/nH9fqtNDDyxA6dxRzRnq4KTTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b0bb561-0bad-5e7c-55f0-4c44a185f187@suse.com>
Date: Mon, 19 Sep 2022 10:44:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] MAINTAINERS: ARINC 653 scheduler maintainer updates
Content-Language: en-US
To: Stewart Hildebrand <stewart@stew.dk>
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Robbie VanVossen <robert.vanvossen@dornerworks.com>,
 xen-devel@dornerworks.com, xen-devel@lists.xenproject.org
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
 <20220919021002.2193665-1-stewart@stew.dk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220919021002.2193665-1-stewart@stew.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0358.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 60877265-cc58-4bc9-cf51-08da9a1b2b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FyS4CR0c7qO7B62e+q8JTb4+0gVvOws8yfTz3Vmn20uAi0sPsWrqt8FCrv47qxnxRMtvNdQp4vTqFfNIkVjxiMhYersvNK2e4s0mWN1IA/vJc9qITVa8734hF7z/McEj1dyaLIdPhgWxXER6caXZbNWRNBU9BmHFhz0DsGVhpEAmFflNuGQUcrn0S9a1upHGmmgqcl/3+hDgo68GQZCZfBocY+L1y4560XSpHT/OB3xdizopceQWygyv3C69mUAD3tSFA9wBqzx8wFBXW22LyOR7PDiq9p2xUoi2hX7g4sDsPdZ5Bb8LUdAIeG+55VTtdVXf751EeAYoJJANxoq0DvFTQbn8wxPhJC+IgHbBsT/9MbzgXOlFQoDnjAMh9wFaEZp0W+09ZCnqbUTElf74l8z+E/OV4Xo0/S9nVPtJy/dgLBhBtQaP9a3ZPOeLT096CGRP+oafsLvJLtGIf7PIni8L/OZVj+aqiTfgn0pCKgCHoeu3DX4HurV05jKVSsN6o/WD0XQSgdM6NSTwNNR0eB7KWjMwMBwPhWE3VwhuKDgv585BMnQ09ArnFABsLiUIXtu+ZPtiAXZbfnP6XFeTRm8hmvJzwIv2y7VKoTKjgM8v5pDNGwaMz3AWa6ybraSY/zanWdZ4ejxAetO6Uk4Tf3z2T73K7K8ritbqVsoSeC5IAMSmUd6XFypSCGWzALwsBWXy6NTp8jpWT/fMsLJvE9qjOlYJoAbxrUr7nUc1I5EvTclk9jR0e6Hpbe66fZUqZx7lB9UAv1ANEerXQ+wvy3gKkmqjSzXHZglP8XvcsPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199015)(54906003)(4744005)(2616005)(2906002)(53546011)(41300700001)(6506007)(4326008)(8676002)(86362001)(66476007)(66556008)(66946007)(6916009)(316002)(6486002)(5660300002)(36756003)(7416002)(186003)(31696002)(8936002)(478600001)(6512007)(38100700002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDBLb2J5R2ROUmQ3OWJucXpJeUJSSExxUW80QmkrK3k0MlZOQ1p2NTFwWjU0?=
 =?utf-8?B?a0JTS0Z6WG04NWZacE5qa29KUy9XU0tkb0tBQm9Fd3pLQnZXQWc3a0FtOEcr?=
 =?utf-8?B?Ykx4TlRkcElHMlhwNFNlOVp5MGFPWGFpdzJlVllaR2hiNkZydG5uMEl4Z1F1?=
 =?utf-8?B?dGhWNjdCd25wQjJ2anlqQVJFT3c0TG5UR3QwWVpRNUgwclVRUDdNUkJIbE11?=
 =?utf-8?B?QTIwVzk4L0syR2tlZ3pKUHRTYm5EVXp2WE1Gc3hrYWR6SmJDUFhHNDNnbnAv?=
 =?utf-8?B?b1ZrUUY1cEVTbjRsRERkR0F6T2dKTlg1ZzA0R3BIb0RKck1MMHNudDJoek55?=
 =?utf-8?B?OFdudWdURzI4OFNCZlZTQlBxWTMrN1JPODJ4L29WdXljb1FtV29hR20rdVpI?=
 =?utf-8?B?KzhKdGhvMndXOGM1L0RYdlRTU2lEU1JHdEZVbU1yNW9nbGN1Y2lRMHRENUUv?=
 =?utf-8?B?MmNIWUpYSkcwK3JLZkdBNURyUGpLOWhSMlBuLy9kVGVPakoxWHJpSENtamM1?=
 =?utf-8?B?SXJGN21jR0cwRlRDVkdWOUllTFVvTm1xQUROeHRHQkRZSitNWDhrVm9XdmNI?=
 =?utf-8?B?SnN5TkxaLzhRb1JEY3ltaDV0eGgvMk11N0hSbVprUUdHcG51N2x5MFFpY3dh?=
 =?utf-8?B?QnRReXdqeVUwWmdQd3hteEFjR3Y2S3cxRkUxakRsbENRSytZTmQ2ek04Nm5G?=
 =?utf-8?B?VDM1eUJKK3JnYXhVcVVZb21McHRCQ055YVZJdGhPOTJqaFgwYng5NkNmZ1Q2?=
 =?utf-8?B?aG5nSW5UeHl6eFNpWUxlczJZK3E0czI3Ui9rSHM0dXQvUitkc2ZJYVJsd0cz?=
 =?utf-8?B?cXNwdjMrT1pDd3hwWXRzM25oL3JpTmQrbEZQajFJZkZqei9zRUdUczRUYWRI?=
 =?utf-8?B?L21SUGJ4WTVMV1F5SHVZNU5ycmVVSWFsNER5VU54b0I5L2VDUHBSRlIxNlp2?=
 =?utf-8?B?Wjc4TzFrVHRoTG1Sdm44bVVOcTEwbmZjWUQ0d2xscDBoNkp3emdEOWs1eXBt?=
 =?utf-8?B?M2ZvcDRXUWI1Yk1wZ1pwd3dFTnZKY3JMQ29handwT01ycU44SUtEMTJmeitw?=
 =?utf-8?B?eHZRaTJqL1VYMHVTQXVBZkxaSWZtbHhaanBUOXpVVmY4NzJaT1lqWVFld1VV?=
 =?utf-8?B?Q2srQUtDRlBHb0ltZzdsK0VUSVJRSnF6Y2hvdmpLaDMrK2hmQzNxNndEOVhH?=
 =?utf-8?B?ZHBhQWhUQUVVRTJWL21DYWpOdUlzVjVyZGc2Y0wrSzBrYTlpeWJVUlNpQTly?=
 =?utf-8?B?YlFhYm5uR1NoRVNTSFR1VVBkcldEWmxXMUNMaTllOG5yakFOOVY2YitaNHFY?=
 =?utf-8?B?ZnRVTWNlWUNUaDQzbFVqaDVTQVY2dVZTNEhFeWZlQmttYldIdFV2L1REU3R6?=
 =?utf-8?B?Q0kwWGh2bU9sNWQ1U3ljS3dPNElJaHRzMXpkNVB0VDI4c29xSjNObmJ1REh2?=
 =?utf-8?B?QTlvdG1iSUZMaGEyMmQrUXE1cmZ2TEoxbE5pd3JzRzB6YkNCaFVWVUptMTNa?=
 =?utf-8?B?SG5CUEgyRE1YWHlqcmJyak8vRE54bFZpVE5jRDlyWnQ0VnJMWFk4U0hMNjBQ?=
 =?utf-8?B?NG1la1BKR0ROVXpWSHJCZjdMTHdSem92dlBGdWN0dWQvcERhbUowei9TY2Fh?=
 =?utf-8?B?Y2lVd01MdGt6bmE2U2pDUmJ6c3JTY25hVWUvMWR4TjJoaWVJTklBTlplZVdJ?=
 =?utf-8?B?RXJBUTkzajRCMlpWc2pFdTAzMGxQbW5wRE9Kd2l0ZkZFVUZwdlc0WEd4RjFt?=
 =?utf-8?B?OVQ5SDNFQTcyNVBHa1pmMm5Qa2ZXL0grM29IYWM3QmRzT01aRzE5WTcvbFVY?=
 =?utf-8?B?WUo5bklNeStVM0Z3dmRpNENncFFxSHBJaGpRWGV4bEdYMm5JRlpMZ2p4RDlQ?=
 =?utf-8?B?MFlkTDU1WVlncTFnTGExV3ViMnF2dkhVUEVJSWd3dzZLMWNJcncrTUcyWHhQ?=
 =?utf-8?B?SzZmci9PVkhEei8vcE9OYUtLZnlhVG9XVjNFN2VqcVRPMm1YU2FIQ2ZGRHVa?=
 =?utf-8?B?MElCcDVPd0RvT3RRSkdmclAvUW96RmtLMzZVQnBzM3JoOFYyM3FUakp3Yy9D?=
 =?utf-8?B?V1U0d0xoMUhhVGE4RFZncks3cmoxRE16VU9Gemt0dDkrMjBPc3N2K1ZQRGFE?=
 =?utf-8?Q?uGogS3Is/wBla2PU3P/am3jDB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60877265-cc58-4bc9-cf51-08da9a1b2b2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 08:44:30.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0l4+vfyDmSTxrlGhJ0fiArVMhtsrhm+1cMGdOmOaesAWVjpuFQ23H84Mhu1zcZ1+VszG/88guy8bpjiT8IcjVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

On 19.09.2022 04:10, Stewart Hildebrand wrote:
> From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> 
> Add Nathan Studer as co-maintainer.
> 
> I am departing DornerWorks. I will still be working with Xen in my next
> role, and I still have an interest in co-maintaining the ARINC 653
> scheduler, so change to my personal email address.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



