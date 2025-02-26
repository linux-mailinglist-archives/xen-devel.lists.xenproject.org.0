Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A6A46A00
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 19:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897162.1305876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMPf-0000tl-PL; Wed, 26 Feb 2025 18:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897162.1305876; Wed, 26 Feb 2025 18:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnMPf-0000rS-Ml; Wed, 26 Feb 2025 18:45:43 +0000
Received: by outflank-mailman (input) for mailman id 897162;
 Wed, 26 Feb 2025 18:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnMPd-0000rM-N1
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 18:45:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfcbb327-f471-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 19:45:39 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2f3so58607f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 10:45:39 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd882644sm6377693f8f.42.2025.02.26.10.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 10:45:38 -0800 (PST)
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
X-Inumbo-ID: dfcbb327-f471-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740595539; x=1741200339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S2F1GYPZaaPeRghVlseZkbGNGnQY4o/gNiki5/prPDI=;
        b=t7sOoQZ0+g7gb2UPFnl9AARo35JepjaeUAQeR6DnrixzWjYGoZjzbp1QE6DsOR74Og
         EJiG+Q0meGE4AjGILTX7FxK9VA0N2RSrVF7DEOKnIQxKfnVi+IOkbFXfxS5xAX5ypn3d
         Jnja9OttY+qyLIPkVX3nlUatq+4kIXaXGAo8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740595539; x=1741200339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2F1GYPZaaPeRghVlseZkbGNGnQY4o/gNiki5/prPDI=;
        b=POopfRls00/Fo8iP/6KBT5G0v6wOmtJpIZHnfjsW9jwci4VddTnLk49n9UpIzuUyNw
         z1LdRi6EzxxwmwnMSC+J1ynfrUckt+uKx0QjsFofsfiepZzOexFMAXHlFQ4fwxXAVjHA
         /0BuPCtCs/1GH4HEN7+CtXRLTaIXYFPmcWdL82q1jWatvYHu6TMfxQ0H4xUlmgyDuy/k
         9DYRFcForWpDvbgptmjkOtLtk+jzr5OH9m3P+APF7i69mqxk81eICtDvesUOgkxsRH5d
         kHYLB3jZfYhE/5sPV2GHUvzUTAGxAhpfy+6FyTAsAbSGbqBkOMe+oygQWjldjhod6xdU
         giWg==
X-Forwarded-Encrypted: i=1; AJvYcCX8490+PeNrj541kO8kM+VVYTTSnvV4YoUDlsv+j9ub05eOIyoZcaB98iYE9LuDWrrwurecN1maXwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5PsyVfPMOFZTWgflcjYIpt7qmJgzv/JF2+foYk0pBXFdNL8Gg
	I8gRbzp+R71fAINovv3YkXRBhH9LW9EDjV4xYAgl9f79zZoLXHLe1xL6LbAbjAk=
X-Gm-Gg: ASbGncuuBlUVrTyr3tdcm7Mk84uhX146L1WPqTBQNE1LyXAKJXsEr10QJdeyeuXcZbD
	hltAn3xGgE6QgIhp/oQadhc5VEbujGi7Gmap0/iTlvpKzVfumz6nmMCdBVEc7CV+2VURbdOkkzC
	tUP8lmkT+mUNYwXtSWWPprLB14OITO48NwyA9KC7de/jkMwuG5Kzkp/8YRaqU3n+mStiddoh3qe
	v945SFc4O2Xbne9iqfdDySExsZn0Kmulr1ABhRNeu0dDrEyUzUPmwq9y7iEYoVU3b7vViWGECmK
	w03L/I6QwCHpd4IJXbGWpWMBgLTtuGA/sAB/jriEcFki9rxZCmFnZN+Bt1xwFeRKKw==
X-Google-Smtp-Source: AGHT+IG6KeKiKZNzkUJo6ozHD40Rg3Mo0ASzWsTO4fnpD+QPwXiB8BS9yJ5V3UA6PdwCDXsBYEDljg==
X-Received: by 2002:a05:6000:1f87:b0:38f:3224:660b with SMTP id ffacd0b85a97d-38f7079aae3mr16597998f8f.22.1740595539068;
        Wed, 26 Feb 2025 10:45:39 -0800 (PST)
Message-ID: <1dea0c8a-ce6c-40db-8ab6-f3d2a3b1d0dc@citrix.com>
Date: Wed, 26 Feb 2025 18:45:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/ucode: Adjust parse_ucode() to match other list
 handling
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
 <20250225222905.1182374-2-andrew.cooper3@citrix.com>
 <f5a8262d-8397-46b0-83f9-5b597ac322e1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f5a8262d-8397-46b0-83f9-5b597ac322e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 2:30 pm, Jan Beulich wrote:
> On 25.02.2025 23:29, Andrew Cooper wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2721,34 +2721,42 @@ performance.
>>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>>  
>>  ### ucode
>> -> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
>> +> `= List of [ <integer>, scan=<bool>, nmi=<bool> ]`
> While this makes doc fit present behavior, it is the behavior that is wrong.
> It was - afaict - broken by 5ed12565aa32 ("microcode: rendezvous CPUs in NMI
> handler and load ucode"). There should not be both an integer and "scan=".
> (Really we should have taken measures to stay consistent even if multiple
> "ucode=" were on the command line.) You actually say so ...

Yes that changed commit changed the behaviour.  We discussed it during
c25c964634b1 ("x86/ucode: Enforce invariant about module selection").

"Wrong" is more complicated.  Neither behaviour is great, but we need
regular comma separated operations.  (I know I'm deleting nmi= in the
next patch but I need to introduce a new one for the AMD fix).

In the presence of comma separated options, one part being `<integer> |
scan=<bool>` is pointless, because `ucode=1,1,1` is valid, as is
`ucode=scan,scan,scan`, and then all you've got is an overly complicated
description of what is identical to other regular list operations.

For this corner case, it's simply easier to tell the user "don't do
that", which is what we say elsewhere too.

>
>>      Applicability: x86
>>      Default: `scan` is selectable via Kconfig, `nmi=true`
>>  
>> -Controls for CPU microcode loading. For early loading, this parameter can
>> -specify how and where to find the microcode update blob. For late loading,
>> -this parameter specifies if the update happens within a NMI handler.
>> -
>> -'integer' specifies the CPU microcode update blob module index. When positive,
>> -this specifies the n-th module (in the GrUB entry, zero based) to be used
>> -for updating CPU micrcode. When negative, counting starts at the end of
>> -the modules in the GrUB entry (so with the blob commonly being last,
>> -one could specify `ucode=-1`). Note that the value of zero is not valid
>> -here (entry zero, i.e. the first module, is always the Dom0 kernel
>> -image). Note further that use of this option has an unspecified effect
>> -when used with xen.efi (there the concept of modules doesn't exist, and
>> -the blob gets specified via the `ucode=<filename>` config file/section
>> -entry; see [EFI configuration file description](efi.html)).
>> -
>> -'scan' instructs the hypervisor to scan the multiboot images for an cpio
>> -image that contains microcode. Depending on the platform the blob with the
>> -microcode in the cpio name space must be:
>> -  - on Intel: kernel/x86/microcode/GenuineIntel.bin
>> -  - on AMD  : kernel/x86/microcode/AuthenticAMD.bin
>> -When using xen.efi, the `ucode=<filename>` config file setting takes
>> -precedence over `scan`. The default value for `scan` is set with
>> -`CONFIG_UCODE_SCAN_DEFAULT`.
>> +Controls for CPU microcode loading.
>> +
>> +In order to load microcode at boot, Xen needs to find a suitable update
>> +amongst the modules provided by the bootloader.  Two kinds of microcode update
>> +are supported:
>> +
>> + 1. Raw microcode containers.  The format of the container is CPU vendor
>> +    specific.
>> +
>> + 2. CPIO archive.  This is Linux's preferred mechanism, and involves having
>> +    the raw containers expressed as files
>> +    (e.g. `kernel/x86/microcode/{GenuineIntel,AuthenticAMD}.bin`) in a CPIO
>> +    archive, typically prepended to the initrd.
>> +
>> +The `<integer>` and `scan=` options are mutually exclusive and select between
>> +these two options.  They are also invalid in EFI boots (see below).
> ... here.
>
> As to EFI boots: "scan=" ought to be usable there, as long as no "ucode="
> was in the xen.efi config file. I think your code is correct in this regard,
> it's just the wording here which is too strict.

There's still a sharp corner trying that, which is why I didn't address it.

With EFI, there's no order of modules, so `scan` is still ambiguous if
you've got multiple CPIO archives.

>
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -113,11 +113,6 @@ void __init microcode_set_module(unsigned int idx)
>>      ucode_mod_forced = 1;
>>  }
>>  
>> -/*
>> - * The format is '[<integer>|scan=<bool>, nmi=<bool>]'.
> While personally I don't mind the removal, I think back at the time it was
> specifically asked to (also) put it here.

It was stale for the whole time of allow-same=<bool>.  This patch was
originally part of the post-"--force" cleanup series, but I deferred it
because of the unanticipated fixes required for the boot module changes.

~Andrew

