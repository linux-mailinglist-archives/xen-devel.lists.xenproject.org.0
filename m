Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8940691C34
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 11:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493205.763014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQQEp-0006yc-F3; Fri, 10 Feb 2023 10:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493205.763014; Fri, 10 Feb 2023 10:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQQEp-0006wa-CH; Fri, 10 Feb 2023 10:02:39 +0000
Received: by outflank-mailman (input) for mailman id 493205;
 Fri, 10 Feb 2023 10:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7WNm=6G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pQQEn-0006wQ-MP
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 10:02:37 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6dc517-a92a-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 11:02:35 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id y19so5462769ljq.7
 for <xen-devel@lists.xenproject.org>; Fri, 10 Feb 2023 02:02:34 -0800 (PST)
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
X-Inumbo-ID: 0a6dc517-a92a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tJHHiFB6XTRc5bRBoVCvpiltWq8Bcwgzl8DV3TsVtdE=;
        b=arPkwq2x/OrO4FYavOalh4uFpS8gMk3a7BOTCHZwXD/txt2wEwdsS0Bn7SigQEt2xy
         BIRKX7T+/YQtwoBQpy8V5gqr5KL+lbKsOGJn2nYugPI9atnh02YBpoEh32LtoqNG2u0A
         k/GE3nA5zLkxo/om/hFCrkVUs2fREDjt4iKYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJHHiFB6XTRc5bRBoVCvpiltWq8Bcwgzl8DV3TsVtdE=;
        b=1sQiCWXDQtj9VQo1G+y7iFpjRoNzNUKS9jjheljKELSANl6rFaUVV0Fsu6qF/yJoe3
         RyIuvskG7y48DPA2v3LqFc3loQBnEbR6xH98KMlPVX8ng5LxVD35mSMnOh7YHWOkUmoI
         /ZvWgOHO27LaHZto3KXF00HVSYQivpDTSDvQMGRTXlsylLTa2WdDiLwp/fgP+of2/teb
         H+muOevPnHG3LBH62euc+6S1UqajH4NGDsJEahjxCCxYNHbx4gQ4Btl8SzQAjq0xMDUK
         3DUnKsmLcSBScvif4nUmrqZ2Lsh7KWqilMPvTIPWK5iQR8K7KEWZ8eEglqPmyc2Xdh3Z
         JQfw==
X-Gm-Message-State: AO0yUKUfHVA7VMqaAYQ8GA+FT0eo7fEXbOSfDsDWFXrPYYNtBw0RZmSd
	EqFK436AftZdLWKzmVBnjXjpbV3wCDx8Tv+CPqSmiA==
X-Google-Smtp-Source: AK7set9XkIgZnFCV5HtdqJYRyAxFvnPkD4e0unubfGNYbsyKILaVotBip6KzDOzDYzPYDkQGBcaXi3tMAiwqLVpU9xE=
X-Received: by 2002:a2e:7a09:0:b0:293:2e0a:da94 with SMTP id
 v9-20020a2e7a09000000b002932e0ada94mr1342061ljc.136.1676023354053; Fri, 10
 Feb 2023 02:02:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675889601.git.demi@invisiblethingslab.com>
 <8c476ad1d36919f31c3d37edc813182e8f1489e8.1675889602.git.demi@invisiblethingslab.com>
 <CA+zSX=Z+Vg0xBb9Ww-iSSUQGp+oyoGFuY_cKMfQs_9epsRFUkg@mail.gmail.com> <Y+UyqCITWks0I4AU@itl-email>
In-Reply-To: <Y+UyqCITWks0I4AU@itl-email>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 10 Feb 2023 10:02:23 +0000
Message-ID: <CA+zSX=b=hVtOJRObJ8+n5gzxEEeGZ5mOuYOYr7W8C_487PMKFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Miscellaneous and documentation: Only use
 TLS-protected transports
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, 
	David Scott <dave@recoil.org>, Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="000000000000a76ade05f4559841"

--000000000000a76ade05f4559841
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 9, 2023 at 5:51 PM Demi Marie Obenour <
demi@invisiblethingslab.com> wrote:

> On Thu, Feb 09, 2023 at 02:25:07PM +0000, George Dunlap wrote:
> > On Wed, Feb 8, 2023 at 8:59 PM Demi Marie Obenour <
> > demi@invisiblethingslab.com> wrote:
> >
> > > Obtaining code over an insecure transport is a terrible idea for
> > > blatently obvious reasons.  Even for non-executable data, insecure
> > > transports are considered deprecated.
> > >
> > > This patch changes miscellaneous links that are not used by any
> > > automated tool.  Some of these links are dead anyway.
> > >
> >
> > As I said in response to patch 4, I appreciate the goal and the effort
> > here.  But I'd rather not replace a working link with a broken link, or a
> > broken link with another broken link.
> >
> > If we want to make this change, I think we're going to have to be
> creative
> > with how the link replacement is done, as well as in how it's
> demonstrated
> > to reviewers that the new URLs are valid.
> >
> > One option, for instance, could be writing a small script that would
> check
> > the link validity first and only make the change if the link was valid;
> and
> > then including that script in the commit message.  The reviewer could
> then
> > convince themselves that the script was correct, and give an Ack or R-b
> on
> > that basis.  There are probably other ideas as well.
> >
> > Any thoughts?
> >
> >  -George
>
> What about breaking the patch up into smaller ones?  One could change
> all of the xenbits.xen.org links in one patch, since those are known to
> support HTTPS.  Then keep going for other domains.
>

That would work for me.

 -George

--000000000000a76ade05f4559841
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023 at 5:51 PM Demi Marie=
 Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com">demi@invisiblet=
hingslab.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, Feb 09, 2023 at 02:25:07PM +0000, George Dunlap wrote:<=
br>
&gt; On Wed, Feb 8, 2023 at 8:59 PM Demi Marie Obenour &lt;<br>
&gt; <a href=3D"mailto:demi@invisiblethingslab.com" target=3D"_blank">demi@=
invisiblethingslab.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Obtaining code over an insecure transport is a terrible idea for<=
br>
&gt; &gt; blatently obvious reasons.=C2=A0 Even for non-executable data, in=
secure<br>
&gt; &gt; transports are considered deprecated.<br>
&gt; &gt;<br>
&gt; &gt; This patch changes miscellaneous links that are not used by any<b=
r>
&gt; &gt; automated tool.=C2=A0 Some of these links are dead anyway.<br>
&gt; &gt;<br>
&gt; <br>
&gt; As I said in response to patch 4, I appreciate the goal and the effort=
<br>
&gt; here.=C2=A0 But I&#39;d rather not replace a working link with a broke=
n link, or a<br>
&gt; broken link with another broken link.<br>
&gt; <br>
&gt; If we want to make this change, I think we&#39;re going to have to be =
creative<br>
&gt; with how the link replacement is done, as well as in how it&#39;s demo=
nstrated<br>
&gt; to reviewers that the new URLs are valid.<br>
&gt; <br>
&gt; One option, for instance, could be writing a small script that would c=
heck<br>
&gt; the link validity first and only make the change if the link was valid=
; and<br>
&gt; then including that script in the commit message.=C2=A0 The reviewer c=
ould then<br>
&gt; convince themselves that the script was correct, and give an Ack or R-=
b on<br>
&gt; that basis.=C2=A0 There are probably other ideas as well.<br>
&gt; <br>
&gt; Any thoughts?<br>
&gt; <br>
&gt;=C2=A0 -George<br>
<br>
What about breaking the patch up into smaller ones?=C2=A0 One could change<=
br>
all of the <a href=3D"http://xenbits.xen.org" rel=3D"noreferrer" target=3D"=
_blank">xenbits.xen.org</a> links in one patch, since those are known to<br=
>
support HTTPS.=C2=A0 Then keep going for other domains.<br></blockquote><di=
v><br></div><div>That would work for me.</div><div><br></div><div>=C2=A0-Ge=
orge</div></div></div>

--000000000000a76ade05f4559841--

