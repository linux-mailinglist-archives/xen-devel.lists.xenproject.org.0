Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356C82DC50
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 16:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667469.1038752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOrF-0001XY-0E; Mon, 15 Jan 2024 15:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667469.1038752; Mon, 15 Jan 2024 15:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPOrE-0001US-Tr; Mon, 15 Jan 2024 15:26:36 +0000
Received: by outflank-mailman (input) for mailman id 667469;
 Mon, 15 Jan 2024 15:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0sJ=IZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rPOrD-0001UM-2j
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 15:26:35 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7638cc81-b3ba-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 16:26:32 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55965fd00aeso703531a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 07:26:32 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 k8-20020a056402048800b00558a6025397sm5326623edv.14.2024.01.15.07.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 07:26:31 -0800 (PST)
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
X-Inumbo-ID: 7638cc81-b3ba-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705332392; x=1705937192; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uyi7bdC/N/hyelN5IZYPeFrmv8yIwaedlu/QmVak+tA=;
        b=IvVBfw09tuLWNpwUdUmOgEYASZFyGwFIkjcaqukhWA/2dj/gEm3J1EtGMceSOuH/eQ
         OJs+017hCRnJIqRmVx5R+koF5oA071LBrG7X1/o481XmDpTzHn/7dw6B+ob0etzuVG7u
         rQXqyfpIPvd7BgEzEmvjJHgJpHrwyBZkwBxws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705332392; x=1705937192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyi7bdC/N/hyelN5IZYPeFrmv8yIwaedlu/QmVak+tA=;
        b=LecfSpep8p0hcpB/UNi+oOgJa/Z8Dnje8FPqdKTfG+wTYxD6kbzZbZAdnRSkEbSvKj
         idfjJ2cPpu+88wvcBgZPfZO1qpuQnjq8Hi/nnyncUvmtjqYM8PcAvSKPwxoTd2SyzuZZ
         Q7e91eKDFZLWDFHWO/u1hjRqxgmXDpOLTuo3Jlr8w+fZS5CRXEP7lPD+hoP7+3i1gRkN
         bf/pdSPS756rcQ8/MgdjMz60IkZlDLcLanMNJ48jY6BHDZ8WEP9b+QhUc4BsbTYqrzYo
         MFnDB0QQnA2F3VfvASzHwMPenOObrin7wNhP6XYqybZCTlCgsEMcbYwxfDdSuzt4Sg2u
         OoLg==
X-Gm-Message-State: AOJu0Yw9vjEuQtiVtpRKwA/HcAHQBbyUERD4jzlGHrNsViAvA3Wg6tjY
	g2uQlSPuAYr+IJ82HcaCgBUiZgWQkluB1g==
X-Google-Smtp-Source: AGHT+IFuKDvY70ngqv07BBITMIxE/f1J3x2ajnlp3wRd4nrK8JVYOj/xqy41mvCkuNqPEgiQBZgxiw==
X-Received: by 2002:aa7:cd62:0:b0:557:9018:9980 with SMTP id ca2-20020aa7cd62000000b0055790189980mr2736902edb.52.1705332391988;
        Mon, 15 Jan 2024 07:26:31 -0800 (PST)
Date: Mon, 15 Jan 2024 16:26:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] osstest: bump /boot partition to 1G
Message-ID: <ZaVOpt3H0-Pn8Zf9@macbook>
References: <20240115141837.82983-1-roger.pau@citrix.com>
 <b552ee37-c5c8-438e-98fe-ecebad296bf7@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b552ee37-c5c8-438e-98fe-ecebad296bf7@perard>

On Mon, Jan 15, 2024 at 03:08:19PM +0000, Anthony PERARD wrote:
> On Mon, Jan 15, 2024 at 03:18:37PM +0100, Roger Pau Monne wrote:
> > Increase the size of the boot partition, as arm64 initrd is already exhausting
> > all the space:
> > 
> > update-initramfs: Generating /boot/initrd.img-6.7.0+
> > gzip: stdout: No space left on device
> > 
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  Osstest.pm | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Osstest.pm b/Osstest.pm
> > index 7776ba88c6e2..a559ca4ea8b6 100644
> > --- a/Osstest.pm
> > +++ b/Osstest.pm
> > @@ -94,7 +94,7 @@ our %c = qw(
> >      HostProp_GenEtherPrefixBase 5e:36:0e:f5
> >  
> >      HostDiskESP    300
> > -    HostDiskBoot   300
> > +    HostDiskBoot  1000
> 
> Did you tried this change on the arm32 machine as well? If so:
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> (Or I guess we can find out the result of the test on commit.)

Only tested on the arm64 box, I can run a full flight, but we
might as well send it to pre-test and see what we get.

Let me know if you are OK with that.

Thanks, Roger.

