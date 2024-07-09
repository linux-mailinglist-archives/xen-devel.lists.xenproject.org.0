Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEF192C0E7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 18:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756430.1165053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDzM-0007e5-AX; Tue, 09 Jul 2024 16:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756430.1165053; Tue, 09 Jul 2024 16:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRDzM-0007bB-7d; Tue, 09 Jul 2024 16:46:48 +0000
Received: by outflank-mailman (input) for mailman id 756430;
 Tue, 09 Jul 2024 16:46:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUMd=OJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRDzK-0007Zs-2L
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 16:46:46 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d35bcb49-3e12-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 18:46:44 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52ea2b6a9f5so5639687e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 09:46:44 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a86ec75sm89143066b.191.2024.07.09.09.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 09:46:43 -0700 (PDT)
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
X-Inumbo-ID: d35bcb49-3e12-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720543604; x=1721148404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QVxBptf+SQEOxCl82lLq0qEmtxAaO0agB8gZ7ab1qlc=;
        b=P07oYf7AuihqLAAi7Zbg1gofBEXPwPIRalvnXrtfXtwUO6kqFGNZ7xR4bHfDTiuFaq
         gOVLRxxXRlUindamksJw6bWaMorMnXyBN5z746jFu3F7ix+50Kl/D6kx7ejVZBJ840gC
         jFVL3d7Czj/Gt08d5hCasnYxkTb/a50pmeMsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720543604; x=1721148404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVxBptf+SQEOxCl82lLq0qEmtxAaO0agB8gZ7ab1qlc=;
        b=fEBLHaqI6F6w4uIaYS9fzihBbMx0DjhbSG+YR2+DKnlQH0Bp+hb/jea04ls3xz3BAf
         xC+0Ei7ZdA4yP619HSW9YqyXIFYz47tCAaKTtlbLgGYQThWAg+Ojk7TeGWIBjTu+cfXO
         0mc53y5eow9pGSibVoT351k31D3J0/Hs8NCfGFPV5d5KlQQb3892oFkp1T9TEyW7vMkb
         mLF8hgx75P/79UcW415OSiciR5QblLFz/Td2gyfRpj1mx9L0aAxo8mFvvLNSSZFfRauc
         roUJc6N05Ut4Vd/ApYqyv74A2bNyUm7nHHxevaMJ4AaKGxYKxgf5j1/L9RcvCEfSIGXd
         8N9A==
X-Gm-Message-State: AOJu0YxpExRRQnwzwsxSttWkplVHvo3+YSmbvfosHJvn+ireNW5B7GkC
	+OH3+QPvzZuJTn1fjl/FV6s5Vi7my+Aeoaaske6BOMbVSgrcJz2pf81wxghIZgM=
X-Google-Smtp-Source: AGHT+IEMjxB1UqviiLp8izcYnEM1EPaozjS3GAlucHcjKOvs2LMmvDkOuK5z0dKi2hA5gk+cp3yQvw==
X-Received: by 2002:ac2:57ce:0:b0:52e:9694:3f98 with SMTP id 2adb3069b0e04-52eb9997b66mr1566014e87.27.1720543604253;
        Tue, 09 Jul 2024 09:46:44 -0700 (PDT)
Message-ID: <18eac439-5d33-41ca-ad78-f19b61f5a379@citrix.com>
Date: Tue, 9 Jul 2024 17:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build system mess in stubdom
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
 <Zo1YdgWj7E4doGEU@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zo1YdgWj7E4doGEU@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/07/2024 4:34 pm, Anthony PERARD wrote:
> On Tue, Jul 09, 2024 at 02:49:57PM +0100, Andrew Cooper wrote:
>> Hello,
>>
>> I'm trying to investigate why stubdom/ is fatally failing now with a
>> rebuilt ArchLinux container (GCC 14).
>>
>> It is ultimately:
>>
>>> ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
>>> implicit declaration of function ‘kill’; did you mean ‘_kill’?
>>> [-Wimplicit-function-declaration]
>>>    61 |   if ((ret = _kill (pid, sig)) == -1 && errno != 0)
>>>       |              ^~~~~
>>> make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1
>> which doesn't make sense, but is a consequence of the ifdefary in
>> newlib/libc/include/_syslist.h
>>
>> However, we've got problems ahead of that.
>>
>> First of all, with:
>>
>> [user@89aef714763e build]$ ./configure --disable-xen --disable-tools
>> --disable-docs
>> <snip>
>> Will build the following stub domains:
>>   xenstore-stubdom
>>   xenstorepvh-stubdom
>> configure: creating ./config.status
>> config.status: creating ../config/Stubdom.mk
>>
>> both a top level `make` and `make stubdom` end up building all of tools,
>> contrary to comments in the makefile.
> :-(, I never noticed that but yeah, that rules is what end up building
> the tools:
>
>     install-stubdom: mini-os-dir install-tools
>
> So unless you use one of the build targets, the top makefile end-up
> wanting to also install (or dist) the tools. I don't think we can change
> that:
>     dc497635d93f ("build system: make install-stubdom depend on install-tools again")

qemu-trad stubdom has been off by default for a bit.  We can probably
delete it entirely before too much longer.

>
>> `make build-stubdom` does (AFAICT) only build stubdom.
> How do you make that works with `./configure --disable-tools` ? I've got
> this:
>     $ make build-stubdom
>     <snip>
>     make -C tools/include build
>     ....tools/include/../../tools/Rules.mk:212: *** You have to run ./configure before building or installing the tools.  Stop.
>     make: *** [Makefile:44: build-tools-public-headers] Error 2

Works for me^W in my random archlinux container...

>
>> However, building just the xenstore stubdoms recursively builds all of
>> tools/libs/ even though only some are needed.  This includes libxl which
>> then recurses further to get tools/libacpi, and libxenguest which
>> recurses further to get libelf from Xen.
> libxl? how? Did you run `make -C stubdom xenstore-stubdom`? Or maybe you
> used ./configure to select only "xenstore-stubdom"? In that later case
> only the build* targets will only build stubdom, the default target as
> well as dist* and install* targets will want to "install-tools" as seen
> above.

again, worked for me like that...

>
>> What I can't figure out is why xenstore ends up pulling in all of newlib.
> I think it's because of these in stubdom/Makefile:
>     xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
>     $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci

:(  More junk that we shouldn't be (re)building just for xenstore.

>> Semi-irrespective, there's no way we can keep on bodging newlib to
>> compile with newer compilers.  There's a whole bunch of other warnings
>> (strict-prototypes, dangling-else, maybe-uninitialized, unused-function,
>> pointer-sign, unused-variable) primed ready to cause breakage in any
>> environment which makes these error by default.
>>
>> I'm going to be making ArchLinux non-blocking because it is a rolling
>> distro, but we also can't do nothing here.
> I guess we could try to update newlib, 1.16 is from 2007 apparently, and
> there's now 4.4 from last year.

Easier said than done.  I've got as far as:

diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index fc736c0387fd..944266bd6dce 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -56,7 +56,7 @@ AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 # Stubdom libraries version and url setup
 AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
 AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9],
[https://mirrors.edge.kernel.org/pub/software/utils/pciutils])
-AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0],
[https://sourceware.org/ftp/newlib])
+AX_STUBDOM_LIB([NEWLIB], [newlib], [4.4.0.20231231],
[https://sourceware.org/ftp/newlib])
 AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0],
[https://download.savannah.gnu.org/releases/lwip])
 AX_STUBDOM_LIB([GRUB], [grub], [0.97], [https://alpha.gnu.org/gnu/grub])
 AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2],
[https://gmplib.org/download/gmp/archive])

and deployed onto xenbits/extfiles, but it's stubbornly refusing to compile.

I need to finish some of the other container work more urgently for 4.19.

~Andrew

