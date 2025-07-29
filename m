Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1BB14CBB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 13:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062471.1428187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiBS-0006DX-9O; Tue, 29 Jul 2025 11:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062471.1428187; Tue, 29 Jul 2025 11:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugiBS-0006C2-6m; Tue, 29 Jul 2025 11:07:50 +0000
Received: by outflank-mailman (input) for mailman id 1062471;
 Tue, 29 Jul 2025 11:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDjb=2K=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ugiBR-0006Bw-Ds
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 11:07:49 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4243ae80-6c6c-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 13:07:48 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-73e810dc4cdso1910390a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 04:07:48 -0700 (PDT)
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
X-Inumbo-ID: 4243ae80-6c6c-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753787267; x=1754392067; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPqN4pfLReGwZCCxTr9R/9szw3Jf8dLAeoG2Ulc2pug=;
        b=EazsYGh4o+GfUuQqkF6fnt225BH0BrsHX13RJjOtvPD6fsvjyZKx2wJzlpXCF7Djib
         mYmFuQ2S5xp3qUOCsOjk16EcutluFhSEfpoGuwbqZ6x3Al79g7F8sWPD0ePuserjacBd
         puYJa1t0n2QpDs4bjnwZRDJladzKHWApjlt94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753787267; x=1754392067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPqN4pfLReGwZCCxTr9R/9szw3Jf8dLAeoG2Ulc2pug=;
        b=iqPtUSByyjxfyD7pQ6fLb5rJS0HkAkRDoy50o5Phwr0PeRI4HMYM/xv9xBFco6Zkm2
         cunogcS/pNoBIxorGEh9qYg2tyu5Ae4qCnF4NsZybeN1XW6kk8NZHjOFI9flO7cPeASk
         1jTZ5Mhb92bbyGLqUtbsht18UEkIi0ysRepE9Nu8zkiIcsVnooCsAJLyz59RHD4YQdX/
         1IyW/iX2gvkawjmJOreX+hSpvEzl2hA34CoxfXpNsfthbATBu/Zxqm1NYg2R3du9mY28
         rGAa+mnUbW6X6s/d7oX04NS+xgarcwzauYlG+ba8E6h5Ikww94/Zw4Jzl8Pf+AbrKyf1
         isgw==
X-Gm-Message-State: AOJu0Yxs+xv8d7Dy1spJd8LALyFHH3491M5wRM3pbP0RlzFiDlvJMCHH
	Pq/hYzVZq4uLRVkx97igKG1wxQx0wVh0gY8+/rH687B7bNTn96oFeD60SmsXaDM9j1D9xxoAc3V
	0Eyof/2Gyh1qomipdtCr7U+J7OioHtlbHqvyj9ZK0pw==
X-Gm-Gg: ASbGncvdDGyga8MnT1QcInuP21Js3PsuAXgdeyCbQj1TjlMaEj9zGQ1rVQB+kKthX5K
	ZZ0HB2QGLSzPPkoHve8ZpML+snFcfoU/zdFIgSQNKPfSwSs/PyW0gHFPp640f6UnacAWmrQHNr/
	OXmKkHubhoiGnE/tsUWHCQ8Cq0IQC8T/oKfbtFP8ATJL/gcgSqz6ZPPmHdqExZAJPreLDA5a1pB
	twu9S8=
X-Google-Smtp-Source: AGHT+IHFJdqCJo15+kxvULmvjHDju2sug+cDUSxagGwtrN6r4aZuGnt3Lsg0xbvGvNBoPYzMJ5QJ0PRfX1U8NNa5CCk=
X-Received: by 2002:a05:6808:6f8e:b0:40b:121b:65b4 with SMTP id
 5614622812f47-42bb991634dmr9993580b6e.21.1753787266524; Tue, 29 Jul 2025
 04:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250728125036.41305-1-frediano.ziglio@cloud.com>
 <aIeWTNM21dme8Dgn@macbook.local> <3d56dc63-34e9-4dd2-8d9a-418a791610ca@suse.com>
In-Reply-To: <3d56dc63-34e9-4dd2-8d9a-418a791610ca@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 29 Jul 2025 12:07:35 +0100
X-Gm-Features: Ac12FXwTdBMm8H3biCj7_mtFkavCbsSZ2nK2ivFfmKGoH6dk2lqiymrIgI4cXtk
Message-ID: <CACHz=ZjybTSobCq2rC3N6urp3DMf_Bmt8ZhaubefDAwVg=dLZg@mail.gmail.com>
Subject: Re: [PATCH] xen/rangeset: fix typo in comment
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 28.07.2025 17:25, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Jul 28, 2025 at 01:50:33PM +0100, Frediano Ziglio wrote:
> >> Fixes: fc41b5c1fdbe ("Extend the range abstraction"...)
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Just to mention: I committed this as is with Roger's ack, but I don't thi=
nk
> a Fixes: tag is really appropriate here (I'm certainly not intending to
> pick this up for backporting). Even further I question a patch changing t=
he
> spelling of a single word in a comment: It not only took you time to make
> and send the patch, it also took people time to look at it, Roger to send
> an ack, me to commit it, and now CI will put extra effort into testing it
> in isolation via the build-each-commit job. That's way too much resource =
use
> imo to justify the extremely minor effect. Such spelling mistakes are imo
> best corrected when touching adjacent code anyway.
>
> Jan

Hi,
  I didn't know there was an automatism with the "Fixes:" tag.

I found the comment about the effort a bit harsh. In many different
open source projects this would be against the code of conduct.
Usually an open source project should promote contributions. This
seems not the case in Xen. A different phrasing would have been
better.

Other projects have separate handling for trivial patches. For
instance Qemu has some "TRIVIAL" marking, this will help batching
small changes like this; also the trivial changes have different
reviewers.
If the issue is CI resources we can talk about. For instance multiple
runners can be added, I have a runner too that helps when I compile my
branches. Suggesting other users to do that could relieve main
runners. Another option would be having the possibility to avoid
having to compile commits like this. Disabling the need to have every
commit compiled could be an option.

About the commits separation I prefer (and I'm not the only one) to
separate hunks and changes by purpose. Fixing typos is a different
purpose than other changes.

Regards,
  Frediano

