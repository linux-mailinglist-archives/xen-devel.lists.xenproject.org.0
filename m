Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8851E835B
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 18:15:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehf5-0004xS-Il; Fri, 29 May 2020 16:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jehf3-0004xN-Nq
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 16:15:09 +0000
X-Inumbo-ID: 905517a8-a1c7-11ea-a8e7-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 905517a8-a1c7-11ea-a8e7-12813bfff9fa;
 Fri, 29 May 2020 16:15:08 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:35052
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jehf0-000i1d-Ja (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 17:15:06 +0100
Subject: Re: [PATCH for-4.14] tools/libxl: fix setting altp2m param broken by
 1e9bc407cf0
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20200529160621.3123-1-tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <69225f69-3ca0-c759-03a5-60d6464a7eb4@citrix.com>
Date: Fri, 29 May 2020 17:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529160621.3123-1-tamas@tklengyel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 17:06, Tamas K Lengyel wrote:
> The patch 1e9bc407cf0 mistakenly converted the altp2m config option to a
> boolean. This is incorrect and breaks external-only usecases of altp2m that
> is set with a value of 2.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Urg yes.  Sorry.

However, this doesn't build because there is another use of the altp2m
variable between the two hunks below, for compatiblity with the older
altp2mhvm option.

I think changing its type just to int out to suffice?

~Andrew

> ---
>  tools/libxl/libxl_x86.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
> index f8bc828e62..272736850b 100644
> --- a/tools/libxl/libxl_x86.c
> +++ b/tools/libxl/libxl_x86.c
> @@ -391,7 +391,6 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
>      libxl_ctx *ctx = libxl__gc_owner(gc);
>      xc_interface *xch = ctx->xch;
>      int ret = ERROR_FAIL;
> -    bool altp2m = info->altp2m;
>  
>      switch(info->type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
> @@ -433,7 +432,7 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
>              LOG(ERROR, "Couldn't set HVM_PARAM_NESTEDHVM");
>              goto out;
>          }
> -        if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, altp2m)) {
> +        if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, info->altp2m)) {
>              LOG(ERROR, "Couldn't set HVM_PARAM_ALTP2M");
>              goto out;
>          }


