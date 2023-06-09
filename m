Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01F729E7A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546141.852782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e1v-0008SM-ID; Fri, 09 Jun 2023 15:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546141.852782; Fri, 09 Jun 2023 15:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e1v-0008Qh-FQ; Fri, 09 Jun 2023 15:27:59 +0000
Received: by outflank-mailman (input) for mailman id 546141;
 Fri, 09 Jun 2023 15:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+kj=B5=gmail.com=konrad.r.wilk@srs-se1.protection.inumbo.net>)
 id 1q7e1u-0008Qb-KZ
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:27:58 +0000
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 351b3973-06da-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 17:27:56 +0200 (CEST)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-43c8e0a92f0so1310060137.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jun 2023 08:27:56 -0700 (PDT)
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
X-Inumbo-ID: 351b3973-06da-11ee-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324475; x=1688916475;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43th5QMsZDijo9cteC+0sKwCM5Cj2XjJIHl6elq6ONs=;
        b=inakbX6ZJ1f29JxL7/rD1frXcnJmCNYiqz5CCiBeQ+Hr3FlQdgfb45x6QevYyncU2F
         wxr2n6Vte4QtTmSt47C+kfqgTogt8es2JNNlg9JIiU4x011G4Zblbj8Z7yxYhHFsn9yg
         W+8jsL4zr7Dq5jwMPdEZCRRBLc9PqWZWoX0+TY2sjeDU5iwtLzFn8NZlQ9wax0inrO1F
         L+dKU2yVUVMjLUQ9FDwCdF3ykR3OFdBT+sv1FN0y3OTF1alR5nid/2jeKL8jHXeM95Wv
         CvcgzmaFHho3m5X1wMe0ysVJPPy3BDOBKIgdNBQQaYO95M7MqXfW02tx+xiPlJ1GXlMl
         RHxA==
X-Gm-Message-State: AC+VfDykX64H7rJJmY0UkXd1d996ivSeT0+MOrL8q5oSZ2TfDSVS3fya
	DyCrIb+feENMM3BXE2UxKgdSKjniOu6Alltq3UU=
X-Google-Smtp-Source: ACHHUZ4g9D8crZxpTy/9o0HunWZ51BMvKaGJ4xdKuc4m/J0crMvKn5jdtfcjP7iClc3XLG9LiZVR16EQo25cX6tN1Pg=
X-Received: by 2002:a05:6102:330b:b0:439:6c06:606e with SMTP id
 v11-20020a056102330b00b004396c06606emr2407797vsc.0.1686324475347; Fri, 09 Jun
 2023 08:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230605102840.1521549-1-ross.lagerwall@citrix.com> <2e28fcdb-f0ff-dca4-3dc4-34b11cc7e469@intel.com>
In-Reply-To: <2e28fcdb-f0ff-dca4-3dc4-34b11cc7e469@intel.com>
Reply-To: konrad@darnok.org
From: Konrad Rzeszutek Wilk <konrad@darnok.org>
Date: Fri, 9 Jun 2023 11:27:43 -0400
Message-ID: <CAPbh3rtGXiQbzETmK3NdUt-R8D67+V907Rd+nX-OjQ6DNSfyWA@mail.gmail.com>
Subject: Re: [PATCH v3] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, LKML <linux-kernel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Peter Jones <pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000544d3b05fdb40377"

--000000000000544d3b05fdb40377
Content-Type: text/plain; charset="UTF-8"

Usually I put it in my tree (ibft) but since it is so simple and the user
is Xen it would make more sense to do it via the Xen tree (Juergen).

Thx

On Fri, Jun 9, 2023, 11:16 AM Dave Hansen <dave.hansen@intel.com> wrote:

> On 6/5/23 03:28, Ross Lagerwall wrote:
> > The result of these changes is that it is possible to boot a diskless
> > Xen + Dom0 running off an iSCSI disk whereas previously it would fail to
> > find the iBFT and consequently, the iSCSI root disk.
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86
>
> The work in this patch seems pretty evenly split between x86 and iSCSI.
> Any preferences on who picks it up?
>

--000000000000544d3b05fdb40377
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Usually I put it in my tree (ibft) but since it is s=
o simple and the user is Xen it would make more sense to do it via the Xen =
tree (Juergen).<div dir=3D"auto"><br></div>Thx<br><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 9, 2023, 11:16 AM D=
ave Hansen &lt;<a href=3D"mailto:dave.hansen@intel.com">dave.hansen@intel.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 6/5/23 03:28, =
Ross Lagerwall wrote:<br>
&gt; The result of these changes is that it is possible to boot a diskless<=
br>
&gt; Xen + Dom0 running off an iSCSI disk whereas previously it would fail =
to<br>
&gt; find the iBFT and consequently, the iSCSI root disk.<br>
<br>
Acked-by: Dave Hansen &lt;<a href=3D"mailto:dave.hansen@linux.intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">dave.hansen@linux.intel.com</a>&gt; # fo=
r x86<br>
<br>
The work in this patch seems pretty evenly split between x86 and iSCSI.<br>
Any preferences on who picks it up?<br>
</blockquote></div></div></div>

--000000000000544d3b05fdb40377--

