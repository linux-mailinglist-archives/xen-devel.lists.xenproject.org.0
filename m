Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEE715E25
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541127.843532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xy0-00022z-Al; Tue, 30 May 2023 11:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541127.843532; Tue, 30 May 2023 11:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xy0-00020X-7p; Tue, 30 May 2023 11:56:44 +0000
Received: by outflank-mailman (input) for mailman id 541127;
 Tue, 30 May 2023 11:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3xxy-00020R-CV
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:56:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0939f819-fee1-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 13:56:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 11:56:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 11:56:36 +0000
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
X-Inumbo-ID: 0939f819-fee1-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbYWkEB4C+fxvBElOK4WezzAvrsKWJVuZAXuJCvxIkl7CZ2XxHd4FISi6Ae24hoKojg/rmD5PQL23Hk46XX4wQsAFRRXWGHTGyakQsRDfHmLvxt+spDnlAPZrkpoLn1cb0j9AiT9J2YfuCGC9yw2zMOtApjUD+gz5EXPdhVoG9tXJqQGWd8Z0bcUfYsGIYV67gmgWY0YyDjIXxxXpffpuvazJMIJrWKsD9AWmlnf3S4gmyvzKe09+BFsCy672uAgqVtozxSmr4ggZjicTKOOAwc8KOIn6TrUFKvYtxDQxm3kIbDUl58WzUIbcjrrbsytJ5REQxfvkOC+C10CuCRgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU40Dezc96F761Mz9OWPNYoAWgUp4gZJNgrxzDcONpE=;
 b=XSEYLqEYmDrSjcJgdQGJJTA37Z3tziIB4BHJtM/z6B7BN1/qzb6w7R9KJJV+yFS0zvRvPmh9gi/iWDeEWFRa3ofSXs6RNMM/RujHzRu116NjqClzLDbxxkNT+xNzg+bFCuXUyWjriBhAWCSZ7tfuLD0LJeIRVT3i/3OyH24kAJxjC57090OFxWgEqojYkCm//QCp+eI2Og2JOQiyRYbnF/GlpvxaISFohvmmxkobfXR/uGy8QlGh9M40WtobDB64i+LklAOxt3LHzFw4Xjene2cNmknzfUPrZ7Rlc1Pr386wwo2Cba4nhP7cs3/Jf9PQZIGFwJ/y9511VPVzLU0+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU40Dezc96F761Mz9OWPNYoAWgUp4gZJNgrxzDcONpE=;
 b=MrlyJVj2Nan42afJ2tqBAtzIBsbcAF1FSQ16MXBzkeKAmy+sYfbMDT2SMqYCgRjHuxGuIEvgqQF/zIylx+tgUTvM55u2mt27ptL7evUPUZer9ptlmbdIEfVLmp23Uj2fZMVPKil8GPKL6Ovo4MXCKnpGiWaF402DyW40VBJnA0Fr/xrFJ4KDTbNYUHGQ2D3LVm2Z8pBFwjZdXL89L5va/Amm4f6UA2r9BbO4SBxMKqjehlkpe5QtfNgdgKMlCzkqEiHrUviiuRmR70gC/aLPTLbn6ny+rHxCg/aG0R3axpB3f0eplOzgr52Prtm7+ji9JnAeQXNP5xWgw09JxQh5cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3531050-fb31-2d9e-f3dd-2d310dc7c5ec@suse.com>
Date: Tue, 30 May 2023 13:56:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 714aa6d1-2536-4db3-a382-08db6104ebbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DT9APEgbm07iZTKLetrqIYUvcJ5pO25tEfxQSRrnyidUcWO/jTvnqboVgw9tRMqdS55k6sTsDBieCkuxGAtIHv6IEKIhEgqqSlx0JXGWyQcBUIhiocz0nSzI4MKLLIOx0m7phoNJjhrbEaomZ27EGnVjHlgwHC4HtkM3oi70DxaNKxfDgzojVJOUEv+t5U3NFc0PUSmMVmnn/aqKaYAWsmB0O+5BFwSEJHAZNUv4c6xqcnigOe0UpBifMeW6XNdeqKcrtOYI1V9EhEUSj/27CH6sezfy3huQ9aJ1LKXbshE3Oz0CNBZ/r0sjJbIITWfO86sRjOZy2X9kihkUqL01O0sPhM1ZYf04/dp1u674gIBelb3z4lrpz/MB88If9UOmZQuQuTq3YCYwdcbpec+vfhf7KNB3uLcTFi/oKvra+DX7VVGnfD/Geh1gamVtN4l+FRyhoQdWGpKKLkL9Itsg6TAiTpXRrNalec+/Pq84KZqGLJlt38ptCSsIQRbWuzwe2Ru1Z/FjmEAFtznpzSrbBw5ss0Db/dO8/S4Paw9oCfpbTDkIXr5H5aFOiM4qaauE+M3vxC6Bi1DhBphDMAZTIvYKcV6JBzyGxLjTuScfWweO6zd4nSp6uBspoXO02DU0wzQKKBAkKqjsPdIO7SidWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(31696002)(6486002)(86362001)(41300700001)(6916009)(4326008)(316002)(66556008)(66476007)(66946007)(36756003)(5660300002)(186003)(2906002)(30864003)(53546011)(31686004)(6512007)(6506007)(26005)(2616005)(66574015)(83380400001)(38100700002)(66899021)(478600001)(54906003)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG12QnVmREtienBNZ0gyc3ZwT1FBQ1B2NE5aQVBYS2pYOTNUWmxkSFFoRzgr?=
 =?utf-8?B?eGVJVEFZcHdoWkdFU0ExSExZWktNR013RlIyVDBCSnQ2MzUyNGpqQS9UQ0JK?=
 =?utf-8?B?UUFkUmUrc0dFZnhnVVl2WHZLeUIvcEVxT3R6d2thdC9ucjZzMHk5REd4Z1hJ?=
 =?utf-8?B?Um94MHMwY2s0Q2EzVmpaMVBYcWVIdE40RUpnWnUyZUpVc3IrZE1JS0tia3Yz?=
 =?utf-8?B?RG1icnpmQWVKb1pDMTZVM2JTRXNDNnhzQXJRdjlyMm8zdGF2V0tkM1FCM3oy?=
 =?utf-8?B?Vjc2ajFJYXFTMUg2TzVXL25hOGZ6eDNyaGMwdDZTaHQ0RndDNnJrYVQvYzBN?=
 =?utf-8?B?eDZUR1BUTmRvczF1SGphakdCbHE5d3ZxVlN3bEkvOEpEdUxNbUoydDRFQlgr?=
 =?utf-8?B?OHJQMEwwM0REdmtDWjVETnFoWUVVaEFvVXBzTkN1Smh1c21sbXU5QXE1SjN3?=
 =?utf-8?B?a0ZIaUwxbXFiWXFBaHFRd2pPL0NxU3dQekpqeDZiOWRHMStGanN2dFlGYWlR?=
 =?utf-8?B?eldIOFo3RWRzNGlQaDQ1SlZEZHlPWC9CMFNyQmE2TmdDYkRFeTh2UG45dmJO?=
 =?utf-8?B?UUNrVWZQaTlrcE4rb0Vjcm4vQzNRdUhJZk9IN3F5Q2MweDFTbldnK2ZaeUFl?=
 =?utf-8?B?RWVxVTArTTNKTEk5STBQRDkzUlorRDhMMXpHTUNCMW5jbHVHU1hNUkJKSmU3?=
 =?utf-8?B?MU1Xd0lWRUlRdHBwd0Z5a3dES3gvWUlpeGFTUkVPeHNRcUtlVjAxTXQyaC90?=
 =?utf-8?B?RkdTUGRscmwrQ1Q1R3hoWWRiRDQ5aUZNWXZpNXA2T09CYkIweGFBY2E1V1Jm?=
 =?utf-8?B?TmhWTWpaRlRuS2xGNnI2YmQ1UkduWU5LSjgzTkg3Z3pWTk9HcW1KR1NuaURa?=
 =?utf-8?B?Y2p6ejZueXJvSzJkdHlGS3FnNHlUM0tzUFNxcFJMd3JRRCsxeUpRNDlYYlFC?=
 =?utf-8?B?ZDdla3lsN25qYkVJdGNJczllR1dlMFpNYUhtRFVXa3dRczFwcHpleEdRV2pM?=
 =?utf-8?B?RThWS3NHQU9JUFNERHdFbFYvemJiYnZPaWVGeDNVVkxjQ3ZpZjAzMTZQWTdl?=
 =?utf-8?B?SnNmRUVLN3Z5aFBhL05wMHhYVG9VelQxalUzbkw5OUQzQm5USWdydUZWQmJw?=
 =?utf-8?B?MzZwTEUrcU1tK3NOSksrb2FJYm8rQmk5Ym5jRzEwdXYwMTFDT3Q0azVhOVcv?=
 =?utf-8?B?SGpEamF0R25VRHZ5UkVodnVBdTFFTURCOEc3K29tZDJXZGNFREp6MFU1NG05?=
 =?utf-8?B?MEdzKzl5aTFxU2pLdTRLcks3aEJUZDR5VHIwWk1GZzduMVNVREJFaGNRUVpU?=
 =?utf-8?B?QUE2d0ZXU05aNTByOG01UGVnaEdMblRHOUR1dTlwMThNeDBoZkovb1AzdUR2?=
 =?utf-8?B?c0h5eE9CVi9xL2hIQ0JqaDJRbGdzME82aUVETW9wWFpST3dLbTEwelluWm85?=
 =?utf-8?B?bGw0M1NvNHVqRDkxZFA0SXNldjYxSmZqR3VVY051NkgwUHlwcE1qNEtDRTRC?=
 =?utf-8?B?TjR4NlAvcHZ4dzJSTkNIWWJQeURlNlpVUWxvSDM1ZFVXcDVjZHhTVktEZDlX?=
 =?utf-8?B?YWp5ZkhpR2VPZEFaa2pWMzRYQW00Sk1JMktXakwwdWV1a0lNR0hvcDBWelc4?=
 =?utf-8?B?MGVDcDR3UklWOURGVUJNN1E0TUtGdVB0aUFndzVLQmhOOFF2VTBDZ1AwYXo4?=
 =?utf-8?B?ZVExOWF3bEtZTklUMTl2eDRHLzNEamNJcWJrck9VZnJBS3p0UEh6b2RSR2dr?=
 =?utf-8?B?SFVzY3M1WHE1bnJOMFZnZG9RTXd6RDY2T0M0RXdnVlVIQ01tSGpkR0VHN1I5?=
 =?utf-8?B?cW5ZUzFjeTV4VCt5a2h6QkZ5UHplOXUvQVF3VnpMUS93M0IzOTY5VnBRYWo0?=
 =?utf-8?B?UldIcjUvRU5QMXJvSlRsaXh2MWxHSlZNcWFNWW1ublJ6NUtIc2lMcU1DYmVn?=
 =?utf-8?B?N3daSURoM1o1dVVvbC95UkhTZVR0ZElWcm93ZEJWSUJtRHBEb1ExSUZWQXlp?=
 =?utf-8?B?bmJyRHZiVnNzOVdtcjNRZGdDSmlaQXRZa3ZZQkswbndJUjhlaTJnRWZ5T3Ju?=
 =?utf-8?B?a282bHJKY0dNVzRWbVVkMGJ4SXduM1JqYmJyMUJwZUVYanFjdDFWL2pEM1JZ?=
 =?utf-8?Q?pNmFR2/M/yxHmrq13/XH3BK3K?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714aa6d1-2536-4db3-a382-08db6104ebbc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 11:56:36.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrvFyTe+Ium2DnUNDr6Q8l/rzXitX4a9/cDmSIVyZeqCsQD/qJdRrSb2rh4VAtlT4F9PrMlYKcLw/Uta+7HFvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984

On 05.05.2023 23:25, Marek Marczykowski-Górecki wrote:
> In some cases, only few registers on a page needs to be write-protected.
> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> PBA table (which doesn't need to span the whole table either), although
> in the latter case the spec forbids placing other registers on the same
> page. Current API allows only marking whole pages pages read-only,
> which sometimes may cover other registers that guest may need to
> write into.
> 
> Currently, when a guest tries to write to an MMIO page on the
> mmio_ro_ranges, it's either immediately crashed on EPT violation - if
> that's HVM, or if PV, it gets #PF. In case of Linux PV, if access was
> from userspace (like, /dev/mem), it will try to fixup by updating page
> tables (that Xen again will force to read-only) and will hit that #PF
> again (looping endlessly). Both behaviors are undesirable if guest could
> actually be allowed the write.
> 
> Introduce an API that allows marking part of a page read-only. Since
> sub-page permissions are not a thing in page tables (they are in EPT,
> but not granular enough), do this via emulation (or simply page fault
> handler for PV) that handles writes that are supposed to be allowed.
> The new subpage_mmio_ro_add() takes a start physical address and the
> region size in bytes. Both start address and the size need to be 8-byte

8-byte (aka qword) here, but ...

> aligned, as a practical simplification (allows using smaller bitmask,
> and a smaller granularity isn't really necessary right now).
> It will internally add relevant pages to mmio_ro_ranges, but if either
> start or end address is not page-aligned, it additionally adds that page
> to a list for sub-page R/O handling. The list holds a bitmask which
> dwords are supposed to be read-only and an address where page is mapped

... dwords here?

> for write emulation - this mapping is done only on the first access. A
> plain list is used instead of more efficient structure, because there
> isn't supposed to be many pages needing this precise r/o control.
> 
> The mechanism this API is plugged in is slightly different for PV and
> HVM. For both paths, it's plugged into mmio_ro_emulated_write(). For PV,
> it's already called for #PF on read-only MMIO page. For HVM however, EPT
> violation on p2m_mmio_direct page results in a direct domain_crash().
> To reach mmio_ro_emulated_write(), change how write violations for
> p2m_mmio_direct are handled - specifically, check if they relate to such
> partially protected page via subpage_mmio_write_accept() and if so, call
> hvm_emulate_one_mmio() for them too. This decodes what guest is trying
> write and finally calls mmio_ro_emulated_write(). Note that hitting EPT
> write violation for p2m_mmio_direct page can only happen if the page was
> on mmio_ro_ranges (see ept_p2m_type_to_flags()), so there is no need for
> checking that again.

Yet that's then putting us on a certain risk wrt potential errata.

You also specifically talk about "guests", i.e. more than just hwdom.
Adding another easy access to the emulator (for HVM) comes with a
certain risk of future XSAs, too.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1990,6 +1990,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>          goto out_put_gfn;
>      }
>  
> +    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
> +         subpage_mmio_write_accept(mfn, gla) &&
> +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
> +    {
> +        rc = 1;
> +        goto out_put_gfn;
> +    }

But npfec.write_access set doesn't mean it was a write permission
violation, does it? May I ask that this be accompanied by a comment
discussing the correctness/safety?

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -522,9 +522,24 @@ extern struct rangeset *mmio_ro_ranges;
>  void memguard_guard_stack(void *p);
>  void memguard_unguard_stack(void *p);
>  
> +/*
> + * Add more precise r/o marking for a MMIO page. Bytes range specified here
> + * will still be R/O, but the rest of the page (nor marked as R/O via another
> + * call) will have writes passed through.
> + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_ALIGN.

With this alignment constraint, the earlier sentence can be read as
controdictory. How about "Byte-granular ranges ..." or "Ranges (using
byte granularity) ..."? I admit even that doesn't resolve the issue
fully, though.

> @@ -4882,6 +4895,243 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      return 0;
>  }
>  
> +/* This needs subpage_ro_lock already taken */
> +static int __init subpage_mmio_ro_add_page(
> +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    int i;

unsigned int please (as almost always for induction variables).

> +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +    {
> +        /* iter==NULL marks it was a newly allocated entry */

Nit: Even in a comment I think it would be nice if style rules were
followed, and hence == was surrounded by blanks.

> +        iter = NULL;
> +        entry = xzalloc(struct subpage_ro_range);
> +        if ( !entry )
> +            return -ENOMEM;
> +        entry->mfn = mfn;
> +    }
> +
> +    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
> +        set_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);

You're holding a spin lock, so won't __set_bit() suffice here? And
then __clear_bit() below?

> +    if ( !iter )
> +        list_add_rcu(&entry->list, &subpage_ro_ranges);
> +
> +    return 0;
> +}

Since you mark the qwords which are to be protected, how is one to set
up safely two discontiguous ranges on the same page? I think I had
asked for v1 already why you don't do things the other way around:
Initially the entire page is protected, and then writable regions are
carved out.

I guess I shouldn't further ask about overlapping r/o ranges and their
cleaning up. But at least a comment towards the restriction would be
nice. Perhaps even check upon registration that no part of the range
is already marked r/o.

> +static void __init subpage_mmio_ro_free(struct rcu_head *rcu)
> +{
> +    struct subpage_ro_range *entry = container_of(
> +        rcu, struct subpage_ro_range, rcu);
> +
> +    ASSERT(bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN));
> +
> +    if ( entry->mapped )
> +        iounmap(entry->mapped);
> +    xfree(entry);
> +}
> +
> +/* This needs subpage_ro_lock already taken */
> +static int __init subpage_mmio_ro_remove_page(
> +    mfn_t mfn,
> +    int offset_s,
> +    int offset_e)
> +{
> +    struct subpage_ro_range *entry = NULL, *iter;
> +    int rc, i;
> +
> +    list_for_each_entry_rcu(iter, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(iter->mfn, mfn) )
> +        {
> +            entry = iter;
> +            break;
> +        }
> +    }
> +    if ( !entry )
> +        return -ENOENT;

Yet the sole caller doesn't care at all, not even by an assertion.

> +    for ( i = offset_s; i <= offset_e; i += SUBPAGE_MMIO_RO_ALIGN )
> +        clear_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
> +
> +    if ( !bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_ALIGN) )
> +        return 0;
> +
> +    list_del_rcu(&entry->list);
> +    call_rcu(&entry->rcu, subpage_mmio_ro_free);

This being an __init function, what is the RCU-ness intended to guard
against?

> +    return rc;

DYM "return 0" here, or maybe even invert the if()'s condition to have
just a single return? "rc" was never written afaics, and the compiler
not spotting it is likely because the caller doesn't inspect the return
value.

> +}
> +
> +

Nit: No double blanks lines please.

> +int __init subpage_mmio_ro_add(
> +    paddr_t start,
> +    size_t size)
> +{
> +    mfn_t mfn_start = maddr_to_mfn(start);
> +    paddr_t end = start + size - 1;
> +    mfn_t mfn_end = maddr_to_mfn(end);
> +    int offset_end = 0;

unsigned int again, afaics. Also this can be declared in the more narrow
scope it's used in.

> +    int rc;
> +
> +    ASSERT(IS_ALIGNED(start, SUBPAGE_MMIO_RO_ALIGN));
> +    ASSERT(IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN));

Not meeting the first assertion's condition (thinking of a release build)
is kind of okay, as too large a range will be protected. But for the 2nd
too small a range would be covered aiui, so this may want dealing with in
a release-build-safe way.

> +    if ( !size )
> +        return 0;
> +
> +    rc = rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end));
> +    if ( rc )
> +        return rc;
> +
> +    spin_lock(&subpage_ro_lock);
> +
> +    if ( PAGE_OFFSET(start) ||
> +         (mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) != PAGE_SIZE - 1) )
> +    {
> +        offset_end = mfn_eq(mfn_start, mfn_end) ?
> +                     PAGE_OFFSET(end) :
> +                     (PAGE_SIZE - 1);
> +        rc = subpage_mmio_ro_add_page(mfn_start,
> +                                      PAGE_OFFSET(start),
> +                                      offset_end);
> +        if ( rc )
> +            goto err_unlock;
> +    }
> +
> +    if ( !mfn_eq(mfn_start, mfn_end) && PAGE_OFFSET(end) != PAGE_SIZE - 1 )
> +    {
> +        rc = subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
> +        if ( rc )
> +            goto err_unlock_remove;
> +    }
> +
> +    spin_unlock(&subpage_ro_lock);
> +
> +    return 0;
> +
> + err_unlock_remove:
> +    if ( offset_end )
> +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), offset_end);
> +
> + err_unlock:
> +    spin_unlock(&subpage_ro_lock);
> +    if ( rangeset_remove_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(mfn_end)) )
> +        printk(XENLOG_ERR "Failed to cleanup on failed subpage_mmio_ro_add()\n");
> +    return rc;
> +}

None of the failures here is particularly likely, so perhaps all is fine as
you have it. But there would be an alternative of retaining the
mmio_ro_ranges entry/entries, allowing the caller to "ignore" the error.

> +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *entry)
> +{
> +    if ( entry->mapped )
> +        return entry->mapped;
> +
> +    spin_lock(&subpage_ro_lock);
> +    /* Re-check under the lock */
> +    if ( entry->mapped )
> +        goto out_unlock;
> +
> +    entry->mapped = ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE);
> +
> + out_unlock:
> +    spin_unlock(&subpage_ro_lock);
> +    return entry->mapped;
> +}

This is easy to deal with without any "goto".

I'm further inclined to request that the ioremap() occur without the lock
held, followed by an iounmap() (after dropping the lock) if in fact the
mapping wasn't needed (anymore).

> +static void subpage_mmio_write_emulate(
> +    mfn_t mfn,
> +    unsigned int offset,
> +    const void *data,
> +    unsigned int len)
> +{
> +    struct subpage_ro_range *entry;
> +    void __iomem *addr;
> +
> +    rcu_read_lock(&subpage_ro_rcu);
> +
> +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
> +    {
> +        if ( mfn_eq(entry->mfn, mfn) )
> +        {
> +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
> +                goto write_ignored;

I think you can get away with just a single "goto" by putting the gprintk()
(and its label) here.

> +            addr = subpage_mmio_get_page(entry);
> +            if ( !addr )
> +            {
> +                gprintk(XENLOG_ERR,
> +                        "Failed to map page for MMIO write at 0x%"PRI_mfn"%03x\n",
> +                        mfn_x(mfn), offset);
> +                goto out_unlock;
> +            }
> +
> +            switch ( len )
> +            {
> +            case 1:
> +                writeb(*(uint8_t*)data, addr);
> +                break;
> +            case 2:
> +                writew(*(uint16_t*)data, addr);
> +                break;
> +            case 4:
> +                writel(*(uint32_t*)data, addr);
> +                break;
> +            case 8:
> +                writeq(*(uint64_t*)data, addr);
> +                break;

Please avoid casting away const-ness.

> +            default:
> +                /* mmio_ro_emulated_write() already validated the size */
> +                ASSERT_UNREACHABLE();
> +                goto write_ignored;
> +            }
> +            goto out_unlock;
> +        }
> +    }
> +    /* Do not print message for pages without any writable parts. */
> +    goto out_unlock;
> +
> + write_ignored:
> +    gprintk(XENLOG_WARNING,
> +             "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x len %u\n",
> +             mfn_x(mfn), offset, len);

Nit: Indentation.

> + out_unlock:
> +    rcu_read_unlock(&subpage_ro_rcu);
> +}
> +
> +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> +{
> +    unsigned int offset = PAGE_OFFSET(gla);
> +    const struct subpage_ro_range *entry;
> +
> +    rcu_read_lock(&subpage_ro_rcu);
> +
> +    list_for_each_entry_rcu(entry, &subpage_ro_ranges, list)
> +        if ( mfn_eq(entry->mfn, mfn) &&
> +             !test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords) )
> +        {
> +            /*
> +             * We don't know the write seize at this point yet, so it could be

Nit: "size" I assume.

> +             * an unalligned write, but accept it here anyway and deal with it
> +             * later.
> +             */

Have I overlooked where unaligned writes are dealt with?

Also nit: "unaligned".

Jan

