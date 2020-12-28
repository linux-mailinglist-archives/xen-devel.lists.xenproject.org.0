Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE62E3761
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 13:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59479.104404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kts36-0000Mc-96; Mon, 28 Dec 2020 12:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59479.104404; Mon, 28 Dec 2020 12:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kts36-0000MC-5u; Mon, 28 Dec 2020 12:54:56 +0000
Received: by outflank-mailman (input) for mailman id 59479;
 Mon, 28 Dec 2020 12:54:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kts34-0000M7-EU
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 12:54:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1fc0b8f-7cdf-4609-bd38-d693050b56d5;
 Mon, 28 Dec 2020 12:54:53 +0000 (UTC)
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
X-Inumbo-ID: e1fc0b8f-7cdf-4609-bd38-d693050b56d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609160093;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=J63KpU2fYlOGFtjAKWJHhplEVi/fpqUD+Fy9dEacyeA=;
  b=d+tPKmZY5MmQldy7wxpHzjOyrH+xeynRlJoiMuEsWBurkgYYbfl+kVUX
   K8jzbh9sTXm+WLn5CsJZdmYHV508Ku2G1JdEhpV9OFq2rl3jm0wHtmuaI
   wFs/bO5i/oMMJA33f7YXLE/E8CITmBsrB5b55x/88I5b4NK58v9XWkIQy
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: F4RSj03QukSpBuFbVzBB4/5j6zndoGedE8b2ZOBzOwWX+nKeMs5BhFC9SxMowXi1C0FU99PIUn
 L4HTPBXJt3gnCD6QUTy1DrZgG+RHQGlZ6zGIGxuEefmBBaNluVe43J2UOuESIu/2m2ORc5bheE
 lpKC6nKHPdV3uGm7EgSCAlUmwg67zIZWvZT1JHu/tz33FJ5pYN/jbVWhSurFQ6VZxfr7NkgyJT
 AVXdKJ5ozL7f42+2+lVY8TYyoNu4gFWSis4jOt4fELcNqix7luhytBOYMVoahtV5Iwe271CzHC
 iSs=
X-SBRS: 5.2
X-MesageID: 34019477
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34019477"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsB+cznp6Rv20kCPQLvF7HZry7onZwGUiGiBYPjbWrTKvtIgq5MqxKoqXkWDvX1KuT75qYwSvNAAPliF+8M2a8RVDJj5i8eCOTp8ln9e3thGs1MRBZ3pk4LxCIEZ9nugoUjUPCCjMhzN+cQIJd8rUP+QCYf3WgdKmei5sQZDj4GzjfqYIUujXOmXfBHBrWDiZEkv1xyfzLNLoOnaWgszwrizEn/KftMGCgVTojjDt2XgG6wiq3atnF+k/ESMOtthgH0/u3wqmE6IwjjgBJLDf2gFKL04uqffJDHV8ASQ4FBrD9nJyK9g0LYiEQCvCHq7AKkzTGdtQ35YSrgJ75n70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDmlxzDJ5JztCfIVcp+wiQjgcvygoqzWp44y+GA9iDw=;
 b=QRl0d/y4MWl/aFXqgZUhINwZqAmdWZtYjmFbleSy/toHLV/pl5/oAkAbivf/zfPBJOOymiNELdAvPTJNDRJdMe7X01kjtAG5rVoClcOxvqvXu+6SPd3rorBPisudaLD8BhU4WLvQfSgkY4n0I3BeCtc8MbpNa1JQCs6jPFUaIOPkgmnxjE7tGCmI7IMcX3VCfQnxfUzXFx60WgMOUDrZy7jQbz0VI4oEBbNWhAfvcSJw0vNhsLyADaC66lHzYvlc0/OBgYAD40lAh/zqx7KsxGJT7q8/mtZe3KY5u0of0cNlRFQuB0/IIscrA/GIVEQW8Dw1owptfz3PHj3CfSoG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDmlxzDJ5JztCfIVcp+wiQjgcvygoqzWp44y+GA9iDw=;
 b=Dyy573K0KWPxQFJPXxZarDbzRsHv2ioVLXS+4qD1491DlnfFaqNcPEZfCgyJak7g6W+zmV78YCMCP2UZtKQwCmEMtEpVi5qMZeW+LQR84DRGTQZR5AByui87tqcd7Vqk7impz4wJxZSPfKGE9Zb5TkTC7EkOWDCrQHKz+cxbpN4=
Date: Mon, 28 Dec 2020 13:54:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/5] x86/build: limit #include-ing by asm-offsets.c
Message-ID: <20201228125442.gnkadcfrrnzczffs@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d7ac370e-2e1f-5b7a-b832-63577689053c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7ac370e-2e1f-5b7a-b832-63577689053c@suse.com>
X-ClientProxiedBy: MR2P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b7ba8b2-e0fa-4611-0fa7-08d8ab2fc219
X-MS-TrafficTypeDiagnostic: DM5PR03MB2633:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB263349D038170644C425A7DD8FD90@DM5PR03MB2633.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3p5kmj5scw4APtfE78nFe/vJWEwvKgasiiqoV9DlPcYLgnxW6j2m/CTzEULut9+03rvQppko2rNaTW6TWC1h4LhqqlHHw4eHpZ0PSABpfG42hU69pEUPGhHxyel8sGVm1uTgzBXLso4kRtgOzF2igUoqHTQkAqPPxytvKV6Ukav7yN4xT3T78M2yIl/mf86GJM1bSlFWUayuIDkoX0dqeRrtFVj0mrkbKjXt8P2sIQZE1ET9bMWX9Cy0A5ZvRU60dp1zYXYRIi92EW/hGj1ETZNVWJZL15Yrp56fbncAdVZvnUgJ+xqGw1fwxK20BQpHuLgfPa00XOEHDzJgpdRCZBA3DWbeX2pve60jEjGtZH0PMDL5JPkq/A0xaKNAlfZG3xNVSYemN/ZFNnP/7ycJ+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(366004)(39850400004)(136003)(1076003)(6916009)(5660300002)(6666004)(8676002)(956004)(33716001)(6496006)(186003)(8936002)(478600001)(86362001)(9686003)(316002)(54906003)(3716004)(66476007)(85182001)(16526019)(26005)(4326008)(6486002)(66946007)(2906002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFpMM1N1bmk4L2RsbkpOZStsUVF0N0loVUNuM2lReHdXdU9TVjhjYjV6d1FP?=
 =?utf-8?B?YnJHMTdHNHdOc3lESGcwclphbWNKNVlsYXZvTzI2azh1UlIxQnlxNVc0VkFY?=
 =?utf-8?B?ZUt6OWxIK1g3bWRWKzltMFlYZzNRT2hZemwybk1Ba3RINDJpZkVJcGNEeXIx?=
 =?utf-8?B?clFTR3R3Y29WS3lOeXFpZHJXWDE1bnYxcDdpN1MvS0tvVEVpSW0wek9ManRn?=
 =?utf-8?B?VTZVRjlwdWl1MjJhb0ErcEdsQjRyQWNkTjJTYlpoUng0eWJPQ0MwT3c1dnJa?=
 =?utf-8?B?Q3h0aytJQklPeTg2WkhkWDd6YlpYdXZEeVdBek5NUXJPNTNhVEJ2R0F3WTlr?=
 =?utf-8?B?alc0amZ1cW1JbHpPZVlSaXdqdHhBQXhnTTZFSW9kZzRpWTY2dk51bkphN3hR?=
 =?utf-8?B?RWV0SDlHbzVSeTROaTVQdXp4dUpsMkJqQ01vdXl3MGFReCs0a2U5MlkveXZN?=
 =?utf-8?B?ZlZMZHU3Ymw1REJwTm1LT2piRHdiVDVRWlZNei9ZWlppWnEyaWlvS2xobTJQ?=
 =?utf-8?B?SXZ0K2dOSHUzOUZVSUlNMzJQK2daRFBJbkVzeENIc21xQ0hCWUxjREQyUTNR?=
 =?utf-8?B?akN2TUJJWWkzT1hMbGE2VGdSZUkwZ1VSZk0yeDgrK2pCWTJnWVB6bForTlZt?=
 =?utf-8?B?YmZtbndhVjNwWlRZZzhYWE5ZSGxZRVNxdzNROWU4aDVQRlY0a1dRNTdobi9L?=
 =?utf-8?B?MjI1V0lDajVCQTBsejBDY2c3aWhjNlpQN3dYaWhvaUd3N0s4bktubDBWbmM1?=
 =?utf-8?B?UGx5cVBwMDhCUnowZ1hwSlp5S29COHNDNDZJTURabE1YTzFRNFNzZndwY2U0?=
 =?utf-8?B?MXc5LzE0UWZkZVJsTXJzTkhqYVVnN1BNK0dRQkxiZUpHZnNvcm9rMHRqQktu?=
 =?utf-8?B?d3FsVmI4a0tNTGp5d294bUg5V29hNnczeG1pWEJqN0tYL3p4N0NkRWxFcWVk?=
 =?utf-8?B?UzlrQ2IzaHpldVVoRm9JMkUrZ0FhVXd0eUFBZnpZU096OTBZaW9Ea1NjN1ZJ?=
 =?utf-8?B?RkVMQzJQbGJOS1ZxVDQ5cGZrcnFTU0poVWN4T0VlTlR1THBjcW9FWEtQMThQ?=
 =?utf-8?B?UW96ZjJyc1BQRVFXbDl2bXhjb2ptMXE2SXY4SFcyQlJGNU9RVGdkbjhxbjNo?=
 =?utf-8?B?eXhOSjZrVnJzSTlIYVVKaWloMWdCamlFZitIdHdJK1lWaFlmTis2UGlwbXBK?=
 =?utf-8?B?cW4rYWlZaXY3MytNZG5hWXNVOGczQjNKb3ZZTzE0anlsOVpvd1BDQ3MxbjFW?=
 =?utf-8?B?Y3AzZ1MzVCtvR0E0ak1pSnRDVS9rZkM2WVpuNTZ3dEs1OGVoekFnekNFcTBP?=
 =?utf-8?Q?YlCYfqOmQkbSCUVBqvu9NrJx8nrApFC/cR?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 12:54:48.0612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7ba8b2-e0fa-4611-0fa7-08d8ab2fc219
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88qs+EDEos8hL4FsQ7iUctTTfiiXL5O0auWNZtkPITL6vLkWVuXGQz4kYmhIDod9UhVyIRP7DuRyr+arJYYqYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2633
X-OriginatorOrg: citrix.com

On Wed, Nov 25, 2020 at 09:49:21AM +0100, Jan Beulich wrote:
> This file has a long dependencies list and asm-offsets.h, generated from
> it, has a long list of dependents. IOW if any of the former changes, all
> of the latter will be rebuilt, even if there's no actual change to the
> generated file. Therefore avoid including headers we don't actually need
> (generally or configuration dependent).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -5,11 +5,13 @@
>   */
>  #define COMPILE_OFFSETS
>  
> +#ifdef CONFIG_PERF_COUNTERS
>  #include <xen/perfc.h>
> +#endif
>  #include <xen/sched.h>
> -#include <xen/bitops.h>
> +#ifdef CONFIG_PV
>  #include <compat/xen.h>
> -#include <asm/fixmap.h>
> +#endif
>  #include <asm/hardirq.h>
>  #include <xen/multiboot.h>
>  #include <xen/multiboot2.h>
> @@ -101,7 +103,6 @@ void __dummy__(void)
>  #ifdef CONFIG_PV
>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>      BLANK();
> -#endif
>  
>      OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
>      OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
> @@ -110,6 +111,7 @@ void __dummy__(void)
>      OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
>      OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
>      BLANK();
> +#endif

Since you are playing with this, the TRAPINFO/TRAPBOUNCE also seem
like ones to gate with CONFIG_PV. And the VCPU_svm/vmx could be gated
on CONFIG_HVM AFAICT?

Thanks, Roger.

