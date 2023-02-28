Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483EE6A59D2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 14:07:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503352.775601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzhF-0001yW-6s; Tue, 28 Feb 2023 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503352.775601; Tue, 28 Feb 2023 13:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWzhF-0001vV-43; Tue, 28 Feb 2023 13:07:09 +0000
Received: by outflank-mailman (input) for mailman id 503352;
 Tue, 28 Feb 2023 13:07:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG3a=6Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWzhD-0001vP-Fq
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 13:07:07 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc60d56a-b768-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 14:07:05 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id r27so13052105lfe.10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 05:07:05 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 z22-20020ac25df6000000b0049c29389b98sm1328575lfq.151.2023.02.28.05.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 05:07:04 -0800 (PST)
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
X-Inumbo-ID: cc60d56a-b768-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zbu3uOYcqV6B5B018G+P6OrukBE5mSo5Fb0sDScl+oU=;
        b=OolWCfZXbYQL3UsQiMY6SF9g2OOR93dFFlD493DBgHxpqeioq6Sxggdyppndu99a2R
         aLcGvI9Wq2e5ySLipMwLUgelWVHcbh2AUvxWbfXQ1RVnD/Lvf3mk5C8d28agtcjqLr5u
         UJs1wMm3Q0b7xz2d4jeXfjQ9yEajf1TeGKIcw/ydnmn4ATou2yH92iwCvZiv0tg1KeJq
         pF5kf6qchaQ1n7EqRmZnZIKnmQ81nS07npl3STiEBZFJF3jQpw1NP9PkVNoMReI9+E2x
         M9jw6mUXergbKewN4qQYkryrw+xdJzLDqLz4M2f3AeYbbm62v8DpnrVbxRDViAczMhIO
         JDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zbu3uOYcqV6B5B018G+P6OrukBE5mSo5Fb0sDScl+oU=;
        b=fiyvYMwb3YKY5ODOFecPHrKq2zMC+Bj1rvTzP9jmppyctRwKggSMgwWkpI4ppuxRIp
         +z5awR4p+FmvniBNPg4Tsdq7AjHnBR+GnCwoA65ovLHh9o2yB3fI2yqoNT+/vcCQdHM8
         /bK+NAR3qJIQ0NK3wFQ7fBC4R2e5MOazpF5ThXaKV77ZIDwRis73av1kS9XI+9tVNNUA
         HzRERAjz0Ugo9dEKb6y+2bZdl4J9tyuk/Pupfwk5aNDk3sc0qs6+Xic2frz8AImGtOLp
         RXlUotMlTBBtxTsBkAfYVrdbFD2yz/3yAwPXmiInZny3uTqiNDcpHgzlMHVOEIdkN+CG
         xBXA==
X-Gm-Message-State: AO0yUKWVkROj6JNzHu+fFCrVhjIQ87GQBEoPx8PvAqVy48nE7gDQlvl8
	rfx2TPBQBbzggA2e7ACt8k8=
X-Google-Smtp-Source: AK7set9AvsaGHK+zibc9ozpdcufhEBtXkpPNeLH4GhM3y9QIl27L75jMwTMoUx40gJ4zk6LH6RsckA==
X-Received: by 2002:ac2:442e:0:b0:4d8:7f17:d0e9 with SMTP id w14-20020ac2442e000000b004d87f17d0e9mr640657lfl.14.1677589624612;
        Tue, 28 Feb 2023 05:07:04 -0800 (PST)
Message-ID: <e22d11d172226cab566a5e0f79d6cf51f402d3ad.camel@gmail.com>
Subject: Re: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
  George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Tue, 28 Feb 2023 15:07:02 +0200
In-Reply-To: <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
	 <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
	 <468d6130-739e-4b0e-44e7-5aab520a0cac@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Sat, 2023-02-25 at 16:47 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 24/02/2023 11:31, Oleksii Kurochko wrote:
> > Since the generic version of bug.h stuff was introduced use
> > <xen/bug.h>
> > instead of unnecessary <asm/bug.h>
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0 * Update patch 2 not to break compilation: move some parts from
> > patches 3 and 4
> > =C2=A0=C2=A0=C2=A0 to patch 2:
> > =C2=A0=C2=A0=C2=A0 * move some generic parts from <asm/bug.h> to <xen/b=
ug.h>
> > =C2=A0=C2=A0=C2=A0 * add define BUG_FRAME_STRUCT in ARM's <asm/bug.h>
> > ---
> > Changes in V2:
> > =C2=A0 * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as
> > second patch,
> > =C2=A0=C2=A0=C2=A0 update the patch to change all <asm/bug.h> to <xen/b=
ug.h> among
> > the whole project
> > =C2=A0=C2=A0=C2=A0 to not break build.
> > =C2=A0 * Update the commit message.
> > ---
> > =C2=A0 xen/arch/arm/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 +++----------------
> > =C2=A0 xen/arch/arm/include/asm/div64.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 +-
> > =C2=A0 xen/arch/arm/vgic/vgic-v2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/arm/vgic/vgic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/x86/acpi/cpufreq/cpufreq.c=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/x86/include/asm/asm_defns.h |=C2=A0 2 +-
> > =C2=A0 xen/arch/x86/include/asm/bug.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 ++-----------------
> > =C2=A0 xen/drivers/cpufreq/cpufreq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 xen/include/xen/lib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 9 files changed, 12 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/xen/arch/arm/include/asm/bug.h
> > b/xen/arch/arm/include/asm/bug.h
> > index f4088d0913..cacaf014ab 100644
> > --- a/xen/arch/arm/include/asm/bug.h
> > +++ b/xen/arch/arm/include/asm/bug.h
> > @@ -1,6 +1,8 @@
> > =C2=A0 #ifndef __ARM_BUG_H__
> > =C2=A0 #define __ARM_BUG_H__
> > =C2=A0=20
> > +#include <xen/types.h>
>=20
> You are not adding new code in bug.h, so can you explain why this is
> now=20
> necessary?
I am not adding new code but inside 'struct bug_frame' there are
uint16_t and uint32_t which are defined in <xen/types.h>.

And after <asm/bug.h> was changed to <xen/bug.h> it started to complain
on these types.
>=20
> > +
> > =C2=A0 #if defined(CONFIG_ARM_32)
> > =C2=A0 # include <asm/arm32/bug.h>
> > =C2=A0 #elif defined(CONFIG_ARM_64)
> > @@ -9,9 +11,7 @@
> > =C2=A0 # error "unknown ARM variant"
> > =C2=A0 #endif
> > =C2=A0=20
> > -#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>=20
> Even if the values are the same as the one you defined in the common=20
> bug.h, it doesn't feel right to remove them as long as...
>=20
> > +#define BUG_FRAME_STRUCT
>=20
> the arch is defining BUG_FRAME_STRUCT. So I would say the generic one
> should be defined within BUG_FRAME_STRUCT.
One of the reason BUG_DISP_WIDTH, BUG_LINE_* were removed is that they
don't use in ARM at all...

But generally I agree that it should be part of "#ifndef
BUG_FRAME_STRUCT" as it is 'struct bug_frame is dependent on it and
these defines look 'struct bug_frame' specific.

I'll update that in new version of the patch.
>=20
> Cheers,
>=20


