Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E61F0792
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jun 2020 17:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhajk-0006m6-9U; Sat, 06 Jun 2020 15:27:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5qQO=7T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jhajj-0006m1-F8
 for xen-devel@lists.xenproject.org; Sat, 06 Jun 2020 15:27:55 +0000
X-Inumbo-ID: 4abee644-a80a-11ea-b0fe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4abee644-a80a-11ea-b0fe-12813bfff9fa;
 Sat, 06 Jun 2020 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ebYBvlINelHyj8z6DEYe+Ke7Ci+rMQ52Z/yFUQvXAs=; b=m0Qwpt80LjLdA/pf8SLX5vUN66
 QmKhH7rit8OOwNtQ5BBdUKRXAML386P9xfpDmoszGjxYzZunc9cHiSbn0MsbKwQi4grPy51RHScA5
 uzJJiRt/qGSuikn5BoCTlIu5fw0nvehVW83x+Heyzw3XQWrqysdBpE169Q9KozzM3yd4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhajg-0008RC-CO; Sat, 06 Jun 2020 15:27:52 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhajg-0004nf-5K; Sat, 06 Jun 2020 15:27:52 +0000
Subject: Re: [PATCH v2] build: fix dependency tracking for preprocessed files
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <15a34114-0693-4385-62fa-ad34405b9350@xen.org>
Date: Sat, 6 Jun 2020 16:27:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ec58c0cd-2e39-15bd-a102-fd5b40e5e35d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 05/06/2020 15:22, Jan Beulich wrote:
> While the issue is more general, I noticed that asm-macros.i not getting
> re-generated as needed. This was due to its .*.d file mentioning
> asm-macros.o instead of asm-macros.i. Use -MQ here as well, and while at
> it also use -MQ to avoid the somewhat fragile sed-ary on the *.lds
> dependency tracking files. While there, further avoid open-coding $(CPP)
> and drop the bogus (Arm) / stale (x86) -Ui386.

Good catch! It looks like this was a verbatim copy of the x86 line as I 
can't see any reason why we would need it on Arm.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> v2: Move -MQ ahead on command lines.
> 
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -201,13 +201,13 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y)
>   	$(call if_changed,obj_init_o)
>   
>   quiet_cmd_cpp_i_c = CPP     $@
> -cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
> +cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -MQ $@ -o $@ $<
>   
>   quiet_cmd_cc_s_c = CC      $@
>   cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
>   
>   quiet_cmd_s_S = CPP     $@
> -cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> +cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
>   
>   %.i: %.c FORCE
>   	$(call if_changed,cpp_i_c)
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -123,9 +123,7 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-off
>   	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
>   
>   xen.lds: xen.lds.S
> -	$(CC) -P -E -Ui386 $(a_flags) -o $@ $<
> -	sed -e 's/xen\.lds\.o:/xen\.lds:/g' <.xen.lds.d >.xen.lds.d.new
> -	mv -f .xen.lds.d.new .xen.lds.d
> +	$(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>   
>   dtb.o: $(CONFIG_DTB_FILE)
>   
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -244,9 +244,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
>   
>   efi.lds: AFLAGS-y += -DEFI
>   xen.lds efi.lds: xen.lds.S
> -	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
> -	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
> -	mv -f .$(@F).d.new .$(@F).d
> +	$(CPP) -P $(filter-out -Wa$(comma)%,$(a_flags)) -MQ $@ -o $@ $<
>   
>   boot/mkelf32: boot/mkelf32.c
>   	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
> 

-- 
Julien Grall

