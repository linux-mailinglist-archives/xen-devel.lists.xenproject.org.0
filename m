Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206A1A2244
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:47:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMA6Q-0002vd-Uo; Wed, 08 Apr 2020 12:46:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMA6P-0002vY-BN
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:46:45 +0000
X-Inumbo-ID: 006a88c4-7997-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 006a88c4-7997-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 12:46:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEDFCACB8;
 Wed,  8 Apr 2020 12:46:42 +0000 (UTC)
Subject: Re: [XEN PATCH v4 12/18] xen/build: factorise generation of the
 linker scripts
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-13-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af0121cc-c282-ceb0-b5e8-44ac0ba6ebfb@suse.com>
Date: Wed, 8 Apr 2020 14:46:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-13-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> In Arm and X86 makefile, generating the linker script is the same, so
> we can simply have both call the same macro.
> 
> We need to add *.lds files into extra-y so that Rules.mk can find the
> .*.cmd dependency file and load it.
> 
> Change made to the command line:
> - Use of $(CPP) instead of $(CC) -E
> - Remove -Ui386.
>   We don't compile Xen for i386 anymore, so that macro is never
>   defined. Also it doesn't make sense on Arm.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> Notes:
>     v4:
>     - fix rebuild by adding FORCE as dependency
>     - Use $(CPP)
>     - remove -Ui386
>     - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
>       still mandatory for if_changed (or cmd) macro to work.

I still don't believe in there being a need for "; \" there. This
actually breaks things, after all:

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -236,6 +236,12 @@ cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
>  %.s: %.S FORCE
>  	$(call if_changed,cpp_s_S)
>  
> +# Linker scripts, .lds.S -> .lds
> +quiet_cmd_cc_lds_S = LDS     $@
> +cmd_cc_lds_S = $(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<; \
> +    sed -e 's/.*\.lds\.o:/$(@F):/g' <$(dot-target).d >$(dot-target).d.new; \
> +    mv -f $(dot-target).d.new $(dot-target).d

if $(CPP) or sed fail, previously the whole rule would have failed,
which no longer is the case with your use of semicolons. There
ought to be a solution to this, ideally one better than adding
"set -e" as the first command ("define" would at least deal with
the multi-line make issue, but without it being clear to me why the
semicolons would be needed I don't think I can suggest anything
there at the moment).

Jan

