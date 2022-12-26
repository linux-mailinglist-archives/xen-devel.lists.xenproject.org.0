Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150F656758
	for <lists+xen-devel@lfdr.de>; Tue, 27 Dec 2022 06:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469307.728696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pA2Qy-0000kX-Ul; Tue, 27 Dec 2022 05:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469307.728696; Tue, 27 Dec 2022 05:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pA2Qy-0000hF-Qp; Tue, 27 Dec 2022 05:23:28 +0000
Received: by outflank-mailman (input) for mailman id 469307;
 Mon, 26 Dec 2022 19:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gpDW=4Y=gmail.com=andrzejhochul1990@srs-se1.protection.inumbo.net>)
 id 1p9tcJ-0001hk-Pf
 for xen-devel@lists.xen.org; Mon, 26 Dec 2022 19:58:36 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac1aca4b-8557-11ed-91b6-6bf2151ebd3b;
 Mon, 26 Dec 2022 20:58:33 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id l29so9501019edj.7
 for <xen-devel@lists.xen.org>; Mon, 26 Dec 2022 11:58:31 -0800 (PST)
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
X-Inumbo-ID: ac1aca4b-8557-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YhT0wZgtYkRY0xJNVj5i4pw2O4qOe0HKSMyJxgnhxhE=;
        b=MPBk/6p1Qw5Fc50IM6U55PQBo5oHaV4h7rIvKZ51gMgGu2jvTFOawpVN6UEso+ITqn
         nk0+wcK3ym/sHxSv1d98zN4zv2WQv4IFS4V40MG4fVf8BXpbtNfeWXGjILTa9lnm6zFS
         NnTIv4GL67iA6Ysrp3vJCvRgYTB6k2qYC6/oRuJM0e2B7yb8PFormVH3vcwcstNU7A5U
         ACgONGvP46VpvemGWHdAhKyuZIl8k+JXIGEu3kGvc9iD4DhQPXYNyf0VhQk/TI+8Cowk
         5S5gtyPueWtMeHKuah30P60TrkmFUUII0ZtqXE4tee1UUYP6ddSenEYSEcuXkSL/KjzZ
         MpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhT0wZgtYkRY0xJNVj5i4pw2O4qOe0HKSMyJxgnhxhE=;
        b=kaXmsyKqXfTEv3eAz0BONo9PGLmOWS6yPgMXtmPnwD8GR3CLRNQHSl1EB/iq+z3UIv
         gQ2QK0KA1HzG4TzqYLJwhV6c0fRZWSl//KBMzme8iT1D8kAt2qiVgUgIlroFCJirk9Cc
         le+9CkTdl1DGKR5h80biDVRw0HIhz32X7n/78tmFVHXp0B3L4IrW6GY93s1KAJTv3tIj
         1Uqlb0AF3rj2XqJzfdvxPwtLyg1hgGtCHIrh9CzMVeUkkDne+hvEFCYIyLsi9OIgR1sA
         PFI9TXmWNFjoYW5TPOCJut9u6sJSVloWbvi+XcmBgXbP8YfADz1l4vzePMVfk4rq9NX6
         E8Sw==
X-Gm-Message-State: AFqh2kr6EHLMIvajhrqwayngKyoDt46r+S+5fASg2e3eCxM2yNFsYvE1
	LfDvIxc82iO97wBlWCz9Tg4L81o1ArA2uyyjH+/0qSnnZKZaKQ==
X-Google-Smtp-Source: AMrXdXtj9tDh+lYak8lDcakAKHIUClrpTRrGuAh1OFhT4yQqd6m/Mc86fdSXTn+wSbMw4QtjWvJrOw2T9yuklEDCXyw=
X-Received: by 2002:a50:ee0d:0:b0:462:2c1c:8791 with SMTP id
 g13-20020a50ee0d000000b004622c1c8791mr1782259eds.29.1672084710806; Mon, 26
 Dec 2022 11:58:30 -0800 (PST)
MIME-Version: 1.0
From: Andrzej Hochul <andrzejhochul1990@gmail.com>
Date: Mon, 26 Dec 2022 20:58:18 +0100
Message-ID: <CANeVx3RNrtAaRpNArWuTA5j1J0RufWzPHh2kUE12FVC3Gt6Mew@mail.gmail.com>
Subject: [BUG] Error compiling whlist compiling stubdom (xen 4.17)
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="00000000000038d92f05f0c08f77"

--00000000000038d92f05f0c08f77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I find it appropriate to foremention that the stubdom feature is not
necessary to me at the moment.
However since when provided with "some" dependencies said feature is
automatically enabled by ./configure script. Yes the compilation works fine
with --disable-stubdom, however if my eyes didn't play tricks one me before
mentioned switch is not present in --help print.
[root@localhost xen]# uname -r
6.1.1-arch1-1
[code]
Libraries have been installed in:
   /home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,--rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
test -z
"/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/inclu=
de"
|| mkdir -p -- .
"/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/inclu=
de"
 /usr/bin/install -c -m 644 'gmp.h'
'/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/inclu=
de/gmp.h'
test -z
"/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/inclu=
de"
|| mkdir -p -- .
"/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/inclu=
de"
make  install-data-hook
make[7]: Wej=C5=9Bcie do katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64'

+-------------------------------------------------------------+
| CAUTION:                                                    |
|                                                             |
| If you have not already run "make check", then we strongly  |
| recommend you do so.                                        |
|                                                             |
| GMP has been carefully tested by its authors, but compilers |
| are all too often released with serious bugs.  GMP tends to |
| explore interesting corners in compilers and has hit bugs   |
| on quite a few occasions.                                   |
|                                                             |
+-------------------------------------------------------------+

make[7]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64'
make[6]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64'
make[5]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64'
make[4]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64'
make[3]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64'
( cd tpm_emulator-x86_64/build && make VERBOSE=3D1 tpm_crypto tpm  )
make[3]: Wej=C5=9Bcie do katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
/usr/bin/cmake -S/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64
-B/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build
--check-build-system CMakeFiles/Makefile.cmake 0
make  -f CMakeFiles/Makefile2 tpm_crypto
make[4]: Wej=C5=9Bcie do katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
/usr/bin/cmake -S/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64
-B/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build
--check-build-system CMakeFiles/Makefile.cmake 0
/usr/bin/cmake -E cmake_progress_start
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/CMakeFiles 6
make  -f CMakeFiles/Makefile2 crypto/CMakeFiles/tpm_crypto.dir/all
make[5]: Wej=C5=9Bcie do katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
make  -f crypto/CMakeFiles/tpm_crypto.dir/build.make
crypto/CMakeFiles/tpm_crypto.dir/depend
make[6]: Wej=C5=9Bcie do katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
cd /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build &&
/usr/bin/cmake -E cmake_depends "Unix Makefiles"
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto/CMakeF=
iles/tpm_crypto.dir/DependInfo.cmake
--color=3D
make[6]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
make  -f crypto/CMakeFiles/tpm_crypto.dir/build.make
crypto/CMakeFiles/tpm_crypto.dir/build
make[6]: Wej=C5=9Bcie do katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
[ 16%] Building C object crypto/CMakeFiles/tpm_crypto.dir/hmac.o
cd /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto &&
/usr/bin/gcc  -I/opt/local/include
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build -std=3Dc99
-DTPM_NO_EXTERN -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include -D__MINIOS__
-DHAVE_LIBC -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix
-isystem /home/pk/Pobrane/xen-4.17.0/stubdom/../tools/include  -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86 -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86/x86_64 -U
__linux__ -U __FreeBSD__ -U __sun__ -nostdinc -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix
-isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/includ=
e
-isystem /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/include -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include/ipv4
-I/home/pk/Pobrane/xen-4.17.0/stubdom/include
-I/home/pk/Pobrane/xen-4.17.0/stubdom/../xen/include -mno-red-zone -O1
-fno-omit-frame-pointer -O1 -fno-omit-frame-pointer  -m64 -mno-red-zone
-fno-reorder-blocks -fno-asynchronous-unwind-tables -m64 -DBUILD_ID
-fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes
-Wdeclaration-after-statement -Wno-unused-but-set-variable
-Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions
-fno-asynchronous-unwind-tables -Wno-declaration-after-statement   -Wall
-Werror -Wextra -Wno-unused-parameter -Wpointer-arith -Wcast-align
-Wwrite-strings -MD -MT crypto/CMakeFiles/tpm_crypto.dir/hmac.o -MF
CMakeFiles/tpm_crypto.dir/hmac.o.d -o CMakeFiles/tpm_crypto.dir/hmac.o -c
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/hmac.c
[ 33%] Building C object crypto/CMakeFiles/tpm_crypto.dir/rc4.o
cd /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto &&
/usr/bin/gcc  -I/opt/local/include
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build -std=3Dc99
-DTPM_NO_EXTERN -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include -D__MINIOS__
-DHAVE_LIBC -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix
-isystem /home/pk/Pobrane/xen-4.17.0/stubdom/../tools/include  -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86 -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86/x86_64 -U
__linux__ -U __FreeBSD__ -U __sun__ -nostdinc -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix
-isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/includ=
e
-isystem /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/include -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include/ipv4
-I/home/pk/Pobrane/xen-4.17.0/stubdom/include
-I/home/pk/Pobrane/xen-4.17.0/stubdom/../xen/include -mno-red-zone -O1
-fno-omit-frame-pointer -O1 -fno-omit-frame-pointer  -m64 -mno-red-zone
-fno-reorder-blocks -fno-asynchronous-unwind-tables -m64 -DBUILD_ID
-fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes
-Wdeclaration-after-statement -Wno-unused-but-set-variable
-Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions
-fno-asynchronous-unwind-tables -Wno-declaration-after-statement   -Wall
-Werror -Wextra -Wno-unused-parameter -Wpointer-arith -Wcast-align
-Wwrite-strings -MD -MT crypto/CMakeFiles/tpm_crypto.dir/rc4.o -MF
CMakeFiles/tpm_crypto.dir/rc4.o.d -o CMakeFiles/tpm_crypto.dir/rc4.o -c
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rc4.c
[ 50%] Building C object crypto/CMakeFiles/tpm_crypto.dir/rsa.o
cd /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto &&
/usr/bin/gcc  -I/opt/local/include
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build -std=3Dc99
-DTPM_NO_EXTERN -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include -D__MINIOS__
-DHAVE_LIBC -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix
-isystem /home/pk/Pobrane/xen-4.17.0/stubdom/../tools/include  -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86 -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86/x86_64 -U
__linux__ -U __FreeBSD__ -U __sun__ -nostdinc -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix
-isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/includ=
e
-isystem /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/include -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include -isystem
/home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include/ipv4
-I/home/pk/Pobrane/xen-4.17.0/stubdom/include
-I/home/pk/Pobrane/xen-4.17.0/stubdom/../xen/include -mno-red-zone -O1
-fno-omit-frame-pointer -O1 -fno-omit-frame-pointer  -m64 -mno-red-zone
-fno-reorder-blocks -fno-asynchronous-unwind-tables -m64 -DBUILD_ID
-fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes
-Wdeclaration-after-statement -Wno-unused-but-set-variable
-Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions
-fno-asynchronous-unwind-tables -Wno-declaration-after-statement   -Wall
-Werror -Wextra -Wno-unused-parameter -Wpointer-arith -Wcast-align
-Wwrite-strings -MD -MT crypto/CMakeFiles/tpm_crypto.dir/rsa.o -MF
CMakeFiles/tpm_crypto.dir/rsa.o.d -o CMakeFiles/tpm_crypto.dir/rsa.o -c
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In
function =E2=80=98rsa_private=E2=80=99:
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7:
error: the comparison will always evaluate as =E2=80=98true=E2=80=99 for th=
e address of =E2=80=98p=E2=80=99
will never be NULL [-Werror=3Daddress]
   56 |   if (!key->p || !key->q || !key->u) {
      |       ^
In file included from
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12:
note: =E2=80=98p=E2=80=99 declared here
   28 |   tpm_bn_t p;
      |            ^
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:18:
error: the comparison will always evaluate as =E2=80=98true=E2=80=99 for th=
e address of =E2=80=98q=E2=80=99
will never be NULL [-Werror=3Daddress]
   56 |   if (!key->p || !key->q || !key->u) {
      |                  ^
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.h:29:12:
note: =E2=80=98q=E2=80=99 declared here
   29 |   tpm_bn_t q;
      |            ^
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:29:
error: the comparison will always evaluate as =E2=80=98true=E2=80=99 for th=
e address of =E2=80=98u=E2=80=99
will never be NULL [-Werror=3Daddress]
   56 |   if (!key->p || !key->q || !key->u) {
      |                             ^
/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.h:30:12:
note: =E2=80=98u=E2=80=99 declared here
   30 |   tpm_bn_t u;
      |            ^
cc1: all warnings being treated as errors
make[6]: *** [crypto/CMakeFiles/tpm_crypto.dir/build.make:104:
crypto/CMakeFiles/tpm_crypto.dir/rsa.o] B=C5=82=C4=85d 1
make[6]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
make[5]: *** [CMakeFiles/Makefile2:259:
crypto/CMakeFiles/tpm_crypto.dir/all] B=C5=82=C4=85d 2
make[5]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
make[4]: *** [CMakeFiles/Makefile2:266:
crypto/CMakeFiles/tpm_crypto.dir/rule] B=C5=82=C4=85d 2
make[4]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
make[3]: *** [Makefile:215: tpm_crypto] B=C5=82=C4=85d 2
make[3]: Opuszczenie katalogu
'/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build'
make[2]: *** [Makefile:250: cross-root-x86_64/x86_64-xen-elf/lib/libtpm.a]
B=C5=82=C4=85d 2
make[2]: Opuszczenie katalogu '/home/pk/Pobrane/xen-4.17.0/stubdom'
make[1]: *** [Makefile:151: install-stubdom] B=C5=82=C4=85d 2
make[1]: Opuszczenie katalogu '/home/pk/Pobrane/xen-4.17.0'
make: *** [Makefile:183: world] B=C5=82=C4=85d 2
[pk@localhost xen-4.17.0]$
[/code]

I am not sure, if this perhaps could be easily "fixed" or overcame by not
setting the treat warnings as errors flag, but I don't know how to do it
with configure files .

Thanks

PomyloneKodowanie

--00000000000038d92f05f0c08f77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I find it appropriate=C2=A0to foremention that the stubdom=
 feature is not necessary to me at the moment.<div>However since when provi=
ded with &quot;some&quot; dependencies said=C2=A0feature is automatically e=
nabled by ./configure script. Yes the compilation works fine with --disable=
-stubdom, however if my eyes didn&#39;t=C2=A0play tricks one me before ment=
ioned switch is not present in --help print.</div><div>[root@localhost xen]=
# uname -r<br>6.1.1-arch1-1<br></div><div>[code]</div><div>Libraries have b=
een installed in:<br>=C2=A0 =C2=A0/home/pk/Pobrane/xen-4.17.0/stubdom/cross=
-root-x86_64/x86_64-xen-elf/lib<br><br>If you ever happen to want to link a=
gainst installed libraries<br>in a given directory, LIBDIR, you must either=
 use libtool, and<br>specify the full pathname of the library, or use the `=
-LLIBDIR&#39;<br>flag during linking and do at least one of the following:<=
br>=C2=A0 =C2=A0- add LIBDIR to the `LD_RUN_PATH&#39; environment variable<=
br>=C2=A0 =C2=A0 =C2=A0during linking<br>=C2=A0 =C2=A0- use the `-Wl,--rpat=
h -Wl,LIBDIR&#39; linker flag<br>=C2=A0 =C2=A0- have your system administra=
tor add LIBDIR to `/etc/ld.so.conf&#39;<br><br>See any operating system doc=
umentation about shared libraries for<br>more information, such as the ld(1=
) and ld.so(8) manual pages.<br>-------------------------------------------=
---------------------------<br>test -z &quot;/home/pk/Pobrane/xen-4.17.0/st=
ubdom/cross-root-x86_64/x86_64-xen-elf/include&quot; || mkdir -p -- . &quot=
;/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/inclu=
de&quot;<br>=C2=A0/usr/bin/install -c -m 644 &#39;gmp.h&#39; &#39;/home/pk/=
Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/include/gmp.h&#=
39;<br>test -z &quot;/home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_64/=
x86_64-xen-elf/include&quot; || mkdir -p -- . &quot;/home/pk/Pobrane/xen-4.=
17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/include&quot;<br>make =C2=A0i=
nstall-data-hook<br>make[7]: Wej=C5=9Bcie do katalogu &#39;/home/pk/Pobrane=
/xen-4.17.0/stubdom/gmp-x86_64&#39;<br><br>+-------------------------------=
------------------------------+<br>| CAUTION: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
<br>| If you have not already run &quot;make check&quot;, then we strongly =
=C2=A0|<br>| recommend you do so. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |<br>| GMP has been carefully tested by its authors, b=
ut compilers |<br>| are all too often released with serious bugs.=C2=A0 GMP=
 tends to |<br>| explore interesting corners in compilers and has hit bugs =
=C2=A0 |<br>| on quite a few occasions. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |<br>+-------------------------------------------------------------+=
<br><br>make[7]: Opuszczenie katalogu &#39;/home/pk/Pobrane/xen-4.17.0/stub=
dom/gmp-x86_64&#39;<br>make[6]: Opuszczenie katalogu &#39;/home/pk/Pobrane/=
xen-4.17.0/stubdom/gmp-x86_64&#39;<br>make[5]: Opuszczenie katalogu &#39;/h=
ome/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64&#39;<br>make[4]: Opuszczenie k=
atalogu &#39;/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64&#39;<br>make[3]=
: Opuszczenie katalogu &#39;/home/pk/Pobrane/xen-4.17.0/stubdom/gmp-x86_64&=
#39;<br>( cd tpm_emulator-x86_64/build &amp;&amp; make VERBOSE=3D1 tpm_cryp=
to tpm =C2=A0)<br>make[3]: Wej=C5=9Bcie do katalogu &#39;/home/pk/Pobrane/x=
en-4.17.0/stubdom/tpm_emulator-x86_64/build&#39;<br>/usr/bin/cmake -S/home/=
pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64 -B/home/pk/Pobrane/xen-4.=
17.0/stubdom/tpm_emulator-x86_64/build --check-build-system CMakeFiles/Make=
file.cmake 0<br>make =C2=A0-f CMakeFiles/Makefile2 tpm_crypto<br>make[4]: W=
ej=C5=9Bcie do katalogu &#39;/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulat=
or-x86_64/build&#39;<br>/usr/bin/cmake -S/home/pk/Pobrane/xen-4.17.0/stubdo=
m/tpm_emulator-x86_64 -B/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x8=
6_64/build --check-build-system CMakeFiles/Makefile.cmake 0<br>/usr/bin/cma=
ke -E cmake_progress_start /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator=
-x86_64/build/CMakeFiles 6<br>make =C2=A0-f CMakeFiles/Makefile2 crypto/CMa=
keFiles/tpm_crypto.dir/all<br>make[5]: Wej=C5=9Bcie do katalogu &#39;/home/=
pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build&#39;<br>make =C2=A0=
-f crypto/CMakeFiles/tpm_crypto.dir/build.make crypto/CMakeFiles/tpm_crypto=
.dir/depend<br>make[6]: Wej=C5=9Bcie do katalogu &#39;/home/pk/Pobrane/xen-=
4.17.0/stubdom/tpm_emulator-x86_64/build&#39;<br>cd /home/pk/Pobrane/xen-4.=
17.0/stubdom/tpm_emulator-x86_64/build &amp;&amp; /usr/bin/cmake -E cmake_d=
epends &quot;Unix Makefiles&quot; /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_e=
mulator-x86_64 /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/cryp=
to /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build /home/pk/P=
obrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto /home/pk/Pobrane=
/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto/CMakeFiles/tpm_crypto.=
dir/DependInfo.cmake --color=3D<br>make[6]: Opuszczenie katalogu &#39;/home=
/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build&#39;<br>make =C2=
=A0-f crypto/CMakeFiles/tpm_crypto.dir/build.make crypto/CMakeFiles/tpm_cry=
pto.dir/build<br>make[6]: Wej=C5=9Bcie do katalogu &#39;/home/pk/Pobrane/xe=
n-4.17.0/stubdom/tpm_emulator-x86_64/build&#39;<br>[ 16%] Building C object=
 crypto/CMakeFiles/tpm_crypto.dir/hmac.o<br>cd /home/pk/Pobrane/xen-4.17.0/=
stubdom/tpm_emulator-x86_64/build/crypto &amp;&amp; /usr/bin/gcc =C2=A0-I/o=
pt/local/include -I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64 =
-I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build -std=3Dc99 =
-DTPM_NO_EXTERN -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini=
-os/include -D__MINIOS__ -DHAVE_LIBC -isystem /home/pk/Pobrane/xen-4.17.0/s=
tubdom/../extras/mini-os/include/posix -isystem /home/pk/Pobrane/xen-4.17.0=
/stubdom/../tools/include =C2=A0-isystem /home/pk/Pobrane/xen-4.17.0/stubdo=
m/../extras/mini-os/include/x86 -isystem /home/pk/Pobrane/xen-4.17.0/stubdo=
m/../extras/mini-os/include/x86/x86_64 -U __linux__ -U __FreeBSD__ -U __sun=
__ -nostdinc -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os=
/include/posix -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/cross-root-x86_=
64/x86_64-xen-elf/include -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/12.2.0/=
include -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/includ=
e -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86_64/src/include/ipv4=
 -I/home/pk/Pobrane/xen-4.17.0/stubdom/include -I/home/pk/Pobrane/xen-4.17.=
0/stubdom/../xen/include -mno-red-zone -O1 -fno-omit-frame-pointer -O1 -fno=
-omit-frame-pointer =C2=A0-m64 -mno-red-zone -fno-reorder-blocks -fno-async=
hronous-unwind-tables -m64 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wa=
ll -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-va=
riable -Wno-unused-local-typedefs =C2=A0 -fno-pie -fno-stack-protector -fno=
-exceptions -fno-asynchronous-unwind-tables -Wno-declaration-after-statemen=
t =C2=A0 -Wall -Werror -Wextra -Wno-unused-parameter -Wpointer-arith -Wcast=
-align -Wwrite-strings -MD -MT crypto/CMakeFiles/tpm_crypto.dir/hmac.o -MF =
CMakeFiles/tpm_crypto.dir/hmac.o.d -o CMakeFiles/tpm_crypto.dir/hmac.o -c /=
home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/hmac.c<br>[ 3=
3%] Building C object crypto/CMakeFiles/tpm_crypto.dir/rc4.o<br>cd /home/pk=
/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypto &amp;&amp; /us=
r/bin/gcc =C2=A0-I/opt/local/include -I/home/pk/Pobrane/xen-4.17.0/stubdom/=
tpm_emulator-x86_64 -I/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_=
64/build -std=3Dc99 -DTPM_NO_EXTERN -isystem /home/pk/Pobrane/xen-4.17.0/st=
ubdom/../extras/mini-os/include -D__MINIOS__ -DHAVE_LIBC -isystem /home/pk/=
Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix -isystem /home/p=
k/Pobrane/xen-4.17.0/stubdom/../tools/include =C2=A0-isystem /home/pk/Pobra=
ne/xen-4.17.0/stubdom/../extras/mini-os/include/x86 -isystem /home/pk/Pobra=
ne/xen-4.17.0/stubdom/../extras/mini-os/include/x86/x86_64 -U __linux__ -U =
__FreeBSD__ -U __sun__ -nostdinc -isystem /home/pk/Pobrane/xen-4.17.0/stubd=
om/../extras/mini-os/include/posix -isystem /home/pk/Pobrane/xen-4.17.0/stu=
bdom/cross-root-x86_64/x86_64-xen-elf/include -isystem /usr/lib/gcc/x86_64-=
pc-linux-gnu/12.2.0/include -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/lw=
ip-x86_64/src/include -isystem /home/pk/Pobrane/xen-4.17.0/stubdom/lwip-x86=
_64/src/include/ipv4 -I/home/pk/Pobrane/xen-4.17.0/stubdom/include -I/home/=
pk/Pobrane/xen-4.17.0/stubdom/../xen/include -mno-red-zone -O1 -fno-omit-fr=
ame-pointer -O1 -fno-omit-frame-pointer =C2=A0-m64 -mno-red-zone -fno-reord=
er-blocks -fno-asynchronous-unwind-tables -m64 -DBUILD_ID -fno-strict-alias=
ing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -W=
no-unused-but-set-variable -Wno-unused-local-typedefs =C2=A0 -fno-pie -fno-=
stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Wno-declar=
ation-after-statement =C2=A0 -Wall -Werror -Wextra -Wno-unused-parameter -W=
pointer-arith -Wcast-align -Wwrite-strings -MD -MT crypto/CMakeFiles/tpm_cr=
ypto.dir/rc4.o -MF CMakeFiles/tpm_crypto.dir/rc4.o.d -o CMakeFiles/tpm_cryp=
to.dir/rc4.o -c /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/cry=
pto/rc4.c<br>[ 50%] Building C object crypto/CMakeFiles/tpm_crypto.dir/rsa.=
o<br>cd /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build/crypt=
o &amp;&amp; /usr/bin/gcc =C2=A0-I/opt/local/include -I/home/pk/Pobrane/xen=
-4.17.0/stubdom/tpm_emulator-x86_64 -I/home/pk/Pobrane/xen-4.17.0/stubdom/t=
pm_emulator-x86_64/build -std=3Dc99 -DTPM_NO_EXTERN -isystem /home/pk/Pobra=
ne/xen-4.17.0/stubdom/../extras/mini-os/include -D__MINIOS__ -DHAVE_LIBC -i=
system /home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/posix =
-isystem /home/pk/Pobrane/xen-4.17.0/stubdom/../tools/include =C2=A0-isyste=
m /home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86 -isyste=
m /home/pk/Pobrane/xen-4.17.0/stubdom/../extras/mini-os/include/x86/x86_64 =
-U __linux__ -U __FreeBSD__ -U __sun__ -nostdinc -isystem /home/pk/Pobrane/=
xen-4.17.0/stubdom/../extras/mini-os/include/posix -isystem /home/pk/Pobran=
e/xen-4.17.0/stubdom/cross-root-x86_64/x86_64-xen-elf/include -isystem /usr=
/lib/gcc/x86_64-pc-linux-gnu/12.2.0/include -isystem /home/pk/Pobrane/xen-4=
.17.0/stubdom/lwip-x86_64/src/include -isystem /home/pk/Pobrane/xen-4.17.0/=
stubdom/lwip-x86_64/src/include/ipv4 -I/home/pk/Pobrane/xen-4.17.0/stubdom/=
include -I/home/pk/Pobrane/xen-4.17.0/stubdom/../xen/include -mno-red-zone =
-O1 -fno-omit-frame-pointer -O1 -fno-omit-frame-pointer =C2=A0-m64 -mno-red=
-zone -fno-reorder-blocks -fno-asynchronous-unwind-tables -m64 -DBUILD_ID -=
fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-af=
ter-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs =C2=
=A0 -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-=
tables -Wno-declaration-after-statement =C2=A0 -Wall -Werror -Wextra -Wno-u=
nused-parameter -Wpointer-arith -Wcast-align -Wwrite-strings -MD -MT crypto=
/CMakeFiles/tpm_crypto.dir/rsa.o -MF CMakeFiles/tpm_crypto.dir/rsa.o.d -o C=
MakeFiles/tpm_crypto.dir/rsa.o -c /home/pk/Pobrane/xen-4.17.0/stubdom/tpm_e=
mulator-x86_64/crypto/rsa.c<br>/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emul=
ator-x86_64/crypto/rsa.c: In function =E2=80=98rsa_private=E2=80=99:<br>/ho=
me/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: err=
or: the comparison will always evaluate as =E2=80=98true=E2=80=99 for the a=
ddress of =E2=80=98p=E2=80=99 will never be NULL [-Werror=3Daddress]<br>=C2=
=A0 =C2=A056 | =C2=A0 if (!key-&gt;p || !key-&gt;q || !key-&gt;u) {<br>=C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 ^<br>In file included from /home/p=
k/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:<br>/home/=
pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note:=
 =E2=80=98p=E2=80=99 declared here<br>=C2=A0 =C2=A028 | =C2=A0 tpm_bn_t p;<=
br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>/ho=
me/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:18: er=
ror: the comparison will always evaluate as =E2=80=98true=E2=80=99 for the =
address of =E2=80=98q=E2=80=99 will never be NULL [-Werror=3Daddress]<br>=
=C2=A0 =C2=A056 | =C2=A0 if (!key-&gt;p || !key-&gt;q || !key-&gt;u) {<br>=
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/cryp=
to/rsa.h:29:12: note: =E2=80=98q=E2=80=99 declared here<br>=C2=A0 =C2=A029 =
| =C2=A0 tpm_bn_t q;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^<br>/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/c=
rypto/rsa.c:56:29: error: the comparison will always evaluate as =E2=80=98t=
rue=E2=80=99 for the address of =E2=80=98u=E2=80=99 will never be NULL [-We=
rror=3Daddress]<br>=C2=A0 =C2=A056 | =C2=A0 if (!key-&gt;p || !key-&gt;q ||=
 !key-&gt;u) {<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>/home/=
pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/crypto/rsa.h:30:12: note:=
 =E2=80=98u=E2=80=99 declared here<br>=C2=A0 =C2=A030 | =C2=A0 tpm_bn_t u;<=
br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>cc1=
: all warnings being treated as errors<br>make[6]: *** [crypto/CMakeFiles/t=
pm_crypto.dir/build.make:104: crypto/CMakeFiles/tpm_crypto.dir/rsa.o] B=C5=
=82=C4=85d 1<br>make[6]: Opuszczenie katalogu &#39;/home/pk/Pobrane/xen-4.1=
7.0/stubdom/tpm_emulator-x86_64/build&#39;<br>make[5]: *** [CMakeFiles/Make=
file2:259: crypto/CMakeFiles/tpm_crypto.dir/all] B=C5=82=C4=85d 2<br>make[5=
]: Opuszczenie katalogu &#39;/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulat=
or-x86_64/build&#39;<br>make[4]: *** [CMakeFiles/Makefile2:266: crypto/CMak=
eFiles/tpm_crypto.dir/rule] B=C5=82=C4=85d 2<br>make[4]: Opuszczenie katalo=
gu &#39;/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86_64/build&#39;<=
br>make[3]: *** [Makefile:215: tpm_crypto] B=C5=82=C4=85d 2<br>make[3]: Opu=
szczenie katalogu &#39;/home/pk/Pobrane/xen-4.17.0/stubdom/tpm_emulator-x86=
_64/build&#39;<br>make[2]: *** [Makefile:250: cross-root-x86_64/x86_64-xen-=
elf/lib/libtpm.a] B=C5=82=C4=85d 2<br>make[2]: Opuszczenie katalogu &#39;/h=
ome/pk/Pobrane/xen-4.17.0/stubdom&#39;<br>make[1]: *** [Makefile:151: insta=
ll-stubdom] B=C5=82=C4=85d 2<br>make[1]: Opuszczenie katalogu &#39;/home/pk=
/Pobrane/xen-4.17.0&#39;<br>make: *** [Makefile:183: world] B=C5=82=C4=85d =
2<br>[pk@localhost xen-4.17.0]$</div><div>[/code]</div><div><br></div><div>=
I am not sure, if this perhaps could be easily &quot;fixed&quot; or overcam=
e by not setting the treat warnings as errors flag, but I don&#39;t know ho=
w to do it with configure files .</div><div><br></div><div>Thanks</div><div=
><br></div><div>PomyloneKodowanie</div><div>=C2=A0<br></div></div>

--00000000000038d92f05f0c08f77--

