Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F776F5C2E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 18:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529394.823767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFTD-0006jQ-Li; Wed, 03 May 2023 16:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529394.823767; Wed, 03 May 2023 16:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puFTD-0006gz-Ir; Wed, 03 May 2023 16:36:47 +0000
Received: by outflank-mailman (input) for mailman id 529394;
 Wed, 03 May 2023 16:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2zA8=AY=citrix.com=prvs=480c9ef0c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puFTC-0006gt-B6
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 16:36:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af208a88-e9d0-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 18:36:43 +0200 (CEST)
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
X-Inumbo-ID: af208a88-e9d0-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683131803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qJd4BNQgLPxNBx6IhpSFPUe3kUXTC4ATTMmrCT7u5Hc=;
  b=YdX15iZECYWYTr99d7saY9lfUSokFQLn2IVSad3xWnTPv6ZdboI0vpfO
   xNP5t4OlIncW7OEY4f+LJr7y1Vo9xoBG+685GdIpskE4xXzojMU4+ruyD
   8s5QNdJSkJl9YVRlpsJ5d5UzJs08Xf1HaH6VfC9uX1NAsBP/d9uJR2Pji
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108152269
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2+qypa7/vQ6LiBpupMMRbwxRtDjHchMFZxGqfqrLsTDasY5as4F+v
 jEaXWmFPamLMGP2eNlxb4u/oExQ6seAzNFiGQc6/3wyHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 /s8OTUIUUm/hfOHy52hdsBUm+smFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7I/
 z+cpTqoav0cHPKw9gLb+UywvMLKzXndSdhCJqK4+sc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC/
 laRksngHzBHrLyfQnXb/bCRxQ5eIgBMczVEP3VdC1JYvZ+6+tpbYg/zoshLOqmRn9jwJmjMw
 SG7pwcku5wrkOEO7vDulbzYuA5AtqQlXyZsuFWMBjv/vlwmDGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcxqBy+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romhezO
 ic/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJFTfoXozPBTKhjCFfK0QrE3CE
 c3DLZbE4YgyUMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7IdykEW9EO9fWHPXN7BR0U9xiFmNm
 zqpH5fQmko3vSyXSnW/zLP/2nhTdyhnWcyo9JYLHgNBSyI/cFwc5zbq6etJU+RYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:8qq0Pa4hEe/l+tfyLQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:sMRAyGHtHkf3qbmBqmJN82oFH8UaK0Hf3UbbDFWEIF50Z7isHAo=
X-Talos-MUID: 9a23:ztX78QZSRvkhc+BTmRDTvG9pCttSzqH+UmYcy8U0pMmIDHkl
X-IronPort-AV: E=Sophos;i="5.99,247,1677560400"; 
   d="scan'208";a="108152269"
Date: Wed, 3 May 2023 17:36:32 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH v3 1/3] tools: Modify single-domid callers of
 xc_domain_getinfolist()
Message-ID: <bba61acc-4d4c-49f9-9cb8-b93bb6409180@perard>
References: <20230502111338.16757-1-alejandro.vallejo@cloud.com>
 <20230502111338.16757-2-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502111338.16757-2-alejandro.vallejo@cloud.com>

On Tue, May 02, 2023 at 12:13:36PM +0100, Alejandro Vallejo wrote:
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 7f0986c185..5709b3e62f 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -349,16 +349,12 @@ int libxl_domain_info(libxl_ctx *ctx, libxl_dominfo *info_r,
>      int ret;
>      GC_INIT(ctx);
>  
> -    ret = xc_domain_getinfolist(ctx->xch, domid, 1, &xcinfo);
> +    ret = xc_domain_getinfo_single(ctx->xch, domid, &xcinfo);
>      if (ret<0) {
> -        LOGED(ERROR, domid, "Getting domain info list");
> +        LOGED(ERROR, domid, "Getting domain info");
>          GC_FREE;
>          return ERROR_FAIL;
>      }
> -    if (ret==0 || xcinfo.domain != domid) {
> -        GC_FREE;
> -        return ERROR_DOMAIN_NOTFOUND;

I kind of think we should keep returning ERROR_DOMAIN_NOTFOUND on error
as this is the most likely explanation. Also, the comment for this
function in libxl.h explain this:
    /* May be called with info_r == NULL to check for domain's existence.
     * Returns ERROR_DOMAIN_NOTFOUND if domain does not exist (used to return
     * ERROR_INVAL for this scenario). */
    int libxl_domain_info(libxl_ctx*, libxl_dominfo *info_r,
                          uint32_t domid);

Would it be possible to find out from xc_domain_getinfo_single() if it's
a domain not found scenario vs other error (like permission denied)?

> -    }
>  
>      if (info_r)
>          libxl__xcinfo2xlinfo(ctx, &xcinfo, info_r);
> @@ -1657,14 +1653,15 @@ int libxl__resolve_domid(libxl__gc *gc, const char *name, uint32_t *domid)
>  libxl_vcpuinfo *libxl_list_vcpu(libxl_ctx *ctx, uint32_t domid,
>                                         int *nr_vcpus_out, int *nr_cpus_out)
>  {
> +    int rc;
>      GC_INIT(ctx);
>      libxl_vcpuinfo *ptr, *ret;
>      xc_domaininfo_t domaininfo;
>      xc_vcpuinfo_t vcpuinfo;
>      unsigned int nr_vcpus;
>  
> -    if (xc_domain_getinfolist(ctx->xch, domid, 1, &domaininfo) != 1) {
> -        LOGED(ERROR, domid, "Getting infolist");
> +    if ((rc = xc_domain_getinfo_single(ctx->xch, domid, &domaininfo)) < 0) {

The variable name "rc" is reserved for libxl return code. For syscall
and other external call, we should use the name "r". (I know that in
other part of this patch the name used is "ret", but as it is already
existing in the code base, I'm not asking for a change elsewhere)

Also, assignment to the variable should be done outside of the if(). So
the new code should look like:

    r = xc_domain_getinfolist(...);
    if (r < 0) {

(There's tools/libs/light/CODING_STYLE for all this explained)

> +        LOGED(ERROR, domid, "Getting dominfo");
>          GC_FREE;
>          return NULL;
>      }
> diff --git a/tools/libs/light/libxl_sched.c b/tools/libs/light/libxl_sched.c
> index 7c53dc60e6..21a65442c0 100644
> --- a/tools/libs/light/libxl_sched.c
> +++ b/tools/libs/light/libxl_sched.c
> @@ -219,13 +219,11 @@ static int sched_credit_domain_set(libxl__gc *gc, uint32_t domid,
>      xc_domaininfo_t domaininfo;
>      int rc;
>  
> -    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &domaininfo);
> +    rc = xc_domain_getinfo_single(CTX->xch, domid, &domaininfo);
>      if (rc < 0) {
> -        LOGED(ERROR, domid, "Getting domain info list");
> +        LOGED(ERROR, domid, "Getting domain info");
>          return ERROR_FAIL;
>      }
> -    if (rc != 1 || domaininfo.domain != domid)
> -        return ERROR_INVAL;

We can probably return ERROR_INVAL on error instead of ERROR_FAIL, as I
guess it's more likely that we try to change a non-existing domain
rather than having another error.

>  
>      rc = xc_sched_credit_domain_get(CTX->xch, domid, &sdom);
>      if (rc != 0) {
> @@ -426,13 +424,11 @@ static int sched_credit2_domain_set(libxl__gc *gc, uint32_t domid,
>      xc_domaininfo_t info;
>      int rc;
>  
> -    rc = xc_domain_getinfolist(CTX->xch, domid, 1, &info);
> +    rc = xc_domain_getinfo_single(CTX->xch, domid, &info);
>      if (rc < 0) {
>          LOGED(ERROR, domid, "Getting domain info");
>          return ERROR_FAIL;

dito.

>      }
> -    if (rc != 1 || info.domain != domid)
> -        return ERROR_INVAL;
>  
>      rc = xc_sched_credit2_domain_get(CTX->xch, domid, &sdom);
>      if (rc != 0) {


Thanks,

-- 
Anthony PERARD

