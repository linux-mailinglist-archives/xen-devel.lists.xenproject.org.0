Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D596D64C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 12:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791028.1200795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9w4-0005Ir-BE; Thu, 05 Sep 2024 10:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791028.1200795; Thu, 05 Sep 2024 10:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sm9w4-0005GN-83; Thu, 05 Sep 2024 10:41:56 +0000
Received: by outflank-mailman (input) for mailman id 791028;
 Thu, 05 Sep 2024 10:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sm9w2-0005G7-VE
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 10:41:55 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77682e22-6b73-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 12:41:54 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso3464261a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 03:41:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc544a33sm1061005a12.24.2024.09.05.03.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 03:41:52 -0700 (PDT)
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
X-Inumbo-ID: 77682e22-6b73-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725532913; x=1726137713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7oZz/wXi1GmdYUbRBjOQlkz8zvYwYI7jz6rizHn9+TU=;
        b=W9uX3qHJBkodNm4g8QCy6JJZ+8x+SYefiwJA8vo8xYck4JA5Gj4IQ2U7xUpm7PC+y9
         kGltProFv/EFTIj2Ub3gJaGH/PaSmCK1FjR94ESRojN2l8QEhDBnAq50JX4MwWPas14k
         NUjvUhMK9wcUuca0mMXtuwmUV5U6+eu0vzygM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725532914; x=1726137714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oZz/wXi1GmdYUbRBjOQlkz8zvYwYI7jz6rizHn9+TU=;
        b=jybwSdgMVSRonJSYHnmSjcuXU5+J/Ffi1Bfj7bugMxE1DrFIrW5nl6WaYK7FRNQ1uG
         UnDLZcGBJTv2VeOVTBpBokodTBXuQeUdVYF8mN9jUZlQuBPC2sVlsENgFuLR6Rlso5p8
         EPmgV6HriMLSs0uogdn5/NQflprHjweG0iZAPTy8E+jWsPhAjBexhi69BqEdbvmdL6ru
         QT0EuqlF3NcXWXO87/0u7Wk1vM8XHiihqGk7wsd3Vin7jWaBqQOitZVn03LChKyyF13v
         MfWp7u8+AYbEXJLeD+pVF9IYEE1eNib+9duqoqLqVQnTpbgb/mTA3hc8jool9Gv6IcMc
         O67g==
X-Gm-Message-State: AOJu0YxQjq6SSxfVUtZqqn+Bl44HxHpEEhrtIX3o2FUE0keaD1jGKoYH
	Aq4UiE1ZKNYs9qcA96zHhjNXgYNIADGWXpjnD/WAnow7cDsWhrq1BflUKrm9dmY=
X-Google-Smtp-Source: AGHT+IFRY8EeabrUdM+ESHMpwjuAh/jHfhbXXOv/Tw0kAFW7IsboJq51WeihwPzml+1wAwgzQZv+rQ==
X-Received: by 2002:a05:6402:40c6:b0:5be:c8ad:afd0 with SMTP id 4fb4d7f45d1cf-5c3c1f87c00mr5588308a12.9.1725532912690;
        Thu, 05 Sep 2024 03:41:52 -0700 (PDT)
Message-ID: <39f10864-3fc5-4637-bf2c-4db3f2eb28a7@citrix.com>
Date: Thu, 5 Sep 2024 11:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] x86/HVM: stdvga caching mode
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <4ffb8702-d1b4-4e7d-986c-b03ace9e75ea@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4ffb8702-d1b4-4e7d-986c-b03ace9e75ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2024 11:33 am, Jan Beulich wrote:
> Hello,
>
> I happened to spot a ~14y old revert of the crucial hunk of the ~16y old
> 551ceee97513 ("x86, hvm: stdvga cache always on") in our patch set,
> supposedly to deal with text mode corruption when Linux is booted without
> any "vga=" option, and when - after the GUI is up - the console is
> switched back to one of the text mode ones.
>
> My immediate reaction was that we shouldn't be carrying such privately.
> Yet after some playing with it I'm now at the point where I'm wondering
> why we have that caching mode in the first place. It looks to hardly ever
> come into use:
> 1) As of 68e1183411be ("libxc: introduce a xc_dom_arch for hvm-3.0-x86_32
>    guests") caching mode is disabled from start-of-day, due the disabling
>    being unconditional in hvm/save.c:arch_hvm_load(). That can of course
>    be worked around, but then 2).
> 2) In the course of setting up VGA, REP STOS (maybe REP MOVS) are
>    apparently used by both SeaBIOS and ROMBIOS, as can be derived from
>    stdvga_mem_accept() always hitting the "if ( p->dir == IOREQ_WRITE &&
>    p->count > 1 )" path while BIOS initializes.
>
> Further:
> 3) 551ceee97513 ("x86, hvm: stdvga cache always on") bumped the maximum
>    range of "mapped" VRAM from 64k to 128k, yet without growing vram_page[].
>    Afaict in mode 0 (full 128k accessible at A0000-BFFFF) vram_get{b,l}()
>    now misbehave.
> 4) d1b531631515 ("x86/hvm: unconditionally buffer writes to VRAM") likely
>    went too far (or not far enough) in bypassing write handling, yet then
>    still allowing reads to be serviced from possibly stale cache, when
>    ->stdvga goes first off and later back on, without ->cache changing
>    state.
> 5) 22a1fbb575df ("x86/hvm: make sure stdvga cache cannot be re-enabled")
>    likely went too far. Surely there are cases (VRAM clearing at the very
>    least) after which VRAM state is known again, and hence caching could
>    in principle be re-enabled.
>
> Before I go and try to fix all of the above, I'd like to collect views
> towards simply ripping out that caching mode, vastly simplifying the
> source file in question.

STDVGA caching is primarily (exclusively?) an optimisation for Windows XP.

WinXP was written pre-virt, and wastes an awful lot of time rendering
its boot animation with IN/OUT.

The "caching" (really, putting them in the bufioreq ring, rather than
blocking for qemu on every access) made a good 10-20s improvement in VM
boot performance if memory serves, not to mention dom0 load when booting
multiple VMs in parallel.

But, this wouldn't be the first time its utility has been called into
question, and it's getting harder and harder to justify keeping some
WinXP compatibility around.

~Andrew

