Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B788DCB2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698464.1090143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRcq-0003Rx-EZ; Wed, 27 Mar 2024 11:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698464.1090143; Wed, 27 Mar 2024 11:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpRcq-0003PH-Bj; Wed, 27 Mar 2024 11:39:24 +0000
Received: by outflank-mailman (input) for mailman id 698464;
 Wed, 27 Mar 2024 11:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIpq=LB=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rpRco-0003Np-PK
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:39:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75dc23c-ec2e-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:39:21 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a4dfe6564b6so119877366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:39:21 -0700 (PDT)
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
X-Inumbo-ID: a75dc23c-ec2e-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1711539561; x=1712144361; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7Cmj1xAT0bHcr5rAW0psYRi+vKEAs6qSS6NwGHjFIY=;
        b=s+QPq1AeviPuVxp4TJjHnkQb0PzxPLoBlc88oGS/alw4uKdx5F/sRYdN+8+jqhYaMi
         LnDL/MwQCXT70Q7iEaxK8UlOTyIjyNc0fTkqQwgt8TK1it7bY7/WF8PjxlwQSMWEIdpS
         r+t+Iz6PpQrRO4q3wEGOgYzoi/x1H3Hh+Nni1pcF8iqbB+MXtliqIWfkiXLWTzqsEV/D
         wGH4R68zZs0EP+VDRekVuKLOdoVaJGFYACLME2Q46b7RSkHDQUV3CM23tKjXgn1DXmIR
         ya3yuNO6NMmREkJrP5pOpqG/PtqB33qMhKeYmcFXjgVHVrlF6T00I4ghzN5o0+ui9436
         YV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539561; x=1712144361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7Cmj1xAT0bHcr5rAW0psYRi+vKEAs6qSS6NwGHjFIY=;
        b=WmZ5x0oMDzHPoDfJ6tiljVToDKCZQ0jZB/kQjn19CX1pTEtBP4JVDDmMZl/gLhLz5I
         JjVOD+40sliCgqVbif72EFI/6IrnVXdF39eD78DXuJlAsjblo9mg+mPqLRHVSzY0QnYq
         NcslT+hlI5AJ3LFcheN6BKSlEzRAbHnD6LCH4BgGUESleB51fAZLoKTFJVLNi738VkQa
         D4epkOWPKyJTjL9V/hhKDSG+UBha6H196njBEou/x7Ozb+jINVMlnBHSlgd4YnWA51/n
         leHRaoOVMLWhBZfXk3fCsEEB5F2kpDu6WGTQ3mJJSM6ilsZKxdXdSB/dDRr+UboCL6FF
         2srQ==
X-Forwarded-Encrypted: i=1; AJvYcCWurwrSRdtNZr6cwhrYYQcgdgEyy1I0ol0D+b8ngn8Sm7XTBU0iIpU8lbkXgFC+lwTNIBvyQx4gHncn4uGXlauDAtbavY9GmbeK2/9P6hU=
X-Gm-Message-State: AOJu0Yxh6DLbefmL2VprTqn/3JPIX4sGy9ovhIc2tVaP726AdgWZfL2u
	BrlD4ncOk8i+eXvuZva7wlAgh4QYDnn6dFkvldIzvee15FmWRmD+C+KxZYFQ82p3jiRLhaorIBg
	IR1G3PiAyvnmsr75+BdiJ3ze9JLSx24gHhH8dKw==
X-Google-Smtp-Source: AGHT+IGwcSyKX+BtPeQ0QrtY6dv4B9tAsaG+qOky17YragqNxKJd0u+dz6Iyx+l3e+tGd+I7iPoQEBTEimNFWFb5y+s=
X-Received: by 2002:a17:906:24d2:b0:a45:b1d8:200c with SMTP id
 f18-20020a17090624d200b00a45b1d8200cmr2756034ejb.14.1711539561168; Wed, 27
 Mar 2024 04:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech> <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
 <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
 <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com> <CAG+AhRUzj+hY0+F-zCSaq5nkC5CTLRdtcbmtr7PZEQKrdMWWWQ@mail.gmail.com>
 <22ab32bb-b0d0-4d68-8918-5fcb42cc0f88@suse.com>
In-Reply-To: <22ab32bb-b0d0-4d68-8918-5fcb42cc0f88@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 27 Mar 2024 12:39:10 +0100
Message-ID: <CAG+AhRVEM+hcEbBO5Konjty8gQtZ0kq27rPjXCqsF627t9fqwg@mail.gmail.com>
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
To: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org, 
	Andrea Bastoni <andrea.bastoni@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi guys,

On Fri, Mar 22, 2024 at 8:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.03.2024 18:31, Carlo Nonato wrote:
> > On Thu, Mar 21, 2024 at 4:57=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 21.03.2024 16:04, Carlo Nonato wrote:
> >>> On Tue, Mar 19, 2024 at 4:30=E2=80=AFPM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 15.03.2024 11:58, Carlo Nonato wrote:
> >>>>> --- a/docs/misc/xen-command-line.pandoc
> >>>>> +++ b/docs/misc/xen-command-line.pandoc
> >>>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> >>>>>
> >>>>>  Specify a list of IO ports to be excluded from dom0 access.
> >>>>>
> >>>>> +### dom0-llc-colors
> >>>>> +> `=3D List of [ <integer> | <integer>-<integer> ]`
> >>>>> +
> >>>>> +> Default: `All available LLC colors`
> >>>>> +
> >>>>> +Specify dom0 LLC color configuration. This option is available onl=
y when
> >>>>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all=
 available
> >>>>> +colors are used.
> >>>>
> >>>> My reservation towards this being a top-level option remains.
> >>>
> >>> How can I turn this into a lower-level option? Moving it into "dom0=
=3D" doesn't
> >>> seem possible to me. How can I express a list (llc-colors) inside ano=
ther list
> >>> (dom0)? dom0=3Dllc-colors=3D0-3,12-15,other-param=3D... How can I sto=
p parsing
> >>> before reaching other-param?
> >>
> >> For example by using a different separator:
> >>
> >> dom0=3Dllc-colors=3D0-3+12-15,other-param=3D...
> >
> > Ok, but that would mean to change the implementation of the parsing fun=
ction
> > and to adopt this syntax also in other places, something that I would'v=
e
> > preferred to avoid. Anyway I'll follow your suggestion.
>
> Well, this is all used by Arm only for now. You will want to make sure Ar=
m
> folks are actually okay with this alternative approach.
>
> Jan

Are you Arm maintainers ok with this?

Thanks.

