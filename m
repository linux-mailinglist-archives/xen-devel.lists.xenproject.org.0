Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE2779C9C
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 04:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582782.912711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUeQd-0007A6-HS; Sat, 12 Aug 2023 02:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582782.912711; Sat, 12 Aug 2023 02:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUeQd-00077l-ER; Sat, 12 Aug 2023 02:32:35 +0000
Received: by outflank-mailman (input) for mailman id 582782;
 Sat, 12 Aug 2023 02:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gpgP=D5=exostellar.io=kevin@srs-se1.protection.inumbo.net>)
 id 1qUeQb-00077f-Q7
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 02:32:33 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bff9df0-38b8-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 04:32:30 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe7e1ef45dso4103135e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 19:32:30 -0700 (PDT)
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
X-Inumbo-ID: 7bff9df0-38b8-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exostellar.io; s=google; t=1691807549; x=1692412349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lNbxMdL21sQVZT8xQtmgPQyhZiPQ29lf+o7Q+xUGHE=;
        b=Lxb93fjSyHkwBsCFLfcFCjay/23B9mSx5zvkH+DTbxMDCrcffBPRJlmBFfdhOe2RvR
         D89hJDSq5lxVyikq+NTf71RvyTLqRYP+/OSdMNiCtXw4V9VQu/usjC2zGiFd17yqnEjQ
         pvk1ibVhIqUYswjcH0D87qt47r8899lQfWQIecFHrSVFOOtF0LU+Q+0fkBisCuibxFMH
         7r7oUU9CB07LF0Chfr9RVeONwRD2LEoqn4+4xnE5grLCgGBC6j9LJyOT9hmrCe3HZFjU
         pG/DrSSRBlwkmZscXWggzVdez4L5eqyKktlH1h4h5RZIVvEoPXSBRc8+xSBD4Y5/O2S4
         uHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691807549; x=1692412349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lNbxMdL21sQVZT8xQtmgPQyhZiPQ29lf+o7Q+xUGHE=;
        b=i9djcHI2ec1si9Xv/aLmL25NnpsIsv05oOWiL4lI7IF4eUPmiwwK/e+qwYZFNjX+Oy
         xF0DWXqyCehxHmbCEV0TE7AzD4izitbkkyP92JvHAhLTBuWepheVExxTwKXaTLDekG8L
         l8AzyABMKShuZGEsQHJHqed3WkMpQifHNOK9slH4Aa9SueNQ672FsanOPWcq2ZfIQLmM
         gsF8/tHxY9YwVITtCoXIURvQoQgc6EHQCNusXXWralSXzb/4wJZHDm+z39taGBnCp2Gn
         TS1tCcmyIGXxcqYZQsGBSqCY4a631v35I6rY1qRxsso+Ke0o+wCJ5Nw1Pcks5cqLsw/Q
         9GGg==
X-Gm-Message-State: AOJu0YwuoLNqcFlQ5B7QVKptrZgVYngnsI9T8byUyjkNPH9I+sgaWnBc
	UG42f/yg6jspEv20fp8G3GqhMWr6uJX/kiLFjAlaAQ==
X-Google-Smtp-Source: AGHT+IGiGpGBT6Ma5ct8ptF3AZThJVGsppBJCASATyRWQ6mKckQTa8tbynTev5IB82pdTOvM+rcvcOqFZpYci9/EvVw=
X-Received: by 2002:a05:6512:400c:b0:4f8:7781:9870 with SMTP id
 br12-20020a056512400c00b004f877819870mr2977002lfb.60.1691807549332; Fri, 11
 Aug 2023 19:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
 <226469c1-c291-3756-88c8-24b51fecc6a2@suse.com>
In-Reply-To: <226469c1-c291-3756-88c8-24b51fecc6a2@suse.com>
From: Kevin Alarcon Negy <kevin@exostellar.io>
Date: Fri, 11 Aug 2023 22:32:18 -0400
Message-ID: <CAGP=kr5U3C4hKmFZ6Odnqs-1EtZ-Lc=4Q3F0Na5j0HOTGYEwXw@mail.gmail.com>
Subject: Re: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem()
 call use max_memkb
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies if I misused the "RESEND" subject line. The xen patch guide
[1] seemed to suggest using it as a way to ping.

Thanks for the feedback. I realize now that my misunderstanding in how
the original code should work is because of my confusion between
"maxmem" the config variable vs. "xl mem-max" command. I thought that
both should act exactly the same way. As in, "xl mem-max" calls
xc_domain_setmaxmem() and also sets the static-max variable [2]. I
know that maxmem (config variable) starts out as just the static-max
variable and does not result in an xc_domain_setmaxmem(maxmem) call
upon bootup, but it wasn't clear to me that this was intended. My
patch was intended to make both the config variable and the xl command
act in the same way.

Perhaps this distinction is better resolved with different naming? For
instance, instead of "maxmem" for the config variable, call it
"static-max" to match its internal meaning?

I appreciate your thoughts.
Kevin

[1] https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Resendi=
ng_Patches
[2] https://github.com/xen-project/xen/blob/master/tools/libs/light/libxl_m=
em.c#L76

On Tue, Aug 8, 2023 at 3:14=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> On 08.08.23 00:16, Kevin Alarcon Negy wrote:
> > When building a domain, xc_domain_setmaxmem() is called with target_mem=
kb (memory in domain config file).
> > If a config specifies maxmem > memory, any attempts to increase the dom=
ain memory size to its max,
> > outside of xl mem-set or xl mem-max, which already call xc_domain_setma=
xmem() properly, will fail.
>
> But this is how it should work, no?
>
> With your change the guest could easily balloon itself up to maxmem witho=
ut it
> having been allowed to do so.
>
> The maxmem config option is meant to tell the domain how much memory it s=
hould
> be prepared to use some time in the future. It isn't meant to allow the d=
omain
> to use right now.
>
>
> Juergen
>
> > Changed xc_domain_setmaxmem() call inside libxl__build_pre() to use max=
_memkb.
> >
> > Signed-off-by: Kevin Alarcon Negy <kevin@exostellar.io>
> > ---
> >   tools/libs/light/libxl_dom.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.=
c
> > index 94fef37401..16aa255aad 100644
> > --- a/tools/libs/light/libxl_dom.c
> > +++ b/tools/libs/light/libxl_dom.c
> > @@ -355,7 +355,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
> >           return ERROR_FAIL;
> >       }
> >
> > -    if (xc_domain_setmaxmem(ctx->xch, domid, info->target_memkb + size=
) < 0) {
> > +    if (xc_domain_setmaxmem(ctx->xch, domid, info->max_memkb + size) <=
 0) {
> >           LOGE(ERROR, "Couldn't set max memory");
> >           return ERROR_FAIL;
> >       }
>

