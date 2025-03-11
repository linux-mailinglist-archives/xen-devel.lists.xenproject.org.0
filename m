Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57DAA5C2B8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908137.1315288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzhC-0004Ar-Kv; Tue, 11 Mar 2025 13:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908137.1315288; Tue, 11 Mar 2025 13:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzhC-00048A-Hu; Tue, 11 Mar 2025 13:30:58 +0000
Received: by outflank-mailman (input) for mailman id 908137;
 Tue, 11 Mar 2025 13:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gv3n=V6=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1trzhB-000484-8G
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:30:57 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e52adb0-fe7d-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 14:30:55 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1741699847436718.392932341477;
 Tue, 11 Mar 2025 06:30:47 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6feafc707d3so50124017b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 06:30:47 -0700 (PDT)
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
X-Inumbo-ID: 0e52adb0-fe7d-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; t=1741699850; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PnXvOy/ozhMMNuyQPYj8ki/P2F4Gc7mQRUO5Ii8mQJKPHuA71VBtHwQwcx4xXqSU0Qg+igHwNAgReVmZTaFta2m+2zemXAtip1qYxTjOPMUy2vXNvofDuu2KVREb+l8gXSovC1AEN6ZK6tVDdF5a6eWq3+G5yIh4m0GJnh+7nBE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741699850; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dV9FQ6qxY/K8lDM0QGYGwJOwo/oiKz7kG/7bEWa9Dkc=; 
	b=jAg3VzA/GI9XPvzu2yMEs7xlYNzV3pkJ9V9ThwmP5zmKqLDxeFLjxRJnxVMF6usDDz6RPcFCoTeG8/1GHpV8mB7p1vB07r0kiM3Fh/eGBneJ6wfvENG4LX4IWEh/yHznZhBur7VzGkxoVcte1rDtz4gpGZ4d8VAfMLXIp0d23Lw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741699850;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dV9FQ6qxY/K8lDM0QGYGwJOwo/oiKz7kG/7bEWa9Dkc=;
	b=KDj8lZoivs0GnFByv/loLCYAHwTnbL+0Z/uJSrtYqhq/+YzTax+hhFQsYJtxRzf+
	IxXOqjDnQlKhfA48IY3QMHjH0i5Zb/L9ePMfC4l3D5R9qvk6e6grdEIsYQG1D+h+BJw
	WJs/zw3T8BX0SQ4B0XGNTkvU4UGCtsdnH5t6Homg=
X-Forwarded-Encrypted: i=1; AJvYcCV+t3MO9u/5CUbE744aF1sPsjjUWjMMhUnd6K7/NR+RqpYMg/s39tTWpsffBaz0OzOzT0OAfPV0qek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoU2Mrq7LlleyFNXdujw7tK7Zo3rsxxWdJ3toFsl2c3aaXNZn8
	Y98Ji+gLk+21alCu6Df7NHIl0dMKTNgbYjhRPhGDBb3EUHLzzHknrtNso4jNU6gI5NkzPK80RGD
	w8DnwjSJ86nL3zXcwMw0bSZ0Nu4w=
X-Google-Smtp-Source: AGHT+IEHv9tRdGmHBjv43ZrlV47ldcgucR7M6Jl1jlLZ7ayUZUCW7TWKwxXQA5kRxqxFGL/mMLMZa6IKwnwOdGTJ69E=
X-Received: by 2002:a05:690c:4d06:b0:6fd:3fd0:6f2f with SMTP id
 00721157ae682-6ff09260720mr56201737b3.26.1741699846613; Tue, 11 Mar 2025
 06:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com> <8d35ec8373b65bca2fe471eac7a17cb2a98db3fc.1741687645.git.Sergiy_Kibrik@epam.com>
 <16cb9d3c-c02e-487b-9982-466f0e2f0c41@suse.com>
In-Reply-To: <16cb9d3c-c02e-487b-9982-466f0e2f0c41@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 11 Mar 2025 09:30:09 -0400
X-Gmail-Original-Message-ID: <CABfawh=och+_ZsRSnZb01XOg50OGPSTvbdP45YJvS7xEATaiow@mail.gmail.com>
X-Gm-Features: AQ5f1Jo6cvXrq72K2DGM407J-RuiXJieHA2q56h6X-6ZlZozZdIShUbtjjeVnuM
Message-ID: <CABfawh=och+_ZsRSnZb01XOg50OGPSTvbdP45YJvS7xEATaiow@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 8:01=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.03.2025 11:23, Sergiy Kibrik wrote:
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -92,7 +92,7 @@ config HAS_VMAP
> >  config MEM_ACCESS_ALWAYS_ON
> >       bool
> >
> > -config MEM_ACCESS
> > +config VM_EVENT
> >       def_bool MEM_ACCESS_ALWAYS_ON
> >       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> >       depends on HVM
>
> I still don't see why we would then stick to MEM_ACCESS_ALWAYS_ON as a na=
me
> for the sibling option.

I'm not opposed to renaming it but it's also not something I see much
value in doing. It's not used anywhere in the code, it's purely used
in the config selector to mark that on x86 the
vm_event/mem_access/monitor bits are not setup to be compiled-out.

Tamas

