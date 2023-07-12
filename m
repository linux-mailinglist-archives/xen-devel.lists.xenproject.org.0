Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19959750EB8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 18:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562696.879455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcs6-0003lb-VY; Wed, 12 Jul 2023 16:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562696.879455; Wed, 12 Jul 2023 16:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJcs6-0003jM-Sb; Wed, 12 Jul 2023 16:39:22 +0000
Received: by outflank-mailman (input) for mailman id 562696;
 Wed, 12 Jul 2023 16:39:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Q3=C6=citrix.com=prvs=550b2c143=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qJcs6-0003jG-C4
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 16:39:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4ce09be-20d2-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 18:39:19 +0200 (CEST)
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
X-Inumbo-ID: a4ce09be-20d2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689179959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cznVBpO5M0Y1bKJzT/U+o6yKu4DJiU1mC5AsiTOdwfY=;
  b=h/O80+sj8TWrV8tnF/nFccmn3ao/eOBKGL0fjmUhSUArgMlS1cK6floI
   2hvchqu32D6VbWzHzuzWGCAhldOA967cyRA1zBVN80VtZKci/zd+IqMQa
   AejoZcHklb/nvsZLghS49/+88EG+2jaa+KNlTHjT9jydmLIkbeP10v3pk
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 114709272
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:A1JOdq5EtIQ1zX0F6ljtqQxRtC3HchMFZxGqfqrLsTDasY5as4F+v
 mUYUTqFP/iMYGrxfN1xb4qz8kwEv5GEyIViSFds+HpgHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8S5geF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 vUCcyAdMz+6q/ON3O6GEuQ0v+VyFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/E+
 TqXpTujav0cHOW+lxaPsVSHvajgwA3ndrlVBqGT1sc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC/
 laRksngHzBHrLyfQnXb/bCRxQ5eIgBMczVEP3VdC1JYvZ+6+tpbYg/zoshLF6ev1c3lRB7J7
 yGxsHQD37hLtO9a7vDulbzYuA5AtqQlXyZsuFWGBz76v18pDGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcxqBy+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romhezO
 ic/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJF7epHkzPRDMhTCFfK0QfUYXY
 MfzTCpRJSxCVfQPIMSeGo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrTbeFE5RT59VKC5LHFIU9UNopm5X9zgp
 hmVMnK0AnKk7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:2sZCj62vYDl+o9UL31A4jQqjBTVyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ5expOMG7MBfhHO1OkPYs1NaZLUTbUQ6TRuBfBOTZskXd8kHFh4xgPO
 JbAtVD4b7LfBRHZKTBkXKF+r8bqbHtncDY5ts2jU0dNz2CAJsQiDuRfzzra3GeMzM2Y6bReq
 Dsg/Zvln6FQzA6f867Dn4KU6zovNvQjq/rZhYAGloO9BSOpSnA0s+1LzGomjMlFx9fy7Yr9m
 bI1ybj4L+4jv29whjAk0fO8pVtnsf7wNcrPr3MtiFVEESttu+bXvUiZ1SwhkFxnAhp0idvrD
 D4mWZiAy200QKXQoj6m2qq5+Cq6kdR15ar8y7ovZKkm723eNv/MbsZuatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAjqqOYmwtVrQcotQ0XbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3nYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZLfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4u6fbs/
 z6ISNlXK4JCjbT4OG1reh2G0r2MRaAtBzWu7Nj26Q=
X-Talos-CUID: 9a23:piQJ2WBWND3pknL6Ey5u7hUECp0KS1HM92uMHhe1UV9IGYTAHA==
X-Talos-MUID: 9a23:t4uQWwV5zEKfbn/q/AbN2h1od+FD2OOBVW4Rv65BqdWvFRUlbg==
X-IronPort-AV: E=Sophos;i="6.01,200,1684814400"; 
   d="scan'208";a="114709272"
Date: Wed, 12 Jul 2023 17:39:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 3/6] libxl: introduce MSR data in libxl_cpuid_policy
Message-ID: <d7be70e8-611c-4f7d-a585-2a00b1513a92@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-4-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711092230.15408-4-roger.pau@citrix.com>

On Tue, Jul 11, 2023 at 11:22:27AM +0200, Roger Pau Monne wrote:
> Add a new array field to libxl_cpuid_policy in order to store the MSR
> policies.
> 
> Note that libxl_cpuid_policy_list_{copy,length,parse_json,gen_json}
> are not adjusted to deal with the new MSR array now part of
> libxl_cpuid_policy_list.

Why? Isn't this going to be an issue? Or maybe that going to be dealt
with in a future patch?

> 
> Adding the MSR data in the libxl_cpuid_policy_list type is done so
> that existing users can seamlessly pass MSR features as part of the
> CPUID data, without requiring the introduction of a separate
> domain_build_info field, and a new set of handlers functions.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/libs/light/libxl_cpuid.c    | 6 +++++-
>  tools/libs/light/libxl_internal.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index 724cb4f182d4..65cad28c3ef0 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -40,6 +40,9 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *pl)
>          free(policy->cpuid);
>      }
>  
> +    if (policy->msr)

You don't need to test for NULL, you can call free() in this case as
well.

> +        free(policy->msr);
> +
>      free(policy);
>      *pl = NULL;
>      return;

-- 
Anthony PERARD

