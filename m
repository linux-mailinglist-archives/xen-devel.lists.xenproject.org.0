Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA54AAB00
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 19:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266075.459751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGQ1K-0004to-Iq; Sat, 05 Feb 2022 18:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266075.459751; Sat, 05 Feb 2022 18:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGQ1K-0004rG-Fx; Sat, 05 Feb 2022 18:42:50 +0000
Received: by outflank-mailman (input) for mailman id 266075;
 Sat, 05 Feb 2022 18:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8c5=SU=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1nGQ1J-0004rA-AP
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 18:42:49 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69984477-86b3-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 19:42:47 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id cz16so2348522edb.8
 for <xen-devel@lists.xenproject.org>; Sat, 05 Feb 2022 10:42:47 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id kw5sm1887123ejc.140.2022.02.05.10.42.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 10:42:45 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so2892749wml.0
 for <xen-devel@lists.xenproject.org>; Sat, 05 Feb 2022 10:42:45 -0800 (PST)
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
X-Inumbo-ID: 69984477-86b3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yedd43eoRIQVyiayOZs+IHIZcg34X3iy8HzQvrX9+vc=;
        b=hJAo4nCSeYMJ9Z1J9DLNxUS3UWhozfpff6fWvdKoMHKOHVRLCUA9T84HiX8JsPuWD+
         zlF7puaUJnJzD2sBbcdSHRZKQXScVFP+1RPq1+bhEyQ6TSceYhr3Kc1o0sz0eIcKdXmQ
         Q09O3kCl53O/XzGFDSeS63WviWTSewwSwtZpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yedd43eoRIQVyiayOZs+IHIZcg34X3iy8HzQvrX9+vc=;
        b=jyCf/D9a1JbkjaJwZ+KKTBgl9z67cpFPCFz2RDr/NOLLm3Hk6xyIep37utypoWV8Nu
         wGzASP9osP5lSfHDsIOnl5Isvg2ihKDsME8bZWTExaW52BLpZPx9nT3jdXmgcD4mRnAb
         rDibqyPoFvUUJgHs9g6CDC/Knh+WjpwglBXWo8cXrqN9TnjyLZkzWsKgXV3qWnW+JAkv
         DocugYTdZp/nstwlim6Q/5xBwAUulZB5EeNtDn6VRoazWdTLVhbA9opJ85KLIqM96UCe
         uAdZOrHu6i6Sy2QI4kCcs5UhjETZrufhXpSWHPlnWNACFWr5nzXxhn3SXqBz6Y5wJpKa
         sCLw==
X-Gm-Message-State: AOAM530GO2DGssRZA0zM2RD3RimGxijGjKahi+yw2e/FO/AAWTgFe0fK
	GRJDZ971NQaaYydn++/f97sppjsAwJ0kSKrY
X-Google-Smtp-Source: ABdhPJz3hkCN8v17i3lb3hTqGAAQdcu9hZU0Jg6DcHU4iDT1z0FRZSmt4BElLPuoSfZjx2M5p2bu5A==
X-Received: by 2002:a05:6402:5209:: with SMTP id s9mr5770381edd.154.1644086566545;
        Sat, 05 Feb 2022 10:42:46 -0800 (PST)
X-Received: by 2002:a05:600c:3846:: with SMTP id s6mr7597505wmr.26.1644086565037;
 Sat, 05 Feb 2022 10:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20220205110717.16946-1-jgross@suse.com> <CAHk-=wjp-h4bFWsWSPQ+5o6iuiPwiFNRNxfDSaDjURzVU6Af7A@mail.gmail.com>
In-Reply-To: <CAHk-=wjp-h4bFWsWSPQ+5o6iuiPwiFNRNxfDSaDjURzVU6Af7A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Feb 2022 10:42:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj_ObnioAixXdec63_aXXaS8SUEAsMQgfiHwhXNOYMn5Q@mail.gmail.com>
Message-ID: <CAHk-=wj_ObnioAixXdec63_aXXaS8SUEAsMQgfiHwhXNOYMn5Q@mail.gmail.com>
Subject: Re: [GIT PULL] xen: branch for v5.17-rc3
To: Juergen Gross <jgross@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 5, 2022 at 9:58 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Feb 5, 2022 at 3:07 AM Juergen Gross <jgross@suse.com> wrote:
> >
> > Please git pull the following tag:
> >
> >  git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc3-tag
>
> Diffstat? Shortlog?
>
> This is not a valid pull request.

Oh well. You're likely offline - I ended up just checking your
description instead.

But in general I really do want shortlog and diffstat as a way to
double-check that the pull contains what you think and claim it does,
and there are no surprises..

               Linus

