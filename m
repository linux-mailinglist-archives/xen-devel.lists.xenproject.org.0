Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5533515D2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 17:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104601.200273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRysw-0000t7-6X; Thu, 01 Apr 2021 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104601.200273; Thu, 01 Apr 2021 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRysw-0000sa-1b; Thu, 01 Apr 2021 15:05:26 +0000
Received: by outflank-mailman (input) for mailman id 104601;
 Thu, 01 Apr 2021 15:05:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRysu-0000sI-Pa
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:05:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRyss-0008Md-Hy; Thu, 01 Apr 2021 15:05:22 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRyss-0004QZ-9J; Thu, 01 Apr 2021 15:05:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MagXW9LQlin9AFJg5UltlAylA3WVoqBWMoQH4QialPc=; b=s3ezXpeV0xGH4lwDtMkEwdEfST
	RFDJcHngZzSLDCln4WNncpkB1AMUi+9IxYF8nmIvWFnVHL6HkuW+aTTCCg0ehiOFiffdLdJEOC6dc
	uDIMNbBjzXYTTSHXi69zjx08N2wdBBvKBe0lfqSFulPF7oPtNBT3vrB3qebELuYdvFp8=;
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <089e3ff0-5633-02b4-baac-328ea8618469@xen.org>
Date: Thu, 1 Apr 2021 16:05:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/04/2021 09:33, Jan Beulich wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -341,7 +341,7 @@ _clean: delete-unfresh-files
>   	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
>   		-o -name "*.gcno" -o -name ".*.cmd" \) -exec rm -f {} \;
>   	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
> -	rm -f include/asm-*/asm-offsets.h
> +	rm -f asm-offsets.s include/asm-*/asm-offsets.h
>   	rm -f .banner
>   
>   .PHONY: _distclean
> @@ -362,7 +362,7 @@ $(TARGET): delete-unfresh-files
>   		done; \
>   		true
>   	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
> -	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) asm-offsets.s
> +	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
>   	$(MAKE) -f $(BASEDIR)/Rules.mk include/asm-$(TARGET_ARCH)/asm-offsets.h
>   	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
>   
> @@ -399,7 +399,11 @@ include/xen/compile.h: include/xen/compi
>   	@sed -rf tools/process-banner.sed < .banner >> $@.new
>   	@mv -f $@.new $@
>   
> -include/asm-$(TARGET_ARCH)/asm-offsets.h: arch/$(TARGET_ARCH)/asm-offsets.s
> +asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
> +	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
> +	$(call move-if-changed,$@.new,$@)
> +
> +include/asm-$(TARGET_ARCH)/asm-offsets.h: asm-offsets.s
>   	@(set -e; \
>   	  echo "/*"; \
>   	  echo " * DO NOT MODIFY."; \
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -131,8 +131,8 @@ $(TARGET)-syms: prelink.o xen.lds
>   		>$(@D)/$(@F).map
>   	rm -f $(@D)/.$(@F).[0-9]*
>   
> -asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
> -	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
> +.PHONY: include
> +include:

 From a generic PoV, this target is meant to generate arch-specific 
include. Is that correct?

Cheers,

-- 
Julien Grall

