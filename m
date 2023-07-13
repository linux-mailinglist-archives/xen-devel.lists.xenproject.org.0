Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1A751F1E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 12:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563085.880051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJtjv-0007YN-O2; Thu, 13 Jul 2023 10:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563085.880051; Thu, 13 Jul 2023 10:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJtjv-0007Tb-KW; Thu, 13 Jul 2023 10:40:03 +0000
Received: by outflank-mailman (input) for mailman id 563085;
 Thu, 13 Jul 2023 10:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DQTI=C7=citrix.com=prvs=551dcd425=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qJtjt-0007BY-LA
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 10:40:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c920d8a-2169-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 12:39:59 +0200 (CEST)
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
X-Inumbo-ID: 9c920d8a-2169-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689244799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGhj2c0X1N7Uk8yepWwjAUO5waflu4/WnfyeZf3GX+o=;
  b=ZLxKS2J6bTd74GfNaUc3RW7PD2iESiXwMuMmlvDWEom5LWTtDGENYicP
   ZrmrBTZsvXrFzUjJ0T8qcKIYi8B9KaMWtp96tkhvpUKn9h46fs/nxbUrX
   zVYlqX5qF5oelZPP6pgAuJl+n5+G91t/oUtUE0jzegr3v2P+jTkT4tRpQ
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116513475
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ijHIqau9SlpzNK9sa3uFYWCcHOfnVENeMUV32f8akzHdYApBsoF/q
 tZmKWyGPf6OZjf0coxyaIu18BkP75fQndU3Tws+ryBhQXsU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACHzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwMzMkLRuzvdmKg5GADfBstOZ6Hu23I9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zuYoj2iXk5HXDCZ4SKL8mKBm8bdpCLYZa4rMZ2FquZ4kULGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Ul7Cmdx6yS5ByWbkAGQSRGc8cOr9ItSHoh0
 Vrht9rxCCZmqrG9VXOX/bDSpjS3URX5NkdbO3VCF1FcpYC+/sdq1Emnostf/LCdld7cWjrA+
 Qu27wsFwKwTv+xS5YHn4gWS696znaQlXjLZ9y2OADL0t1MiO9L8D2C7wQOFtKgdde51WnHE5
 SFZwJbGsYjiGLnXzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 2eJ42u9HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrHA3NRDAgDi1zhVEfUQD1
 XCzKJbEMJrnIf4/kGreqxk1jNfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U9wmy2Mq
 4w3H5LTm31ivBjWPnG/HXg7cQpbchDWxPne96RqSwJ0ClE4QT5xUqOJnOtJlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:bVWT3qhTu7qVVmGWadSaUjM4RXBQXggji2hC6mlwRA09TyXPrb
 HToB0+726OtN93YgBZpTngAtj4fZq4z/RICOYqTNSftWXd2FdAabsSiLcKoAeQfREWlNQtt5
 uIKJIOcuEYZGIS5a3HCUuDYrIdKbK8gceVbInlrktFfEVDd7xn9AthDxbzKDwKeOCEP/YE/V
 ini/avawDORZ3fVKqGOkU=
X-Talos-CUID: 9a23:Q3W7mG3YxO8xKLkvCCOlxbxfAcMMMXbt9kzsYGyDTn9pep/Me3vM5/Yx
X-Talos-MUID: 9a23:cmEyfQpuEyTBilVbWEAezylsNNdF/o28MUEurLk/num5aTRiKijI2Q==
X-IronPort-AV: E=Sophos;i="6.01,202,1684814400"; 
   d="scan'208";a="116513475"
Date: Thu, 13 Jul 2023 11:39:53 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 6/6] libxl: add support for parsing MSR features
Message-ID: <48d5ca83-d14b-44e1-9431-5324118eacb7@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-7-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230711092230.15408-7-roger.pau@citrix.com>

On Tue, Jul 11, 2023 at 11:22:30AM +0200, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index b1c4f8f2f45b..86a08f29a19c 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -158,6 +158,57 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
>      return 0;
>  }
>  
> +static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
> +{
> +    unsigned int i = 0;
> +    libxl_cpuid_policy_list policy = *pl;
> +
> +    if (policy == NULL)
> +        policy = *pl = calloc(1, sizeof(*policy));
> +
> +    if (policy->msr != NULL)
> +        for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++)

Could you add { } for this two blocks? One line after a if() without { }
is ok, but not more.

> +            if (policy->msr[i].index == index)
> +                return &policy->msr[i];
> +
> +    policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
> +    policy->msr[i].index = index;
> +    memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);

Is this "array_size() - 1" correct? The -1 need to go, right?

> +    policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';

Is it for convenience? Maybe for easier debugging (printf)? Also, I
guess having a NUL at the end mean the -1 on the previous statement kind
of useful.

> +    policy->msr[i + 1].index = XC_MSR_INPUT_UNUSED;
> +
> +    return &policy->msr[i];
> +}

Thanks,

-- 
Anthony PERARD

