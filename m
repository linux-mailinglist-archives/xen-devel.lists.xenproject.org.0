Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B711A2238
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMA0K-0002jX-0T; Wed, 08 Apr 2020 12:40:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMA0I-0002jS-36
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:40:26 +0000
X-Inumbo-ID: 1e14b382-7996-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e14b382-7996-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 12:40:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2273CAB89;
 Wed,  8 Apr 2020 12:40:23 +0000 (UTC)
Subject: Re: [XEN PATCH v4 10/18] xen/build: use if_changed on built_in.o
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-11-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <072ffe9d-88c0-144f-a9ab-c83869ad34e2@suse.com>
Date: Wed, 8 Apr 2020 14:40:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-11-anthony.perard@citrix.com>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -130,15 +130,24 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
>  c_flags += $(CFLAGS-y)
>  a_flags += $(CFLAGS-y) $(AFLAGS-y)
>  
> -built_in.o: $(obj-y) $(extra-y)
> -ifeq ($(obj-y),)
> -	$(CC) $(c_flags) -c -x c /dev/null -o $@
> -else
> +quiet_cmd_ld_builtin = LD      $@
>  ifeq ($(CONFIG_LTO),y)
> -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
> +cmd_ld_builtin = \
> +    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
>  else
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
> +cmd_ld_builtin = \
> +    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
>  endif

How about going yet one step further and doing away with the
ifeq here altogether:

cmd_ld_builtin-y = \
    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))
cmd_ld_builtin-$(CONFIG_LTO) = \
    $(LD_LTO) -r -o $@ $(filter-out $(extra-y),$(real-prereqs))

> +quiet_cmd_cc_builtin = LD      $@
> +cmd_cc_builtin = \
> +    $(CC) $(XEN_CFLAGS) -c -x c /dev/null -o $@
> +
> +built_in.o: $(obj-y) $(extra-y) FORCE
> +ifeq ($(obj-y),)
> +	$(call if_changed,cc_builtin)
> +else
> +	$(call if_changed,ld_builtin)

	$(call if_changed,ld_builtin-y)

?

As an aside (not something you introduce) this makes it even more
prominent that the use of $(XEN_LDFLAGS) is asymmetric here, for
whatever reason (if any). Of course there's other redundancy
between the two commands which could be eliminated.

Jan

