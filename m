Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB458265D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376144.608717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGg6C-00036e-LS; Wed, 27 Jul 2022 12:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376144.608717; Wed, 27 Jul 2022 12:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGg6C-00033s-Hd; Wed, 27 Jul 2022 12:25:12 +0000
Received: by outflank-mailman (input) for mailman id 376144;
 Wed, 27 Jul 2022 12:25:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGg6A-00033m-4b
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:25:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10059.outbound.protection.outlook.com [40.107.1.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26ec0ede-0da7-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 14:25:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4017.eurprd04.prod.outlook.com (2603:10a6:208:5b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 12:25:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 12:25:06 +0000
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
X-Inumbo-ID: 26ec0ede-0da7-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejrFcOLO/H53pOQqR8RUumwpImCplgOAnp7br21jN21WC/pfL8aIIbF8ISAcmhyGyZCsez1BZeQ7sArj2fIHzpYQ4dOrNzCZpTlIf25VBJGbeb3c+JJpMrEnTkBF5UaklXaEE1+LqjBLu3c5Lw+p1YqzN+r1VEPsmvhPFG38jFgZCz9Toi5WsuCXCfPmqyav+4IR8jawOxMZ/acpJD3pPHgSjKIzToWIgnz6Mo8fUhteV1iCauae+/ypPvXc51NvL5kdwP8mY+2IHXxrQNjQHVKZmeSrKFp9BPGfGHUmFiyeoODQ8SRRPK+QUGvhFF8zMw4e9cG1PLFYJjBU4QUISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtzhcsiHCHjulapMScTLDR09bCy43he6C9mapoEDS/s=;
 b=a9+wmjZNrUSyM2cLPsVp04mlFeqMyF0365ey+02lEpJJnmQd4HrKXV6EH/Yc+oU7JSUVkuZyR9+2vSSOLUuMYTKRRDOONl37Hre8F84qLxNJnqlwpRyBksMtEq+7k7GJ7N+f+hJ6yC60VN5JipXca1cgwscBkq8KUT3HMskjjGlPTxCOXZNjInYcOHxMvBqBx2rpCXW6+B1mHTGtFPXDueGOBXg/56a5I2NBUtd3sBOPeB51NEgjXIZH3vzJd888m1gOJe0K6pOF+Z/iv9OqCfTCNpivz/9EjyLG5UqegZBva4/3hE4DdfLH9b6yIf8JQgBxapLGU4wiBo9dsjZVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtzhcsiHCHjulapMScTLDR09bCy43he6C9mapoEDS/s=;
 b=DWv0H75jNsJ1UkcV+mYO2LTzACiYueARZ8y8fTyyFjvcwbd4B+CXdRzx7iFHrVoppW9Y8t27AZAQj+3r09G1Zm66mPg60unvYwfRd7qLJ5MnqSBtK2mncxuYn4d0rFVT+xV0q5jm9KppmyHB6K0gq1VQfRZju+x8t7X8hUVUvilh6ccNP5zZpNwNzPWLUCM1XSE4a420zgigJWWPKBd+yA7jttaGaHGmTwdgHVkHXVeZbcCaUIDKOkUVdhRsTcS4U42ZXXGZVIUq4cBhrfQiaznyf8xsOuR+DcIqnQLJ2SUy+HH8k/brg+LjlIEo7ZG+YYoEDXgJsDglda8+W7zOJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95a90911-df4b-2946-9f01-86d78acb94d5@suse.com>
Date: Wed, 27 Jul 2022 14:25:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 12/18] x86: convert dom0 creation to domain builder
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-13-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4cdf666-ba06-4fff-456e-08da6fcb09ec
X-MS-TrafficTypeDiagnostic: AM0PR04MB4017:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	He8nMoS04p8/AT9liNGwCVoRR+GgwGLqX372eYJK084EU7oja0nGfSrYPrTNyjH9+zxMvtGyOnxsPefZYhP0V9d5kZl1zYFQ07tS0XmdVd7Rffa80rbO4UQtA9u8A39LGx+rASKuo2Hzf3oo5QZdjp5IV1pUq2ut5olQwrLh9qVM/+y1naTmoSKAC00e2UXUtOEyiNcbOHLtzp9JIiTVPZvRIH51YzUuZ+y7bESzVDix+5nQtZV23ddSo7uNlFzUKxzFP9phXGc0CdpgwgtD0BxcDhB2PWxZfQJf7FRJxY0+dXOO3vIHhg17lNTO6h/9F/K8TLUqAXBr62QAg0wYr3mfnqKyvZSPGGPWkpWjX972fNgqIwoUaZ6mtcQ03vNjHbU+SHYujF1LBdZmn4PLxslMGIkcuh1MRSyE+gVLxBqsjDfXItkf6t0rnYho+l4eIfCDRyGmjhIV7P+EyyLIOXEjozBGXArpuDxKhQU14n4EvxInJU9AUotPFhM/QyZvo4UQIb/i0C0Ts6OAy8DpRIx70a97S1oO0vd0WsVEDcOhc09VE+cRNm9mmridFE4Zso7bmxPGflVHOkVJu8y5JTsQSj12zW4iP00NlL1ZV+SzglhxbU0g+3OzfWLxYXthAeSbNHm3acfzhiw9q35ECT/8OJDRONlq1thJCpe3RZ+ZCoxcAPa8qtHWVsgkEvl0bKINMlECTYRyxaKAM69BUlRbf6W38bvpzplwm4psoTZbUNziO9YJrLVpuOghiqJz/Pfs7FFKsTxOpalmG3NZ0jLDOc/O/5U+PO2aF72T/js5UpcuebyEsq54i6QvdRKLsD6hPR1/I2pQNewp0OE/sA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(396003)(376002)(136003)(53546011)(83380400001)(5660300002)(2906002)(478600001)(8936002)(6486002)(41300700001)(54906003)(6916009)(2616005)(26005)(38100700002)(86362001)(186003)(31686004)(6512007)(36756003)(66476007)(8676002)(6506007)(4326008)(66556008)(316002)(66946007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVJGbmhUSVhBZnpjbVRDWDM4L3NqdFJldWY2cnVRZEszVEt6MUYwOVIzOUxY?=
 =?utf-8?B?YmhqdFlKbFV3cnFCOGlHa0Y2T1I4RlRqTjkrQVZ3WVhFTEZmOVYrR1BOM0JM?=
 =?utf-8?B?b09hbjUvSG56b0xYbTlXa3c3dDk5QzlZY0haWURTeVJzODRTTkVzYWdBTUpl?=
 =?utf-8?B?ZElFSVJYRXA2cUtTZ0N5Rm5uY3hZSkRMc3RtTTNPZnpVMEd4ZWZqMnphdHhs?=
 =?utf-8?B?RlpnQ2hvUXFlTVlOQkZnclExOTRmVTMvRXlzQ1ZHbFJZZ2ZDWjR5bGhhbUVl?=
 =?utf-8?B?a0w4dVpPRHlRT1E5OFVGdUNQcW9jS3M1Z2pYZXdmVGhxY2UyWmtoNjJSNmJp?=
 =?utf-8?B?cmIzRXNGTkt1eTB0QXhDcjVtUzlWc1k3QkdhTGRMc1N2TGdWU1lFbWlHYkJk?=
 =?utf-8?B?Ung4NXRzNjN5dFI5Y1VuSnRrZnh5d1JMWGtQbWFxeWg2OVBNWitUdUlCUDFC?=
 =?utf-8?B?TEY0Z2l1VmZGRWxhbDJFczJiemVmMy9oNHcvZVhGYzNUQy9BNFpicmFWWmJl?=
 =?utf-8?B?WUtPNDNIdENadDFuWG1aT0NZMVZPTVkyU1pkYmc2a3lHRUZVajkyalpQWHA5?=
 =?utf-8?B?L1M2UHQ0TEZ1SWRRQWV5OEkzNGFqL1pTV0tvMGJjZFh0c2g4YTkrRmtkVWVm?=
 =?utf-8?B?UkZrYkdIN3FVZ2orMTB2RmwrUFlQUGJtNnpoQjRqeTBqQ1VOYzJjazlHVnJL?=
 =?utf-8?B?YUo4LzE3bk4xLzd6NUpPYnFKRGxVMWRLOTVZYkJFVWNtalNmdmRtNlNZSDg0?=
 =?utf-8?B?UWJidU80R0thSVhzSnQyTWNFV0FQTlRIYzFqazYwSmx3S0ZSc0labG1QS2du?=
 =?utf-8?B?Wklua3VoZnN6bFA4aFNrVmc4OVhiMm1QNWhPQ2N0TmdtYk5qT3N0djliVjky?=
 =?utf-8?B?L1FFR1hEYnJVcWxadC9jdDZ6Z3Z1Z2kxTUJrVFYrTVR1QWFDMVRXaVVnSTly?=
 =?utf-8?B?Z0JJMmpWMkczSFNkVStiOEJlRVliSmdHdXZHQXROb0czVmlmM2Ryczh4byt4?=
 =?utf-8?B?WEQrZ0ZqRHh6cGw1VndqeWhxTEhqRFEwZkIwa2pUYVY4a2tud0xTUjQ3Q3hY?=
 =?utf-8?B?UkhwMlJmOGwwQi8rcitKRWVxTkd1bkRBVitsY25pTjRrdWRBZ1FIZXk0T0JX?=
 =?utf-8?B?d2dQQWl5c3JoajVqNXV6U0NydVJ1S1NrUjBERGd0d3JRckFhTUZDdVE1a2Nt?=
 =?utf-8?B?UVcyaWJBd2xydEgzKzQydm80Y3Z2eVZHL3VJNGRBbTgrckRFRGd0SHUwYVFT?=
 =?utf-8?B?OGV1QmJuQWdvR0dGeEtMNmlzQXJXSEVRV1haSTA0UlhpSWMwV3VSRmdqRXU2?=
 =?utf-8?B?ZTVUVXMyMjJDa3Bqc0tTai9NZ1YvaUZlY1o1dTQyWXZmQVczSjFNd01jT0NB?=
 =?utf-8?B?dDhTMHh3M21HaE5zYWttSWkvSFA3eDNzWEE5U1lYRlBscGwvazBIK3NuNlVT?=
 =?utf-8?B?UnQ2b2JuWG9vTC9LQU9ydzNJb1hWa0ZnbzBkdU9wYnU0azg3a0Evb3VOblBs?=
 =?utf-8?B?R2x4OXIxOU1FeElmQkkyOTlOZkYvS0d2aHluNzZHMmVva3dMbmVJemZiUE5D?=
 =?utf-8?B?YzNZRjg1ZmVEaVBPeHc3cVlXa3pyb3hCN0MzTldCZVJaeC8rTlR1c1lLakNB?=
 =?utf-8?B?ck01eU8yTnZ0WVZlWVhuTXJDNmZiRnc0WVRzZmpueWJFWkZkSHJtUkN4SXZF?=
 =?utf-8?B?dHliRzFsUGJIV2d3ZDBqbXlVVVZHdzd5NkFwSUlnRTgzZEJ2ZHR4OUdSVSt1?=
 =?utf-8?B?Q3VBM2VCa1g0bWF3b2I1VFBKSlZzTHNsSUFOQ1FOcWl5RVAwRHZZMDdqM01R?=
 =?utf-8?B?ZVVmdUh5ZitxdVBqdGQrblB5RTBXQTQ4clBBcmViR1hCa3RJdTZXV2ZobUJh?=
 =?utf-8?B?aS9HVVJPS2JacnYzZVBUbjFqRit5VEpiZzhzdFlZQmowb203Zy9vZStrMzJ1?=
 =?utf-8?B?dDlFTS91QXFidjVobjY0aGplTmdhMTBaQ1V2UnU3bTdidzdGcEdvMXh3eDFO?=
 =?utf-8?B?RlRoV3Q5ZVlCdkp5QkpBMVVTSys3clBuaUZ5RFhEK1EzazdxcCtzTHRPUzEr?=
 =?utf-8?B?V09ndyszUDVpdEMrbCtiOTRYRGhwNmNpLzlRa0tiQk9PbFlQUERUV1FJSzBZ?=
 =?utf-8?Q?WcdvR89FHsHZaV+laOBoUYi2G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cdf666-ba06-4fff-456e-08da6fcb09ec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 12:25:06.3119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJCYvTquItBhUd4b8RkhJCfRjlAngkm/nBj7HcKL9s9WoNzn/hz3O1Yi+YjQUimn64GFPqMrrwElqusTBMFA3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4017

On 06.07.2022 23:04, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/arch/x86/domain_builder.c
> @@ -0,0 +1,128 @@
> +#include <xen/bootdomain.h>
> +#include <xen/bootinfo.h>
> +#include <xen/domain.h>
> +#include <xen/domain_builder.h>
> +#include <xen/err.h>
> +#include <xen/grant_table.h>
> +#include <xen/iommu.h>
> +#include <xen/sched.h>
> +
> +#include <asm/pv/shim.h>
> +#include <asm/setup.h>
> +
> +extern unsigned long cr4_pv32_mask;

Such declarations need to go in a header which both producer and
consumer(s) include.

> +static unsigned int __init dom_max_vcpus(struct boot_domain *bd)
> +{
> +    unsigned int limit;
> +
> +    if ( builder_is_initdom(bd) )
> +        return dom0_max_vcpus();
> +
> +    limit = bd->mode & BUILD_MODE_PARAVIRTUALIZED ?
> +                MAX_VIRT_CPUS : HVM_MAX_VCPUS;

Nit: Indentation.

> +    if ( bd->ncpus > limit )
> +        return limit;
> +    else
> +        return bd->ncpus;

    return min(bd->ncpus, limit);

> +}
> +
> +void __init arch_create_dom(
> +    const struct boot_info *bi, struct boot_domain *bd)
> +{
> +    struct xen_domctl_createdomain dom_cfg = {
> +        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
> +        .max_evtchn_port = -1,
> +        .max_grant_frames = -1,
> +        .max_maptrack_frames = -1,
> +        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> +        .max_vcpus = dom_max_vcpus(bd),
> +        .arch = {
> +            .misc_flags = bd->functions & BUILD_FUNCTION_INITIAL_DOM &&
> +                           opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
> +        },
> +    };
> +    unsigned int is_privileged = 0;

Either this is bool and retains its name, or it remains unsigned int
and changes its name (to e.g. "cdf").

> +    char *cmdline;
> +
> +    if ( bd->kernel == NULL )
> +        panic("Error creating d%uv0\n", bd->domid);

This gives too little information and, by mentioning vCPU 0, is imo
actively misleading.

> +    /* mask out PV and device model bits, if 0 then the domain is PVH */
> +    if ( !(bd->mode &
> +           (BUILD_MODE_PARAVIRTUALIZED|BUILD_MODE_ENABLE_DEVICE_MODEL)) )

Shouldn't you outright reject BUILD_MODE_ENABLE_DEVICE_MODEL, since
you can't fulfill that request?

> +    {
> +        dom_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
> +                         (hvm_hap_supported() ? XEN_DOMCTL_CDF_hap : 0));
> +
> +        /*
> +         * If shadow paging is enabled for the initial domain, mask out
> +         * HAP if it was just enabled.
> +         */
> +        if ( builder_is_initdom(bd) )
> +            if ( opt_dom0_shadow )
> +                dom_cfg.flags |= ~XEN_DOMCTL_CDF_hap;

Please combine such if()s into a single one using &&. And I suppose
you mean &= ? Furthermore - how would a DomU be started without using
HAP when HAP is available?

> +        /* TODO: review which flags should be present */
> +        dom_cfg.arch.emulation_flags |=
> +            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
> +    }
> +
> +    if ( iommu_enabled && builder_is_hwdom(bd) )
> +        dom_cfg.flags |= XEN_DOMCTL_CDF_iommu;

Why would only hwdom get an IOMMU?

> +    if ( !pv_shim && builder_is_ctldom(bd) )
> +        is_privileged = CDF_privileged;
> +
> +    /* Create initial domain.  Not d0 for pvshim. */

Up to here I was assuming this function would deal with more than just
Dom0, based on conditionals seen. What's the intention? Mixing things
is at best confusing.

> +    bd->domid = get_initial_domain_id();

Higher up in the panic() invocation you did use bd->domid already.

> +    bd->domain = domain_create(bd->domid, &dom_cfg, is_privileged);
> +    if ( IS_ERR(bd->domain) )
> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
> +
> +    init_dom0_cpuid_policy(bd->domain);
> +
> +    if ( alloc_dom0_vcpu0(bd->domain) == NULL )
> +        panic("Error creating d%uv0\n", bd->domid);
> +
> +    /* Grab the DOM0 command line. */
> +    cmdline = (bd->kernel->string.kind == BOOTSTR_CMDLINE) ?
> +              bd->kernel->string.bytes : NULL;
> +    if ( cmdline || bi->arch->kextra )
> +    {
> +        char dom_cmdline[MAX_GUEST_CMDLINE];
> +
> +        cmdline = arch_prepare_cmdline(cmdline, bi->arch);
> +        strlcpy(dom_cmdline, cmdline, MAX_GUEST_CMDLINE);
> +
> +        if ( bi->arch->kextra )
> +            /* kextra always includes exactly one leading space. */
> +            strlcat(dom_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);

I don't think the comment belongs here - there's no insertion of a blank
in sight anywhere.

> +        apply_xen_cmdline(dom_cmdline);
> +
> +        strlcpy(bd->kernel->string.bytes, dom_cmdline, MAX_GUEST_CMDLINE);

Further up using MAX_GUEST_CMDLINE is acceptable, because it's easy to see
that this is the array's size. But here this isn't the case - you want to
use ARRAY_SIZE() at least in this one case (ideally everywhere).

> +    }
> +
> +    /*
> +     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().

dom0 here, but ...

> +     * This saves a large number of corner cases interactions with
> +     * copy_from_user().
> +     */
> +    if ( cpu_has_smap )
> +    {
> +        cr4_pv32_mask &= ~X86_CR4_SMAP;
> +        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> +    }
> +
> +    if ( construct_domain(bd) != 0 )

... domain here, yet then ...

> +        panic("Could not construct domain 0\n");

... domain 0 again here.

> @@ -745,109 +746,21 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>      return n;
>  }
>  
> -static struct domain *__init create_dom0(
> -    const struct boot_info *bi, struct boot_domain *bd)
> +void __init apply_xen_cmdline(char *cmdline)
>  {
> -    struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
> -        .max_evtchn_port = -1,
> -        .max_grant_frames = -1,
> -        .max_maptrack_frames = -1,
> -        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
> -        .max_vcpus = dom0_max_vcpus(),
> -        .arch = {
> -            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
> -        },
> -    };
> -    char *cmdline;
> -
> -    if ( bd->kernel == NULL )
> -        panic("Error creating d%uv0\n", bd->domid);
> -
> -    if ( opt_dom0_pvh )
> -    {
> -        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
> -                           ((hvm_hap_supported() && !opt_dom0_shadow) ?
> -                            XEN_DOMCTL_CDF_hap : 0));
> -
> -        dom0_cfg.arch.emulation_flags |=
> -            XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
> -    }
> -
> -    if ( iommu_enabled )
> -        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> -
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> -    bd->domain = domain_create(bd->domid, &dom0_cfg, pv_shim ?
> -                               0 : CDF_privileged);
> -    if ( IS_ERR(bd->domain) )
> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(bd->domain));
> -
> -    init_dom0_cpuid_policy(bd->domain);
> -
> -    if ( alloc_dom0_vcpu0(bd->domain) == NULL )
> -        panic("Error creating d%uv0\n", bd->domid);
> -
> -    /* Grab the DOM0 command line. */
> -    cmdline = (bd->kernel->string.kind == BOOTSTR_CMDLINE) ?
> -              bd->kernel->string.bytes : NULL;
> -    if ( cmdline || bi->arch->kextra )
> -    {
> -        char dom0_cmdline[MAX_GUEST_CMDLINE];
> -
> -        cmdline = arch_prepare_cmdline(cmdline, bi->arch);
> -        strlcpy(dom0_cmdline, cmdline, MAX_GUEST_CMDLINE);
> -
> -        if ( bi->arch->kextra )
> -            /* kextra always includes exactly one leading space. */
> -            strlcat(dom0_cmdline, bi->arch->kextra, MAX_GUEST_CMDLINE);
> -
> -        /* Append any extra parameters. */
> -        if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
> -            strlcat(dom0_cmdline, " noapic", MAX_GUEST_CMDLINE);
> -        if ( (strlen(acpi_param) == 0) && acpi_disabled )
> -        {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> -            strlcpy(acpi_param, "off", sizeof(acpi_param));
> -        }
> -        if ( (strlen(acpi_param) != 0) && !strstr(dom0_cmdline, "acpi=") )
> -        {
> -            strlcat(dom0_cmdline, " acpi=", MAX_GUEST_CMDLINE);
> -            strlcat(dom0_cmdline, acpi_param, MAX_GUEST_CMDLINE);
> -        }
> -
> -        strlcpy(bd->kernel->string.bytes, dom0_cmdline, MAX_GUEST_CMDLINE);
> -    }
> -
> -    /*
> -     * Temporarily clear SMAP in CR4 to allow user-accesses in construct_dom0().
> -     * This saves a large number of corner cases interactions with
> -     * copy_from_user().
> -     */
> -    if ( cpu_has_smap )
> +    if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> +        strlcat(cmdline, " noapic", MAX_GUEST_CMDLINE);
> +    if ( (strlen(acpi_param) == 0) && acpi_disabled )
>      {
> -        cr4_pv32_mask &= ~X86_CR4_SMAP;
> -        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> +        printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
> +        strlcpy(acpi_param, "off", sizeof(acpi_param));
>      }
> -
> -    if ( construct_domain(bd) != 0 )
> -        panic("Could not construct domain 0\n");
> -
> -    if ( cpu_has_smap )
> +    if ( (strlen(acpi_param) != 0) &&
> +         !strstr(cmdline, "acpi=") )
>      {
> -        write_cr4(read_cr4() | X86_CR4_SMAP);
> -        cr4_pv32_mask |= X86_CR4_SMAP;
> +        strlcat(cmdline, " acpi=", MAX_GUEST_CMDLINE);
> +        strlcat(cmdline, acpi_param, MAX_GUEST_CMDLINE);
>      }
> -
> -    return bd->domain;
> -}
> -
> -void __init arch_create_dom(
> -    const struct boot_info *bi, struct boot_domain *bd)
> -{
> -    if ( builder_is_initdom(bd) )
> -        create_dom0(bi, bd);
>  }

Earlier on a function was introduced to deal with this cmdline handling.
And now you introduce a 2nd such function?

Jan

