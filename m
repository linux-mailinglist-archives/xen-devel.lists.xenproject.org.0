Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F35579BA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 14:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354887.582232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LYN-0000bW-EP; Thu, 23 Jun 2022 12:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354887.582232; Thu, 23 Jun 2022 12:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LYN-0000YY-Ak; Thu, 23 Jun 2022 12:03:19 +0000
Received: by outflank-mailman (input) for mailman id 354887;
 Thu, 23 Jun 2022 12:03:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4LYM-0000YS-BH
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 12:03:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7774f7d0-f2ec-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 14:03:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7534.eurprd04.prod.outlook.com (2603:10a6:102:ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 12:03:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 12:03:15 +0000
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
X-Inumbo-ID: 7774f7d0-f2ec-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xgk3Bei9Q0Yno9495l2e5ZtbQ/1N3BzXvQUR7QX1MJjFSYGyxWI+qVKUpzCpNJ02xkG8QS2F6YVnDbcLwjKg8uFdRvbmlh1ULDrXZl4INxxQTSsiofvnymlXTQ9q8m5vNpsEAPxC156XOA76GzJUQudxuGZ2iZtOAC8MEQu7PG/gOzu/8LktKWQxmNajQlsjVnaYbDgyaW92QxfXtj+zNXoGOgQHNh0+6m3DEmn+zEWlQRou+57AV/GVuvTnBaglD/EKVec4QfDiCgGSR6XsFI4BtOQIkLcSWnq/cV/BJbMkv9entjkTwENvcq7i4jEhOfdTIYJIXhvQxq7eN8GcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+TaXK5q8EwNOsaof0Oa83Zj9OAG55ERnCGvpk7KNHU=;
 b=f5d0uYWmtw25KpZsSTxiVQsqtXcpSfakP66ybDCfpvIAmYusSc9vknJkvKbtMDTKFjwCu/qV85U3OBM4kaZ54LTBpIpoquSJM/dZA4cy+HUc94ONw3TY7ckxi86+HG5Hgbh/IAU5r8anI3yWkYDR5tsiZY1f3qrcZL0t1Ck7PQ1120cUEWmM1cKHApns6828zCfVtVwnSYfPeupwF7maY3o6EE2/k2BVCqJQtAPSvCMI6pPNN1RZ4tvzedv3eeo8TYe315CKw3vVyTcUwyJHmO8Lp4c4v8Huzq7EfqARVmjoR2WHR1mAMw1VQVO1HDl5UXM/CHM7MQGZTkXJegtUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+TaXK5q8EwNOsaof0Oa83Zj9OAG55ERnCGvpk7KNHU=;
 b=JmHUq2kRh7V2yBIFlHEeUOAGIQxSQAsfwworQekxvx8mqGvx/9TV6pt0tP1NhVfQDFcRK4wsOWzWDZxeqlI16jVoh3rsgTz6xnHSpKyzcYP2mTb18hiUws6jqhHzrccIoGKoAiE4LqkytKG86gx+5GBjQuPLyaK9snDLZX56tqT65l+rWRVIXSIq2SxNBnABlaU4L52CQ29b5IMNHi90S73tdN2brVym70Vy9i3w0zDDvd6/nOHoVF3TeLUrfS3oQNyjUcpNsCX7jXaVf1zTnw9w4IxyceL8cpYVmcJL2T71TgKew6HbJjByvMn0SOqTTI9r3+nE3+2RXb+1CHylXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9150fbde-2cbb-06e8-aefa-658e0940a411@suse.com>
Date: Thu, 23 Jun 2022 14:03:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Ping: [PATCH v2] x86: correct asm() constraints when dealing with
 immediate selector values
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2c04b2aa-d41f-0a2c-6045-2d37a6fac53e@suse.com>
In-Reply-To: <2c04b2aa-d41f-0a2c-6045-2d37a6fac53e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0057.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1886e906-4cc4-4e9e-80a1-08da55105aa3
X-MS-TrafficTypeDiagnostic: PA4PR04MB7534:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7534729AAAD8EB747927AEFFB3B59@PA4PR04MB7534.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vZyJwel1bxuS7ZfkCbdsrxXmoNk5C5bq++iZi1w1wDXHKJ5839DoS/JhpqT4FOI7xE8sGNT2+sNUO8lsSqF/uQLEIEQxPbMl8zuBfOxesZiuHdQisJgDFqKG0EvsdBTz6tSnjrK3hLV3WjJiVEoWFNukl0M30HFGe5TgkV5cVUYZ9zZhQFyhPqlVt9JAPaLbeyVVzZOeQRskPg+J/4uzlj5AJ7Q0pXzQpyl7v/Qrf0w2oH4hNPA/aH0FdaHlapotzOVdapcfIQL0kOMqw3zej32NapamuXfCrmErVriN71d410utah23ybswg74rf9scN21gwIB4bv+SCx/DLJrnSyou/kxRMsJShl+KpVfxHjc87CUTMTqp7oYGdvDMOEMstG9Hqpvg2/tAbtUIDDRBvtzQxQRH0Ud/upWQYr4nITZ2NWyK0RobB/amM6W6OVavHHziHmKTDPvYlRdbkqIv3jK2G/hnAvNPwJ287EILPBjkXJd/C1e9db5cjSPczdXTjgmf12lrHNQ+dZHvvW05sSTuvvSyjwxkbjGs1myaRsUWaLxEJ437Unr9Seu/rn92Qi+DKPIIP6QuBHXJ5AvnqOYWK2yyuYlUQhw5q8vwa4QEipz/6FpnJc1t0cfKHOF/gsJtHBNVQeeHTzV3tASXj2Mqvq1NI6qUOf8j25U0axWFcfPezzW9mw8RbD8IXSfow3s0/eNcc9gb4ZrZrvo9EKzM6Tu6nrhVBvqiZ8rFgLJS4PKcVBh8E+/1W+xhghW3/KpGa/Py9ROj7J9W/xecRWca91gJnKyWq7khcgv/3rzRLTBHiGxcwWneY1aTR1Z4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(39860400002)(366004)(346002)(83380400001)(186003)(6486002)(54906003)(38100700002)(2616005)(8936002)(31686004)(5660300002)(2906002)(36756003)(6512007)(66556008)(31696002)(66476007)(8676002)(66946007)(41300700001)(6506007)(86362001)(316002)(110136005)(26005)(53546011)(478600001)(4326008)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDdIdjZ5ZGZpclNXbVZzVElmVHduNy9ZNWpFZkM5bFN1NG5tU002bEFROGdF?=
 =?utf-8?B?SEVXUFNIMzdvSFVTZC9NZzhBVTdVc0Y2dzlZK0RlcW5CRXpjdktRTGxPTEsx?=
 =?utf-8?B?SWVmbGNlODZvWWEwdCs5ekJMQUZFNk9oSVBmbVpBK1c1T1NBYlFpOWJ3Vm9Y?=
 =?utf-8?B?ZFVJc1lmaTZLejJUTGpUeTdPZDFub1hIUjFkaUgvR29nTllWeVcrczV4Tkw5?=
 =?utf-8?B?c0o0cVc2dzBlTy95TVVXbE1hbXdrSGl4OUlsblRET0E3eHBkZjNQZmRJbUdx?=
 =?utf-8?B?d1E1djJzNUlmOGJ1dzlEWngzTlNoTitabFQ2aUNlN3RhMkZ5OXFOZUZOMkVD?=
 =?utf-8?B?QW9XcjJndzhzMUcyOHBVYVlsSkEyM2t2Q0I0Zm9aZGd1RFJRUCtxa3gxWmJs?=
 =?utf-8?B?azdQaGN0SjM3TVVQcElBSUVlLzJVUnk2NTZNRURBd1pmM0I1TCsvdFlqS3Jh?=
 =?utf-8?B?QkozMGpRQ3k0Tmw3WmllV0NUSDNJbTRLa05Xa0RqV2YrZWdCcDA2amJ0SjRZ?=
 =?utf-8?B?a29Sb1BoZXA1Nk1CR1p5OVhsY3VPZDJxQWU4SDJHVm0veTlYKzhZV2tWOUND?=
 =?utf-8?B?R0t5alV5V0grS3FPWlpjZWU1V3I0WDVweG9LNzM1R0hoWjJIc29IR0trc1ZO?=
 =?utf-8?B?VVRjc1dsdXFsVWtFR2REcDJmZnV6MkpzOTdJdDZoUi9xaS9LME8rc2VLandM?=
 =?utf-8?B?aXMvakdpNXh1SitUckRBTUNRcWI0TnJTcm5QQUpscnZnTThkY3psZkxsaEpQ?=
 =?utf-8?B?SUJhbW1vZk5WQ1JlZEJBWnE5Nmt5VnJGL2NzVWE0OG1TVVk1S0pZK0E0aW85?=
 =?utf-8?B?SGdQRWFkb2pkQTkrdXo1SThubWVFNlp1dGpjbHRtdjZVbGgrZjdLY2NsS0wr?=
 =?utf-8?B?QWhITHZTYWxGQzhTTlRaSytON1JGREZidDNkdnZyTnNHWmlCMmtHMktUZ1pL?=
 =?utf-8?B?QzArbDduR1hzcXQzMyswQldUUTU3S3RxOXlkUFhCM2l2L2dDbU80MnBydXRQ?=
 =?utf-8?B?ajNMa1RudG1kajRhakZNZ3djWUM1VFJUeWhvY0hUZUhKMUs0ZEF1VFAwcXI0?=
 =?utf-8?B?L1k3ejRUL2tkTjcvS0hCVGRKUDJQeTdjRWFxNUpWSDFZUHlxT2JTMU5MNGF4?=
 =?utf-8?B?cW0vNHEzUjBreXlJekNlN0gwZmRwZWljcEcvcjNEKzJGM1pmQi9SK2hjejRO?=
 =?utf-8?B?RWJHUmNUOW96RzZWRGYxWlc2dFVnNXpDTFFVbUhLYm5EY0FURXdKVVRVNmx6?=
 =?utf-8?B?V2dBaktodk4vLzZHU3pvN3VwZ2xJR0gyNDZKZWhzMFZzckE3YzVRak5qejRV?=
 =?utf-8?B?eDI3aTdsS3ZEaDM4bVd0M1Vzc1JHMDd4Rkt4dDdaYkhidi9qbWNBT25FeHBt?=
 =?utf-8?B?QWVtRWxjakdRdmhqK014eEhNb3R1VDFMcTNZdmhHSTlpcHJ2RDBqYXpwVEhX?=
 =?utf-8?B?TEJka0k1RXFrQlhOanIrT0ppNHBmcUVRSnJKbC9NeXJ1cUpTQ2xnNTBqcm1B?=
 =?utf-8?B?eVNvam4wOUtXYTdoT1lrMUwvWThnQTB5VEt0WFcvQ0dDcnZTNUxtU1gvVDNU?=
 =?utf-8?B?RCtDb2lHNW5pdnV6N1RaOVEvQ3cwaE1LVHNEVmx6OERWK2k1L1l2c002d2hV?=
 =?utf-8?B?ajF5cXgrSGZibzlWSUtRaXBLZGFvTkR3TkJXSjErOEpDZ3lQbFhCS3BPWW1U?=
 =?utf-8?B?ZlhvbFRLc201ZGJyRk14Qm1EenJ0VTFxMzhxQlZLWXJzblJmandUWGEzSk8x?=
 =?utf-8?B?Wityb3NLSFY0Y0x4emRId3FhQVBZNXZFNGlwYUJ5ZldmTUVORnhUYW5mdWdk?=
 =?utf-8?B?YjlRbHBhYWFkQ0RIS3YvemtuY3JxMi94VnM5Z2d1TlpKUGFxODFYeTBJQ1p5?=
 =?utf-8?B?cFFxSUpBUmc3OWsrbmIxUjRrUnUwNHd3azNNRlZ3d0Y4YmJmaW5iSFcvS2Zy?=
 =?utf-8?B?YVZvSHNLSzRCb3BsT1VhYkQvbmxTNklLNHNYeGRSUkJMUHEzbnBnbkpGSS9Q?=
 =?utf-8?B?NlZaY1pBdG9COTk5ejByVnZEWEZ2TjE0czVYQUVtR0M3aTl0b2VlRTRZVDRE?=
 =?utf-8?B?NWpkelFSYVRQMjRueHBsaEUwMVZpRHJNRGFYSEVMcG50M2llU3NjNW9vWnJG?=
 =?utf-8?Q?MsJ0nP3hr/Fvhvy6WhCCyQ9Cw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1886e906-4cc4-4e9e-80a1-08da55105aa3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 12:03:15.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yk5GlaDRyWeWGrbRK+R1D8Nu6XewmKqhSRNpJPQwxlvkiyq6SqjcY/7PNQxokKvnTrmxDh+FToH8G4H4QnSVXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7534

On 13.09.2021 08:26, Jan Beulich wrote:
> asm() constraints need to fit both the intended insn(s) which the
> respective operands are going to be used with as well as the actual kind
> of value specified. "m" (alone) together with a constant, however, leads
> to gcc saying
> 
> error: memory input <N> is not directly addressable
> 
> while clang complains
> 
> error: invalid lvalue in asm input for constraint 'm'
> 
> And rightly so - in order to access a memory operand, an address needs
> to be specified to the insn. In some cases it might be possible for a
> compiler to synthesize a memory operand holding the requested constant,
> but I think any solution there would have sharp edges.
> 
> If "m" alone doesn't work with constants, it is at best pointless (and
> perhaps misleading or even risky - the compiler might decide to actually
> pick "m" and not try very hard to find a suitable register) to specify
> it alongside "r". And indeed clang does, oddly enough despite its
> objection to "m" alone. Which means there the change also improves the
> generated code.
> 
> While there also switch the two operand case to using named operands.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Use named operands in do_double_fault().

This has been pending for over 9 months. May I ask for feedback?

Thanks, Jan

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -736,7 +736,7 @@ void __init detect_zen2_null_seg_behavio
>  	uint64_t base;
>  
>  	wrmsrl(MSR_FS_BASE, 1);
> -	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
> +	asm volatile ( "mov %0, %%fs" :: "r" (0) );
>  	rdmsrl(MSR_FS_BASE, base);
>  
>  	if (base == 0)
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -248,7 +248,8 @@ void do_double_fault(struct cpu_user_reg
>  
>      console_force_unlock();
>  
> -    asm ( "lsll %1, %0" : "=r" (cpu) : "rm" (PER_CPU_SELECTOR) );
> +    asm ( "lsll %[sel], %[limit]" : [limit] "=r" (cpu)
> +                                  : [sel] "r" (PER_CPU_SELECTOR) );
>  
>      /* Find information saved during fault and dump it to the console. */
>      printk("*** DOUBLE FAULT ***\n");


