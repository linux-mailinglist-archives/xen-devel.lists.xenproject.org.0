Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B549389F06C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703016.1098790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVry-0003D1-Ml; Wed, 10 Apr 2024 11:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703016.1098790; Wed, 10 Apr 2024 11:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVry-0003AU-K7; Wed, 10 Apr 2024 11:11:58 +0000
Received: by outflank-mailman (input) for mailman id 703016;
 Wed, 10 Apr 2024 11:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruVrw-0003AO-Tw
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:11:56 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23952da6-f72b-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 13:11:54 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e6e08d328so2514597a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 04:11:54 -0700 (PDT)
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
X-Inumbo-ID: 23952da6-f72b-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712747514; x=1713352314; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bne216KvbRGOdDDZ6zCMMcUDZ+DucEkPd+/ueG20gE8=;
        b=P5URodRrQs6BoV/x89DkjnG6gjyOJ1WiLyKFCLLDu+CPxgi5UBqi/0/IuW5FQJADUS
         +LVKcFXSt8DPlkxl72ka7mtTzCTpGDHQryeQND4pjewtUqWeCW4vcpQ+mUxrA2VgN3ca
         8wpG7CHi440MhP+VQo4mu3RBrwpV9TPDGzkfkzZtJQzWe5byLMHnK0nwWpotUkbcVz99
         EPdDlwlO1Pu9iMbSTTFoEw3UqVY16IF2sGARAvbbn1xM4JgFKUD9DsbasgNbnUMfp0aW
         pQcrnnneLZZ3K3K8H2Uyl0tnTLvAD/g9QEZBSU7ILxBAplcFrQp60szjPXSbIaiLb2Kn
         QTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712747514; x=1713352314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bne216KvbRGOdDDZ6zCMMcUDZ+DucEkPd+/ueG20gE8=;
        b=IbC92L2/cpSsEsSXriY2v9r9jPoGrP0VnYUAsVUJwCScZV8SS4LWwp81h7PnzscftB
         KO4BvHczqKSs9fo5qRDyf5Bvg8ulbol6pYcay4SV6w8cqaWsyCHhpXqyMJwJHQkpPvWl
         5gySS71g7cGhPAS/A/gAGgfmdQnhbFSkJQKzNk08NQq3bg6J5W8fts+pVr2MJBegj+rH
         1mK0ej5FKieUXvD54MQW5lzTuEXbQDUoENgTOji8XbJlplJCMGTSOQ4euZdk+fhsWoOc
         GU4OwBSPmAu0p/FPFSfz8iPmo9g/lN2h+ayfzSfvSArlFhf94um6VNEYBKhkwey0xXuE
         pQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR59nJ5uXVBGIXG2Riszn+4wIZBHySZK4sBdMNDfKOx9XKHB7tTS8PcG+XS6Pb+JfseQGd5Q8vEN86C0QbaS04f4OGBbpapsPvJn8kotY=
X-Gm-Message-State: AOJu0YzpSqc2CZtuFh5Wab2XFa/UaVGXcLn4DY16k2zmEzyhpfz8sFmp
	pvQk4K286BlXmIqsN9hwHYKr6Vveyqt/Eep9Bhumbp1oGkzJJTZQL/6UleSfbn5GMtzzN8r4sBs
	A2iRgTb0hXXrN101f3RCNxFqmP88=
X-Google-Smtp-Source: AGHT+IG5dbz3lz/dWNLr/AQRR3ivAeMkFvzTbCxh3cKrC759lTqXHPW1TDEExfmNgU8/cwX5iC2IsSAeVTKWqc4BhKk=
X-Received: by 2002:a50:99da:0:b0:56e:2b1c:d013 with SMTP id
 n26-20020a5099da000000b0056e2b1cd013mr1785719edb.21.1712747514144; Wed, 10
 Apr 2024 04:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240227223501.28475-1-vikram.garhwal@amd.com>
 <20240227223501.28475-7-vikram.garhwal@amd.com> <alpine.DEB.2.22.394.2402291510080.853156@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2402291510080.853156@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Wed, 10 Apr 2024 13:11:42 +0200
Message-ID: <CAJy5ezo2f8gxZ+Lfx3aXg7Oqx-1SMBTN-sU6-oZotUu3ARA3cg@mail.gmail.com>
Subject: Re: [QEMU][PATCH v3 6/7] xen: add map and unmap callbacks for grant region
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, jgross@suse.com, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000002bac5a0615bc1b0f"

--0000000000002bac5a0615bc1b0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 12:34=E2=80=AFAM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Tue, 27 Feb 2024, Vikram Garhwal wrote:
> > From: Juergen Gross <jgross@suse.com>
> >
> > Add the callbacks for mapping/unmapping guest memory via grants to the
> > special grant memory region.
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

--0000000000002bac5a0615bc1b0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 1, 2024 at 12:34=E2=80=AFAM S=
tefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue, 27 Feb 2024, Vikram Garhwal wrote:<br>
&gt; From: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" target=3D"_=
blank">jgross@suse.com</a>&gt;<br>
&gt; <br>
&gt; Add the callbacks for mapping/unmapping guest memory via grants to the=
<br>
&gt; special grant memory region.<br>
&gt; <br>
&gt; Signed-off-by: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.com" ta=
rget=3D"_blank">jgross@suse.com</a>&gt;<br>
&gt; Signed-off-by: Vikram Garhwal &lt;<a href=3D"mailto:vikram.garhwal@amd=
.com" target=3D"_blank">vikram.garhwal@amd.com</a>&gt;<br>
<br>
Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.or=
g" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a =
href=3D"mailto:edgar.iglesias@amd.com">edgar.iglesias@amd.com</a>&gt;<br></=
div><div><br></div></div></div>

--0000000000002bac5a0615bc1b0f--

