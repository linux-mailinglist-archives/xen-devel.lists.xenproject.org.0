Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DD56A3F78
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 11:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502335.774085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWakE-0004iy-MD; Mon, 27 Feb 2023 10:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502335.774085; Mon, 27 Feb 2023 10:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWakE-0004fr-IX; Mon, 27 Feb 2023 10:28:34 +0000
Received: by outflank-mailman (input) for mailman id 502335;
 Mon, 27 Feb 2023 10:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWakC-0004fl-Bx
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 10:28:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a2457e9-b689-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 11:28:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8631.eurprd04.prod.outlook.com (2603:10a6:10:2de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 10:28:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 10:28:28 +0000
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
X-Inumbo-ID: 7a2457e9-b689-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqulIReHECLUFgreDXBVhDPwpL/bxAo3R9d38gI7Z84XKQw/ULD8ovys6ehk6jTw7gHwWm8vueoJvD3lt/RmDNv2rU+chaMwqZEmAZ25jSMWFA5/33bkBYZjkrFAJh8w7Gg5v+jSuZIwuKXkgQRrXW0P5AInLwtreP4DPMKHr6vzMi/YPp37SgYqZv5aplupTAgU05kV+xJTJ7a5KRXph1pm9GL02EqvUBHWmIO5CsNUQzFFag2/3gukPykMuaBDg9fPPU2uD8T6dK0q+QYOsPVkEjFqzDOEy6FXge+J3K3AOrrVUtYmraMaT2ZSBNetLJXqU1b9lEx1GaZXjZ7z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xemvVeuHKZ4/0l9nmKQQeEDDCxZXPRnuijuLdkSoXkY=;
 b=naeLn9uRGH8OcNAYGozOjJYi5teDUxjIIImWGhepay+9/K67JUzTEHJ7BOAiWu5mVOWWafdKFPCJI5TuunT4vbE/HmXM0UkkXGurHvTKPGhAZjpB+PNA0LfjnRAdeh/h9CB+12yxRkVJVMC0AZiUSZtsS7H0cv3nb9IkokrIwkECRm29f3AXA5TZHL2ui09za2W+hH59l/gQZdUFrb4gTHh63grZcPjG0qoiG/pEQi19bKfAvrHzzREtwuSrt4NbFtjcn0IcMHPrMG5lvOow27pIwSATMxeSSFTIAU5MVbU0J1XbyB7e7yaDzK8tyNseZfRd1G8liejfCwG8Ctlrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xemvVeuHKZ4/0l9nmKQQeEDDCxZXPRnuijuLdkSoXkY=;
 b=FOjKPl2YByrB60yuQDEUqm0zxNDZy/BnWj1FPFQs7/u9XJb8E1zWJs/wfSwzaycwpol6wetnlucsM0mzjE0P3XCgFwCbC0vSJKd3wJvFI3GlpmJ5UB4YK2wmbMe9ItIVKwH1ea2LDCA80Ql88T7AoP1dfYCLBeZotGlbnkmL3CZShuArCA+iQui/XbvhL3sKDUXxrAuiOtH7ymZ7Ft6igbxUV93V8Pw9vfMLI6ZCqWKZwBaRYVpPGIugrCCYav3Syah9wh5RpE1ZBPy3hYLqMgiQrXWODVjaG0eoih45JBEfmy+l0jeF/NbNRZFmTxtM+Dl8wl24xuhQJ4RbLVcXBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9fbbfa17-821f-8c9e-376e-911481a1988b@suse.com>
Date: Mon, 27 Feb 2023 11:28:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Drop ELF notes from non-EFI binary too
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230225235642.38880-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230225235642.38880-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8631:EE_
X-MS-Office365-Filtering-Correlation-Id: bd059842-3b53-4a44-3af8-08db18ad5d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QXcS9EMsQ9cSIulD0fy1V6Fc81OMrC60i/sFiY3g8We67nFd3wtAPqn0o/SdgZK+F2WB4xLHEjaEgdJV/rjXMzvCO/Fa2XzEiwpvv0/8V8vin9LzL4LDzyUAH4T4GO/G2MGjCdQgzD1GbBYJ4uuwKxPRooowJfFT7OyLrcYLc+iWT+DsYuVPtY7lnVuDRhGYYqfTY9cFrFDnLlkj5pHuN32hhTJkWTPoJ8W4UDhI/HQeRqJGRod9qdeS0/HbR9F3QMcC+f+axcXpxImqQBRjpi/keQ0Bs4Z466hiCAIeRAyC6Vt8EmyrjVs03rYJBK7hhL5LN+wQP/waQKPUPc8nPv41UY7ytkmBlo5/8KiYrxU8rFsgNsVDWXgdFUUp/V7btrMOp+BM9FcHPMpQ2LZqB9GAiN4Csv5Rqf95a3KRhctvsU9qYJkOBmpD+KalvONnrRYPp6oS0koSHig8o7lD08InUPnl5RWiGpJRaWGxKiv2lTDKoIPZDLoov2IZjWwvEDfK/X6ZKi/4m1sPEAJx8OD4pvdjmUQyPjctm/O0n1LZBsAzchgmTkukRH63zGvWtzYKgvGXJgr5/RYY7WmiF7ibS+5eKTE+FQrc4AdQuehAf0fJMdV6cj3HWC7+hpSn/X4ocZu2FcKDScV6V/QKdtyN8uDtX+8vG3oZPTK+d30bEpj4UXMVMLEqYa2QDDCFCf8Rx6/Kts9Cs9sOyH1AHYnCpN2iSLNm8JCjBE1ilCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199018)(8936002)(2906002)(5660300002)(31686004)(41300700001)(66476007)(66946007)(66556008)(4326008)(6916009)(8676002)(316002)(54906003)(478600001)(6486002)(26005)(6512007)(186003)(53546011)(6506007)(2616005)(86362001)(36756003)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHV4ZGV2U2pzNWtqZ2RYWnE2ZkwzTGRrS1h3bkhVenk0bGNZSHprbnB5blZG?=
 =?utf-8?B?L1dkeXJsenhxM29Za1VFdHgyaXg1eGJJZFEzaVlXZzh2T3hDR1k2bk1rWDR1?=
 =?utf-8?B?UzhaQnd2SC9KV3RiWUYxTE5YU0owVisyQWt3TGY5K29DdG5KR216ekx4TE4x?=
 =?utf-8?B?aHJHdEplTWgwWHVmcEFuS2MrcXlrdkpNUGcrWG5zL0ptWmdMUUlEVVNKbGlS?=
 =?utf-8?B?QXR6ODN0UFl0Q3kwTy9iMXBOVzUxWjlMbHZIUDhxSjROVHZVYW9YQTk4M0RT?=
 =?utf-8?B?bEFCZHF1V1hOMmU2M21CbDU1S3JMSll4NXZjTWlXUDdOK2R4eURIQ1JOQlBK?=
 =?utf-8?B?VTFWdmRqNU1lc2FyNCtUKzVJSW8xRmdET1IzZVpTV3R6S1paTnlyUWRMZWVt?=
 =?utf-8?B?Um5QazRoK0tpR3FDT1EzN3lxZ0dXbWMxWmx0MkRIcG5VejlLY0gxc2tZTzkz?=
 =?utf-8?B?SWxFMno3eTQ1elFSZmVGNEdJYkJNTGN6dHQ1UTQ3dnpaNnRWL3RHU0IzTTBl?=
 =?utf-8?B?K1dBYjdPNzg1ZHFseTZlcE0ydVFIVGFBUDNPbkkvOWlYTmlscVBxMWE5cDNT?=
 =?utf-8?B?VExxUmhENENuYW9JazV2RWx2ak9VTnpMYkZwNFNWbDlUZlJJYkZwWXhBRWRo?=
 =?utf-8?B?UUFTN1JHUUdmNXY3bS9YTjV1N3E0cnBTQWdrdW0wOVgvM1BTN1kzZEVxZ3o2?=
 =?utf-8?B?TllWWGlLTGp0Nk5RZnN1ME4ySS9NK2t1ckZIS2NIaVJLWmJNSlkwQlNYMlg2?=
 =?utf-8?B?dXRTUkpkWXNHa2ova2UxT2oyblNLeU9SbDFRbjlPMlNNZzcwL2hDTnh0dXdF?=
 =?utf-8?B?bFRnVE8zZXk1ZzFVSzRuUHhIKzJDSmxXRlFvbmhkNG1jYWFlOURpR2dvVmg0?=
 =?utf-8?B?ZU5nNW14VXdRMmZFelVLWEEzYm5wYXN4M2ZLSklqcEZOSmNFOER4UDBSNDFn?=
 =?utf-8?B?ZndqejZDNWhibmFJOHJBOG5TaXdHK1Q0SjR6dFFPeHhHcC9PcGRoL2pqZ3Fx?=
 =?utf-8?B?TzF6bFlOeUluYTIyZVZ2STNvUHI0bm5Dejd4VVRvdzNYS2FLT3R6YlpOU29h?=
 =?utf-8?B?QmdVREx0QndXdzg0VENXUDFONjh3Mk5YQ0VNa2N3VVdYZ2IzdGZrM2NvTGFZ?=
 =?utf-8?B?bXhaSlJMcmswSnR0SlRIY2gycUxLVkIxWnZrSkpLa09aU1NtOEgrTlVwRGt3?=
 =?utf-8?B?TnZTYWZzUXVLL3RWUVBOcHJyNHVhM2VxbGZwY08rS0E4Q2ZtK3NlaENyNFM1?=
 =?utf-8?B?R1haVHlkWDAzdE94REZueGpjV2xyK1hzbUlTSnIwQzFKL2NnbVorU3p5Q3I0?=
 =?utf-8?B?c095WUFEdWJnU1lCbFh2Zm94MUJVZlJEK2Z5REt3QVRvNFpNQ1UrdFMyWmhL?=
 =?utf-8?B?MWRsTjFGdCtxVFNNNlVvQnJMRkxrMDFYendOQ2RSL2xaUkswbmtZWGVmT0lH?=
 =?utf-8?B?dWY4T0dMTGJzYVRhQ1VGWkZPdDRzTjNkWi9PS1pTdytyYjNLR2VzaWxSNU1N?=
 =?utf-8?B?ZDh4ZmVXZDVTamt5OTAvRG5pUWkwejQ5aGE1R3B5Y2NJZWlwZURoZVVYb2x1?=
 =?utf-8?B?T3NORmlZVGkyeXZVSEFLenI5WUZleHRyQnJBdnhLeGg2UllMdWpzMVF2d3FP?=
 =?utf-8?B?bUloaHFTSDV0cTZaN3pHTzdWVXRiTUsrb3IySmFWZVdOVkRSeVp1M1JLdGd1?=
 =?utf-8?B?SiswM2F4MWdjZGt3UHZ3L1ZsYzljL0RzOTFHeVdGUkVuSjRLMmhJdTlSb3Fq?=
 =?utf-8?B?amJUVEkwVnUvdXRKWXJqRFE2TlpKajdKdjZ5TVRUYXhkLy9lMnlpSzJRT2U2?=
 =?utf-8?B?MmVlQkFTNmhTVjB0TDVQVGwrYVplVndPTlRCdExXTTdJL1pBZjB0emV1bTdD?=
 =?utf-8?B?bFF6azg4QnF6TktDODJnVk1yeXc1eityVUN1NjQ2QXVRWTMwd2c1MklhR2dr?=
 =?utf-8?B?M1RzY1N5V0dFUWpZbjZIQ0oxZzdpSVAxc25PZW1NN1NTRHo4My9neGhqai9n?=
 =?utf-8?B?NE9Ib1RIN0JqY3BsVlFVdURQK25UaVpudTNQQTUwaDh5bFlISks0ZzZSUFNj?=
 =?utf-8?B?d1VTN1A1ejRwL0xFQTJtNXFDT1NWU0ZIamI1RGdoaC8rUmhNdXVDY3A5NFlo?=
 =?utf-8?Q?ntxp5uH5kbhxnBDLA5DcFYU1o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd059842-3b53-4a44-3af8-08db18ad5d71
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 10:28:28.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q85rndYDbrjHMZyVuc06nKA5oGSLPsVr+aZorhbib3JR4ScZxOvPiRUfue0egV5z50pJq6/vTZah8aO+pFZEMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8631

On 26.02.2023 00:56, Marek Marczykowski-Górecki wrote:
> The ELF is repacked from from 64bit to 32bit. With CET-related notes,
> which use 64bit fields, this results in 32bit binary with corrupted
> notes. Drop them all (except build-id and PVH note retained
> explicitly).
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Perhaps a misunderstanding: Yes, I did suggest this as a possibility,
but I didn't really mean we actually do so. At the very least not
without further clarifying what the cons of doing so are. The notes,
after all, are actually valid in xen-syms; they become bogus in the
course of mkelf32's processing.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -192,13 +192,6 @@ SECTIONS
>  #endif
>  #endif
>  
> -#ifndef EFI
> -  /* Retain these just for the purpose of possible analysis tools. */
> -  DECL_SECTION(.note) {
> -       *(.note.*)
> -  } PHDR(note) PHDR(text)
> -#endif
> -
>    _erodata = .;
>  
>    . = ALIGN(SECTION_ALIGN);

Is this sufficient? .note.* isn't part of DISCARD_SECTIONS except for
xen.efi. I would expect it needs to move there from DISCARD_EFI_SECTIONS.
Otherwise, aiui, the linker's orphan section placement will kick in. Yet
at that point you'd also affect Arm and RISC-V (which, interestingly,
don't place .note.* anywhere at all right now, afaics).

Jan

