Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF9952F96
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 15:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778116.1188168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seacq-0007OZ-D6; Thu, 15 Aug 2024 13:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778116.1188168; Thu, 15 Aug 2024 13:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seacq-0007MO-9g; Thu, 15 Aug 2024 13:34:48 +0000
Received: by outflank-mailman (input) for mailman id 778116;
 Thu, 15 Aug 2024 13:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQtD=PO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seaco-0007MI-Ud
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 13:34:46 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 222d6a73-5b0b-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 15:34:44 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5320d8155b4so1298845e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 06:34:44 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3ff73esm204618e87.167.2024.08.15.06.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 06:34:43 -0700 (PDT)
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
X-Inumbo-ID: 222d6a73-5b0b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723728884; x=1724333684; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=78ZstunvS/dHT0J6tQFgdJEmQzQGRS2Kk/vfbPAJg8I=;
        b=DusMcjHcBXUbBp/ycd6pZYBa2VMB2oHlbRsE0WRmcM+dyEswBN719+F0AgmJeMZiP8
         J8M/8yilHdsF4C2K9Qh6r/GheNiMIQD4h/ZyvXT6DjnjPVaDrq95bJ1uVx3iH5YpV7CY
         vOJXKVDdQyWTmtduqdQMrA2Uh2Q90zrZGgeUkRfAQzxnZi2qNnLba1TrgYKTRIQthu+A
         E77dOeWa/+Ht2ot/hnEF6eetJ9qBjIiNOZjeMT2ihr2cNzauycFX5Hmj3qn/Ccfpyjjl
         9hJaOM7ZnqWXwnyzlUdYFQmI1lHS85quD+QbbIwKG0Kuw+h762zS2w7MpYED9fmLUpmO
         YNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723728884; x=1724333684;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78ZstunvS/dHT0J6tQFgdJEmQzQGRS2Kk/vfbPAJg8I=;
        b=hPT2fUumJB/mxac6Hkfbl7goCh0SSuYWmF0uUcZ9cHRuC5y6/94UGIuIh78De7pyLi
         PPdHLTGaf+Uw+GOzk33MyUM9djmzSKhn5iC+f8/XZYWWNca7gdqzMQLreUWLFZKt5R80
         ZQO/nhwbz/Sza6YkwE9MOq/o3g0rWmNhaFr2ecO5wDRJ5hhHLQIq0k1Oo11lpUGtunZ3
         sALtaFCQNHXJ3Lt16JlgEuIwIrWno3un171f3ZZFPPcru4xlzLrq1rBfN83FCHFUnMXG
         dWD6ZY9gCZV8notk4QAEFVL6sFSHmD9nkXKAbVV1YiRbvDzYsJQ1w6NrXrJSzHxKRnfO
         Kzbw==
X-Forwarded-Encrypted: i=1; AJvYcCUJDL5ZpXYqw5PnKH1JjqCqbk7RfmaQYMg9SyfgyYvMeq4JNZd/HE7B8dWzGAWcCfv3fBQXCS6/gyQUiMc1Vw3wgZCnqapWSMowd0SBadE=
X-Gm-Message-State: AOJu0Yy7ea1OhqGv05K88Eve1OqjfwsFsMVYub8QWy+rTYH1Ca10lBMQ
	IX6agVn82Z6kzCpUSBS78YDPzeQ2dDifUtk1x0AZpRHoWXNpWJGh
X-Google-Smtp-Source: AGHT+IG/8/QYzRTa271TYIlqTEAGXscJvwOy4A7gEjcl7xDUgXpsr9S1OJCg8k2maPwiZxxr+RSomw==
X-Received: by 2002:a05:6512:39c5:b0:530:e323:b1d0 with SMTP id 2adb3069b0e04-532eda5e98dmr4196883e87.9.1723728883827;
        Thu, 15 Aug 2024 06:34:43 -0700 (PDT)
Message-ID: <48fc698708a87fed986cbb6526a6422bae488823.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2024 15:34:42 +0200
In-Reply-To: <2ded848e-f2a5-4005-b4c6-09014a92122c@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
	 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
	 <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
	 <d41f3027-14c8-4716-9444-d8bc109bb2b7@suse.com>
	 <be47249638cbae5e057279acd9a3464c218fbac8.camel@gmail.com>
	 <2ded848e-f2a5-4005-b4c6-09014a92122c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-15 at 14:16 +0200, Jan Beulich wrote:
> On 15.08.2024 13:21, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Thu, 2024-08-15 at 10:09 +0200, Jan Beulich wrote:
> > > On 14.08.2024 18:50, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
> > > > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > > > RISC-V detects superpages using `pte.x` and `pte.r`, as
> > > > > > there
> > > > > > is no specific bit in the PTE for this purpose. From the
> > > > > > RISC-V
> > > > > > spec:
> > > > > > ```
> > > > > > =C2=A0 ...
> > > > > > =C2=A0 4. Otherwise, the PTE is valid. If pte.r =3D 1 or pte.x =
=3D
> > > > > > 1, go
> > > > > > to
> > > > > > step 5.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 Otherwise, this PTE is a pointer to th=
e next level of
> > > > > > the
> > > > > > page
> > > > > > table.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 ... .
> > > > > > =C2=A0 5. A leaf PTE has been found.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > > > =C2=A0 ...
> > > > > > ```
> > > > > >=20
> > > > > > The code doesn=E2=80=99t support super page shattering so 4KB p=
ages
> > > > > > are
> > > > > > used as
> > > > > > default.
> > > > >=20
> > > > > ... you have this. Yet still callers expecting re-mapping in
> > > > > the
> > > > > (large)
> > > > > range they map can request small-page mappings right away.
> > > > I am not sure that I fully understand what do you mean by
> > > > "expcting
> > > > re-
> > > > mapping".
> > >=20
> > > Right now you have callers pass PTE_BLOCK when they know that no
> > > small
> > > page re-mappings are going to occur for an area. What I'm
> > > suggesting
> > > is
> > > that you invert this logic: Have callers pass PTE_SMALL when
> > > there is
> > > a possibility that re-mapping requests may be issued later. Then,
> > > later, by simply grep-ing for PTE_SMALL you'll be able to easily
> > > find
> > > all candidates that possibly can be relaxed when super-page
> > > shattering
> > > starts being supported. That's going to be easier than finding
> > > all
> > > instances where PTE_BLOCK is _not_used.
> > So if I understand correctly. Actually nothing will change in
> > algorithm
> > of pt_update() and only PTE_SMALL should be introduced instead of
> > PTE_BLOCK. And if I will know that something will be better to map
> > as
> > PTE_SMALL to not face shattering in case of unmap (for example) I
> > just
> > can map this memory as PTE_SMALL and that is it?
>=20
> That is it.
>=20
> > > > > > +=C2=A0=C2=A0=C2=A0 spin_unlock(&xen_pt_lock);
> > > > >=20
> > > > > Does this really need to come after fence and flush?
> > > > I think yes, as page table should be updated only by 1 CPU at
> > > > the
> > > > same
> > > > time. And before give ability to other CPU to update page table
> > > > we
> > > > have
> > > > to finish a work on current CPU.
> > >=20
> > > Can you then explain to me, perhaps by way of an example, what
> > > will
> > > go
> > > wrong if the unlock is ahead of the flush? (I'm less certain
> > > about
> > > the
> > > fence, and that's also less expensive.)
> > pt_update() will be called for interleaved region, for example, by
> > different CPUs:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update():
> > CPU1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU2:
> > =C2=A0...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&xen_pt_lock)=
;
> > RISCV_FENCE(rw, rw);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
> >=20
> > /* After this function will be
> > =C2=A0=C2=A0 executed the following thing
> > =C2=A0=C2=A0 can happen ------------------>=C2=A0 start to update page =
table
> > */=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entries which was partiall=
y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > spin_unlock(&xen_pt_lock);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 created during CPU1 but
> > CPU2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 doesn't know about them
> > yet=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 because flush_tlb() ( sfence.vma
> > )=20
> > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wasn't done=C2=A0=C2=A0=C2=A0=C2=A0=
 =C2=A0
> > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> > =C2=A0=C2=A0=20
> > flush_tlb_range_va();
>=20
> Not exactly: CPU2 knows about them as far as the memory used /
> modified
> goes, and that's all that matters for further page table
> modifications.
> CPU2 only doesn't know about the new page table entries yet when it
> comes
> to using them for a translation (by the hardware page walker). Yet
> this
> aspect is irrelevant here, if I'm not mistaken.
And it isn't an issue that CPU2 will add these new page table entries
again during execution of CPU2's pt_update()?

~ Oleksii

