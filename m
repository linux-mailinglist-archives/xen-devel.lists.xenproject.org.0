Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9A97EC0C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 15:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802057.1212169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssipp-0000to-0c; Mon, 23 Sep 2024 13:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802057.1212169; Mon, 23 Sep 2024 13:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssipo-0000r9-UI; Mon, 23 Sep 2024 13:10:36 +0000
Received: by outflank-mailman (input) for mailman id 802057;
 Mon, 23 Sep 2024 13:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=darJ=QV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ssipn-0000r3-E8
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 13:10:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 372b7a94-79ad-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 15:10:33 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8b155b5e9eso642574266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 06:10:33 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9060f39a8fsm1228678466b.0.2024.09.23.06.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 06:10:32 -0700 (PDT)
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
X-Inumbo-ID: 372b7a94-79ad-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727097033; x=1727701833; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IqQjdA9YhuU04xyH5vhsXU7bZJPE+/lAQAr5zraJajw=;
        b=JeNvGipLj5U79RrOMtRrRZOXxcjq9RaXvc7rynqfOaWMBWZcMHglwXTyZwUvOYRVR6
         JqiCBedYyNMBl9OPHYpdo9g8TO7O4uXhqYH7imMlpoIhPXUr/QTRHOkbcATyAoe8Ketr
         hQVceRPLHoi8h7C/ng95K6qG86Myj+hkc2rkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097033; x=1727701833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqQjdA9YhuU04xyH5vhsXU7bZJPE+/lAQAr5zraJajw=;
        b=kF56YpsOaPqUtMzjdD/LTJzxzupOEEVfw7HXFHvM127wrcT8DNdQlTgpOpBIsaIpn/
         CZ62hG+U1yETBAL893lXnTtddXK02mAKJc7A9V6ywZNTfnLqBEmtSUNrLIhcHF+5Ifmv
         oq0vXBshTbe/oMF+9zEjqeIqSsNZTTRELd1z298GtagJOXfpJBLgo4Xp6FitWFsDmzQH
         C/qF+BafR5OSZx1QRJQuE8IDDW1n+ojg1BNYvPSfpmRT81H/pdWRqbNtdFrpk8yuzgps
         lZN4EnLhSwBUt91cDW+zgDwoBtvkLw+I7TOSShmlDE6UVQHKFMbss9xAtDfHZBYCZ8Ym
         aavg==
X-Forwarded-Encrypted: i=1; AJvYcCVlLkFg8j2yB5a9mVlQ6jMGer5XcQ/GHv0zuWb97xOmb7g2PbOeEcBgypJtZzmUdtuhQFGm0Kg/00w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNT9OFLxKM3xhU8vTSlFf1cQ8fPuZ8AQPcysU0o0dyZxHEqMBA
	1BKGp234QyTLmO0djFuyF9Kj0DMNv77qRBtQDH3ve9ZV+xW6TWh1+TU42QqQQqw=
X-Google-Smtp-Source: AGHT+IFfyd8dGVWT4jnDzJCu3cH803NgUA58fWi0oRslC/FXz7DWDcyRpJo0hCvuZWDS6b6SZ8BsCw==
X-Received: by 2002:a17:907:2d93:b0:a8a:809b:14ed with SMTP id a640c23a62f3a-a90d50ef6aemr1257767266b.44.1727097032887;
        Mon, 23 Sep 2024 06:10:32 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:10:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] xen/livepatch: simplify and unify logic in
 prepare_payload()
Message-ID: <ZvFoxyWcd_7TCHdI@macbook.local>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-2-roger.pau@citrix.com>
 <83886b54-8687-4b4b-b356-7093758498d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83886b54-8687-4b4b-b356-7093758498d9@suse.com>

On Mon, Sep 23, 2024 at 01:01:57PM +0200, Jan Beulich wrote:
> On 20.09.2024 11:36, Roger Pau Monne wrote:
> > The following sections: .note.gnu.build-id, .livepatch.xen_depends and
> > .livepatch.depends are mandatory and ensured to be present by
> > check_special_sections() before prepare_payload() is called.
> > 
> > Simplify the logic in prepare_payload() by introducing a generic function to
> > parse the sections that contain a buildid.  Note the function assumes the
> > buildid related section to always be present.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/common/livepatch.c | 106 ++++++++++++++++++-----------------------
> >  1 file changed, 46 insertions(+), 60 deletions(-)
> > 
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index d93a556bcda2..cea47ffe4c84 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -647,15 +647,37 @@ static inline int livepatch_check_expectations(const struct payload *payload)
> >      nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
> >  } while (0)
> >  
> > +static int fetch_buildid(const struct livepatch_elf_sec *sec,
> > +                         struct livepatch_build_id *id)
> > +{
> > +    const Elf_Note *n = sec->load_addr;
> > +    int rc;
> > +
> > +    ASSERT(sec);
> > +
> > +    if ( sec->sec->sh_size <= sizeof(*n) )
> > +        return -EINVAL;
> 
> Oh, after my reply to Andrew's reply, now looking at the actual change -
> is it perhaps ASSERT(sec->sec) that was meant?

The original check before moving the code was against 'sec', not
'sec->sec'.  That's what I intending to retain with the assert.

I can do the `n = sec->load_addr` assign after the assert if that's
better analysis wise.

Thanks, Roger.

