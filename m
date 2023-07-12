Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE9750D5E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 18:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562650.879390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcI8-0005Z2-Oo; Wed, 12 Jul 2023 16:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562650.879390; Wed, 12 Jul 2023 16:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcI8-0005WX-M9; Wed, 12 Jul 2023 16:02:12 +0000
Received: by outflank-mailman (input) for mailman id 562650;
 Wed, 12 Jul 2023 16:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Q3=C6=citrix.com=prvs=550b2c143=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qJcI7-0005WR-7K
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 16:02:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73bb228e-20cd-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 18:02:09 +0200 (CEST)
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
X-Inumbo-ID: 73bb228e-20cd-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689177729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AGW6/A4RP5/5jv9ASpkkoytNt740B5PGNMG0C5XLlc8=;
  b=HLBPPFU5o7SOWWci7x4g+uoxldqA37sJZ/NjzfaKVh4oLXrKJ1Ubt4DJ
   7pYn0eJ1tAU3iwVH1oSPuUor8P0I4c2z/n6YfRdWM76pIhnIH3/pqriqp
   vlfBKOA9br+Q2blT/acH+FIpEVmj/DGjrEjdLCnkcAOc/vYQOH9QuV74x
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116011473
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hcnXYK97j8pRaNy0zEdnDrUDlX6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2sWUDuPPPiKMDGmf48iaISw90wDvsTXnIQwHVY9+3o8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqkR5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklf3
 qQDImhXQiqH3eLm3ZbnGrk0hOUseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxxjA/
 zuaoD+R7hcyC/Cc7hWE8luWofbumzr8Wp8cE4ed36s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c8VUO/037keK0KW8ywSWHG8fVRZadccr8sQxQFQC3
 0eEhdrzCRRzsbeeTjSW8bL8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5yO/auhIWvNQv0m
 TDasQxi1+VLj+8EgvDTEU/8v968mnTYZldrtlSOAj30slMRiJ2NPNLxtwWChRpUBMPAFwTa4
 iBZ8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirnUWWzC
 KMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhJVbfpHw2OxLKjwgBdXTAdolma
 f+mnTuEVy5GWcyLMhLrLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/LLbZeVU7Rz1+VJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AOXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:qfK6NqunqunagQy4Fx6Z+sHB7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AAR9CD2meqiA0qugkCB9K0WkWoy7XOWz2lGzaexW?=
 =?us-ascii?q?UM2IzSO2IbQPAqPtmssU7zg=3D=3D?=
X-Talos-MUID: 9a23:h6Xy5wam4k8kleBTiBPvox5jNO5SxL2PDlkKk4gIvPOhHHkl
X-IronPort-AV: E=Sophos;i="6.01,200,1684814400"; 
   d="scan'208";a="116011473"
Date: Wed, 12 Jul 2023 17:02:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 2/6] libxl: change the type of libxl_cpuid_policy_list
Message-ID: <c4df983f-d53a-468b-8ee0-f6f4d048d6c0@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711092230.15408-3-roger.pau@citrix.com>

On Tue, Jul 11, 2023 at 11:22:26AM +0200, Roger Pau Monne wrote:
> -void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
> +void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
>  {
> -    int i, j;
> -    libxl_cpuid_policy_list cpuid_list = *p_cpuid_list;
> +    libxl_cpuid_policy_list policy = *pl;
>  
> -    if (cpuid_list == NULL)
> +    if (policy == NULL)
>          return;
> -    for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
> -        for (j = 0; j < 4; j++)
> -            if (cpuid_list[i].policy[j] != NULL) {
> -                free(cpuid_list[i].policy[j]);
> -                cpuid_list[i].policy[j] = NULL;
> -            }
> +
> +    if (policy->cpuid) {
> +        unsigned int i, j;
> +        struct xc_xend_cpuid *cpuid_list = policy->cpuid;
> +
> +        for (i = 0; cpuid_list[i].input[0] != XEN_CPUID_INPUT_UNUSED; i++) {
> +            for (j = 0; j < 4; j++)
> +                if (cpuid_list[i].policy[j] != NULL) {
> +                    free(cpuid_list[i].policy[j]);
> +                    cpuid_list[i].policy[j] = NULL;
> +                }

This looks like a lot of work. We could just call
free(cpuid_list[i].policy[j]) and that's all, as cpuid_list will be gone
right after the loop.

Also, please add {} for the second "for ()" loop.

> +        }
> +        free(policy->cpuid);
>      }

Beside some the coding style pointing out, the patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

