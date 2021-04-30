Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9A36F95D
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 13:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120506.227902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRPA-0002Vm-6z; Fri, 30 Apr 2021 11:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120506.227902; Fri, 30 Apr 2021 11:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcRPA-0002VN-3u; Fri, 30 Apr 2021 11:33:56 +0000
Received: by outflank-mailman (input) for mailman id 120506;
 Fri, 30 Apr 2021 11:33:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ll2C=J3=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lcRP9-0002VI-9M
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 11:33:55 +0000
Received: from mx.upb.ro (unknown [141.85.13.250])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df915331-e302-4be2-a69f-16228458f10e;
 Fri, 30 Apr 2021 11:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 4EC59B5600B0;
 Fri, 30 Apr 2021 14:33:53 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id brLUdr8a9wgH; Fri, 30 Apr 2021 14:33:50 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C95A1B56010D;
 Fri, 30 Apr 2021 14:33:50 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9cCdlGKaGhQD; Fri, 30 Apr 2021 14:33:50 +0300 (EEST)
Received: from [172.19.2.117] (unknown [141.85.225.204])
 by mx.upb.ro (Postfix) with ESMTPSA id 444E5B5600B0;
 Fri, 30 Apr 2021 14:33:50 +0300 (EEST)
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
X-Inumbo-ID: df915331-e302-4be2-a69f-16228458f10e
X-Virus-Scanned: amavisd-new at upb.ro
Subject: Re: [PATCH v2 5/5] tools/ocaml: Fix redefinition errors
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <cover.1619781564.git.costin.lupu@cs.pub.ro>
 <1a8ff6dcdd70fef83828dce47e79eb846860cbe8.1619781564.git.costin.lupu@cs.pub.ro>
Message-ID: <476b0736-3034-b697-a89e-1bb0e5cef4fd@cs.pub.ro>
Date: Fri, 30 Apr 2021 14:33:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1a8ff6dcdd70fef83828dce47e79eb846860cbe8.1619781564.git.costin.lupu@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

@Christian: This version is slightly changed, it uses XC_PAGE_* macros
instead of PAGE_* macros and that's why I didn't add your ack.

Cheers,
Costin

On 4/30/21 2:28 PM, Costin Lupu wrote:
> If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
> header) then gcc will trigger a redefinition error because of -Werror. This
> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order to avoid
> confusion between control domain page granularity (PAGE_* definitions) and
> guest domain page granularity (which is what we are dealing with here).
> 
> Same issue applies for redefinitions of Val_none and Some_val macros which
> can be already defined in the OCaml system headers (e.g.
> /usr/lib/ocaml/caml/mlvalues.h).
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
> ---
>  tools/ocaml/libs/xc/xenctrl_stubs.c            | 10 ++++------
>  tools/ocaml/libs/xentoollog/xentoollog_stubs.c |  4 ++++
>  tools/ocaml/libs/xl/xenlight_stubs.c           |  4 ++++
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index d05d7bb30e..f9e33e599a 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -36,14 +36,12 @@
>  
>  #include "mmap_stubs.h"
>  
> -#define PAGE_SHIFT		12
> -#define PAGE_SIZE               (1UL << PAGE_SHIFT)
> -#define PAGE_MASK               (~(PAGE_SIZE-1))
> -
>  #define _H(__h) ((xc_interface *)(__h))
>  #define _D(__d) ((uint32_t)Int_val(__d))
>  
> +#ifndef Val_none
>  #define Val_none (Val_int(0))
> +#endif
>  
>  #define string_of_option_array(array, index) \
>  	((Field(array, index) == Val_none) ? NULL : String_val(Field(Field(array, index), 0)))
> @@ -818,7 +816,7 @@ CAMLprim value stub_xc_domain_memory_increase_reservation(value xch,
>  	CAMLparam3(xch, domid, mem_kb);
>  	int retval;
>  
> -	unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (PAGE_SHIFT - 10);
> +	unsigned long nr_extents = ((unsigned long)(Int64_val(mem_kb))) >> (XC_PAGE_SHIFT - 10);
>  
>  	uint32_t c_domid = _D(domid);
>  	caml_enter_blocking_section();
> @@ -924,7 +922,7 @@ CAMLprim value stub_pages_to_kib(value pages)
>  {
>  	CAMLparam1(pages);
>  
> -	CAMLreturn(caml_copy_int64(Int64_val(pages) << (PAGE_SHIFT - 10)));
> +	CAMLreturn(caml_copy_int64(Int64_val(pages) << (XC_PAGE_SHIFT - 10)));
>  }
>  
>  
> diff --git a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
> index bf64b211c2..e4306a0c2f 100644
> --- a/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
> +++ b/tools/ocaml/libs/xentoollog/xentoollog_stubs.c
> @@ -53,8 +53,12 @@ static char * dup_String_val(value s)
>  #include "_xtl_levels.inc"
>  
>  /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
> +#ifndef Val_none
>  #define Val_none Val_int(0)
> +#endif
> +#ifndef Some_val
>  #define Some_val(v) Field(v,0)
> +#endif
>  
>  static value Val_some(value v)
>  {
> diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
> index 352a00134d..45b8af61c7 100644
> --- a/tools/ocaml/libs/xl/xenlight_stubs.c
> +++ b/tools/ocaml/libs/xl/xenlight_stubs.c
> @@ -227,8 +227,12 @@ static value Val_string_list(libxl_string_list *c_val)
>  }
>  
>  /* Option type support as per http://www.linux-nantes.org/~fmonnier/ocaml/ocaml-wrapping-c.php */
> +#ifndef Val_none
>  #define Val_none Val_int(0)
> +#endif
> +#ifndef Some_val
>  #define Some_val(v) Field(v,0)
> +#endif
>  
>  static value Val_some(value v)
>  {
> 

