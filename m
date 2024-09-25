Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F6985657
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803691.1214411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOKP-0005fl-HK; Wed, 25 Sep 2024 09:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803691.1214411; Wed, 25 Sep 2024 09:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stOKP-0005e7-Ec; Wed, 25 Sep 2024 09:28:57 +0000
Received: by outflank-mailman (input) for mailman id 803691;
 Wed, 25 Sep 2024 09:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBXn=QX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stOKO-0005ds-IX
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:28:56 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95ddb773-7b20-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 11:28:55 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a93a1cda54dso85718866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:28:55 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f7933sm188791766b.150.2024.09.25.02.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 02:28:54 -0700 (PDT)
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
X-Inumbo-ID: 95ddb773-7b20-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727256535; x=1727861335; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EwjaYbkis75npSwZyNenOe1cpth2+18+RyPVM97pJQA=;
        b=g3dKvYT8WaVDXoXzki+qcHmDqMURxEDRdLcPG6/MSG/Ke71bnO2xOcmmSsSURTh5oY
         qPo8CXv/MXWNMUVMgmVKPAl8jECuDMqwJCEd0gsYbVNZaN9mT2fn3asNO8Kw/qiv6nD+
         RMI5zOKzu4lJWoaBLQW5P6GacwcCDbWBYN3pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727256535; x=1727861335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwjaYbkis75npSwZyNenOe1cpth2+18+RyPVM97pJQA=;
        b=LoCuQ/mVBv1k6QHBWrEkcuFurQvkGDa6h98mWWv12ucSE7kJCeCLXKrsRSLn1sYE7P
         kRDukrcTtb8jiTyd1hjwuJTpvz3bq0tgsngKd2gu0vQVj2pWiJbwv1+CDDqBcYVwJLUZ
         uP2jMADMgmeBQ2MhfOZRZmJ/li710+VMdwP9jOog/cjoPMtZhfkLzlnF7T/A9S/SCsHS
         ohFcMZEZ8f5kYArMXMDIDdrbpL+9SepHGRIA6gx2f4ifLglPREu9WIq3HZ+XbcyKzyIi
         9atSgqGTOzjbUPirOL9XFKLMj6/Dh7V/bfxboTVfYIQDxTREs5+JVz5khrNUchrw+h3v
         MloQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUAOIt3ggj3ckftDDqCd60SIA0EO8Wk3Ry0sG5KXEYu7t9IbKZL63j+TKCjIXvq3BnqNzFPgTWnDw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrOnzWj1kXEjef3Pnh7jQvOXNIZmPtGHk2omwLjuAZap6FPO9K
	gaAZClmPoxtsN3aIxnJtcb/k772UkyRrWRmzxhjkyN/cHlMQTXLmnK/T4DWgKpsM99Eif5MrZcg
	w
X-Google-Smtp-Source: AGHT+IH6BvmOmw46QX3btfT5AfieE7xopaaLW62jffr53aqOKTzT7NI/suziQVlOO6wn4DuJ0cYAGQ==
X-Received: by 2002:a17:907:72c2:b0:a8d:5f69:c854 with SMTP id a640c23a62f3a-a93a0360490mr191553666b.24.1727256535085;
        Wed, 25 Sep 2024 02:28:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:28:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
Message-ID: <ZvPX1jFl7DLyXHk8@macbook.local>
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-6-roger.pau@citrix.com>
 <5a22e8a0-da9d-415f-85a5-42d2a372a08e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a22e8a0-da9d-415f-85a5-42d2a372a08e@suse.com>

On Wed, Sep 25, 2024 at 11:01:08AM +0200, Jan Beulich wrote:
> On 25.09.2024 10:42, Roger Pau Monne wrote:
> > alternatives is used both at boot time, and when loading livepatch payloads.
> > While for the former it makes sense to panic, it's not useful for the later, as
> > for livepatches it's possible to fail to load the livepatch if alternatives
> > cannot be resolved and continue operating normally.
> > 
> > Relax the BUGs in _apply_alternatives() to instead return an error code.  The
> > caller will figure out whether the failures are fatal and panic.
> > 
> > Print an error message to provide some user-readable information about what
> > went wrong.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Albeit ...
> 
> > @@ -394,8 +418,10 @@ static int __init cf_check nmi_apply_alternatives(
> >                                   PAGE_HYPERVISOR_RWX);
> >          flush_local(FLUSH_TLB_GLOBAL);
> >  
> > -        _apply_alternatives(__alt_instructions, __alt_instructions_end,
> > -                            alt_done);
> > +        rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
> > +                                 alt_done);
> > +        if ( rc )
> > +            panic("Unable to apply alternatives: %d\n", rc);
> 
> ... I see little value in logging rc here - the other log message will
> provide better detail anyway.

Current log messages do indeed provide better detail, but maybe we end
up adding new return error paths to _apply_alternatives() in the
future.  I see no harm in printing the error code if there's one.

> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -896,7 +896,15 @@ static int prepare_payload(struct payload *payload,
> >                  return -EINVAL;
> >              }
> >          }
> > -        apply_alternatives(start, end);
> > +
> > +        rc = apply_alternatives(start, end);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR LIVEPATCH "%s applying alternatives failed: %d\n",
> > +                   elf->name, rc);
> > +            return rc;
> > +        }
> 
> Whereas here it may indeed make sense to keep things as you have them, as the
> error code is propagated onwards, and matching it with other error messages
> coming from elsewhere may help in understanding the situation.
> 
> As to possible applying: It looks as if this was independent of the earlier 4
> patches?

Yes, I think patches 5 and 6 can be applied ahead of the preceding
livepatch fixes.

Thanks, Roger.

