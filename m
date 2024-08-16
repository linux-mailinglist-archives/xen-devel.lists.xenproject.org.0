Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2595452C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2024 11:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778432.1188465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sesy7-0005V1-1d; Fri, 16 Aug 2024 09:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778432.1188465; Fri, 16 Aug 2024 09:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sesy6-0005SW-UW; Fri, 16 Aug 2024 09:09:58 +0000
Received: by outflank-mailman (input) for mailman id 778432;
 Fri, 16 Aug 2024 09:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6pmz=PP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sesy5-0005SQ-1O
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2024 09:09:57 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e03f29e-5baf-11ef-a505-bb4a2ccca743;
 Fri, 16 Aug 2024 11:09:55 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso2866905e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Aug 2024 02:09:55 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3afb37sm489003e87.20.2024.08.16.02.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 02:09:54 -0700 (PDT)
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
X-Inumbo-ID: 4e03f29e-5baf-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723799395; x=1724404195; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vUEZdaXsro3QmbQ+m7qaUpgvb6+JGU58LOwr5bfWnVc=;
        b=gzt4OAYmpa8viJX6V/0wxR94G6cVPz6WeStt/zraVf+qjrcrW1W/Lg3n6cexb5X8Z1
         LS2iWX/SeqKQlB/K3xCGfzYSJG+NXvCE28p3lfeN9Xzbgi6Xe1Q83r8uqPjMpkzEm1dV
         Aof6yKNOaHLAZHx8MGzqFl+tTOyu7OSF+wVuhkpanDKt90IdOKLJh/DsLArXy+CawWpj
         5KBi4CG1TQ+RRsFEMeUlxyygHqFBgjncyXvvM9k61Tw0AinpztJe4IN6HUEFFRJZAAzE
         Fbg1ao+HynH2vrLbG5TPcLbwsYd0oytNaJ+Zn/dp3jumSODWTPsECbrL5L9NFQBrwiD9
         J9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723799395; x=1724404195;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUEZdaXsro3QmbQ+m7qaUpgvb6+JGU58LOwr5bfWnVc=;
        b=K4l1O1PQGRUJMDUWTKDMKxkx/DgkoIJm2FbcHNpCCaGgTzm4Yqij3lvwLwDhHxaUVw
         3BN+lEQrkbKDdjxvFn9cbJNrkzR3qZbRJctiDoWyZH+IW5PM31rkYnVkL5FXoZdt73M6
         LZbP3cBJDSfkBY7L5KrvC7MgK226hHpn/s1fry8NFxkQyYMpgx3oxHWzyhXV3oFLfoWv
         SsxiCIQJa2IkvDHGxfdIW7OvJjXm56wj+95AICeon+GLmkquepriV99nTqGoKJX00hGC
         gvFRYmQ+FKo3UC4YGTz8R9b8wT/LR+tOmLsuLSsMeeuH9msBr00ZWZvpAJSp4L7l12cg
         ZdGg==
X-Forwarded-Encrypted: i=1; AJvYcCWPiegzwEEkKbXySJzqAKeX5K/1/DQ4JTkYSGbhHzTzigcVg1THa9+x1L1lwlRnAecr/pfsnuupIztv1Jegndrf/3lfd+WjjDPhKwveesw=
X-Gm-Message-State: AOJu0Yyo3JHSG03OpnJL4NjOZdt5mM/kqfbUW09+LtYaMmDudKfAeE1g
	flyLQULssddNFDwlaFxTFV8mTnv6SE7chZ6rNz+7AgeimA1hUqGJ
X-Google-Smtp-Source: AGHT+IGXm96dJ30fnCB3CUOQf4N+vfPiwX1Mzss78YvORz+wp1vxsuf8wWJtORxgUNtUrKXToxSUow==
X-Received: by 2002:a05:6512:280a:b0:52c:e11e:d493 with SMTP id 2adb3069b0e04-5331c6b1d27mr1352635e87.26.1723799394831;
        Fri, 16 Aug 2024 02:09:54 -0700 (PDT)
Message-ID: <337a2fe952b7e81c27fae67c23154eefa2f7ae42.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 16 Aug 2024 11:09:53 +0200
In-Reply-To: <63af73be-d95e-47d5-bfbe-7f0304118a17@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
	 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
	 <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
	 <d41f3027-14c8-4716-9444-d8bc109bb2b7@suse.com>
	 <be47249638cbae5e057279acd9a3464c218fbac8.camel@gmail.com>
	 <2ded848e-f2a5-4005-b4c6-09014a92122c@suse.com>
	 <48fc698708a87fed986cbb6526a6422bae488823.camel@gmail.com>
	 <63af73be-d95e-47d5-bfbe-7f0304118a17@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-15 at 17:26 +0200, Jan Beulich wrote:
> On 15.08.2024 15:34, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Thu, 2024-08-15 at 14:16 +0200, Jan Beulich wrote:
> > > On 15.08.2024 13:21, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Thu, 2024-08-15 at 10:09 +0200, Jan Beulich wrote:
> > > > > On 14.08.2024 18:50, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > > > On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
> > > > > > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > > > > > RISC-V detects superpages using `pte.x` and `pte.r`, as
> > > > > > > > there
> > > > > > > > is no specific bit in the PTE for this purpose. From
> > > > > > > > the
> > > > > > > > RISC-V
> > > > > > > > spec:
> > > > > > > > ```
> > > > > > > > =C2=A0 ...
> > > > > > > > =C2=A0 4. Otherwise, the PTE is valid. If pte.r =3D 1 or pt=
e.x
> > > > > > > > =3D
> > > > > > > > 1, go
> > > > > > > > to
> > > > > > > > step 5.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 Otherwise, this PTE is a pointer t=
o the next level
> > > > > > > > of
> > > > > > > > the
> > > > > > > > page
> > > > > > > > table.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 ... .
> > > > > > > > =C2=A0 5. A leaf PTE has been found.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > > > > > =C2=A0 ...
> > > > > > > > ```
> > > > > > > >=20
> > > > > > > > The code doesn=E2=80=99t support super page shattering so 4=
KB
> > > > > > > > pages
> > > > > > > > are
> > > > > > > > used as
> > > > > > > > default.
> > > > > > >=20
> > > > > > > ... you have this. Yet still callers expecting re-mapping
> > > > > > > in
> > > > > > > the
> > > > > > > (large)
> > > > > > > range they map can request small-page mappings right
> > > > > > > away.
> > > > > > I am not sure that I fully understand what do you mean by
> > > > > > "expcting
> > > > > > re-
> > > > > > mapping".
> > > > >=20
> > > > > Right now you have callers pass PTE_BLOCK when they know that
> > > > > no
> > > > > small
> > > > > page re-mappings are going to occur for an area. What I'm
> > > > > suggesting
> > > > > is
> > > > > that you invert this logic: Have callers pass PTE_SMALL when
> > > > > there is
> > > > > a possibility that re-mapping requests may be issued later.
> > > > > Then,
> > > > > later, by simply grep-ing for PTE_SMALL you'll be able to
> > > > > easily
> > > > > find
> > > > > all candidates that possibly can be relaxed when super-page
> > > > > shattering
> > > > > starts being supported. That's going to be easier than
> > > > > finding
> > > > > all
> > > > > instances where PTE_BLOCK is _not_used.
> > > > So if I understand correctly. Actually nothing will change in
> > > > algorithm
> > > > of pt_update() and only PTE_SMALL should be introduced instead
> > > > of
> > > > PTE_BLOCK. And if I will know that something will be better to
> > > > map
> > > > as
> > > > PTE_SMALL to not face shattering in case of unmap (for example)
> > > > I
> > > > just
> > > > can map this memory as PTE_SMALL and that is it?
> > >=20
> > > That is it.
> > >=20
> > > > > > > > +=C2=A0=C2=A0=C2=A0 spin_unlock(&xen_pt_lock);
> > > > > > >=20
> > > > > > > Does this really need to come after fence and flush?
> > > > > > I think yes, as page table should be updated only by 1 CPU
> > > > > > at
> > > > > > the
> > > > > > same
> > > > > > time. And before give ability to other CPU to update page
> > > > > > table
> > > > > > we
> > > > > > have
> > > > > > to finish a work on current CPU.
> > > > >=20
> > > > > Can you then explain to me, perhaps by way of an example,
> > > > > what
> > > > > will
> > > > > go
> > > > > wrong if the unlock is ahead of the flush? (I'm less certain
> > > > > about
> > > > > the
> > > > > fence, and that's also less expensive.)
> > > > pt_update() will be called for interleaved region, for example,
> > > > by
> > > > different CPUs:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_update():
> > > > CPU1:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 CPU2:
> > > > =C2=A0...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&xen_pt_lo=
ck);
> > > > RISCV_FENCE(rw, rw);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ....
> > > >=20
> > > > /* After this function will be
> > > > =C2=A0=C2=A0 executed the following thing
> > > > =C2=A0=C2=A0 can happen ------------------>=C2=A0 start to update p=
age table
> > > > */=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entries which was
> > > > partially=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > spin_unlock(&xen_pt_lock);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 created during CPU1 but
> > > > CPU2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 doesn't know about them
> > > > yet=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 because flush_tlb() (
> > > > sfence.vma
> > > > )=20
> > > > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wasn't done=C2=A0=C2=A0=C2=A0=C2=
=A0 =C2=A0
> > > > ....=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > =C2=A0=C2=A0=20
> > > > flush_tlb_range_va();
> > >=20
> > > Not exactly: CPU2 knows about them as far as the memory used /
> > > modified
> > > goes, and that's all that matters for further page table
> > > modifications.
> > > CPU2 only doesn't know about the new page table entries yet when
> > > it
> > > comes
> > > to using them for a translation (by the hardware page walker).
> > > Yet
> > > this
> > > aspect is irrelevant here, if I'm not mistaken.
> > And it isn't an issue that CPU2 will add these new page table
> > entries
> > again during execution of CPU2's pt_update()?
>=20
> Add these page table entries again? That's only going to happen due
> to
> another bug somewhere, I suppose. And it would be as much (or as
> little)
> of an issue if that happened right after dropping the lock.
Yes, agree, it sounds more like a bug. Thanks.

~ Oleksii

