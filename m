Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD94B9926B1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 10:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811700.1224378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sximN-0005sW-J9; Mon, 07 Oct 2024 08:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811700.1224378; Mon, 07 Oct 2024 08:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sximN-0005px-GU; Mon, 07 Oct 2024 08:07:43 +0000
Received: by outflank-mailman (input) for mailman id 811700;
 Mon, 07 Oct 2024 08:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sximL-0005pr-O3
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 08:07:41 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 383e04cd-8483-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 10:07:39 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-287df15714cso702682fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 01:07:39 -0700 (PDT)
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
X-Inumbo-ID: 383e04cd-8483-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728288458; x=1728893258; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhNHF8fDbr8Ibhn5PQeXr6B5abMvdFG2SRJwcyUmzcc=;
        b=lPTm/EflEC79a+DZSOoRpjmMOHbmPN25oouNCQLzSB89MaJqoAoDpI54TarK89apIm
         ZvSKEIGz823N23H2nur0rrPsRZVh0+QBQ8NUgG01gZcYpjthAOwS9bpiIjCd18SNZP4H
         5/FXiRg1ZxX8t/p5bE+8UlC8tnO5BLz5njhQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728288458; x=1728893258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhNHF8fDbr8Ibhn5PQeXr6B5abMvdFG2SRJwcyUmzcc=;
        b=cJSP1JxYjfVt7BARjKMnxRgrsCbyEme8MLSp5/kZsRglWykofWXNaTfgw6nn57rj4C
         umCtlP3W1PRr/STRtex8LIDc9ysLP7s3FMVwjxj2Xg+ePUCtI429BaF+5XiHBFI5yr75
         r9G2fYJbFYJ4RTPRSGj2ydUdHWmKBB9tTAmH2rchjlO7gzvbVyydhTDRsdQdhKkIf+XJ
         qorBkS+5LDW+kTP0w1WQmKgoxDWp6Dk6IQ0kYdcOCTgN6q+tzPKQyMLYW9bG0xf/2pi5
         5wMknGQnyqCGsyhXu9VYbFA1VKIAz/UcRWVm78odtEK7KwHZVDCGPcUCQgymCr4B239s
         jNmA==
X-Forwarded-Encrypted: i=1; AJvYcCUNWBX0f5EuZW6A7NIMqrCZvljsOY4eIi2xxrsE3FC9YyVtiQbwhVcpqiIGmq2To+Ly5P6XzH3LXZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv+9MhZ6qz+T4RPa7W6+DIUl0uavlM5b8WcmWfZLZynYVN5MWZ
	zCGjkIW7tXW099PaW9dCRiy3boHTwJ+XHuMAqTo5yQCcW7WjC5QVW4H44vNbbDXGXGjyw3FSaQP
	CPggncNdodtUAqTz5ZHAt3fv+8WcW+W/W+8nZxQ==
X-Google-Smtp-Source: AGHT+IHYYM54uw1usKKRX4JCaqSM8Y0QXpAIwAgOzxcgUL3CSflRfcZ5q84KpaXb13h5nRi6TlQKHqfxIpVvdfpbXyk=
X-Received: by 2002:a05:6870:d182:b0:277:f722:45e1 with SMTP id
 586e51a60fabf-287c1da9fc5mr6808931fac.17.1728288458468; Mon, 07 Oct 2024
 01:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com> <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
 <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com>
In-Reply-To: <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 7 Oct 2024 09:07:26 +0100
Message-ID: <CACHz=Zg3R4Ybr0GwhSaYsOo72mWtapnpQ7w-Wb=wjrf-or1J_g@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 8:03=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.10.2024 15:21, Andrew Cooper wrote:
> > On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> >> --- a/xen/arch/x86/boot/Makefile
> >> +++ b/xen/arch/x86/boot/Makefile
> >> @@ -1,6 +1,6 @@
> >> -obj-bin-y +=3D head.o cbundle.o
> >> +obj-bin-y +=3D head.o cbundle.o reloc-trampoline.x64.o
> >
> > Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch want=
s
> > introducing here.
> >
> > That said, x64 is the one name for 64bit that we reliably don't use.
> > Also...
> >
> >> -head-bin-objs :=3D cmdline.o reloc.o
> >> +head-bin-objs :=3D cmdline.o reloc.o reloc-trampoline.o
> >
> > ... head-bin-objs isn't really correct now seeing as they're not
> > binaries in head.S.  Also ...
> >
> >>  nocov-y   +=3D $(head-bin-objs)
> >>  noubsan-y +=3D $(head-bin-objs)
> >
> > The no$(foo)'s needs extending to the 64bit objects too.  They're also
> > used early enough to explode.
> >
> > In Xen, 64bit objects are the norm, and it's 32bit ones which are the
> > exception, so how about we special case *.i386.o instead.  Then
> >
> > obj32 :=3D cmdline.i386.o
> > obj32 +=3D reloc.i386.o
> > obj32 +=3D reloc-trampoline.i386.o
>
> I'd like to advocate for ix86 or i686. i386 gives a wrong impression imo.
>
> Jan

Why not simply x86 ? We already use it.

Frediano

