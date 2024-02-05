Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16B84A545
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 21:15:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676489.1052632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX5ME-0006q8-4s; Mon, 05 Feb 2024 20:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676489.1052632; Mon, 05 Feb 2024 20:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX5ME-0006nJ-1l; Mon, 05 Feb 2024 20:14:22 +0000
Received: by outflank-mailman (input) for mailman id 676489;
 Mon, 05 Feb 2024 20:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DQRq=JO=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1rX5MD-0006nD-14
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 20:14:21 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25309d30-c463-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 21:14:20 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d051fb89fbso730481fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 12:14:20 -0800 (PST)
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
X-Inumbo-ID: 25309d30-c463-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707164059; x=1707768859; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXe+1bcPtK0g/zBwZbjckLDPRV+tVJBOzR3z17zKq/4=;
        b=FcS93UDNnM3v0jd4N7amR4riF+swIuSB72zaLXbz+Nax2MUWD3vsb1R/rJwHpGNM9Q
         njE3l955Bvrxd7L0SOsz2shbTgV7/zdoEfJhrX7RMc9nVsyFVSIMfHqZEnp/kqelVoxb
         K6eJwYowYTEqIVT0YupPhbyRCmh+dZKhff18P+q6SpfQraQ/PGASvKdRkhuNL+tSmpPv
         5FRyIgKjITQBBcYJ22T3GTV9MDORwOCL5APzUWazoF2cR3KZhxBtrOFj2h7VesTQsQar
         pyASZIQ4MU9sdhwmKcZO9ZVfpjIoge+Rd5GmwTP0mFTu7yWuKYsIo2L0xacjcT12l4vX
         LfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707164059; x=1707768859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXe+1bcPtK0g/zBwZbjckLDPRV+tVJBOzR3z17zKq/4=;
        b=b/At2ZAoYlq9vlbS30VWqqZZnvRu2EbTxYQ4bhpWte8a0JUkSRaY/284nbXjLnMAvH
         AVOFJIuOrRbgjW9mo8BAXsEfMknnjVpw/hPCYplgD8rRk0e0KkwqpsEJXSRRL2GeXAGa
         c5bQw9kw3YNfkCSLCkX7HTI/3Mr/+FsqKGHlPI7ioe8hC4UhRkToFPE8eQRze63NF5rA
         0AxCQrnocivj1hhKDkAKtFG9Y0jHGuHx+v1hvAopiKwaeehkXnF3qhw9Q/mXbaERh2RN
         Kbkkh8APj9z4h/yow+I6KGFIbb/cte70LLHjESkOlo/dqPkCSCnr7bz2E8hZQ6kV0z5E
         8kMw==
X-Gm-Message-State: AOJu0YzLh6Ovowp2NgVLte6cVrXNXja6KfxoHepz4r0fVM+DYb+/A/+e
	1Fp6H41h9aaKWlnmyqdc3hKzIsIq6hz9F+zwAB9QWpEaV/F0+AaKOzX+IE1fdaEnbIOs2dH4FI9
	E4Cck7JDHLIxTv/hwEtBqBNLePnI=
X-Google-Smtp-Source: AGHT+IF0H2DhJ01UdGjSBeD5Jqhd5PHSR8v5f6yAwdttrE+uzR07rx+ZH2NTUFZup7LIvMsD2Gbtgw/Qj7SadYs5SW8=
X-Received: by 2002:a2e:b0f0:0:b0:2d0:b018:c0f0 with SMTP id
 h16-20020a2eb0f0000000b002d0b018c0f0mr535774ljl.33.1707164059333; Mon, 05 Feb
 2024 12:14:19 -0800 (PST)
MIME-Version: 1.0
References: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
 <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com> <CACMJ4GbvMhDdgOp=kUeL_+_j2yS_NVU69P8Xh9QYDLUwJ31Eow@mail.gmail.com>
 <CACMJ4GbNJgsg7tts=9UQPUr9ofsXajuHz7wYO1r5LnevWEL4_g@mail.gmail.com>
 <5aea32e3-033e-4299-9088-279d23801ba6@suse.com> <b3cd10f2-c3b4-49cc-8bac-28f525dd574b@suse.com>
In-Reply-To: <b3cd10f2-c3b4-49cc-8bac-28f525dd574b@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 5 Feb 2024 12:14:07 -0800
Message-ID: <CACMJ4GZGb+Yh74pAdhp9ise6U_iM0AFhxtcfXXYF6xYWcySLJw@mail.gmail.com>
Subject: Re: Ping: Ping: [PATCH] Argo: drop meaningless mfn_valid() check
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 4:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 04.01.2024 09:12, Jan Beulich wrote:
> > On 23.12.2023 22:35, Christopher Clark wrote:
> >> On Sat, Dec 23, 2023 at 12:47=E2=80=AFPM Christopher Clark
> >> <christopher.w.clark@gmail.com> wrote:
> >>>
> >>> On Sun, Dec 17, 2023 at 11:55=E2=80=AFPM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>
> >>>> Christopher,
> >>>>
> >>>> On 27.11.2023 14:55, Jan Beulich wrote:
> >>>>> Holding a valid struct page_info * in hands already means the refer=
enced
> >>>>> MFN is valid; there's no need to check that again. Convert the chec=
king
> >>>>> logic to a switch(), to help keeping the extra (and questionable) x=
86-
> >>>>> only check in somewhat tidy shape.
> >>>>>
> >>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
> >>
> >> I'd like to hold off on this just yet, sorry -- the change does look
> >> ok as far as a transform being applied the prior logic and the
> >> necessity of the check, but with it applied, it's not obvious that it
> >> handles all the page types as best that it could there, so I'd like to
> >> look at this (and the previously submitted patch again) please.
> >
> > I'm puzzled: This patch merely removes a pointless check. Whatever is
> > lacking with it in place will have been lacking before. Also can you
> > please give a rough estimate towards when you'll be getting back on
> > this, or ideally on both patches?
>
> Another month later: I'll give it this week, and without hearing back
> I'll commit what there is some time next week, with the R-b you provided.

Sorry for the slow communication. I'm not unaware of this but it has
been difficult to provide an update on when I will be able to give it
the appropriate attention.
I understand that you'd appreciate a response before next week, so
I'll aim for that.

thanks,

Christopher

