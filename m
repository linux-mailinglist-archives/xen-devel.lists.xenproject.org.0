Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F7869C30
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 17:32:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686263.1068083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf0NQ-0004qX-B3; Tue, 27 Feb 2024 16:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686263.1068083; Tue, 27 Feb 2024 16:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf0NQ-0004nm-8V; Tue, 27 Feb 2024 16:32:20 +0000
Received: by outflank-mailman (input) for mailman id 686263;
 Tue, 27 Feb 2024 16:32:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rf0NP-0004nc-Ah
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 16:32:19 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3fae9e1-d58d-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 17:32:15 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5131316693cso838071e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 08:32:15 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 d20-20020a05620a159400b0078790117ebasm3740724qkk.82.2024.02.27.08.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:32:14 -0800 (PST)
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
X-Inumbo-ID: c3fae9e1-d58d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709051534; x=1709656334; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q4HCKVjMj5LF9ZFLEW+4sb388RZ6ORvNancXxdYsAyY=;
        b=pKgBL7RClljJuO+YzIjPFChffvC9vf8lboPith7++pI3JMhoRPMy3nM3hf9TWbh5NR
         /6BhT5GFcWR6IjB7PnQOuEM0sg46yEFYXNje5IU3T/w/asQy7bCnle1nkRVkG/GQdPPj
         VDfgfVrjCiSlvOzuFpAWjI4j+JhQ9y4skmNGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709051534; x=1709656334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4HCKVjMj5LF9ZFLEW+4sb388RZ6ORvNancXxdYsAyY=;
        b=KqCCPaKf11l6ZLIsMSEcwbQMwjphbQNV9Tp5Ii/elD3fSh2yzOMGscKgycCS8yHDHL
         3mb63GE7MWmdGiyoETvUhB1zYvbZdlYF3qeRL75M+RRd6sGrg9jAEAZVt6D8b232PXGz
         fmnOHSyBABeYJI1sYaqs5pBkt6J/h9AkSXYnMr0Q/6k034miXpFL0QJPgWF6UA/rU77Q
         KRWuBE6aNx6aMG2v99rm7QZKM9ERW7X+kghE2KdWI15TYV5+beRoTZRo7HjGSjH649O6
         paOVE4kFcuGr38XFVQE4JbvNS9/ryfhLhF4ty76TKakMRa6TVU4Z/xLUy2CjrttB4+tk
         Oq+A==
X-Gm-Message-State: AOJu0Yy6h4CXp5p0VDhyBEqumWw71BA4a6JP3xn37DTushAqYVftXjh8
	CU0xRBI4UuScI00xWBJ1lRkSUZOGaEsG+npq1ng2R6IVK1VXCapfLfvhsyxTWVU=
X-Google-Smtp-Source: AGHT+IHU6GJ9wAI/IUbYSy+65zScx4s84XXxrlPCHMgkAGebFG2ZsJlLWWCd1825NccN1uB5ObG05Q==
X-Received: by 2002:ac2:488b:0:b0:513:14dc:97bf with SMTP id x11-20020ac2488b000000b0051314dc97bfmr689767lfc.23.1709051534506;
        Tue, 27 Feb 2024 08:32:14 -0800 (PST)
Date: Tue, 27 Feb 2024 17:32:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] livepatch-build-tools: allow patch file name sizes up to
 128 characters
Message-ID: <Zd4OjBv5jEt0Uzha@macbook>
References: <20240131165816.58762-1-roger.pau@citrix.com>
 <CAG7k0EqfMecUGQJSqMLxmR7vOjushAYQuG-r+3eAhs4a-UhuTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0EqfMecUGQJSqMLxmR7vOjushAYQuG-r+3eAhs4a-UhuTw@mail.gmail.com>

On Tue, Feb 27, 2024 at 01:32:05PM +0000, Ross Lagerwall wrote:
> On Wed, Jan 31, 2024 at 4:58 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
> >
> > XenServer uses quite long Xen version names, and encode such in the livepatch
> > filename, and it's currently running out of space in the file name.
> >
> > Bump max filename size to 128, so it also matches the patch name length in the
> > hypervisor interface.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  livepatch-build | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/livepatch-build b/livepatch-build
> > index cdb852cc7fea..78dd2d801048 100755
> > --- a/livepatch-build
> > +++ b/livepatch-build
> > @@ -72,8 +72,8 @@ function make_patch_name()
> >      fi
> >
> >      # Only allow alphanumerics and '_' and '-' in the patch name.  Everything
> > -    # else is replaced with '-'.  Truncate to 48 chars.
> > -    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c 1-48
> > +    # else is replaced with '-'.  Truncate to 128 chars.
> > +    echo ${PATCHNAME//[^a-zA-Z0-9_-]/-} |cut -c -128
> >  }
> 
> I think it should be XEN_LIVEPATCH_NAME_SIZE - 1 to match the hypervisor
> since AFAICT the hypervisor expects the last character to be NUL.
> 
> In get_name(), it checks:
> 
>     if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
>         return -EINVAL;
> 
> ... and:
> 
>     if ( n[name->size - 1] )
>         return -EINVAL;
> 
> Do you agree with that?

Oh, I didn't catch that one.  xen-livepatch should also be adjusted
then, as get_name() there does:

static int get_name(int argc, char *argv[], char *name)
{
    ssize_t len = strlen(argv[0]);
    if ( len > XEN_LIVEPATCH_NAME_SIZE )

Which needs to be adjusted to len >= instead, and the error printed
should also mention that ID must be no more than
XEN_LIVEPATCH_NAME_SIZE - 1.

Thanks, Roger.

