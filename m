Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C089FEABE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 21:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863539.1274911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMp0-0005Ki-Iy; Mon, 30 Dec 2024 20:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863539.1274911; Mon, 30 Dec 2024 20:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMp0-0005HZ-Fm; Mon, 30 Dec 2024 20:57:06 +0000
Received: by outflank-mailman (input) for mailman id 863539;
 Mon, 30 Dec 2024 20:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMoy-0005HT-34
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 20:57:05 +0000
Received: from mx1.somlen.de (typhoon.somlen.de [89.238.64.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d47714d-c6f0-11ef-a0db-8be0dac302b0;
 Mon, 30 Dec 2024 21:57:00 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id C8D8E5030C1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2024 21:56:58 +0100 (CET)
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
X-Inumbo-ID: 9d47714d-c6f0-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=sQmZIXfDs1rHvUaJNY5rFgMAdUz5F5EPTE6F/gXdKIA=;
	b=EhgIeV3JmrHAtbb/Ulf4ztjAsh118UHA9s0qfv16e7BFqPgKNieVHqmNn8g7IY1WhTeGdf
	8c6Wnog7lXoE0KeLESp+5REp06F3cCZhz6MmV2Vu6hciP+55n3LUWiqVvDvuw4TtfvvsEy
	x8K6mump6rnwnVlbZiF8Noj/crS9qkb/xAzKIGY1JZqSbO/6kweJXrX0DauDLqHqOjwCyt
	izCfBTd1jV3H8zYIMJ7AEXNRF3SVBETlra/u7xy9Tlcg8/h05XJLTceOIbrcbpm7HjzBZh
	z3+Y0r+Z5eQtw1dqeFRRuXWf7ZklhaHk/Dm391OzdzJSgMHeGM5OoIc7PXvU5w==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Subject:
 Bug: Hyperlinks in generated documentation may point to the wrong
 architecture
Date: Mon, 30 Dec 2024 21:56:53 +0100
Message-ID: <2293976.iZASKD2KPV@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1990080.PYKUYFuaPT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1990080.PYKUYFuaPT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2024 21:56:53 +0100
Message-ID: <2293976.iZASKD2KPV@localhost>
MIME-Version: 1.0

Hello,

during working on packaging Xen in Debian I noticed the documentation becomes 
non-reproducible as hyperlinks may point to the wrong architecture.

Here an example as diff showing the problem:

/usr/share/doc/xen/html/hypercall/arm/include,public,arch-arm.h.html
@@ -313,15 +313,15 @@
     uint64_t sctlr;
     uint64_t ttbcr, ttbr0, ttbr1;
 };
 typedef <a href="include,public,arch-arm.h.html#Struct_vcpu_guest_context">struct vcpu_guest_context</a> <a  name="Typedef_vcpu_guest_context_t"><strong>vcpu_guest_context_t</strong></a>;
 DEFINE_XEN_GUEST_HANDLE(<a href="include,public,arch-arm.h.html#Struct_vcpu_guest_context">vcpu_guest_context_t</a>);
 
 /*
- * <a href="include,public,arch-arm.h.html#Struct_xen_arch_domainconfig">struct xen_arch_domainconfig</a>'s ABI is covered by
+ * <a href="include,public,arch-ppc.h.html#Struct_xen_arch_domainconfig">struct xen_arch_domainconfig</a>'s ABI is covered by
  * XEN_DOMCTL_INTERFACE_VERSION.
  */
 #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
 #define XEN_DOMCTL_CONFIG_GIC_V2        1
 #define XEN_DOMCTL_CONFIG_GIC_V3        2
 
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0


As can be seen, the hyperlink in include,public,arch-arm.h.html points to 
include,public,arch-ppc.h.html while it should point to include,public,arch-
arm.h.html.
A similar problem can be found in many more places and files.

Corresponding to the problem described above, while building the documentation 
many messages similar to the last lines below can be seen in the build log:

/usr/bin/perl -w /build/reproducible-path/xen-4.19.1/docs/xen-headers -O html/hypercall/arm \
        -T 'arch-arm - Xen public headers' \
        -X arch-x86_32 -X arch-x86_64 \
        -X xen-x86_32 -X xen-x86_64 \
        -X arch-x86 \
        /build/reproducible-path/xen-4.19.1/docs/../xen include/public include/xen/errno.h
include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-arm.h:300
include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-ppc.h:85
include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-arm.h:300
include/public/arch-ppc.h:91: multiple definitions of Typedef vcpu_guest_core_regs_t: include/public/arch-ppc.h:85
include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-ppc.h:90
include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-arm.h:305
include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-ppc.h:90
include/public/arch-ppc.h:95: multiple definitions of Struct vcpu_guest_context: include/public/arch-arm.h:305
[...]


In Debian we worked around the problem for now by adding ppc and riscv to 
DOC_ARCHES in docs/Makefile as can be seen in [1]. This solves all the 
described problems and makes the build reproducible again. I assume another 
possible fix would be adding suitable ignore switches for ppc and riscv.

I did not send this as a patch as I'm not sure what the preferred upstream 
solution to this problem is, but can formally submit our fix as a patch if 
that's desired.

Thanks,
Maxi

[1] https://salsa.debian.org/xen-team/debian-xen/-/commit/d852c48d0df5c6ceba42d20652d1f9a05ad8989e 
--nextPart1990080.PYKUYFuaPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ8gZ7vwsPje0uPkIgepkfSQr0hUFAmdzCRUACgkQgepkfSQr
0hVXYA/9GsPUQGILV6vqzCbx+1SiVv1rnmARjCnnWREslj8UTwOBtkbaPuequFI9
t7+Xt+uKBqo5P+Bh9QU0Vc5RPjnWHTST69G3rxfxH4kvh5OAOxcyhhL3vmIt1LWi
mj7nqq87l/LeXzzphYdQOCLXxvMnUSnnkWBS1t2xEJ6p9bX7eUv7IDqskGniMKkY
2pcL/ifZw5RfBzCyw/uF2G8M0chSp5bS2JK3dDH+lflPfLOokX6ubEcOrezcBlmW
RAUvCZ5o3HGrEz7it/Rxk1gyUmLAacYQrIV/kXOMsJGk2AFSRbOlln39rzkrdKz3
439FhF8ow5PaYlUmaiC8cb/dpkQYhP0vW5mzYmaxVlUoxGWKMUDCv9iA3FkbvF0j
+IXoMbts4NzvvuNT04GvuhoiwGal55BkzniFfM8xuM9Hz4hfwbNIpexH/w8D1lWO
irdIci6KOzy4aduiB4yki8IhIbpBer3N4TxTIx6GuL7FvTsBdjTYcbdjqtR0pvFT
U7r+p/BpB4ZkSyvJyuPwiPDVC/0mzSqtBALRI9rZXST2WK28vkgF2UmvqJmsXRCz
75duE4pUBl7Apk9oJ3NxythSIH6saaYT+yHDYxTrp8ffIBOPkdSAgjPzb88jT3pL
u+r3r+jR0U7pPW5Qhoa/ED5ZisDo7gC+jdRkNWO7Lq2St5Jz+Nw=
=/gKh
-----END PGP SIGNATURE-----

--nextPart1990080.PYKUYFuaPT--




