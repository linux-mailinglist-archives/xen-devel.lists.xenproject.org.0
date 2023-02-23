Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B26A0C9A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500513.771945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDEO-0001ds-AE; Thu, 23 Feb 2023 15:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500513.771945; Thu, 23 Feb 2023 15:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDEO-0001aq-7W; Thu, 23 Feb 2023 15:10:00 +0000
Received: by outflank-mailman (input) for mailman id 500513;
 Thu, 23 Feb 2023 15:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxRn=6T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVDEM-0001aL-PI
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:09:58 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 220e86e2-b38c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 16:09:57 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id y14so3998056ljq.4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Feb 2023 07:09:56 -0800 (PST)
Received: from [192.168.8.199] (46.204.108.92.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.92]) by smtp.gmail.com with ESMTPSA id
 u17-20020ac24c31000000b00498f77cfa63sm275633lfq.280.2023.02.23.07.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:09:55 -0800 (PST)
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
X-Inumbo-ID: 220e86e2-b38c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vb6gzEl4fiteXfEExIs/E7Jh6R7+F8ajThJ1JqPT8KE=;
        b=CGuQG/7ISSB60EQivvX6iasrHkZwYVoqcMc0FFyaBnxKAhAFJsP7uQ+J39N/U9uOqs
         0ugJmFHz/PaoooBW4Rp80VI0N0krhGXaoK9Oxck0tcrEnJRZCstwzI3jfQ3fE/U8EstW
         A8sBLWWwtsrzNOaZ6sVa7LpiPjIwZ5ju0MzzB3oZ7PNdLL649CmIGCcIrIfHgCSb5VNr
         QHUtq3zY0x4up0a4lo2vzol3oX3+F5tPYD1C3Ac7xCXjCYxm74nB6jeavJKA45aPi3rT
         MHHKLfQtkS40W+kHZB9SFw5UX9XNZgYxetAprhNskqS1nwkVyQ3yt9i9eGjJkD39kq0P
         YjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vb6gzEl4fiteXfEExIs/E7Jh6R7+F8ajThJ1JqPT8KE=;
        b=jQxoGGIOU90RbIvq3O7hhwCPOLZgL41Az5GgxgntLonE1SvUuiUaV6wfmkIqAgLFXf
         Tv2VmOkqswv8uoLZQ7xeEX3D0XRYRqpMF4/FfwP5D5UOseYAbO3m80kTNuNgGdA8N9Nj
         6qLEB+WlBV0Di/SOBL6VfKmAfeGaxiu9xQsqISzrNcolrRdE9YfgfakFeU9WpAsbMauC
         9mIiH1wvfzgVTkYnyQwaw8xx10LH+QIwLvQ8YYLEWpa8kT9zs2rO7qVV+TW3oxZs2JbA
         /BfZrZZd6LzS5gygToTd61MXtMvRbhegGsTRkWDHKZv19iCbbo6Zg8YEEkHD4KvddEsT
         oVbA==
X-Gm-Message-State: AO0yUKWa3boacmSw8bsl2o2VTLaHxBXo1udIrMF4ZwxYOQ7TuY2Vja8D
	LDadlO0opUr4zyKr1EY0CKw=
X-Google-Smtp-Source: AK7set/su5YlghlVYnskZJf7xi09668tPiFrbNMWegasuaWxc4Q+7Otz6BbV4ldPyjD+m2M8qkWKCg==
X-Received: by 2002:a05:651c:a08:b0:290:77e9:9bbd with SMTP id k8-20020a05651c0a0800b0029077e99bbdmr6636205ljq.9.1677164996022;
        Thu, 23 Feb 2023 07:09:56 -0800 (PST)
Message-ID: <01305433b1902231138fc98be389ec3065089823.camel@gmail.com>
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>,  xen-devel@lists.xenproject.org
Date: Thu, 23 Feb 2023 17:09:54 +0200
In-Reply-To: <c6fb76d4-7ce1-98d7-8b29-c8752854f8c7@suse.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
	 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
	 <c6fb76d4-7ce1-98d7-8b29-c8752854f8c7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-02-23 at 14:32 +0100, Jan Beulich wrote:
> On 20.02.2023 17:40, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/xen/bug.h
> > @@ -0,0 +1,161 @@
> > +#ifndef __XEN_BUG_H__
> > +#define __XEN_BUG_H__
> > +
> > +#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> > +
> > +#define BUGFRAME_run_fn 0
> > +#define BUGFRAME_warn=C2=A0=C2=A0 1
> > +#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 2
> > +#define BUGFRAME_assert 3
> > +
> > +#define BUGFRAME_NR=C2=A0=C2=A0=C2=A0=C2=A0 4
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <xen/errno.h>
> > +#include <xen/lib.h>
> > +#include <xen/stringify.h>
> > +#include <xen/types.h>
> > +
> > +#include <asm/bug.h>
>=20
> Looking at patch 2 onwards I came to wonder: How does that work
> without
> you first removing stuff from the respective asm/bug.h (or adding
> suitable #define-s to limit what gets defined below)? From all I can
> tell the compiler should object to ...
>=20
> > +#ifndef BUG_FRAME_STRUCT
> > +
> > +struct bug_frame {
> > +=C2=A0=C2=A0=C2=A0 signed int loc_disp:BUG_DISP_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 unsigned int line_hi:BUG_LINE_HI_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 signed int ptr_disp:BUG_DISP_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 unsigned int line_lo:BUG_LINE_LO_WIDTH;
> > +=C2=A0=C2=A0=C2=A0 signed int msg_disp[];
> > +};
>=20
> ... this, as asm/bug.h will have declared such a struct already. The
> #define-s further down may not be a problem if what they expand to
> matches in both places, but that's then still a latent trap to fall
> into.
My fault. It doesn't work. I checked only RISC-V arch before and didn't
start all the test for patch 2...

So yeah, in patch 2 should be updated asm/bug.h headers with define
BUG_FRAME_STRUCT and remove all common parts [=C2=A0BUG_DISP_WIDTH,
BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH, BUGFRAME_run_fn, BUGFRAME_warn,
BUGFRAME_bug, BUGFRAME_assert, BUGFRAME_NR,
{__start|__stop}_bug_frames{ | _{0-3} }[], ].

Thanks for noticing that.
>=20
> Jan
~ Oleksii


