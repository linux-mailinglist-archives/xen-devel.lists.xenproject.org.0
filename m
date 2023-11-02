Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDCE7DF384
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 14:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626898.977588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXaD-0000ed-CS; Thu, 02 Nov 2023 13:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626898.977588; Thu, 02 Nov 2023 13:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXaD-0000bu-9s; Thu, 02 Nov 2023 13:18:01 +0000
Received: by outflank-mailman (input) for mailman id 626898;
 Thu, 02 Nov 2023 13:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7GzT=GP=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1qyXaB-0000bo-QM
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 13:17:59 +0000
Received: from sender3-op-o17.zoho.com (sender3-op-o17.zoho.com
 [136.143.184.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3be1b934-7982-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 14:17:57 +0100 (CET)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181]) by mx.zohomail.com
 with SMTPS id 1698931072439773.4063100314564;
 Thu, 2 Nov 2023 06:17:52 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5af5b532d8fso11021307b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 06:17:52 -0700 (PDT)
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
X-Inumbo-ID: 3be1b934-7982-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; t=1698931074; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EkO8O429mN8NP1pIqdoJQ+cjzcC7yqUr3QHBFOsmgHvpZiFZfEsF/ZKh+h7uUhSCVTe+ZY0MSAWjfUCO72klbt8VmxRhe0sbFfv9RSi4HSpemb6vJ37zV9Flpbc1NSSgsfx7+lXulmCYQcNnD6/FO+ufFV2VUJNwP6/4FW+99go=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1698931074; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z/Dfm9D3/b6kTHF4kSxLSu1hkKj2luCtX0NhIqjYorY=; 
	b=JrHgJShKR+UZjAgN55R8nn7zYQ4J6QVFyGyWHjz7LbB691xrRh+Ox0J8Bv+7e4wGyRhio5cxSimgp2YuocX75y+bnhT8dL5NYZZhDE36qzjdDUtyfI+bWISzQ1CtlQLIR2b66PlHJMkt/q6DOeBIdBGScOo1qm6Q/6Oj6vHU0Oo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1698931074;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Z/Dfm9D3/b6kTHF4kSxLSu1hkKj2luCtX0NhIqjYorY=;
	b=R8KAfukqA7R429BWuTS9lPgMOTMOL4NUlJOci1bXjbKsjZP6U8kDE7gWcfGW4Xu3
	9mC3M7+KkDSIcJ0XGcMQCbLa3hp3KpQisi+Ea3BHfLhuQ/MWnwlU677rlzFfteu8g8f
	t15u7ubG2cuv6dfz2dFaq+Vwz/sZf9AMMr/3geLo=
X-Gm-Message-State: AOJu0Ywnx8qPk5zlYsS5Qhz9P/sYRADshLZM9cM8Xao93LTeOPszwasR
	GRWaqXRZO3xHZ9QuP6vOHG5Bw/q3+bMGeB3Dn6M=
X-Google-Smtp-Source: AGHT+IGcojE0DIrM1JNcbYuKU8gLNqJqFntipwAulYqUZv1SNBVMsd11UImxdejHVXiQ1icRofuM7ttVNDNvKCYJ00E=
X-Received: by 2002:a5b:706:0:b0:d9b:3b3e:5a07 with SMTP id
 g6-20020a5b0706000000b00d9b3b3e5a07mr17263999ybq.5.1698931071561; Thu, 02 Nov
 2023 06:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231101192058.3419310-1-andrew.cooper3@citrix.com> <20231101192058.3419310-3-andrew.cooper3@citrix.com>
In-Reply-To: <20231101192058.3419310-3-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 2 Nov 2023 09:17:14 -0400
X-Gmail-Original-Message-ID: <CABfawh=DAGvkAgW=S5DhdCPhqe2iLvK+6LG8kBjx8qJ-2q5Bgg@mail.gmail.com>
Message-ID: <CABfawh=DAGvkAgW=S5DhdCPhqe2iLvK+6LG8kBjx8qJ-2q5Bgg@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/vmx: Disallow the use of inactivity states
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 3:21=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> Right now, vvmx will blindly copy L12's ACTIVITY_STATE into the L02 VMCS =
and
> enter the vCPU.  Luckily for us, nested-virt is explicitly unsupported fo=
r
> security bugs.
>
> The inactivity states are HLT, SHUTDOWN and WAIT-FOR-SIPI, and as noted b=
y the
> SDM in Vol3 27.7 "Special Features of VM Entry":
>
>   If VM entry ends with the logical processor in an inactive activity sta=
te,
>   the VM entry generates any special bus cycle that is normally generated=
 when
>   that activity state is entered from the active state.
>
> Also,
>
>   Some activity states unconditionally block certain events.
>
> I.e. A VMEntry with ACTIVITY=3DSHUTDOWN will initiate a platform reset, w=
hile a
> VMEntry with ACTIVITY=3DWAIT-FOR-SIPI will really block everything other =
than
> SIPIs.
>
> Both of these activity states are for the TXT ACM to use, not for regular
> hypervisors, and Xen doesn't support dropping the HLT intercept either.
>
> There are two paths in Xen which operate on ACTIVITY_STATE.
>
> 1) The vmx_{get,set}_nonreg_state() helpers for VM-Fork.
>
>    As regular VMs can't use any inactivity states, this is just duplicati=
ng
>    the 0 from construct_vmcs().  Drop the field, leaving a comment as to =
why
>    it is skipped.

I would like to keep the vmx_get_nonreg_state() function being able to
gather this field as it might be an interesting piece of data we want
to keep an eye on during fuzzing. I would prefer just sanitizing the
value in the set() function with perhaps a gdprintk message that it
happened?

Tamas

