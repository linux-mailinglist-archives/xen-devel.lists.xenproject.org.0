Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED28271FCF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 12:18:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKItV-0000RQ-8r; Mon, 21 Sep 2020 10:18:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKItU-0000RK-AJ
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 10:18:00 +0000
X-Inumbo-ID: 910cb283-7f8f-4df6-b896-5b96674f4c58
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 910cb283-7f8f-4df6-b896-5b96674f4c58;
 Mon, 21 Sep 2020 10:17:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600683478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imezgL3etswMA0OdZciq//WXOmFSIHRj70An1wEyYTo=;
 b=iHdzEgGdQrxaMnZ8O3vrE1MJh52Th1lBihRfOv1joSgvWMNTcA4A72YvTiFGxX7H5BmZ23
 HbvLf/jWH0PbY08inCGDWSt+DTNoJzgnLebHvdOY3O118QVHA3TLXgcmjcHaAs8HP7X3vP
 WIORbOlNS+b9YjsN1+ZWgq43vYCX1pg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8769CAD71;
 Mon, 21 Sep 2020 10:18:34 +0000 (UTC)
Subject: Ping: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
Message-ID: <de999174-604d-5874-cf11-4fab15c583d4@suse.com>
Date: Mon, 21 Sep 2020 12:17:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 12:15, Jan Beulich wrote:
> Switch to $(call if_changed,ld) where possible; presumably not doing so
> in e321576f4047 ("xen/build: start using if_changed") right away was an
> oversight, as it did for Arm in (just) one case. It failed to add
> prelink.o to $(targets), though, causing - judging from the observed
> behavior on x86 - undue rebuilds of the final binary (because of
> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
> because of .prelink.o.cmd not getting read) during "make install-xen".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/arch/arm/Makefile |  4 +++-
>  xen/arch/x86/Makefile | 18 ++++++++++--------
>  2 files changed, 13 insertions(+), 9 deletions(-)

May I ask for an Arm-side ack (or otherwise) here, please?

Jan

> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 51173d97127e..296c5e68bbc3 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -95,12 +95,14 @@ prelink_lto.o: $(ALL_OBJS)
>  
>  # Link it with all the binary objects
>  prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +	$(call if_changed,ld)
>  else
>  prelink.o: $(ALL_OBJS) FORCE
>  	$(call if_changed,ld)
>  endif
>  
> +targets += prelink.o
> +
>  $(TARGET)-syms: prelink.o xen.lds
>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
>  	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 74152f2a0dad..9b368632fb43 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -136,19 +136,21 @@ prelink_lto.o: $(ALL_OBJS)
>  	$(LD_LTO) -r -o $@ $^
>  
>  # Link it with all the binary objects
> -prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y)
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y) FORCE
> +	$(call if_changed,ld)
>  
> -prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
> +	$(call if_changed,ld)
>  else
> -prelink.o: $(ALL_OBJS) $(EFI_OBJS-y)
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +prelink.o: $(ALL_OBJS) $(EFI_OBJS-y) FORCE
> +	$(call if_changed,ld)
>  
> -prelink-efi.o: $(ALL_OBJS)
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +prelink-efi.o: $(ALL_OBJS) FORCE
> +	$(call if_changed,ld)
>  endif
>  
> +targets += prelink.o prelink-efi.o
> +
>  $(TARGET)-syms: prelink.o xen.lds
>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>  	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
> 


