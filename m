Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A3251907
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:50:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYPJ-0002lN-D4; Tue, 25 Aug 2020 12:50:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAYPI-0002lI-4C
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:50:32 +0000
X-Inumbo-ID: 74ff3c73-9cb4-4066-b213-415a803629dd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74ff3c73-9cb4-4066-b213-415a803629dd;
 Tue, 25 Aug 2020 12:50:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AE8FAC50;
 Tue, 25 Aug 2020 12:51:01 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] x86/EFI: sanitize build logic
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <088c088d-d463-05c6-1d17-d682a878e149@suse.com>
 <4614d5de-1125-0c0c-0997-2546bf82a964@suse.com>
 <997f2523-8f0c-1a41-0f1e-bc59d3864766@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6923d0ba-11d9-dae9-f228-b760e29e19f0@suse.com>
Date: Tue, 25 Aug 2020 14:50:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <997f2523-8f0c-1a41-0f1e-bc59d3864766@citrix.com>
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

On 24.08.2020 19:32, Andrew Cooper wrote:
> On 24/08/2020 12:58, Jan Beulich wrote:
>> With changes done over time and as far as linking goes, the only special
>> things about building with EFI support enabled are
>> - the need for the dummy relocations object for xen.gz uniformly in all
>>   build stages,
>> - the special efi/buildid.o file, which can't be made part of
>>   efi/built_in.o, due to the extra linker options required for it.
>> All other efi/*.o can be consumed from the built_in*.o files.
>>
>> In efi/Makefile, besides moving relocs-dummy.o to "extra", also properly
>> split between obj-y and obj-bin-y.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/181365160
> 
> This appears to work.

Almost. efi/relocs-dummy.o also needs similar treatment, or
else it'll get constantly re-built.

> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks. I'm folding in the below incremental change (and a
respective slight adjustment to the description). Please let
me know whether I may keep your ack, of whether you want me to
send v4.

Jan

--- unstable.orig/xen/arch/x86/Makefile
+++ unstable/xen/arch/x86/Makefile
@@ -196,8 +196,6 @@ ifeq ($(call ld-ver-build-id,$(LD) $(fil
 CFLAGS-y += -DBUILD_ID_EFI
 EFI_LDFLAGS += $(build_id_linker)
 note_file := efi/buildid.o
-efi/buildid.o: $(BASEDIR)/arch/x86/efi/built_in.o
-efi/buildid.o: ;
 # NB: this must be the last input in the linker call, because inputs following
 # the -b option will all be treated as being in the specified format.
 note_file_option := -b pe-x86-64 $(note_file)
@@ -236,6 +234,9 @@ $(TARGET).efi: FORCE
 	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
 endif
 
+efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
+efi/buildid.o efi/relocs-dummy.o: ;
+
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
 	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -o $@ $<
 


