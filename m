Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD913599CAB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 15:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390326.627690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1l3-0001SF-5X; Fri, 19 Aug 2022 13:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390326.627690; Fri, 19 Aug 2022 13:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP1l3-0001QJ-1Q; Fri, 19 Aug 2022 13:09:53 +0000
Received: by outflank-mailman (input) for mailman id 390326;
 Fri, 19 Aug 2022 13:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oP1l1-0001QD-A7
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 13:09:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 330f3c7e-1fc0-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 15:09:48 +0200 (CEST)
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
X-Inumbo-ID: 330f3c7e-1fc0-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660914588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8rD5XRNXgIuCcNGwotXh4Enqk+a6oo1Q1QQLqXlV1k=;
  b=LqtG5vvml/8cmJwdXmdJkhofvCE60WAoRZ/G7Z2IxH4IQ2Paaq1WDheA
   zHXANzKXNTdQaBxiv2xBmneuu5fnBOlQjZGGMoVG3e0Dyfn1MQEsbxBQQ
   7/YDrL6dEcEsdMGaJkEUBO4j2J6q92ogoE5/xJ+l6qYGEoMvwoCZqquQZ
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78209948
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FSc9x64DIyJnN2tX+x+VzAxRtFDHchMFZxGqfqrLsTDasY5as4F+v
 jcaCz+OOffYMGqkc41yYY7l9E0Pu57cxtdhTFZrq3hkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5aWq4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJBw3bYIZ1+d6OGN1r
 f4YBzwJVjGovf3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESxRJJlcQDoN4hOqyj2PzWzZZtEiUtew85G27IAlZj+i3aIuEJoziqcN9g163i
 UTb0WXCMwwdFYykzR2PwC2tr7qa9c/8cN1LT+DpnhJwu3WDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsb5dw21pjiDpBF0c8BXCOcg7waOzILb5g+YAi4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3uqV/TyzFCkYFG05PS0EYgcB2/jImp5m23ojUe1f/L6JYszdQG+um
 2DV8HFu2d3/nuZQifzloAmvbyaE48GQE1Vrvli/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxWtamS0baZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusELbCf1Mv4rPdLqYyjP8UQHPYWNaxwpRoAWPsgZmPGvp0mCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuZd2l39W+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4vf/F2Fq
 48Ba5DWo/idOcWnChTqHUcoBQhiBRAG6Vre8aS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:Sw+BYajX98SMCTLBPlnaZtQIeHBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.93,248,1654574400"; 
   d="scan'208";a="78209948"
Date: Fri, 19 Aug 2022 14:09:39 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Ping: [XEN PATCH v4 17/32] tools: Introduce $(xenlibs-ldflags, )
 macro
Message-ID: <Yv+LkxKisoXqpuFO@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-18-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220811164845.38083-18-anthony.perard@citrix.com>

Hi Nick, George,

Could you give a ack or review this patch?

Also sorry George, it seems that the use of "--remove-duplicates" with
`get_maintainer.pl` have removed your email from CC the list.

Thanks,

On Thu, Aug 11, 2022 at 05:48:30PM +0100, Anthony PERARD wrote:
> This avoid the need to open-coding the list of flags needed to link
> with an in-tree Xen library when using -lxen*.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  tools/golang/xenlight/Makefile | 2 +-
>  tools/Rules.mk                 | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
> index 64671f246c..00e6d17f2b 100644
> --- a/tools/golang/xenlight/Makefile
> +++ b/tools/golang/xenlight/Makefile
> @@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
>  # so that it can find the actual library.
>  .PHONY: build
>  build: xenlight.go $(GOXL_GEN_FILES)
> -	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
> +	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(call xenlibs-ldflags,light toollog) $(APPEND_LDFLAGS)" $(GO) build -x
>  
>  .PHONY: install
>  install: build
> diff --git a/tools/Rules.mk b/tools/Rules.mk
> index ce77dd2eb1..26958b2948 100644
> --- a/tools/Rules.mk
> +++ b/tools/Rules.mk
> @@ -105,6 +105,14 @@ define xenlibs-ldlibs
>      $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
>  endef
>  
> +# Provide needed flags for linking an in-tree Xen library by an external
> +# project (or when it is necessary to link with "-lxen$(1)" instead of using
> +# the full path to the library).
> +define xenlibs-ldflags
> +    $(call xenlibs-rpath,$(1)) \
> +    $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
> +endef
> +
>  define LIB_defs
>   FILENAME_$(1) ?= xen$(1)
>   XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
> -- 
> Anthony PERARD
> 

-- 
Anthony PERARD

