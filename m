Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBF9412C6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 15:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767770.1178475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmXK-00018q-CF; Tue, 30 Jul 2024 13:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767770.1178475; Tue, 30 Jul 2024 13:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmXK-00015o-8n; Tue, 30 Jul 2024 13:05:06 +0000
Received: by outflank-mailman (input) for mailman id 767770;
 Tue, 30 Jul 2024 13:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4le=O6=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sYmXI-00015g-OK
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 13:05:04 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 545490b7-4e74-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 15:05:02 +0200 (CEST)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1722344692790545.1457244313797;
 Tue, 30 Jul 2024 06:04:52 -0700 (PDT)
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
X-Inumbo-ID: 545490b7-4e74-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1722344698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i9I8YiHxqEMhTLbBc5hIGgEQM5GnxIhu7aI46qF1LzafDHb83wHERKp765P6S/2DVzppKmhkdyV4wK9beGgJSXaZwJaKs/SC+lVnqD9sDCUlaZm9lnKI4h492D1jlh5dp+RyqsONHsgflEhE9hEEJITMrZt0jweOhiCg8a58z18=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722344698; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LG6hTwZMBajHC9FvMj4T2Cg++P96TzpsiyX7lAr8+CI=; 
	b=GwRK5IH9be8c9XnH8Bgt1/58FwirTUXYxH0bd6T9tBPdHhwTwXKEGKaqBm5AVFQsuiS/Xb3WiWc7pXzrIZt+MlcaHkpzrpB6dXksBe7ExHNddfQBvFN8rup7dvkqstZn77XSnCsz2rkmkbbB5/0bJgHoN6sM0XHjz4uUsYNQNjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722344698;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LG6hTwZMBajHC9FvMj4T2Cg++P96TzpsiyX7lAr8+CI=;
	b=hIFRHseDm4L7A++hjO7iawG6BvIt+nv2aDZzAW6XujotDFoYQ2Q/9DZmO11R8CCM
	o650Iw2CnXJevF4e9sTBAZfg3WsKbd686rdA6KsbU40TrKuFmp+zX0S9VzYcD05pZVM
	Ku+d0FkuWGvkm1Cuy42/f7I47oXCsNSS+JBH6K6k=
Date: Tue, 30 Jul 2024 09:04:52 -0400
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
	"Julien Grall" <julien@xen.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <19103be5c1e.1009d7316565959.1812404802621701586@apertussolutions.com>
In-Reply-To: <220ebc7e-36eb-40af-9fa0-133bb458dfd5@suse.com>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
 <ef4b21d8-a5a9-4d24-bf18-908b5ee067db@citrix.com> <220ebc7e-36eb-40af-9fa0-133bb458dfd5@suse.com>
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Tue, 30 Jul 2024 08:58:03 -0400 Jan Beulich  wrote ---

 > On 30.07.2024 14:35, Andrew Cooper wrote:=20
 > > On 30/07/2024 11:57 am, Jan Beulich wrote:=20
 > >> XSM is a generic framework, which in particular is also used by SILO.=
=20
 > >> With this it can't really be experimental: Arm enables SILO by defaul=
t.=20
 > >=20
 > > It's stronger than this.=20
 > >=20
 > > XSA-295 makes SILO the only security supported configuration for ARM.=
=20
 > =20
 > Okay, switched to "Arm mandates SILO for having a security supported=20
 > configuration."=20
 > =20
 > >> --- a/SUPPORT.md=20
 > >> +++ b/SUPPORT.md=20
 > >> @@ -768,13 +768,20 @@ Compile time disabled for ARM by default=20
 > >>=20
 > >>      Status, x86: Supported, not security supported=20
 > >>=20
 > >> -### XSM & FLASK=20
 > >> +### XSM=20
 > >> +=20
 > >> +    Status: Supported=20
 > >> +=20
 > >> +See below for use with FLASK and SILO.  The dummy implementation is =
covered here=20
 > >> +as well.=20
 > >=20
 > > This feels weird, although I can't suggest a better option.=20
 > >=20
 > > XSM isn't optional; it can't be compiled out,=20
 > =20
 > How can it not be? There's an "XSM" Kconfig control.=20
 > =20
 > > nor can the dummy policy,=20
 > =20
 > In a way. Yet how the dummy policy is instantiated is quite different=20
 > between XSM=3Dy and XSM=3Dn.=20

I have pointed this out a few times, the difference between XSM=3Dy vs XSM=
=3Dn determines how the dummy policy is embedded into the hypervisor. XSM=
=3Dn, causes the dummy policy hooks to be included directly for the xsm_* h=
ooks. When XSM=3Dy, then the callback wrapper functions are used for the xs=
m_* hooks with dummy policy set for the callbacks.

 > > so it's weird to call out what literally cannot have a statement=20
 > > different to the rest of Xen.=20
 > >=20
 > > Combined with ...=20
 > >=20
 > >> +=20
 > >> +### XSM + FLASK=20
 > >=20
 > > ... this wanting to say "Flask (XSM module/policy)" IMO, maybe what we=
=20
 > > really want is:=20
 > >=20
 > > ---%<---=20
 > > ### XSM (Xen Security Modules)=20
 > >=20
 > > Base XSM is a security policy framework used in Xen.=C2=A0 The dummy p=
olicy=20
 > > implements a basic "dom0 all powerful, domUs all unprivileged" policy"=
.=20
 > > ---%<---=20
 > >=20
 > > intentionally without giving a Status.=20
 > =20
 > As per above, imo XSM=3Dy wants security status named. That's, after all=
,=20
 > part of what was missing / ambiguous so far.=20
 > =20
 > > Then, the two blocks below are clearly alternative modules which have=
=20
 > > optionality and different support statuses.=20
 > =20
 > I'll change the wording there some, to be closer to what you and also=20
 > Daniel ask for.=20

Thank you.

dps

