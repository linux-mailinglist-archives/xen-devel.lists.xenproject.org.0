Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72352A64EA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 14:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19111.44326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIeK-0005DM-1s; Wed, 04 Nov 2020 13:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19111.44326; Wed, 04 Nov 2020 13:16:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaIeJ-0005Cx-V1; Wed, 04 Nov 2020 13:16:27 +0000
Received: by outflank-mailman (input) for mailman id 19111;
 Wed, 04 Nov 2020 13:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQoB=EK=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kaIeI-0005Cs-CA
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:16:26 +0000
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7633ef7-02d2-4b7b-ac54-20794ccd8d66;
 Wed, 04 Nov 2020 13:16:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id t13so22848584ljk.12
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 05:16:25 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yQoB=EK=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kaIeI-0005Cs-CA
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 13:16:26 +0000
X-Inumbo-ID: f7633ef7-02d2-4b7b-ac54-20794ccd8d66
Received: from mail-lj1-x22e.google.com (unknown [2a00:1450:4864:20::22e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f7633ef7-02d2-4b7b-ac54-20794ccd8d66;
	Wed, 04 Nov 2020 13:16:25 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id t13so22848584ljk.12
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0OL/wmJvx7gfZ3aTve3/MuK63BVPu3oYASR0Jzolnjo=;
        b=okQgrdYvDpd7xsdbJHxqH+E2Z7Mw0Be6KjTCgg2Ne4C0YpYTFKL50VkJ4E0tbsDkk2
         RwxRrInYmIQZoVaMaT2TVpNc2xRg0bgvIXUfHFxy8Oawg5xr8gr+s1UYQMytEykqiNv4
         7Clf20tqCKJ2yVrLQUevqJOhNDmmxlzr4jzpodWcethA2sWUMFdD331WSuZypiEOAHYS
         W1tzEdIwvDOmYFkRFT96jOVTSpRLergU+VtrMPovOwTsN/Q0nY/5ReBXfSCT+sRjQ0vg
         XqMGwVojvnDXwYMpvqy+y+yrvmXqnFev8c1bw+XGk4S5kkupsGXM2vOd1rbyqcc1rV7v
         g6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0OL/wmJvx7gfZ3aTve3/MuK63BVPu3oYASR0Jzolnjo=;
        b=pMaqBiXTGcnEiIrIGvOVQJZSgW6PtK98dCSlijOydRlDOa+hJloWAXd988+fYc5B4v
         1v1jl+l4b/v2RkfLse2dSjRxCJAf73/j6N4xCk4xcVSmEzE3lGfkIuYPdSF7QvMyMUo+
         vbmJUrFu6CMdTYKvW2CcOrVk7w2qihSrC6tp2Xkg4l87XJgpntpCQv7oWiw5g9eHEWqH
         g921J/KpbYBvv7RcVvEVC26fvD6U44yFH4Hpucql94jvTUzPMOdD/zsj9oBq2QF8e6MY
         IzGttoD7iZOn+2NNKbfVqF6bArkqSGHCnstyb9/GnCAvXRmp8DL8EW74BbWgpFOOmBX/
         3xrg==
X-Gm-Message-State: AOAM530mHZhUKVUsWP02MeLRosEV901/3KC+HHstKcvDLbBLXVa5IPwl
	MRH0AYxQqbwmwLyteDWKSgkHXZyPccvA47w1hKE=
X-Google-Smtp-Source: ABdhPJwqPWVzSwls4oFJ80HqOUlFlUkAMQKcUKJWnstqUlkmo9caiEco6a4ZcWN6CcsNelD6LALnFvxGtXWkjZrcw/g=
X-Received: by 2002:a2e:7a0a:: with SMTP id v10mr11464401ljc.13.1604495784376;
 Wed, 04 Nov 2020 05:16:24 -0800 (PST)
MIME-Version: 1.0
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
In-Reply-To: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 4 Nov 2020 08:16:13 -0500
Message-ID: <CAKf6xpuzPaRA1gRU_ne6vGxhqZRSTY0UjR3c3_64rffzyqP4oA@mail.gmail.com>
Subject: Re: preparations for 4.14.1
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 4, 2020 at 5:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> All,
>
> the release is due in a couple of weeks time. Please point out
> backports you find missing from the respective staging branch,
> but which you consider relevant. (Ian: Please double check
> there are indeed no tools side backports needed here.)

4ddd6499d999 SUPPORT: Add linux device model stubdom to Toolstack

It was acked before 4.14 was released, but never made it in.  The
feature is in 4.14, and Julien recently committed it to staging.

Thanks,
Jason

