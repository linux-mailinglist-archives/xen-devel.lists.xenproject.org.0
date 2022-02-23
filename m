Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F614C17D6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 16:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277450.473952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtz8-0007zS-Nf; Wed, 23 Feb 2022 15:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277450.473952; Wed, 23 Feb 2022 15:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMtz8-0007xT-Im; Wed, 23 Feb 2022 15:55:22 +0000
Received: by outflank-mailman (input) for mailman id 277450;
 Wed, 23 Feb 2022 15:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMtz7-0007xN-9o
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:55:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0053ff81-94c1-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:55:20 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-I3TMdkYmPgaJYTFoRZcTFg-1; Wed, 23 Feb 2022 16:55:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3770.eurprd04.prod.outlook.com (2603:10a6:8:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.28; Wed, 23 Feb
 2022 15:55:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:55:17 +0000
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
X-Inumbo-ID: 0053ff81-94c1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645631719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g+BTFWIs5BREDQuHeksaFpukJARFbQB7XnYaw9EUK8g=;
	b=Z1NmeTU+hhzTQK//6FPHSy6ERg1XhNjxOH2dsjeRKPeOh+2zpEFO8upMoLfOthN/bGSG/c
	q+qeRxzoOPwGysKhWwyALc37NV4vyar9bUMZnHBJGrIAoljkUvasXrvmDQ2izFBk+D3OOi
	Ws4zQWtH/sxMdcE/3cNSng4t8nsp2mc=
X-MC-Unique: I3TMdkYmPgaJYTFoRZcTFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBKMuFmL5gijmuf1DFI20LqKddvnpWrJWsATkUic4PgHvrRWiELfr7i1jmLDZ23rshFg4l+f2axSliv5t4J0M0h+yxoNRrg2sJIQQ7wuvGa4OZRu9rRmH3Wx4wOSY37QOJ5bhHU5hDg/oHMf+tOscqNhUj8ZfjONBgfpQvcwE70SzKBblHpoHe1qkxQBhIq2H6m345nVlZTe4fkQWxLLOPIC+00JNsEO8EgNtDbsuCFO04zpOHI1GS3q5LIaRZ5U3cb6Ed7jdm66F3VFmIsoFeOdS6NSJbO/7GuhJ/S4cYyPWYKE1YBl8v905qQZSjYXL/ScytMmYzKQB9TMFxZ/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+BTFWIs5BREDQuHeksaFpukJARFbQB7XnYaw9EUK8g=;
 b=lx8ybm60RHbRhH5JAFYJlixYR1i6qme6NNaIv8mfIrVZdavw8jacuEh6EpK7iLumx8gnsIBX2uvkdVKs8+crT4mAQsXlbZwlVht2ZfA4CnMoj5cPikNKDn7idYV8gYb3dJPZyDrATbdxFJGtL+Njk3M19xueR23STyTM//1DWslNs9tYZqFMvJLA/W2X0ETyDxkxRwM2DrzvJ7NP6syBveL12rXAyfFUB6W8uIrgYaqwVgu520I7cYkpFMBqdFpPHswgDJ5Gf9BYZPjhDXvItVtgzt3ltd/ynbBo6bepYfU7MBnjlfRlpcGto8VZEdnq5j50cuEusWwoY4Vtpfv/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Date: Wed, 23 Feb 2022 16:55:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/14] x86/mm: large parts of P2M code and struct
 p2m_domain are HVM-only
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0127.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05710b94-906c-4f43-dd42-08d9f6e4e301
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3770:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB377066B626D9317860AA11CAB33C9@DB3PR0402MB3770.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dDS/I7+amyGQrCrlM2zg8RZO+DvKj+T3es6rxJFMt10VMsyqdfL1zY/Xlfxa7lw0pF1csVrtJvpomcBEM0qNoX0+pe8I4ON/tohi2vf5phw+b9i3wYKKQc76Wyx/ErCJWHLtvs3OpAYkUH6OsJryY9bQ8GzFa6759Zs8AlcNStuNNRAuGZUVI+LpriEtxUsKCGT8tZIXGf5vD1OmLi078Ta0RdIM7vYFqGY3vwCjORFJZkX3gz0KmB65TIWHEB5jejI+CrFN5x2NkxQuY+s+9uNlKTDmEalTfcnMXg1BKF/3w4r9Xx0gz37DY7tf+OxQC+buVJ2Af5VBB7ba9Tk408Js8PmOvN4yDjNw/HmArVw5D9kZN8IMmAqFjq27h79Du4oG5otDFzhEIoE4fvTiIyGw+vSZz36qTehbEBoNcMthoY9tOmCcMwiWensL0ebJ6AEx9DGg+/1UQEF3cz4kIxVVAy9Rn4fP7BJ//NCbWgqZf7zHlrflajL++zGk4lsiTxgN23W5n3PMl8diinEeZkjHTIoTs24kMJ5D327UA3vxb7h1USi8z3DV4/5Q7sXz5nlUcVhLPEcIwERR9itZvVrl+8HFIAVLr21yIisrGit10ARXUI/3TncSXjVwuiJcDMy7fqTK5d6H63XNamVT2HKa8hNR6T7cj0LmUJqNyFBcbj6n19FqIuttOt6IkeFp3Cf+mcsMxx8WpOZkJre641pKS31tH7P9Fpe93GppDaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(2616005)(26005)(38100700002)(186003)(83380400001)(6512007)(31686004)(8676002)(4326008)(8936002)(66476007)(66556008)(66946007)(6506007)(36756003)(6916009)(54906003)(31696002)(86362001)(508600001)(6486002)(316002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXFSMzNEMStRZzBDblN2eDBwQkFnK01XZGxoWTc3MlBMRlBicnFTS0I2VDQ4?=
 =?utf-8?B?NTFuRHdMVFlISWx3bjdNWUdUQk5WTTRPQzZibVBVVGtGdFViWTZ4cEE4d0lY?=
 =?utf-8?B?RVU0dlppTjRXT2hSblgycHZWU0Y3NitOdFh3WkU3UytYSWtmNTVHYStjY1hx?=
 =?utf-8?B?K1ppWU5rK1ArVGhSMUE4ckFwcFpkNUUrbVlxKzRFOGlGUmRjSEZ6MVBZWlA0?=
 =?utf-8?B?WVdhUkZ0c1ZJN3l3dXRBbWY3aFh3Z1k4aTU4bzBuSnBRc01ZTHZRYktCQVZO?=
 =?utf-8?B?OVBZSm53ZDhBVWRNeHhHa2Rwb2xYV2ticWk2aExmYkd5M3U2UUF5UHgyR2xN?=
 =?utf-8?B?VmpLLzUvZ2pXVHhncWZ6N2hYSHBZRi8zdHBETzNuNFhKTnBZVWdiQUNuamdS?=
 =?utf-8?B?NW5sMG02eXFFc2JheksvQjZ1TStFeGZoRGdUTUdENnVZMEg5ZUIzNk9HTDhL?=
 =?utf-8?B?OHVhMTQ5TDI4ZG9ORFRQeE8zRlhocnNUdTcwOGV0Y3VXVHQvS0tzTHBtM08r?=
 =?utf-8?B?U3BJZ014L2k4djlvZnRBbUQ4NFhOWmhmcUJmaVlhVVdxZzlHNE9zODFUcXpM?=
 =?utf-8?B?dXJVT3U0Nis5RUlmekxXcDJqMmRYcVNaOWs2aW4raXBMUkQ1RUh6OWNnemNE?=
 =?utf-8?B?UG9aNmNJWVdUTEhzbjJhNkV3dHczalVTbFIxcHhJK0xYRXY4WStVS05hYml5?=
 =?utf-8?B?R2R1YlJZcGdRazkvUGx3NHA4UzlieElCaE56dDlqaHQxYm8zTTc5dmNyUDN1?=
 =?utf-8?B?VHVxU2tZaU1LbFFBRmxVQVVIWUJFRXpDNkhXMG1FUFFjdEpuY3BybW9vV2Zp?=
 =?utf-8?B?OXpReDA1RkxRUjR5RENGM2RaQVo1VFVNL0xpMjh3VVE5UnRlY3F2SUdabVpT?=
 =?utf-8?B?WmFpMis4di81b3VsSEpmWGRaZ3RDMEY3a3pMc0tsL0xuRVNsT0tMazVaT0tK?=
 =?utf-8?B?R3hBdWRIZmx4R3BmVFpwQ0pLRmp5dmdaWWgxVkt2UzF4YVlLRGZ1NnUwWTZs?=
 =?utf-8?B?bEU2NEV2M2Eza2xURlhWS0lnTDhYeWRjZXhJWGdpTkNaNVNaV0lQbkd3VS9R?=
 =?utf-8?B?L0ZKa1dpajRVQUdPcUhaNHZNSmZJT2FKdis3UXNBNkh3OTBKalE3OE11WFl3?=
 =?utf-8?B?Lzl0TUtzSFgxemlBVXh1RldmYzlwZ0lNY1NtNWU0SXNOYldKdTFad0R5Snlu?=
 =?utf-8?B?L1gxWmlnQzRVd01pcmcrRXh5TGJVU1puOTRGVEhyUXlBeFMzeDFTaTMvUEVn?=
 =?utf-8?B?VjVYckdTanFaTzYyMjk0Q1AwOTZWZzdNcVRIbzFsVnNLMDExY0RUUTZFNWZl?=
 =?utf-8?B?OXEyeWwvaTV1Ykk3Z3p2dkwxckpROHZXMXZJVG14bVNpSHp6L0h2NlY5NCtM?=
 =?utf-8?B?eEgvRWRGTVdMalFxK2t2c3lROXhmbEVGZjh1V3pIUUY0eXpySjlCUGxWWUps?=
 =?utf-8?B?OHBZSlJxWWs0ZjFibDFDT0pHRTlWR0pXTVVuTGkvWDJPZWl4MUVmNlVUQlFH?=
 =?utf-8?B?cEZvU0U5eDVNK3phamlTRzdwOXAyQXd5SExUTklLNGc3N0M1VEhwL0xSNHkz?=
 =?utf-8?B?bDJ0aFFtVENBeXhzODUydVFWL21oNHhlS3lwZHVHQUxpQWxsTlEwWjVySkJD?=
 =?utf-8?B?SWhpMmdXSEt4bFg5anVWZFNIa0JXTFYrWDJ3dm1xQVpoWUZyV3dZL3RCUGRG?=
 =?utf-8?B?dXhvbW9Zd3dwM041Tm1RRUxNZEg0ZWRsU2swaWxqb2ZwcFNkcXl6ak9vWVNY?=
 =?utf-8?B?bmxlejdvdkJhK1RNdXNqOE5VM3JvWmcxMFpzZEM0NTIxTVdIYlFUdm0yRkd5?=
 =?utf-8?B?UEExQ2xZL3ZlTnhMLzNmVDNweE0vZmJOcUs1OStSakRvOE5QTS85Q0lFOExK?=
 =?utf-8?B?M0V3OWdCVlQxS0RZMkYxdTF6TCs0UWVFWW1DQysvTllsdm9BcG9lTkdQNm1T?=
 =?utf-8?B?UVZ4bjNlZmVGRVh3SittRjNMYi9ROEUwVDZSL0c1eEZLMzI0TTlZc3ZDWTFU?=
 =?utf-8?B?TGJQc1ozV2lnK1Fjenhla05oQkZMV3RsdG16QTh0MFdubzFIcFI2d01rOEI0?=
 =?utf-8?B?dVBLQUZHYTVIMU9sajdub09XT2Y1OCtQSUwvd3AzbjIrK1hmWnd5UjJDVHh3?=
 =?utf-8?B?NGI1dExxb2oxazExZUdPMldWSHo0c08rTmZKMkdwNGsramc5UTNKQXJOeVo2?=
 =?utf-8?Q?/h2DI34IZadS1cBJyQ/Q97s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05710b94-906c-4f43-dd42-08d9f6e4e301
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:55:17.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnLCNw/v68FrqP3adHbXyYU/p6pgniMp0lvzOueAigXm9uHi01JCQLOa5NKFEnrRZEqM2iPnv9cG/N8ZGFFfew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3770

The primary goal of this series is to leave p2m.c with, as its leading
comment suggests, just code for "physical-to-machine mappings for
automatically-translated domains". This requires splitting a few
functions, with their non-HVM parts moved elsewhere.

There aren't many changes in v2, mostly from re-basing. See individual
patches for details.

01: x86/P2M: rename p2m_remove_page()
02: x86/P2M: introduce p2m_{add,remove}_page()
03: x86/mm: move guest_physmap_{add,remove}_page()
04: x86/mm: split set_identity_p2m_entry() into PV and HVM parts
05: x86/P2M: p2m_{alloc,free}_ptp() and p2m_alloc_table() are HVM-only
06: x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
07: x86/P2M: split out init/teardown functions
08: x86/P2M: p2m_get_page_from_gfn() is HVM-only
09: x86/P2M: derive a HVM-only variant from __get_gfn_type_access()
10: x86/p2m: re-arrange {,__}put_gfn()
11: shr_pages field is MEM_SHARING-only
12: paged_pages field is MEM_PAGING-only
13: x86/P2M: p2m.c is HVM-only
14: x86/P2M: the majority for struct p2m_domain's fields are HVM-only

Jan


