Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C059856D0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803768.1214565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOpP-0008FH-3z; Wed, 25 Sep 2024 10:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803768.1214565; Wed, 25 Sep 2024 10:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOpP-0008Ch-14; Wed, 25 Sep 2024 10:00:59 +0000
Received: by outflank-mailman (input) for mailman id 803768;
 Wed, 25 Sep 2024 10:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stOpO-0008Br-2B
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:00:58 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eca14e6-7b25-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 12:00:56 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so781414266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:00:56 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f340a0sm191479066b.38.2024.09.25.03.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 03:00:55 -0700 (PDT)
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
X-Inumbo-ID: 0eca14e6-7b25-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727258456; x=1727863256; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BaKpRUGYn+xEMnR4JcxJrQXgdr7OMPd1FbjNIZyLFXQ=;
        b=b3ZNH01XDmE2m1/FIHpbcO/J2z4RnxGcQ48D3zQmx8q7AXmxqIaHLro5ljMmIRWVGT
         EeV6R/rCj5HooUMDov+ao5yrgtP+swSIvEh3t3LbqVoww12UcNmGIC7j48P4sPh/odYy
         CTcOmYOz8dS7VyzhEpIzyH6USU91zluhzEOLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258456; x=1727863256;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaKpRUGYn+xEMnR4JcxJrQXgdr7OMPd1FbjNIZyLFXQ=;
        b=qsHeeO0m2KS3KKxYTL5jWULbVWQE1uaJfKIxuNDcKYjviUJgs3n10yzIKuvQaxlbso
         m/PD3p7Z+l5fhr51F63NQVYPv+jtX4LLio1HQ8YTwSaR2dHRZM/Q65ANueJtvsTalG0J
         OC1iR/EpnpbcjNrBL3ZQMVZIg81zAWEaO+P0M29oqo+RQQFIlcB6zbBR4YRpmAutDeMC
         D8R3DhewLxcojuyaLJbeKXRqNI/eigeqdVZC+ymrZ5H2IFItQ/4+URTDYsjXeF4THNkZ
         WpAbHnln7vyYnyNTzjACswQfcxdE5Alhp+YPr8vrnncbH9oGNyjqQPMiMAL2CD1NsYtE
         cPPw==
X-Gm-Message-State: AOJu0YzBKNDpRM5zm59N78dqcdhNe8tknNiNUkt+xvosff8I91Jbgcd1
	CswRCpLU4IgQkxhEFpl1XhwEYFf/IlZFAszxWqUbcjiL4XPi3NCoCtwD/phsKDc=
X-Google-Smtp-Source: AGHT+IF2FKo1Kw9R/dRL5ezWbU4UHndQ90mNfcw7xvKHBMuNy92orrAsVdVUCWzCZV15pq0H2IQnXg==
X-Received: by 2002:a17:907:7f86:b0:a8d:495b:c52d with SMTP id a640c23a62f3a-a93a03f49e4mr163884066b.33.1727258455927;
        Wed, 25 Sep 2024 03:00:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 12:00:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/6] xen/livepatch: zero pointer to temporary load
 buffer
Message-ID: <ZvPfVokJHOpzEZXc@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-3-roger.pau@citrix.com>
 <c357ec68-bfd2-427e-8f33-5826a2252b0e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c357ec68-bfd2-427e-8f33-5826a2252b0e@citrix.com>

On Wed, Sep 25, 2024 at 10:33:39AM +0100, Andrew Cooper wrote:
> On 25/09/2024 9:42 am, Roger Pau Monne wrote:
> > The livepatch_elf_sec data field points to the temporary load buffer, it's the
> > load_addr field that points to the stable loaded section data.  Zero the data
> > field once load_addr is set, as it would otherwise become a dangling pointer
> > once the load buffer is freed.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - New in this version.
> > ---
> >  xen/common/livepatch.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index df41dcce970a..87b3db03e26d 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -383,6 +383,9 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
> >              }
> >              else
> >                  memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
> > +
> > +            /* Avoid leaking pointers to temporary load buffers. */
> > +            elf->sec[i].data = NULL;
> >          }
> >      }
> >  
> 
> Where is the data allocated and freed?
> 
> I don't see it being freed in this loop, so how is freed subsequently?

It's allocated and freed by livepatch_upload(), it's the raw_data
buffer that's allocated in the context of that function.

Thanks, Roger.

