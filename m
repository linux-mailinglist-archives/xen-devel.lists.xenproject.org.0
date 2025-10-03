Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F918BB63BE
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 10:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136412.1472991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4b7J-0000K0-27; Fri, 03 Oct 2025 08:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136412.1472991; Fri, 03 Oct 2025 08:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4b7I-0000H7-Un; Fri, 03 Oct 2025 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1136412;
 Fri, 03 Oct 2025 08:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TaDF=4M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v4b7H-0000Gu-3p
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 08:26:15 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f9342da-a032-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 10:26:13 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so77651766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 01:26:13 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869c4e613sm374865266b.81.2025.10.03.01.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 01:26:12 -0700 (PDT)
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
X-Inumbo-ID: 9f9342da-a032-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759479973; x=1760084773; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8dgrE8RnUvpB2yLgSN82P7JF7zcPrb7JwU4O3cfKbM=;
        b=GoV3IZ4ZoU6LAXgy0SzOQGSYdhhsNz/FZPrFkg6gRkJ34htOZ3ndTxuXEq25fIXF7b
         pIaAX7rQ8ApmYyIu8dRT4jnHNr2PRMjQF4VptVNT1bF1Wij92R6fdIIkMJnUI5QnJTVQ
         gIxHGavfajvcT6ZpxVp6SSNY/5QPsY082AlMIKqnpTftgzQZCxi3Kw9ZC5PtSE0YsUW0
         mQCJKR8/sYPVXCBqfcdYkrCyoD+g8b8EQmLQQCSl86MrhTVmawk0gn53NDhmgi2HovIn
         /MNuk48+nI4fdR1AO9EycBkyd2Q8uo7JSok2deYPK8qWACIjH8jkgK2blPC50rtR7FeY
         IK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759479973; x=1760084773;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8dgrE8RnUvpB2yLgSN82P7JF7zcPrb7JwU4O3cfKbM=;
        b=LV0Wt+hWoHs/EujmYMZd2dN3VpVhjKXT0FXdpzIEpAYO6D//8PKo8n9iQp0rb6y+Ws
         shKyCj7cfMUdEyZEhYt1Bng1mA5geFsH+Ql2D8nRJPNl1dOCjjBqTU9ijacbj1byala0
         itHSG3JzC5FQM0nTpLRIv9vCtbdZuOY66gQrdITWZ/21/1eNRhbBjP7Itjm/BYX3xuuf
         dGqHbRc9YUGgdhSJKsaYoadgeQv/9IhTn2lapJcLBp5R38bVb5tMDys5yZoXJKkS2ebe
         3EH9dxx7S7YFX8hwsdCsCHYpOBTCa6+DClSm+H+0OS86SdMb53CBeSOD93J1HYBlJLCH
         nWyg==
X-Gm-Message-State: AOJu0YxRfbHwmmZcIawCeyj/WT8YWoo56XcWCT0oljgUZcVfr8ChO8JY
	vzdj9y+qaqHMaS55nitZ7fSE4ADHzE+pD8YvALhD6JhhTBKsLWJ0BTb2
X-Gm-Gg: ASbGncttrOTzF+623i+ZsS7WhLHne5Aj5m8ajTbyut65vgLV4S/+PmZezsz3rtl7WEz
	BG5OQbj44Eu0nHBGRGl9s8X1PVMPI19M2Ga1sUsRKukcniaO6OaAzhLEZnUfHGVwpG3YhS28kc3
	zKBB+/OAMcYGscpJZ/5G6aTPH2dQXboVPl/HodtwkOXlvfDn0VFcndeIXgTMZUCWw8GYDgUk67V
	GPvn3chXktIENeYkwxuAeLi7YrYLsQWU9KRcooeVu3c1h2Chor6iG9OV4nK+O17D+wxnXz1OpZs
	RPbGRoRQq8rJgl7ep9ntkzOWCa6z1ZAWH3OFhk+ndbYAMj7GKrGdxgdJk0UIOx5mAg7XSANNm+p
	0AS8rJCiu+oWDXXiqWeVO/ex2/pm/d3PsKu1W8/CNVqgzU5xDPwaw8+vkd9xLMLAtNLgf3BVvrJ
	30DIXtVe+F6UNKWrHNUX3X4qka
X-Google-Smtp-Source: AGHT+IE3dTsnrv+suDIEF4L6UOp29lPLURthHw+vsaVkKojQILa5vVh6kfxoL1kHVROGIwVYl3hxDQ==
X-Received: by 2002:a17:907:9448:b0:b46:cc3b:65fd with SMTP id a640c23a62f3a-b49c1063f9amr257872666b.29.1759479972464;
        Fri, 03 Oct 2025 01:26:12 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------3pDvI0JuZacuPai7Mn2ifgHO"
Message-ID: <72f24594-dcd4-4189-9408-343d03b57eee@gmail.com>
Date: Fri, 3 Oct 2025 10:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
 <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com> <aN6H8dOlea2Um8y8@mail-itl>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aN6H8dOlea2Um8y8@mail-itl>

This is a multi-part message in MIME format.
--------------3pDvI0JuZacuPai7Mn2ifgHO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/25 4:10 PM, Marek Marczykowski-Górecki wrote:
> On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
>> On 12/06/2025 11:07 am, Frediano Ziglio wrote:
>>> For xen.gz file we strip all symbols and have an additional
>>> xen-syms file version with all symbols.
>>> Make xen.efi more coherent stripping all symbols too.
>>> xen.efi.elf can be used for debugging.
>>>
>>> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>
> Generally,
> Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>
> But this may want a line in CHANGELOG.md, just for a little more
> visibility for people packaging Xen, as it may affect what should be
> included in debuginfo sub-package.

Good point.
I can add a line in CHANGELOG.md if a new version of
"[PATCH v2] CHANGELOG.md: Update for 4.21 release cycle" will be needed.

>
>>> ---
>>> Changes since v1:
>>> - avoid leaving target if some command fails
>> CC-ing the EFI maintainers, as this is an EFI change.
> Thanks. I did noticed the patch independently, but only a few minutes
> earlier due to missing CC...
>
>> At the recent QubesOS hackathon, Michał Żygowski (3mdeb) found that
>> stripping Xen was the difference between the system booting and not.
>>
>> With debugging symbols, xen.efi was ~32M and is placed above the 4G
>> boundary by the EFI loader, hitting Xen's sanity check that it's below 4G.
>>
>> Xen does still have a requirement to live below the 4G boundary.  At a
>> minimum, idle_pg_table needs to be addressable with a 32bit %cr3, but I
>> bet that isn't the only restriction we have.

I think the last two paragraphs should be part of the commit message, as they
clarify why these changes started to be needed in the first place.

>>
>> So, either we find a way of telling the EFI loader (using PE+ headers
>> only) that we require to be below 4G (I have no idea if this is
>> possible), or we strip xen.efi by default.

IMO, it should be preferable solution then stripping ...

>>
>> I don't think making Xen.efi safe to operate above the 4G boundary is a
>> viable option at this point.
>>
>> As Xen's defaults are broken on modern systems, this is also a bugfix
>> candidate for 4.21, so CC Oleksii.
> I agree with this wanting to be considered for 4.21.

... but if it is not clear at the moment how to instruct the EFI loader to
load below 4G, then I am okay with this solution and it should be part of 4.21:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
>> ~Andrew
>>
>> (Retaining full patch for those CC'd into the thread)
>>
>>> ---
>>>   docs/misc/efi.pandoc  |  8 +-------
>>>   xen/Kconfig.debug     |  9 ++-------
>>>   xen/Makefile          | 19 -------------------
>>>   xen/arch/x86/Makefile |  8 +++++---
>>>   4 files changed, 8 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>>> index 11c1ac3346..c66b18a66b 100644
>>> --- a/docs/misc/efi.pandoc
>>> +++ b/docs/misc/efi.pandoc
>>> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>>>   Once built, `make install-xen` will place the resulting binary directly into
>>>   the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>>>   `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
>>> -match your system). When built with debug info, the binary can be quite large.
>>> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
>>> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
>>> -to any combination of options suitable to pass to `strip`, in case the default
>>> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
>>> -unless `EFI_DIR` is set in the environment to override this default. This
>>> -binary will not be stripped in the process.
>>> +match your system).
>>>   
>>>   The binary itself will require a configuration file (names with the `.efi`
>>>   extension of the binary's name replaced by `.cfg`, and - until an existing
>>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>>> index d14093017e..cafbb1236c 100644
>>> --- a/xen/Kconfig.debug
>>> +++ b/xen/Kconfig.debug
>>> @@ -147,12 +147,7 @@ config DEBUG_INFO
>>>   	  Say Y here if you want to build Xen with debug information. This
>>>   	  information is needed e.g. for doing crash dump analysis of the
>>>   	  hypervisor via the "crash" tool.
>>> -	  Saying Y will increase the size of the xen-syms and xen.efi
>>> -	  binaries. In case the space on the EFI boot partition is rather
>>> -	  limited, you may want to install a stripped variant of xen.efi in
>>> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
>>> -	  docs/misc/efi.pandoc for more information - when not using
>>> -	  "make install-xen" for installing xen.efi, stripping needs to be
>>> -	  done outside the Xen build environment).
>>> +	  Saying Y will increase the size of the xen-syms and xen.efi.elf
>>> +	  binaries.
>>>   
>>>   endmenu
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 8fc4e042ff..664c4ea7b8 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -488,22 +488,6 @@ endif
>>>   .PHONY: _build
>>>   _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>>>   
>>> -# Strip
>>> -#
>>> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
>>> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
>>> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
>>> -# option(s) to the strip command.
>>> -ifdef INSTALL_EFI_STRIP
>>> -
>>> -ifeq ($(INSTALL_EFI_STRIP),1)
>>> -efi-strip-opt := --strip-debug --keep-file-symbols
>>> -else
>>> -efi-strip-opt := $(INSTALL_EFI_STRIP)
>>> -endif
>>> -
>>> -endif
>>> -
>>>   .PHONY: _install
>>>   _install: D=$(DESTDIR)
>>>   _install: T=$(notdir $(TARGET))
>>> @@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>>>   		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
>>>   		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>>>   		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
>>> -			$(if $(efi-strip-opt), \
>>> -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
>>> -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>>>   			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>>>   		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
>>>   			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
>>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>>> index ce724a9daa..e0ebc8c73e 100644
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -232,14 +232,16 @@ endif
>>>   	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>>>   	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>>>   	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
>>> -	      $(note_file_option) -o $@
>>> -	$(NM) -pa --format=sysv $@ \
>>> +	      $(note_file_option) -o $@.tmp
>>> +	$(NM) -pa --format=sysv $@.tmp \
>>>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>>   		> $@.map
>>>   ifeq ($(CONFIG_DEBUG_INFO),y)
>>> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
>>> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@.tmp $@.elf
>>> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
>>>   endif
>>>   	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>>> +	mv -f $@.tmp $@
>>>   ifeq ($(CONFIG_XEN_IBT),y)
>>>   	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>>>   endif
--------------3pDvI0JuZacuPai7Mn2ifgHO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/2/25 4:10 PM, Marek
      Marczykowski-Górecki wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aN6H8dOlea2Um8y8@mail-itl">
      <pre wrap="" class="moz-quote-pre">On Thu, Oct 02, 2025 at 02:05:56PM +0100, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 12/06/2025 11:07 am, Frediano Ziglio wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">For xen.gz file we strip all symbols and have an additional
xen-syms file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen.efi.elf can be used for debugging.

Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Generally,
Reviewed-by: Marek Marczykowski-Górecki <a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>

But this may want a line in CHANGELOG.md, just for a little more
visibility for people packaging Xen, as it may affect what should be
included in debuginfo sub-package.</pre>
    </blockquote>
    <pre>Good point.
I can add a line in CHANGELOG.md if a new version of
"[PATCH v2] CHANGELOG.md: Update for 4.21 release cycle" will be needed.

</pre>
    <blockquote type="cite" cite="mid:aN6H8dOlea2Um8y8@mail-itl">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">---
Changes since v1:
- avoid leaving target if some command fails
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
CC-ing the EFI maintainers, as this is an EFI change.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks. I did noticed the patch independently, but only a few minutes
earlier due to missing CC...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">At the recent QubesOS hackathon, Michał Żygowski (3mdeb) found that
stripping Xen was the difference between the system booting and not.

With debugging symbols, xen.efi was ~32M and is placed above the 4G
boundary by the EFI loader, hitting Xen's sanity check that it's below 4G.

Xen does still have a requirement to live below the 4G boundary.  At a
minimum, idle_pg_table needs to be addressable with a 32bit %cr3, but I
bet that isn't the only restriction we have.</pre>
      </blockquote>
    </blockquote>
    <pre>I think the last two paragraphs should be part of the commit message, as they
clarify why these changes started to be needed in the first place.

</pre>
    <blockquote type="cite" cite="mid:aN6H8dOlea2Um8y8@mail-itl">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

So, either we find a way of telling the EFI loader (using PE+ headers
only) that we require to be below 4G (I have no idea if this is
possible), or we strip xen.efi by default.</pre>
      </blockquote>
    </blockquote>
    <pre>IMO, it should be preferable solution then stripping ...
</pre>
    <blockquote type="cite" cite="mid:aN6H8dOlea2Um8y8@mail-itl">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

I don't think making Xen.efi safe to operate above the 4G boundary is a
viable option at this point.

As Xen's defaults are broken on modern systems, this is also a bugfix
candidate for 4.21, so CC Oleksii.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I agree with this wanting to be considered for 4.21.</pre>
    </blockquote>
    <pre>... but if it is not clear at the moment how to instruct the EFI loader to
load below 4G, then I am okay with this solution and it should be part of 4.21:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite" cite="mid:aN6H8dOlea2Um8y8@mail-itl">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">~Andrew

(Retaining full patch for those CC'd into the thread)

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">---
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 19 -------------------
 xen/arch/x86/Makefile |  8 +++++---
 4 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 11c1ac3346..c66b18a66b 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
 `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
-match your system). When built with debug info, the binary can be quite large.
-Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
-of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
-to any combination of options suitable to pass to `strip`, in case the default
-ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
-unless `EFI_DIR` is set in the environment to override this default. This
-binary will not be stripped in the process.
+match your system).
 
 The binary itself will require a configuration file (names with the `.efi`
 extension of the binary's name replaced by `.cfg`, and - until an existing
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d14093017e..cafbb1236c 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -147,12 +147,7 @@ config DEBUG_INFO
 	  Say Y here if you want to build Xen with debug information. This
 	  information is needed e.g. for doing crash dump analysis of the
 	  hypervisor via the "crash" tool.
-	  Saying Y will increase the size of the xen-syms and xen.efi
-	  binaries. In case the space on the EFI boot partition is rather
-	  limited, you may want to install a stripped variant of xen.efi in
-	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
-	  docs/misc/efi.pandoc for more information - when not using
-	  "make install-xen" for installing xen.efi, stripping needs to be
-	  done outside the Xen build environment).
+	  Saying Y will increase the size of the xen-syms and xen.efi.elf
+	  binaries.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index 8fc4e042ff..664c4ea7b8 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -488,22 +488,6 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
-# Strip
-#
-# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
-# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
-# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
-# option(s) to the strip command.
-ifdef INSTALL_EFI_STRIP
-
-ifeq ($(INSTALL_EFI_STRIP),1)
-efi-strip-opt := --strip-debug --keep-file-symbols
-else
-efi-strip-opt := $(INSTALL_EFI_STRIP)
-endif
-
-endif
-
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
-			$(if $(efi-strip-opt), \
-			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi &amp;&amp; \
-			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) &amp;&amp; pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' &gt;&amp;2; \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..e0ebc8c73e 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -232,14 +232,16 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $&lt; \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $@.tmp
+	$(NM) -pa --format=sysv $@.tmp \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		&gt; $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@.tmp $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
+	mv -f $@.tmp $@
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------3pDvI0JuZacuPai7Mn2ifgHO--

