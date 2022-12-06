Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01C644248
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454742.712285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WJ9-00059v-QZ; Tue, 06 Dec 2022 11:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454742.712285; Tue, 06 Dec 2022 11:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WJ9-00056w-NI; Tue, 06 Dec 2022 11:40:19 +0000
Received: by outflank-mailman (input) for mailman id 454742;
 Tue, 06 Dec 2022 11:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2WJ8-00056l-Oq
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:40:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1afcb8f-755a-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:40:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 11:40:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:40:14 +0000
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
X-Inumbo-ID: c1afcb8f-755a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOXr6zIlmvhHp4G7qbgd0a2zhv0ACW3eJtuikeeMRYuCknCtyMipFtBMiZPfF1RT/P87O9WMpw/e1/cKUmE4IkrpIhcy26hGWoEbdVAOepida+QGitm957RIG54Ezt8LZxnRn+SZD6EPEknZ01Iy3GQ8MQTzJDwSR7veVmDYjIPe7yvPfutnrx922rNjoc031GWAYXxMSSDdfNn1CZx1f4Fj3Zh8wSkwI+tIy52gsTbnnt4NX8sGeXqob13UND1MHk8VztVm+tC7w0LIf2OQ70z1xjol30wVly0hpx94SGUkSKV/oDvoY4GpRb+SkxY+2JV4mJFwfKHfSfR9Nql1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCeKnA6H7N/iGSGcWedIhNbrmd2hJNWv5GVJcrelivU=;
 b=AfM/aobO+j4/rDci1n1KG4HahcWBxcTd/0WFUTX9EdMS77d9A8qW713hGlOA6N+Xv8soOV8U6RjNcQGdCAv4/SknFecOLykUqZ6JbyaEkcR2xKMXNNhCGFABjpvyMqYOlwdGS4erNYgKo0zHBSQCkBXGBAU0KkQ3wX1jx6WYdXF2C3S9xnyjihVM+gliB3Isch+wftGziWFf+cRnrEFG613IpyNhA8cfjoqORjt3PsktNIc4pwXMhiAy7lsQTwnnT4aGNC6ezuUrjYSCiGtdpgN7aVYJppljRNl99HY1hB2YlC+vSvCnlC1XybbAfQS2Awm/P8Tv1Kkz7EwqgogLcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCeKnA6H7N/iGSGcWedIhNbrmd2hJNWv5GVJcrelivU=;
 b=D+tjcAtlkH1k0DEVKTb2mg1rTwwoERpszhJco0vYKR5Yz3I+FnauDmbJ5czDRt9QKVKixY8c3XPiXnbg17qxp92jdpxv+trBWgUSljehBNAD5nt5AoVAXQbkDNB3Nw/Zqay93mWqYkLlNALeTU7Lup8oDvG8CAJ+Yiro+OJnBMNdCBJUDLKGrIVg9CMeSNQhm6LRwJmgrYah0Bet2WS1Y6ErY9ieWv4h5ZAZWRJpIoT9SjducxQS3ZZV7M6NyqACk3xzodpUKOjOgSfu7mmBtjTgyFX6AAt9mZ+C47sGDX40oWmmE/h13C3BbwQ3AhaWgOrKCj/OX9hRjst9O6bBew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <265bd946-b0a0-f9bc-becf-afff7f67511d@suse.com>
Date: Tue, 6 Dec 2022 12:40:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
 <4f34f039-b0b9-1761-b5d0-936f25e8a50a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4f34f039-b0b9-1761-b5d0-936f25e8a50a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 97635269-2ef9-4689-9604-08dad77ea3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WSV86HJ3LjC1w6S3sttO1qJv4uBKJTQXhj0MxCPn2WIKIsENJ4zrvNmXZSDB6I+K5rcZ85tS6QmdtrTIjWEQfLXXQ6ofMWzMc3XZmYMwY/P9y1nLL3m0Det5xMhQL+317J+rNMRq9bCm2MCEp6pVNomD+/aUecgV2B5bXdZrxcnMOGimxh9iQq8lzivpy9k1LyqKJYNR4JjxnMRwtSE0OmKO43dhD/3fq/L70D10E6Rc7LkC4cFNDIigYk6aIrCR918V73bQhFO8F1qn9cxrhLvc3gNjuyXXDEpBQs3fCWbCkYk7hoR+rQtbUToSlbgLpP7632D+A9XzPFFVJxtA8Wr5AW1vY1gpWZAHX9HGJWDlfMetFtea0kbZvyQL050mM9dPhzk/nNUqUTeEJ3rE61jTxFC7xEw/zRTqHIjcnfpeOEZY5cXW0Atv/gFPTjMp9Pcksl9fPnGf8QM8MUv63mmlnoV/gddLuMc56Pzhzdc6tXOjseXnPqJSMqhGyPPmGKo86ohgH9zGTNiX0qM/NAEp0JQjxllKXI5MuKe8mVQz0UHhvlHP/eMsmGmRQGraM353yDBrzp+9MktILEynM3fvqd05X1+oxpk51tT195Tk1g7lMxAKMNEuW9Z7V/YvfrtMxAEvQwEkBtVzFBgyhdL/LS/9Dg3euU+7uq739lcvVO4hGNlhLSq2dvRwvdnOhXWwEGj6lBJjFS/foZnzZQPwAMdZkiRa9iBKE1piUHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199015)(31686004)(478600001)(31696002)(86362001)(53546011)(6506007)(6486002)(36756003)(186003)(38100700002)(2616005)(26005)(41300700001)(5660300002)(8676002)(4326008)(6512007)(66476007)(66556008)(8936002)(66946007)(6916009)(54906003)(316002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEoyK2FyQyt3V0FVVmtXa3dScHB3ZHdtUVBveFlYR1IyM3l1dzYybkFNYlln?=
 =?utf-8?B?VnA2V3ZnMEJ0VlFHaHZZckN1U2hzZ3RhOUJjeWZHbVN1Qkh5SWwwY3NqYmxH?=
 =?utf-8?B?aGJGZWlUc3VMM2I2cFpWNVA5SjB3djZKVzFndkYyZWdpSGc3dXhCK2lGeGxW?=
 =?utf-8?B?UWI0SnAwSVYxZ2JFY2ZDVzluS0V2aGZMY1BkVmNES0NjaDJLUGt0M1h4bkYx?=
 =?utf-8?B?Qjdzd1FmWk1PbDBnb1o0MVk5cXFObkhSWGRaWGQ1QTNSNEx1aWhTQ3d5M1Fl?=
 =?utf-8?B?QVRIWGJCRXExV213bDBYN21TQVFyU0owSU0rS0o1b25rWFJZWndzS2k0WlZS?=
 =?utf-8?B?dFZncWF5b0xQaDlkT1dyaTAwTXBrZEFQV0hpTyt2OUM4bXJZbmdKamhVSDBq?=
 =?utf-8?B?Wm9qSG1DMHg3SmNtbXJDT1VkYjBhUlk3aUIrQWZGRHIvTlhtZjY4NFJ1SWs0?=
 =?utf-8?B?TklwRFhSSTFWaDYxUVlZMjdPTVhSdUl3MW9oOWNRUjVFRllaZ0w1WkdTUXYr?=
 =?utf-8?B?blRmQi9YUHk1SysxbkF4VTdFTVo3SWpaSm5VbTViN3dxNnErWjIrTExkZlRE?=
 =?utf-8?B?Tm5ZTVprc1RBRnAweWlnN0lOZGR4OE5sRklaRHlYUDZyVXJ3dEI4ZmdmbWZG?=
 =?utf-8?B?WmQ0aEtXcCtaclA3S250ekxrNXhiRVVPUjBrcWtiV2JWamxKd1NUUTFkZDhh?=
 =?utf-8?B?V0pLZ1VhSTBiZERuSW1NTHpDTTB5Smd5bGQ0SXlWN0dYcUdVdEx3UU51Q01M?=
 =?utf-8?B?VnlxbmtlWDhWSG9mNVZjUFE4cmMzTk1Lc21LYVdHT3k4ZEpmbEFnenlNWlMw?=
 =?utf-8?B?RSs4aEJhUDJINWp0TjlZNk5QaE50WGFoRkJmdFRmVGJVZWZmZWtNNXpZN09M?=
 =?utf-8?B?eldWQnpFWHhYVHFiMEt3WGhjbmNVWEpoWkk1bm9oL04yT2NGaHdzNlJOSXR6?=
 =?utf-8?B?WVJkZDViQW5hSm1LYi9mY3laeVFORTMrTVM4bEkyMUVKVW91MDZBTzE1Lzdn?=
 =?utf-8?B?LzJUNzVPaDYyd1VoZjlNM1NZRXY2NWRNNXYvaHRqU0dFU0VpLytZM010SjQw?=
 =?utf-8?B?eDhsUW5MVU1uV1l6WGU5Z01xVG8rempvTlVra1hBWk1tUzNScXNJTld1N3Fr?=
 =?utf-8?B?NlVCL2lhNTNad3pFTWExNzQwOGdTcFFmQzJDcHVCRGM0am9zelhqK2I3T3lt?=
 =?utf-8?B?dnpIdmxJSlpZUVg3cjNuNFdFR0pFL2x5WnJWRTFrK2NUUVQvUkNLWGRScm9t?=
 =?utf-8?B?VDgyeHBxL3VpTkFSemRzbHZzTEFmZWxrTnRXdmNnSmZXcFdFZnY0QUU5UGZy?=
 =?utf-8?B?QXp3VkZIdmJNYk9LK3o0L0hxRngzUnF1ckpMSW5ld2xneHNQSEQxVmExRHky?=
 =?utf-8?B?Z2N0RW1hUnBOK3FMdDFYWTN3QnlibmJCUEV4ZzVMTU9kM0x6aWZ0YUE1dkNO?=
 =?utf-8?B?UTV0cm50bTVYUkc3ZTRwbVNkWHRGcURRUHIwK28xQ09GRFRaUnVCZVhMZjMw?=
 =?utf-8?B?enhuV0F2VENtYUk0bnhNV2VJTVpIMDcyV0JzakJaUHFaQWc0MFpFTktUVG5R?=
 =?utf-8?B?MzF1aHJxVTRRbXp4M3FBT3VWSUh2dTNXcXlOY0o0S3p5RVpuWEhNTXVXMDFm?=
 =?utf-8?B?dEdRUG1zL3RWYWNiTFhpY1hEZHBrR1BVQ1M2bTdQRHBncWd4RUtZK1c0T0pS?=
 =?utf-8?B?ZURPdmVWYjgwTFNUNE1KSEJkb2ZmUUhqZnl4a3lobUJXRVFvQ2gwTWRGQkNj?=
 =?utf-8?B?WTJyMEVtSHNBZjUvdnhiTXZPQm5vR2NuWjBXc2t5aG9PNkpYNUgxN2JNajdi?=
 =?utf-8?B?a090NU5ySzU2cDdxb204OXUyTnc3VFE3NTJBNVJZWUxPeHFqNUdKWWZtUEZP?=
 =?utf-8?B?clhMUFE5NTQxWkQyTjhGaWtYeUpoVmZyeGt3cE5HZWdkaUljNkpTc0w5RU9E?=
 =?utf-8?B?dTNQbFN1eGF4K25QS1ppM3docFo2aVdVZVBrZzBTeGtJMHhkeHErY1BoRHZU?=
 =?utf-8?B?aWpTdzRFYlIwSlNway9JWnJ2anlHMnFGWGp2NlRHR3duV3ZJTU9jZi96RHVp?=
 =?utf-8?B?NFZmMjgxWEFoVDlqUHVPejA2bEhsRXBwdHZ4Z3J0ckhRTnBPMHJwK3NDSmpG?=
 =?utf-8?Q?pEmIycYKuoBBL0tlKMqNNlAt0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97635269-2ef9-4689-9604-08dad77ea3e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:40:14.2761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBCJ1V0/2gYwckixjCys7rgPPl0WOJ3aFehAHORD/LoMVUHkYZpAcK/mo7blOvGxmLP67zfsimSysgy+OGJicQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600

On 06.12.2022 12:17, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1746,21 +1746,21 @@ void __init efi_init_memory(void)
>>          if ( desc->Attribute & EFI_MEMORY_WB )
>>              /* nothing */;
> 
> This is an implicit 0 case which wants changing to _PAGE_WB.

Oh, yes. Demi, feel free to retain my R-b with the adjustment.

>>          else if ( desc->Attribute & EFI_MEMORY_WT )
>> -            prot |= _PAGE_PWT | MAP_SMALL_PAGES;
>> +            prot |= _PAGE_WT | MAP_SMALL_PAGES;
>>          else if ( desc->Attribute & EFI_MEMORY_WC )
>> -            prot |= _PAGE_PAT | MAP_SMALL_PAGES;
>> +            prot |= _PAGE_WC | MAP_SMALL_PAGES;
>>          else if ( desc->Attribute & (EFI_MEMORY_UC | EFI_MEMORY_UCE) )
>> -            prot |= _PAGE_PWT | _PAGE_PCD | MAP_SMALL_PAGES;
>> +            prot |= _PAGE_UC | MAP_SMALL_PAGES;
>>          else if ( efi_bs_revision >= EFI_REVISION(2, 5) &&
>>                    (desc->Attribute & EFI_MEMORY_WP) )
>> -            prot |= _PAGE_PAT | _PAGE_PWT | MAP_SMALL_PAGES;
>> +            prot |= _PAGE_WP | MAP_SMALL_PAGES;
> 
> Unrelated to the transformation. I'm unconvinced about the correctness
> of using MAP_SMALL_PAGES here.  There's nothing wrong with large pages
> of reduced cache-ability,

Hmm, back in the 32-bit days we needed to be afraid of hardware issues
in that area. Hence we had a global policy of never allowing non-WB
large pages. Maybe we don't need to be concerned anymore ...

> and the framebuffer is going to live in one of these regions, probably
> a WC one...

I very much hope it won't live anywhere there, unless you think of non-
PCI devices supplying framebuffers. As long as it's described by a BAR,
it better wouldn't be covered by a memory map entry.

Jan

