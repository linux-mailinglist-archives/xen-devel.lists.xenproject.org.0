Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9B845E09
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674564.1049603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaS0-0006oo-V7; Thu, 01 Feb 2024 17:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674564.1049603; Thu, 01 Feb 2024 17:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaS0-0006nE-Rc; Thu, 01 Feb 2024 17:02:08 +0000
Received: by outflank-mailman (input) for mailman id 674564;
 Thu, 01 Feb 2024 17:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNcs=JK=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rVaRz-0006n8-B6
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:02:07 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0fa446c-c123-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 18:02:06 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5112bd13a4fso1135889e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 09:02:06 -0800 (PST)
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
X-Inumbo-ID: a0fa446c-c123-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706806926; x=1707411726; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHF+v7x8/QeBquQOP44XZ2/os7VovEFQTEi/GM6OTH4=;
        b=Wmy1rCxqHgFoAQYJEYhbAE5m3yMqIxu5GNWr6s/0uX70Tyf7VqOKSCTZU60RuaSy4G
         2nuLkTLzQGCfXKTFfh6uGnrhABSXgaf4j5Q5uF4tMt3TRhWv7tAclMqw58dQVpN94x3a
         AkGhJUPXbqaZW1qIyAIFqlHyVHh4j+oAQhGPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806926; x=1707411726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHF+v7x8/QeBquQOP44XZ2/os7VovEFQTEi/GM6OTH4=;
        b=sM5Xu/bTexV5tcnbrMV5UBu1ihy7Hc+NjEojaNDHRKveOIgwJJQImC0259MRo+0CA6
         z+61zKamjyO9oe5e/8u7/5wzKqzw5J+uPK/30lbkRQ7m15AfMlBpd1kijgrnRLNJYPoK
         3ubzvicoXYdgy83xZSWR65oUPWa0RqmfYuveytwSibvdwiea5T2w0r47NQzV0Liy0lPw
         dOGM5ztVzK2HxMlhUVsnyvCC2zhAkT65fCQQEN78fnKLyG8a6feKPpMmr5+6hah/T/UL
         P82NB1Rq616y/rRBueAFS7pURrhPYU2JaD2Ve+/jXk/3ky5YFxGHh/As/BBChkJaFwRI
         1sSQ==
X-Gm-Message-State: AOJu0YyzX0MFIWAsFL1rmenEwIxBefTbIsdJ3dygw+VIlasV3Jrpm+qa
	L21ZtL4TaIP3W6WpbVhj5GTzyTev/F3RvWsC3xDVcMCBN+YueKb1eBX0Dl8WoMjgpy9eMLkJ3Ve
	EMDmEtu5/naGUuR4+kfn2jSGlkltxN2IfdGiMLw==
X-Google-Smtp-Source: AGHT+IGxxLinwhS09HN0SxRzAxnFm0ip6c3RZ2uSi9UQHrxxNFviyXmgu7rTp7e9YNMAxeEUr8I2tvpYdgYqHeZk/LI=
X-Received: by 2002:a05:6512:286:b0:510:22c4:fbaf with SMTP id
 j6-20020a056512028600b0051022c4fbafmr1076144lfp.13.1706806925753; Thu, 01 Feb
 2024 09:02:05 -0800 (PST)
MIME-Version: 1.0
References: <aea51d2e-5da8-4da8-954f-2ee2a43be73e@vates.tech>
 <1be8f6f1-f977-4743-bd26-362ada960dc6@vates.tech> <CA+zSX=Yu_Epi6fge71iQNkecYOn92XO4KzwRtQNfrchtMaCxzw@mail.gmail.com>
 <9e01b86e-e3d2-4eec-93ed-e8828375bb30@xen.org>
In-Reply-To: <9e01b86e-e3d2-4eec-93ed-e8828375bb30@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 1 Feb 2024 17:01:54 +0000
Message-ID: <CA+zSX=aT8+4sECB+k7for6EWmR=Wjwi5q-0HzvJT0xs1p=xTsA@mail.gmail.com>
Subject: Re: Next steps for Rust guest agent
To: Julien Grall <julien@xen.org>
Cc: Yann Dirson <yann.dirson@vates.tech>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Lunfan Zhang <Lunfan.Zhang@citrix.com>, Xihuan Yang <xihuan.yang@citrix.com>, 
	dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 4:57=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi George,
>
> On 01/02/2024 16:55, George Dunlap wrote:
> > On Thu, Jan 11, 2024 at 12:27=E2=80=AFPM Yann Dirson <yann.dirson@vates=
.tech> wrote:
> >>> - what should be the criteria to advertise it as official Xenproject
> >>> guest agent ?
> >>
> >> What do people think here?
> >
> > As we discussed at the community call, I think that we should
> > basically set a date at which we consider this the official Xen
> > Project guest agent.  Anyone who wants to have input can give it
> > before then.  Then once you guys think it's ready, we can start to
> > "market" it to the distros.
>
> +1
>
> >
> > Shall we say 29 February, 8 weeks from now?
>
> This is 4 weeks away. I am fine with that, but checking this is the date
> you intended to set.

...

I have no idea how that 8 got there... yes, 4 weeks is what I meant to writ=
e.

 -George

