Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BECB15111
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062855.1428578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn0L-0000nY-LH; Tue, 29 Jul 2025 16:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062855.1428578; Tue, 29 Jul 2025 16:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn0L-0000m7-HQ; Tue, 29 Jul 2025 16:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1062855;
 Tue, 29 Jul 2025 16:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oL40=2K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ugn0J-0000m1-Rd
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:16:39 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66a1db9c-6c97-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 18:16:38 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 17538057847551005.6967520049665;
 Tue, 29 Jul 2025 09:16:24 -0700 (PDT)
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
X-Inumbo-ID: 66a1db9c-6c97-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1753805792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VUDr3uwk1z+FIHGbkDUKHRhwXmMzv61flb+vM9IuXCoQejHG7TCHNdC8w5CmrIHiltSuku6E6Pmah43U5V2KOBpwwICiGa+Z6KQEdy5v0Q3ZCXj8c57JGl7UQazoDiQLoar1vrXtaIBcM6pwW6/Bhak3TmSLQMiE3OJpYYR4occ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753805792; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hE5enLcHVRCqrHEicpatiepfiXU7ksxznA5fszG0bwg=; 
	b=lBRP9e07nxXHxnPGeM71qNctYn69AgyqJwhfXU0ONm5pxU69iUXQUFA8XlRyhJLhBS1uLJPShK8UMBESj97XHofHdNQh3Rrj1/VHOd6LM7qwevElHT1ULJ2S9BeLxv2ARt54UxZmy3nYLKdi1jO1xGgtQ05GuZ+imt6WzV4C930=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753805792;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hE5enLcHVRCqrHEicpatiepfiXU7ksxznA5fszG0bwg=;
	b=EGEHVMQMG87m7NfyuLNchjN4tlUqr4JGrHGDuczTSxFiR8pDR7iGQVMaJsFKQucE
	nFF920CTIog7pJeuTIN/nQCkR6yrpxSWucVDbDR9V8SpZpcePE23qJVekW6X+nWbRfN
	EdSH0PL6UXKhcESVHX4h2ML5uJL/G9LgbyiH9KTA=
Date: Tue, 29 Jul 2025 12:16:24 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>,
	"Ross Lagerwall" <ross.lagerwall@citrix.com>,
	"Jan Beulich" <JBeulich@suse.com>,
	=?UTF-8?Q?=22Roger_Pau_Monn=C3=A9=22?= <roger.pau@citrix.com>,
	=?UTF-8?Q?=22Marek_Marczykowski-G=C3=B3recki=22?=
 <marmarek@invisiblethingslab.com>
Message-ID: <19856f88695.edec77a563286.1677737418046061640@apertussolutions.com>
In-Reply-To: <20250605111638.2869914-2-andrew.cooper3@citrix.com>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com> <20250605111638.2869914-2-andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Thu, 05 Jun 2025 07:16:36 -0400 Andrew Cooper <andrew.cooper3@citri=
x.com> wrote ---

 > The format of the buildid is a property of the binary, not a property of=
 how=20
 > it was loaded.  This fixes buildid recognition when starting xen.efi fro=
m it's=20
 > MB2 entrypoint.=20
 > =20
 > Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>=20
 > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>=20
 > ---=20
 > CC: Jan Beulich <JBeulich@suse.com>=20
 > CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=20
 > CC: Ross Lagerwall <ross.lagerwall@citrix.com>=20
 > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>=20
 > CC: Daniel P. Smith <dpsmith@apertussolutions.com>=20
 > =20
 > I don't like this patch and tried hard to do it in a better way, but the=
 EFI=20
 > aspects of the build system are too intractable.=20
 > =20
 > While on x86 I can in principle pull the same common-stubs.o trick, spli=
t on=20
 > XEN_BUILD_PE rather than XEN_BUILD_EFI, that doesn't work on ARM which=
=20
 > hand-codes it's PE-ness.  Also, it's really not EFI related, other than =
as a=20
 > consequence of that being the only reason we use PE32+ binaries.=20
 > =20
 > Binutils 2.25 is now the minimum, and the makefiles can be cleaned up=20
 > somewhat, but I need to backport this patch, internally at least.=20
 > ---=20
 >  xen/common/version.c | 7 +++++--=20
 >  1 file changed, 5 insertions(+), 2 deletions(-)=20
 > =20
 > diff --git a/xen/common/version.c b/xen/common/version.c=20
 > index 5474b8e385be..56b51c81d2fc 100644=20
 > --- a/xen/common/version.c=20
 > +++ b/xen/common/version.c=20
 > @@ -203,8 +203,11 @@ void __init xen_build_init(void)=20
 >  rc =3D xen_build_id_check(n, sz, &build_id_p, &build_id_len);=20
 > =20
 >  #ifdef CONFIG_X86=20
 > -    /* Alternatively we may have a CodeView record from an EFI build. *=
/=20
 > -    if ( rc && efi_enabled(EFI_LOADER) )=20
 > +    /*=20
 > +     * xen.efi built with a new enough toolchain will have a CodeView r=
ecord,=20
 > +     * not an ELF note.=20
 > +     */=20
 > +    if ( rc )=20
 >  {=20
 >  const struct pe_external_debug_directory *dir =3D (const void *)n;=20
 > =20
 > --=20
 > 2.39.5=20
 > =20
 >=20

From what I can see, thre are no longer objections and two Rb's ackowledgin=
g this is the best path forward. I do not see an issue with it myself.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>


