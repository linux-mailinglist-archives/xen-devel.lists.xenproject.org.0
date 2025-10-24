Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FDC04147
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 04:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149840.1481298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC7BZ-0000EB-NJ; Fri, 24 Oct 2025 02:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149840.1481298; Fri, 24 Oct 2025 02:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vC7BZ-0000CT-Kl; Fri, 24 Oct 2025 02:05:45 +0000
Received: by outflank-mailman (input) for mailman id 1149840;
 Fri, 24 Oct 2025 02:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67mD=5B=illinois.edu=wentaoz5@srs-se1.protection.inumbo.net>)
 id 1vC7BX-0000CN-UY
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 02:05:44 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0fc097e-b07d-11f0-9d15-b5c5bf9af7f9;
 Fri, 24 Oct 2025 04:05:41 +0200 (CEST)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-92b92e4b078so64734839f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 19:05:41 -0700 (PDT)
Received: from localhost.localdomain
 (host-183-235.ilcmi2.champaign.il.us.clients.pavlovmedia.net.
 [66.253.183.235]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5abb4e4c156sm1566064173.2.2025.10.23.19.05.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 19:05:39 -0700 (PDT)
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
X-Inumbo-ID: f0fc097e-b07d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=illinois-edu.20230601.gappssmtp.com; s=20230601; t=1761271540; x=1761876340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toUcxKaTdf6XhP1RXsWOVnefPk5I1vVFbRnSeMcTxxU=;
        b=aqR6Hzi+VQ1orV5EDCTZ5acA51M2Yve2AZGOSldRcT8yh+vYJgiSXV8qj8XwcQzbay
         VdfKpvn33p3K4UTvMXX2di6Tbjd4OUON7nyhU8JF5eNhsQiHdIIJ7+cXulKetogaBigF
         y17kl7Djt7zEqOhDkdlC5dxVn7QitDIdPFePmSjUE5/Irtzl3/y0moXr3/saRthGFasA
         PmV50hfwPs5FpoIycl53aGJixTZNX5o0hfokHyF5mB7bD2ji1RWX6LTkIvOklp/wn4hx
         8t0yqwLtv3XIN+Jh3y4CoVcPkqLUYT+4s2MJV8WwI1ryOUjaJmHLL+Z62fO55V3qieWF
         emkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761271540; x=1761876340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toUcxKaTdf6XhP1RXsWOVnefPk5I1vVFbRnSeMcTxxU=;
        b=Rx8XdHC/WsyTadHLSQcJq5jW5m21Mm0TJCtbfm6aLTC6e/66X87Eef7EpXdUqTKl05
         okGo/yi2xgU8XvD8/fe3kmM4bLsOnctxVU8zjPNFQBvsiNVnnRPQIztBCOKuwgxxU9AP
         v5RWJaS0x9ktybtYwj1jm8Ebd5e+NPjMtptMxjPJPQoHm6t4r1jStUgD8owBwDJrtTg/
         lNfklm/qWg4cM6aUBKbRu3qfD1nHw3asR3yGjp2dirxBq12LotWF4Pug0GpF7FZb5C/Q
         j9lg4YjbOz3VSVSpDh6dX+ui8zofzGj3501P8iktwhWH0bpD/06zHWpOWJBnDUxqKLUD
         8K5A==
X-Gm-Message-State: AOJu0YzFn9wygO6/f5wysp/yVXSZh6cFj1E/NXjaU9xUD8E4hOSsSSzn
	9THHlUO9QrhCGaLiqGu0cX/h4lDQApRrWJAz3n0FLS6trTFogvSp/AGCF82/P9pM9EZSa61lMIg
	CQOs=
X-Gm-Gg: ASbGncv4+8PolUVSbenrAk7O/rBKcLXny6DA9b86OEL9477PgRxsilRfwOC391IuF7L
	/VcDuIO6Q/OBaLugrg/enjRRUamRJDGt5e44Wx7I/RfSawGb6w9FDwRD92IGl3x+NSmw5jVCxM4
	cczSrUd94JIQeD7LqnLSyZqFU7A3OhIIabPfyssjA9b1d3S8eOcx/DOQfX0XYWMRZO4+3h8Wuei
	y/+1F1qzlLZ5GZqGXsVQ7vRzykgYlKA6sHJGbSIPYZhVKuKrIFsh1kU+ml+aAgGcm2c+7SqXUUi
	9WRFe187Nqof4GWwU3E0bvKotaIryBq0mcSP5OJN+gTRivs7se1Oems2u3ZtCnTBTP511jFmB18
	T4flCFc5jtgYBfF7zwXmaRDqr6/G1w3yP1wBlRoWUak5OyX6UU9VYzJ2n6BMkfYFwmK4qSja/k9
	Rj1HXSEJdz/+p+vNAxdv9AEcS4tDY9/kf1BfCmSzW/M46pBTDc8dyCVXhJZlqVO95wFJCs9yXL3
	QIS5YjiQURkDJsMH9Y5HleX
X-Google-Smtp-Source: AGHT+IFe7N7STSuo5JPlBs7roXn4Xrkrz8iUjqnTuNDzJMt08I+iQjDN0F5k5XlevheBWBVDuSK7WA==
X-Received: by 2002:a05:6602:29d2:b0:93e:8557:5b07 with SMTP id ca18e2360f4ac-93e85575d4amr3900039439f.7.1761271540042;
        Thu, 23 Oct 2025 19:05:40 -0700 (PDT)
From: Wentao Zhang <wentaoz5@illinois.edu>
To: xen-devel@lists.xenproject.org,
	Saman Dehghan <samaan.dehghan@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Matthew L Weber <matthew.l.weber3@boeing.com>
Subject: Re: [PATCH v3] Support LLVM raw profile versions 5, 6, 7, 8, 9, and 10
Date: Thu, 23 Oct 2025 21:05:38 -0500
Message-Id: <20251024020538.57764-1-wentaoz5@illinois.edu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
References: <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested with Clang 20.1.8 on Debian bookworm x86_64 and arm64.

Carry this if appropriate:

Tested-by: Wentao Zhang <wentaoz5@illinois.edu>

Steps for build:

$ make CC=/lib/llvm-20/bin/clang -C xen defconfig
$ pushd xen
$ kconfig-tweak -d LIVEPATCH
$ kconfig-tweak -e COVERAGE
  # The below two are Arm only
$ kconfig-tweak -e UNSUPPORTED
$ kconfig-tweak -e ACPI
$ popd
$ make CC=/lib/llvm-20/bin/clang -C xen olddefconfig
$ /usr/bin/time -v make CC=/lib/llvm-20/bin/clang -j$(nproc) efi-y= dist-xen
$ sudo make CC=/lib/llvm-20/bin/clang -j$(nproc) efi-y= install-xen
$ sudo update-grub

Steps after reinstall:

$ COVERAGE_REPORT_DIR=`mktemp -d`
$ XEN_BUILD=$HOME/v4
$ sudo xencov read | tee >/dev/null default.profraw
$ file default.profraw
$ /lib/llvm-20/bin/llvm-profdata merge default.profraw -o default.profdata
$ file default.profdata
$ /lib/llvm-20/bin/llvm-cov show \
    -instr-profile default.profdata \
    -output-dir $COVERAGE_REPORT_DIR \
    -show-directory-coverage \
    -show-branches=count \
    -use-color=false \
    $XEN_BUILD/xen/xen-syms

Example reports:

$ less $COVERAGE_REPORT_DIR/index.txt
$ less $COVERAGE_REPORT_DIR/coverage/$XEN_BUILD/xen/common/coverage/llvm.c.txt

Notes:

1. On x86_64, LD=ld.lld also works (in fact, faster). On arm64, the build
   would fail.
2. On arm64, a workaround is needed regardless of the linker:

diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
index c4f89c7b0e..dbe87f3f34 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -4,6 +4,7 @@
 #include <asm/vfp.h>
 #include <asm/arm64/sve.h>

+__attribute__((target("+fp+simd")))
 static inline void save_state(uint64_t *fpregs)
 {
     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
@@ -25,6 +26,7 @@ static inline void save_state(uint64_t *fpregs)
                  : "=Q" (*fpregs) : "r" (fpregs));
 }

+__attribute__((target("+fp+simd")))
 static inline void restore_state(const uint64_t *fpregs)
 {
     asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
@@ -46,6 +48,7 @@ static inline void restore_state(const uint64_t *fpregs)
                  : : "Q" (*fpregs), "r" (fpregs));
 }

+__attribute__((target("+fp+simd")))
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
@@ -62,6 +65,7 @@ void vfp_save_state(struct vcpu *v)
         v->arch.vfp.fpexc32_el2 = READ_SYSREG(FPEXC32_EL2);
 }

+__attribute__((target("+fp+simd")))
 void vfp_restore_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )

For the above two issues, see the report in [1].

Once this patch gets in, we can help update [2] with Andrew Cooper and
send a follow-up supporting llvm-cov MC/DC [3].

[1] https://lists.xenproject.org/archives/html/xen-devel/2025-10/msg00805.html
[2] https://xenbits.xen.org/docs/latest/hypervisor-guide/code-coverage.html
[3] https://clang.llvm.org/docs/SourceBasedCodeCoverage.html#mc-dc-instrumentation

Thanks,
Wentao

