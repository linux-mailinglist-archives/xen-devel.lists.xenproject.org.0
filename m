Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955CEAD1455
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jun 2025 22:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010038.1388208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uON0D-00033f-A0; Sun, 08 Jun 2025 20:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010038.1388208; Sun, 08 Jun 2025 20:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uON0D-00031c-6q; Sun, 08 Jun 2025 20:52:25 +0000
Received: by outflank-mailman (input) for mailman id 1010038;
 Sun, 08 Jun 2025 20:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6AZ=YX=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uON0B-00031W-Ko
 for xen-devel@lists.xenproject.org; Sun, 08 Jun 2025 20:52:23 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78f44b1b-44aa-11f0-b894-0df219b8e170;
 Sun, 08 Jun 2025 22:52:21 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-32b019bdeaaso3597621fa.0
 for <xen-devel@lists.xenproject.org>; Sun, 08 Jun 2025 13:52:21 -0700 (PDT)
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
X-Inumbo-ID: 78f44b1b-44aa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749415941; x=1750020741; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiD4rSsm0cbKmHaYBj8e0g7Y2LMzANTCDe2PowGXfAs=;
        b=Dt6Ih2LVuljTpvzjPxckey0oTy6dcdfGfeA5acZgiVrQHX2OnsO93xZvkL6xJcrpgD
         05lyr+h5unCkNJYDs9whiqn7YZp7nEBAEt2YHVkQEvh8TvLbtrbef6jbAvEpUSHB1+nv
         wqmKa2a531SPzeU927lekvGklltjaSJD5SR4x6KToyJOEh9KCLQkIFR+7h+z6lSsa3lY
         JgU6KN/eid9eSTQfm1GcdjzfURv2RGWJ4HTTYjd1ifuUMBdXzbhC/xHoqozdNBqxPMnU
         sPcJwlbQIP5rneditAfGIQgYvb4sXQUrb+zfgLOsdRmyfMQk8jOfG7eTSGsgF/85e2R0
         Cv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749415941; x=1750020741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiD4rSsm0cbKmHaYBj8e0g7Y2LMzANTCDe2PowGXfAs=;
        b=NUWQ/o/kfGsHu6elS5jmE15TIh5qdEd/TtN2qOo64I+1DFhuy+IIT2u9Jfqs75UfVD
         2tyiJiutI9rJUa6JcALKsTzPdkcwJ4Ajx8/g8k0NktGigmSvPxwaYHz49lRvsJZ8K2yo
         pf4N9001F06k9pjzvkVWQvWE9X56SO1ojrD1TAo6l4ShQRShxSJWHmN4LqTqMYSt9lx8
         AyJz4yiMnXeG1WwH9fAq4BsV0J9rNx/locdwOxVjKqVSv4lRQYqMHVEOAcGmB6WLYFWG
         4+sq1qisjZtSZZleY6c5cMtvEeLqiRlA1j/4OdJQt2lBiXcP8ARdTRhnDldOC1RLu8bo
         HgCQ==
X-Gm-Message-State: AOJu0YyiGdsqtUDdlRHXEAokXXDEvzK/cruNYyOvScFVc6j7czSIJue9
	4yab/sPUBHrHoFqyW2aP619CSRypNjxRkvBW3uQWowvW+i3s3hPC2oBKh2DHrjI6y9ieIzQeh3K
	aKyEH/mUDXnlKPB4Xj49/m/JyvMTkCHI=
X-Gm-Gg: ASbGncuFFcOLZ3Jcmk7FecytpAu1Wopkep9gwhWuBldS4uCmV4L+xz2fShZEySLv6uw
	9O4bQsWd1RdQc8MSgoKunGkSVlcEOA74NfDeDq+LLlqiYs7iPpBfT/ojl7g1ZbxsUJTo+aKLOmT
	ZusSgdpuyCeU9G0ougZ2+sxoK1gBm357dLoX69OL67pg==
X-Google-Smtp-Source: AGHT+IELmomZm+dVKeBh2MmdMlQBzwDw4r9+kpmn1u0Tmr4m+OSd5O5GSwKGL25Mw9NewgnghMJaPtJxPkBYzacTLwU=
X-Received: by 2002:a2e:a585:0:b0:32a:864a:46e4 with SMTP id
 38308e7fff4ca-32adfcd4f8cmr28300131fa.3.1749415940394; Sun, 08 Jun 2025
 13:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACMJ4Gb35EAy2igefhzH5=g=cQstNvbJCZdiMHA7QHQ+v=4cOg@mail.gmail.com>
 <2EAAC8E1-2342-48F4-9B2E-849551291F22@gmail.com>
In-Reply-To: <2EAAC8E1-2342-48F4-9B2E-849551291F22@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Jun 2025 21:52:09 +0100
X-Gm-Features: AX0GCFuTtWHOqhfNn6nlrKGXPPjvcpB2tuRNY3y8Vi5WOGJ21wdupvh_2yNhgdI
Message-ID: <CACMJ4GauN=Gmxn9=BTrF=QC=p11Q0uTVYTFw4=xQUxo4ppVw2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] docs: add documentation for Argo as a feature
To: Rich Persaud <persaur@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000b1148d063715a347"

--000000000000b1148d063715a347
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 7:37=E2=80=AFPM Rich Persaud <persaur@gmail.com> wro=
te:

> On Jun 8, 2025, at 5:49=E2=80=AFAM, Christopher Clark <
> christopher.w.clark@gmail.com> wrote:
>
> =EF=BB=BF
>
> On Wed, Jun 4, 2025 at 5:14=E2=80=AFPM Jason Andryuk <jason.andryuk@amd.c=
om>
> wrote:
>
>>
>> I think this should be dropped.  We don't need a link to a design
>> document without an implementation.  You can add it once you've
>> upstreamed the implementation.
>>
>
> OK, I'll remove this section for the next version of the series.
>
>
> What's the recommended location of Xen design documents, requirements for
> future improvements, roadmaps or pointers to related work in adjacent
> open-source communities? The Xen wiki is being deprecated.
>

Others CCd are likely better qualified than I to answer these (reasonable)
questions, and I am interested to learn from any further answers.

My preferred option is not to deprecate the wiki, or at least not without a
replacement for it. I have found the wiki to be useful for many years for
both publishing technical content and for access to helpful material not
available anywhere else, even if the contents are rougher than the formal
documentation. Its accessibility is an essential part of enabling that.

If the wiki is deprecated, the available alternatives appear to be:

* Pursuing formal acceptance of documents into one of the Xen git
repositories;
From my experience of doing so, less documentation will be produced if this
is the standard required and unique knowledge will be lost at an ongoing
cost to both the developer community and users of Xen. Review capacity is
already scarce and this will further deplete that.

* Publishing on the platforms of adjacent communities;
Documentation will be less discoverable and at the mercy of external tools
and processes, again at a cost to collaboration within the Xen community.

* Repurposing the Xen issue tracker
This would be a horrible bodge. Please no.

* Self-hosting - similar to publishing in an adjacent community, but worse
I would prefer not to have to do this and may not have time available to
do so. Not everyone is able to.

* Replace the wiki with another collaboratively-edited document hosting
platform
I am open to learning more about options for this if it is the recommended
direction.


> What's the recommended way for the Xen community to discover the existenc=
e
> of Argo documentation that is not hosted by the Xen community? If
> necessary, we can create a new semantic label or Xen docs directory tree,
> to host technical content that might otherwise be lost.
>
> Should we add a sentence to Xen's Argo documentation, to the effect of
> "Please refer to the Xen [wiki in archive.org, website, mailing list],
> external sites [A, B, C, D], or your preferred [search engine, LLM] for
> more technical documents on Argo design and implementation"?
>

The Virtio & Argo design documents, produced within an adjacent community
so they are hosted there, are relevant to Xen and ought to be enabled to be
discoverable (and if necessary hostable) via Xen community platforms.
They are also a single instance of a general class: there will be
developments of other Xen-related features within XCP-ng, Qubes and Linaro
projects - and other adjacent communities - that also warrant description
and linking from within Xen community documentation.

To Jason's review point: I am willing to accept leaving the VirtIO section
out of this specific Argo feature document but I do need an appropriate
alternative place for it - eg. the Argo design document (already within the
Xen source tree) could be extended to introduce it instead. The externally
referenced design documents are part of how such future
features get implemented, so referencing prior to implementation is helpful
and supportive of the continued development of the technology.

Christopher

--000000000000b1148d063715a347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 8, =
2025 at 7:37=E2=80=AFPM Rich Persaud &lt;<a href=3D"mailto:persaur@gmail.co=
m">persaur@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"lt=
r">On Jun 8, 2025, at 5:49=E2=80=AFAM, Christopher Clark &lt;<a href=3D"mai=
lto:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gm=
ail.com</a>&gt; wrote:</div><div dir=3D"ltr"><blockquote type=3D"cite">=EF=
=BB=BF</blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">On Wed, Jun 4, 2025 at 5:14=E2=80=AFPM Jason And=
ryuk &lt;<a href=3D"mailto:jason.andryuk@amd.com" target=3D"_blank">jason.a=
ndryuk@amd.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
I think this should be dropped.=C2=A0 We don&#39;t need a link to a design =
<br>
document without an implementation.=C2=A0 You can add it once you&#39;ve <b=
r>
upstreamed the implementation.<br></blockquote><div><br></div><div>OK, I&#3=
9;ll remove this section for the next version of the series.</div></div></d=
iv></div></blockquote><br><div>What&#39;s the recommended location of Xen d=
esign documents, requirements for future improvements, roadmaps or pointers=
 to related work in adjacent open-source communities? The Xen wiki is being=
 deprecated.</div></div></blockquote><div><br></div><div>Others CCd are lik=
ely better qualified than I to answer these (reasonable) questions, and I a=
m interested to learn from any further answers.</div><div><br></div><div>My=
 preferred option is not to deprecate the wiki,=C2=A0or at least not withou=
t a replacement for it.=C2=A0I have found the wiki to be useful for many ye=
ars for both publishing technical content and for access to helpful materia=
l not available anywhere else, even if the contents are rougher than the fo=
rmal documentation. Its accessibility is an essential part of enabling that=
.</div><div><br></div><div>If the wiki is deprecated, the available alterna=
tives appear to be:</div><div><br></div><div>* Pursuing formal acceptance o=
f documents into one of the Xen git repositories;<br>From my experience of =
doing so, less documentation will be produced if this is the standard requi=
red and unique knowledge will be lost at an ongoing cost to both the develo=
per community and users of Xen. Review capacity is already scarce and this =
will further deplete that.</div><div><br>* Publishing on the platforms of a=
djacent communities;<br>Documentation will be less discoverable and at the =
mercy of external tools and processes, again at a cost to collaboration wit=
hin the Xen community.<br><br>* Repurposing the Xen issue tracker<br>This w=
ould be a horrible bodge. Please no.<br><br>* Self-hosting - similar to pub=
lishing in an adjacent community, but worse<br></div><div>I would prefer no=
t to have to do this and may not have time available to do=C2=A0so. Not eve=
ryone is able to.=C2=A0</div><div><br></div><div>* Replace the wiki with an=
other collaboratively-edited=C2=A0document hosting platform</div><div>I am =
open to learning more about options for this if it is the recommended direc=
tion.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"auto"><div><br></div><div>What&#39;s the recommended way for t=
he Xen community to discover the existence of Argo documentation that is no=
t hosted by the Xen community? If necessary, we can create a new semantic l=
abel or Xen docs directory tree, to host technical content that might other=
wise be lost.</div><div><br></div><div>Should we add a sentence to Xen&#39;=
s Argo documentation, to the effect of &quot;Please refer to the Xen [wiki =
in <a href=3D"http://archive.org" target=3D"_blank">archive.org</a>, websit=
e, mailing list], external sites [A, B, C, D], or your preferred [search en=
gine, LLM] for more technical documents on Argo design and implementation&q=
uot;?</div></div></blockquote><div><br></div><div>The Virtio &amp; Argo des=
ign documents, produced within an adjacent community so they are hosted the=
re, are relevant to Xen and ought to be enabled to be discoverable (and if =
necessary hostable) via Xen community platforms. They=C2=A0are also a singl=
e instance of a general class: there will be developments of other Xen-rela=
ted features within XCP-ng, Qubes and Linaro projects - and other=C2=A0adja=
cent communities - that also warrant description and linking from within Xe=
n community documentation.</div><div><br></div><div>To Jason&#39;s review p=
oint: I am willing to accept leaving the VirtIO section out of this specifi=
c Argo feature document but I do need an appropriate alternative place for =
it - eg. the Argo design document (already within the Xen source tree) coul=
d be extended to introduce it instead. The externally referenced=C2=A0desig=
n documents are part of how such future features=C2=A0get=C2=A0implemented,=
 so referencing prior to implementation is helpful and supportive of the co=
ntinued development of the technology.</div><div><br></div><div>Christopher=
</div></div></div>

--000000000000b1148d063715a347--

