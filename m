Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF12662207
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 10:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473458.734076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEolm-0004G0-Vd; Mon, 09 Jan 2023 09:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473458.734076; Mon, 09 Jan 2023 09:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEolm-0004DN-So; Mon, 09 Jan 2023 09:48:42 +0000
Received: by outflank-mailman (input) for mailman id 473458;
 Mon, 09 Jan 2023 09:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEoll-0004DH-J4
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 09:48:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb13073a-9002-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 10:48:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8908.eurprd04.prod.outlook.com (2603:10a6:20b:40b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 09:48:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:48:37 +0000
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
X-Inumbo-ID: cb13073a-9002-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo64tgn/sivb8DgDWuQ1gopVmjLgmtIIXqD3ASdtyzsseqUiemf9H4taxs16wpK08In6h7Dg1rgF0TvFEMIlEVjr8VO89W84Cwe7bgQza3KHVVvge5bzlPIZXffX4+J/kf7LNUbwRHh80gaOcfkOcnrJBPQXsL2NTNVOWMjuux1xSWS1MIMdwW0Cy9lWzhDNigeyjS6ql+Q0Sa0QamEumVUfiBmk4UZeEVc+7JB9rMalVxXLPpTjxRCxrIXrc0aLofoxQsfVjI2iyDt+Xauq0amNFwzso3c4HKgSMi3i1eehCrPz8lzIMtHaUXWirjZvX7yonW3IjrdQ6HFwBjQ59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMHx9wpBRn012eK/sOZhbqy2uXhf9JMI/fRvQnuW4bg=;
 b=oaQT+O9CrhpCUOg/7Yye2TJAW7UWoSmnsVcRJUpAvYNv2Om+J0p/x1xqgzzzZACFvMAHK2vv1VmFqAgHhZ1co2TRiHAmyb6BIusrvbyjyC5mrFuUEJ/r1O5mQVxfTaMADOAis9HreuZuZExh7Im3wQkBSjhRWV14ZMIhaeEzYTriUF4dLq7ZZFmskVCvPa5mMHq5QRoIYAi/wUI06+e51QeVuzIPL6wx+fcy4aLBwxjZ7TkHvuJf5Zq0jmmwJOxPMDNi+cirHVWslN+V1nPmx6bb++M2aRI+TewDJ2vdq4mcGSaKb35ECXXDentMXbaxNqfJJId1URtGYs9vnzJSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMHx9wpBRn012eK/sOZhbqy2uXhf9JMI/fRvQnuW4bg=;
 b=SEylff1mwt7Cfm+NgX4SOGrdEPTlipD7mhLpIdrH/5SGxycSP+AQ6iIuDErsPmt/wVfGmkCHqBX3l6XuYK//IrCpprDYKonZjcI91iFcbKhrYMdXS9hXobNaFT49vBmTSoFj9jN1E9X8NPE39M6O/2yY0JPvd8SH2/yEE2MZz/lUKPsicr6tgtE/sXUgmpVIP7ouoaWkjilHZKcPaG0I+08amQqlY0nUe3RGDi8ZpywO2RTAAHQrIm+mii28BoWiw9oX76rPmePpa23wnyMZsNLZA85w0VleeaTyosQn5wWalAsqihPHVvet5/8UzeWamCKnx5ZPACfkS2bqxamEjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b65788c-9815-6526-a023-3c1c64699d8f@suse.com>
Date: Mon, 9 Jan 2023 10:48:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 08/11] x86/shadow: reduce effort of hash calculation
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
 <acf0f5f6-f4da-cd88-1515-2546153322b4@suse.com>
 <20c268c0-979b-5ac9-da16-7cb7322552a6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20c268c0-979b-5ac9-da16-7cb7322552a6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d419066-a30e-4949-112b-08daf226ae6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BELkF1sJgRNzFLnYmimgwZHadSrauKFRyX177OQ6sgqETg64PtMv9rzU01pFLf8uVro003GeoaN03kJlJ1y/FBkZJJoqPBOpGmOZdikQTW1Zu0NKfI9LzXrPXYLs10ANp7IvSSoNZoBqUEG5gMgDbnOwi1369E292YK5L3h9S/c34msi2O4BP5X35hhWRKnYn9skFlDpBqV+hKrheODqXzv90pwLgyv1aqKXwAU7zoPmdqwcL0UXUvohJSKsA24CfAKK+Ab1Ow6n0zr0uCmt8syg6CUQTpZZ7+oT3Efr9NUnfeinVE7y4PmhdbbLYq0I6evPCKZXIX27FpELfdzSAyGTGBoLYZ4GB7+KWQGLxDKqtz0yAlabxnP06rZm5LphM0g94AkdEuDJBSnlHsE/2xakDOTgJmknPb4sF9pKWt8fANTnLO/0IkJmloJKUCUiES3yRbPygz6hOFYurvn1gOYW5jP5xAbaSi+BZaeehUww9AtIzrkkmHbqNiN64XHRiS4Zc4m/TgWQoA45oNC/tWb2xgOyDbAegMnOhp+aUevPSr4XKf9usjuM7VmDl4GAA5iP9WCpJVVHYN1L3JOs3QrzlzoWiK7wVa2VtXxVKeDAE6YO1GXci6c0qq/U5X/rW5qXEsb/ZuIMP4RXe4YVTCDitmUXu7x9OJN5put/RzuKNIsuKx1D+n/nJQtTg1WQ/zvKMxfbg4HzoxBS9viF8XIti6ZgXukTfkfDF1BfgDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(2906002)(83380400001)(54906003)(2616005)(66476007)(66556008)(5660300002)(66946007)(26005)(186003)(53546011)(36756003)(8936002)(6506007)(6512007)(478600001)(38100700002)(8676002)(41300700001)(31686004)(6486002)(86362001)(6916009)(4326008)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhkUGpDOTVlS1hvSldtbUlVaVNQQnpKTWdYcTgrdmJQSkpFbFZGRmRHdzNK?=
 =?utf-8?B?bExZTEh4TGxjSDBNZ2NuUWhGWXNyTXhNdVlZbXlNZFYxZW1INWpuM2tXRUY4?=
 =?utf-8?B?b3YwRCtaTTAveUo0U0dzdHJ4UU5BUHhVb2xQL1R0aWVYUThXWW9WZnd3WlZi?=
 =?utf-8?B?MWI2VkxhamdJYzNvSU1MUWdBZkYxTG9qeVlGNFZlamRoRHJaYis5QVExV3Uw?=
 =?utf-8?B?a1AveXcrT2E5OVROdVR6YTFTcWdDcmt3MXI3RTZxdHgyOXVLR2hLQnlySEhk?=
 =?utf-8?B?VWpxVjk4TXJEQk1hK0hFQ2szY0JqVzFkVDhKbG9yS2hyR0RNRXNKSU8xQ3M0?=
 =?utf-8?B?d0VYem5wcktJVitjV2NMYit5ZitaQU51emlMb2c0TTdOSXpMOGZYaEhaYU00?=
 =?utf-8?B?V3hlNUFiR3JWYUo3Ni9qYW5SSURIZDFid1lRZDM2N3lDUFhsZUNlWUV5Q0d0?=
 =?utf-8?B?c1ZpaWNUQldIanl3aU9ZU0twV1pTZDhMNmdYWldGVDZSd3hNcVV6UHRNcmZD?=
 =?utf-8?B?M2hOWktUMzhnbDlUb2tJYXFob0ltOGtGVzRvTFdQclRiYm1iRWZvRUN0Uk5S?=
 =?utf-8?B?NmxaNFgrdDRpVlE3UU1kdTBqVThBVVdodWZmMmxReHdJMUd2ZWJyUllnVGl2?=
 =?utf-8?B?VVJMbm5jMnEyaTZ3aVNadDU3aDJoYTR6VTlWYXBDdHBMUlF4TE1rVGtHb2xW?=
 =?utf-8?B?dWVjakhUUGtVb1ErYWxXZFVzUGJCRGFwblB5blE3UVNWdGxHTUo3SDVYQitj?=
 =?utf-8?B?a2toTmZWMVRwVFdBTXorTHlrQmtkWjExaTlpbzUyaVlJQTZVZFNpQU5Yc0lk?=
 =?utf-8?B?N1JVVWw5c2VKZmh6R2M0cEdMbWVzclZWNDVVTTB6bTNvZFZmSE41Vk4ydkc4?=
 =?utf-8?B?bnlpbEJkbGEvcjZJc0psWnpRaVVBVlZBejAzYmJrVmRveXB5bVV0aWJxUThx?=
 =?utf-8?B?V2ozdUFTWEtKQjBwVy83bURFbVhXRmYwMjB3dmhBRFg0ci9EQjI4VHd0a0Rj?=
 =?utf-8?B?Vmh0dEdmdUw1VXJYWjNrdXEybThVUEhibDVuMVl3cTBKdWpiVUhibjFzcVFp?=
 =?utf-8?B?clUvZzc5QjVGSnZYUmZrMmV0Q1FrR0R3ZTFyU0hLTnlVWSt1K0R5YXZEbGsy?=
 =?utf-8?B?ZGpoTlJhUCtHbmlHeGNwUi9GTVJsd2tzN3ZHaml4NnVSQ3pGTkhIdy84a3h5?=
 =?utf-8?B?aENEUFRrQm9Dbkxjc056dGdkZnhYMU12RFVrTWgzMkJTQW00a3J5dmZsMS8v?=
 =?utf-8?B?YnR5cDlOdjlDV3lkMytTeERuSTFtRTVLbVNxQVFGUVRTSGVscVUrNFpsdTNF?=
 =?utf-8?B?ZEd3YmFreGk0Z1BpZXJsRlNNVTViTWQxU0htcVdscC9IVi9rMW90ekZ3bkIw?=
 =?utf-8?B?QXBxMW1PTDlCTmJUaFRoWm5ySjRmeisrcDIrNUVqN3M3M080MFQ2Wlg2QW9Q?=
 =?utf-8?B?RHRSOFppWWpwR2QyQkxOaldvTytVOUgxSmVrc1FnSU91YUwyRUNQWGFPZlhh?=
 =?utf-8?B?K3Q0c3RueWFlckdpUlFsbERCejNsTS9mS21oMytKQ3p3UWhENllnYUUyWXVX?=
 =?utf-8?B?ZThEWW41UzhXK0dObHdhRGxFdG9DS3BybnJiWVE0QmU0MjhSK3hiVmFJZ0k0?=
 =?utf-8?B?dkljVWp5MWVoVjVGQnJyNFFSTU4vbkpkRm8wMzlucGlkNlJIRmVwRWpPM0NE?=
 =?utf-8?B?UHlGTVk2cjJwcUg0cFVZNWNSYUo3cFgwZGdEa250RXRaQktMd1F1UERlTXp5?=
 =?utf-8?B?K1JOeXBCT3ZONFhoU1pqNmI4cXRJZHNLQ3Q5ZTNuY3F1RDUzdjc4SWI5cys5?=
 =?utf-8?B?V2FKdUMwZ2dNT0NWQVI0MDRTdGxDUXlER2hOU1c3TEo3OFA0d29qUUNhcUZr?=
 =?utf-8?B?N3F1ckZaeW5vOUR0MU9VdTNDQUVRTnN0WVoyc1c2OGg3SHZMa0lMbWpnVzFP?=
 =?utf-8?B?ZHlYSzUrWVJ4M0NOb1dxYnQvNmdtV0ZEY0o0VCtDWlUwTnJGUnZxVVMvWW9l?=
 =?utf-8?B?ZTFESVo4clVSUU5ab3U0MjltRlVKZUFmdWxvVGhNSitWVW1qc21mb0p0L044?=
 =?utf-8?B?aUQrYWFBUnU4S0M0ZlZSdHJ3TS9aRkVXZmNITE4xaUNwcDZaemFlUndSSENm?=
 =?utf-8?Q?ksk7j8bBxRLBmMAjq4eAPhbd5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d419066-a30e-4949-112b-08daf226ae6d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 09:48:37.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 393mA7+MeNtuYYLN0SZcNVhchjH8HpROUNfP/+o4r1ZvN0nynSqDkYsOjycMGGNBpq0Oc9D5+F2yb8Zcw6AIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8908

On 06.01.2023 03:03, Andrew Cooper wrote:
> On 05/01/2023 4:05 pm, Jan Beulich wrote:
>> The "n" input is a GFN value and hence bounded by the physical address
>> bits in use on a system.
> 
> The one case where this isn't obviously true is in sh_audit().  It comes
> from a real MFN in the system, not a GFN, which will have the same
> property WRT PADDR_BITS.

I'm afraid I was more wrong with that than just for the audit case. Only
FL1 shadows use GFNs. All other shadows us MFNs. I'll update the sentence.

>>  The hash quality won't improve by also
>> including the upper always-zero bits in the calculation. To keep things
>> as compile-time-constant as they were before, use PADDR_BITS (not
>> paddr_bits) for loop bounding. This reduces loop iterations from 8 to 5.
> 
> While this is all true, you'll get a much better improvement by not
> forcing 'n' onto the stack just to access it bytewise.  Right now, the
> loop looks like:
> 
> <shadow_hash_insert>:
>     48 83 ec 10                 sub    $0x10,%rsp
>     49 89 c9                    mov    %rcx,%r9
>     41 89 d0                    mov    %edx,%r8d
>     48 8d 44 24 08              lea    0x8(%rsp),%rax
>     48 8d 4c 24 10              lea    0x10(%rsp),%rcx
>     48 89 74 24 08              mov    %rsi,0x8(%rsp)
>     0f 1f 80 00 00 00 00        nopl   0x0(%rax)
> /-> 0f b6 10                    movzbl (%rax),%edx
> |   48 83 c0 01                 add    $0x1,%rax
> |   45 69 c0 3f 00 01 00        imul   $0x1003f,%r8d,%r8d
> |   41 01 d0                    add    %edx,%r8d
> |   48 39 c1                    cmp    %rax,%rcx
> \-- 75 ea                       jne    ffff82d0402efda0
> <shadow_hash_insert+0x20>
> 
> 
> which doesn't even have a compile-time constant loop bound.  It's
> runtime calculated by the second lea constructing the upper pointer bound.
> 
> Given this further delta:
> 
> diff --git a/xen/arch/x86/mm/shadow/common.c
> b/xen/arch/x86/mm/shadow/common.c
> index 4a8bcec10fe8..902c749f2724 100644
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1397,13 +1397,12 @@ static unsigned int shadow_get_allocation(struct
> domain *d)
>  typedef u32 key_t;
>  static inline key_t sh_hash(unsigned long n, unsigned int t)
>  {
> -    unsigned char *p = (unsigned char *)&n;
>      key_t k = t;
>      int i;
>  
>      BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG + PAGE_SHIFT);
> -    for ( i = 0; i < (PADDR_BITS - PAGE_SHIFT + 7) / 8; i++ )
> -        k = p[i] + (k << 6) + (k << 16) - k;
> +    for ( i = 0; i < (PADDR_BITS - PAGE_SHIFT + 7) / 8; i++, n >>= 8 )
> +        k = (uint8_t)n + (k << 6) + (k << 16) - k;
>  
>      return k % SHADOW_HASH_BUCKETS;
>  }
> 
> the code gen becomes:
> 
> <shadow_hash_insert>:
>     41 89 d0                    mov    %edx,%r8d
>     49 89 c9                    mov    %rcx,%r9
>     b8 05 00 00 00              mov    $0x5,%eax
> /-> 45 69 c0 3f 00 01 00        imul   $0x1003f,%r8d,%r8d
> |   40 0f b6 d6                 movzbl %sil,%edx
> |   48 c1 ee 08                 shr    $0x8,%rsi
> |   41 01 d0                    add    %edx,%r8d
> |   83 e8 01                    sub    $0x1,%eax
> \-- 75 e9                       jne    ffff82d0402efd8b
> <shadow_hash_insert+0xb>
> 
> with an actual constant loop bound, and not a memory operand in sight. 
> This form (even at 8 iterations) will easily execute faster than the
> stack-spilled form.

Oh, yes, good idea. Will adjust.

Jan

