Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089026B7DEB
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 17:45:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509350.784941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pblIP-00035v-CR; Mon, 13 Mar 2023 16:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509350.784941; Mon, 13 Mar 2023 16:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pblIP-00034q-6Q; Mon, 13 Mar 2023 16:45:13 +0000
Received: by outflank-mailman (input) for mailman id 509350;
 Mon, 13 Mar 2023 16:45:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMQ+=7F=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pblIN-00033w-PT
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 16:45:11 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6af76c33-c1be-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 17:45:10 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id t14so13284396ljd.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 09:45:10 -0700 (PDT)
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
X-Inumbo-ID: 6af76c33-c1be-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1678725910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c74up8jZFryQ3NcBkZTOA6otz02SIGeD4ACIn0jaPro=;
        b=QFjgiCjAtZeu+apFrOYt611qx5ZNZEOVgI3AfBFZ26pyOiFLYWXioWZ/PHmUOd902H
         EvIC23jmmlbtP0AVvYn5HmHJyH1YILsJ35T1t5ttqaIucM5Ct3HBlPVk/rcIfqYVgmjc
         wREeS5IWGl4BQLTGzN+ZWsaaHzSAsh7FsB8VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678725910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c74up8jZFryQ3NcBkZTOA6otz02SIGeD4ACIn0jaPro=;
        b=F2x7jB+uR03zZRPEg28tEl/fwLN7rdEKO5z4MJGIYnKyHvA16ywvKsdJUarMiqD+dN
         MbCk/jORJF45QwD70xk6rlVh1aEppczQFjBvtXc+0R0E7CJlGyFju4oTqrgcMxa3mr/D
         2Ys0cwuiCTYJQJo7PWvL1l4jRJqK90RvFBXFAUymcGGnIHQQTVqTR6Y9Inpu1Ng5zo9B
         TriA7N+PkxnfC6o6fi72INb2V/VneBGMEv3LiE+YtHKOfyWjniMdrqqfH9Pg5iQw4Gqt
         SRU+wbboPl4W40PBSK7KkwIE2mY/vCaIEm7YlCkW3MjFxkHKQAkmINpotCrsQTAgiYQJ
         EJRQ==
X-Gm-Message-State: AO0yUKUI+NBwjfXZCvySJc5wqes1dCiBRJ33rRSOhCfZyw3lhQVUjMAV
	Ekw9MtOaLl4MYImpg1EdBrhyiEJe5colTer7FxDucw==
X-Google-Smtp-Source: AK7set/Hy1kHmyeoopuC+dcKVmkbdBV/Ppbts10xZTThEO1qNqDBuRXfdLvD32TredI5C7SNMuM3K5wfDmXsr1DMstM=
X-Received: by 2002:a2e:b5a5:0:b0:295:b29f:a663 with SMTP id
 f5-20020a2eb5a5000000b00295b29fa663mr10859357ljn.6.1678725909769; Mon, 13 Mar
 2023 09:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230306204024.124882-1-jandryuk@gmail.com>
In-Reply-To: <20230306204024.124882-1-jandryuk@gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 13 Mar 2023 16:44:58 +0000
Message-ID: <CA+zSX=Z_3z+FOR9g6CaX9RSSTz=KKe5kTYkBnAid_Ahf-geoQw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] libxl smbios support
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Type: multipart/alternative; boundary="0000000000008701a905f6cad595"

--0000000000008701a905f6cad595
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 6, 2023 at 8:40=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com> w=
rote:

> hvm_xs_strings.h specifies xenstore entries which can be used to set or
> override smbios strings.  hvmloader has support for reading them, but
> xl/libxl support is not wired up.  This patches adds a new xl.cfg option
> and libxl support to write the xenstore strings.
>
> The xl syntax looks like:
> smbios=3D["bios_vendor=3DXen Project","system_version=3D1.0"]
>
> The Go binding generation needed extending to support Arrays inside a
> KeyedUnion, which is what the first patch does.  The generated go code
> builds, but it is otherwise untested.
>

The python & generated code looks good to me.

Golang bits:
Acked-by: George Dunlap <george.dunlap@citrix.com>

>
>

--0000000000008701a905f6cad595
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6, 2023 at 8:40=E2=80=AFP=
M Jason Andryuk &lt;<a href=3D"mailto:jandryuk@gmail.com">jandryuk@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>hvm_xs_strings.h specifies xenstore entries which can be used to set or<br=
>
override smbios strings.=C2=A0 hvmloader has support for reading them, but<=
br>
xl/libxl support is not wired up.=C2=A0 This patches adds a new xl.cfg opti=
on<br>
and libxl support to write the xenstore strings.<br>
<br>
The xl syntax looks like:<br>
smbios=3D[&quot;bios_vendor=3DXen Project&quot;,&quot;system_version=3D1.0&=
quot;]<br>
<br>
The Go binding generation needed extending to support Arrays inside a<br>
KeyedUnion, which is what the first patch does.=C2=A0 The generated go code=
<br>
builds, but it is otherwise untested.<br></blockquote><div><br></div><div>T=
he python &amp; generated code looks good to me.</div><div><br></div><div>G=
olang bits:</div><div>Acked-by: George Dunlap &lt;<a href=3D"mailto:george.=
dunlap@citrix.com">george.dunlap@citrix.com</a>&gt;</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--0000000000008701a905f6cad595--

