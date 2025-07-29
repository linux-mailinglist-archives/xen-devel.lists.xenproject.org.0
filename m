Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E0B15136
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062886.1428617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn7p-00041r-3N; Tue, 29 Jul 2025 16:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062886.1428617; Tue, 29 Jul 2025 16:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn7p-0003zm-0T; Tue, 29 Jul 2025 16:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1062886;
 Tue, 29 Jul 2025 16:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oL40=2K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ugn7n-0003yu-VX
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:24:23 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ba5c2b2-6c98-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 18:24:22 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1753806253593839.8554389943715;
 Tue, 29 Jul 2025 09:24:13 -0700 (PDT)
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
X-Inumbo-ID: 7ba5c2b2-6c98-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1753806259; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N7IeB8G2ZMAIs3RqObCk52GNGkZ5uZZfYdFhvLNUEeXY7YLnKLdEZZRXxKidfckuMI7Q52MiDInkwvbhxim/r9zAD8b8QurV4rCBTYqeBMmG1RUDBub8FONyHvpqnCyDwhtRSM95Hx0rNmH6u0xc6jDLsA0P+On+AoIASw+bGyA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753806259; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gi8zL0l7uVhRfRnrKaIS+6AMKQ1ZxYgmsCKMrlb2NWw=; 
	b=NTnwWaqY40JNcF96HL9S+5cp1Y59SL30uAp2o3l72DaqEjvXzovr5Kszh8RyCFiSySIGZqhZr/QiaGqR5NLzpMEeE57KLhEPP3AApv4cCiznL8+X/su2jnIx3ZTm+grMf/WVuuuF/wKVjUABvjHQo9WcWMcUf82ow6kKStbQdq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753806259;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gi8zL0l7uVhRfRnrKaIS+6AMKQ1ZxYgmsCKMrlb2NWw=;
	b=MBiFIe0GsKKqW8eBQe1vMCU5FYHPj5A4wsXtXiZDSjpAyraVHH5t3S+GPPObhg6Y
	3L9qcTEoToXh/5a2fX0Ed/hSmjwA3u+EJu6Vk2TzilNNP5VV/W/JW+gfP31LSAN0D3h
	wcnXCbgxhBVumOEscO3k3ZpmJBKmE99Glc6Cwzbw=
Date: Tue, 29 Jul 2025 12:24:13 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Xen-devel" <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>,
	=?UTF-8?Q?=22Roger_Pau_Monn=C3=A9=22?= <roger.pau@citrix.com>,
	"Ross Lagerwall" <ross.lagerwall@citrix.com>,
	=?UTF-8?Q?=22Marek_Marczykowski-G=C3=B3recki=22?=
 <marmarek@invisiblethingslab.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>
Message-ID: <19856ffadfb.11e80de8764162.1850685172595991894@apertussolutions.com>
In-Reply-To: <20250605111638.2869914-4-andrew.cooper3@citrix.com>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com> <20250605111638.2869914-4-andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] xen/EFI: Drop __ASSEMBLY__ ifdefary in efi.h
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Thu, 05 Jun 2025 07:16:38 -0400 Andrew Cooper <andrew.cooper3@citri=
x.com> wrote ---

 > There's already C outside of the ifdefary, proving that it's not include=
d in=20
 > any assembly files.=20
 > =20
 > No functional change.=20
 > =20
 > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=20
 > ---=20
 > CC: Jan Beulich <JBeulich@suse.com>=20
 > CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=20
 > CC: Ross Lagerwall <ross.lagerwall@citrix.com>=20
 > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>=20
 > CC: Daniel P. Smith <dpsmith@apertussolutions.com>=20
 > ---=20
 >  xen/include/xen/efi.h | 6 ------=20
 >  1 file changed, 6 deletions(-)=20
 > =20
 > diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h=20
 > index 160804e29444..623ed2ccdf31 100644=20
 > --- a/xen/include/xen/efi.h=20
 > +++ b/xen/include/xen/efi.h=20
 > @@ -1,9 +1,7 @@=20
 >  #ifndef __XEN_EFI_H__=20
 >  #define __XEN_EFI_H__=20
 > =20
 > -#ifndef __ASSEMBLY__=20
 >  #include <xen/types.h>=20
 > -#endif=20
 > =20
 >  #define EFI_INVALID_TABLE_ADDR (~0UL)=20
 > =20
 > @@ -23,8 +21,6 @@ struct efi {=20
 > =20
 >  extern struct efi efi;=20
 > =20
 > -#ifndef __ASSEMBLY__=20
 > -=20
 >  union xenpf_efi_info;=20
 >  union compat_pf_efi_info;=20
 > =20
 > @@ -53,6 +49,4 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op=
);=20
 >  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *info);=
=20
 >  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *op);=20
 > =20
 > -#endif /* !__ASSEMBLY__ */=20
 > -=20
 >  #endif /* __XEN_EFI_H__ */=20
 > --=20
 > 2.39.5=20
 > =20
 >=20

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

