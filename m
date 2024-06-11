Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB19903498
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737998.1144545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwR9-0006Gj-Nf; Tue, 11 Jun 2024 08:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737998.1144545; Tue, 11 Jun 2024 08:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwR9-0006EN-KV; Tue, 11 Jun 2024 08:00:59 +0000
Received: by outflank-mailman (input) for mailman id 737998;
 Tue, 11 Jun 2024 08:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rr1P=NN=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGwR7-0006EH-Ur
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:00:57 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baffc0c3-27c8-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 10:00:56 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5bae81effd1so370589eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 01:00:56 -0700 (PDT)
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
X-Inumbo-ID: baffc0c3-27c8-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718092855; x=1718697655; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEi3zevVXfjsj8/mtFCGT2oWlIyt4mIIfGQQN0Jtzkg=;
        b=PJ1q81f2O/DvDqMUv//micrTsRXAh5hMM2/gN1BmSQBfhiBo78gLAH0MesHIfcZdCp
         c0kTKfjvBQi3ZE9oZ3MfdRPKgx/a1Nom4qBdL/nEcDMpQKG6EfFz6ZwaS3uJO0YB10qo
         jt6yadofL8b7hozrBpbJ4oKEr+cafttUhuDwv3PC7fQwORu9oyXEBtsNsi9TkQTpvFGp
         hSt65Ev7+utvpmZowWPt9d/bortDRDk6UBQMCr3J1vVRAR07AsAL5BUBGgEjFjTiyi9L
         55Ca3FwpOOvSffZxbE+DSteU3f3YgBA2QdTMtH9iUJN5huh1vZehMULFouzGMNnl5ExY
         C0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718092855; x=1718697655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEi3zevVXfjsj8/mtFCGT2oWlIyt4mIIfGQQN0Jtzkg=;
        b=trHROC+lW6S1c0d1TQ5uotONTFZIBhZPv3NhNbY2aqJ0zwXdIb/8rSNrzRayXj6/t5
         OHb652UOOF5Woqf9rY/c2qrmCLz3rVha5k7THNbQ738ha8QHJbocs6I8cy6slICzm8Th
         f8sKP4+3nzJkRC7UsxMT1Yd4cJNqfBdFoHfPXx6VC4HbeAiyFPUUHaG7c4a88U5kzQrQ
         qiN4LVXJz5Y+jeffQQwxq2tuTvk7xyEBeV4aIufFBDX65/ESl4P6qidXQDpUkHMpkZYy
         oheHfk2oRmI7ePitwvWJxdOz5h5IOJ7BPaSg+NjYGPpuMagbGx2FNqkB8im26T9fxs5g
         QxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIaAXHZwb0RY/z4qHWdLdzzFYGYxC8xCTqd26xHrjBP2C/2VyB+Yoq6EfxnfoNqCPOatsVAciVOkLXNhgCuTZxiHG6FQlwC2hk5ZMOO7o=
X-Gm-Message-State: AOJu0YyvC5oxmZSsdVRKBeF/Oy0hHoomqiA3IJuuOFq7IK7LRgoy1oBi
	PO74dpuqDqQNfyfDxiGOFs1njUKIpYPiS7p6h5p3Ck+wiZzt02/2oxNkl8yr/ZOAEGgYi6Cz3qB
	Le7EAx0iChTgC06JxqdOZRWJVxI9zfQ6U6F4=
X-Google-Smtp-Source: AGHT+IE74HBmDhRiWxm4vxl1WUdXHqN3oJKZlvaLuTbtgwqszDV2wvyUSVi4cy+NI5VND4dOHACaLZz9grWvhFwnaFU=
X-Received: by 2002:a05:6871:79d:b0:254:b30a:2ed0 with SMTP id
 586e51a60fabf-254b30a3048mr7454125fac.32.1718092854919; Tue, 11 Jun 2024
 01:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718038855.git.w1benny@gmail.com> <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
 <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com>
In-Reply-To: <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 11 Jun 2024 10:00:43 +0200
Message-ID: <CAKBKdXiiZdz70nWx7kqp2S5RdbRsku+qtn6z9DBk44LZOgp3Qw@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v6 3/9] xen: Refactor altp2m options into a
 structured format
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 8:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.06.2024 19:10, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > Encapsulate the altp2m options within a struct. This change is preparat=
ory
> > and sets the groundwork for introducing additional parameter in subsequ=
ent
> > commit.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> > Acked-by: Julien Grall <jgrall@amazon.com> # arm
> > Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
>
> Looks like you lost Christian's ack for ...
>
> > ---
> >  tools/libs/light/libxl_create.c     | 6 +++---
> >  tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
>
> ... the adjustment of this file?

In the cover email, Christian only acked:

> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---

P.

