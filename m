Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDDB5304D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119999.1465110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfRX-0004TV-4s; Thu, 11 Sep 2025 11:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119999.1465110; Thu, 11 Sep 2025 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfRX-0004RA-1y; Thu, 11 Sep 2025 11:26:23 +0000
Received: by outflank-mailman (input) for mailman id 1119999;
 Thu, 11 Sep 2025 11:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwfRV-0004R4-Ba
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:26:21 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23e4289d-8f02-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 13:26:20 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3e07ffffb87so334650f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 04:26:20 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e760786c95sm2182450f8f.17.2025.09.11.04.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:26:19 -0700 (PDT)
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
X-Inumbo-ID: 23e4289d-8f02-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757589980; x=1758194780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LgUD10XgMjlx4sSop+a3xfy6O4s1Zq45/17JnlrCfy0=;
        b=A13rC248+b8wPzS4O+UHGqejsQoA/JpSz1IiPcCgtPLnnlQ0ojRqJY6n+FHNK0IOJS
         VaYohDNHF7rT5nMx4mtgnIPqKcZatLUvwIaBCoh/DFYJYu7xXIiztA/jr8rIh37Foxxr
         +Gw7VQdKpLQ1OTe1tV+X3VEIpVKtiwFo113/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589980; x=1758194780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgUD10XgMjlx4sSop+a3xfy6O4s1Zq45/17JnlrCfy0=;
        b=QDZSU0kkiipVDvVOivzg6Acs6Uy+HOQyxMYPW+Q1SrTgMkXE08e9g9GFs+Oo+oU7EM
         +d355RmEsunox7VaQyU6eqxFTteqFFpHzKilP+2bbVKl30bSVa2bGVo8brVS4sR8PLLj
         7OqrZA+8ehY1sA2U15/pxM8UBgEONHV5Mdf6+JpedfqUT/LMLvnJEsKM8vGGZIE4oMT6
         9bTLA/LYtrDclsWSFybU5rlSAaLbu3ccUzwsuFZxPAcdLEyjFfqJ5zg1wgvPl+ZWiZzi
         k11miznBD5yYvRr6DAM40dBhwGwlK7LJG0HfbZlfNMmhyyHCTMN8bfpqeBOl8ci8BUAS
         cd9g==
X-Gm-Message-State: AOJu0YwjRxSUlAHU97jhQbIrufJYJIQaxJbKN9Orb/aEXm9TYfD+xq1/
	xDnOhKmEg5HWuwQ7iKrTQ4P4EAm4pJ+7zhVvTbSqyOVkgB1sEZ3xBXXkjun6ALGDVXM=
X-Gm-Gg: ASbGnctoLmHbkKPWbtBv5lRvlJSE8KGLTVW/2onXBeMpKvDXpIMM1xVuN0pvCEo8QGz
	g/GyC7uWvyRaMcsWUpC5R7UVSTIUZNlPSgUyWQ4YPgIcHwq3ns8TRukbN0KDKLpgCQ6t44i8HH4
	6jeS8ACk4gfTMvBIIvLBokHK3g64ew8SkBeSQVhZIEuK0yCH3q01nUnqEyyV+CYy0ztYsSUplUl
	DqmLztPf5PkrWt0a+cYHj3WSS+YX7T2Vqkc1GPeLDX3ARPiLEwKw5qRbf9hNQsFLsrA53Y7/Oli
	t1B7Se5zkm99pi0xXwRTJLQLbftxhgZ7UE/XjxXvMq30B15+eK4fpHc3Zf5mTQglRUZh2X8y6Jz
	jlnzrua9MNABP9LyHUQTYXpietUc19oMZs/z9tO9XpkKTr8SYv1D1Osv/IE2s+Ebf/J2EAiR1Xg
	CKyIY=
X-Google-Smtp-Source: AGHT+IH5Dq6jeeKZcCYmxSP0YqtEsAsY63UOCILA04X0me8LgHaovKBBqKPMvpOC94haMCjQKnGySQ==
X-Received: by 2002:a05:6000:26d3:b0:3e7:6367:2bc6 with SMTP id ffacd0b85a97d-3e763673233mr802745f8f.56.1757589979799;
        Thu, 11 Sep 2025 04:26:19 -0700 (PDT)
Message-ID: <e88d0473-7abe-4f74-961c-3c412cc20573@citrix.com>
Date: Thu, 11 Sep 2025 12:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] CI: Update x86 to use Debian Trixie
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
 <20250910222313.1858941-3-andrew.cooper3@citrix.com>
 <aMI8zFt8MRVT2NvP@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aMI8zFt8MRVT2NvP@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2025 4:06 am, Marek Marczykowski-Górecki wrote:
> On Wed, Sep 10, 2025 at 11:23:12PM +0100, Andrew Cooper wrote:
>> diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
>> new file mode 100644
>> index 000000000000..20e9d2f3f52d
>> --- /dev/null
>> +++ b/automation/build/debian/13-x86_64.dockerfile
>> @@ -0,0 +1,76 @@
>> +# syntax=docker/dockerfile:1
>> +FROM --platform=linux/amd64 debian:trixie-slim
>> +LABEL maintainer.name="The Xen Project"
>> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
>> +
>> +ENV DEBIAN_FRONTEND=noninteractive
>> +
>> +RUN <<EOF
>> +#!/bin/bash
>> +    set -eu
>> +
>> +    useradd --create-home user
>> +
>> +    apt-get update
>> +
>> +    DEPS=(
>> +        # Xen
>> +        bison
>> +        build-essential
>> +        checkpolicy
>> +        clang
>> +        flex
>> +
>> +        # Tools (general)
>> +        ca-certificates
>> +        git-core
>> +        pkg-config
>> +        wget
>> +        # libxenguest dombuilder
>> +        libbz2-dev
>> +        liblzma-dev
>> +        liblzo2-dev
>> +        libzstd-dev
>> +        zlib1g-dev
>> +        # libacpi
>> +        acpica-tools
>> +        # libxl
>> +        uuid-dev
>> +        libnl-3-dev
>> +        libyajl-dev
>> +        # RomBIOS
>> +        bcc
>> +        bin86
>> +        # xentop
>> +        libncurses5-dev
>> +        # Python bindings
>> +        python3-dev
>> +        python3-setuptools
>> +        # Golang bindings
>> +        golang-go
>> +        # Ocaml bindings/oxenstored
>> +        ocaml-nox
>> +        ocaml-findlib
>> +
>> +        # for test phase, qemu-smoke-* jobs
>> +        expect
>> +        qemu-system-x86
> qemu-smoke-* remain at debian:12 here.

Oh, that was an oversight.  And I missed in in RISC-V.


>  And IIUC the plan is to split
> build and test containers, so those dependencies are not needed here.

I maybe didn't phrase the comment very well, but the split I intended
was the hardware-running containers vs everything else.

What the hardware containers need is almost disjoint with everything else.

>
>> +        # for build-each-commit-gcc
>> +        ccache
>> +
>> +        # for qemu-alpine-x86_64-gcc
>> +        busybox-static
> Same comment as above, but ...
>
>> +        cpio
> ... this should remain, and likely moved to "Tools (general)" section.

Hmm, probably yes, although I'll do that as a prep patch and fix all the
impacted containers.

>
>> +
>> +        # For *-efi jobs
>> +        ovmf
> And this one too.

Tools general?  I don't think so, no.

But we probably should have a combined section for qemu based testing
and call it done.  This is overly fine-grained IMO.

~Andrew

