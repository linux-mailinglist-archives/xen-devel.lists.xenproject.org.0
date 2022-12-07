Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC085645709
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456123.713838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rHg-0000x6-2a; Wed, 07 Dec 2022 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456123.713838; Wed, 07 Dec 2022 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rHf-0000ub-Vq; Wed, 07 Dec 2022 10:04:11 +0000
Received: by outflank-mailman (input) for mailman id 456123;
 Wed, 07 Dec 2022 10:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2rHe-0000uT-PR
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:04:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dbf1ef5-7616-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 11:04:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Wed, 7 Dec
 2022 10:04:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:04:07 +0000
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
X-Inumbo-ID: 7dbf1ef5-7616-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaeE3QT57zafLa4PKQm2RzDhEAp4cU+hjfTB0XB5EfanxRCk8bGfsg/Z1+jakhgAh8JBwlU3YmE75Ia59qCw7e/OdN4uwoeVIXC/hrYSc5YEoPeFKiJYRZzm3aHcjqLPeXBHv2Rr5qUmWIKmuwI02uwwFvV2Zw6rYFnmVwtd5CrV7e7GBvJ/ZpRPBerpRxP+Qvp6m78kjtjJx6I8q/r5qfA+QMcJcNHPNCr8XhrlS9PfDSOj79dYCrrUnVZoW7Un5AZgRLSM4YjXMnGAySRb/BgtzfMcrOGuVObFS8RUBSuwvb7rMi5/8YXvoexmzsjFSh6hOPEFBtFnn984oy69lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9W44+Vr5Q5I7ofD36VobmN+J163vj3KTNRk/9DZujEI=;
 b=PI2GjEYhkYHBWBBBvx/SYWCUKzfVkiIimSN1czvzX/tb+FebW8cyLACu+JwpVnsJh4+H1edi+Htbqal4rNMHXCQt/ui9pG/CHOv0vrcGVbvNsVjqW2UmCTs+SWj9idoYR/xHVjmrCj6x3MftkWpoHH9BUJD+H6tOVhznsgbOWlpHWfapqzsXoXrmrdl/Uheyt0NwywP+RfidCtno+4MxrwwxMR5TnmCJJc/Rtx3n9PxTK4sYq2H9R7VnoB/Ba/otsAYy+DQtLAVZ2VnLTnbnKH/anCayAXNdjplrCs7Ic3BNw4TtIVcIodnc+lmZrHJJkErh5P59s0cyUdRQ7fGslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9W44+Vr5Q5I7ofD36VobmN+J163vj3KTNRk/9DZujEI=;
 b=b7UdjdcBOzhf10a8vlhDa3HpebG6IgdXwnP8JFEA9K/XM5jJbyO9Q0sjYdKQjcXY6O5SR2DIlm8irfKCLJJL/VYFgbKZYUTcgkSp2axod4L5U8Obc6VIDsYnRAfU5dABBNQh4j0+j1NgMGcKAjcJPoGpMDquVaEQroN+fVWc36FoPrDqa4TWPlO+ou3igCwmzFkjKEDFBkvax7Oiw80daffB8OO2LPYUFcQS43WS77W+Sjx7LYCL+48A7qK80ZZ/D05v7Qri/TMid3KVLAuKPxPD7swJVLtie1G2PiZNX4rZqvFSMjb57jtHp4UwmO4z1MdNOhnEJ7n57I4uTF5mow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <24a8fb2d-b2a7-b319-ffa9-c5f4e0eca06c@suse.com>
Date: Wed, 7 Dec 2022 11:04:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Validate EFI memory descriptors
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Ard Biesheuvel <ardb@kernel.org>,
 xen-devel@lists.xenproject.org
References: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6936d67461716d8ba37ea8cc78743035c3e54e2d.1668832785.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 819747e0-e58e-43f3-8fcc-08dad83a60dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zbb8Qy0ijJhMde6kc5bh58GCiqBnyelRLPgVOqqrPzDKW5hpga6fBAET/2ky+WSyqceQ6pAjXy9QqZYqJuI9tlm6d8lIOTaP73rtpsnqY0AmqooeBJp+SfIHz+ySAbmfGBVQqohxYkRzdN4FBtV5VDjOfvcBq1YPTeq9exX+AnGnWn44Sd8Bwy52tBlDBz2U0NfwqVegE7bucocmBoIujOtLDTFgpRkAxwp5ITjXN56ccvu822bZpFjzZX8B/wagpV8i2SSoSinifNZVDwBkRbyaLD8kMECzYMEaC0akS4OajQcmBHfC108676mbqFdgZ36TQBqpCzsViu6h8v+97eeU7aVuPn2OYhn7R9MVaBNH0d7NbnSACG2mkIFNGR8k+dY9zzXTe6qQtnpP0MHMA0BFGEx2C2Mv8zKEqld+86Q4Za4qsuAfNNT4cBVgFDV+aq9K6lQ7YFPoFHlZSNUf+yYUmUqwxDo+HhYrbx62Hs5oC1tgHE7Pz904Lx0yepKptQLyVMavt2D4zi2zi4Zbd7rxSRYkjaRsy/HpUyARb2jQtHjsfcH49suns5dHhE7pdckEalZ+9S3lIrTXxTQ0mp2VYj2s/QgNepflXVOp/1eiidAVBjKiyp35EDyK2xkkKyVzY/utxNqS6SADnG7mAU7Nargjcvta5K4OxBhocHF+D0lh6jHK9g05Fr9HRPjXEwThDoTyX4+e037TNEwm3M7eoQh9TZPkFbriufUSEgk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(31686004)(86362001)(6506007)(6486002)(31696002)(53546011)(478600001)(36756003)(2616005)(38100700002)(66946007)(83380400001)(186003)(41300700001)(4326008)(26005)(8676002)(5660300002)(6512007)(8936002)(2906002)(66476007)(66556008)(6916009)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3MyQWx2MXhJUWZURXdFOTg2Vzg2R3hJYXBNN0RjckVkcGNVTWc2TWhBdCtH?=
 =?utf-8?B?bWozQy8rMTZqUnppeU9vekY4YmdoekhkQUh6a0ZzbWJzZXVxb2g4OHFRSlo4?=
 =?utf-8?B?Ni9CdURiaEZiVE4vTDBOUGlPUk53QVhUbk1rZTFzUjF3QUR2eDUweHBzUSsx?=
 =?utf-8?B?cG1aWHh2TUFXQzNKenRsYmhKTUVHcXFtRjNPcWNtK00walVmZE5ZRGR1MlVW?=
 =?utf-8?B?c0prNitSYjdyb1ZmWWFtVU9hTGYrVElJVDdFQ3UyeXZEd29ZeWxwVXJRUEtR?=
 =?utf-8?B?cTY5NFBKazhmSnRVdWZPOWZ5cGtoaDJzVXlKZ2QxbVZWcE5oeG1sdFNnaW93?=
 =?utf-8?B?cjV1WlErcjlWQ003Q2JJU0pEck1WMXMrQWVDMEhwejgreHBlaGJVbnhBNTFB?=
 =?utf-8?B?TDJLakxqVnpaMURCNndadmN5TzkwN20xV0lqTklmVnl1VkpFc0c0ZkZWbGhC?=
 =?utf-8?B?UHpKN2hFRWtNUGxwMklJZ1dnZElVKzE1bk5XTlB4UGYvL0wyM01yOVJ3SVRV?=
 =?utf-8?B?QjhmSUg3OHo5OXQ5YUt4cGlvaVYvc3BlM3AxbW1rcHg5VHowQ1huOXZBa2tP?=
 =?utf-8?B?NHdpR1hCcjFEMGJjSGcxUW5yc0xVWkJGM0hSa0x4Tlo3RXRURlZ1R2JOK2NI?=
 =?utf-8?B?OUxSYjBWK0NjOFphSGlleDl0dm1SVzJOaTZPcFUvZVRRc05vUmkzanRTclVa?=
 =?utf-8?B?Szd5dDdpVDl3RmErZTRqRmI5bFFjOWU5ekpWVndIOFhleWtBN0lVbmkxVE5E?=
 =?utf-8?B?RG5FVU9PRnZKSGJ2WW51VVNxOFJ3aFZ5eHE4SFA1WFdGWTYrQlVaQ3dGRUlH?=
 =?utf-8?B?THEvS1lsMytxM2JiSmRCaUdmSzNlL2tGTXNXSzhuRTNpQ2hYZGpUV2NnWVlZ?=
 =?utf-8?B?bmV5VzhYdjdhVFlwMmRBRDlML3VNU3RaUnNCZURQUWlTMk5sV3J4L1dSUmpt?=
 =?utf-8?B?Y3huM3doNm01OW4vYTZxd2k3U3hjZXRCbWNINUo3TVF6bEtFUmd3MkV1TWox?=
 =?utf-8?B?czh0VHFYRmhUSUFPSW90NVZseDByZ3BIZk1UeGNGR0hvbEVkWWxkMVl5VzAr?=
 =?utf-8?B?ZEpEOWZ4NjJyUEVnbHcya09lZDJxVXNTTFkweXFaYm9QaWxEMFlnZzJTRVhN?=
 =?utf-8?B?L2lQVHZFNHl6NlNLTU5VUkJQeHlXNlRzTW5nOCtxT2M3U3FEYXpqUGJPNng3?=
 =?utf-8?B?cGE4MldYclJ4UlRNa2FvbVUzMlQ3dTlEekRjd0tKRjJKTkVSU1RQUzY2UDNk?=
 =?utf-8?B?TFZaWDRNWVpQMVdiZVowbTFxUGlENjZ4TWF6c2lhSzc2YkFSYjcyb3F1Nk9p?=
 =?utf-8?B?Z2I4VHEydHRFdTVrVGk3NTkzUUpFNGsvdms5amg1RWNuSlJwRk1jSk5WTXpW?=
 =?utf-8?B?b3JTei9sczFlUVY5N3cvU1hqNHZ0M2hhTG5WV0RlOGNoM0VDZ3NvYWN6UHc5?=
 =?utf-8?B?Tld3WncyRGlNRTBWMENOSFJSNWQycHVmdXdYYk1EajNNSE90NnhWbERESjlE?=
 =?utf-8?B?L3I1MW1XUUlyQW8vNVdad3Z6Y3FwUHZvdDFIMXlVWDBIclppeVhESllyNXQ5?=
 =?utf-8?B?d05FMnRGVEpncC9qZUlxSlRBYndKV3pKN0Q4YkVVaUZLSVlpSjlBRWhOZHlX?=
 =?utf-8?B?NDZ6bXdRbm1wZGJkdmhWb2d6UVdHbG1wb0xnOHpJUjFNVVNBdzkxRENkY2c5?=
 =?utf-8?B?REpza0VlT1U3OTkxY3pmWWlRelFTZHdlem5MaXE4U040VllTUlczWEtnTUQw?=
 =?utf-8?B?NS84YlUxMkR5Mk9tZzRGbWFmbGZycVo3NnN4eDNoUllIUHJGenpNa0NJWVIz?=
 =?utf-8?B?K1lmQzluS2gxaWJXbyt1WWRFTEFEWnU3SmkxTEQzWDNJTEdEREZleXp4dUdG?=
 =?utf-8?B?ZGZNbmNPQ0toK2JnVzZRM0NzZUdYZXdtcC80V3R4UHdnUHQrUE1lSUlYTDBk?=
 =?utf-8?B?c2N3c0JicldGcDNZQ1dpdHBTeDN6YVVFSjRIdVRiQkl1SXR0c0FmMStmTks5?=
 =?utf-8?B?Umwrc1B1czdDczQ0YmdTZ01vZmhWaVp6aE1WTXBjbElFV3BFSjFPdTZNZFVX?=
 =?utf-8?B?WjZ3WkJ5MnJXU0wySThYaGJDTE1OVVlYQlJaSWxlTXNSc1NCUVB4TGRGQWFU?=
 =?utf-8?Q?VsyempJ+0AhU8uv/asgG523Pl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819747e0-e58e-43f3-8fcc-08dad83a60dc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:04:07.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJccc/OwbRSQ/elGQo9MQES6na8SHFdX2ofnGn1JwZ9jzKxdolqsKVy8j/2c2HmgPBUDoODm+8NjH2iTFZ7Y7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941

On 07.12.2022 00:57, Demi Marie Obenour wrote:
> It turns out that these can be invalid in various ways.  Based on code
> Ard Biesheuvel contributed for Linux.
> 
> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

This comes with the risk of breaking something that was previously working,
despite a descriptor being bogus. This _may_ be deemed acceptable, but it
needs calling out and reasoning about in the description. Even more so that
elsewhere we're aiming at relaxing things (by default or via command line
overrides) to remain compatible with all kinds of flawed implementations.

> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -51,3 +51,17 @@ void free_ebmalloc_unused_mem(void);
>  
>  const void *pe_find_section(const void *image_base, const size_t image_size,
>                              const CHAR16 *section_name, UINTN *size_out);
> +
> +static inline UINT64
> +efi_memory_descriptor_len(const EFI_MEMORY_DESCRIPTOR *desc)
> +{
> +    uint64_t remaining_space = UINT64_MAX - desc->PhysicalStart;

This wants to derive from PADDR_BITS (or even paddr_bits) rather than
using UINT64_MAX.

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -270,18 +270,17 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>          for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>          {
>              EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
> -            u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
> +            uint64_t size, len = efi_memory_descriptor_len(desc);
>  
>              if ( info->mem.addr >= desc->PhysicalStart &&
> -                 info->mem.addr < desc->PhysicalStart + len )
> +                 info->mem.addr - desc->PhysicalStart < len )

With what efi_memory_descriptor_len() does I don't see why this expression
would need transformation - there's no overflow possible anymore.

>              {
>                  info->mem.type = desc->Type;
>                  info->mem.attr = desc->Attribute;
> -                if ( info->mem.addr + info->mem.size < info->mem.addr ||

This overflow check is not superseded by the use of
efi_memory_descriptor_len(), so if you think it is not (or no longer)
needed, you will need to justify that in the description.

> -                     info->mem.addr + info->mem.size >
> -                     desc->PhysicalStart + len )
> -                    info->mem.size = desc->PhysicalStart + len -
> -                                     info->mem.addr;
> +                size = desc->PhysicalStart + len - info->mem.addr;
> +                if ( info->mem.size > size )
> +                    info->mem.size = size;
> +
>                  return 0;
>              }

Is there any functional change in here that I'm overlooking, or are you
merely converting this code to meet your personal taste? In the latter
case I'd prefer if you left the code untouched, with the 2nd best option
being to split it to a separate (style only) patch, and the 3rd option
being to at least mention this as a no-op (style only) transformation in
the description.

Jan

