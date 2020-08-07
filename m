Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7723EBB8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 12:57:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4037-0003eK-CQ; Fri, 07 Aug 2020 10:56:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k4036-0003eF-AF
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 10:56:32 +0000
X-Inumbo-ID: 397e11ab-53b2-42c6-abf1-eb1333d29b5c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 397e11ab-53b2-42c6-abf1-eb1333d29b5c;
 Fri, 07 Aug 2020 10:56:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96F20AB3D;
 Fri,  7 Aug 2020 10:56:45 +0000 (UTC)
Subject: Re: [PATCH 3/4] build: also check for empty .bss.* in .o -> .init.o
 conversion
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <c99cf808-0710-51b1-c07c-07bf237e22a3@suse.com>
 <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61481966-3052-ebf2-e23b-aac292cd09a1@suse.com>
Date: Fri, 7 Aug 2020 12:56:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5b2bbc31-0095-c3e2-9e34-20453ea2aa5f@citrix.com>
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 18:16, Andrew Cooper wrote:
> On 06/08/2020 10:05, Jan Beulich wrote:
>> We're gaining such sections, and like .text.* and .data.* they shouldn't
>> be present in objects subject to automatic to-init conversion. Oddly
>> enough for quite some time we did have an instance breaking this rule,
>> which gets fixed at this occasion, by breaking out the EFI boot
>> allocator functions into its own translation unit.
>>
>> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> This likely has a (weak) dependency on "x86/EFI: sanitize build logic"
>> sent several weeks ago, due to the new source file added, as explicit
>> dependencies upon the individual objects in x86/Makefile go away there.
>>
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -355,7 +355,7 @@ $(TARGET): delete-unfresh-files
>>  	$(MAKE) -C tools
>>  	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
>>  	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
>> -	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c runtime.c compat.c efi.h;\
>> +	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
>>  		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
>>  		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
>>  		done; \
> 
> Maybe not for this patch, but we need to start removing this (and other)
> symlinking in the tree for proper out-of-tree builds to work.

Yes, but indeed not right here.

> AFAICT, this logic predates both Kconfig and x86's blur into having EFI
> support in xen.gz.

Yes, it was a result of making parts of that code also usable by Arm64.

> Can't we remove all of this by having CONFIG_XEN_PE expressed/selectable
> properly in Kconfig, and gathering all the objects normally, rather than
> bodging all of common/efi/ through arch/efi/ ?

_If_ we settle on Kconfig to be allowed to check compiler (and linker)
features, then yes. This continues to be a pending topic though, so
the switch can't be made like this at this point in time. (It could be
made a Kconfig item now - which, when enabled, implies the assertion
that a capable tool chain is in use.)

Jan

