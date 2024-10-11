Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F055999F36
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816746.1230855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBEz-0006vF-3B; Fri, 11 Oct 2024 08:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816746.1230855; Fri, 11 Oct 2024 08:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBEy-0006tB-VO; Fri, 11 Oct 2024 08:43:16 +0000
Received: by outflank-mailman (input) for mailman id 816746;
 Fri, 11 Oct 2024 08:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtJ7=RH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1szBEy-0006cc-16
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:43:16 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db4201da-87ac-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 10:43:15 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fad6de2590so26461841fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:43:15 -0700 (PDT)
Received: from localhost ([213.195.123.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80dc5easm191098466b.170.2024.10.11.01.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 01:43:14 -0700 (PDT)
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
X-Inumbo-ID: db4201da-87ac-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728636195; x=1729240995; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v88G0uVy/4aSqLpyNiUVUQo6s+Ndk4/lA//x8fZgSdc=;
        b=iGdjvDdLvhmp1cUI8RQPI39++yH3xpUeEJIKQQhQtIFZpzrf54t9AdsxXjae+NhZ4e
         0BG4PwZt7bBX/yIQbtxSHItdH6EAuVCbd9XpH0UF4wOWdIe96zXv1WfXpbDrW153CEhe
         rOtWxSn2Sua0FAK/x5A/Snup8kOSjolrR89JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636195; x=1729240995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v88G0uVy/4aSqLpyNiUVUQo6s+Ndk4/lA//x8fZgSdc=;
        b=g/Q/fbt+Ck3pDXgJxaWi3CxpN/FsCmHit5XZ699iksBmFBNx6Tj0JlKIM6QTXVo/E4
         9FzsKyvFGHEX0aMx3eRAaSR55MfVW9oi7IbamvUA+8vArZigTw1PiCyEC+t4qJ8A2Kk8
         K2sQOWmNzc0mToyyBXd8NJPffBsu9MBLnXww7v+orltWSR0iPiyjfBqfsGpdfItQ/SoI
         8yJ1SoA2PllsZ+FTahuKZchs1rcTIRk/BwsXCmiD/ZcE2h152OQRGfIkdk5OPs7VU+cv
         K68J97HUDuxD4aExnvIII9PX95NG9cI2Dn5TgOGViuasIJBTIQ3CYAcaR1yISqNjMjRR
         XhOg==
X-Forwarded-Encrypted: i=1; AJvYcCWpdqXeUtqlzRzxQYB9Uy+MA7K5dXw4REQ/GaxbPo5hZMqteuSLyYfcsFDLsN5LuBBJgZswwt0dJDw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMXnzd/e45I/D3VZAPY4gIsy8NFzysAoPSd4T+3bg5MjnPZP9o
	OJ0slE52neWuTcY9gcywjjqjkfvJLyDVQkq5A1MJM/To/KGL4kkirSed/KGMoKcZUsNkX19u9+T
	f
X-Google-Smtp-Source: AGHT+IEkpcRIFoZNe98ChxVzROE/IGOxRy9PE7aDKFATGfzVnRAWlBozai88sXCwgrI55lWeBD38rQ==
X-Received: by 2002:a05:651c:2210:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2fb327405c9mr11787581fa.18.1728636194859;
        Fri, 11 Oct 2024 01:43:14 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:43:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com
Subject: Re: [XEN PATCH v2 3/4] xen/vpci: address violations of MISRA C Rule
 16.3
Message-ID: <ZwjlIdimMmUUqi0e@macbook.local>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
 <a91c0223b827593f5c1a7ca7ece786266e5b8f52.1728308312.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2410071442570.3512606@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2410071442570.3512606@ubuntu-linux-20-04-desktop>

On Mon, Oct 07, 2024 at 02:44:22PM -0700, Stefano Stabellini wrote:
> On Mon, 7 Oct 2024, Federico Serafini wrote:
> > Address violations of MISRA C:2012 Rule 16.3:
> > "An unconditional `break' statement shall terminate every
> > switch-clause".
> > 
> > No functional change.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> > ---
> > Changes from v2:
> > - simply break without returning X86EMUL_UNHANDLEABLE.
> > 
> > As pointed out by Jan, these functions only return X86EMUL_OKAY but:
> > https://lists.xenproject.org/archives/html/xen-devel/2024-09/msg00727.html
> > 
> > Do you have any comments?

I think it's a result of how the series that implemented
adjacent_{read,write}() evolved.  Originally it was supposed to return
X86EMUL_UNHANDLEABLE for the earlier error cases at the top of the
function.

Returning an error code however is not helpful in this context, as the
accesses belong to the IO region of the device, and hence must be
terminated here.  There's no reason to return X86EMUL_UNHANDLEABLE or
similar, because no other handler should be able to complete them
anyway (or else we have a bigger issue).

I would be happy if someone did a patch to convert
adjacent_{read,write}() to instead return void.

> > ---
> >  xen/drivers/vpci/msix.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> > index fbe710ab92..5bb4444ce2 100644
> > --- a/xen/drivers/vpci/msix.c
> > +++ b/xen/drivers/vpci/msix.c
> > @@ -364,6 +364,7 @@ static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
> >  
> >      default:
> >          ASSERT_UNREACHABLE();
> > +        break;
> >      }
> >      spin_unlock(&vpci->lock);
> >  
> > @@ -512,6 +513,7 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
> >  
> >      default:
> >          ASSERT_UNREACHABLE();
> > +        break;
> >      }
> >      spin_unlock(&vpci->lock);
> 
> I think in both cases it should be:
> 
> spin_unlock(&vpci->lock);
> return X86EMUL_UNHANDLEABLE;
> 
> In general, it seems to be that we want to return X86EMUL_UNHANDLEABLE
> in these situations and either we returning it from the default label,
> or we need to do rc = X86EMUL_UNHANDLEABLE; and later on return rc;

As said above, the accesses should be terminated here, hence returning
X86EMUL_UNHANDLEABLE doesn't seem appropriate.  The only way to signal
errors for such kind of IO access is to return ~0 in the read case, or
ignore the access in the write case.

We could consider raising a different kind of error (not
X86EMUL_UNHANDLEABLE) when an otherwise unreachable state is reached,
but I'm struggling as to what kind of action would the caller need to
take in that case, kill the guest?

Thanks, Roger.

