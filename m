Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4794EDF7
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775587.1185807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUyK-00085i-3s; Mon, 12 Aug 2024 13:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775587.1185807; Mon, 12 Aug 2024 13:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUyK-00083h-1M; Mon, 12 Aug 2024 13:20:28 +0000
Received: by outflank-mailman (input) for mailman id 775587;
 Mon, 12 Aug 2024 13:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KPBI=PL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sdUyJ-00083b-1g
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:20:27 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2667d3d-58ad-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 15:20:25 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso3615751e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:20:25 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb2136d1sm227786066b.155.2024.08.12.06.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 06:20:23 -0700 (PDT)
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
X-Inumbo-ID: a2667d3d-58ad-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723468824; x=1724073624; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhC2OqDl1puffudqOP75LOp4l/A/qZYepve+hh1qMuk=;
        b=db96YkBaQn1dFw/rF5QFTx+tmSOX09QNuYlsncLMhV8AwREV5znYsgDkaryuiN6v5e
         lnqxYTt48ccR24afdi76rXyf4zLcsGsjnxFH1xWcZ4/yykFaiuEYNgUAv8UWIYOtE3Y8
         z9GpyxkMzpBIv7b1EJ1IE4yWcxSEf9v/N9Gb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723468824; x=1724073624;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhC2OqDl1puffudqOP75LOp4l/A/qZYepve+hh1qMuk=;
        b=vFvew/qwWzIWJAKWmFsOOZfw7RmllvSaUuNWaA2ccrZ0sUFZ9ehdQNYHgJhATNNKzB
         IYMSkoSSVb0a8NnOii/0Nm7AC2FCihq0ZA3LB+fnS8dCjWqNqIbj/l246TOU6JS4RMhV
         OGXA0AtdNVsTLMvLBGGq32xFt/fzXXtnuic/n1MSNztJL3xxrzO1oWc4Wps0QM3OYclZ
         rySggQLqQGemCS0ANtUy640fJi1tOTIgYXRmQynkwoUE/50D5bNx9FulFdAYR9m2INn1
         XskXVf2Hc6YwP8II2fWVOiSYY+dLkkrdz9uWRRnrVKtjdguNszTF06Dv0Q7iqLnKk+cB
         14UQ==
X-Gm-Message-State: AOJu0Yyk2fLckEHS3X61fLSITxrrKE4WX5F5gg28YvDWfolQx2tKGbHh
	5v5hyAEePdk4pk6R8z68feLD8k8TxahVX4vYu69znar2fMcr4EFDxn6w0+ENslI=
X-Google-Smtp-Source: AGHT+IGaFovc/mOscy3BLvf3ZgXoCeeUWfFL9FBEy/9iofOVz6tw2T5/DSZD0nWI2gpSnzSp6ukABw==
X-Received: by 2002:a05:6512:2215:b0:52e:9cf0:69db with SMTP id 2adb3069b0e04-53213684cd6mr83047e87.46.1723468824050;
        Mon, 12 Aug 2024 06:20:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Aug 2024 14:20:22 +0100
Message-Id: <D3DYPIPLBSEA.14PVSCSI619Y8@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>
Subject: Re: [RFC PATCH] xen: Remove -Wdeclaration-after-statement
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
 <alpine.DEB.2.22.394.2408091217370.200407@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2408091217370.200407@ubuntu-linux-20-04-desktop>

On Fri Aug 9, 2024 at 8:25 PM BST, Stefano Stabellini wrote:
> Adding Roberto
>
> Does MISRA have a view on this? I seem to remember this is discouraged?
>

I'd be surprised if MISRA didn't promote declaring close to first use to av=
oid
use-before-init, but you very clearly have a lot more exposure to it than I=
 do.

I'm quite curious about what its preference is and the rationale for it.

>
> On Fri, 9 Aug 2024, Alejandro Vallejo wrote:
> > This warning only makes sense when developing using a compiler with C99
> > support on a codebase meant to be built with C89 compilers too, and
> > that's no longer the case (nor should it be, as it's been 25 years sinc=
e
> > C99 came out already).
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> > Yes, I'm opening this can of worms. I'd like to hear others people's
> > thoughts on this and whether this is something MISRA has views on. If
> > there's an ulterior non-obvious reason besides stylistic preference I
> > think it should be documented somewhere, but I haven't seen such an
> > explanation.
> >=20
> > IMO, the presence of this warning causes several undesirable effects:
> >=20
> >   1. Small functions are hampered by the preclusion of check+declare
> >      patterns that improve readability via concision. e.g: Consider a
> >      silly example like:
> >=20
> >      /* with warning */                     /* without warning */
> >      void foo(uint8_t *p)                   void foo(uint8_t *p)
> >      {                                      {
> >          uint8_t  tmp1;                         if ( !p )
> >          uint16_t tmp2;                             return;
> >          uint32_t tmp3;
> >                                                 uint8_t  tmp1 =3D OFFSE=
T1 + *p;
> >          if ( !p )                              uint16_t tmp2 =3D OFFSE=
T2 + *p;
> >              return;                            uint32_t tmp3 =3D OFFSE=
T3 + *p;
> >=20
> >          tmp1 =3D OFFSET1 + *p;                   /* Lots of uses of `t=
mpX` */
> >          tmp2 =3D OFFSET2 + *p;               }
> >          tmp2 =3D OFFSET2 + *p;
> >=20
> >          /* Lots of uses of tmpX */
> >      }
> >=20
> >   2. Promotes scope-creep. On small functions it doesn't matter much,
> >      but on bigger ones to prevent declaring halfway through the body
> >      needlessly increases variable scope to the full scope in which the=
y
> >      are defined rather than the subscope of point-of-declaration to
> >      end-of-current-scope. In cases in which they can be trivially
> >      defined at that point, it also means they can be trivially misused
> >      before they are meant to. i.e: On the example in (1) assume the
> >      conditional in "with warning" is actually a large switch statement=
.
> >=20
> >   3. It facilitates a disconnect between time-of-declaration and
> >      time-of-use that lead very easily to "use-before-init" bugs.
> >      While a modern compiler can alleviate the most egregious cases of
> >      this, there's cases it simply cannot cover. A conditional
> >      initialization on anything with external linkage combined with a
> >      conditional use on something else with external linkage will squas=
h
> >      the warning of using an uninitialised variable. Things are worse
> >      where the variable in question is preinitialised to something
> >      credible (e.g: a pointer to NULL), as then that can be misused
> >      between its declaration and its original point of intended use.
> >=20
> > So... thoughts? yay or nay?
>
> In my opinion, there are some instances where mixing declarations and
> statements would enhance the code, but these are uncommon. Given the
> choice between:
>
> 1) declarations always first
> 2) declarations always mixed with statements
>
> I would choose 1).

FWIW, so would I under those contraints. But let me at least try to persuad=
e
you. There's at least two more arguments to weigh:

  1. It wasn't that long ago that we had to resort to GNU extensions to wor=
k
     around this restriction. It's mildly annoying having to play games wit=
h
     compiler extensions because we're purposely restricting our use of the
     language.

     See the clang codegen workaround:
        https://lore.kernel.org/xen-devel/D2ZM0D609TOQ.2GQQWR1QALUPA@cloud.=
com/

  2. There's an existing divide between toolstack and hypervisor. Toolstack
     already allows this kind of mixing, and it's hard not-to due to extern=
al
     dependencies. While style doesn't have to match 1:1, it'd be (imo)
     preferrable to try and remove avoidable differences.

     See (40be6307ec00: "Only compile the hypervisor with -Wdeclaration-aft=
er-statement")
         https://lore.kernel.org/xen-devel/20231205183226.26636-1-julien@xe=
n.org/

With this in mind, ...

>
> One could say that mixing declarations with statements should be done
> only when appropriate, but the challenge lies in the subjective nature
> of "when appropriate." Different individuals have varying
> interpretations of this, which could lead to unnecessary bikeshedding.

... I do agree that whatever changes we introduce, considering the usual
complaints about the review process, should be in a direction of measurable
objectivity so as to minimize unproductive nitpicking.

In that sense, a differently worded choice is:

  1. Declarations always at the beginning of the scope closest to first use=
.
  2. Declarations always closest to first use.

They really aren't that different, and we do already make reviews asking fo=
r
declarations to be moved to the closest scope. Given this choice I definite=
ly
prefer (2), in part because it removes the uncertainty from review that tru=
e
freeform declarations would allow, better aligns our dialect of C with the
current standard and aligns the hypervisor style (slightly) with the tools =
it
requires.

Plus the advantages I already mentioned in the original email.

>
> For these reasons, I do not support mixing declarations and statements.

Pending whatever MISRA has to say on the matter, I hope these arguments can
steer your view.

Cheers,
Alejandrq

