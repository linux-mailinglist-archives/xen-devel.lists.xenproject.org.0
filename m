Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910ADCAD460
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180518.1503684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbLB-0005Tj-DE; Mon, 08 Dec 2025 13:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180518.1503684; Mon, 08 Dec 2025 13:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbLB-0005RM-Ab; Mon, 08 Dec 2025 13:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1180518;
 Mon, 08 Dec 2025 13:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLQx=6O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vSbL9-0005RC-CP
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:31:47 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d8bbac6-d43a-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 14:31:46 +0100 (CET)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-78c38149f9fso12832687b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:31:46 -0800 (PST)
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
X-Inumbo-ID: 3d8bbac6-d43a-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765200705; x=1765805505; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gGgLLe5lt4hBAmy3jwNka+0wQ5GxAwPFs4py0qVZpMg=;
        b=M6QyHsoeE9b7gxW2ddqIfgVvv0YQ2O83fdR3UIVsHGCidOG/W0mklfjO/12XeqbGet
         dmarUll+q5t0RC+elHMGyi2GN/7DdKWYplbV/+w/w+l5Z67E+SpToBK/FDcZ3v6XGTBC
         r3QAF9hP6bK++G6YtKWnQNSa6W03hYhm02I2JGwWJAOFhVRPA0Em8j4hkFQ09Bprx3cM
         GgfjuG/6a76cVVR96UiyhbQlt8TZXJwijH/lGUmKm7I4bl3b4h81KlJLVgdyNrmyKmDE
         /DaB0SwLl2OmK4fxSA4dfkTBYkOGBqKgxd7Fo9M/e4NqmN8xh7w0NB5OtV8gNVo+chZw
         nrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765200705; x=1765805505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGgLLe5lt4hBAmy3jwNka+0wQ5GxAwPFs4py0qVZpMg=;
        b=f/BiWIBG0OZtHkiz7hbqA1Wk6tVRM2gEv6Bm2nhDLO/trb8sp7dsEwU4l7vN0h2iw4
         GpdsGo7i4wOguYzeiImEtiNv5ktNZGwF4ef+5n/LPYhhn/nYZc95UMkxfaAVqU9vwtRV
         nRsVnRQNVdwmRCMbGSMcCD0rbzV9xU9YaOeOTISWgugrGDmDWrWeK7PytFd48LQAfJiB
         ln6ks7TPZl6FwyolBUVAAgJFvxictOO1p98mdYvb7tQxExQdEIcYuQCuJUNCjqUOCKOu
         j+7AvpGWdKXNgBVpX/nJSlsCxClv32Bw+GTmnKXeP2miR5n4cIll1erV2cC37aRKKyXK
         czYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3cg8Ehbc5hGyoL8anvKllswI45z/MAwP0Hs9302YxGR2zWjlJRceIsYbZo/42BmW7rOUueS2/wNI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSAlwYgRgepbTM0zSofaSNxzMHDOOiIP6qTslwtCbVMLn3kdZC
	Ld4OcqdFbBvw/6OKLNW+Tz5Unbf6KMRnQeZYqya7KjHXso7Zwx+n5T1BbVZmcs6I728ohxeuo9z
	0gR2vQTYoJhiS01O1nIb1MgeGPe+hn5Y=
X-Gm-Gg: ASbGncsOADsC+MoyalP32K6BnO+B/uKELBYyO3SXPyjvq54vuO2vuTH/oy+iPgq0gEH
	OfzBLXsl6KdB4GhRD4GWN/1GKjSDIIBqOmXg9bNPY1R7UysV0tr5YuhL5Z7y7BALxMCtb7PuriN
	G23zEoJv1ElNjyni/eYqPnpd+vo/LrquyFdep5MVUWYhb+SjuMlN23WhPly56P4CdgPRSt9jc/F
	osgcJIWIIdRAJQbYVntRmjdIqQWkBUH2Pw5GM0IYxv4vsXxNy9Bt3hT15aeG7PLvzBVJ8Y=
X-Google-Smtp-Source: AGHT+IG8MVJ1/ETWvvmGQIvQKxMlYN1N4v/NKxnRJ3TPRrUU0VDQFxo3H33LrFUon8fubhxSZZlewmLZns+uIrgnVkk=
X-Received: by 2002:a05:690c:3688:b0:787:e9bc:f9e2 with SMTP id
 00721157ae682-78c33b9282bmr77230427b3.29.1765200704845; Mon, 08 Dec 2025
 05:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-3-frediano.ziglio@citrix.com> <4fb15575-cbfc-4842-b48b-4113fe658137@suse.com>
In-Reply-To: <4fb15575-cbfc-4842-b48b-4113fe658137@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 8 Dec 2025 13:31:33 +0000
X-Gm-Features: AQt7F2qvU8f2Xsc5iKzO6nJUwRrFQwq68rjVqi6CvvFk6l7VCbLBIAoccYrLeWk
Message-ID: <CAHt6W4e=7nCH=owhGEAjh+tjTo3j0KptW-y9WuDRYTDWsNyWEw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Dec 2025 at 08:25, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.12.2025 17:09, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms.efi file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen-syms.efi can be used for debugging.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - avoid leaving target if some command fails.
> >
> > Changes since v2:
> > - do not convert type but retain PE format;
> > - use xen-syms.efi for new file name, more consistent with ELF.
> >
> > Changes since v3:
> > - update documentation;
> > - do not remove xen.efi.elf;
> > - check endbr instruction before generating final target.
> >
> > Changes since v4:
> > - simplify condition check;
> > - avoid reuse of $@.tmp file.
> >
> > Changes since v5:
> > - avoid creation of temporary file.
> >
> > Changes since v6:
> > - install xen-syms.efi;
> > - always strip xen.efi;
> > - restore EFI_LDFLAGS check during rule execution;
> > - update CHANGELOG.md;
> > - added xen-syms.efi to .gitignore.
> >
> > Changes since v7:
> > - move and improve CHANGELOG.md changes.
> >
> > Changes since v8:
> > - rebase on master;
> > - clean xen-syms.efi file.
>
> I.e. not addressing my prior, more fundamental comments.
>
> Jan

Hi,
  In version 8 you commented that code should not double linking, and
the current version does not double link.
In version 7 you commented that changelog is in the wrong section,
which was addressed.
In version 5 you commented the changelog entry was missing, which was addressed.

What are you referring to?

Regards,
   Frediano

