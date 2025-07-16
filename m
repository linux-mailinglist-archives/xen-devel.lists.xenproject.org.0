Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713F9B071AB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 11:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044996.1415061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubySV-0008KR-3e; Wed, 16 Jul 2025 09:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044996.1415061; Wed, 16 Jul 2025 09:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubySV-0008Hz-15; Wed, 16 Jul 2025 09:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1044996;
 Wed, 16 Jul 2025 09:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5nTi=Z5=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ubySU-0008Ht-0F
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 09:29:50 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a7b1f74-6227-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 11:29:47 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-32e14cf205cso55052831fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 02:29:47 -0700 (PDT)
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
X-Inumbo-ID: 6a7b1f74-6227-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752658187; x=1753262987; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4gPTk0sZi/5agmZJffQDrnEcQ8CG83ku1kHWafzP34=;
        b=RX8mbEWIoEKznB/W+FTXD/RYsNxolU2Jh5nlty657rgGFz0lmdGyaWV/LlRMDUhZ9D
         qWDixjnnFN+U/WLew7lCWhBnjZjW2kIyb5Yyi/s4tMnm+xbYEp4u0j/GqGACuNberoh3
         zQg3p3S9DQ5MfxYl3rvnKstKBoFejixvDPxAn8Bjy1fQLzt4I9dApO/NDx7eYGbzwKIC
         thew7Gso8AzERTy063cbSVW+9CMyNnMZ3Do3Qua+Usn2rrv9BAve2d/HupOIdSUu0v3Q
         xFUxa4XSFdiK3vjyU8mIrrPuaQRwBgXfk+uCHzixC/p9tPRK5BJkHXWy26Roz8fzoo+T
         0KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658187; x=1753262987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4gPTk0sZi/5agmZJffQDrnEcQ8CG83ku1kHWafzP34=;
        b=WeSaSH4sK8y5JnvdeCxGuztCqKR9vGKiA04MZrWISrd3UPtpX+sBktkJKy/Z9pyhBe
         YDG9ZxFGkUl6dn4zuWfpYb04wmpL+EGbm90OD4FWFhXMtAHI6TBXaGhxNN4TqJB0XOyw
         OwU5RYO+EatF+Nv3z/NaUZBxncaZsvkpbkoTdxnLdO3SMelArx8ZDmmYMgN77/Aog8Tz
         o5UnEif7tbe8OwgRctDbpct0JZhLeQiNgR/N+XWbmppTWLPKbqcJs2g/86fjKNhkq1iZ
         3nxxu1VcplTGDUiUgy9c4+3uLoPacJsjmXWMdoLzaG/3jUqVyCuCmYc/4bxc2eTdMlny
         mCgQ==
X-Gm-Message-State: AOJu0YzxlGhoxTqm87L0rphQVrfcrEkAunKRwpgAb75EHx0CKW7/jldr
	r2TSTeAjuHltiJ7CnEPbWyF9B6JwfsVgQZ1rvJEL8uz4GjCk1I+Iq+3Y8ICvyboCNXnxzSNLL6r
	MNWPA2c/hj6fGyICHXaLpKC2VmnSrILY=
X-Gm-Gg: ASbGncuq5IHa7JCwHqETFhPgUISDYt8MzVQaFB7T71mIuz8x5hGxb3x7z611BgkblVd
	N/Ew7iksfPhzJUBt7UjLzwSffIjb0TJej6HZ95+7SsBh5lryqlq93/DdhAKzpyimST7+7VQD+2t
	DK5aYHTc3ChuWsWHJYMyfnNVF8gyHq+QrQWsF1/RY3HMJw0tdQG1KjpoI6d1mQiikSEibCsJymV
	JiYDQ==
X-Google-Smtp-Source: AGHT+IHh+x4V0P7ww7eS8k/qzdicdfYRfJgqMgNfiuSPyyu1kIkzkQkJzVc41VNCyO+zwmY8XtV0YY0RlpHZfGPsIPY=
X-Received: by 2002:a05:651c:54e:b0:32a:7baf:9dcf with SMTP id
 38308e7fff4ca-3308f60be48mr8408261fa.28.1752658186938; Wed, 16 Jul 2025
 02:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <00c495b471c09a84601156b2b74a1ba897f51755.1751020456.git.mykola_kvach@epam.com>
 <samojvqwyzyw5w5lhophijhjiaqh6uzgk5ixg23gowdbl7leae@hw3g24vf3zus>
In-Reply-To: <samojvqwyzyw5w5lhophijhjiaqh6uzgk5ixg23gowdbl7leae@hw3g24vf3zus>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 16 Jul 2025 12:29:35 +0300
X-Gm-Features: Ac12FXz0JPCNLVsNpT9kPkoJvVuPBgql0v8UURx6-wvtIMGPsB-7CQoZNfTgoZM
Message-ID: <CAGeoDV_q-hZ8idpNO1QS=F9-0uFypp5UZ9sHxVDF3moh_D9x2w@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] tools/xl: allow resume command compilation for arm
To: Hari Limaye <hari.limaye@arm.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hari,

On Thu, Jul 3, 2025 at 12:36=E2=80=AFPM Hari Limaye <hari.limaye@arm.com> w=
rote:
>
> Hi Mykola,
>
> > On Fri, Jun 27, 2025 at 01:51:31PM +0000, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The "xl resume" command was previously excluded from ARM builds because
> > system suspend/resume (e.g., `SYSTEM_SUSPEND`) via vPSCI was not
> > implemented. On x86, the command is used for ACPI S3 suspend/resume.
> >
> > This change enables compilation of `xl resume` on ARM regardless of the
> > underlying implementation status, making the tool available for use in
> > testing or for future support. The libxl infrastructure and handler
> > functions are already present and usable.
> >
> > Note: This does not imply full system suspend/resume support on ARM.
> >       "xl suspend" command still not work for arm platforms.
>
> NIT: Last sentence should perhaps be: 'The "xl suspend" command still
> does not work on Arm platforms.'

Thank you for pointing that out =E2=80=94 I=E2=80=99ll reword it.

>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  tools/include/libxl.h   |  1 -
> >  tools/xl/xl.h           |  2 +-
> >  tools/xl/xl_cmdtable.c  |  2 +-
> >  tools/xl/xl_vmcontrol.c | 12 ++++++------
> >  4 files changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index a8704e0268..0fda8bb616 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> > @@ -1134,7 +1134,6 @@ typedef struct libxl__ctx libxl_ctx;
> >   * restoring or migrating a domain. In this case the related functions
> >   * should be expected to return failure. That is:
> >   *  - libxl_domain_suspend
> > - *  - libxl_domain_resume
> >   *  - libxl_domain_remus_start
> >   */
> >  #if defined(__arm__) || defined(__aarch64__)
>
> The Macro being documented above, and defined below, this ^^^ section of
> the diff, is called `LIBXL_HAVE_NO_SUSPEND_RESUME`. Now it no longer
> indicates lack of support for libxl_domain_resume is it better renamed
> something like `LIBXL_HAVE_NO_SUSPEND`?

Sure, that makes sense =E2=80=94 I=E2=80=99ll rename it to LIBXL_HAVE_NO_SU=
SPEND to
better reflect its purpose.

>
> > diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> > index 45745f0dbb..5b0a481456 100644
> > --- a/tools/xl/xl.h
> > +++ b/tools/xl/xl.h
> > @@ -130,8 +130,8 @@ int main_migrate_receive(int argc, char **argv);
> >  int main_save(int argc, char **argv);
> >  int main_migrate(int argc, char **argv);
> >  int main_suspend(int argc, char **argv);
> > -int main_resume(int argc, char **argv);
> >  #endif
>
> NIT: Could take the opportunity to add comment after `#endif`?
> + #endif /* LIBXL_HAVE_NO_SUSPEND_RESUME */
> (Or LIBXL_HAVE_NO_SUSPEND if renamed)

Sure =E2=80=94 I=E2=80=99ll add a comment after the #endif, matching the up=
dated macro name.

>
> > +int main_resume(int argc, char **argv);
> >  int main_dump_core(int argc, char **argv);
> >  int main_pause(int argc, char **argv);
> >  int main_unpause(int argc, char **argv);
> > diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> > index 06a0039718..4f662a4189 100644
> > --- a/tools/xl/xl_cmdtable.c
> > +++ b/tools/xl/xl_cmdtable.c
> > @@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] =3D {
> >        "Suspend a domain to RAM",
> >        "<Domain>",
> >      },
> > +#endif
>
> NIT: Same as above.
>
> >      { "resume",
> >        &main_resume, 0, 1,
> >        "Resume a domain from RAM",
> >        "<Domain>",
> >      },
> > -#endif
> >      { "dump-core",
> >        &main_dump_core, 0, 1,
> >        "Core dump a domain",
> > diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> > index c813732838..ebacde5482 100644
> > --- a/tools/xl/xl_vmcontrol.c
> > +++ b/tools/xl/xl_vmcontrol.c
> > @@ -38,11 +38,6 @@ static void suspend_domain(uint32_t domid)
> >      libxl_domain_suspend_only(ctx, domid, NULL);
> >  }
> >
> > -static void resume_domain(uint32_t domid)
> > -{
> > -    libxl_domain_resume(ctx, domid, 1, NULL);
> > -}
> > -
> >  int main_suspend(int argc, char **argv)
> >  {
> >      int opt;
> > @@ -55,6 +50,12 @@ int main_suspend(int argc, char **argv)
> >
> >      return EXIT_SUCCESS;
> >  }
> > +#endif
>
> NIT: Same as above.

okay

>
> > +
> > +static void resume_domain(uint32_t domid)
> > +{
> > +    libxl_domain_resume(ctx, domid, 1, NULL);
> > +}
> >
> >  int main_resume(int argc, char **argv)
> >  {
> > @@ -68,7 +69,6 @@ int main_resume(int argc, char **argv)
> >
> >      return EXIT_SUCCESS;
> >  }
> > -#endif
> >
> >  static void pause_domain(uint32_t domid)
> >  {

Thank you for reviewing this patch.

Best regards,
Mykola


>
> Many thanks,
>
> Hari

