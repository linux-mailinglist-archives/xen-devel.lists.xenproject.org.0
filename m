Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEFB5815E0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375390.607739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM47-00053t-2t; Tue, 26 Jul 2022 15:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375390.607739; Tue, 26 Jul 2022 15:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGM46-00051t-US; Tue, 26 Jul 2022 15:01:42 +0000
Received: by outflank-mailman (input) for mailman id 375390;
 Tue, 26 Jul 2022 15:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGM44-00051n-PP
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:01:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d97716ca-0cf3-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:01:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6597.eurprd04.prod.outlook.com (2603:10a6:20b:d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:01:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:01:35 +0000
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
X-Inumbo-ID: d97716ca-0cf3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdTaIN3ooWhEbFxeU7G2ucmsWISjIgb6Cn9U90zyXpluoqZKFL1FkTtZAQ0s07z9dzVebSVAYn7zrFPSpjzpf6Fd27lMOlK8E4/1Cn1WZ4nBwieIgAx5awrMeVnfCbaYRHyjGA75jSrLO+YWlLcE/OVVS2o1IMl6Vei3sLEFmdkNJCcWVysQa/N1w8OjnP3NEgLwXQC9oZyv+XT35aO33o427rJLCux1btUXPK/ryy1VXQpaBKCQZCaGfAtibHv1oOE77lFnyCcoNo9++isNwJKQPHkMG4PzYQ3L/Y4Q8sdp/5a3hApP0BH2SapAHZKtOHOSP+gjQ738pt8HssBtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pod+1bWAh2XWYCi0GKl0F4kY09Luzp6KkCoWHY/Umo0=;
 b=fE+mdD+i/GSamBgEvwfTg57PUBMaf5iwUHnysV4FSFahtEpCXs9Zvf9EvPqGamGI9eRX0UEa0wI9/iWHu4DNZQJDd4RFKrLj8uOv4jKMsXF+Y9YqcormOE+wufNsebbkt3CbQfdrUqSkk+cvqo+CTIlN/em6Riqm+g0mIBdIesIOTvhNiBQnk+ELrNZoYLQOkguEK3jHrJR38507McSjpBLIVblbv4gQM4f1yyvgjaGI7iorJiSsSHj4fNGtcz4/NZVdBAcTaAcjvevFT2yDyNkYBjkxiTOaQeobVIEnN1HaqggvRCQqtEC7+xhN/9I70Yds6exCIbem9TurmUVtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pod+1bWAh2XWYCi0GKl0F4kY09Luzp6KkCoWHY/Umo0=;
 b=fhr5+LFQWkzo4C2D6yXCRBhUGGiWUFLdNXciSV2bdywQ4C31AWoKKZNImcHNOybZIZ42oMgq4doTMYWTBngWl69lpxaJVf4qhUYbbmf3jGhi9zoS0yB+4e+rXhVteddFVe9rFBVXxi4FRRH9rb+rgkyIixPG1oG17YTOUYBQsNcaChL10fX+OKpw4Jxkc/Jq6zUfFnh6iidFrFXPJ725/iaWtB5fkQt41w9j2pLFX1aqevTIlTbyvdF2/gPPWseElXLDM1VcdCrTDuACrr28jQlebE26H3YIfCViB8qKOT17lDeK+b857O66Jbt8rnRGJt75Wbdf+XfbKZZTjZZ2YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8208dbdd-ca5a-a1c1-478c-cb7cdb0992bb@suse.com>
Date: Tue, 26 Jul 2022 17:01:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 11/18] x86: initial conversion to domain builder
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-12-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0179.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cf3af95-9e1b-48bf-3ade-08da6f17bc18
X-MS-TrafficTypeDiagnostic: AM6PR04MB6597:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sv6p5iFySziYdac2pW0bAnt0RS7j31FhyWsLA0dWFcXHMS10JfT9ROa5tT+8qYX+P+ckd+2NWJGTNltYysAM6y3eUo2shtibjDzJOChyLsZxxWNPyaOd2O/sRbaJl/2bWpZlsiWR281WJ8Te6rBeGf9OnsgpCfbL+Tog/IYTTNsI4WNbzQHfuGyTNP+PYaKTGikLk4C9k2WG0LetgLuektq1InTBvIQgFAjKzAaXSv7XGAJAozymG5AyyZk77VLuRyIzJP0TFVMh1YOdNbAN+A8IduHezZ+seR+rnIgyw6UetmsLBHV9q8vEUxd3O/xeX4yg1jOuLzH8IqYLoDgEGvzpTBmoo2AP/mTJPylpB07zZKKhVYba+z3jgRLOQNZxjaRSZAmX7oBepbYEv4yot8oXzWJBX89AmpL5hzh7f3YoXQRZthMaVWc4T8rrHCpepq5y4U+rz2vjIrU+8Scd0FVw0nm81I6hGOsbD+r6YoY7Kns3rPuM7aX7cGIQn8xBmUUkJBxad/9Z7ANX+AX1fv/G6LK0OCeJAqfcYvW2FLX5l0i9n0yOgPBg3jMv4E9UNvNXUGV5g4meZkXemxQKCR/eaS++IpU7uhhe4rvww5IfIXd6aCwKjRXi9m3qyfW/Y4T1EVFT4CvBwY/wvz07Ai4hiKXZvO2b2jag0+BUGElxpF/FBhKU1Dg87paaGz2zyX4kfkUlr7H78GzysxhdOIC/QX5sqTzUwv+hh/R7KwxpeSwNeflNpBBPWfSpHBC9153EUOKAe0j85y3dDOUU83yqToAY1bUfY+rCZK2Gvk7jIDL1M+9Aw/DsCslgyhehhFZn/wWA2DJQeCPp9xzbgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(186003)(2616005)(83380400001)(6916009)(8676002)(4326008)(66946007)(66476007)(66556008)(54906003)(6512007)(36756003)(6506007)(53546011)(31686004)(41300700001)(26005)(2906002)(86362001)(31696002)(38100700002)(316002)(478600001)(6486002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0N5cmU0TGY2cFNTbk5NOHIzdTM3aTdZQTdmVkdwa3ZlZEhZZHZjYTVwWlZh?=
 =?utf-8?B?c1Q4WEFrL1BQQmI2a1dEVFpsT09mMVJYVFRvYUtVNDBwVERyNzBwWEFYNkQv?=
 =?utf-8?B?TUNHZEFaNmRKYjhNWEUreFlQZzhVek1NWHFyeWtrYWJ0aUszd0JmLzgrYWtE?=
 =?utf-8?B?Q2cyV3E5T0ZKV1JjclpHYzczV3dvSVNCYjEvMXR0M2RCV2lVaVVOd2piWTA4?=
 =?utf-8?B?Z0FYYWNnQnFDNVNYdVJCZnRCYUdCK1Z5MmF3ZkRTYk92QUxXV3o5QnBNeFNW?=
 =?utf-8?B?cWhUOEl0cnZSTzdObWtMYVN0cENwVjRZbEdWdGNjT3MyUG1XdVJJMzlSQjRZ?=
 =?utf-8?B?RmF5bW1lb1NGVFByTDRuc1NWZWtlemV1bHJYNmR4V1FkejRDemRuQXJHbTdX?=
 =?utf-8?B?d1lhN1hVcWdva2dsOUIyUGd3alBUcmg5LzlWRTVyWVVKa3RmZE5wdU0ydUlt?=
 =?utf-8?B?ZkVsU2hDR090emxaM1AwRDlwTGVCN21kMTFMT2JHbDRZR3B3OG1yWEtKakFm?=
 =?utf-8?B?SjczRUJTRXpWNkpObkMyQ25ETHZ0T0k2VEdvak5pV2dETGtpSk9sMS9KSHEr?=
 =?utf-8?B?dGtNUGt5YkhVWVJ3bk9qejAzc2FRTzIvRXFIblFxdzBRUkljdStVdnduVlA3?=
 =?utf-8?B?MTJnZTR5cStvcnBMUDdHMjRWcTArT2pyTHJWT2E0b3lMWUVUbld5cHVwa3Z0?=
 =?utf-8?B?eG9oRVkweHc1MzNtRzJ2MFhEd3VZVTYydWlNeXNISnlwcjZibTNOSFA4TEpI?=
 =?utf-8?B?d1hUYUorbjk0bHNsMThQdURuQTEybnFycWtDcWlZUXdyNmROR3Rybk5URnN4?=
 =?utf-8?B?Z3JXNDJGaXdwS3Job3MyNGsyTEpLbG5XazBZd3Z5YUxNeGpzZXlEcUJkOTEz?=
 =?utf-8?B?djg5c1NpM0FNN2pPQVNHWTlQNE1vam1XUytMYUVOUGhIdnR0a0pUZ2ZucTFU?=
 =?utf-8?B?NTVhVkJKL0tldnhyQkRUTDVnWWNPbHdZdlBOWWR2TnpIbWdJYkJxK3JYbHQ3?=
 =?utf-8?B?TlUzT1A1ckNWN1lrcWdMaWRLMU1UQnMva1ZsVVdLeVVWY3k0ZVBQQ3N1NmRW?=
 =?utf-8?B?TklUSlZWc1ZzdzFXdjJNOFRuUzlKZDZoWmRIWE5USTljb2Z6VXZzR1RSdWVB?=
 =?utf-8?B?bWNmQ1Q1U2pyRDBXWUNZcUdjcWpIRWNvbDBoaHpKM1ZCZWlHdk96YjlXYjFp?=
 =?utf-8?B?ZlhmaWZrS3pqMndUMnBpS3Zoakh2dEtCS0Z1ZWVvMUprOUwxQVRlNkl0Q1M2?=
 =?utf-8?B?VnFxM1NsaUg3bVEyZ1kyM1FUT2d4MGlRV2J4TlRVckpVOXZpUXkveXhUTTRL?=
 =?utf-8?B?Q3psa2wyMEQrNVRUcUlnK1RZekFqTmhEWmRFWGdsTHZYMVFWbHY2dmFjT05X?=
 =?utf-8?B?cWg1b2VGd1BFb0pjeGxuV2U5b3BTM2FQKzVpaHViUWF0MS9VWmdKNS9lbnI1?=
 =?utf-8?B?WFdpMlhjMDhLTjUwcGp5TFR2MElmd25sbjlEbGhrN3Z0WmZGUnNMWUU2WWJ5?=
 =?utf-8?B?alF4aTJscVExQUxjV0VkZzFTTEhEZUllQVlYbHRnd3JyT3AydWhvODhjanlr?=
 =?utf-8?B?RE1Va005Q1duekdSazN5Y3BxTStyS1pXM2tOaE5WalQ5UGY5YnpRWmVRL3Jp?=
 =?utf-8?B?WUtxL3BxTUV1SU9CSGtHT014QmJteitEU2M3THVqMTVFenNTckJyaDFyR0Fo?=
 =?utf-8?B?ZHA1d20zMTgrWkhZUkM0VzdxVHYyNVV4QlR0UURBbkRQOUNKTGwrZVJGOHZp?=
 =?utf-8?B?K2dBc09YUGJtcHhuVkRlbXR4VmN3a2VabEZJVWRtVWRHbFQ0Y2pBL0xuU0d3?=
 =?utf-8?B?amx3SU1WL05JVEVicmRTL2x0YTdPS053VmVGa21tS2FmYW1QckgvMWh3bld3?=
 =?utf-8?B?bGVRTTUxVmlYZ0FwK3dQcm1BZFhSTC90QW5TWmtuQnBnUlZvaXVyVklsSC80?=
 =?utf-8?B?VFVJM3pWaWd4TGVhUWsyRVQ1MTU3WTZlUm1ENmFHTVgweXoyeWx0c3d3eC9R?=
 =?utf-8?B?NHdPTWR4Rkg3a2Q2SkQvNVl0Wnl0UDY4UTdWZkR5ajk1R0xRamhmZ1V4clF3?=
 =?utf-8?B?cUhVelJET0c4WUx2WmpHZzB1L0FleXpSQW1vNGJsUXp0TlJSSzgwd2hPQWpq?=
 =?utf-8?Q?u4YjHqYkLF152diezOFbl05pF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf3af95-9e1b-48bf-3ade-08da6f17bc18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:01:35.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTRdvWsGgHIjvYNK2FlrxCQ28U6YxCXXXbwmgcnWl/YDpI3Qi8H+96sdnHcCZ+/rf2SSciOhtzn1ZOZV68C7tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6597

On 06.07.2022 23:04, Daniel P. Smith wrote:
> This commit is the first step in adopting domain builder. It goes through the
> dom0 creation and construction functions, converting them over to consume
> struct boot_domaain and changes the startup sequence to use the domain builder
> to create and construct dom0.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  xen/arch/x86/dom0_build.c             |  30 +++----
>  xen/arch/x86/hvm/dom0_build.c         |  10 +--
>  xen/arch/x86/include/asm/dom0_build.h |   8 +-
>  xen/arch/x86/include/asm/setup.h      |   5 +-
>  xen/arch/x86/pv/dom0_build.c          |  39 ++++-----
>  xen/arch/x86/setup.c                  | 114 +++++++++++++++-----------
>  6 files changed, 109 insertions(+), 97 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index e44f7f3c43..216c9e3590 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -6,6 +6,7 @@
>  
>  #include <xen/bootdomain.h>
>  #include <xen/bootinfo.h>
> +#include <xen/domain_builder.h>
>  #include <xen/init.h>
>  #include <xen/iocap.h>
>  #include <xen/libelf.h>
> @@ -556,31 +557,32 @@ int __init dom0_setup_permissions(struct domain *d)
>      return rc;
>  }
>  
> -int __init construct_dom0(
> -    struct domain *d, const struct boot_module *image,
> -    struct boot_module *initrd, char *cmdline)
> +int __init construct_domain(struct boot_domain *bd)
>  {
> -    int rc;
> +    int rc = 0;
>  
>      /* Sanity! */
> -    BUG_ON(!pv_shim && d->domain_id != 0);
> -    BUG_ON(d->vcpu[0] == NULL);
> -    BUG_ON(d->vcpu[0]->is_initialised);
> +    BUG_ON(!pv_shim && bd->domid != 0);
> +    BUG_ON(bd->domain->vcpu[0] == NULL);
> +    BUG_ON(bd->domain->vcpu[0]->is_initialised);
>  
>      process_pending_softirqs();
>  
> -    if ( is_hvm_domain(d) )
> -        rc = dom0_construct_pvh(d, image, initrd, cmdline);
> -    else if ( is_pv_domain(d) )
> -        rc = dom0_construct_pv(d, image, initrd, cmdline);
> -    else
> -        panic("Cannot construct Dom0. No guest interface available\n");
> +    if ( builder_is_initdom(bd) )
> +    {
> +        if ( is_hvm_domain(bd->domain) )
> +            rc = dom0_construct_pvh(bd);
> +        else if ( is_pv_domain(bd->domain) )
> +            rc = dom0_construct_pv(bd);
> +        else
> +            panic("Cannot construct Dom0. No guest interface available\n");
> +    }

Isn't there an "else" missing here, even if just to ASSERT_UNREACHABLE()
and set rc to, say, -EOPNOTSUPP?

> @@ -311,11 +310,12 @@ int __init dom0_construct_pv(
>      unsigned long count;
>      struct page_info *page = NULL;
>      start_info_t *si;
> +    struct domain *d = bd->domain;
>      struct vcpu *v = d->vcpu[0];
> -    void *image_base = bootstrap_map(image);
> -    unsigned long image_len = image->size;
> -    void *image_start = image_base + image->arch->headroom;
> -    unsigned long initrd_len = initrd ? initrd->size : 0;
> +    void *image_base = bootstrap_map(bd->kernel);
> +    unsigned long image_len = bd->kernel->size;
> +    void *image_start = image_base + bd->kernel->arch->headroom;
> +    unsigned long initrd_len = bd->ramdisk ? bd->ramdisk->size : 0;
>      l4_pgentry_t *l4tab = NULL, *l4start = NULL;
>      l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>      l2_pgentry_t *l2tab = NULL, *l2start = NULL;
> @@ -355,7 +355,7 @@ int __init dom0_construct_pv(
>      d->max_pages = ~0U;
>  
>      if ( (rc =
> -          bzimage_parse(image_base, &image_start, image->arch->headroom,
> +          bzimage_parse(image_base, &image_start, bd->kernel->arch->headroom,
>                           &image_len)) != 0 )
>          return rc;
>  
> @@ -545,7 +545,7 @@ int __init dom0_construct_pv(
>          initrd_pfn = vinitrd_start ?
>                       (vinitrd_start - v_start) >> PAGE_SHIFT :
>                       domain_tot_pages(d);
> -        initrd_mfn = mfn = mfn_x(initrd->mfn);
> +        initrd_mfn = mfn = mfn_x(bd->ramdisk->mfn);
>          count = PFN_UP(initrd_len);
>          if ( d->arch.physaddr_bitsize &&
>               ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
> @@ -560,13 +560,13 @@ int __init dom0_construct_pv(
>                      free_domheap_pages(page, order);
>                      page += 1UL << order;
>                  }
> -            memcpy(page_to_virt(page), maddr_to_virt(initrd->start),
> +            memcpy(page_to_virt(page), maddr_to_virt(bd->ramdisk->start),
>                     initrd_len);
> -            mpt_alloc = initrd->start;
> +            mpt_alloc = bd->ramdisk->start;
>              init_domheap_pages(mpt_alloc,
>                                 mpt_alloc + PAGE_ALIGN(initrd_len));
> -            bootmodule_update_mfn(initrd, page_to_mfn(page));
> -            initrd_mfn = mfn_x(initrd->mfn);
> +            bootmodule_update_mfn(bd->ramdisk, page_to_mfn(page));
> +            initrd_mfn = mfn_x(bd->ramdisk->mfn);
>          }
>          else
>          {
> @@ -574,7 +574,7 @@ int __init dom0_construct_pv(
>                  if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
>                      BUG();
>          }
> -        initrd->size = 0;
> +        bd->ramdisk->size = 0;

From an abstract pov: Is it legitimate to alter values under bd-> ? I
would have assumed bd and everything under it is r/o at this point
(and could/should be const-qualified).

> @@ -272,6 +271,24 @@ static int __init cf_check parse_acpi_param(const char *s)
>  }
>  custom_param("acpi", parse_acpi_param);
>  
> +void __init arch_builder_apply_cmdline(
> +    struct boot_info *info, struct boot_domain *bd)
> +{
> +    if ( skip_ioapic_setup && !strstr(bd->kernel->string.bytes, "noapic") )
> +        strlcat(bd->kernel->string.bytes, " noapic", MAX_GUEST_CMDLINE);
> +    if ( (strlen(acpi_param) == 0) && acpi_disabled )
> +    {
> +        printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> +        strlcpy(acpi_param, "off", sizeof(acpi_param));
> +    }
> +    if ( (strlen(acpi_param) != 0) &&
> +         !strstr(bd->kernel->string.bytes, "acpi=") )
> +    {
> +        strlcat(bd->kernel->string.bytes, " acpi=", MAX_GUEST_CMDLINE);
> +        strlcat(bd->kernel->string.bytes, acpi_param, MAX_GUEST_CMDLINE);
> +    }
> +}

This duplicates existing code rather than replacing it. How do
you envision the two to remain in sync? Such things should live in
exactly one place imo.

> @@ -816,7 +831,7 @@ static struct domain *__init create_dom0(const struct boot_info *bi)
>          write_cr4(read_cr4() & ~X86_CR4_SMAP);
>      }
>  
> -    if ( construct_dom0(d, image, initrd, cmdline) != 0 )
> +    if ( construct_domain(bd) != 0 )
>          panic("Could not construct domain 0\n");

You leave the log message text in place here, but ...

> @@ -1905,22 +1912,29 @@ void __init noreturn __start_xen(unsigned long bi_p)
>             cpu_has_nx ? XENLOG_INFO : XENLOG_WARNING "Warning: ",
>             cpu_has_nx ? "" : "not ");
>  
> -    initrdidx = bootmodule_next_idx_by_kind(boot_info, BOOTMOD_UNKNOWN, 0);
> -    if ( initrdidx < boot_info->nr_mods )
> -        boot_info->mods[initrdidx].kind = BOOTMOD_RAMDISK;
> -
> -    if ( bootmodule_count_by_kind(boot_info, BOOTMOD_UNKNOWN) > 1 )
> -        printk(XENLOG_WARNING
> -               "Multiple initrd candidates, picking module #%u\n",
> -               initrdidx);
> -
>      /*
> -     * We're going to setup domain0 using the module(s) that we stashed safely
> -     * above our heap. The second module, if present, is an initrd ramdisk.
> +     * Boot description not provided, check to see if there are any remaining
> +     * boot modules, the first one found will be provided as the ramdisk.
>       */
> -    dom0 = create_dom0(boot_info);
> +    if ( ! boot_info->builder->fdt_enabled )
> +    {
> +        initrdidx = bootmodule_next_idx_by_kind(boot_info, BOOTMOD_UNKNOWN, 0);
> +        if ( initrdidx < boot_info->nr_mods )
> +        {
> +            boot_info->builder->domains[0].ramdisk = &boot_info->mods[initrdidx];
> +            boot_info->mods[initrdidx].kind = BOOTMOD_RAMDISK;
> +        }
> +        if ( bootmodule_count_by_kind(boot_info, BOOTMOD_UNKNOWN) > 1 )
> +            printk(XENLOG_WARNING
> +                   "Multiple initrd candidates, picking module #%u\n",
> +                   initrdidx);
> +    }
> +
> +    builder_create_domains(boot_info);
> +
> +    dom0 = builder_get_hwdom(boot_info);
>      if ( !dom0 )
> -        panic("Could not set up DOM0 guest OS\n");
> +        panic("No hardware domain was built\n");

... you change it here, neglecting that in the late-hwdom case what is
being built here is only Dom0, not hwdom. This may also affect the name
of the function that you call.

Jan

