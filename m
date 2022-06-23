Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AE755763C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354653.581871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4IlA-0007Dw-FS; Thu, 23 Jun 2022 09:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354653.581871; Thu, 23 Jun 2022 09:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4IlA-0007B6-Bg; Thu, 23 Jun 2022 09:04:20 +0000
Received: by outflank-mailman (input) for mailman id 354653;
 Thu, 23 Jun 2022 09:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4Il8-0007Au-3c
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:04:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a9f758-f2d3-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:04:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7252.eurprd04.prod.outlook.com (2603:10a6:20b:1da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 23 Jun
 2022 09:04:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 09:04:14 +0000
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
X-Inumbo-ID: 75a9f758-f2d3-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYlwdNt3AD501LUmfD8sDAW9l+EFYTvJWoGHTDT+sYwtfTkfhPEsc4XKg3iGbH/eHLzKRvG5tTfpMVdg750mCtaAilK1ruA1+9+qQdFUPNpy/VRMfrr1msMQlJhR2CSIfidTCqKQiSxS9MlP5yDHs++PKBaFQ4Mx0EdcBLOi4ZZ4RNVs3FUGn9ij/B9dxA5zcIUTeDLYPtiHvOJdOfEqQnMUpes9ssbr77fQOr74Z0eZSNjozYlNz9nlST3chvSbqJmahX/7o617fYdo/+oCJz3XCVWQEUoXP55oQqjozm3an4k5yNyRgLNCUX1EzWo1+06KlmforEcJgrfkuHKGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ4QXewQvgXnvx0V4pxYg7RGzttLNZQvSM0/FQi9rjI=;
 b=VwQlGuOq6gQAtun9brq5ba2dU6/xHsqZXl7IazQvydqahwjziXsqbeYQ3RKwCKHssBUMLNUy7bjs6L72vXMtmjoJF1tX7JgmVK66ShGJEc6U9v4FANQ6Dki4Ems4V0hEHJy6vNqBIvnEMWO22gxnQs0kZxYffzmv0CjEAKlyhGqg7I3/8GeqJnfMFxvzVUXHAVIflyRXDdb8CKapo3bDv5d/AONjRurr8EAsVzQmx09hXBozmNexLp0s3mU2Qhsex8u7jPjUd/Gs5gds/UQBQmiPigZLutz2pZmFwzz3QxUHL32IQ44eW0k1fTo17M9oDKMjimDpFQvYhvwg0WqhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ4QXewQvgXnvx0V4pxYg7RGzttLNZQvSM0/FQi9rjI=;
 b=EoOeGRl7O79o5a0jyi/TrvlM/ahb815VTFI8Wjhte3Xopo6HrbCp/SFPda8WgyTmrnpvIu6uVo94vBspRvzTeWxKBz1bCCdALdQ1XoSwXNTDUhF7nqZmEqguQVfYS3CbkZLW9MxL+jVLIFY/mom66lmWv3kY+ckaIPoAidR2GLs9n1a1C13wbQdbwcEwvtDdVJRtfhUSAklX1iVcirx8l4EsHySds4FzvS8gKC0zhLa+qZxf0fAT9Z75MhfWbL9y7TNzLKc/EpHL1ZVYDpEM8Hhc2F6eO5J1k72ZSwdZUT6qureI7ION36raz4ymG0X5KmGKdFi+XMrWNT3JTGp3Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5961627-1719-dd54-bbcf-c08a826ba14d@suse.com>
Date: Thu, 23 Jun 2022 11:04:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: consider alloc-only segments when loading PV dom0
 kernel
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220623080208.2214-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220623080208.2214-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98724d4c-1f27-47a4-513f-08da54f75836
X-MS-TrafficTypeDiagnostic: AM8PR04MB7252:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB725295CFAACEC7CAB4D85BAEB3B59@AM8PR04MB7252.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rFJalvxchnSXEhuzUQDRoeP3GvYplT8LkSIqOVCuaNY/FbFTRQS/KXvTQ6x0Nk2Aa4RbeUYqG0ZWKP+IcgoqR2MzY5fRyRWzxrTcc/fUEiyILb8vpeXV8++bQhNQnh3T+m3zIyk2BVArS+SmVeixAqUEqVrNq9N6+0jk3uMo8xwJtjT3o978OO+lhxIanHO9YA1XlKHH8VrKgsUEqIxxIFeRlS+NhixR0YRJJe8I5WToO5d5Zq8H2/MPGJ8zMdooKmbvEFpumVB/fclr26NhG4FQvpjS2fuKzE0TArMlM+A3ud2a4bsfMLPLWIvVAQNtS9R9Yj20kb7UAiAQobLePhbRIEAD4wCsx0Ghvtw3H1GFsSWRe7Vta0RRsX/wZTZPSyKCpwtGgC6ZwZ9mPrTbUlY+ijQXKWJKoDKDSmquCrUH55GP3+TRlYhsYv5g6Ykjbfawma/Zqx3A1LFfW9nvQDEeILFyUNB8ks6T+G4OPCZJjyU5+RsYi8PshmdU9BFF1O07gRW1UJWun8zh5FzMn0AyziR775SwwaOqKx9KEKC6qcGMsllA8kBtoJbc+rlnw/MdJDwEt76RG8Fyov4my2MKhNhBPIkibocN7rNq+bwrUb4wYBFRV4k9uiXIgQTyZkF13O/1VJv83ZkQUnAcDYeubjYlZvqNs9j5HU7+83nXAAKvSjENdPURxEjnZrpZMOhN+OHjmq2QplNkVtA9TsgYuRTqD5wW1HVM1SMxyHQC2vuVP/P5A4PVrPyJ75NoCHaajgYAddyLRbeSGP2/GAN4ZJtcPVTYQk+cwG+8YSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(366004)(396003)(136003)(376002)(86362001)(83380400001)(31696002)(66946007)(53546011)(2616005)(8676002)(38100700002)(66476007)(66556008)(41300700001)(6862004)(186003)(8936002)(4326008)(5660300002)(26005)(2906002)(6666004)(478600001)(6486002)(6636002)(6512007)(316002)(37006003)(54906003)(31686004)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUJPditXMjdRdFVhV1U4SnB1UHVQMlhlMjE4V3l0RHJzNjV5end0TzVXdEpn?=
 =?utf-8?B?Z3Z5MTlGajNwZ0RUZXFzcmFiRk1oWjJGRktSSGI0Nkp3aTlsd0ZRaHVQa0c1?=
 =?utf-8?B?OUEvS0Z2MEt6cDZ3SmUwdG40c2J4ZnNHZzlZUXhPZ0haR29OVEg4WTFVU3Ir?=
 =?utf-8?B?QWwrSjhCYWlmTUM1WE03aHRZMytvVXg4OGhLMHRvRTRyWTN0NytLdmxTZ1h5?=
 =?utf-8?B?blIzd2FiNVJSWmdCdVVrM0d2clBpelFzYWFndjNuUHExOTlBbzJ6MndyWXdQ?=
 =?utf-8?B?WGZTU1dHWnY3M2tPelVLR282OUdIaEd1RFJUaWJIbHZ0enk5aXR4RFZncisy?=
 =?utf-8?B?QWg2VG1OUnFKNndBeEdWcU94SzJhajBTL0JHQVhEMXRpOTFRcC8va2ZRblNQ?=
 =?utf-8?B?RDh5SHJNazkxMm84K2l4SUZ4OThXUW5xKzI0Z2dLd2wzcnhBRXRLR3NIQVRq?=
 =?utf-8?B?OTFhdjROUVEvTmNKbGg3S3RkekhwVEJmVW5ickxZTDdwTGU1ZVhWK2FwNElj?=
 =?utf-8?B?RU54WDNQWWMyWllncFpmSFpRNHBad2pST3NOWlkzNnB6U2pvZFdPc2ZqZ2Ri?=
 =?utf-8?B?TDdCR2RzbTZ0THZsMXE5Tld6MHhYalVZWDJ0QjF4TTlISXA1Q1NQb2M1dlF2?=
 =?utf-8?B?K0J3a1N6N0J0WjJIQVZFOThucEdWUDBKUmloaWt4dzAvelBkYzVGV01jMXRi?=
 =?utf-8?B?dEVyckxxUExuMmpGd2NYY00zTzdBSVBKeVNCY1kxbktGTjNtZlBZRzBoUUFG?=
 =?utf-8?B?WkxUL1VCc25kOGhIV3pvY1NFS1VQaHNTOE1ESTFGQmRwY2ZVZ2c0SWJkaFhP?=
 =?utf-8?B?ZFZHcE5YTnc2RTNUclFtMSt2Yk5yNnk1MFp1VXlNdGNhM3V0cmREeUNaYzdX?=
 =?utf-8?B?NlBUSzhuKzEwSlZYZy9OQ0FGaUc2ZGVscStwYUlmT2cyMERLelhOYm1Uemt6?=
 =?utf-8?B?c0dGN2NMM0x1OFhNdTExZ2M0akFRSDVONkx6cWVMV2ZRYWtiTFdCWm5ZVXVt?=
 =?utf-8?B?a05GazNVMVZHSzhYemJnTk90TnBDbWxCZTNRS3QvVGM3cVUrN2lhU3ZPYnNj?=
 =?utf-8?B?S2RDYmJ2UHhLQ1hLSzZsbnBlUCtDUjJYR0s4amxlSkliL01QSlp1OWdWZWpU?=
 =?utf-8?B?czJUdUliV3p1TXpBTFZPKy90Mk5OeEpXODBrYnBmTHJFSFROaTNuRUg1Nllk?=
 =?utf-8?B?cVVkcURhb0FJMWtOZE5mYU9hdGpaZ2k4U2ZjWFBMN2ZhMDNEd2lEZFFteDc0?=
 =?utf-8?B?K1JQZVpyb2V4RzFJeWNodzk5aFpQbnZ3b3FDZXlQcCtCdm4xV3Rlc3EvZ2F6?=
 =?utf-8?B?UjdpSEJuSFJVaFFHVDRiTmVPUkFOOElhNEgreDBpYTd4eS9ad3EwYWM5ZnZH?=
 =?utf-8?B?N1V1MVlLSVRTcWoyRVZ6eVZPZXFROUlNek9TR0tkY3licHhrOHRKRks2andv?=
 =?utf-8?B?T1d1WjhFQUYzb0lXMUZCVnpNTHpxOHh1aHBTWk5KS0RHN2x1cjZ2ZE54b1Bv?=
 =?utf-8?B?MVRzdjd5VkZiOGdyRmhPdXdYd3RPVHdxUXcyNFRVazZUYWdIeCs2YXFlNnEr?=
 =?utf-8?B?dFEvRFNLN1lLekc0SDMyUUFPODdWYkp4eWxzeURWNWp0NGxWTGc5Wnh5ZHcx?=
 =?utf-8?B?N0lSY0lhclpnNlVGaStwaVpJaS9MQ04wcG56L21aN3NseUtONEpuTzV0OVRL?=
 =?utf-8?B?TllEb2xSaytNZUR6R3dXcW15QVR1UXV2eE5pQitOWnI4Sm9kc2M3UnViSEVM?=
 =?utf-8?B?aVh5c2NDWDZTMFFvc2pod0ZCaUh3NEFlL3FkMnM4YjFtTkl5djlCSFJObXkv?=
 =?utf-8?B?dmVHZWpKdWpTcEJVbWY0RUVQTEdscWVCek5ScUlkazBqSzVjdVlZU29sMnpF?=
 =?utf-8?B?N3VDR0x4bGJsdzIyeklIeU1nQkh1SU14azVKZjl3RkFLK1lPVDZoOFBVdWc0?=
 =?utf-8?B?VHIwaTJxWXNJRWRvU2pQMG5vOHlNRTVpTmd0OEdsdFlkYTBDWEFoUklCRHNv?=
 =?utf-8?B?TVEvQ3kxczUwbGtJUHNLbmlCbU5xMWZQWjFidEFpQlIwY2FDSHI2bC96YTBB?=
 =?utf-8?B?c05mQUNhSXZnSWxqTGl3VXY0eGZEdkEzZmJTUVBPWVBKVkhNc3J5MUR1a2k1?=
 =?utf-8?Q?4b26IqCmlVWvXOrzxwKYCntrC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98724d4c-1f27-47a4-513f-08da54f75836
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 09:04:14.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIWFsMtTRba1rw/VfKFKS/B/Or/bWTtegrqWUMGVnlSbEBD/ZT0nqmYONdxsONaiy4/ZLTcQfgEfzjLtLgCiIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7252

On 23.06.2022 10:02, Juergen Gross wrote:
> When loading the dom0 kernel for PV mode, the first free usable memory
> location after the kernel needs to take segments into account, which
> have only the ALLOC flag set, but are not specified to be loaded in
> the program headers of the ELF file.
> 
> This is e.g. a problem for Linux kernels from 5.19 onwards, as those
> can have a final NOLOAD section at the end, which must not be used by
> e.g. the start_info structure or the initial page tables allocated by
> the hypervisor.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/libelf/libelf-loader.c | 33 +++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
> index 629cc0d3e6..4b0e3ced55 100644
> --- a/xen/common/libelf/libelf-loader.c
> +++ b/xen/common/libelf/libelf-loader.c
> @@ -467,7 +467,9 @@ do {                                                                \
>  void elf_parse_binary(struct elf_binary *elf)
>  {
>      ELF_HANDLE_DECL(elf_phdr) phdr;
> +    ELF_HANDLE_DECL(elf_shdr) shdr;
>      uint64_t low = -1, high = 0, paddr, memsz;
> +    uint64_t vlow = -1, vhigh = 0, vaddr, voff;
>      unsigned i, count;
>  
>      count = elf_phdr_count(elf);
> @@ -480,6 +482,7 @@ void elf_parse_binary(struct elf_binary *elf)
>          if ( !elf_phdr_is_loadable(elf, phdr) )
>              continue;
>          paddr = elf_uval(elf, phdr, p_paddr);
> +        vaddr = elf_uval(elf, phdr, p_vaddr);
>          memsz = elf_uval(elf, phdr, p_memsz);
>          elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
>                  paddr, memsz);
> @@ -487,7 +490,37 @@ void elf_parse_binary(struct elf_binary *elf)
>              low = paddr;
>          if ( high < paddr + memsz )
>              high = paddr + memsz;
> +        if ( vlow > vaddr )
> +            vlow = vaddr;
> +        if ( vhigh < vaddr + memsz )
> +            vhigh = vaddr + memsz;
>      }
> +
> +    voff = vhigh - high;
> +
> +    count = elf_shdr_count(elf);
> +    for ( i = 0; i < count; i++ )
> +    {
> +        shdr = elf_shdr_by_index(elf, i);
> +        if ( !elf_access_ok(elf, ELF_HANDLE_PTRVAL(shdr), 1) )
> +            /* input has an insane section header count field */
> +            break;
> +        if ( !(elf_uval(elf, shdr, sh_flags) & SHF_ALLOC) )
> +            continue;
> +        vaddr = elf_uval(elf, shdr, sh_addr);
> +        memsz = elf_uval(elf, shdr, sh_size);
> +        if ( vlow > vaddr )
> +        {
> +            vlow = vaddr;
> +            low = vaddr - voff;
> +        }
> +        if ( vhigh < vaddr + memsz )
> +        {
> +            vhigh = vaddr + memsz;
> +            high = vaddr + memsz - voff;
> +        }
> +    }

As said in the reply to your problem report: The set of PHDRs doesn't
cover all sections. For loading one should never need to resort to
parsing section headers - in a loadable binary it is no error if
there's no section table in the first place. (The title is also
misleading, as you really mean sections there, not segments. Afaik
there's no concept of "alloc" for segments, which are what program
headers describe.)

Also: Needing to fix this in the hypervisor would mean that Linux
5.19 and onwards cannot be booted on Xen without whichever fix
backported.

Finally, you changing libelf but referring to only Dom0 in the title
looks inconsistent to me.

Jan

