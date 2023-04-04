Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D16D6525
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517887.803842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhXA-0002gf-Vh; Tue, 04 Apr 2023 14:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517887.803842; Tue, 04 Apr 2023 14:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjhXA-0002eh-Sx; Tue, 04 Apr 2023 14:21:16 +0000
Received: by outflank-mailman (input) for mailman id 517887;
 Tue, 04 Apr 2023 14:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjhX9-0002eb-Nh
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:21:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3a42a1d-d2f3-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:21:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8482.eurprd04.prod.outlook.com (2603:10a6:20b:34a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 14:21:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:21:10 +0000
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
X-Inumbo-ID: f3a42a1d-d2f3-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLumDTvjYmBBEicEU0W6WDIxirkjIhnXI5vpIqaPT7dMG7NMsPunJMrVgAveEZLRLdEJY9bPG9pSy8GJh+htYDYGiix5D9vpyuO2QHZyjP32AzpeGVX4Kd+FSZ3E6evqikndHZPJUdFZ6UDeGh18JUR/mSUEbLroOVAPImJBUHzZC+RKN/dnZkYuUGHk65tO51P5zEOjGXlg1nM9HvYeN2kPDnb0Igd4Idekbjzelj78c0+GanuGpGpRDaA2QwjnP5FGtZ1CPSLZVVVNHtHYTDqaGSqxyvOEbE2asV6j/mv3+KyMTd8y0DfCXdVJpf8vT+3R7pcwbcP1q4ScxzzQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHyzEfPI/zvXf0RCfyg2mKP5kKbOBRpTIxetoWwctGc=;
 b=YexxhU6wCTE2CvMpprh6bSX4hQRhZQH7hpTRGKGUtf2Eh+l8J9npDodirU0B05IRp8tkqsT/8pjzvBVoaHlg+taD4o03hIGAwR13COwepumDdJcWbfPcYQ9VlNH/vVCzhWzkMw6ltvO+zC8IZ4UTIndCpTRPo3r+oPlcsarkm7wX4Q6k2fKMxsTgUAmZbT/FFD3VRU9svaM6kBaQ/wE8uSffBRe7ARV2j7wdrY81W0rvFOkYLPXTGDJmV9DzuNYrRtTpqgJs+qXlHY1/sHP+JqTJMJZ6JhpFeBWYlHbutG9fNFZx30Q5jhUxGn7zBghGGPstdF+pddGixRzkp/28Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHyzEfPI/zvXf0RCfyg2mKP5kKbOBRpTIxetoWwctGc=;
 b=r+KkM2vefq7hV25iKWPcPAzcoJswnkYl1WB4mRXucN31p0akV9fDOiU7K+lHJKIww0XOfR/cKJakN44tfZvKPP93zbqxixACw1Yqd3CDxwjGH7RhAGl2SjiVgiRu207P3uTI6es4+zjYzm0Xm9Izmhzfs1SaYACcahoxCFuv/SqUMb2KvBUv7uXmH1VmhX6d6H0rmeIZDgkk1HNJ/twppXCuUjkaSx0YV9lqu08GCQlBe8mnGEj7z9nv8m37+kMSn684iZCeB3QEohZAQ8qr+WGkitnyercpo+R9uvOkMNPEVjM4hnElnkngiV8wPD6tl54qsnZGX31QGan0RkUEGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f9218c1-9ee9-c5bd-af8b-003084aa66e4@suse.com>
Date: Tue, 4 Apr 2023 16:21:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <6d64dd4a-5b25-ddca-5c07-7b4c0fc48c0c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d64dd4a-5b25-ddca-5c07-7b4c0fc48c0c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0a04c3-12b1-4342-bc19-08db3517d631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwEmXkwe8u4fuKODHyx+T/2vRD5hj7rp0oFssz0K8zbL+pYQ4EPwXFlvuXGrJMuHFaXZMYO8IBbrZ7+npQeL8fLm44sOMGzQaQlS1sa1W3/9lQoobm5AI/drtBV8eS1D+aVoXWSBmXJo/+x4rnp1oFZxwLtF9bAHQalhWnWa0NkDFT2N2jrflhgiVLS5DLjplfNwP5h8B+Dbb0XTVy00hLqTirGrD+hcsKJq+o8EsdSrHcIkUZr3XICPLL+wQhPdyyTfCbmvg0KMUvLNAN5PtpSZbj0y+a4O2TECigD47DCysjgPTiPM9nBVXU46PhvpollJ4CQX78XmIzC2Lmc4qlrl9EBA1731RL3IEmwvSG4K/pe9S+zEJE5ggO1KelrTrAdsCSHj92+DI/XpYAv/N91iNhaugAzhIW4ghq+HfcL+GIAdqgXh4jlBW/sHMXd3SJkJFdxWqyFe2XhR9b1diIIDzuDpkb6kTQzdxWVDyavjeX8H45t0NjxBfOmyDW/REKCTzXIHRdPFZSyM6GAdS97FsxGWmpFmfAWb8AyOceSQNBxc0FoNtWe13Navf6fvB7h07JWPdBBuLLFSdpwybpemAyivWRY6+wiCFVt4eAN0m8IgbA8xidoAgG4XNpobl0M1k96KZMXf35howtsLug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(86362001)(31696002)(36756003)(2906002)(66899021)(31686004)(2616005)(53546011)(6486002)(83380400001)(186003)(26005)(6506007)(6666004)(6512007)(4326008)(316002)(8676002)(66556008)(66946007)(66476007)(478600001)(6916009)(41300700001)(38100700002)(5660300002)(54906003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUY0V0FOSFhBUlR2K3kydXBxdUJnMW9vUjhpWGVkWjlGbkFRQ0xhUnF6c1Br?=
 =?utf-8?B?VTR2NERBOCtYS3I5NTh1Qzk1UjN6YzgrMTB1d1JxTHdadjBxZGtYalcwdUlx?=
 =?utf-8?B?WUdUZ2FnRXlGZTNGeEZzUTZuMXZITEVyUzRPZHdmdXBib2NiYTJ2TVdzNmRI?=
 =?utf-8?B?MFlpOEJLb3lxSWJHblBvN0VNTVM5bnA0YW56V0U0M3ZpQ2MvK1VvUmFXdE5G?=
 =?utf-8?B?OTBkcDJleldtc2dZMlNjeXFsVWFmNkhadVh6bnAzWWFXeHBmTEZtN25PRWlu?=
 =?utf-8?B?TmZvV0ZYcllZRXRsM2pIdkxRKys3SlpuK3ZhRzk5OFR6RGoyWUtuUnM0M2xn?=
 =?utf-8?B?WmphekthWmo2eCtJSFo5ZmpQRkZFRzRRd25jOHFYeGZ2SmZiTEE1NmVuY21j?=
 =?utf-8?B?MUZ1NlJreWcwNVdJQ1VlZ2hkTkN5NXZ6S0JESjhNQ0hFeVRHVHZrQVhGT3JZ?=
 =?utf-8?B?akg5Wi9ZckRhY2VBbnNPTjZHR1YraTFza3BWY0RRMHBpczN6VGo4VThCRXJq?=
 =?utf-8?B?M20rN0t0WTRnbFp4QkpRMmRxWXkwQ05xb2VhdUNLSzdiK002S1B0WTRlc3NL?=
 =?utf-8?B?QWxTSUl3ekZweCtreVJkdittY1k1OGxKU3FlVzJpellUSDg3a0l4SUd0K1J1?=
 =?utf-8?B?c3pPUmlGSGN2cG9ISzZxaXpJdnFVQVVOR2JaN2pqK0FmYS9SdnRNY1dsdmpJ?=
 =?utf-8?B?L3UrQUxvWTBTNTIrL2JhT29GQlJSaHkzVjZNK1ZHeWUxb29Bc3dsTHRzSVk4?=
 =?utf-8?B?ZDJIZlEvRHdnc1JmRThudERSR2RxV3MzTlJuWUM0ckJYcW1LSmxCcG9vejdD?=
 =?utf-8?B?SUh5YlFUQ0lVMDI5RGo5SlpMaW10TGFTb0dLWUUzVmFSSEFadUpqL2xLakk1?=
 =?utf-8?B?Yks3T251WHhqMDRYemRSK0p3YXpuNlVMRHkvRUV0OHcwRDdjRmhpUHoyZVRi?=
 =?utf-8?B?NjRaTWd5RUlkekxobE03alR1ak1hdGpPck5uRDlYUjZlazdNU2gxcnYySjdu?=
 =?utf-8?B?UmtQZTRpYWMyck5BbE9QZU5jTmFtYVgzQlExYnR1dC9lYktQbWdGUFdSSnFO?=
 =?utf-8?B?c2ZaZzZEdWU1bzNrQXJRaEx5QjZsYzROVTArb3FXakxxVVRzYXVwNVFkRFIr?=
 =?utf-8?B?dTFHeGFPOTJtZnlmeStkOUNFMTFhNlQ5YkJuSC9Lb2JQblJYOHlRWHgrUkVH?=
 =?utf-8?B?MGhBZFN5LzZvdE5xWVpwanAvajN5MlZBTXNlUXd1ZU4vVGJBQ1N5QXA1eWpt?=
 =?utf-8?B?YjVJSG5JOTlnTWF1cHQrZ3R3UitiQUZOeGxEREtPcjRlVjN6ajZXY2hyc3c1?=
 =?utf-8?B?RjhudDUzd1ljVHJOS3FpUzZiQ09UT0ZzdmxDQnRxSTVHRExmOEdZSWw0TW5h?=
 =?utf-8?B?SlBFajhBVFJqUXlqa0ViNFVSYUhQVUpVamVvbEx3WnNZSHU0Y1VqU3BrWWVi?=
 =?utf-8?B?MWpMY05rUnhhMlRmek5sWldiWGZEZ0pGbEtyckx0ZFRGald2OXkyMDhxVnlU?=
 =?utf-8?B?ZkorbTlyYmVmcG5WWkxpdS9RTi9sMFhKWk9rQnBvOWdoSFFoWlNIT0tEQW4r?=
 =?utf-8?B?aUpJblMxbXFNaXZKR1prdkl1RHBZY0l1K3NQbEp2S3lPRHhHcHNLM3UzK0l3?=
 =?utf-8?B?N0t2ZTVXWlB6Q1JTU3l6UEpyZXlRQmczZzdpSlZBQlA1cWF5YW1hSFBPNVZW?=
 =?utf-8?B?T3A1d1BBUGhtdUptSlJHakszak5IZGMwZ2hiZUYzdTJNRER0bHI3MHMranRT?=
 =?utf-8?B?QXBEZXA1QVB3aGZSVlRvTjViM2puRDdmUXpqTmUyUTZQaFF5Snc1S25WMmhj?=
 =?utf-8?B?cCtacEoyS09UVXk0cVJncWhFYlhDclhTaWo1Z3M3NWszTkFrMEk2N09wS3Vo?=
 =?utf-8?B?b0xLUHBsZWg5blZsSVJ3UGR6MFF5ZTRXKzFSd2xKSHJaaHFMWWlXV0k5THRu?=
 =?utf-8?B?QTkxZ1dKK0NTanZ6NlBrcnFWYk1pNTNueHdWRm9ybEk0K0RDYTFvT05pZ1pu?=
 =?utf-8?B?ZnhvaVFXM244aWJSek5CVTFndm5udHgzSElrSXBTdmEweURjcVVEaUtyMGV4?=
 =?utf-8?B?cmRQcjgzVFFGNlZiN3F0anFQN2JGM3J3Q3Zwc1ZqL1lJVFJyMkY1WjFvRG9T?=
 =?utf-8?Q?Tb3FQpE7V4aGGbiottI4I3LWa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0a04c3-12b1-4342-bc19-08db3517d631
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:21:09.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhIa2HgwUpedre17lxjGRXTxiIRE9hAUek1D7YR5dppWAf9M/SVDjg35zaYyOMTLMa5apO1k6mgpsXOEg/D1NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8482

On 04.04.2023 15:08, Andrew Cooper wrote:
> On 15/02/2023 2:54 pm, Jan Beulich wrote:
>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
>> applies to guests also when run on a 64-bit hypervisor:
> 
> Is this really true?  Even when looking at Xen 4.2, 32bit guests are
> required to pass a full 4k page, not a 32b quad.

The full-page vs 32b-quad aspect is orthogonal. This VM-assist is solely
about where that data structure is, not what size it is.

> Which makes complete sense.  It was a hard requirement of 32bit non-PAE
> guests, so it was a natural restriction to maintain into 32bit PAE guests.
> 
> This is *only* a 32-on-64 issue, because this is the only case a 32bit
> guest could in principle use an L3 placed above the 4G boundary.

Not exactly. 32-bit Xen maintained a 4-entry "shadow" array below 4G
that it would copy (massage) the guest entries into upon CR3 reload
(just look for struct pae_l3_cache in the old sources). So above-4G
page table base was possible there as well.

>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>>      unsigned int   partial_flags = page->partial_flags;
>>      l3_pgentry_t   l3e = l3e_empty();
>>  
>> +    /*
>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
>> +     * understand the weird 'extended cr3' format for dealing with high-order
>> +     * address bits. We cut some slack for control tools (before vcpu0 is
>> +     * initialised).
>> +     */
>> +    if ( is_pv_32bit_domain(d) &&
>> +         unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
>> +         mfn_x(l3mfn) >= 0x100000 &&
>> +         d->vcpu[0] && d->vcpu[0]->is_initialised )
>> +    {
>> +        gdprintk(XENLOG_WARNING,
>> +                 "PAE pgd must be below 4GB (%#lx >= 0x100000)",
>> +                 mfn_x(l3mfn));
>> +        return -ERANGE;
>> +    }
> 
> Having dug through source history, I see this is largely the form that
> it used to be.
> 
> But I'm unconvinced by the "cut control tools some slack".  I'm quite
> tired of different bits of Xen taking on unnecessary complexity because
> people are unwilling to fix the problem at the correct layer.

But anything tools do before having created the first vCPU would not
have had any means to engage the VM-assist. I.e. ...

> A toolstack which has non-pae_extended_cr3 guest on its hand will know
> this before any pagetables get allocated.

... this knowledge buys it nothing: It would need to move the table
to below 4G irrespective of knowing that the guest can deal with
bigger addresses, just to get past this check.

> For this check specifically, I'd suggest prohibiting non-32p guests from
> setting pae_extended_cr3 in the first place (I see no limit currently),
> and then simplifying the check to just
> 
> if ( unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
>      mfn_x(l3mfn) >= PFN_DOWN(GB(4)) )

Dropping the is_pv_32bit_domain() check isn't possible because we can't,
all of the sudden, fail 64-bit guests' requests to enable this VM-
assist (no matter that we know that it is of no use to them). Dropping
the control-tools part of the condition is at least problematic as well,
as per above. Albeit I'll admit I didn't check whether nowadays vCPU 0
is initialized before page tables are built. But I think it's more
sensible the other way around: CR3 setting (in the hypervisor) is less
involved when the page was already validated as an L3 one.

Jan

