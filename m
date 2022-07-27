Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A5C58284C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 16:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376221.608849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGhly-00056V-OM; Wed, 27 Jul 2022 14:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376221.608849; Wed, 27 Jul 2022 14:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGhly-00054J-K5; Wed, 27 Jul 2022 14:12:26 +0000
Received: by outflank-mailman (input) for mailman id 376221;
 Wed, 27 Jul 2022 14:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGhlx-00054D-DK
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 14:12:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 225fd994-0db6-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 16:12:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4549.eurprd04.prod.outlook.com (2603:10a6:20b:24::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24; Wed, 27 Jul
 2022 14:12:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 14:12:19 +0000
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
X-Inumbo-ID: 225fd994-0db6-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6V/fX36IfJplI2VsqcXuRzxtHsdq+7IWRv9KB6egR2ZZk51kN0/dqvX+IgQEn6PIt9Vbf8Jcvmn6D43Idx4EHebczeV1qbjlkkD/F9ywWBtZqXxARNYGw3dqh3KwMTRc7LQRXp9DgvMAUQ2XLPyJpIdbfSBRic3Og1vIKcUHhS0lmKDoG/MbEvKy5qZeXG4/Hygslf22tGK6/r73esv9W+c0jnnDhfu1KwexhMfGCzH6q6idCMrQktAlEHqZ+rQWHWj+0GsDRhpkzeUEl6YSFI+1q/f/8BEap44oGnIhd/MYWFxjVK3ixnzFrC4/URrpT2sj0izmTJtTPFlfunvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLap+y/wGPsGo3VqfNP/zcxddxSLtPmyoTigp2bz2ug=;
 b=GMZbs8RVoTkRKgC9xbZImcdzSeu90/xigJ2ME8QJrAEon9cL23SfVwUbMTLOZHlekbwDPmAIf5MX10ApmAPv3KxpKlc6Ur/oKKWGOYOnoto9rjwU3SIi4aejOIXHSnke2T7XKXVFZzlv+MBAwRAP6hMII1ZniBDIIVyY6id79SvzukpPCNOdFcej5OOf8imZ+xmZOgwRABkNrajnbZjB13rnBzfJK/CNZ9Z/euYm/x1Gsdx/kHu8AvV9lD+QCfaNwkKdDjt9zfPvOdO4qsJe/xwRE8F/8oVtpgxbvPRlCqC5a8+Hdo5bmNnFusB0rU+QFWwm81sN2EkQfqPhvq8X0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLap+y/wGPsGo3VqfNP/zcxddxSLtPmyoTigp2bz2ug=;
 b=NidpBPyaRZS4w05ZOMcXLqo1MHEbytDVLeBhGqppPdzbBDbUfl50W5FFo8+jm+bGRaI8eEnpl5Gk6QColjZcr2yMTuC3Flzg3RwK/uzGbK5UUINZhiOhPzzGKf4jf5vGULOD6S3Fo3th+nxo3AP13EVbx9LgQj4+CHqbkea3YCVIeyzkvkpknGY41IMvooPan6zqTMuBtxleOYDE7C71EoWT4fkd/pjDHXy0PnLYa9OXk1CxThgRLSGriVpgMV7N8h2MKl8PvDP1egCRLH48fqFOu5mAImnh2+wnY9/7SzX7yNtWC6C12h1yezGOlEYL2wa3fiJFQcJJojvO2xVgzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d35ac8a-51b7-5b78-4d5b-9ee4c06e71d8@suse.com>
Date: Wed, 27 Jul 2022 16:12:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 16/18] x86: add pv multidomain construction
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-17-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-17-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3906429-9aef-474b-ea66-08da6fda0487
X-MS-TrafficTypeDiagnostic: AM6PR04MB4549:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZlTtVcrFxKZ3/vlE/7e5sJsIP03LXlTKcqKn9gzocSJmxQoMk3DDcErQWsYwkNcjqC7qJt0JERQER2jREUQAxa50/y7YGK1W3nm6SZLjBwSXYeUhe3GBt+GgLBzKs+8Vu6Z6TsRiSaJrisroqzi4bRFQR42ZBVjVUXYTPx2s543sysW3dGQDFLD10uFK4mBpVmVaOHuFEtQt0OZYf15R95QXse3u+p6hzxJuCTQgZfIDtteAS+yPnM4jaWx1inlyaMnV9+3F39JWxnnenM4IVT6Ffb9cHu+Zu+ST20G6TdlHz7qLiy/iwcRl3hP3udIVW+vZY6lOal6F+qQv8hdnp7nQlKpFD1HHuBGndFPRBUz90JJ8jbkbM3rVO0pDKzDMqNxtIeyAaDSJbNr5llj2jJCUgl11WG12i5Fwb+CZfaH3G2T6ewjm8wYFPqyHveXOLnwW4/R2yOC1le+LOt9+At+dWAQKjcM6SiwiY0IRSWfYGnpJjDFzBq3KJIbH32zpnDyrl2A9xvhAovEQ7mfTeJ3/FZPl9HEo59Zg6/Tfp3TzCtyF44jrbzQ5SrREA7OBVxSjaHSoUyC2nCcyLeFwzaQpeZIPk5TNrGs5RizMFC5zDMC5UDWeQmKeqTwiQxLdFS0B/8GRio7pLHT8Mbp5LUz5lzQ889eBHl6yoluXC0wQHRiTluSvQwxE9sYP2/kmpfUTGraHjERIAqKFb6jLZ9r0cdE1Maav5zgrL1fQkcDXzisWw2GNryYSohCABjSOof4yAp4GS1l1WBmVORpx9y+Dw7gIQS+5SzQGE6j5W6hg/R6NmTyeChsFsY8bGR7lb+GYV/jyQXoMhiwR3ZPffg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(396003)(39860400002)(6916009)(66946007)(6506007)(30864003)(6512007)(86362001)(6486002)(8936002)(31696002)(83380400001)(478600001)(5660300002)(41300700001)(8676002)(7416002)(53546011)(31686004)(66476007)(26005)(4326008)(38100700002)(186003)(316002)(2906002)(2616005)(54906003)(66556008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUMyNE55eHNQR0lrTVpLZ291VzJtUWJMd0ZsSklBa0FQSDl1aHExOGhITXZB?=
 =?utf-8?B?aS9vTEFJUXIyYUphVWQxdkhIOGdVYmF0ZkdSaS9WeFQyVnlwSGFiR2VDTnFT?=
 =?utf-8?B?eXUvQUdYWUVxM0t2b2NaZzc1RmN2Vzg4ODBsQkxQNDZ6aDJOZzEvRTZzQmpE?=
 =?utf-8?B?OXJpNDcvdGdvZ255R2xIK0dVc2dOaWtZS2J2R29mTnJuN1lZdFZuWUFOQ1dq?=
 =?utf-8?B?NHJ2TWdkWmJiUDdtL0tJd3JvQTJUZW9YdE8wTlBhNnIrSU96eFl0amFoK2Fi?=
 =?utf-8?B?c3VuSklBVFN2eUlxeUIvcDRlZTM0bHlDbzh3cE1EY204RGFwYVkxTTVoQ3RK?=
 =?utf-8?B?Q0ZXOVlKSmpkdG9xOUtac1Mwdm41K1hXZXpjN1dZMFpuWVNjdDRDSm1aQ1hD?=
 =?utf-8?B?bkFjUm5lQThobEdLSW1xV0lMRHA4bnhObkF4bnFYWktRMmhmcDVVcEtaSU5S?=
 =?utf-8?B?V0dieitDRnJNNmU2U0VhNElXY1JQVUJzRUJxcG1ubEF4bTNEMzhKeWJtb3NW?=
 =?utf-8?B?ZjhwNzBPc1JsZG13T1pyQkFxbzd1VjVaZnIrZllOVFh0N0kzWGpObHFtS3cv?=
 =?utf-8?B?QlBkU1QyNXREeXViRzE2YWdGS1JjQU1UOWZ5cEFORVZCWjN0K2ZwUnNxTmk1?=
 =?utf-8?B?UzQ4TzJJRGFtV0MvSmI2YlRyaGZ3ZkVTeW95amRRQUl6MEk4dDRxblZDY3hw?=
 =?utf-8?B?S3FYNmViYzQ4NEdkWmhuZ09JdCtyRHVmNWxVbDI1ZkRUeFRIR1ppcTlzQ2NM?=
 =?utf-8?B?RmhSdU11Z1pWMUNmSkcxSHNLaEFaUC8xcndLWmlRRFBxbUNSUmRITElHaTVD?=
 =?utf-8?B?UncwSmE2YkhpTy9UMHl5bnVYSjhJWTZSbnZvUkNOcDFQVm1rSVowUnRnODFu?=
 =?utf-8?B?MTJaeUVqVDhuT0FhYXNkdVczU1AxN3lCMEV1RkVYUjZtYjdMNGZCYS8xTDRP?=
 =?utf-8?B?cUNFcURTUnJoVk1DZjd0dGJDRmFKL0MyOTZ5a3UzeWdHR0p5bytFcDJRTm9J?=
 =?utf-8?B?S2Yxd2hDRmxBUXJjOCtkSGs3SjJXeVE0SWlhb2hHVFJnM3BNVFE2T05nd0Nk?=
 =?utf-8?B?VlBPUFg3QTdRUU9lWUY1ZEpJaHNiaCtXbnM5Vks5Y1lrVkVxZThkMXVqOGhJ?=
 =?utf-8?B?TW5LMWxmY3lpUTJUMS85OE1BM09wdGUrYWJGenVxVUIyZ2hYYVBsdE9pYXBX?=
 =?utf-8?B?YldwTjVkbHlUeFJkUThqVWl0cU1WTjdnUGZQOVBFNk5KWFBkQVBJd0R5dURC?=
 =?utf-8?B?Z3hWc2pZMTR3ZTRHVHV6enRQSW1Nc3lKaFV0QmNSVTBqQ0l6dUh0Wm5SekdD?=
 =?utf-8?B?U1NyQnhwQ29HSVozQ1lhbjBLL2ZoRnp3Rkc5QkZzRDlaNXc2Tm9kTkNpYTdL?=
 =?utf-8?B?TGdDbTlQcGxYLzNTN3RjTUNNbGhPOG5LOThrMllUM1VSSUJrSDdpRzcvdzVj?=
 =?utf-8?B?YnpZc0ZMbFc2NzF3QUo5TEJZL3pvbTNMRmJxMmJ6SHhQaERlWU9YdEsrQUZ5?=
 =?utf-8?B?TG1kRys3R1ZlelZLdHFnaEdDYnlVZjZFNng3Nk02dG9mcDd0eGhVUVI1bm9V?=
 =?utf-8?B?L2JaZFlDZ3lUbERzTzFsNHlZMEprRWdmUDdsTmcxc0VaTGtueTg2cWJTUTI5?=
 =?utf-8?B?dCtVc0ZsY0MyR3QwM0dXNjBPaWh6MjVCNEdMVnN4UWRpVHQyaFIyc3FPV2I1?=
 =?utf-8?B?Vmt3c2laTnVpTEFwM01lMGFzVHY0L0pkdDAxMERpSkZoMkVRREpBcUNqQzZl?=
 =?utf-8?B?aGtpL2FQZ3dSWUt5SlZjY0k1aTRmR0JlNXozWGRWajFNMDA1TXZXTWhsUjFK?=
 =?utf-8?B?WStIWFJ2c0F1WDhuVDJLVFBmZ1F3ajlBZ3FjUHpQVnZCMWVlbWtaUFhVMHg1?=
 =?utf-8?B?T05VY3lzZG9MUFdYdk9zQXVFR0tJazQwMHJhKzQwN2xLelRWVUlQUmk5WEVB?=
 =?utf-8?B?ZU1MZUc4M1Jhd01qV1VVMmM3Y2V1dHorbk5yL1VHTWlPL25CdlNqcm5RN2xE?=
 =?utf-8?B?TmxKL3Y0U1dQc0F4dnBDT2lqN1pLTGppQmk1eWJ1TnB5MmpRbVgxRkQrb21Y?=
 =?utf-8?B?N1hNTkh5V2lSR3BpeGtCMFE3ZHpXeUNOMkZPOVlJUUU3dEN3YzZWaWVOUVIz?=
 =?utf-8?Q?W4k3a9eAp6ppBN+4Pn+5lhL0Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3906429-9aef-474b-ea66-08da6fda0487
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:12:19.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvUQa8Av/Gj2qhMUKgVwhLOA3XUjaJRQRUteBpXDb1qL6f8uqrAzLk33lJPCtK/Gr2wSev+jQin/ywI1ps0tyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4549

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -524,37 +524,6 @@ int __init dom0_setup_permissions(struct domain *d)
>  
>      return rc;
>  }
> -
> -int __init construct_domain(struct boot_domain *bd)
> -{
> -    int rc = 0;
> -
> -    /* Sanity! */
> -    BUG_ON(!pv_shim && bd->domid != 0);
> -    BUG_ON(bd->domain->vcpu[0] == NULL);
> -    BUG_ON(bd->domain->vcpu[0]->is_initialised);
> -
> -    process_pending_softirqs();
> -
> -    if ( builder_is_initdom(bd) )
> -    {
> -        if ( is_hvm_domain(bd->domain) )
> -            rc = dom0_construct_pvh(bd);
> -        else if ( is_pv_domain(bd->domain) )
> -            rc = dom0_construct_pv(bd);
> -        else
> -            panic("Cannot construct Dom0. No guest interface available\n");
> -    }
> -
> -    if ( rc )
> -        return rc;
> -
> -    /* Sanity! */
> -    BUG_ON(!bd->domain->vcpu[0]->is_initialised);
> -
> -    return 0;
> -}

Iirc this function was introduced earlier in the series. Just for it
to now be moved around? Why can't it be introduced in the intended
source file right away?

> @@ -189,18 +190,22 @@ void __init arch_create_dom(
>      if ( !pv_shim && builder_is_ctldom(bd) )
>          is_privileged = CDF_privileged;
>  
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    /* Determine proper domain id. */
> +    if ( builder_is_initdom(bd) )
> +        bd->domid = get_initial_domain_id();
> +    else
> +        bd->domid = bd->domid ? bd->domid : get_next_domid();

We prefer to omit the middle operand in such cases.

Where to you guarantee no two domains would use the same domain ID?
I can't help thinking that a predetermined one may have been
assigned earlier on to a domain which got it from get_next_domid().

>      bd->domain = domain_create(bd->domid, &dom_cfg, is_privileged);
>      if ( IS_ERR(bd->domain) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
>  
> -    init_dom0_cpuid_policy(bd->domain);
> +    if ( builder_is_initdom(bd) )
> +        init_dom0_cpuid_policy(bd->domain);

What about other than Dom0?

> @@ -210,15 +215,23 @@ void __init arch_create_dom(
>          cmdline = arch_prepare_cmdline(cmdline, bi->arch);
>          strlcpy(dom_cmdline, cmdline, MAX_GUEST_CMDLINE);
>  
> -        if ( bi->arch->kextra )
> -            /* kextra always includes exactly one leading space. */
> -            strlcat(dom_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
> +        if ( builder_is_initdom(bd) )
> +        {
> +            if ( bi->arch->kextra )
> +                /* kextra always includes exactly one leading space. */
> +                strlcat(dom_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
>  
> -        apply_xen_cmdline(dom_cmdline);
> +            apply_xen_cmdline(dom_cmdline);
> +        }

Why is kextra applicable to Dom0 only? Shouldn't each domain have a
way to append to its command line?

>          strlcpy(bd->kernel->string.bytes, dom_cmdline, MAX_GUEST_CMDLINE);
>      }
>  
> +    if ( alloc_system_evtchn(bi, bd) != 0 )
> +        printk(XENLOG_WARNING "%s: "
> +               "unable set up system event channels for Dom%d\n",
> +               __func__, bd->domid);

So if Dom0 is created after e.g. a separate xenstore domain, it'll
also have a xenstore event channel assigned (changing behavior from
what we have today)?

> @@ -240,3 +253,32 @@ void __init arch_create_dom(
>      }
>  }
>  
> +int __init construct_domain(struct boot_domain *bd)
> +{
> +    int rc = 0;
> +
> +    /* Sanity! */
> +    BUG_ON(bd->domid != bd->domain->domain_id);
> +    BUG_ON(bd->domain->vcpu[0] == NULL);
> +    BUG_ON(bd->domain->vcpu[0]->is_initialised);
> +
> +    process_pending_softirqs();
> +
> +    if ( is_hvm_domain(bd->domain) )
> +        if ( builder_is_initdom(bd) )
> +            rc = dom0_construct_pvh(bd);
> +        else
> +            panic("Cannot construct HVM DomU. Not supported.\n");
> +    else if ( is_pv_domain(bd->domain) )

Please properly use braces to enclose the inner if/else pair.

> +            rc = dom_construct_pv(bd);
> +    else
> +        panic("Cannot construct Dom0. No guest interface available\n");

Dom0?

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/domain_builder.c
> @@ -1,5 +1,5 @@
>  /******************************************************************************
> - * pv/dom0_build.c
> + * pv/domain_builder.c
>   *
>   * Copyright (c) 2002-2005, K A Fraser
>   */
> @@ -8,6 +8,7 @@
>  #include <xen/bootinfo.h>
>  #include <xen/console.h>
>  #include <xen/domain.h>
> +#include <xen/domain_builder.h>
>  #include <xen/domain_page.h>
>  #include <xen/init.h>
>  #include <xen/libelf.h>
> @@ -296,7 +297,7 @@ static struct page_info * __init alloc_chunk(struct domain *d,
>      return page;
>  }
>  
> -int __init dom0_construct_pv(struct boot_domain *bd)
> +int __init dom_construct_pv(struct boot_domain *bd)
>  {
>      int i, rc, order, machine;
>      bool compatible, compat;
> @@ -350,7 +351,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>      /* Machine address of next candidate page-table page. */
>      paddr_t mpt_alloc;
>  
> -    printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
> +    printk(XENLOG_INFO "*** Constructing a PV Dom%d ***\n", d->domain_id);

When touching things like here and even more so when ...

> @@ -384,7 +385,8 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>          {
>              if ( unlikely(rc = switch_compat(d)) )
>              {
> -                printk("Dom0 failed to switch to compat: %d\n", rc);
> +                printk("Dom%d failed to switch to compat: %d\n",
> +                        d->domain_id, rc);

... adding new logging of domain IDs, please use %pd whenever possible.

> @@ -404,22 +406,23 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>      if ( elf_msb(&elf) )
>          compatible = false;
>  
> -    printk(" Dom0 kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
> -           elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",
> +    printk(" Dom%d kernel: %s-bit%s, %s, paddr %#" PRIx64 " -> %#" PRIx64 "\n",
> +           d->domain_id, elf_64bit(&elf) ? "64" : elf_32bit(&elf) ? "32" : "??",
>             parms.pae       ? ", PAE" : "",
>             elf_msb(&elf)   ? "msb"   : "lsb",
>             elf.pstart, elf.pend);
>      if ( elf.bsd_symtab_pstart )
> -        printk(" Dom0 symbol map %#" PRIx64 " -> %#" PRIx64 "\n",
> -               elf.bsd_symtab_pstart, elf.bsd_symtab_pend);
> +        printk(" Dom%d symbol map %#" PRIx64 " -> %#" PRIx64 "\n",
> +               d->domain_id, elf.bsd_symtab_pstart, elf.bsd_symtab_pend);
>  
>      if ( !compatible )
>      {
> -        printk("Mismatch between Xen and DOM0 kernel\n");
> +        printk("Mismatch between Xen and DOM%d kernel\n", d->domain_id);
>          return -EINVAL;
>      }
>  
> -    if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
> +    if ( builder_is_initdom(bd) &&
> +         parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
>      {
>          if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
>          {
> @@ -443,7 +446,8 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>  
>              if ( value > __HYPERVISOR_COMPAT_VIRT_START )
>              {
> -                printk("Dom0 expects too high a hypervisor start address\n");
> +                printk("Dom%d expects too high a hypervisor start address\n",
> +                       d->domain_id);
>                  return -ERANGE;
>              }
>              HYPERVISOR_COMPAT_VIRT_START(d) =
> @@ -487,7 +491,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>      vstartinfo_start = round_pgup(vphysmap_end);
>      vstartinfo_end   = vstartinfo_start + sizeof(struct start_info);
>  
> -    if ( pv_shim )
> +    if ( pv_shim || ! builder_is_initdom(bd) )

As elsewhere - stray blank after ! . Also wouldn't it make sense for
builder_is_initdom() to return false in the pv_shim case, thus making
the || here (and again below) unnecessary?

> @@ -789,6 +790,19 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>      snprintf(si->magic, sizeof(si->magic), "xen-3.0-x86_%d%s",
>               elf_64bit(&elf) ? 64 : 32, parms.pae ? "p" : "");
>  
> +    if ( !builder_is_initdom(bd) )
> +    {
> +        si->store_mfn = ((vxenstore_start - v_start) >> PAGE_SHIFT)
> +                        + alloc_spfn;
> +        bd->store.mfn = si->store_mfn;
> +        si->store_evtchn = bd->store.evtchn;
> +
> +        si->console.domU.mfn = ((vconsole_start - v_start) >> PAGE_SHIFT)
> +                               + alloc_spfn;
> +        bd->console.mfn = si->console.domU.mfn;
> +        si->console.domU.evtchn = bd->console.evtchn;
> +    }

While elsewhere you allow separate hwdom and ctrldom, aiui only one
of the two would fail the entry condition to this if(). Which one
would that be? And in how far are there kernels knowing how to deal
with the situation? I'm not even certain this can be properly
expressed in the present start_info structure, as a non-Dom0
control domain would e.g. need to have xenstore coordinates passed,
but might act as the domain handling consoles.

> @@ -871,23 +885,24 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>                  sizeof(si->cmd_line));
>  
>  #ifdef CONFIG_VIDEO
> -    if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )
> -    {
> -        si->console.dom0.info_off  = sizeof(struct start_info);
> -        si->console.dom0.info_size = sizeof(struct dom0_vga_console_info);
> -    }
> +    if ( builder_is_hwdom(bd) )
> +        if ( !pv_shim && fill_console_start_info((void *)(si + 1)) )

As before - please combine such if()s.

> +        {
> +            si->console.dom0.info_off  = sizeof(struct start_info);
> +            si->console.dom0.info_size = sizeof(struct dom0_vga_console_info);
> +        }

I don't view it as a given that hwdom is the domain to have access to
the physical VGA. While it may follow from its name, it may be more
useful to have the control domain direct its output there.

>  #endif
>  
>      /*
>       * TODO: provide an empty stub for fill_console_start_info in the
>       * !CONFIG_VIDEO case so the logic here can be simplified.
>       */
> -    if ( pv_shim )
> +    if ( builder_is_hwdom(bd) && pv_shim )
>          pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
>                            vphysmap_start, si);

???

>  #ifdef CONFIG_COMPAT
> -    if ( compat )
> +    if ( builder_is_hwdom(bd) && compat )
>          xlat_start_info(si, pv_shim ? XLAT_start_info_console_domU
>                                      : XLAT_start_info_console_dom0);

Even more so here: ??? (This is a clear sign that your commit messages
are lacking helpful detail.)

> @@ -926,15 +941,18 @@ int __init dom0_construct_pv(struct boot_domain *bd)
>      if ( test_bit(XENFEAT_supervisor_mode_kernel, parms.f_required) )
>          panic("Dom0 requires supervisor-mode execution\n");
>  
> -    rc = dom0_setup_permissions(d);
> -    BUG_ON(rc != 0);
> +    if ( builder_is_hwdom(bd) )
> +    {
> +        rc = dom0_setup_permissions(d);
> +        BUG_ON(rc != 0);
> +    }

What about other domains?

>      if ( d->domain_id == hardware_domid )
>          iommu_hwdom_init(d);
>  
>  #ifdef CONFIG_SHADOW_PAGING
>      /* Fill the shadow pool if necessary. */
> -    if ( opt_dom0_shadow || opt_pv_l1tf_hwdom )
> +    if ( builder_is_hwdom(bd) && (opt_dom0_shadow || opt_pv_l1tf_hwdom) )

With this I'd like to refer you back to my "An interesting combination
of conditions" comment on patch 15.

> --- a/xen/common/domain-builder/Kconfig
> +++ b/xen/common/domain-builder/Kconfig
> @@ -12,4 +12,14 @@ config BUILDER_FDT
>  
>  	  If unsure, say N.
>  
> +config MULTIDOM_BUILDER
> +	bool "Multidomain building (UNSUPPORTED)" if UNSUPPORTED
> +	depends on BUILDER_FDT

Shouldn't this be "select", with that other option perhaps not even
needing a prompt?

> --- a/xen/common/domain-builder/core.c
> +++ b/xen/common/domain-builder/core.c
> @@ -1,6 +1,7 @@
>  #include <xen/bootdomain.h>
>  #include <xen/bootinfo.h>
>  #include <xen/domain_builder.h>
> +#include <xen/event.h>
>  #include <xen/init.h>
>  #include <xen/types.h>
>  
> @@ -60,37 +61,144 @@ void __init builder_init(struct boot_info *info)
>          d->kernel->string.kind = BOOTSTR_CMDLINE;
>  }
>  
> +static bool __init build_domain(struct boot_info *info, struct boot_domain *bd)
> +{
> +    if ( bd->constructed == true )

Please omit "== true" / replace "== false" or alike.

> +        return true;
> +
> +    if ( bd->kernel == NULL )
> +        return false;
> +
> +    printk(XENLOG_INFO "*** Building Dom%d ***\n", bd->domid);
> +
> +    arch_create_dom(info, bd);
> +    if ( bd->domain )
> +    {
> +        bd->constructed = true;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  uint32_t __init builder_create_domains(struct boot_info *info)
>  {
>      uint32_t build_count = 0, functions_built = 0;
> +    struct boot_domain *bd;
>      int i;
>  
> +    if ( IS_ENABLED(CONFIG_MULTIDOM_BUILDER) )
> +    {
> +        bd = builder_dom_by_function(info, BUILD_FUNCTION_XENSTORE);
> +        if ( build_domain(info, bd) )
> +        {
> +            functions_built |= bd->functions;
> +            build_count++;
> +        }
> +        else
> +            printk(XENLOG_WARNING "Xenstore build failed, system may be unusable\n");
> +
> +        bd = builder_dom_by_function(info, BUILD_FUNCTION_CONSOLE);
> +        if ( build_domain(info, bd) )
> +        {
> +            functions_built |= bd->functions;
> +            build_count++;

If both are the same domain, you'll end up with a count of 2 here even
though only one domain was built. This looks misleading.

> +        }
> +        else
> +            printk(XENLOG_WARNING "Console build failed, system may be unusable\n");

I think this and the similar earlier message want to include the word
"domain". You also want to split the lines at the start of the literal
strings.

> +    }
> +
>      for ( i = 0; i < info->builder->nr_doms; i++ )
>      {
> -        struct boot_domain *d = &info->builder->domains[i];
> +        bd = &info->builder->domains[i];
>  
>          if ( ! IS_ENABLED(CONFIG_MULTIDOM_BUILDER) &&

Interesting - this config option is being introduced only here.

> -             ! builder_is_initdom(d) &&
> +             ! builder_is_initdom(bd) &&
>               functions_built & BUILD_FUNCTION_INITIAL_DOM )
>              continue;
>  
> -        if ( d->kernel == NULL )
> +        if ( !build_domain(info, bd) )
>          {
> -            if ( builder_is_initdom(d) )
> +            if ( builder_is_initdom(bd) )
>                  panic("%s: intial domain missing kernel\n", __func__);
>  
> -            printk(XENLOG_ERR "%s:Dom%d definiton has no kernel\n", __func__,
> -                    d->domid);
> +            printk(XENLOG_WARNING "Dom%d build failed, skipping\n", bd->domid);
>              continue;
>          }
>  
> -        arch_create_dom(info, d);
> -        if ( d->domain )
> +        functions_built |= bd->functions;
> +        build_count++;
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_X86) )
> +        /* Free temporary buffers. */
> +        discard_initial_images();

I guess this won't build on Arm. Plus Arm has a similarly named function
(discard_initial_modules()) which likely wants calling here (or rather:
adding suitable abstraction for the right function to be called).

> +    return build_count;
> +}
> +
> +domid_t __init get_next_domid(void)
> +{
> +    static domid_t __initdata last_domid = 0;
> +    domid_t next;
> +
> +    for ( next = last_domid + 1; next < DOMID_FIRST_RESERVED; next++ )
> +    {
> +        struct domain *d;
> +
> +        if ( (d = rcu_lock_domain_by_id(next)) == NULL )
>          {
> -            functions_built |= d->functions;
> -            build_count++;
> +            last_domid = next;
> +            return next;
>          }
> +
> +        rcu_unlock_domain(d);
>      }
>  
> -    return build_count;
> +    return 0;
> +}

This looks suspiciously similar to code in common/domctl.c. Perhaps
you want to make a function usable by both (introduced in a separate
patch)?

> --- a/xen/include/xen/bootdomain.h
> +++ b/xen/include/xen/bootdomain.h
> @@ -47,6 +47,12 @@ struct boot_domain {
>      struct boot_module *configs[BUILD_MAX_CONF_MODS];
>  
>      struct domain *domain;
> +    struct {
> +        xen_pfn_t mfn;
> +        unsigned int evtchn;
> +    } store, console;
> +    bool constructed;
> +
>  };

Stray blank line? Or maybe you meant it to go in front of "constructed"?

Jan

