Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9288123B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695914.1086214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvsB-0002Ut-T5; Wed, 20 Mar 2024 13:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695914.1086214; Wed, 20 Mar 2024 13:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvsB-0002T8-PM; Wed, 20 Mar 2024 13:20:51 +0000
Received: by outflank-mailman (input) for mailman id 695914;
 Wed, 20 Mar 2024 13:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmvsA-0002T2-KO
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:20:50 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1da123-e6bc-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 14:20:48 +0100 (CET)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5a4f9f94e77so18060eaf.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:20:48 -0700 (PDT)
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
X-Inumbo-ID: aa1da123-e6bc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710940847; x=1711545647; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsHdUwRpT3/MKsuJZCUcsvLi4kZKZQn6dmSkzhwcl8g=;
        b=iWnchXjm4Z5wGBZJSRX2k+39Y09Bp8oAN2+s21o45a+gOTsYJP3vlx6RIsO900Ss5Y
         ZBO4GaBhqwdimkqa2TimnQmHITPox4Vrgz9bi7qjnmC9PPUFCKJ9ts9sJQ36cl5v4i8b
         KrCZxGraeOI2XtAlvLWKRI+7CdEu0rJ0KYY34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710940847; x=1711545647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsHdUwRpT3/MKsuJZCUcsvLi4kZKZQn6dmSkzhwcl8g=;
        b=YqIxjvAIgRMvceLQP+utygJ5oa/0itiqHvYmbFa5Qe8UAmw623E7Mf40VlajNX6vl6
         DwAVarweFUGM1d4m6WiIdm68Dd1PwruDnHy56dajXX5AGGCSFMrtZsuLn7w2MUkONwIU
         CXMCuMZ6tESN1Etxn5x6ZVikWvr8Htupy63bCwuyczX89LaQQgizIfA/JiyaP4Ux+9Fo
         x9Z8hJPA9esziVhHO/2XX0IYjIXR1FryIT9rOHHlpiFqJBmiCXhjM0zBXA1Lvc7pUJuH
         QyYfxo1k3GfI68axGEZ2hUDVlf+pkYhYNXvwhm75cPY0qlLSEVFcYsMWxMC6OYYK4uA2
         JuOg==
X-Forwarded-Encrypted: i=1; AJvYcCWwu2Ro4UWwVoi2JpFE2x8z/L5VHQdZLJlcIfMY2Jd7tTClU0uw14u8wQ7poJZGCefC6tIsf6X0DVSK/YyUhkDQnu50+oDE8nKnv1Boc3k=
X-Gm-Message-State: AOJu0YwQKhLUfBT2zm7Mz3NjVzupIq6Fw/fNFvyaxgDQypgnLO4vGIuS
	PwVtTzK4O+anJxXjyn+q0bd0X1NMBrDx2bLXrM/L1CSxlhSN/7h0kGbvqql8XVhCK/tJnls0Bc0
	RzObJNq2P0nSGi5xmDi32mmdgtdtsmnWZ/NBEEg==
X-Google-Smtp-Source: AGHT+IE/+41NHq4D3WYPyGFbmzjc3BPqmdWUcQX1H+j1fZXG8U7rdKCVApoINHJ/woEFdcLI2dLNXsPKYuiRzsrbu8E=
X-Received: by 2002:a05:6870:648e:b0:21e:df8b:5280 with SMTP id
 cz14-20020a056870648e00b0021edf8b5280mr2217256oab.27.1710940847173; Wed, 20
 Mar 2024 06:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-3-andrew.cooper3@citrix.com> <CA+zSX=b7X91bZZQcm=PvLbxeEofq12yNn2h+-Rb7WZESYmxPeA@mail.gmail.com>
 <19d9487e-67cf-4c1e-9dc6-419d9c5d0120@citrix.com> <bb02d6b9-fb23-48d5-9c79-b40a32cc66d3@suse.com>
In-Reply-To: <bb02d6b9-fb23-48d5-9c79-b40a32cc66d3@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 13:20:36 +0000
Message-ID: <CA+zSX=b21zrJnAWTNiRtP35nE02BC=3Vei6VSZi6sJh8ziHHgQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] xen/credit2: Clean up trace handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Dario Faggioli <dfaggioli@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 1:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 20.03.2024 13:19, Andrew Cooper wrote:
> > On 20/03/2024 12:16 pm, George Dunlap wrote:
> >> On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@=
citrix.com> wrote:
> >>> There is no need for bitfields anywhere - use more sensible types.  T=
here is
> >>> also no need to cast 'd' to (unsigned char *) before passing it to a =
function
> >>> taking void *.  Switch to new trace_time() API.
> >>>
> >>> No functional change.
> >> Hey Andrew -- overall changes look great, thanks for doing this very
> >> detailed work.
> >>
> >> One issue here is that you've changed a number of signed values to
> >> unsigned values; for example:
> >>
> >>> @@ -1563,16 +1559,16 @@ static s_time_t tickle_score(const struct sch=
eduler *ops, s_time_t now,
> >>>      if ( unlikely(tb_init_done) )
> >>>      {
> >>>          struct {
> >>> -            unsigned unit:16, dom:16;
> >>> -            int credit, score;
> >>> -        } d;
> >>> -        d.dom =3D cur->unit->domain->domain_id;
> >>> -        d.unit =3D cur->unit->unit_id;
> >>> -        d.credit =3D cur->credit;
> >>> -        d.score =3D score;
> >>> -        __trace_var(TRC_CSCHED2_TICKLE_CHECK, 1,
> >>> -                    sizeof(d),
> >>> -                    (unsigned char *)&d);
> >>> +            uint16_t unit, dom;
> >>> +            uint32_t credit, score;
> >> ...here you change `int` to `unit32_t`; but `credit` and `score` are
> >> both signed values, which may be negative.  There are a number of
> >> other similar instances.  In general, if there's a signed value, it
> >> was meant.
> >
> > Oh - this is a consequence of being reviewed that way in earlier iterat=
ions.
>
> Which in turn is a result of us still having way to many uses of plain
> int when signed quantities aren't meant. Plus my suggestion to make
> this explicit by saying "signed int" was rejected.

Not complaining, but just pointing out to maybe save some time in the
future:  The vast majority of fields in the trace records in this file
are unsigned; in fact, two of the fields in this structure are
unsigned.  That should have been a hint that being signed was likely
to be intentional in this code, and to look at the context before
removing it.  (In this case, for example just above here there's an
"if ( score < 0 )" showing that score might be negative.)

 -George

