Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD609BE85B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830863.1245952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8f44-0002q4-MZ; Wed, 06 Nov 2024 12:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830863.1245952; Wed, 06 Nov 2024 12:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8f44-0002nj-J9; Wed, 06 Nov 2024 12:23:12 +0000
Received: by outflank-mailman (input) for mailman id 830863;
 Wed, 06 Nov 2024 12:23:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8f43-0002nc-7V
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:23:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df70d5e3-9c39-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:23:04 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso112928366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:23:04 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17f9765sm270940266b.168.2024.11.06.04.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 04:23:03 -0800 (PST)
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
X-Inumbo-ID: df70d5e3-9c39-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRmNzBkNWUzLTljMzktMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk1Nzg0LjkyNjAxNiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730895784; x=1731500584; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eDS24SRiUsnGsNOFS5ATl5qhFwt8KC2C8cK4+9PJLu4=;
        b=U7JVBoitL54PEhVHuAwDER2RoCyxwX6xm2HDiwbt/aCq7PUZXwqKBHsM82npUbBtEL
         ZKFZb/GDc963nj8tHxmCeKLswpya7mJW5V1u2Bxg89aU+JBv4l/ehKpfzw7mTT9BSkXH
         Sje7kjdfaXR2i9O1vO98MlD4ahv/844dRa86A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730895784; x=1731500584;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDS24SRiUsnGsNOFS5ATl5qhFwt8KC2C8cK4+9PJLu4=;
        b=oXL2mOL8B6VjdAq3pJZjID7K4dB62wGTUjIGG4W//7BoI2oMyL0m/CoQaED4a9ajTE
         cRYEhA2uftDVzDMV37zQX/dhmLm8za+O0DHjoujBSludUIL41iJ9bDs2l5TIKVVS8+k6
         NY5raQEmRaoiO4EpoNSv0PDTc8KElQRtLGEXmWGcd5AUfY8AHlkBxAhi7KI3n0xtZXJ+
         z9/uN3egFM2jtiiWuNvtNhDTVIfAncALDgI73EpZ1GqToCprhXzklDJsyxK9IV6cXD1U
         E1fbApbOJMOhBsHNDorutWfbZ1Yb5yBXQKHxd1lb0YJESipjMKCuuYLZs645Wz2m4Nzu
         vyuA==
X-Forwarded-Encrypted: i=1; AJvYcCU9zId0XT+LHfqWx3ZkKLDkOcRujWJ6HRJ2O9OH62NwSUq3p3lpSpfFl072mn+apmPrUUWN3I600p8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDdsKNDK71tHAzlbq7NAEqZNCg/VUCexMfqCX/4PRXrHA+RzDb
	XR7Vsx4toWs7TL8YELFe47gU4/oomKW6A7zX60ZlPTdgGpGVrWHnWSfkB6+GtQg=
X-Google-Smtp-Source: AGHT+IE6lVWhsCvgsdrtDXMb8bYrOUsSlVD3sJnoccB3AObGVJ7Ezn3FJvsDX7EX5554xuwREJAOww==
X-Received: by 2002:a17:907:86a2:b0:a9a:134:9887 with SMTP id a640c23a62f3a-a9de6167ad2mr3641416266b.41.1730895784398;
        Wed, 06 Nov 2024 04:23:04 -0800 (PST)
Message-ID: <8f87849c-916f-4532-a150-3205795c9e43@citrix.com>
Date: Wed, 6 Nov 2024 12:23:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/boot: Fix build with LLVM toolchain
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
 <20241106114150.1432512-4-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241106114150.1432512-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2024 11:41 am, Frediano Ziglio wrote:
> This toolchain generates different object files.
> Object have 3 additional sections which must be handled by the
> linker script.
> Added sections need to have special type so we put them in
> separate sections as linker will copy type from input sections.
>
> Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

The patch itself is fine, but the commit message is quite stale now
you've split the fix into 3 bits.  I'd recommend:

---%<---
x86/boot: Explicitly list .{sym,shstr,str}tab in build32.lds.S

Currently, building with LLVM's LLD fails:

    ld -melf_i386_fbsd  --orphan-handling=error -N -T ...
    ld: error: <internal>:(.symtab) is being placed in '.symtab'
    ld: error: <internal>:(.shstrtab) is being placed in '.shstrtab'
    ld: error: <internal>:(.strtab) is being placed in '.strtab'
    gmake[11]: *** [arch/x86/boot/Makefile:69:
arch/x86/boot/built-in-32.base.bin] Error 1

This is a consequence of --orphan-handling, and it appears that Binutils
doesn't diagnose some orphaned sections even explicitly asked to do so.

List the sections explicitly.

Fixes ...
---%<---

Happy to fix on commit.

~Andrew

