Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC9881166
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 12:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695879.1086128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmuaW-00020I-3A; Wed, 20 Mar 2024 11:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695879.1086128; Wed, 20 Mar 2024 11:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmuaW-0001xQ-05; Wed, 20 Mar 2024 11:58:32 +0000
Received: by outflank-mailman (input) for mailman id 695879;
 Wed, 20 Mar 2024 11:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmuaU-0001x2-HO
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 11:58:30 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 298f4ffd-e6b1-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 12:58:28 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5a4859178f1so2808460eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 04:58:28 -0700 (PDT)
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
X-Inumbo-ID: 298f4ffd-e6b1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710935907; x=1711540707; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwDg9N7WXY+pLHX5aSrXLQ6rAFFbiypegGbJlQ4JH3M=;
        b=QfbNOeb3m63zXXHxr5h/vObWeAGEPTrftgB1W6y3U6zTQTY7Ql/jhuuttFDEEEw0P9
         7hrx2aMcs0OVFHJ+bxsT/wGhmKcFwNyxn9sn9u+AuF4S2B0VCEQFM70JC8sRNllp2fu4
         sgAN6EUvbgGmLER2L34qCTbU1OaUDdOx423TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710935907; x=1711540707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwDg9N7WXY+pLHX5aSrXLQ6rAFFbiypegGbJlQ4JH3M=;
        b=CrXflFUU92zlZcrVAsXDA2xlHdqaZ3BpwBnHyxXnDR5Jk3dPyOS2jhnDMJXghRzATv
         iHnS372DUQEbC89hBbIQ2zOlPDEKkwKgHMMOn1DwZ45ib/zmO0d69lJUOiQCGwj8tGyV
         9toR7hc2w8Ehe6D19PMqoXh4LSLVJXfI4ld2aQeWcbr7YYKLvbCxlFvwAPb/iELOJrqN
         1H2swtBVTyF26eiJhz29Ey7S0Dhu1WTfGni9Wu96HGYOMoyaKb0uLwvQ/wjVS8SyAGXh
         26yKaFOObSay88SEoTipm3So4C66CQRJQGJOWplbqBLVFdM13UdImy4/+xanCMM4szI1
         rp7A==
X-Gm-Message-State: AOJu0Ywkov8j3wotGpNNA/o8sSzTjPtln8x9YqCWvDKp8KaloRg74fKC
	MBh9Cf3wP3s+GaU8eW/vpnhVV7BKJHnFXMeKJiXuKZZdo5F4uuzPbRCr3SGtK5Q3aMgfzjktijs
	nRF9hL5dNTCuSLyOJS6Wx2FdAVpd4xwfAzESdFg==
X-Google-Smtp-Source: AGHT+IE1OCbnyRjjqUF3PHySVpNyX9surZMHdnkOu/WzT05yQbZU3C7ioQT5njm1Vna8j3BLSU0ES6pi1UpF28KK2Ws=
X-Received: by 2002:a05:6871:588b:b0:21e:e6d1:616c with SMTP id
 ok11-20020a056871588b00b0021ee6d1616cmr19993024oac.31.1710935907129; Wed, 20
 Mar 2024 04:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-2-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-2-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 11:58:16 +0000
Message-ID: <CA+zSX=Y2gJ1_uWdeC6Gyv0VX4WytgVdqhbaGfmda3pLKZYs8pg@mail.gmail.com>
Subject: Re: [PATCH 1/7] xen/trace: Introduce new API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> trace() and trace_time(), in function form for struct arguments, and macr=
o
> form for simple uint32_t list arguments.
>
> This will be used to clean up the mess of macros which exists throughout =
the
> codebase, as well as eventually dropping __trace_var().
>
> There is intentionally no macro to split a 64-bit parameter in the new AP=
I,
> for MISRA reasons.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for doing this, it all looks good to me.

I'll note that last time this was posted, there were some questions.
One was regarding underscores in the macro parameters.  I don't care
about this enough to stop it going in.

The other question was about the use of ##__VA_ARGS__. I don't
actually understand what that comment was trying to say, as a quick
Google search it appears that 1) this will do what I think it should
do, and 2) it works both in gcc and clang.

We should give Jan a chance to explain his second point more clearly
before checking it in; but:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

