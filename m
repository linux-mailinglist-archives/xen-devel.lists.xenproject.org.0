Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4992BBD9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756295.1164855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBEO-0005xH-O7; Tue, 09 Jul 2024 13:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756295.1164855; Tue, 09 Jul 2024 13:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRBEO-0005v6-KW; Tue, 09 Jul 2024 13:50:08 +0000
Received: by outflank-mailman (input) for mailman id 756295;
 Tue, 09 Jul 2024 13:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRBEM-0005sR-CC
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 13:50:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24ea687e-3dfa-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 15:50:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77c25beae1so548361666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 06:50:04 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e058esm79719566b.88.2024.07.09.06.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 06:50:00 -0700 (PDT)
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
X-Inumbo-ID: 24ea687e-3dfa-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720533001; x=1721137801; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpx6L+QT74SUTADoSZM5ZEX2SzQOE8dqA+BPYdgsUW0=;
        b=hP1nySedWS7LE/NHWqQUIf/LbIocphJhyBDfgytP+u3pLs/i0oz8H+R0WVgOkon3V9
         /dLyXfEZuw66hMYBGRD3XX3MUAZHk172YBMjf/AoJV0VYLbtKWB/l9WTOXbnppGUOvGT
         SXeuJU2ATWmpg6KXSyoRlegFlvlqGkDTQ4T6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720533001; x=1721137801;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpx6L+QT74SUTADoSZM5ZEX2SzQOE8dqA+BPYdgsUW0=;
        b=Osjm+3CPhUhOOQXM7ClC/DTsvmAU7lp42TPjLvXXFLTCcqZ+5AZiunNG5qktqd09IV
         E9BvDmnc+b8OnFKkH11Y2EaJfoBURZN6/jkTr0BMCKUAIjsQQ5a1UxfjVRRBIp2ZApXI
         fQYmwYGQpZJLHA9rgwidWDPHqdHxw8CA+hG5/dyDVOMftCpX/iRnC0G6Q0j0IjSGQys7
         Tj2aPVEI4qGtXvGnyVM4rRWCaJ0n7YnKFK5esLFyHuBX50VXEc9I2/XwJrNekG1Ln7Jv
         KOU2rQHnl0cV7ayWiJoEGrAoEwGWMUQgcpXCn1VjWHx/gARSyXyzDProLZD7tbAX6evs
         8ghg==
X-Gm-Message-State: AOJu0YyMNH9zPgzmtgk5frXpmudjIk7qGIPf8ejKeErdtIRYwJHugPcI
	I5pUgdXqat9WgRVh39JcCYoxiCwDXZKKddGKQvLh9sdK9F0Q/bbkunBkP5nGB5m2ElKCViTI0TQ
	t
X-Google-Smtp-Source: AGHT+IF39RC5wH16GFysr3EfMM15BSVUwBEU8a8u7gRiwNJIILzmaSOqYlss0AdaCxM+fHKfuSxm/g==
X-Received: by 2002:a17:906:e8c:b0:a77:da14:83fe with SMTP id a640c23a62f3a-a780b89c995mr144075166b.64.1720533001358;
        Tue, 09 Jul 2024 06:50:01 -0700 (PDT)
Message-ID: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
Date: Tue, 9 Jul 2024 14:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Build system mess in stubdom
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I'm trying to investigate why stubdom/ is fatally failing now with a
rebuilt ArchLinux container (GCC 14).

It is ultimately:

> ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
> implicit declaration of function ‘kill’; did you mean ‘_kill’?
> [-Wimplicit-function-declaration]
>    61 |   if ((ret = _kill (pid, sig)) == -1 && errno != 0)
>       |              ^~~~~
> make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1

which doesn't make sense, but is a consequence of the ifdefary in
newlib/libc/include/_syslist.h

However, we've got problems ahead of that.

First of all, with:

[user@89aef714763e build]$ ./configure --disable-xen --disable-tools
--disable-docs
<snip>
Will build the following stub domains:
  xenstore-stubdom
  xenstorepvh-stubdom
configure: creating ./config.status
config.status: creating ../config/Stubdom.mk

both a top level `make` and `make stubdom` end up building all of tools,
contrary to comments in the makefile.

`make build-stubdom` does (AFAICT) only build stubdom.

However, building just the xenstore stubdoms recursively builds all of
tools/libs/ even though only some are needed.  This includes libxl which
then recurses further to get tools/libacpi, and libxenguest which
recurses further to get libelf from Xen.

What I can't figure out is why xenstore ends up pulling in all of newlib.

Semi-irrespective, there's no way we can keep on bodging newlib to
compile with newer compilers.  There's a whole bunch of other warnings
(strict-prototypes, dangling-else, maybe-uninitialized, unused-function,
pointer-sign, unused-variable) primed ready to cause breakage in any
environment which makes these error by default.

I'm going to be making ArchLinux non-blocking because it is a rolling
distro, but we also can't do nothing here.

~Andrew

