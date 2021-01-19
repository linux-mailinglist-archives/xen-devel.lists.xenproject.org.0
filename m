Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C52FBB93
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70547.126622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1tFp-0008Bt-Qr; Tue, 19 Jan 2021 15:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70547.126622; Tue, 19 Jan 2021 15:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1tFp-0008BU-NJ; Tue, 19 Jan 2021 15:49:13 +0000
Received: by outflank-mailman (input) for mailman id 70547;
 Tue, 19 Jan 2021 15:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1tFn-0008BO-S1
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:49:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67a5e5a4-94d6-40cd-b4e2-eeff753fad62;
 Tue, 19 Jan 2021 15:49:09 +0000 (UTC)
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
X-Inumbo-ID: 67a5e5a4-94d6-40cd-b4e2-eeff753fad62
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611071349;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ui2RgIFAsgpeu0u/s4w08XoQ3oY4wnWaST9DMK2Bk+o=;
  b=frbDMTwQA1xPQW9sb+Vy0Qg6DWnOpS7U8Gx7thLKy2ej11udy1+f23mo
   vgHSeE+sCfr1d/zG2P6txc3PGkDTAhkmLod1oFqcne0cyey9oxKWS/WUH
   2HVD3V6rHr1GhqxRLi71GfVSpXvweUmXiwzp8wVj2aQPAK/PFkKprOAGR
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wsh5yXwvtcMExerPvH6Ro4TgcWS2IJ8ykInBObMYoKeA0ux/4bb955LcvspiKVH4HK1Pv5pQ8m
 eHsAr8m4kwTILa7nUgT6azLyBM5mMXI5LNPswLRsXO6UX4ZJPG0cLrJ0BXLlX0A3n3PlHHvnHf
 7SQuOmd76RwfGkqsnOpEVxD+TEoJpaauBS/P0cM2H4i2IDDNJE32lAYu2jnK/2++sDbWWyhcQo
 mptLWBZRqqxXQBAXze9ncKPZ/XvYVo7M7Blyi5XK6AeI55+CpcFQtjrAhR8+m1bPnsAWVph/Aj
 Zz8=
X-SBRS: 5.2
X-MesageID: 35760109
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35760109"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLmVW8OKI/fb1aGdqWD9KDlRpoxSM4JJHK7jAuSZDButhi65mCdopio4RiFqAtCQXpqEtX6MmuhK+cgWnpFiSAeVnXTykuSomqCV2Jant5ZgtRMt/nV1k/bpIa/kyj8dPAXl7hbGIqdzGhOGLw5qe0VTk81aCYvKAB/mew/8GzjXENtIX9hS5KLlZTx5rIu42VCAJt2h2BduoBO/h/cEmCrrqusYxcr1PnszYeIaYECSah71SBYHMWrOvOKO5bosxfetTKFgXKWSNv6YJrGn94fuHk5aAzSAhdR3L6LP1CBg2KLukwuYb753n0LSivuRQPrqz4EQlqu5fLCgXVPDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdPtzvGWC8qpvHiI0CIgRulB5H1G0rOJ/MVp8eO5SKM=;
 b=ZC5waszaVXN8z7qiNIdrfeQt+Lf7lkm7ifLW2jOCwJCRGtCy+kH73/K3pTzgxtdJn3CW2ajOCDqMiq0tvTP+FMm/aArCnOt2o5EkfGE6qBxXMwMEzDaRo/QMb9TmdPt0NZCuJHhUrMy8Fqi5fV76XbKuSfHVXlqie2SvIsHxf0am0dqQVkfI+NMpXve8F6Gz/hvdRIxOyyypVrc5+T/qEhL35vIUKq/qRpPSNSy06NsojpRehEaXb1dT1UjeREckTiGYwHMhyPDb4DYxjiVRWxHzNUiUBlV5zt97ckk5oq/MZGjPdF9OVmWRHCzaqukT4BaEmlaIEXVW5gCusFCKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdPtzvGWC8qpvHiI0CIgRulB5H1G0rOJ/MVp8eO5SKM=;
 b=I9HU0HAxZ78Sivl///oTDrmRcEELEJKC4TkaPjJRaYUb5vs5MugObppZGRftBY79BrPOw+p47YtBxBilhpbQaJKqMuOrzKPGy+N80+qCKHdTCrm0EjiOnVdnwq1ld6VO0p9lHa22YS+xreaSq8iYAHBZxDCbScK0rMB6kqY5kY4=
Date: Tue, 19 Jan 2021 16:48:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Norbert
 =?utf-8?B?S2FtacWEc2tp?= <norbert.kaminski@3mdeb.com>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, Jan Beulich <JBeulich@suse.com>, Wei Liu
	<wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>, Piotr Krol
	<piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 3/3] x86: Support booting under Secure Startup via SKINIT
Message-ID: <20210119154856.hghgw3ob4evxgl7h@Air-de-Roger>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115231046.31785-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR3P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 903db70f-0663-4669-8102-08d8bc91beaf
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2971C3F565AEE783F6341EC08FA30@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nB2evtR0DGx/6e+ljp07F+h2Ck0+OWC9Axa33KNLEhKjw3TU9aWcwHae04C8Vokeqc0ODmvQm+Va/cq1xC2L1eSWLKTaugm09GCQbvzjl/c1cGnal0W3Ozs25dvzVCrrWf73Odt7sVpR0cAnI4Ep/UT9/TQsoNQfVrqvdXgHa+zwrk5MvehMKpMvR8V1fjalqmKqomUWGUVja+3d9xlp2TL4I63McVyecZB/sG91mOnKW6VRKAbIq1osj2v89LhegDThnbSBPKifz3QFFWImYinv5/N2GuED/4lpjeL0vID271vLHrtW4Ka21TwatlZxL8nHK/LowTdnE3qBd/EXsgV89VX/VSc8ZqAZM0aW/TjgrMFelzRIU4G8eU9OyDx/x6Jtc9dTCHPmPgihFDHJTQ4V8363tTD7oIhRrOtbML6tqfYD3jKC/cjxcjSkI8hW9lLjI+zR8guxUr1ocAbjdNsjw2MlpWUZJV2l+xkZ3nfjXDmXJm3eBhUZZ70e1+oUgQ0jFT93heAD3Rgj9rFRgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(346002)(396003)(39830400003)(376002)(6666004)(33716001)(26005)(9686003)(6862004)(6636002)(1076003)(8676002)(956004)(83380400001)(66574015)(85182001)(6486002)(186003)(54906003)(478600001)(2906002)(4326008)(7416002)(66556008)(5660300002)(16526019)(316002)(66946007)(66476007)(6496006)(86362001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWxvamZEYnRnY25hNWZEZlBBNWk0UFVHdW9UUXp1R0xvaUkzOFUzY01Gdk05?=
 =?utf-8?B?ajV4eDZyNXhZbGdBOHVLNGpZMDRqVCttTmtyYUVESEhENWdoTC9WZmxJQnU4?=
 =?utf-8?B?L0NKWitsWUw3Njl0VGlyS0lZQ1pueUtoMTBuajFaUVIyVkVpL1FvbExTcDdw?=
 =?utf-8?B?L1FrSm1xM05aYlhYdHVHb2M0WEZxRnZuU1l1OVBNTHhBN0pibmZJVGV3d29s?=
 =?utf-8?B?UWkrN3NPNDFXU1QyOTdleDB6T0JBWEtLNFpPL1F1MlFQZHpJSFV1NzlibHBw?=
 =?utf-8?B?dWxTeHdBazFNS1VzOHUrOTFXTjBWeUc0aFRLajZ3SDE1d2RsWkhVZUJMUTdG?=
 =?utf-8?B?cUxPK3diL0xHcE1WdnRCTjl2TkJ1RnJuc3JiK2g0ekpFVGdaRkVKek05bVky?=
 =?utf-8?B?SHhZTEEralNHeXFqaG9LYXg1Zjc3TjgxSE9aSzZOU05EUk50OFZZMzdwSUFv?=
 =?utf-8?B?aCtBUzRqaHJKZWNRcFFvcjc3TnBuZk9nWEhVNkV4L0Y4RkcyYk9Ham9aaGlV?=
 =?utf-8?B?VEd1cS9GN21xaHYxZTlHOFRhR21kcEZOOHB3cVo1dW5kSTlsbE5rWlZmTDVa?=
 =?utf-8?B?VXQ4UHpvMHhrNjlaVVBWYnhVcmpsL0NkdTY2d0lZNHBycFFqdFEzanFCczRN?=
 =?utf-8?B?UDFPTkJQWjZ4cWFORy9JS2JFZXR2bnJ5KzNYdWFXS2YvYUN4N05wU1ZZTThL?=
 =?utf-8?B?ZnB1bkZaU2FxSW96Mms3NFpFK0V2M0JLQVE1Wm12R2poQy80T3dDRXUwYmtV?=
 =?utf-8?B?TGZaemQ0UHdRWlk2d0sxWW1rODJsOVNPS1VYTGluT0wzRWFvd09mNHZPd2hS?=
 =?utf-8?B?ZjlMakFmOHhJS0tzckZmK1pSYmVkTEYwSi9XY3o3Z0ROMEh5T2JsNSthZURu?=
 =?utf-8?B?T3MwWFlrUVJXQks2L0sveVhUR1o1UHZaRDJFS2NmZXhEb1RGTGh3emtmeWx5?=
 =?utf-8?B?NVd3QmtuS1ZEcDlCWkxVbmt4ODExbDFHelcwcDM3SnJqQ09LMW9IVkFCblJh?=
 =?utf-8?B?eUIvN1BkWUtvUCs5KzAweXd5a2YzRUtYcDB6dkJCWlNqSUUvWXBJQzhNL1lQ?=
 =?utf-8?B?WGZzN1Q1SnFLUy80M0EzZmV0S1cyOFhiTFV1VDNyemZTS3BkaEJvNHZKd1pu?=
 =?utf-8?B?ZDIzbVo0aDZ2M1FTdGRhMngwaXZQQ1BKbW5yN2J5eDNvUW85V3V1ME5EUlNt?=
 =?utf-8?B?TFZWTzN0RUcrcFdXT1RzZDR1UHBrT09ES3ZidEZ6SXZJZkJEMkthRzRNZHYv?=
 =?utf-8?B?OFd5K0Q0RWZVSjJrUmR6STZ5QkxJeGI3NWg4dGZjYVJob2liMDIxcDRKKzN2?=
 =?utf-8?Q?s7XsJVjborDvu8J+2pQxMb2Dt3XLnW5wEn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 903db70f-0663-4669-8102-08d8bc91beaf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 15:49:02.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0fMIFruEf7ehpj7HY/Ibdy3GHlNhjRQhMYC09pucIQILQnFTdPsPuq96DMltmiOmKnGBx0bJoo037qxMnKw1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Fri, Jan 15, 2021 at 11:10:46PM +0000, Andrew Cooper wrote:
> From: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> 
> For now, this is simply enough logic to let Xen come up after the bootloader
> has executed an SKINIT instruction to begin a Secure Startup.

Since I know very little about this, I might as well ask. Reading the
PM, SKINIT requires a payload, which is an image to boot. That image
must be <= 64KB and needs a special header.

In case of booting Xen using SKINIT, what would be that payload?
(called SLB in the PM).

> During a Secure Startup, the BSP operates with the GIF clear (blocks all
> external interrupts, even SMI/NMI), and INIT_REDIRECTION active (converts INIT
> IPIs to #SX exceptions, if e.g. the platform needs to scrub secrets before
> resetting).  To afford APs the same Secure Startup protections as the BSP, the
> INIT IPI must be skipped, and SIPI must be the first interrupt seen.
> 
> Full details are available in AMD APM Vol2 15.27 "Secure Startup with SKINIT"
> 
> Introduce skinit_enable_intr() and call it from cpu_init(), next to the
> enable_nmis() which performs a related function for tboot startups.
> 
> Also introduce ap_boot_method to control the sequence of actions for AP boot.
> 
> Signed-off-by: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
> Signed-off-by: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
> CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
> CC: Michal Zygowski <michal.zygowski@3mdeb.com>
> CC: Piotr Krol <piotr.krol@3mdeb.co>
> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Rich Persaud <persaur@gmail.com>
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  xen/arch/x86/cpu/common.c        | 32 ++++++++++++++++++++++++++++++++
>  xen/arch/x86/smpboot.c           | 12 +++++++++++-
>  xen/include/asm-x86/cpufeature.h |  1 +
>  xen/include/asm-x86/msr-index.h  |  1 +
>  xen/include/asm-x86/processor.h  |  6 ++++++
>  5 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index a684519a20..d9a103e721 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -834,6 +834,29 @@ void load_system_tables(void)
>  	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
>  }
>  
> +static void skinit_enable_intr(void)

Since this is AFAICT AMD specific code, shouldn't it better be in
cpu/amd.c instead of cpu/common.c?

> +{
> +	uint64_t val;
> +
> +	/*
> +	 * If the platform is performing a Secure Launch via SKINIT
> +	 * INIT_REDIRECTION flag will be active.
> +	 */
> +	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
> +	     !(val & VM_CR_INIT_REDIRECTION) )

I would add some kind of check here to assert that APs are started in
the correct state, ie:

BUG_ON(ap_boot_method == AP_BOOT_SKINIT);

> +		return;
> +
> +	ap_boot_method = AP_BOOT_SKINIT;

And I would also set ap_boot_method from the BSP context only, there's
no need for the APs to set this.

> +
> +	/*
> +	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
> +	 * enabling GIF, so a pending INIT resets us, rather than causing a
> +	 * panic due to an unknown exception.
> +	 */
> +	wrmsr_safe(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);
> +	asm volatile ( ".byte 0x0f,0x01,0xdc" /* STGI */ ::: "memory" );

We already have one of those in smv/entry.S, so I would rather not
open-code the opcodes here again, but I'm not unsure whether there's a
suitable place for those.

> +}
> +
>  /*
>   * cpu_init() initializes state that is per-CPU. Some data is already
>   * initialized (naturally) in the bootstrap process, such as the GDT
> @@ -865,6 +888,15 @@ void cpu_init(void)
>  	write_debugreg(6, X86_DR6_DEFAULT);
>  	write_debugreg(7, X86_DR7_DEFAULT);
>  
> +	/*
> +	 * If the platform is performing a Secure Launch via SKINIT, GIF is
> +	 * clear to prevent external interrupts interfering with Secure
> +	 * Startup.  Re-enable all interrupts now that we are suitably set up.
> +	 *
> +	 * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
> +	 */
> +	skinit_enable_intr();

As this doesn't seem to be mentioned in the PM, for confirmation, is
it fine to do this before updating microcode?

> +
>  	/* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
>  	enable_nmis();
>  }
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 195e3681b4..0f11fea7be 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -49,6 +49,7 @@
>  #include <mach_apic.h>
>  
>  unsigned long __read_mostly trampoline_phys;
> +enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
>  
>  /* representing HT siblings of each logical CPU */
>  DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
> @@ -424,7 +425,16 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>  {
>      unsigned long send_status = 0, accept_status = 0;
>      int maxlvt, timeout, i;
> -    bool send_INIT = true;
> +
> +    /*
> +     * Normal AP startup uses an INIT-SIPI-SIPI sequence.
> +     *
> +     * When using SKINIT for Secure Startup, the INIT IPI must be skipped, so
> +     * that SIPI is the first interrupt the AP sees.
> +     *
> +     * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
> +     */
> +    bool send_INIT = ap_boot_method != AP_BOOT_SKINIT;

Since send_INIT is used in a single place in the function I would just
use ap_boot_method != AP_BOOT_SKINIT directly instead.

Thanks, Roger.

