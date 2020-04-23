Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ADB1B614A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 18:49:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRf1z-0002ti-Q4; Thu, 23 Apr 2020 16:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRf1y-0002td-Cu
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 16:48:54 +0000
X-Inumbo-ID: 50aa08ae-8582-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50aa08ae-8582-11ea-9e09-bc764e2007e4;
 Thu, 23 Apr 2020 16:48:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E052BAD8E;
 Thu, 23 Apr 2020 16:48:51 +0000 (UTC)
Subject: Re: [XEN PATCH v5 08/16] build: Introduce $(cpp_flags)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-9-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62011f46-b208-334a-4070-0bd72cb21d28@suse.com>
Date: Thu, 23 Apr 2020 18:48:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-9-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.04.2020 18:12, Anthony PERARD wrote:
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -123,6 +123,7 @@ $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
>  
>  c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
>  a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
> +cpp_flags = $(filter-out -Wa$(comma)%,$(a_flags))

I can see this happening to be this way right now, but in principle
I could see a_flags to hold items applicable to assembly files only,
but not to (the preprocessing of) C files. Hence while this is fine
for now, ...

> @@ -207,7 +208,7 @@ quiet_cmd_cc_s_c = CC      $@
>  cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
>  
>  quiet_cmd_s_S = CPP     $@
> -cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> +cmd_s_S = $(CPP) $(cpp_flags) $< -o $@

... this one is a trap waiting for someone to fall in imo. Instead
where I'd expect this patch to use $(cpp_flags) is e.g. in
xen/arch/x86/mm/Makefile:

guest_walk_%.i: guest_walk.c Makefile
	$(CPP) $(cpp_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@

And note how this currently uses $(c_flags), not $(a_flags), which
suggests that your deriving from $(a_flags) isn't correct either.

Jan

