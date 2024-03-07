Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC79874B71
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 10:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689708.1074933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riASz-0005go-Kv; Thu, 07 Mar 2024 09:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689708.1074933; Thu, 07 Mar 2024 09:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riASz-0005fB-Ga; Thu, 07 Mar 2024 09:55:09 +0000
Received: by outflank-mailman (input) for mailman id 689708;
 Thu, 07 Mar 2024 09:55:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qMR=KN=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1riASx-0005f5-92
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 09:55:07 +0000
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5f5428b-dc68-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 10:55:05 +0100 (CET)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c219604f51so373546b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 01:55:05 -0800 (PST)
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
X-Inumbo-ID: c5f5428b-dc68-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709805304; x=1710410104; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF8NOsya8q6lPS0cnvRqrZu0roqupg73tnRNu4gZNNQ=;
        b=GM5MyaUTgEytBFQycJksD6/NLYKQaI4pvJf0iMa2SGsPXOSI6veG7ma1Xx/Df+v3sY
         p7tKhSB+TY/HdJOildCAQPsd+Ndol5jIWGG40teX2G4SHNV8FHWnx/uiTYh9nqsmcJdH
         YnOh0iXUQ1AsMWHqFuFwWO54S8lr1VEvFDAVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709805304; x=1710410104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF8NOsya8q6lPS0cnvRqrZu0roqupg73tnRNu4gZNNQ=;
        b=A1Tkpwi0NtUxV7KJqo+zusVLhq27MCztI+3zYkQpVrgBvLyBZwQvDZmRXHedaHJIdF
         M2agD2K8DQXUoLeTGu+0V6OMU8Xhxi+J7AwMoyR2pvelsasmQcU71jlH8gKM65Gw0stt
         b3nqGy+oTHnNawYJJxU9XTU7HZrYT3SlNXOyu5TK3W5m8Tt28RYfr64pjH5Jqy9i0CKO
         6YOa4dLvclbMFYzDD2HJn9r3Egxn9DZeucrPEm9fGXmPtx74GNk+YdiSj1agPZAy1qud
         SokR4DAsl4OaTEjIL/Tx5tVzhESFkXMMaqI4FxgzsltB8VGCDNSL2KUrKUA/WDBbgyNd
         qWig==
X-Forwarded-Encrypted: i=1; AJvYcCUTPBQ26ouMzVqosFJWhwJzBlRldvBWbqlJnw2nXofrzkfYajpBv8sAATVX1aSDNNpnvOz8nkbuae5/acjBUBEIr0D3mJFiDYhnZxdECqY=
X-Gm-Message-State: AOJu0Yyht0czV6vOtptHHSgNPzqLw3U6U05ozoFqQmYQ+jryJHUSB3SB
	hheOYraX8S8Wu4prbY4VB0lCvz2ZWN2U6lYDXEsyotojtHL/rNmeONgV/NpHUT/eOSAylM/IljI
	7PRG1OXINSdTtlmAZX8xoNon35pjsJBeoT8YgCQ==
X-Google-Smtp-Source: AGHT+IE5a4+QbsY1ES+vvfCudzxFBk3rzUJMaI7FxC11qN6UMiq2SCvXz4sAMxo5nbKMR3N8Zkurz+sMh3Ps5UeisMs=
X-Received: by 2002:a05:6870:208:b0:221:2e06:c5d2 with SMTP id
 j8-20020a056870020800b002212e06c5d2mr8471486oad.58.1709805304527; Thu, 07 Mar
 2024 01:55:04 -0800 (PST)
MIME-Version: 1.0
References: <79ed633d-b0bd-4a7d-a0c6-37a034e1ee96@suse.com>
 <0374516c-b5fa-4880-a07a-0b788f491e9a@xen.org> <CACMJ4Gaw86kR0QAgWYNtu9JtU5TT=pEN_MBNwn1MB7FLb7pjRw@mail.gmail.com>
In-Reply-To: <CACMJ4Gaw86kR0QAgWYNtu9JtU5TT=pEN_MBNwn1MB7FLb7pjRw@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 7 Mar 2024 09:54:53 +0000
Message-ID: <CA+zSX=aN2s588E6Ueo+Yk5ePPsss1q+NcHH0T-ytJDwt_cnevA@mail.gmail.com>
Subject: Re: [PATCH v2] Argo: don't obtain excess page references
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, openxt <openxt@googlegroups.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 11:38=E2=80=AFPM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Sun, Feb 18, 2024 at 10:01=E2=80=AFAM Julien Grall <julien@xen.org> wr=
ote:
> >
> > Hi Jan,
> >
> > On 14/02/2024 10:12, Jan Beulich wrote:
> > > find_ring_mfn() already holds a page reference when trying to obtain =
a
> > > writable type reference. We shouldn't make assumptions on the general
> > > reference count limit being effectively "infinity". Obtain merely a t=
ype
> > > ref, re-using the general ref by only dropping the previously acquire=
d
> > > one in the case of an error.
> > >
> > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Reviewed-by: Julien Grall <jgrall@amazon.com>
> >
> > > ---
> > > I further question the log-dirty check there: The present P2M type of=
 a
> > > page doesn't really matter for writing to the page (plus it's stale b=
y
> > > the time it is looked at). Instead I think every write to such a page
> > > needs to be accompanied by a call to paging_mark_dirty().
> >
> > I agree with that.
>
> Adding OpenXT mailing list as I have found that I have not had the
> time available that I had hoped for to spend on reviewing this Argo
> change, and to provide opportunity for downstream feedback.
>
> Link to the posted patch (start of this thread):
> https://lists.xenproject.org/archives/html/xen-devel/2024-02/msg00858.htm=
l

Could we add some more designated reviewers / maintainers to the Argo
code to help spread the load a bit?

 -George

