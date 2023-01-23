Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B6677D97
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482891.748665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxTV-0002ZS-QE; Mon, 23 Jan 2023 14:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482891.748665; Mon, 23 Jan 2023 14:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxTV-0002XN-N5; Mon, 23 Jan 2023 14:07:05 +0000
Received: by outflank-mailman (input) for mailman id 482891;
 Mon, 23 Jan 2023 14:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxTT-0002XH-LX
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:07:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2053.outbound.protection.outlook.com [40.107.15.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34d39dc3-9b27-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:07:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:06:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:06:59 +0000
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
X-Inumbo-ID: 34d39dc3-9b27-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J//sUL94lXPcYupt8OCY4F7TdsCz8zcsIXflLKdDvQlWPIFm9X/cVeBMKBu5jPZhTyGfsQBRQLtR/HnU/lRBKZMLubdnqNzZ7qgIPlSdoj2wUZHHmj9JgJra416O55STooyjaWu2vdoEsvq7H11FwaHOkJqmSx2KyH9m6yD1GE0UdgL1DFpA1QNj0lgCIekIA6RuK5gvW/rtVknCBO6G+EJc2cZvwOAgit+6nFi1q6/Q4jDBdG+ljhIvw65bWnqNd9RZlcuwGFrofif6sbaXRqyWGm99pkjYkxZ9Bcwv+b0kVq4ZXPlcV824QJhu0TMz1AXhUbB1xjj2r1g1tj2prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P21u4ASxTbtBeOJs2lFm4pkVDbXGeEzJ9di5SWW6JF8=;
 b=REviq/hnQFkzgF2C1CMasa/1xIsLS+Z11sjwJVtrTkbUBQZk/Oj71QJF8TDPU3B5uUxxLafF7OOGgSgFjQbW/ffzPtE7aqzaBc1JoeW+IGW1gzORtouF60llHIs+rBtyZLYBm2FljUEpS0vqT0QTigQwpgtj/ZT/2S+wm2QW7CiI75EiIfQ+leSaMNXberx31u0pPuflGCH01apQ0wAeIi+1wcWXqRdcbyA5RXFrVJFbmNkVKfghj8FiygziUtdRH5YwYo4m86JNbvNQygUG6F1W279NYJaxxYJx/tN9C+xcp0bYDXhTutbNtmca7NOhNM4UZRr4RsIrw4nGxmxMhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P21u4ASxTbtBeOJs2lFm4pkVDbXGeEzJ9di5SWW6JF8=;
 b=Txt2xOuv99kLr9ncf427pGIEhM+jiCQfD28XuuyCr0bGNSRXcTa6ic8MGxnOQ3vo3jrx754AHEAkRIofMhu63b0Yt4OFLojE48Ja7Rfgy6RMNBZfcttEXV6kl7fn2qK+RHlqMQoHwBK2eKb2POHL/P8C73RpQSQ1mUU/8aNMcBysnRsmQTiW30sTgK+x7N8wc3F2Yq18oUEgNwzAYUtC37I3MAaMXg06h9aORU5678bck4xnXxNH2WgItQR6DcxRQBJZVljdBN/8pQN3yk1PpzwYwTGS/M5lxLVNLHgYntU2yvmW8Jb2ZlXIcJi8CSVJEllS+CsQ5GsdEV0dGNZcvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <333ab24c-3f46-235b-c88a-ebc6ac25f504@suse.com>
Date: Mon, 23 Jan 2023 15:06:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 03/14] xen/riscv: add <asm/riscv_encoding.h header
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <fe153cbeffd4ba4e158271ccd2449628f4973481.1674226563.git.oleksii.kurochko@gmail.com>
 <469c9ef3-767a-358c-5e70-a1e0d9b1a4ca@suse.com>
 <941146ccaf2d4b38ffd05d4d6163fadf46ebb829.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <941146ccaf2d4b38ffd05d4d6163fadf46ebb829.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ab8d53-9479-4603-7c3e-08dafd4b1818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LDzcmikgTBcxjSViQc6M3LdGNW3tjCk5V75UzD3jHdGfHdCWuWiJEW2FO6ajcu4X5KtH5g2Gkr3urA/Bo6R7BDxoxCQysx0EpD+jF43oVkrYDuBLjQKJsgSU06EZKf2rUYUPVuiyOyzMeDknwvMnZQfHIMpIabM9PpiMew77azvPaCRLA/F4iIpIO3kzugAmtmLdrRG/BVK2gnl7muq0sHCf4CPaS5hp4dQuLXYm4uQtadttQj5p/lTLMpBfXJkj+05EtYsO9Ps0mgoxCzuNHM7UJ6dptvEaBbtT8wzxLiiaBXY+LkdXvuKsSWzj+zwS0Uz0otUlsE4DLp+/Yd17Y0KZWhJlGoe1grE4rDr3AWT6aSU+qb0Fahl6TpkN8gE9+57juuPdadyjpz0MHq4Bh/GrN0EURAqL3rV9SZWF5nfhGUZ4oMw+Xe0lwS7L5d//zBJT1OlBUmBHIK4drydQoyIFZybYSW3B8h0miWw8rFhqa6dKiEo+QYbks8G8E/K6B68/4nsup1sZjuqw2LOpTJ741dcYtDZpJN1KQ/8ToY9PGwTstC2GowOw7RFG877mvZWkaRInkmgH0XU2iMTVhzIqKaG7ySIF6Mr8CPlNNs7DzvCTdrI0Enjq75R8WKZb9zEmYlNh9a2BEfweHRwYc6tACSfVMFKXVgh1d3BEFE8NptKUAVN46fHqHa5pITCHzZBRcSSNNACO6OrioRJy5aXmTwLpnDCqsmU75gBhXLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(38100700002)(31696002)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(6916009)(8676002)(26005)(53546011)(186003)(6512007)(6506007)(66476007)(316002)(54906003)(66946007)(2616005)(66556008)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkxibkk5ZjEwNXh1TXE5TDc2cDcyUWd4YThXWHBqekVUa0FqVmlXOEd2dEVN?=
 =?utf-8?B?WXFGUVJpcmtBckV0SGFKS1kvSjdReGNoMDNUd2FDMVdKV3MzOC9SR0NoSHhH?=
 =?utf-8?B?dFJOM3AvVnVGWjRRSm4xR2tkQ1NJdlRrY09SSXdTYUV4NGY0aENEbEZPeDNy?=
 =?utf-8?B?R1N1NTFvVG05NkNINitUaDJoNU1TY256V0FyK0daUDNQS3RsQklWcU82Y3o5?=
 =?utf-8?B?M3pFM1FxYjdtS002eUwrcTNramUrRWNrWWhHcVpZVzBDekg4TGZDQnZGa0lK?=
 =?utf-8?B?eUxRRVFXakxyV09wekRJdDc3YmFkNG1ucE9QbVpBdHdNRDRKbkFmT0hRNVpW?=
 =?utf-8?B?QVVJYldlSUxzM2w4dGV4eDZOWENYZEcrdElEd1o1Mkc2VVVBanlCOUlqR3Q1?=
 =?utf-8?B?aS9taGx4akNEeTRYYjhyT0k2ejFSbWdhOFNCUXhsK1E3K3BvR0h0akdpWmdm?=
 =?utf-8?B?Rjg1S2l0VlZCOGJvdW0vRVFkSCtaYTY4b1BVejkrZUJheWVBd1lmeGE3V3NH?=
 =?utf-8?B?dnd4MGc2YXF3aTdPN2lPK0d4bHBpTWRWQnhqa1lpbzNpNjNWVDMrQ0lKWVd6?=
 =?utf-8?B?eFhBUUQyMzNaVDk2OUNLanlrODdtNFJuNlJIdmQrVllwUWVDTk1Od3Q3U2xZ?=
 =?utf-8?B?UDBwVEtYV240Y2paRVVPTlFlOThuS21nYkxSTTBTZUs5MjVkaXpzeFlDaytX?=
 =?utf-8?B?Q3VURjZQSHlKcHZQOXYzNkM3OTU5QjJMbC9CTkdoU0hWS3dZZitFTnI0eFor?=
 =?utf-8?B?WHc5Sk1vbDBsL3VnRS96S3Vzc3FnS3lseG1nREFaNEFKRUdGU01jOUcxa1FP?=
 =?utf-8?B?U1JsWndEcWRWMnJxTnRjdzVQQjlXOFNRbDdYWThpUEROMFMrc2pFaGNMOGNO?=
 =?utf-8?B?cGQ2bzlsSHBKNGdsWnBDOWhrZWM5Y01JYzd2NzRxNmJvcGs3eXdiTXVlMisw?=
 =?utf-8?B?SVBONGFHZ1MxNUFML2ZOTnNSeUdzYU5DR0xKQ0Frcmt6QnlxbVJaWU5xdldx?=
 =?utf-8?B?aUlvQ1YycTl4d1F2MjhyMDRYdW5pb0l6S1d1RFBJbmZhVlFzMElESGZRRjR3?=
 =?utf-8?B?ZE9KekNUZWw4MFhaVkwwWnpIZnlHRzNoSW5JczNxVmZVbHVQVkx1ZVg2WnJ2?=
 =?utf-8?B?Q2JzTW9zMmhkNzB1bCtoaDQvK253V29QeTNudjI2QS9rbmJPUE1TMitrWGJQ?=
 =?utf-8?B?NjFEUjhtWjBDa2o1NjB6TVMrSVdjU0R5SER6b2pkRE9vUEU0S01DT043amZX?=
 =?utf-8?B?WmRjVHBnakFpVXFPTG9pVUZGZnFBVjVGd0laQzd6MlI1WWJZZzJSWlpjUTdB?=
 =?utf-8?B?RjlzTmJPVTZ0ODBFRW0xYW1lOFhiWnBHdzhMWWlYY1cweUJ6UFp1YmVObG55?=
 =?utf-8?B?aWFQOHdzS1Q5NVhtdjJzd1FNSklmNFRCRVhZR25FMHJCZTRDUGd3OGkvM0NT?=
 =?utf-8?B?cEFzRTlobm9kdGxFdlV0dndoQ3ZNTi9BamQ5RnVoOUxvRUFuN1Yyc0U5dzBp?=
 =?utf-8?B?cTVEbU8rdk5HWnpBM2NEd29wODNmRk5ERHlEZG1tbEppbW54OUROeGpJSjAr?=
 =?utf-8?B?V2FPK0hiQmovelg0ZXQzVU1sZjB3TXR3Q1pPTHgybjdwSU95L090bUZsU1ZX?=
 =?utf-8?B?TzlkRjdwek1yeUhGUzg3UEZvRFJDTGx1bzhvQWM5L1dPSUkxSDRlSnVNSXBG?=
 =?utf-8?B?cXJCVTBhc1ppZ3NXZ2JpK2l5akI0U1pZREp4SnN3MFF0T1dJM2dxWUpYUFlU?=
 =?utf-8?B?L2ZkbTJNSzFYM016aCt0bXJsUzhPKzdQKzNBYVVWRElyMEs5SGRzWjAxbi9j?=
 =?utf-8?B?RjFoZDZwY0loODYwNHVaY1VSK3lVcmx5WVk1eXk1Ti9aYnpJSkNSZzRJU3ho?=
 =?utf-8?B?VDNJeWw3UndPYVZXUk93bklZa2ZuaGpTcy9CbGE0LzNmdGI1SUUwY1FoM1pt?=
 =?utf-8?B?VXpDZkV4VlJJRldQNTFPaFB4OVhJbVpkNitYWDVmcHR6SmFhd3RFbzRGWm9L?=
 =?utf-8?B?b0tVZFpkY1krVjlZSHZjNHZ5eklCRE9xZHlURWNJNlZHbmdsKyt6NStZUEt6?=
 =?utf-8?B?TnZETjBiZHE0V2lzV1RESEFxTFNPNEtGSUdRTkc4ZGRMWTk4Z1J5WHRmNWhr?=
 =?utf-8?Q?Owu1BV6MRoHDyhf1J2WwX+iWw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ab8d53-9479-4603-7c3e-08dafd4b1818
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:06:59.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvJPjxTaYtKnqCfdJ/ZpiADk66eeNXOqS5zG97GYtQz12Gd8rRkE+GI7v9pb3fVTOt9QlQFpLuS72MoelujYqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849

On 23.01.2023 15:04, Oleksii wrote:
> On Mon, 2023-01-23 at 14:52 +0100, Jan Beulich wrote:
>> On 20.01.2023 15:59, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> I was about to commit this, but ...
>>
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>> @@ -0,0 +1,945 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>>> +/*
>>> + * Copyright (c) 2019 Western Digital Corporation or its
>>> affiliates.
>>> + *
>>> + * Authors:
>>> + *   Anup Patel <anup.patel@wdc.com>
>>
>> ... this raises a patch authorship question: Are you missing her/his
>> S-o-b: and/or From:? 
>>
> It is not clear who should be in S-o-b and/or From. So let me explain
> situation:
> 
> Anup Patel <anup.patel@wdc.com> is a person who introduced
> riscv_encoding.h in OpenSBI.
> 
> A person who introduced the header to Xen isn't clear as I see 3 people
> who did it:
> - Bobby Eshleman <bobbyeshleman@gmail.com>
> - Alistair Francis <alistair.francis@wdc.com>
> - One more person whoose last name, unfortunately, I can't find
> And in all cases I saw that an author is different.

Then maybe simply move the "Author:" part into ...

>>> + * The source has been largely adapted from OpenSBI:
>>> + * include/sbi/riscv_encodnig.h

... this sentence, e.g. by appending "originally authored by ..."?

Jan

