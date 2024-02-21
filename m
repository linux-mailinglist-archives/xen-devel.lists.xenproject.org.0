Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD73285D338
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 10:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683905.1063527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcijA-0006Fv-2l; Wed, 21 Feb 2024 09:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683905.1063527; Wed, 21 Feb 2024 09:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcijA-0006DG-04; Wed, 21 Feb 2024 09:17:20 +0000
Received: by outflank-mailman (input) for mailman id 683905;
 Wed, 21 Feb 2024 09:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rcij9-0006DA-7f
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 09:17:19 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01fdcb00-d09a-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 10:17:17 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d22b8c6e0dso50571991fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 01:17:17 -0800 (PST)
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
X-Inumbo-ID: 01fdcb00-d09a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708507037; x=1709111837; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsQ0Vfl6ZhEilW3byA6G/qo88FKVThxA350DbsuYXOg=;
        b=WJ5F0CZEmPntgarIVqYqFRC5r+tZ1gHziqco9NQGIO9Cmx6M1mQs1PhOELC1dK64a0
         iaWPtmtl1BKAtQgYE7EOrVEbHD3EWZf4fhSOP8StynFFm7M78yFKFEbtofGGtB8ow4ku
         XZf+bPmi/h/F3DWmWSpSceb0EIaBra0LYzsKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507037; x=1709111837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsQ0Vfl6ZhEilW3byA6G/qo88FKVThxA350DbsuYXOg=;
        b=JSPDBaa9r3K0OcpgHsvnp+H33U9AwQZPAneKbqFmHEvg3dLR4rLtB5A0TNjNbY7ij5
         Z1mRhB9vvC/IzNaGDYgdCLbpWMvZpM6WVWrc7OyFS5pNHyyGl+WUdfO0MCKMrg+8cQn8
         aWPM54p3axpdLHtzUTJbjvMcIzJMJLZlA5YgN/YuQbmBJK8KBrfM9cGYDU3tiHELLC2Y
         nMqAE8cRhWUhjmkVIBEzlwZWxoKuIMEfeW12x/1ttXZUaWBgCBJMycVMV9XiHLYQhwvO
         xK/E/W12w+a0OArVmxGE8BWFsPLDSumwLMZwS5AUF8gSuZ8Lb21EMFLz8oCWysdezgRJ
         h9qg==
X-Forwarded-Encrypted: i=1; AJvYcCXI61Zpuydn+5f3u2lCXWZODAOpDV6SjNdtWv/LZHlzH5+CRO6DOT6NFlWoo1kh6JF0K3S9RwvTmAwGgHIynTLK7aDPxMl+DyTmH20JzKU=
X-Gm-Message-State: AOJu0YxxeF7Xd2pRmLOY2Qa+ORAE8IBsgmGhhIdc5nm9jLFEgLBmJITy
	3dhVWaLyJZqg4oJNy0OKA/a/lO579398R/IZ6fWKs7Fp46df0qV+03PQFk6AR9UDDkOZEnlj8lf
	F0FFytsGwIb2crjCl3tvH6Ot8uvZSLukWdYjobg==
X-Google-Smtp-Source: AGHT+IFkFu7ROa2MjXixgEtrEtmThVE0gGHJKc/LxSFS6ej/W6OZB7fzHFhVmSWneDKyWtHT0L1AY3qrGRR8Ht5bfy8=
X-Received: by 2002:a19:654c:0:b0:512:d473:803f with SMTP id
 c12-20020a19654c000000b00512d473803fmr614167lfj.21.1708507036713; Wed, 21 Feb
 2024 01:17:16 -0800 (PST)
MIME-Version: 1.0
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com> <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com> <CA+zSX=aJ2mVbGzFj74+DEGZvw=XWTZKAeWfrwMNHaYhsdaytHA@mail.gmail.com>
 <5a28331f-663f-421f-9845-45ff5eb1810c@suse.com>
In-Reply-To: <5a28331f-663f-421f-9845-45ff5eb1810c@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 17:17:05 +0800
Message-ID: <CA+zSX=YtWXC1vkE6dhwrNpmft4X3ZHtroHjTaL1j_Gn_VFfr6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 3:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> > #1 by itself is probably enough to counterindicate this kind of
> > behavior.  Add them together, and I'm inclined to say that we should
> > write a policy against such optimizations, without specific
> > justifications.
>
> It's not like I didn't give any justification. So I guess you mean
> without better (whatever that means) justification.

Sorry, what I meant was that the policy would have to include a sketch
for what sorts of justifications would be acceptable.

For instance, here's a justification I would consider for this sort of thin=
g:

A. In use-case X, there is hard limit Y on the binary size.  For X's
configuration, with a reasonably small number of features enabled, we
are already close to 90% of the way there.  If we were to consistently
use this sort of manual code size optimization techniques across the
codebase, we could cut down the total size of the code base by 25%.

Here's a situation I would absolutely not consider worth it:

B. If we consistently use this sort of code size optimization
techniques across the codebase, we could cut down the entire size of
the codebase by 0.1%.  There are no hard limits, we're just trying to
generally keep things smaller.

Filling our codebase with these sorts of logic puzzles ("Why are we
binary or-ing the offset and the length?") makes it more difficult for
people to understand the code base and increases the risk of someone
making a mistake as they try to change it.  For instance, is this
change really equivalent, given that previously one of the comparisons
had >=3D?  It turns out yes, but only because we filter out situations
where the length is 0; what if we were to move things around again,
such that we actually can get here with length 0?

Making the binary 0.1% smaller is absolutely not worth the cost of
that.  I'm not sure even 5% would be worth that cost, given that we
don't really have any hard limits we're in danger of exceeding (at
least that I'm aware of).

But a minimum justification for allowing these sorts of things would
need to include a concrete prediction of the improvement we would get
by applying these sorts of things all over the place; not simply, "in
this instance it goes from three to two branches".

 -George

