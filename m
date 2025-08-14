Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E4B26087
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 11:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081152.1441277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umU57-0001tX-Rn; Thu, 14 Aug 2025 09:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081152.1441277; Thu, 14 Aug 2025 09:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umU57-0001qy-P6; Thu, 14 Aug 2025 09:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1081152;
 Thu, 14 Aug 2025 09:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K78q=22=gmail.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umU55-0001qs-Ez
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 09:17:07 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 710965dd-78ef-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 11:17:03 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6188b747ebeso115162a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 02:17:03 -0700 (PDT)
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
X-Inumbo-ID: 710965dd-78ef-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755163023; x=1755767823; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sLrsCI6ouSQ5AeCVZBxZkV/Dery85sbaLhlKELyCT9g=;
        b=fqWFwbOgWBFFAdJiKfi4W584jYzWgrsjz/TPJ8VRjxG6v0ZnQCg6m7mX6C98kxkzcV
         4GRdbbZZhd1XPS+UGTqrz1yzrHcToe1nPDGg7DnmDyJgQen27xY6r+PixwznYgAWLM45
         +HzkS2RB5vU+m6Kpk6lX9rFiq1VvYZTYf1gdqUddPCyD1pAOY7J4oKJeDxD4wJ0PQT7u
         sq+nP5fwfIqaKt2R3ChoKgD3PFaR6JFueCATfBXF0N2WzkI1SW63fgrZazYTa8qUPCp2
         L9nPX+8BdxyxdxdsSNKa/oEBnU/dVYLeX+W4+XEFUsZKLhuN2oo4an+071E1uZoEAGLD
         Rn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163023; x=1755767823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLrsCI6ouSQ5AeCVZBxZkV/Dery85sbaLhlKELyCT9g=;
        b=A/1ROP1rHImcOTmoGfr0EY8VR0H0wZqSSL8OnLdfBnrY11ooDB3edWVr5/T3hcofhh
         oRbOcIfIfKX7XSswKwZx+XIzvjjOsS8Bh5PBwtEBLI1ltbXPM5AyWRl+vay8tUMk1Xrz
         4jZiquPtUS6DMxhshMsQisA1RcPe267dy49M/YFeDAyOonZWnqps/cqsf0g//9YUMWcJ
         Wq5SJLod8j0woxt3QsdK4Zt6pR2Ian3TNXR/k+bQaVFnNdwg5d02W+GgWoC2efToYyY0
         6Ts3WowuoDDxINAFRjzIX6CW+m4APWUwjVCHZhAKMZ5buAI61TtDcU2zEhVdsTSt29C2
         XQPg==
X-Forwarded-Encrypted: i=1; AJvYcCVUYWUSdmqUc9Y8nX8TzTW+u01iOmSaHhByvgPA/b/4eS7zFa3W78J0padi5uK5kFRDAzykDjhWMeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfJz9g6kLuRldEO65siCCPfMxW6/SGihZKudkJiPv1iFEdyvRm
	ODBDMSPxCPgN7f+GcLd+0VMwoNSpUknNBgd2wD3vTX8/2KsQqkwZtApcpupK4lbyzE0O/tAJk/E
	rbsvuHb74u5KLV+hq0fFSosaUCYCxeNI=
X-Gm-Gg: ASbGncsfQbKgx7im70f8I6hLLcT7pzxFwWlfWByMYIZ3Cv1594GVXn5fPjyleLSj5IY
	hpRP4+HtRta94nrvkWR6Ka6OCpSAjJtsEZUxO10yZtqO87CUQWhyUXViD+7IwF+3V8jsBVeSk+t
	xfU1qZUL+HsZsmQbkRAJYYvseK2CmHc5HimV5q1YfiGA/WoPI91c/NXllI5shx4UYez3x4zJVO9
	Kx/VS38HvIwKOW9QhtA
X-Google-Smtp-Source: AGHT+IENygSlyPb31AAcf0Y9lWGk0c8G1ihJ9/ymXnY6wNBLjmV0slds/F0qNtxG/PgkPZAcnUg5scrhd8lf1WpZgn0=
X-Received: by 2002:a05:6402:40cf:b0:615:ec26:99ad with SMTP id
 4fb4d7f45d1cf-6188b930e73mr916170a12.2.1755163022852; Thu, 14 Aug 2025
 02:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
 <d716610470ddd7da75789cfa546ed209ff24e1d1.1755111932.git.nicola.vetrini@bugseng.com>
 <0fde3942-22e7-470c-ad70-aa2c574d10dc@suse.com>
In-Reply-To: <0fde3942-22e7-470c-ad70-aa2c574d10dc@suse.com>
From: Nicola Vetrini <nicola.vetrini@gmail.com>
Date: Thu, 14 Aug 2025 11:16:50 +0200
X-Gm-Features: Ac12FXwNNZtNIAw0faKO8q_1tICQSxLwlCs58SjS97az0GXvQN71LnDiGkLYOz8
Message-ID: <CADDAUeOT6+uBXYVJodq_vekvB_4m=SpEXAhxd3cAgqrpVpFdYA@mail.gmail.com>
Subject: Re: [XEN PATCH 2/3] xen/macros: Drop alternative definition of
 BUILD_BUG_ON(_ZERO)? for old GCC
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008007b2063c4fbc19"

--0000000000008007b2063c4fbc19
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 14, 2025, 10:08 Jan Beulich <jbeulich@suse.com> wrote:

> On 13.08.2025 21:12, nicola.vetrini@gmail.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@gmail.com>
> >
> > The toolchain baseline for GCC is 5.1, which supports _Static_assert
> > in c99 mode
>
> Hmm, interesting. I can confirm the behavior, but isn't this a bug?
> There's no
> _Static_assert() in plain C99. Respective notes in the "Changes, New
> Features,
> and Fixes" are also saying otherwise:
> https://gcc.gnu.org/gcc-4.6/changes.html
> has "This support may be selected with -std=c1x, or -std=gnu1x for C1X with
> GNU extensions." Nothing new is said in any of the respective documents up
> to
> the release of gcc5. (In fact, the compiler accepts the construct even with
> -std=c89.)
>

 Some features that are part of the C99 standard are accepted as extensions
in C90 mode, and some features that are part of the C11 standard are
accepted as extensions in C90 and C99 modes. Use of the -std options listed
above disables these extensions where they conflict with the C standard
version selected

If my reading is correct then this paragraph gives them the leeway needed
to use it even in c89, except maybe with -pedantic


> Our misra/C-language-toolchain.rst refers to a section in gcc12's doc which
> doesn't mention _Static_assert() at all, afaics.
>
> Jan
>

I can check with my colleagues, but I suspect this is not documented as an
extension by GCC because it's not one in C11, and gcc12 supports all(?) of
C11, therefore it is an extension only with respect to certain conditions,
which GCC does not use as a category in their docs, but we keep track of
what is an extension and what is not, given the CU standard selected.

>

--0000000000008007b2063c4fbc19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Aug 14, 2025, 10:08 Jan Beulich &lt;<a href=3D=
"mailto:jbeulich@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@su=
se.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 13.08.2025=
 21:12, <a href=3D"mailto:nicola.vetrini@gmail.com" rel=3D"noreferrer noref=
errer" target=3D"_blank">nicola.vetrini@gmail.com</a> wrote:<br>
&gt; From: Nicola Vetrini &lt;<a href=3D"mailto:nicola.vetrini@gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">nicola.vetrini@gmail.com</a>=
&gt;<br>
&gt; <br>
&gt; The toolchain baseline for GCC is 5.1, which supports _Static_assert<b=
r>
&gt; in c99 mode<br>
<br>
Hmm, interesting. I can confirm the behavior, but isn&#39;t this a bug? The=
re&#39;s no<br>
_Static_assert() in plain C99. Respective notes in the &quot;Changes, New F=
eatures,<br>
and Fixes&quot; are also saying otherwise: <a href=3D"https://gcc.gnu.org/g=
cc-4.6/changes.html" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bl=
ank">https://gcc.gnu.org/gcc-4.6/changes.html</a><br>
has &quot;This support may be selected with -std=3Dc1x, or -std=3Dgnu1x for=
 C1X with<br>
GNU extensions.&quot; Nothing new is said in any of the respective document=
s up to<br>
the release of gcc5. (In fact, the compiler accepts the construct even with=
<br>
-std=3Dc89.)<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">=C2=A0Some features that are part of the C99 standard are accep=
ted as extensions in C90 mode, and some features that are part of the C11 s=
tandard are accepted as extensions in C90 and C99 modes. Use of the -std op=
tions listed above disables these extensions where they conflict with the C=
 standard version selected</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If my reading is correct then this paragraph gives them the leeway neede=
d to use it even in c89, except maybe with -pedantic</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Our misra/C-language-toolchain.rst refers to a section in gcc12&#39;s doc w=
hich<br>
doesn&#39;t mention _Static_assert() at all, afaics.<br>
<br>
Jan<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I can check with my colleagues, but I suspect this is not documented as =
an extension by GCC because it&#39;s not one in C11, and gcc12 supports all=
(?) of C11, therefore it is an extension only with respect to certain condi=
tions, which GCC does not use as a category in their docs, but we keep trac=
k of what is an extension and what is not, given the CU standard selected.=
=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
</blockquote></div></div></div>

--0000000000008007b2063c4fbc19--

