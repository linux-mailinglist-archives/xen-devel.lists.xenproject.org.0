Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E26A69F1
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:42:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503924.776342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIy9-0005Ek-O2; Wed, 01 Mar 2023 09:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503924.776342; Wed, 01 Mar 2023 09:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXIy9-0005CG-Kf; Wed, 01 Mar 2023 09:41:53 +0000
Received: by outflank-mailman (input) for mailman id 503924;
 Wed, 01 Mar 2023 09:41:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXIy8-0005CA-2d
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:41:52 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a434402-b815-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 10:41:49 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id g17so16836985lfv.4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 01:41:49 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 h17-20020ac250d1000000b004db3aa3c542sm1654146lfm.47.2023.03.01.01.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:41:48 -0800 (PST)
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
X-Inumbo-ID: 4a434402-b815-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677663709;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpdBonmqRajnd59qKBbWmQ+KeoFmFqQeBs2cuRk21Hg=;
        b=e5/1rJeFLtiyBgfIlmt0FBIkM50wk95PPCh0o3mgc1oSUxZrb9CWZY+7yJ5cj+aqHV
         xCtbEpUdg62tHRNihbuiZDCXHlJahg/qGF70yWH1+7Iect798JEXVW5RBTwuGwvakF/F
         4oLWgVvYcQVpCeHZ8AZs78xpz14dm/TzXcnx39QhwdqYBcKQJQK+59lcnTdxR4im3xO1
         axFXyGRji1BpUS4GedymK1inf0YfA18QLXV9JxZ/xaIRRpVES4L9q5vvqTUAndK523Tg
         IRhlSv4CNsiVd6BoIxwF23O8zxBzSKJIR6uaKNkgl0/fOXmYx0vSHePn4OTdsSX28XpO
         Wn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677663709;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpdBonmqRajnd59qKBbWmQ+KeoFmFqQeBs2cuRk21Hg=;
        b=1OZzd6KrnBnkNxY7/Ufg8IzR20U+FQP38JBKLMX1C/mZ9C/XNNq0sctOMrEN5mdhT/
         XfL2Q7JyzLtMrQExUDWWYSAW3PbciRLhaW30GZG+vqacDmQmlSMd12BmJK6um+LLt9oH
         CVInobbPAfDMu+GlrdFA57NmIzwN8C87hI/lmgW7XLsy+VRdUeXfEMjBhhUg/YqASiws
         ePtro+dXy76diKxisBZdApCglc65v9t7tMsJnghRJ2mK7c/ka2r9Uo/I37bt0PhI04f4
         yscgHFmbXO7F5088FiUWyaOwGd8/jfDZiovBy8ZcjRKtmcXq4G/zNuiaLG/fAa05bOTG
         zrBw==
X-Gm-Message-State: AO0yUKVnIs+G/cB7NNCpavJR/L0kgjy0JSBST4XCl58b1Ziv12DxE/B0
	SX+rBE2AKMkHhT4WbE/+0gk=
X-Google-Smtp-Source: AK7set+Dgx12D7ufWmqLNUUBw3uUyP5advSvv/aSDmLws/tb4ZcG4fa+iJNkobnW8TvIHBibncR19Q==
X-Received: by 2002:ac2:4c37:0:b0:4dc:4c3d:c883 with SMTP id u23-20020ac24c37000000b004dc4c3dc883mr1545611lfq.10.1677663709295;
        Wed, 01 Mar 2023 01:41:49 -0800 (PST)
Message-ID: <d35a9e46666819552a1174094bac8e8c1c5baece.camel@gmail.com>
Subject: Re: [PATCH v4 1/5] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 01 Mar 2023 11:41:46 +0200
In-Reply-To: <2fb6e5ad-9e25-9c63-7f01-8a3d55297cf7@suse.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
	 <397e6741438a8b125dc53945a74a58246fac4faf.1677237653.git.oleksii.kurochko@gmail.com>
	 <2fb6e5ad-9e25-9c63-7f01-8a3d55297cf7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-27 at 13:48 +0100, Jan Beulich wrote:
> On 24.02.2023 12:35, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -4,10 +4,95 @@
> > =C2=A0 *
> > =C2=A0 * RISC-V Trap handlers
> > =C2=A0 */
> > +
> > +#include <xen/errno.h>
>=20
> I couldn't spot anything in the file which would require this
> inclusion.
-EINVAL, -ENOENT are used in do_bug_frame() I missed that when wrote
previous answer on e-mail.

