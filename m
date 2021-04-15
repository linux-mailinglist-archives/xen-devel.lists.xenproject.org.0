Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D395536063C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110987.212110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWygB-0002mO-N6; Thu, 15 Apr 2021 09:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110987.212110; Thu, 15 Apr 2021 09:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWygB-0002m0-Jh; Thu, 15 Apr 2021 09:52:55 +0000
Received: by outflank-mailman (input) for mailman id 110987;
 Thu, 15 Apr 2021 09:52:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWyg9-0002lv-Mo
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:52:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6052db49-096c-465b-9e92-c25906d690bd;
 Thu, 15 Apr 2021 09:52:51 +0000 (UTC)
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
X-Inumbo-ID: 6052db49-096c-465b-9e92-c25906d690bd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618480371;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4mIXoq7b+tcKk2B3leGu3DPY3B3fYa+xv1YTP2oSz4c=;
  b=A3XBADMWTOMmgRC+OPyq9rfUwuBHOCxsnRlwIxIVwLz7xHeNO5yvPiIC
   vgZ+5ti7ZZzlp1aZXLtKDxSTcsG8ymyw/Z97s2ssV2CotjiYDDYQ8GlY9
   DqaWx+X+4VcaxojzMI7+Q8xezsxoOb59OcrSSAo63ay87Lo2Sagktye3u
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LcaneTw1UysLlbOGzArNnXpFZ1IbrRTKnsWzYEm7KDgPD+qiDt3hHZk1e8RmDB1jCc16qWppkN
 SPDax19cFxLPcqmQ2n2AFhi1GNHJwumJwr/PaSwNsyAtBfJUb5a9ysWDXQgaaDH62VV9obl+gz
 Pbz5NVO1149f5MMIE8OI7oQNK4mn7FO9vC/u42w4tymbeOMqIpXPwUwyd/1K/f9bzu0pHe5AeT
 1DAE9PLVnbq/7JeAXKVbcm21IvtWG2ye9DzNLlXbQFoNfKp80NHlJyyxH0D1o87ZyVI7tUF1Zc
 BBE=
X-SBRS: 5.2
X-MesageID: 41657404
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JHpctq6RmsgqRVfG1APXwbKBI+orLtY04lQ7vn1ZYRZeftWE0+
 Wnm/oG3RH54QxhP00Is/roAse9aFnb8oN45pRUGL+kUhXvtmfAFvAF0aLJxTr8FyristNMzK
 sISdkFNPTcBUV35PyKgjWQPM0nxLC8nJyAocf74zNTQRpxa6dmhj0JdzqzNkFtXgFJCd4YOf
 Onl696jgGtc3gWcci3b0NtN4OoyuHjr57obQULABQq8mC1/FeVwYTnGBuV1Ap2aVJy6Ioi6m
 TMnkjY4aiuopiAu3zh/lLT9JhflZ/dzMJCDqW36vQ9FzOEsGmVTbUkf4fHnTgu5Mmz9V4hkb
 D30m4dFvU2z0mUQ0aYjl/G3RL63DMn9nn4oGXo+UfLsIj+XzI1C81ImIJffF/Y8iMbzapB7J
 4=
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41657404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YItFRQvvWIy2YlI8sMTSKMMyCr2ViIdw9jCQ8/1/ixeRlEP5EacyoaRs1sz96qYk8E+TEIO6ZwtwsuBOtWbSNYhFa5+tRwJd0bdkZ1J1mnPtp/eXeyoISynwoLtbOy/JxYpEju6rt288eVlyE9j8CKpa8VJwefG6YJBOPsOEwg/4R6UlkuXU+PTvuuCMDLqgzw2BV4+Jqt1l32QmaGaHfOapW4ForwME4q0RWytJUX+6j9ae3Iwd571jw3iPXvLOPDNph/UK2tZ5AeUfS9JDA91jDEuN41A3SEr38mpt/3lV4xL03gb4EqMgIwBKWwYSPufXJVuMqSt6Vl+eGQGXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK2xeTZd+7jZuCsIbVtq7R8ilQ8WPn7dcsZtznw+4iY=;
 b=Qso7W14UE92RRYlAU0ica3TAcxYARX2IJhkyEyScXLSXIfdFY7hCBiIXU6xOe5pUTw2/rR3SqVBFQGuMSAXNDTuc4oiQodRHqKYr5yLWAL71os+YTcQORHAOE2AHCH69CC7QmA3clqUrw/hF7lZ15Dn3QZ93FyzaNyaJ/egTgmQMdnTXLGZJWBniwu9ykBb0aF4iBQCRqSX8E4FBYQxZCZ79DUqh9CXOWrX/0jLJZL6Z0uoKs2ahuHr03KSdXhzcj28r6jrGj1kAncBxAmclFMoHpSxi+EGaaKXQyjre8xxiilkeHUuccHE7IAhB7LK2OpsJs75tFA9FDx3ezEUFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK2xeTZd+7jZuCsIbVtq7R8ilQ8WPn7dcsZtznw+4iY=;
 b=JkYLYPjSYEYNokSqI47jEpkXdF1LZ2NDMpCUC1o9QJozagMgkCmLdUD6k0myhEDNMILVRSTGwSnRT1rWsboFFgOUKbJlSlXDhWoux9PLQJX/ZwzPfKuZNg2UG7p5BmGDLZJ5ywo1xcxkzRpc2Kucf+Fq0ZJpwnK+BjMPIPNtK5w=
Date: Thu, 15 Apr 2021 11:52:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 12/17] x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents
Message-ID: <YHgM6eTT2OJY89aU@Air-de-Roger>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2aaffa0e-e17f-6581-6003-e58d2c9fc1d7@suse.com>
X-ClientProxiedBy: AM5PR0101CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8863c3-8bfe-4395-789a-08d8fff4398c
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3578309FA0FCE6C40C684FEE8F4D9@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w4tvPW1sI0yJCz82i6tYni9LmruG0XbqTzjSdmP6NiKin/XBC/TExPSJlGYUseOD7LDcXcS4+l6tnS3/ANpzxPL5NBB6nEnRviEKYzMhRl8DlApzTV0HPyK+A+VLRbqqBCsXOXuG1YYMrrgl4F+16ixCrr8H9OhL0HcQD/5VRoKf412u/iRalZOl5Hkc02b+EMorEsp7nSh4hZtaIhjOO4B9sef/PCH85O9wK8vUCpPOSC4JdRMfenU75tbJEthuXHj1pPDwU34CRKuhAa0rshF3jhzm4GZToa0CIQGJupBB98DcEvvLoRGe5umJNZIzqAeLT3EzwnMxTfPeatCBEHZw6hAOzPKAqH3DA8aGCP9pcCsRaqWYiGNLp2outEs3rbtJIp3TwmP0cfr49XckfUCgspABTdx6hPNmU8C7GDxx8M0EcqvBCPPIvJ8l8sIAkGtupkn20x4fJR8VItU/HFnO92NtqcrTMfCZ1VxpoRXisY+QAfud2UXfUGZXBCHYAih7MNWjZ2MatM7soJKySnpH+Gd8+Lq5L3o0NS7ZXioLn+yUFn8rQsshWerd5r4C/vZVzvgjF3ErU1oECdXAUCmROVIpbwoKojeMYkxwOU/G1r+EqHgY/eryb6HnKFev4jO+FU6eIxWgBmmz5Igp8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(136003)(346002)(39860400002)(396003)(366004)(6666004)(2906002)(956004)(316002)(66556008)(478600001)(8676002)(4326008)(6486002)(54906003)(33716001)(6496006)(66476007)(38100700002)(86362001)(85182001)(6916009)(8936002)(9686003)(26005)(5660300002)(16526019)(186003)(66946007)(83380400001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDJubDVPT0FtWUhPajZIOGJTWU5DMjFncEUzR1ZBOVlIOHRxK1A2MDNmQWxi?=
 =?utf-8?B?bTVTTy9IbWhlc1kxSC9Xelp0NXgvNENaVmxzbm9XNm8zRGtTaTV5WUIrbmdt?=
 =?utf-8?B?cThmOHY2Z1MvakFtUDBVaVVnSUZJNGlMekdIWWFVb0ZKZTR1ZUdqTnI5VTln?=
 =?utf-8?B?YTUrVUdWTkN4UnFOSUN3TjUySVdDNjFvbWE5clZIN2g2dit1U0VFeVhmZ3VR?=
 =?utf-8?B?YS9ZaTN0Z3pDa1BPTjJOZW9FcXMydnI0Rmk3eCsxWHpweXVQcW9rMlI5Y1M0?=
 =?utf-8?B?UE1jTEtlMDNZa01rQ05FS2FIQUQrYjNwRXNJQ1RSYXVJQVNQMTJwakZ6Ni9o?=
 =?utf-8?B?MzU5TWdSRkIzZnRuQkNNQlY4U3ZnWVVac3l5YUxtTnFyaWlVdEhXR1VQSXFz?=
 =?utf-8?B?OUpYSWFHYXIrcUpkL3pZRCtQRForb0Z4dHBuUVBtY05PcUc5S1pWKzhSc05h?=
 =?utf-8?B?YWhxODZFak82R2tTM01ROUpuV2dpSTNELzFhbjNnUi9VUm1CZlZhc2YwUHh1?=
 =?utf-8?B?WFcwUFZDWVdqTHNpai8yQUsyY3dFdStkcEM2YmJNWkQrOVNySTdsTXpKdStG?=
 =?utf-8?B?cU5RQ0RKMEZUdkZSdXF6REV0SlloNVFPVGNPdEg5UlNUZVFVSVd0V3N5S0Fw?=
 =?utf-8?B?TUZMMVgxNFlycVdUa3k2eENyY21wRlZ3R2FlUXdUcXdPcjBTcHhMbUZWZ0Vq?=
 =?utf-8?B?a1JFSjMwWTEreWRWYStVT3FxNnIzZTRSbnUvSFJjOTJwWlBaUkpHRk1WVFFw?=
 =?utf-8?B?ZEVMcU5oL2NCWFJiR1VOTmhxa3duTGJTc2NyZmp2QWxDZFhVYk5lRVF1bjJy?=
 =?utf-8?B?UkR6SnRZekRvdzdGL1FOQ0JJdGJFZVkvaDU2TWZ2d09CbjQwS3pIWkxVWDVP?=
 =?utf-8?B?N05zZmxuakgrSWdXenUvRFBtTGNVZ2U1RnpsdmVjck1NRXNZdnRwc1NoaVE3?=
 =?utf-8?B?R3lJeDV5QVU2UmNmRXZrbjM1cGRzb0lrREw1RGVRT3lOYkpjUWFFQk1jcXJ5?=
 =?utf-8?B?VVEvblVsYjJVdkIwSVRBTmRUTGQrSG05TXhORDh5QnVPb1ZkeTZEalR6bEhS?=
 =?utf-8?B?MGRoL0NSUVFqTFFVNUl6NWFOQ2hEcHZDVnNsaTBwdzFNejI1SzdrNHlNZm1a?=
 =?utf-8?B?RXRUcm9VR3JibFp4VklHcm5RVXhPdS85MVpENHlZb2FNb2xNQmVhUkdMOUFw?=
 =?utf-8?B?VFNMZW44SmljY0orT096SXlaYkY5OURORGI3VmY3MFhkcDBmNUdIdjlnOGsv?=
 =?utf-8?B?V0hjeVNNZXBvY0xWMlBqTXBjYk1BZ0lTMzU3TElFa0FvSDBEWXVyRUttbVNR?=
 =?utf-8?B?VSs2V0VURi9tY09tSHN0QUttZ1c2VEF3Szl3WXZBcjZ2Vk1YVEpjSzZiczBr?=
 =?utf-8?B?NE5kQXQ4OVFPdEFkTldhbG1aYm9CTVFPZWNUb3NYOW1JTzU0NEdOOEo5WmVS?=
 =?utf-8?B?V05ka2lobzhDSEhuYkdxc2c1K25qWFhqUHlkVmwwc0syL2tacy9aRS84UmVq?=
 =?utf-8?B?cDVOUkpqTDM5bWRMUjRWZlRjVnBydjViOW8yMEhYUTM4bkduaC9GRFJpYW5s?=
 =?utf-8?B?c3dmZG9zMStKRTJWbkV1TVNVMjNnbXRtbkMwRkd1WG1ha3gvYm9HUUZ4ZkEw?=
 =?utf-8?B?OUxlUWhpVXdKb0UvMWNhVEU3ckEyNjlndEZHTUJWNmN4SU5VL1dtV0RYbVdz?=
 =?utf-8?B?c2RUL1FsTU1vcUYrWEh6SlAwanlwMUJoWTBoazhNVVlBQnRvUi9sZ0hGaVA5?=
 =?utf-8?Q?8DPABp+l1r6hzB+1owlW4CkjqF7GVPxduTEOsUz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8863c3-8bfe-4395-789a-08d8fff4398c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:52:47.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL0kX7Cc/W5KMCShcx4jqitdff9IqYXCjv2e0PbwTenok+U/DEVgS1l9xdY5OWfVfBnsW1UUQigZsddSlP8FpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 03:33:03PM +0100, Jan Beulich wrote:
> Zapping leaf data for out of range leaves is just one half of it: To
> avoid guests (bogusly or worse) inferring information from mere leaf
> presence, also shrink maximum indicators such that the respective
> trailing entry is not all blank (unless of course it's the initial
> subleaf of a leaf that's not the final one).
> 
> This is also in preparation of bumping the maximum basic leaf we
> support, to ensure guests not getting exposed related features won't
> observe a change in behavior.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -8,10 +8,13 @@
>  #include <err.h>
>  
>  #include <xen-tools/libs.h>
> +#include <xen/asm/x86-defns.h>
>  #include <xen/asm/x86-vendors.h>
>  #include <xen/lib/x86/cpu-policy.h>
>  #include <xen/domctl.h>
>  
> +#define XSTATE_FP_SSE  (X86_XCR0_FP | X86_XCR0_SSE)

This gets used only once...

> +
>  static unsigned int nr_failures;
>  #define fail(fmt, ...)                          \
>  ({                                              \
> @@ -564,6 +567,103 @@ static void test_cpuid_out_of_range_clea
>      }
>  }
>  
> +static void test_cpuid_maximum_leaf_shrinking(void)
> +{
> +    static const struct test {
> +        const char *name;
> +        struct cpuid_policy p;
> +    } tests[] = {
> +        {
> +            .name = "basic",
> +            .p = {
> +                /* Very basic information only. */
> +                .basic.max_leaf = 1,
> +                .basic.raw_fms = 0xc2,
> +            },
> +        },
> +        {
> +            .name = "cache",
> +            .p = {
> +                /* Cache subleaves present. */
> +                .basic.max_leaf = 4,
> +                .cache.subleaf[0].type = 1,
> +            },
> +        },
> +        {
> +            .name = "feat#0",
> +            .p = {
> +                /* Subleaf 0 only with some valid bit. */
> +                .basic.max_leaf = 7,
> +                .feat.max_subleaf = 0,
> +                .feat.fsgsbase = 1,
> +            },
> +        },
> +        {
> +            .name = "feat#1",
> +            .p = {
> +                /* Subleaf 1 only with some valid bit. */
> +                .basic.max_leaf = 7,
> +                .feat.max_subleaf = 1,
> +                .feat.avx_vnni = 1,
> +            },
> +        },
> +        {
> +            .name = "topo",
> +            .p = {
> +                /* Topology subleaves present. */
> +                .basic.max_leaf = 0xb,
> +                .topo.subleaf[0].type = 1,
> +            },
> +        },
> +        {
> +            .name = "xstate",
> +            .p = {
> +                /* First subleaf always valid (and then non-zero). */
> +                .basic.max_leaf = 0xd,
> +                .xstate.xcr0_low = XSTATE_FP_SSE,

...here. And then I also wonder whether this requires having any
specific values rather than just using ~0 or any random non-0 value.

> +            },
> +        },
> +        {
> +            .name = "extd",
> +            .p = {
> +                /* Commonly available information only. */
> +                .extd.max_leaf = 0x80000008,
> +                .extd.maxphysaddr = 0x28,
> +                .extd.maxlinaddr = 0x30,
> +            },
> +        },
> +    };
> +
> +    printf("Testing CPUID maximum leaf shrinking:\n");
> +
> +    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
> +    {
> +        const struct test *t = &tests[i];
> +        struct cpuid_policy *p = memdup(&t->p);
> +
> +        p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
> +        p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
> +        p->extd.max_leaf = 0x80000000 | (ARRAY_SIZE(p->extd.raw) - 1);
> +
> +        x86_cpuid_policy_shrink_max_leaves(p);
> +
> +        /* Check the the resulting max (sub)leaf values against expecations. */
> +        if ( p->basic.max_leaf != t->p.basic.max_leaf )
> +             fail("  Test %s basic fail - expected %#x, got %#x\n",
> +                  t->name, t->p.basic.max_leaf, p->basic.max_leaf);
> +
> +        if ( p->extd.max_leaf != t->p.extd.max_leaf )
> +             fail("  Test %s extd fail - expected %#x, got %#x\n",
> +                  t->name, t->p.extd.max_leaf, p->extd.max_leaf);
> +
> +        if ( p->feat.max_subleaf != t->p.feat.max_subleaf )
> +             fail("  Test %s feat fail - expected %#x, got %#x\n",
> +                  t->name, t->p.feat.max_subleaf, p->feat.max_subleaf);
> +
> +        free(p);
> +    }
> +}
> +
>  static void test_is_compatible_success(void)
>  {
>      static struct test {
> @@ -679,6 +779,7 @@ int main(int argc, char **argv)
>      test_cpuid_serialise_success();
>      test_cpuid_deserialise_failure();
>      test_cpuid_out_of_range_clearing();
> +    test_cpuid_maximum_leaf_shrinking();
>  
>      test_msr_serialise_success();
>      test_msr_deserialise_failure();
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -346,6 +346,8 @@ static void __init calculate_host_policy
>          p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
>                                 (1u << SVM_FEATURE_TSCRATEMSR));
>      }
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> @@ -415,6 +417,8 @@ static void __init calculate_pv_max_poli
>      recalculate_xstate(p);
>  
>      p->extd.raw[0xa] = EMPTY_LEAF; /* No SVM for PV guests. */
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_pv_def_policy(void)
> @@ -435,6 +439,8 @@ static void __init calculate_pv_def_poli
>      sanitise_featureset(pv_featureset);
>      cpuid_featureset_to_policy(pv_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_hvm_max_policy(void)
> @@ -494,6 +500,8 @@ static void __init calculate_hvm_max_pol
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  static void __init calculate_hvm_def_policy(void)
> @@ -518,6 +526,8 @@ static void __init calculate_hvm_def_pol
>      sanitise_featureset(hvm_featureset);
>      cpuid_featureset_to_policy(hvm_featureset, p);
>      recalculate_xstate(p);
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  void __init init_host_cpuid(void)
> @@ -704,6 +714,8 @@ void recalculate_cpuid_policy(struct dom
>  
>      if ( !p->extd.page1gb )
>          p->extd.raw[0x19] = EMPTY_LEAF;
> +
> +    x86_cpuid_policy_shrink_max_leaves(p);
>  }
>  
>  int init_domain_cpuid_policy(struct domain *d)
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -121,7 +121,9 @@ void cpuid_viridian_leaves(const struct
>      switch ( leaf )
>      {
>      case 0:
> -        res->a = 0x40000006; /* Maximum leaf */
> +        /* Maximum leaf */
> +        cpuid_viridian_leaves(v, 0x40000006, 0, res);
> +        res->a = res->a | res->b | res->c | res->d ? 0x40000006 : 0x40000004;

I think you would need to adjust this chunk to also take into account
leaf 0x40000005 now.

I also wonder whether we should actually limit HyperV leaves. I think
it's perfectly fine to report up to the maximum supported by Xen, even
if it turns out none of the advertised feat are present, as in: Xen
supports those leaves, but none of the features exposed are
available.

>          memcpy(&res->b, "Micr", 4);
>          memcpy(&res->c, "osof", 4);
>          memcpy(&res->d, "t Hv", 4);
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -964,13 +964,15 @@ void cpuid_hypervisor_leaves(const struc
>      uint32_t base = is_viridian_domain(d) ? 0x40000100 : 0x40000000;
>      uint32_t idx  = leaf - base;
>      unsigned int limit = is_viridian_domain(d) ? p->hv2_limit : p->hv_limit;
> +    unsigned int dflt = is_pv_domain(d) ? XEN_CPUID_MAX_PV_NUM_LEAVES
> +                                        : XEN_CPUID_MAX_HVM_NUM_LEAVES;
>  
>      if ( limit == 0 )
>          /* Default number of leaves */
> -        limit = XEN_CPUID_MAX_NUM_LEAVES;
> +        limit = dflt;
>      else
>          /* Clamp toolstack value between 2 and MAX_NUM_LEAVES. */
> -        limit = min(max(limit, 2u), XEN_CPUID_MAX_NUM_LEAVES + 0u);
> +        limit = min(max(limit, 2u), dflt);
>  
>      if ( idx > limit )
>          return;
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -113,6 +113,10 @@
>  /* Max. address width in bits taking memory hotplug into account. */
>  #define XEN_CPUID_MACHINE_ADDRESS_WIDTH_MASK (0xffu << 0)
>  
> -#define XEN_CPUID_MAX_NUM_LEAVES 5
> +#define XEN_CPUID_MAX_PV_NUM_LEAVES 5
> +#define XEN_CPUID_MAX_HVM_NUM_LEAVES 4
> +#define XEN_CPUID_MAX_NUM_LEAVES \
> +    (XEN_CPUID_MAX_PV_NUM_LEAVES > XEN_CPUID_MAX_HVM_NUM_LEAVES ? \
> +     XEN_CPUID_MAX_PV_NUM_LEAVES : XEN_CPUID_MAX_HVM_NUM_LEAVES)

I guess we don't have any form of max macro available here to use?

>  
>  #endif /* __XEN_PUBLIC_ARCH_X86_CPUID_H__ */
> --- a/xen/include/xen/lib/x86/cpuid.h
> +++ b/xen/include/xen/lib/x86/cpuid.h
> @@ -351,6 +351,13 @@ void x86_cpuid_policy_fill_native(struct
>   */
>  void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
>  
> +/**
> + * Shrink max leaf/subleaf values such that the last respective valid entry
> + * isn't all blank.  While permitted by the spec, such extraneous leaves may
> + * provide undue "hints" to guests.
> + */
> +void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p);
> +
>  #ifdef __XEN__
>  #include <public/arch-x86/xen.h>
>  typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -238,6 +238,45 @@ void x86_cpuid_policy_clear_out_of_range
>                  ARRAY_SIZE(p->extd.raw) - 1);
>  }
>  
> +void x86_cpuid_policy_shrink_max_leaves(struct cpuid_policy *p)
> +{
> +    unsigned int i;
> +
> +    p->basic.raw[0x4] = p->cache.raw[0];
> +
> +    for ( i = p->feat.max_subleaf; i; --i )
> +        if ( p->feat.raw[i].a | p->feat.raw[i].b |
> +             p->feat.raw[i].c | p->feat.raw[i].d )
> +            break;
> +    p->feat.max_subleaf = i;
> +    p->basic.raw[0x7] = p->feat.raw[0];

Do you need to use p->feat.raw[i] to assure the basic 0x7 leaf is seen
as populated?

I think in theory raw[0] could be clear while raw[i] cannot as long as
there's a populated leaf > 0 due to the check above.

Thanks, Roger.

