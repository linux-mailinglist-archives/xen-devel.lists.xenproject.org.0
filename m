Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D26AAF604
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 10:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979078.1365785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCwz6-0007ha-Ds; Thu, 08 May 2025 08:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979078.1365785; Thu, 08 May 2025 08:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCwz6-0007ee-Aq; Thu, 08 May 2025 08:52:04 +0000
Received: by outflank-mailman (input) for mailman id 979078;
 Thu, 08 May 2025 08:52:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5q/z=XY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCwz4-0007eW-Ha
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 08:52:02 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b51f6410-2be9-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 10:52:01 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39ee5a5bb66so484316f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 01:52:01 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a0b5b0d349sm4778301f8f.30.2025.05.08.01.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 01:52:00 -0700 (PDT)
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
X-Inumbo-ID: b51f6410-2be9-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746694321; x=1747299121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jzREn0+PSLkNcr/0qXEMCvQkKBRdoXjk3um8+tlfi2c=;
        b=tZtNpaOMCfUX8zsTpJJjJh4rLG84STjQQi70SsD72DrgkJdm+BCLh3oOcGYui3wN/1
         KxSJbmV/U//Hy1DiwM0qy+WqpdduGBcZ0HOK2aco70RU+phmGJwjUJfpWYtph5XuGIFa
         hsDbAH1S5rqV9mBHEthMFHaQWlDsEiaocjYJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694321; x=1747299121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzREn0+PSLkNcr/0qXEMCvQkKBRdoXjk3um8+tlfi2c=;
        b=fV86kthoDHWQAo3K7xLsjMhMBAjiAE9pGYYWFx4gTBg8pjG4BdHoZv0lcWgYR+y69R
         Hi46D1aU1uDTFAt2GwvSUYeKVOHwRi+qA7OCdCDRkt5Kx/7huNvbIXWJR3Ug+mJS+d6A
         Lt8xaMnfUPHLL+tI3EeZGlaiOvp9mh6drY3yHp7cCNGuEhJOai73Qni8/e82xC8guBXS
         ixEnleujJKwJxpfWyWCwiTI6rP+ThETFslKbzuoeD1N6QO4MaSO6dRvc2KgORYPc5nl7
         /prG/OmQ8J0uB6Q2fv9F2vCO023AN8LLr3V7coARTWFSB6RVuomuVROQbgmYXak83gW6
         mNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+OGqwS7kQX/jNOuomCoGGghr5C1+OwlDsLb8XB4kw3K8dFMEtPhoduo1hjWUwtCLqPqGZn8Ib6sY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaHHdM5bozr8WTryLkj9t0jTQKVs0DMZeCbBfFnDUmKWsCE32X
	gQPGPjCbhJMtH5j1eHkleGx/szfgvKfRoQL70umIGl9sb3pWa8m7eq1mbWVVyjk=
X-Gm-Gg: ASbGncu7kAcd3Ea3e8aZeFdsMq9N0Rk+rAJVqISoiHvdos3P4lFtJftYJmQCXBC+Men
	AwX6IxarLf6BnT6T/fdJrfjCgLCLeaxPzEQzdOlEMsGlYSadMIV87xLIeo1tGZ/i/aEYG39rPjD
	vBEo6Db8CdPTgZWDXb1A7b5mItDzII+ObRxRYFPd0mrXlLVWjPItwL/H4XWWQgIpvPbcWDeTsEO
	xK76gD1yvTpFPVRk3dRPJZtyP/UbD2uoIuqJnaBfnyrjXVTdvNAO6vxmy7V5pDIPgJX/4Cj7ClB
	dMYIgM5/MUGciE9RQtoFqun59e4Az/ByRa/x5BlM5ozvJgSbAVikygz0JgnOsJUOxGURwnW5+jR
	tQhD/nQ==
X-Google-Smtp-Source: AGHT+IG8CVIk7eiO3SnDhDYFPi4wTu8w0HiUsXVqIPM+0v4gcSyr7C3GpVxFsu7QHRoGfnvSnS803Q==
X-Received: by 2002:a05:6000:ec6:b0:3a0:b4fa:e594 with SMTP id ffacd0b85a97d-3a0b4fae636mr4734235f8f.33.1746694321026;
        Thu, 08 May 2025 01:52:01 -0700 (PDT)
Message-ID: <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
Date: Thu, 8 May 2025 09:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com,
 Frediano Ziglio <frediano.ziglio@cloud.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250507135442.3439237-1-gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2025 2:54 pm, Gerald Elder-Vass wrote:
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index 24dfecfad184..75aa35870a9a 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -6,11 +6,17 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
>  $(obj)/%.o: $(src)/%.ihex FORCE
>  	$(call if_changed,objcopy_o_ihex)
>  
> +$(obj)/sbat.o: OBJCOPYFLAGS := -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents
> +$(obj)/sbat.o: $(src)/sbat.sbat FORCE
> +	$(call if_changed,objcopy)
> +

Doing a build locally with this, I've found two issues.  One is:

> ld: warning: arch/x86/efi/sbat.o: missing .note.GNU-stack section implies executable stack
> ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
> ld: warning: arch/x86/efi/built_in.o: requires executable stack (because the .note.GNU-stack section is executable)
> ld: warning: arch/x86/built_in.o: requires executable stack (because the .note.GNU-stack section is executable)
> ld: warning: prelink.o: requires executable stack (because the .note.GNU-stack section is executable)
> ld: warning: prelink.o: requires executable stack (because the .note.GNU-stack section is executable)
> ld: warning: prelink.o: requires executable stack (because the .note.GNU-stack section is executable)

which isn't a terribly good look on a "higher security" feature.  The
easiest way to fix this is:

$(obj)/sbat.o: OBJCOPYFLAGS := -I binary -O elf64-x86-64 \
        --rename-section .data=.sbat,readonly,data,contents \
        --add-section .note.GNU-stack=/dev/null

to add the required section.



>  $(obj)/boot.init.o: $(obj)/buildid.o
>  
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
>  
> +EFIOBJ-y += sbat.o

Also,

> ld: warning: orphan section `.sbat' from `prelink.o' being placed in section `.sbat'

This is because sbat.o is getting linked into the non-EFI build of Xen too.

I'm less sure how to go about fixing this.  There's no nice way I can
see of of getting sbat.o only in the EFI build.  The other option is to
discard it for the ELF build.

~Andrew

