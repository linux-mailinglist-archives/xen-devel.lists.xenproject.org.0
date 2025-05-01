Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA95AA5DCC
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 13:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974093.1362045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uASBG-00017F-S6; Thu, 01 May 2025 11:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974093.1362045; Thu, 01 May 2025 11:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uASBG-00014s-PJ; Thu, 01 May 2025 11:34:18 +0000
Received: by outflank-mailman (input) for mailman id 974093;
 Thu, 01 May 2025 11:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tswP=XR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uASBG-00014m-4M
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 11:34:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 361fb746-2680-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 13:34:15 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so4354265e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 04:34:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89ee593sm9265045e9.24.2025.05.01.04.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 04:34:14 -0700 (PDT)
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
X-Inumbo-ID: 361fb746-2680-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746099255; x=1746704055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEdQ3ByOwkoF4QKCQHEC3B2txafqBdWMtqsoaB/Ux+w=;
        b=Q2Kia0TboOIShKBYu2hDif2CdoB6iKCNJlVGKsKp/C7LjCoqTe+UshDAISRMz+l3oM
         JbB0FRIPZJaklki+VzUPstVh87P74guyUkki7YmBFHITNdSjgOwGfxdM/LU80/fKuMfx
         Vk86dy5jTmbm1p32bZgJEWma7/Fn1TxiNnq1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746099255; x=1746704055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEdQ3ByOwkoF4QKCQHEC3B2txafqBdWMtqsoaB/Ux+w=;
        b=jSYNVIBvn6zihtZrawRRWRZtEVmg7tJa0aWyGn2i7BYJ6JKJASuLhSqcrkDtqr/NKr
         8RMYYhu22GwcIV8TNRDDdYH/MNzz0KdA0tAkL7rxdy+8V+EsGqDOCliqf2Q1HWnGXJHz
         FWgJbSF5Z5sworrXiI1xUDWGefJx9Ir+Ozh1x6erRH8AeUqXfPOGW8sKY1+hthT/648E
         zRXa4f/6oxZnI1eKaRtSwjmg3DlWsuijQH8Y1spoXE12KNjzKVKTUezR5sYlkz6pzIvY
         UCnk8lnsvezHPHugrhtfjMQX8zUTkCNEUW5uBFkyIGBBDLDw6OHkIQPrDKbo+atXu6eu
         RyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJCVeuARjhGmOk9XwoeikzU4Hu38zzTaHcuqkMgqB/fZmUkot+2Xcpgo6wnJSLzlbuQxegX5gq6W0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCPPVlIPRrBy5Giuj7wTUA0kIQg8oRKu0N90ohu/zgbmQXytzc
	GGle5uagavJKRZbO9hcydiniiscLCOYYx+8BiY/djketLQdSBLTNQvqU2VyqgOA=
X-Gm-Gg: ASbGnctaXC7ykgchddkjWwWh8Hlg4ad5KV3JtUNfbKkcTflO2GY1brDnPaUyhjS8UTd
	NofW4pfHlC/Z7J+UUkr1f1QPII6LstoFBHU6eiVmQuDferkAY/awZwvzFaIj00BoAdSn6cxFzxz
	xB9b735qxe7nAiaaycWf9VrIhj/StMNcgfLzZcGooA0eF+SxaEhtWvy/G94Ngid4XexrkudhYQN
	PryZLk2QmOG/wiR5+2tIf2jLtcaCFNSAq0LEHKqQEJz81x5e2aZeO1HQsr1k9tLL0McH9cDi6la
	wkhFXyg1s0t80YZ9AFQ6f9kake/ZV2HCvYyXzogaVVZt+xl5djlKfNESOZCrtfFqNBEFzMZ/hTm
	N1ScArA==
X-Google-Smtp-Source: AGHT+IE+M5d3ClIg349LNn1yOx6YyRb/FYe/hKGasqqv1fM9MmMgvF3z6N83BNJDtw5tTnvQutC87Q==
X-Received: by 2002:a05:600c:1e87:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-441b7044ec7mr15670265e9.25.1746099254941;
        Thu, 01 May 2025 04:34:14 -0700 (PDT)
Message-ID: <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>
Date: Thu, 1 May 2025 12:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] sbat: Add SBAT section to the xen binary
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250501104925.228351-1-gerald.elder-vass@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250501104925.228351-1-gerald.elder-vass@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/05/2025 11:49 am, Gerald Elder-Vass wrote:
> The SBAT section provides a way for the binary to declare a generation
> id for its upstream source and any vendor changes applied. A compatible
> loader can then revoke vulnerable binaries by generation, using the
> binary's declared generation id(s) to determine if it is safe to load.
>
> More information about SBAT is available here:
> https://github.com/rhboot/shim/blob/main/SBAT.md
>
> Vendors should append a custom line onto sbat.csv(.in) with their vendor
> specific sbat data.
>
> Populate the SBAT section in the Xen binary by using the information
> in xen/arch/x86/sbat.csv.in
>
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>

Thankyou for starting to post these patches.

The commit message needs that SBAT is a revocation scheme for UEFI
SecureBoot, and mandatory now if you want to get signed by Microsoft. 
This wants to be the first sentence, IMO.

That in turn also explains why it's in the EFI binary only, and
discarded from the ELF binary.

> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index d902fb7accd9..6db7475c2c23 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -74,6 +74,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
>  obj-y += hpet.o
>  obj-y += vm_event.o
>  obj-y += xstate.o
> +obj-y += sbat_data.o

These should be sorted by file name (although hpet.o is clearly out of
order here).

Where possible, please use dash rather than underscore in filenames,
although in this case I'd shorten it to just sbat.o and bypass that problem.

>  
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
> @@ -277,6 +278,12 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>  	$(call if_changed_dep,cpp_lds_S)
>  
> +$(obj)/sbat.csv: $(src)/sbat.csv.in
> +	sed "s/@@VERSION@@/${XEN_FULLVERSION}/" $< > $@
> +
> +$(obj)/sbat_data.o: $(obj)/sbat.csv
> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents $< $@
> +
>  clean-files := \
>      include/asm/asm-macros.* \
>      $(objtree)/.xen-syms.[0-9]* \
> diff --git a/xen/arch/x86/sbat.csv.in b/xen/arch/x86/sbat.csv.in
> new file mode 100644
> index 000000000000..7cdc33dbd998
> --- /dev/null
> +++ b/xen/arch/x86/sbat.csv.in
> @@ -0,0 +1,2 @@
> +sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
> +xen,1,Linux Foundation,xen,@@VERSION@@,https://xenproject.org/

I know this is what the SBAT spec says to do, but it's unworkable.

Upstream Xen cannot state or maintain a global generation ID on behalf
of it's downstreams.  This is true in general, not just for Xen.

For us (XenServer), this needs to be a line starting xen.xenserver,
because we (and only we) know how our Xen is built and configured. 
Every other downstream will need to do the same.

So, either we want just the SBAT line an nothing else, or we want some
kind of "to be filled in by the OSV" info, to make it clear that people
need to alter it.

When UEFI SecureBoot becomes security supported, the security team
probably wants to note in XSAs whether the issue constitutes a breach of
UEFI-SB, and remind downstreams to bump their generation IDs.

~Andrew

