Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2782EAC6A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62013.109495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmpD-0006Sl-16; Tue, 05 Jan 2021 13:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62013.109495; Tue, 05 Jan 2021 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmpC-0006SM-Te; Tue, 05 Jan 2021 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 62013;
 Tue, 05 Jan 2021 13:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U980=GI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kwmpA-0006SH-W2
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:56:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fea74b52-8488-4417-b679-b038d91523e7;
 Tue, 05 Jan 2021 13:56:35 +0000 (UTC)
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
X-Inumbo-ID: fea74b52-8488-4417-b679-b038d91523e7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609854995;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=zcYjiG+EnfU6E4SU8szBHYw4E976nzsHbqOcudwXLUE=;
  b=B6Lz/lo4A96EoCUH/ubLsZAFlY99mfL5qdZYGhFWcidyD7dxpC+j63kk
   5Bl2oIE1OzUr4lbqWPj37/6hDE7t9EsO63EZVh0QIyMSBXuwhi4ar7iRl
   Io7W8iIgb1IrwjHgHNa/Mfh+S+dRUVba95KAPeD3DJokwL9F5M8x9NViy
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qg24xsjV7NV6SEjMXCqPtbbi3sRCaGwdD/NpupzpkltCzv09rL0XPbdpJtIrOtTrZL2YyEBJqe
 MG83ls7FSG8WrdiyJrO5zo2sb+jgq6hunbxb29NuTENgd11PMCy4z6ZLGgxHb9IurRPVssj974
 DHadTwg8kdTjwjt5lOMOfhyAL/mk3XleI0K60fIek/cXr/iHvoFeUTv+gZoTqJ5ooj9Ogntn9A
 /HrFast27wAjEKQjeh8GdMJPSEyC/FZu5Fx/sNBRzYgpwS7acBR3fGm1n5yoSxYrd2QnCr9SGj
 itE=
X-SBRS: 5.2
X-MesageID: 34415336
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,477,1599537600"; 
   d="scan'208";a="34415336"
Subject: Re: [PATCH RFC] lib: extend ASSERT()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <8afb661c-a2eb-3188-8351-01de16ff1b22@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4d46370c-44a5-07de-9e7d-ab4611e941bf@citrix.com>
Date: Tue, 5 Jan 2021 13:56:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8afb661c-a2eb-3188-8351-01de16ff1b22@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: FTLPEX02CAS01.citrite.net (10.13.99.120) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 05/01/2021 12:45, Jan Beulich wrote:
> The increasing amount of constructs along the lines of
>
>     if ( !condition )
>     {
>         ASSERT_UNREACHABLE();
>         return;
>     }
>
> is not only longer than necessary, but also doesn't produce incident
> specific console output (except for file name and line number). Allow
> the intended effect to be achieved with ASSERT(), by giving it a second
> parameter allowing specification of the action to take in release builds
> in case an assertion would have triggered in a debug one. The example
> above then becomes
>
>     ASSERT(condition, return);
>
> Make sure the condition will continue to not get evaluated when just a
> single argument gets passed to ASSERT().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: The use of a control flow construct as a macro argument may be
>      controversial.

So I had been putting some consideration towards this.  I agree that the
current use of ASSERT_UNREACHABLE() isn't great, and that we ought to do
something to improve the status quo.

However, the more interesting constructs to consider are the ones with
printk()'s and/or domain_crash().  While a straight return or goto in
alt... is perhaps acceptable, anything more complicated probably isn't.

I also found, with my still-pending domain_crash() cleanup series, that
domain_crash()/ASSERT_UNREACHABE()/return/goto became an increasingly
common combination.

>
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -818,11 +818,7 @@ int xenmem_add_to_physmap(struct domain
>      union add_to_physmap_extra extra = {};
>      struct page_info *pages[16];
>  
> -    if ( !paging_mode_translate(d) )
> -    {
> -        ASSERT_UNREACHABLE();
> -        return -EACCES;
> -    }
> +    ASSERT(paging_mode_translate(d), return -EACCES);
>  
>      if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>          extra.foreign_domid = DOMID_INVALID;
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -55,12 +55,14 @@
>  #endif
>  
>  #ifndef NDEBUG
> -#define ASSERT(p) \
> +#define ASSERT(p, ...) \
>      do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>  #define ASSERT_UNREACHABLE() assert_failed("unreachable")
>  #define debug_build() 1
>  #else
> -#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
> +#define ASSERT(p, alt...) do { \
> +        if ( !count_args(alt) || unlikely(!(p)) ) { alt; } \

I'd strongly recommend naming this failsafe... rather than alt, to make
it clear what its purpose is.

Also, we really can't have (p) conditionally evaluated depending on
whether there are any failsafe arguments or not.  It is already bad
enough that its state of evaluation differs between debug and release
builds.

~Andrew

> +    } while ( 0 )
>  #define ASSERT_UNREACHABLE() do { } while (0)
>  #define debug_build() 0
>  #endif


