Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02AE973CC7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 17:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795832.1205303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3D2-00020d-FO; Tue, 10 Sep 2024 15:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795832.1205303; Tue, 10 Sep 2024 15:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3D2-0001yU-BK; Tue, 10 Sep 2024 15:55:16 +0000
Received: by outflank-mailman (input) for mailman id 795832;
 Tue, 10 Sep 2024 15:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nZKp=QI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1so3D0-0001yO-8P
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 15:55:14 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1067cede-6f8d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 17:55:12 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5356bb5522bso7498258e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 08:55:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903c32sm1212984e87.196.2024.09.10.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 08:55:11 -0700 (PDT)
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
X-Inumbo-ID: 1067cede-6f8d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725983712; x=1726588512; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YwohzmgqHRqieR/GKBUWr6jLoFkR/a1ZPHNt+RRZfEc=;
        b=c2ifWcuP3cDfWdwz8yJaErUeAZjN9sqx8KYM2los2OtiBHs+0RY00eFBvan79jcoKO
         TuLYTUhtoqUEOKf4wlyrFRDrj2SalGjmzlB0HpHPkuxpBOoxFRC089A7UX/aYIGTXgVi
         PQSY7qsQ5BXfZuGiqC/HziqarsaFksIzAhZTDTFjbp/ST2M4BCKG5K8Ifr+7v5tji2wE
         us0n4WpSJDnx58fP9Hvpqlt9lwhN/3rBSZEAzJlWfpg9sDoQZ6UGRtv3YG05+7/Ugpkr
         7IrV4XZLH9JZzOMrJRXkUqZsxnp1fG7Ph6ZGw1b0mdx/bnRTTl9xyOqdR3Ep/zq30rvX
         ss5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725983712; x=1726588512;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YwohzmgqHRqieR/GKBUWr6jLoFkR/a1ZPHNt+RRZfEc=;
        b=Ia9vQDtEBUA6lJbe3wJsSVD54nQeyrsjImj34NMMLCZX8zK2xvIvX52ISGPRCdabWy
         3sQXBn6dcj/n5pmQtlcJd/z0yJfopgi1W+bWb32NPIgK3VMrYfxoghXmiadfLdmrZ1K0
         UMATxMGpFmvjm8J+jXZLlEkWC1LEm/oFra2JNRMCIc7TA8j5HfhoxsiQKENatrz/hUG9
         2Ldgg18eyVWAOEdh5YjXrOZrJjQ2eMCNZ6BzxSXLMsGdgLeTVBzQO5xA8Ecw0RBWRN3c
         i/qnQo/10lCwwSJH8xWof3PTog2hejAJRc9PlKN84tLjzGu3MYBfOSx6DFm81+i3OXBW
         sCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Y3fRfmgdLOBXuAxAooHaZ1PO5T/KnDM+HHOjgjO1x6n1r8g83ElpdLtfjtjaOYamfp5SrBjbWh8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHNcHhcUFH7rPZafGBp75kg8qT/FDaWoDNfOSkEkly2idiNypW
	YGzMhdk5wD8IrfOF71UCdoOrDUzUd3jsaFcKRZDXKYko0cS+lUlK
X-Google-Smtp-Source: AGHT+IEaMw2YzfdLpph3u9a7bmS30gqeHIqRh0FX3VpTnuqxgqWVAOJFxwto9kTSXhjya/USe0XXCg==
X-Received: by 2002:a05:6512:3e04:b0:530:d088:233f with SMTP id 2adb3069b0e04-536587fa90fmr9984587e87.40.1725983711708;
        Tue, 10 Sep 2024 08:55:11 -0700 (PDT)
Message-ID: <707d5c62020ae261ddfbc93a9383e230eb7b7e86.camel@gmail.com>
Subject: Re: [PATCH v6 4/9] xen/riscv: set up fixmap mappings
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 10 Sep 2024 17:55:10 +0200
In-Reply-To: <4d98b0fb-e797-4a4f-9edc-4894f85b357d@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <a05babb0982a3a0709ed08c3eeb9a729421e1bd1.1725295716.git.oleksii.kurochko@gmail.com>
	 <4d98b0fb-e797-4a4f-9edc-4894f85b357d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-10 at 12:01 +0200, Jan Beulich wrote:
> On 02.09.2024 19:01, Oleksii Kurochko wrote:
> > Set up fixmap mappings and the L0 page table for fixmap support.
> >=20
> > Modify the Page Table Entries (PTEs) directly in arch_pmap_map()
> > instead of using set_fixmap() ( which relies on map_pages_to_xen()
> > ).
>=20
> What do you derive this from? There's no set_fixmap() here, and hence
> it's unknown how it is going to be implemented.
I derived it from the my code where is set_fixmap() is implemented but
agree that in brackets it is better to write "will use
map_pages_to_xen()" instead of "which relies on map_pages_to_xen()".

>  The most you can claim
> is that it is expected that it will use map_pages_to_xen(), which in
> turn ...
>=20
> > This change is necessary because PMAP is used when the domain map
> > page infrastructure is not yet initialized so map_pages_to_xen()
> > called by set_fixmap() needs to map pages on demand, which then
> > calls pmap() again, resulting in a loop.
>=20
> ... is only expected to use arch_pmap_map().
it is what is written in the message, isn't it? But I am okay to change
this part of the commit message to:
   {set, clear}_fixmap() is expected to be implemented using
   map_pages_to_xen(), which, in turn, is only expected to use
   arch_pmap_map().

>=20
> > @@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > =C2=A0
> > +/* Write a pagetable entry. */
> > +static inline void write_pte(pte_t *p, pte_t pte)
> > +{
> > +=C2=A0=C2=A0=C2=A0 write_atomic(p, pte);
> > +}
> > +
> > +/* Read a pagetable entry. */
> > +static inline pte_t read_pte(pte_t *p)
>=20
> const pte_t *?
It would be better to make it const. Thanks.

~ Oleksii


