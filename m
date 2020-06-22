Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F620355C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 13:07:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnKII-0002wV-4N; Mon, 22 Jun 2020 11:07:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnKIG-0002wN-6j
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 11:07:16 +0000
X-Inumbo-ID: 87676ca4-b478-11ea-b7bb-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87676ca4-b478-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 11:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYWfCSMnoa319nsrG0OFxyIoyGnc3i8ydR25U3YVa1l3ADoeWrkykCgSK6aKy2HPMzTnhY9NUgtiC3niZytYa2ULUtgsKRXXL7bYVClMetDanGbcm2ysrlmL6mJpcwFGdzvnawdQV5pG9ABu07nFqiPEktqPsq//FlzPHjqjWduaPXJ7foEqtg3Vb1v3qlMu2hEQPM17KA40mUQnMiBFj3WYKKZ1NmuKJMSi4Tal75PGKgfcru38EGPjFfxa+mMBKssGWAqOxupYk1KW99ZQAA2P11NFg2uS3BFY2sE0gorEyRsp1PZXV8HhBGwuM66WKieD53IGr4gR4yEerHAfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d7R8yFQ34wsCJ6WFbtDARl8fhNNb4F/O/edTEMV+0o=;
 b=il7FGHBnFoK1+jDosD/+Kg1fGqnNe8/XScJo5ALWqwCbUc+58fDboaBCPHA/3SZDzi7rUr9qTlETIkO6IVPqMlODScnM7WAaNRQVwW657TDmR7H56GaA5yh5mLD4nQwQwzUIgfN+hCKDnMwTqKUF+5/Ww4stxVhLsC3DpFSSN0kNjPvCrlpgPjK3JG9O7IFbXxXbWoJcNhn9A3neo04kkDjNKhEYtWSs65tpiCFJ8rkNEar4UcSDaQocMWdCcjqPrQxJjHv4KljlbfcncN12rVGvoHxFv83i+6OuOpCR9RxiSFwvbug13PzQoECw/gUOoNoxw1fnUFiVVc1kH/M6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4d7R8yFQ34wsCJ6WFbtDARl8fhNNb4F/O/edTEMV+0o=;
 b=cGOkqVmOZBNWgYlIl/hb2nYXmr+O0gGTDhlLQGjhKRi3+b0TD+64efmX619pMvEYLR3p5WOeq6ENDIK1E32PG9K8UDxqwTGHFB09lJ2nFatKERk4Qh9zymi1GL3jtJajgNjolMkY8w6G+A+rN1cD8qWMJI1hQp6BL63oNjCUdsbx6i/pUtfXHq2cPQSXiLjioUnA26kV1YReYz0pQS4hpWXiZAL7vIft4nDgOhRyAl4DCB5Sx6HklasZTl39p7mtcxeWo8+Z0jBhFIXW8qM4Fa2LhjmawgNT0ttO7Z8HSxeyE3opzVTAx8C2fDdj+d2fMwmZgsrS8YpGQ73SSZ17Rw==
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4286.eurprd04.prod.outlook.com (2603:10a6:803:46::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 11:07:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 11:07:13 +0000
Subject: Re: [PATCH for-4.14] x86/tlb: fix assisted flush usage
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200618160403.35199-1-roger.pau@citrix.com>
 <0b6c900f-e2a6-c9b1-0e57-68c6898150a9@suse.com>
 <20200622093123.GI735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ad66ef4-9406-f35a-5683-ac4608242dd7@suse.com>
Date: Mon, 22 Jun 2020 13:07:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200622093123.GI735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 11:07:13 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13be6c2a-d215-4834-f4b3-08d8169c6abd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4286:
X-Microsoft-Antispam-PRVS: <VI1PR04MB42868960A3695D4B8E769AFFB3970@VI1PR04MB4286.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0yR5LoDDiYKYj62/5seI6MpR2herFq88gj5aF4jsnyswce8ECxY+21Kf4Mt7xlY0+fN27XsffnCzNTpP5uUpHybrKD5mnLWwPisDFrc+troZIeMPf5CfLKatkYBs3oEsQdiryNw6GSTIZm/XbJiHNpGQDZHRhMJKIPPZBKTXZTknNkVw2GM2tJ01DszZgAeS9gVxMZ8SzYukAXS1XwgV4Ek9GZp6z9HCkDPHbJpTc+3JqoQhBfV/MILOznro4qY5N5FBYJEQLF0wbbZCM8oG+fzWv1XSojotj8h8CwrU+W4eSby+MHrU1YcVBDslBqUR5OelBlNJyAO7ofvYE14yMgblT00mf/oP7bEqNW1IszF5lTRn/PpO3RJbeswkyi/G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(396003)(376002)(346002)(136003)(8936002)(31686004)(6486002)(956004)(52116002)(2616005)(8676002)(36756003)(86362001)(26005)(16526019)(186003)(316002)(16576012)(31696002)(4326008)(54906003)(53546011)(7416002)(478600001)(5660300002)(66946007)(66476007)(6916009)(83380400001)(2906002)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: XcQ7vKg1yGe2nsqbUi8FaQdWFOS5oXzZKZThk1wzxwBt5Ka4+HmiXgwhN3w/ZAqLqz7FTvr2CpXbnhcTGgq+07ZeILCtJ8gMHYAf0R7w200jQuiWhi9AV2AR4RrNYGKhT7PQxO3TARp0soJP6dzRkPY3Tds68GXIIAIkIFu5+gVLhKirpUtSwrSLQSc62t9/AKFkrc3m80S4Np1Le+PNOV2sOt8v5j8fROv0EMIfk307A0LrSjGaER/LbGFjkIMvAXRb/zLUX6RGBWXgbsMWlpx/ruksGzon+UEa6V4X0YOeE0aiDsAlyhxpUsjl3SdnRtC40qkeli5HlcoINUSGNDJ+7t0vNhsb2iq/R7DDCcwcjeclB7iGk4bt5HmIdVNhGL/MX3g0Khci/Wxlo+HbalyoE9o6MKxaFH0sk3nNJJX1DNlybBXjRirAeCAguScSlGs/lg7UsFib3iFNQAKpBYyPjiJDNXtFswtkGGWIw/U=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13be6c2a-d215-4834-f4b3-08d8169c6abd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 11:07:13.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zG96Na0Zesg+h7SIUOXyPbEd/o4MNBufywgmwgzxSMh70BdkLL+RWrdsmEQGw20104F67gy4cwQeWr6TrodCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4286
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 11:31, Roger Pau Monné wrote:
> On Fri, Jun 19, 2020 at 04:06:55PM +0200, Jan Beulich wrote:
>> On 18.06.2020 18:04, Roger Pau Monne wrote:
>>> Commit e9aca9470ed86 introduced a regression when avoiding sending
>>> IPIs for certain flush operations. Xen page fault handler
>>> (spurious_page_fault) relies on blocking interrupts in order to
>>> prevent handling TLB flush IPIs and thus preventing other CPUs from
>>> removing page tables pages. Switching to assisted flushing avoided such
>>> IPIs, and thus can result in pages belonging to the page tables being
>>> removed (and possibly re-used) while __page_fault_type is being
>>> executed.
>>>
>>> Force some of the TLB flushes to use IPIs, thus avoiding the assisted
>>> TLB flush. Those selected flushes are the page type change (when
>>> switching from a page table type to a different one, ie: a page that
>>> has been removed as a page table) and page allocation. This sadly has
>>> a negative performance impact on the pvshim, as less assisted flushes
>>> can be used.
>>>
>>> Introduce a new flag (FLUSH_FORCE_IPI) and helper to force a TLB flush
>>> using an IPI (flush_tlb_mask_sync). Note that the flag is only
>>> meaningfully defined when the hypervisor supports PV mode, as
>>> otherwise translated domains are in charge of their page tables and
>>> won't share page tables with Xen, thus not influencing the result of
>>> page walks performed by the spurious fault handler.
>>
>> Is this true for shadow mode? If a page shadowing a guest one was
>> given back quickly enough to the allocator and then re-used, I think
>> the same situation could in principle arise.
> 
> Hm, I think it's not applicable to HVM shadow mode at least, because
> CR3 is switched as part of vmentry/vmexit, and the page tables are not
> shared between Xen and the guest, so there's no way for a HVM shadow
> guest to modify the page-tables while Xen is walking them in
> spurious_page_fault (note spurious_page_fault is only called when the
> fault happens in non-guest context).

I'm afraid I disagree, because of shadow's use of "linear page tables".

>>> Note the flag is not defined on Arm, and the introduced helper is just
>>> a dummy alias to the existing flush_tlb_mask.
>>>
>>> Fixes: e9aca9470ed86 ('x86/tlb: use Xen L0 assisted TLB flush when available')
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> It's my understanding that not doing such IPI flushes could lead to
>>> the pages tables being read by __page_fault_type being modified by a
>>> third party, which could make them point to other mfns out of the
>>> scope of the guest allowed physical memory addresses. However those
>>> accesses would be limited to __page_fault_type, and hence the main
>>> worry would be that a guest could make it point to read from a
>>> physical memory region that has side effects?
>>
>> I don't think so, no - the memory could be changed such that the
>> PTEs are invalid altogether (like having reserved bits set). Consider
>> for example the case of reading an MFN out of such a PTE that's larger
>> than the physical address width supported by the CPU. Afaict
>> map_domain_page() will happily install a respective page table entry,
>> but we'd get a reserved-bit #PF upon reading from that mapping.
> 
> So there are no hazards from executing __page_fault_type against a
> page-table that could be modified by a user?

There are - I realize only now that the way I started my earlier
reply was ambiguous. I meant to negate your "only with side effects"
way of thinking.

Jan

