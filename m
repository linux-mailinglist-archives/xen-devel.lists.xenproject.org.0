Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B68281DEF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 23:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2356.6992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOT4W-0008Ro-2D; Fri, 02 Oct 2020 21:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2356.6992; Fri, 02 Oct 2020 21:58:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOT4V-0008RP-VQ; Fri, 02 Oct 2020 21:58:35 +0000
Received: by outflank-mailman (input) for mailman id 2356;
 Fri, 02 Oct 2020 21:58:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOT4U-0008RK-65
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 21:58:34 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3b16c59-027b-467d-9ca4-6adc4e2e7fb0;
 Fri, 02 Oct 2020 21:58:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOT4U-0008RK-65
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 21:58:34 +0000
X-Inumbo-ID: f3b16c59-027b-467d-9ca4-6adc4e2e7fb0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f3b16c59-027b-467d-9ca4-6adc4e2e7fb0;
	Fri, 02 Oct 2020 21:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601675912;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wB/CsIWii9C2rFRNqdshs8WDQFZ6Xc37HtFtY2Bt9Ms=;
  b=DplurLX/DcY9G9d4KdJVvS0tG/Gt9piLttiAD7YdmhsXy1UpEvMbjjXE
   hgdW9HTXxAgjVG7pvDn99TShC0Lz0tVtymG2P5RodaemLob1/izTKQoG0
   WU/1y9Xm+EjDhmJh9KSpmoCRQ93j5o8lYceN+fxM+aCKSbtrRRIwgJreN
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SgbGO3XiL+6vwMkeJmlEmTxwcklwqJXaav01FpSTnt8nCBmopnf+1l3C6B4QZShsh66K8sGMEo
 hzo42CZjziiJT7GA0apeEG6bT6yTu7rys1TJt62eEmHXvn8EfIux9fXWVR5aT50Sd1lpzxUjjh
 6Zkz50E9Plxn0naF+flUOHNlLVMtfNYmpImN+VgwhZ77cHJGsPK2dpL5QjAEVhre+qXnG7A778
 ajFFgyQl1mkIuVr1JF53dMFlliT9vPxqKwWeoGHUVzsv0JBuB3vArDnmdJ4Ma1KSQgjcapZjKw
 Pnw=
X-SBRS: None
X-MesageID: 29215224
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,329,1596513600"; 
   d="scan'208";a="29215224"
Subject: Re: [PATCH v9 2/8] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Julien Grall <julien@xen.org>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-3-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <783f8b1b-f11f-d8ff-3643-d35f17c6c363@citrix.com>
Date: Fri, 2 Oct 2020 22:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-3-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 791f0a2592..743105181f 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1130,6 +1130,43 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/*
> + * XEN_DOMCTL_getdomaincontext
> + * ---------------------------
> + *
> + * buffer (IN):   The buffer into which the context data should be
> + *                copied, or NULL to query the buffer size that should
> + *                be allocated.
> + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> + *                zero, and the value passed out will be the size of the
> + *                buffer to allocate.
> + *                If 'buffer' is non-NULL then the value passed in must
> + *                be the size of the buffer into which data may be copied.
> + *                The value passed out will be the size of data written.
> + */
> +struct xen_domctl_getdomaincontext {
> +    uint32_t size;

This series is full of mismatched 32/64bit sizes, with several
truncation bugs in the previous patch.

Just use a 64bit size here.  Life is too short to go searching for all
the other truncation bug when this stream tips over 4G, and its not like
there is a shortage of space in this structure.

> +    uint32_t pad;
> +    XEN_GUEST_HANDLE_64(void) buffer;
> +};
> +
> +/* XEN_DOMCTL_setdomaincontext
> + * ---------------------------
> + *
> + * buffer (IN):   The buffer from which the context data should be
> + *                copied.
> + * size (IN):     The size of the buffer from which data may be copied.
> + *                This data must include DOMAIN_SAVE_CODE_HEADER at the
> + *                start and terminate with a DOMAIN_SAVE_CODE_END record.
> + *                Any data beyond the DOMAIN_SAVE_CODE_END record will be
> + *                ignored.
> + */
> +struct xen_domctl_setdomaincontext {
> +    uint32_t size;
> +    uint32_t pad;
> +    XEN_GUEST_HANDLE_64(const_void) buffer;
> +};
> +
>  struct xen_domctl {
>      uint32_t cmd;
>  #define XEN_DOMCTL_createdomain                   1
> @@ -1214,6 +1251,8 @@ struct xen_domctl {
>  #define XEN_DOMCTL_vuart_op                      81
>  #define XEN_DOMCTL_get_cpu_policy                82
>  #define XEN_DOMCTL_set_cpu_policy                83
> +#define XEN_DOMCTL_getdomaincontext              84
> +#define XEN_DOMCTL_setdomaincontext              85

So, we've currently got:

#define XEN_DOMCTL_setvcpucontext                12
#define XEN_DOMCTL_getvcpucontext                13
#define XEN_DOMCTL_gethvmcontext                 33
#define XEN_DOMCTL_sethvmcontext                 34
#define XEN_DOMCTL_set_ext_vcpucontext           42
#define XEN_DOMCTL_get_ext_vcpucontext           43
#define XEN_DOMCTL_gethvmcontext_partial         55
#define XEN_DOMCTL_setvcpuextstate               62
#define XEN_DOMCTL_getvcpuextstate               63

which are doing alarmingly related things for vcpus.  (As an amusing
exercise to the reader, figure out which are PV specific and which are
HVM specific.  Hint: they're not disjoint sets.)


I know breaking with tradition is sacrilege, but at the very minimum,
can we get some underscores in that name so you can at least read the
words which make it up more easily.

~Andrew

