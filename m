Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4198BAAE328
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 16:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978614.1365356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCfty-0001Gp-6F; Wed, 07 May 2025 14:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978614.1365356; Wed, 07 May 2025 14:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCfty-0001E1-31; Wed, 07 May 2025 14:37:38 +0000
Received: by outflank-mailman (input) for mailman id 978614;
 Wed, 07 May 2025 14:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWiO=XX=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uCftx-0001Dv-9F
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 14:37:37 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d12b3d3e-2b50-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 16:37:36 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2c76a1b574cso2241643fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 07:37:36 -0700 (PDT)
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
X-Inumbo-ID: d12b3d3e-2b50-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746628655; x=1747233455; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgIQEVUnnc1TwalORp+iBCiiXf+u3UhcepqcCanzIH4=;
        b=fXxjqs+qpT1cyZHpyOx7J/LiwI+cEdtgpDKl3EBy6Xg5nZDYqedMPIrY3LXQO12ZWi
         oSc4Rv9w9z38dbuZ6ro3/Yzr0JwfMivX8bzNtBhdupCci44SGpip6oBkRQQB3Y2NPv1Z
         1SIZttDsEIIuD9FYJGrvfWjbmG4w/c3PFDR0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628655; x=1747233455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgIQEVUnnc1TwalORp+iBCiiXf+u3UhcepqcCanzIH4=;
        b=EbMTsOnh6l7MMFguZSRGYdD5DeVRnr8GNbX9ihL5aP/oEDgWZ9Kesja//cEayA86/3
         +o8VIiPJv4oGtoXKWW4kFzXFMsll24PfII4S4gDXXNyEi7q5fF2O6oJYbqZqKLJSrULc
         9+3kFwQ5sup1l4a5rrXR4vW3u6fDJOnyWiU90rJOBEQ13ZwUj7h21RT8dAnukM4QKaoh
         GXNArUSu9Rg6aOI2+LQPwdOukKNXld/MwmH0QtWUkRzzmnqVOFCgSHJ7+J1+9zBp7CkY
         6pzGIFwVTFIPXJMtJPsua0iI14a8tqZ9TcCEdb6y3qhBiDrJ97Ocl8KmeN2JhrYVe0nH
         dUqA==
X-Gm-Message-State: AOJu0YymWvu9LxfFW+ktGdiqiXFhrON3irSeQJ2ptapka0nlxjxfGmf+
	4ABG/g8Xm75ia9HXSrNhpLq9KbaxkeGlvzWZP4HaVZjzmXVy7hxvaJYNDNnc0PeedwKz4D920So
	51q8wR0GVaBex655HCmSCuKCWvQ+6oPvVYILLv2GUN5ojbraGyg==
X-Gm-Gg: ASbGncuCyp0cPn+bAeLps0/Tzt9fQQYTQdH+deWFGZFOKeq+/svCG+YG3AxryroaWfx
	ti+p7leY0YKr1CbppLr+lnPc8v2P9X61uvmfqH6lM0NAw2B8Q0BW7s13kFRB+KhnQTMxl0bQsl6
	G7NJWnNjIFrz5NxW/NR6t7
X-Google-Smtp-Source: AGHT+IE2LkKNCLfc5wHykOxGIYIL07/uXriNcUawN/gFIvwQGQLDD0XZAqUM6q7o9aZvqNPAHREX10P6ue/QvB13zN0=
X-Received: by 2002:a05:6870:c69c:b0:2d6:2a40:fbe7 with SMTP id
 586e51a60fabf-2db5bd62c30mr2293275fac.6.1746628655211; Wed, 07 May 2025
 07:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250417103000.827661-1-ross.lagerwall@citrix.com> <37065e8d-33c2-4e6e-8c2c-f4f8a9cd3ce1@suse.com>
In-Reply-To: <37065e8d-33c2-4e6e-8c2c-f4f8a9cd3ce1@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 7 May 2025 15:37:24 +0100
X-Gm-Features: ATxdqUH0mS3Jl05RuCqCmpqiD5mxoGBwwQHMOmXZIjykU5qu2kQJ6cUhDwz7HkE
Message-ID: <CAG7k0EoSEZruueJP3Xwu309tjx+wEnC28Q4D2DE=DcRF=cJAeg@mail.gmail.com>
Subject: Re: [PATCH] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 2:23=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 17.04.2025 12:30, Ross Lagerwall wrote:
> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -104,6 +104,14 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *o=
p)
> >          cpufreq_residency_update(op->cpuid, pxpt->u.cur);
> >
> >          ct =3D pmpt->perf.state_count;
> > +
> > +        if ( op->u.getpx.total < ct )
> > +        {
> > +            spin_unlock(cpufreq_statistic_lock);
> > +            ret =3D -ENOSPC;
> > +            break;
> > +        }
>
> Simply producing an error is not an option imo. See pmstat_get_cx_stat()'=
s
> behavior. Imo the calculation of ct wants to become
>
>         ct =3D min(pmpt->perf.state_count, op->u.getpx.total);
>
> yet then the copying of the 2-dim array of data becomes more complicated
> when ct < pmpt->perf.state_count. An option may be to document that this
> array is copied only when the buffer is large enough.

Another option would be for the caller to explicitly pass in both array siz=
es
and Xen can copy as much as fits since in either case there would need to b=
e a
way for Xen to return how much it has (separately) copied for both arrays. =
Does
that make sense?

>
> Furthermore I think it would be a good idea to also amend the public head=
er
> with IN/OUT annotations for the fields which are input and output (also f=
or
> the Cx part, ideally).

Sure.

>
> And then - doesn't xc_pm_get_pxstat() have a similar issue?
>

Indeed, I can send a patch for that.

Ross

