Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59B8BD060
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 16:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717686.1120139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3zOg-0008Mt-9V; Mon, 06 May 2024 14:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717686.1120139; Mon, 06 May 2024 14:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3zOg-0008Ky-6r; Mon, 06 May 2024 14:32:54 +0000
Received: by outflank-mailman (input) for mailman id 717686;
 Mon, 06 May 2024 14:32:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3zOe-0008Ks-Ix
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 14:32:52 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83f16cc7-0bb5-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 16:32:50 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e9so16277395e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 07:32:50 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 fl24-20020a05600c0b9800b00418916f5848sm16396865wmb.43.2024.05.06.07.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 07:32:49 -0700 (PDT)
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
X-Inumbo-ID: 83f16cc7-0bb5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715005970; x=1715610770; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/AUScGi7SIqtNwoGhkYK1uoA/9TpdAqlDm5MCvmqSZ8=;
        b=isxPu6cj21mRZ7YFA9woz+2hFGPcCMzqlZTioVxZhNnBGZ1JN/az19VrLz5dM2ViEI
         1Za/mIYJTujAi+XIK/h3MNhnj2mX3aRGajPMua3Ff+3auk9o4xnZn/KoskGxQv61UTfX
         K678BLEKzig0tSJ1KIUtevvgHvjuH69nDAe1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715005970; x=1715610770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AUScGi7SIqtNwoGhkYK1uoA/9TpdAqlDm5MCvmqSZ8=;
        b=Y74xQTvn7G0Q2vX1El95Q5cSD1JOog37NTSYjFPfa4w9mDsJnkYh1VBuTUaS0HxrgQ
         nn/KwV30LFU4lff/abNkII1BdllJKse9Et4LfHOOQ0q/c2/LoCoxL8ZT6R6RialuvCmp
         eO1fhR8sttyfcmMVL+sipNKXnFWwcm+WIED2KMykaRXvb8qtySElaEpWgA1Qe61eZCiG
         +X0h7x9Jzmuq0yVk7FbOgzAO951TRU9Zk1cU/xdIvDTOCdm29gj75Yv31+HJ19P3IBQp
         8Ex2Tb4etlbcHNwAPt8VLzz5pmQnC6emPYJ8gkS6sCRfd1+RkeoEblLU+kBVKHVSK70+
         gkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlbsLyANmH6lfHXiiT1P49Ry73yQEwsvzb/rcQvCmcNvYboGri1np8J9jUwojNlvwOiSsmu2EX7ZbvwM7kvFkgvigBmlFSAyCQCkBHyG8=
X-Gm-Message-State: AOJu0YyXrtBpa4hnI4ihsn1ZlYptcmgTPafVfJpsn58CaI24x0wAEo/Z
	riOsyV3+V8GaPVsAXmLYhlMxSCOMyfiepGIl/TSfz3j9qmogw0mb/LXXVvcEuQg=
X-Google-Smtp-Source: AGHT+IEur79MizdH5sIWiHr00QL5pFl2fCc4aXr38mCKPADyUGiY738bWeUAijMOObMWLOKhlRFbkg==
X-Received: by 2002:a05:600c:1e20:b0:41b:fc3a:f1ef with SMTP id ay32-20020a05600c1e2000b0041bfc3af1efmr7967156wmb.33.1715005969793;
        Mon, 06 May 2024 07:32:49 -0700 (PDT)
Date: Mon, 6 May 2024 16:32:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19? 1/2] xen/x86: account for max guest gfn and
 number of foreign mappings in the p2m
Message-ID: <ZjjqEPRycO-ZIkAe@macbook>
References: <20240430165845.81696-1-roger.pau@citrix.com>
 <20240430165845.81696-2-roger.pau@citrix.com>
 <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45c52348-e821-4e36-9bd6-7dda00eeb7d3@suse.com>

On Mon, May 06, 2024 at 12:07:33PM +0200, Jan Beulich wrote:
> On 30.04.2024 18:58, Roger Pau Monne wrote:
> > Keep track of the maximum gfn that has ever been populated into the p2m, and
> > also account for the number of foreign mappings.  Such information will be
> > needed in order to remove foreign mappings during teardown for HVM guests.
> 
> Is "needed" the right term? We could e.g. traverse the P2M tree (didn't look
> at patch 2 yet as to how exactly you use these two new fields there), at which
> point we might get away without either or both of these extra statistics,
> while at the same time also not needing to iterate over a gigantic range of
> GFNs. Going from populated page tables would roughly match "max_gfn", with the
> benefit of certain removals of P2M entries then also shrinking the upper bound.

The nr_foreign field is also used as a way to signal whether iteration
over the p2m is needed in the first place.  If there are no foreign
entries the iteration can be avoided (which is likely the case for a
lot of domains).

Note that in 2/2 max_gfn is also used as the cursor for the teardown
iteration, and points to the last processed p2m entry.  So even if the
maximum gfn is obtained from the p2m page-tables directly, we would
still need some kind of cursor to signal the position during teardown.
Or alternatively remove all entries from the p2m, regardless of their
type, so that the p2m shrinks.

> > --- a/xen/arch/x86/mm/p2m.c
> > +++ b/xen/arch/x86/mm/p2m.c
> > @@ -413,6 +413,8 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
> >          set_rc = p2m->set_entry(p2m, gfn, mfn, order, p2mt, p2ma, -1);
> >          if ( set_rc )
> >              rc = set_rc;
> > +        else
> > +            p2m->max_gfn = gfn_max(gfn_add(gfn, 1u << order), p2m->max_gfn);
> 
> For one a (new) field named "max_..." wants to record the maximum value, not
> one above. And then you want to use 1UL, to match ...

So gfn + (1UL << order) - 1.

> >          gfn = gfn_add(gfn, 1UL << order);
> >          if ( !mfn_eq(mfn, INVALID_MFN) )
> 
> ... surrounding code (more just out of context).

Oh, indeed.

> Further I can't really convince myself that doing the update just here is
> enough, or whether alternatively the update wouldn't want to be further
> constrained to happen just on newly set foreign entries. In that latter
> case it would be far easier to reason whether doing the update just here is
> sufficient. Plus iirc foreign entries are also necessarily order-0 (else
> p2m_entry_modify() wouldn't be correct as is), which would allow to store
> just the gfn we have in hands, thus resulting in the field then being
> properly named (as to its prefix; it would likely want to become
> "max_foreign_gfn" then).

I didn't want to limit this to foreign entries exclusively, as it
could be useful for other purposes.  My initial intention was to do it
in p2m_entry_modify() so that nr_foreign and max_gfn where set in the
same function, but that requires passing yet another parameter to the
function.

Thanks, Roger.

