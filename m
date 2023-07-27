Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE67651D8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571026.893853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyk7-0003wb-8M; Thu, 27 Jul 2023 11:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571026.893853; Thu, 27 Jul 2023 11:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyk7-0003tH-59; Thu, 27 Jul 2023 11:01:15 +0000
Received: by outflank-mailman (input) for mailman id 571026;
 Thu, 27 Jul 2023 11:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOyk5-0003tB-5z
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:01:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e40a3f24-2c6c-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 13:01:10 +0200 (CEST)
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
X-Inumbo-ID: e40a3f24-2c6c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690455670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t2Panjkrfb0v/TjF0vQ8rWppUIjJHB4J6qX3CKwUfEk=;
  b=CMGFOAPBbrb9W9/yA5Q7mOScmfWf+oy9iIZ7gwVjx2N6Wc+LmrbZjROA
   HY8O+iN77ofqcPXI8mXMJ76SKyI5to/gVJUQnzd18eycxymkchzYjoCIc
   A5j3b75V8ur2nX5a+3v7u26Ijd9YxwBW48880k4GchPA7LqTJwUa7clx8
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116323400
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/rhnLa8T0TBziq5ZDb8uDrUDqX6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mYYC2vXM/7Zajege41/YYiz9hsDuMDTxtRiHApq+C08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqoU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkSr
 KwgOQ0cVSuuvMuc3O3lQeVK1oc8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxxjD/
 DmapzyR7hcyEteGwgW543KX3ayUrDjlY6MqCaSD36s/6LGU7jNKU0BHPbehmtG7g0iyQcNCK
 GQb/yMvqe4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpd9gOpMIwAzsw2
 TehndnkGDhuu729Um+G+/GfqjbaESENIHULfyMsUQoP6N6lq4Y25i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAji/zrxUH6kgmXi6PgZBJquA7beDLm8VYsDGK6XLBE+WQ3/N4ZctfBFQja7
 CBY8ySNxLtQVM/QzURhVM1IRej0vKjdbVUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6Oxwl8AM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FIJ73XChAVvU8lGXeqwIhPVkDnH5WKYT7HM6T8vha+eDGOC79pUktbjNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dd7ELz+FlBiXcqeg5UOJoa+zv9ORDlJ5wn5nelwJOSIXs19yo/1w
 51KchYHkwGi1CKfcl7ih7IKQOqHYKuTZEkTZUQEVWtEEVB+CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:yTOIVKj/wTYD0InFEUPxHn5YCHBQXvoji2hC6mlwRA09TyX4rb
 HNoB1/73XJYVkqNU3I9ertBED4ewK5yXcX2/hzAV7BZmjbUQKTRelfBO3ZrAEIcBefygcy78
 ldmp9FebjN5AhB5voSODPIaOrIGuP3iZxAWN2uqEuFkTsaE52IMT0JcDpyfSVNNW97OaY=
X-Talos-CUID: 9a23:0WNNeW1VzSuedEXIHgWTK7xfRpl1Smzg3UzrDnSRI3o2FraZbw/T5/Yx
X-Talos-MUID: 9a23:kiZ+HwRa59OB/EtMRXTKjyhpC/t545/1Sxs8ios9mvGZLBdZbmI=
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="116323400"
Date: Thu, 27 Jul 2023 12:00:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v7 08/15] xenpm: Change get-cpufreq-para output for hwp
Message-ID: <30360e09-5ae9-4232-a8fe-5b9f9deccf97@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-9-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726170945.34961-9-jandryuk@gmail.com>

On Wed, Jul 26, 2023 at 01:09:38PM -0400, Jason Andryuk wrote:
> diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> index 1c474c3b59..21c93386de 100644
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
>  /* print out parameters about cpu frequency */
>  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>  {
> +    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
>      int i;
>  
>      printf("cpu id               : %d\n", cpuid);
> @@ -720,49 +721,57 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>      printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>  
> +    if ( !hwp )

This test kind of feels wrong. Should we test instead the thing we want
to print? Maybe declaring another bool, something like "bool
scaling_governor = !hwp" just below the declaration of "bool hwp"?
Otherwise, if there's another technology that comes along that isn't
"hwp" and not something that can be printed with this, there's going to
be some kind of hidden bug (even if probably easy to spot during
development).

>      {
> +        printf("scaling_avail_gov    : %s\n",
> +               p_cpufreq->scaling_available_governors);


Thanks,

-- 
Anthony PERARD

