Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B8D719442
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 09:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542263.845919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4ckE-0008Nq-Ij; Thu, 01 Jun 2023 07:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542263.845919; Thu, 01 Jun 2023 07:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4ckE-0008KX-FP; Thu, 01 Jun 2023 07:29:14 +0000
Received: by outflank-mailman (input) for mailman id 542263;
 Thu, 01 Jun 2023 07:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUQI=BV=zedat.fu-berlin.de=glaubitz@srs-se1.protection.inumbo.net>)
 id 1q4ckC-0008KR-Um
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 07:29:12 +0000
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0059735f-004e-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 09:29:11 +0200 (CEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1q4cjY-001s7N-3r; Thu, 01 Jun 2023 09:28:32 +0200
Received: from p57bd9d78.dip0.t-ipconnect.de ([87.189.157.120]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1q4cjX-002tZZ-RO; Thu, 01 Jun 2023 09:28:32 +0200
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
X-Inumbo-ID: 0059735f-004e-11ee-b231-6b7b168915f2
Message-ID: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Vishal Moola (Oracle)"
	 <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox
	 <willy@infradead.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>
Date: Thu, 01 Jun 2023 09:28:30 +0200
In-Reply-To: <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
	 <20230531213032.25338-31-vishal.moola@gmail.com>
	 <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.157.120
X-ZEDAT-Hint: PO

Hi Geert!

On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> <vishal.moola@gmail.com> wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents. Also cleans up some spacing issues.
> >=20
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>=20
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume this series is supposed to go through some mm tree?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

