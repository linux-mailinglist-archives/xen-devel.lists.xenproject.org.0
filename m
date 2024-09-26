Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52089872C8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 13:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805388.1216476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmeu-0002Jy-5S; Thu, 26 Sep 2024 11:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805388.1216476; Thu, 26 Sep 2024 11:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stmeu-0002II-2h; Thu, 26 Sep 2024 11:27:44 +0000
Received: by outflank-mailman (input) for mailman id 805388;
 Thu, 26 Sep 2024 11:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stmet-0002HK-4B
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 11:27:43 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57fd21f6-7bfa-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 13:27:42 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so808318a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 04:27:42 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c87a083d6csm505710a12.79.2024.09.26.04.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 04:27:40 -0700 (PDT)
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
X-Inumbo-ID: 57fd21f6-7bfa-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727350061; x=1727954861; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QQpRpUrQ2nSnhNAX+dNYbaA/0JyjYd9TGnRtVGW4cag=;
        b=dP3Lm8VPzc579NlHwzBQclm0hA2n173MtoAl1/Ob79r84dgWyy+EPO3ZPnFLeav5GI
         Ue9ullQppoxu0LjSzXDRM+KvZdo9F51sM4SA0wZFTeRFTV+LDBRJILaqNbO0gpQCsfva
         7nwx9f8rmtswmfX0DMm/tAKiaGqAy6haDAVn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727350061; x=1727954861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQpRpUrQ2nSnhNAX+dNYbaA/0JyjYd9TGnRtVGW4cag=;
        b=qXhCuTlHozcP5QjqEjmLrpCkc0rguvOp2+he5Z2W2cfV6yVHL3Z0KP9b7hL0b+Y1tU
         nbffti0N1Leq/WYGEoMW9mYKiCimvQ1CeaOwmhkpse/8HZ5o6vUOcKpN6KkIVGfBbyzs
         f4rhm+A7diCS3XehZ1DMCmw6eYi6UAlL3vOgyCwvsI2K9QCGz2b9IithgwWFISyXP7NV
         vU5qi5K5Fs1LiFMOEJtqYeY7VqnMWHQU/1sfbe3v6rR5E/R6tNBu86Ihc6qTELEM76ve
         X2NfKB6uN7GGRlsfpNh0gVYjdDjHnYI49nR5GSCMH/ph2/XauIhEkbjG9rRJ+QEAmeiT
         5GQA==
X-Gm-Message-State: AOJu0YytuYtfRkXrcBkT1s/ZuudcsONS/RPVOHmgmljyvIBxqGE+Wu/p
	sKVZcPPHczr1qNDh8PRkyq43/zOQ33PeThmS0/3jHmDUfXj4bf+4q+u9hT6DdfISojr+m2iEcOy
	L
X-Google-Smtp-Source: AGHT+IEBBli79zRQPKy2qEEnxQwSuETa6fRF/pfAHH39kTv+6PhF7ltVZs52dmqVPmafdXuKggzPtw==
X-Received: by 2002:a05:6402:40c5:b0:5c3:d908:98f0 with SMTP id 4fb4d7f45d1cf-5c7206099d6mr4591141a12.3.1727350060710;
        Thu, 26 Sep 2024 04:27:40 -0700 (PDT)
Date: Thu, 26 Sep 2024 13:27:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/5] xen/livepatch: drop load_addr Elf section field
Message-ID: <ZvVFKyvY-lwXffAB@macbook.local>
References: <20240926101431.97444-1-roger.pau@citrix.com>
 <20240926101431.97444-2-roger.pau@citrix.com>
 <4d9da48c-00ba-476d-8915-96ed765cdfbe@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d9da48c-00ba-476d-8915-96ed765cdfbe@citrix.com>

On Thu, Sep 26, 2024 at 12:04:06PM +0100, Andrew Cooper wrote:
> On 26/09/2024 11:14 am, Roger Pau Monne wrote:
> > The Elf loading logic will initially use the `data` section field to stash a
> > pointer to the temporary loaded data (from the buffer allocated in
> > livepatch_upload(), which is later relocated and the new pointer stashed in
> > `load_addr`.
> >
> > Remove this dual field usage and use an `addr` uniformly.  Initially data will
> > point to the temporary buffer, until relocation happens, at which point the
> > pointer will be updated to the relocated address.
> >
> > This avoids leaking a dangling pointer in the `data` field once the temporary
> > buffer is freed by livepatch_upload().
> >
> > Note the `addr` field cannot retain the const attribute from the previous
> > `data`field, as there's logic that performs manipulations against the loaded
> > sections, like applying relocations or sorting the exception table.
> >
> > No functional change intended.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> > index df41dcce970a..7e6bf58f4408 100644
> > --- a/xen/common/livepatch.c
> > +++ b/xen/common/livepatch.c
> > @@ -371,18 +371,21 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
> >  
> >              ASSERT(offset[i] != UINT_MAX);
> >  
> > -            elf->sec[i].load_addr = buf + offset[i];
> > +            buf += offset[i];
> >  
> >              /* Don't copy NOBITS - such as BSS. */
> >              if ( elf->sec[i].sec->sh_type != SHT_NOBITS )
> >              {
> > -                memcpy(elf->sec[i].load_addr, elf->sec[i].data,
> > +                memcpy(buf, elf->sec[i].addr,
> >                         elf->sec[i].sec->sh_size);
> >                  dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Loaded %s at %p\n",
> > -                        elf->name, elf->sec[i].name, elf->sec[i].load_addr);
> > +                        elf->name, elf->sec[i].name, buf);
> >              }
> >              else
> > -                memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
> > +                memset(buf, 0, elf->sec[i].sec->sh_size);
> > +
> > +            /* Replace the temporary buffer with the relocated one. */
> > +            elf->sec[i].addr = buf;
> 
> I'd suggest /* Update sec[] to refer to its final location. */
> 
> Replace is technically the memcpy() above, and "relocate" means
> something else in ELF terms.

Sure, no strong opinion.

> Can fix on commit.

Thanks!

