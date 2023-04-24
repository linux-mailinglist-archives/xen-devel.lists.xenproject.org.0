Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779456EC915
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 11:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525249.816335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqsaF-0005zE-Dc; Mon, 24 Apr 2023 09:34:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525249.816335; Mon, 24 Apr 2023 09:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqsaF-0005wb-AQ; Mon, 24 Apr 2023 09:34:07 +0000
Received: by outflank-mailman (input) for mailman id 525249;
 Mon, 24 Apr 2023 09:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqsaD-0005wV-Ug
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 09:34:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 275667b5-e283-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 11:34:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8618.eurprd04.prod.outlook.com (2603:10a6:20b:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:33:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:33:52 +0000
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
X-Inumbo-ID: 275667b5-e283-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7B37BzNNMsWBFAfPawM8O2zIx2AbQ0iu0P5bYHXWP/so8yQDcXXprqgcLcUO3qf0XeWPryNKi7plVrxQvJ3Ag2tx3cTiIHUFkcd3aFqBC7kAPH9vDVq9uQkN0ugyQslJH6eT+Ln8PadylCUSs4f457UvbZgEWoFw6pImeKedUFYatxgIEx6KgfFmU1AdS0qCI59Xtb+jM/wX/uMVYWbe+o0p75lZpGmDcMm6qRwXZMBMHYO4FGJ7Ad6Tq8E2s+vwz0gBh24e3O4l5o5kb+dHG014GADrOP925/ooXNz4FHInPF+jlmaEKP7dkOtUGdSHS30bl+xgph0SZI6W0goeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVXAoWc6NXaImP3vs70L3HwSuIwZM40S5vdIuobS4Vo=;
 b=GervMZK2mHwniiYr0asNTgA98YR6WjKRmSiYxaSlXkPhQKSg04DWbnMvPUvfXJS2XiWfH/P3UaKlgZFIFJ+aQBM9ILtoxNd/+bJ5G9iodtw9cFEmPFL8mgX/lthl9xovLV7Q+G82BZAsIHjy4mEL6BwnJBRSt5L1dAt4Y8h/RHCmTd1iqRWBOJhacHt5be3gTCYLSVg3i+Y+vA8ddU+hthvCY7ScPl5SQe+NPIZ1amatRzGOciFfUvPziy3M2xouw2v/HHKCDk/ODjh5K0lrO4e5HQ3Jdy8VN+PEdk8+ZX12Asybv42l3DSOJVic2RiJfdjAgEsEbP7eTBYykg3Jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVXAoWc6NXaImP3vs70L3HwSuIwZM40S5vdIuobS4Vo=;
 b=Nj6IgcmbfYdBHybxURBeHZzRvZ/rlEIzmy9s1k/NUcdZ5/AC+insveCCPENthLLnYrmIcyNMSd+A2fQLMsW/W7xrVNFK7bSSh2FHw+T9BjvlAH98d4/Qzb3wd5NuLwcc9Yrw/zpIjaqaiDRXCMCYknPvGOepL7MHTJriHeTv+qLQI9KVNQRGpQhhiF8lZTPcW46cf0S4fjpmlSofq1whxHHvUHGzMdFO5RB1NDqwzXrfI5ee3lqtCHNN1xtYNl14s3brYtAVi60AjavuIe2JhfODvjLqtA+316NeHQC0qHtxKhUUUVCKADffW5Yhx76YXjh25K5sbOHwdydiHIX/sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <509ba3a2-0b85-d758-6915-7975d31a3437@suse.com>
Date: Mon, 24 Apr 2023 11:33:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd5f1ed-fa7a-4163-732c-08db44a70417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5+QMmwzQt22Y/qH47iM8hoJxL5dE3GISHmTLmPwbs3aph9Kmfr9lKIGJoOhJL989/OrBUDT37iwi8LsC1fLesRmne9N1JkHipj8EUye1LaqKAK7bN7bbO8CMR7OzOaJHz+2FcpOEvIrVkUzOQUwgwar+z5qplHHjDQulsks0ve2s2nGFA4kEupRXE8Fzb9OiHDmwKbznyCHAefKMjVUo+EbRWDUmg9pXVwak0P+Mlam4pKjaS3RYH0DkNkTnXjj+Xl2v3DSsIeUTRQiJaPwgYilSHkodFA6+ca26S5AgAfJqOBiPHugiFGKukh2gDiqA+VuN8cm2UDDiaxsBqmGxxEsuQADrDMJmMYuCqTKGRQJDvWYSqLd0tXjCjgQneOsjgpYzV4yNqCOIaalPexcfjjegHKtcnjvjzXCnoKM/JK0qeIDz4xNFyFyKz6iQa/haTiWr+2LjvMkIsmifnoSNohgc+ZKztu9K0ADQVO9IPtfiIWVWlHpQC8eH/PlxmoaeA5KNjbWJ8LikdXgiUYkEheUZN2OjqLKtxnKNCfXFPDYvSyP8/c1ckcwA/bjdWo1XUHKbPEccp89jS2fBYJP70DXsDNzNOJb4koo1EVa6F03skvF0zJMpTAJ24P+zHBbyjwPoMKQmhdZlLCkJw/H1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(36756003)(54906003)(110136005)(478600001)(316002)(4326008)(66946007)(66476007)(66556008)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(31686004)(6506007)(6512007)(53546011)(31696002)(6486002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJYdk1adVJzbnlkVXhDNyttL1hjQ0hFUFNqT3gxd05LeCt4TXFjR3ZQbkds?=
 =?utf-8?B?K1pobUhBUkpvUGtRVHk2R1NXN2hmRlVYaks5ZFd4Qk9vNFpOSmJoTFROcStF?=
 =?utf-8?B?bTRJUFhqOFUxZ0VqRDNYSW50eW02c1h4b2FkNTdLL1BUZnZZdG1NQ0ROdjY4?=
 =?utf-8?B?dGxhdDdsbWZrMlp4ejZqcmFuSTY3VVl4ajA1R3ZKdHpGTUgyMzlvdjdBQkhQ?=
 =?utf-8?B?MHpGbTlMb3hFK2o1cUhpOGdNbWdRRytONTI0ZERZOEppTU5pc1cwL0s4N1Ey?=
 =?utf-8?B?Z1paemlHc2VwQWZMMW11bzlETHpZbWVvbVFyQlF5Z0JtOWdid1EzdEluMUNL?=
 =?utf-8?B?RUw0S2dNK3FrWW1nbWJTaThLVjUyRGYrbmpjcDRpVmVjTU9HNnRqY0RJRUFu?=
 =?utf-8?B?MUd6S3VFUXhEVVZTT3lteElyRjdaTWkrTG1vVlFnY2dnMkJYNUU4azUxSVBz?=
 =?utf-8?B?d0Vjdi9Zckk0MzhtVkllTHgyc3ZzSk1pNU1HYkNpbk53UFdxOW0zQmZFMW05?=
 =?utf-8?B?YjVaZWZkYVNMT3FXOHdKcmxmalplL0VaWnNmcng2ZWJpbitOS1FYUUxYakg1?=
 =?utf-8?B?RmdCUjhGT1hvTEhSWDBVNGk1L2RwN3pCRHVhYTMrTDIvMmlJTTA1ZWppOWlT?=
 =?utf-8?B?OEhTYkM5Q3ZVRjBNQ2ZibXJsV1lhdkJqRWp0WE16UStTcmZFbDQwTnpvdGVP?=
 =?utf-8?B?S25ZTXVMZGh2aUFSVUxtdFNiM0E1M2t1RTNsd05TNjJHWTErajVaSXFFbjVp?=
 =?utf-8?B?VFB4ZFR1ZGdtQm5lVWJzMFIrbmJjMm8zUGJrVGZ0MzVncFY4ZXNPQjhNUTlY?=
 =?utf-8?B?MHFxcGpxb3l4WjdPako3ZEZNR0ZORTgxMFc2bTFOeXdwSFFXQlFxdlRPd1kw?=
 =?utf-8?B?cUQrNnNKZVhUdUw2U1ovbVA5Tmk4ekRmbEZ3cWxHOWdvdnowc2pXQnFWN3Jj?=
 =?utf-8?B?b0hJNGhVWFg3MTRSMnZHN2F1am5hOXQ3MHhhQXoxbXhHQUJrWEZqK1hCYUxJ?=
 =?utf-8?B?cWtucWJNSlh4dC8vZzFoakZ2YlZ2NXRrcW5sQ0p6bUp5dmZSWmp6Y1ByQW9l?=
 =?utf-8?B?TzhpUWJzS2FHL21zNVRleEQ1aVF5R2pJRkhGQXQ1NUgvUmhTUVU4QXpPZ1Rw?=
 =?utf-8?B?bGRaMHBmTytiTzdaT2ZxM1JoOEViNW10Q01GZGNzV0d3cjJrUWpoa1ovaE1l?=
 =?utf-8?B?ZDVEaHpkNkM0cGpna2ZNODYvUWRad1pxckl4QmtPTkd0QXByZjJjZlRkODRn?=
 =?utf-8?B?WklaM0lwcmk2UEZzbjd1MVNjdFdvbE8zS2ZyeTBxR0NjOXV1Q2VaY0NZYnc3?=
 =?utf-8?B?RVVBaHVSTncwT0F2RHkybVNBSUxrazYwUmlsK3ovVzcvSTFvdjJMeVhPSWFC?=
 =?utf-8?B?VDNibzN6alQzRkRNYUpGcXJpY1ExVk13SVpza09tbkIzNDVRbnR2OFhrL3R1?=
 =?utf-8?B?emRVVkhWcVpleEJFR2c1aE5xdklsUmkwaUduUWkxOEV6T2JvZzB0ajlEb1I4?=
 =?utf-8?B?Y2hBQWo2QzNuamxXSllyZ0JUbFJGU1ViUEp6Y1MyVVpjd05pc2NGN0FBSUxR?=
 =?utf-8?B?N1JkaDkvSG5nUThvUHhhdmVpYi9YemlLcVlQcTFJYzhsaUdtek9NS090QWc2?=
 =?utf-8?B?Rnh1ZzVFSWlrVXNDZ2w5WDVCMjJLR0ZiQVRVNU5pZ1ZqQTdpeXZ6L3hOUVdG?=
 =?utf-8?B?azlRUmt4cDQyc2kweVVzSFFlUERmWUUwMTF3amZNWnNjTlhtWXhQd212V05J?=
 =?utf-8?B?TXpyWWNoN0dUdFhBNHlWWHBPVnBWamM3b3dEbjBZZHhUNUlHYWJ1OUpCVkxV?=
 =?utf-8?B?M1E0dnVqMDZJamMwak52S093MXFtZGtsb3hiUzIzWkN6UlJWcDBlV2hHSlBX?=
 =?utf-8?B?b1pyaXlLSFBYSXFmQlFjVWpML1UzQVFJNC9GaHdKQ0VLVXpoMzlzRkJPM21w?=
 =?utf-8?B?TjJuUDFnbmYvNTZnY3EzRVZYWDM0TnA5Y3hMK2I4ZmhtLy9QMHZ1NERoQ2ta?=
 =?utf-8?B?WXFjSDU0enBVWVVvRkpPOEk0MitUVTRQZUExNWN0SG5HVFh5NG1jQUJ0UnBq?=
 =?utf-8?B?SlJEbENRTTZud1pkNDE3TjQ3QnM1RnpkVGE5QnRqajhSbDIrbDIyUm1haG5h?=
 =?utf-8?Q?fVFoeBFDl44pp1fPs0gHpj5H8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd5f1ed-fa7a-4163-732c-08db44a70417
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:33:52.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sX9F4niDE1Eym4YB4KPRJ853/IW/phtMUBxkn3FAKGPbwLJJzE8f1Kie8kwcu1JJKUqD2v7pyxF0NH5aTJAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8618

On 21.04.2023 16:41, Oleksii wrote:
> On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
>> On 19.04.2023 17:42, Oleksii Kurochko wrote:
>>> + *
>>> ===================================================================
>>> =========
>>> + *    Start addr    |   End addr        |  Size  | VM area
>>> description
>>> + *
>>> ===================================================================
>>> =========
>>> + * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | Xen
>>> + * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | FDT
>>> + * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | Fixmap
>>
>> These are all L2 slot 511 aiui, which may be worth mentioning
>> especially since
>> the top bits don't match the top bits further down in the table
>> (because of the
>> aliasing).
> 
> Than I'll add one more column where I'll put slot number
> 
>>
>>> + *     .................. unused ..................
>>
>> This is covering slot 510, which again may be worth mentioning.
>>
>>> + * 0000003200000000 |  0000007f40000000 | 331 GB | Direct map(L2
>>> slot: 200-509)
>>> + * 0000003100000000 |  0000003140000000 |  1 GB  | Frametable(L2
>>> slot: 196-197)
>>
>> 1Gb is, if I'm not mistaken, a single L2 slot.
> Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
> included. I'll update the table.
> 
>>
>> Also assuming a 32-byte struct page_info (I don't think you'll get
>> away with
>> less than that, when even Arm32 requires this much), there's a
>> mismatch
>> between direct map and frame table size: With 4k pages, the scaling
>> factor
>> would be 128 if I'm not mistaken. So perhaps you really mean 3Gb here
>> to
>> cover for (slightly more than) the 331Gb of memory you mean to be
>> able to
>> map?
> For RV64 page_info size will be 56-byte and 32-byte for RV32 but you
> are right it should 3 Gb in that case what will be enough ( taking into
> account both available sizes of page_info structure ).

As to the plan to it being 56 bytes (i.e. like on Arm): Arm forever has
had a 64-bit padding field at the end. My best guess is that the field
was introduced to have a 32-byte struct on Arm32. But then why
artificially increase the struct from 48 to 56 bytes on Arm64? And hence
why have the same oddity on RV64?

Jan

