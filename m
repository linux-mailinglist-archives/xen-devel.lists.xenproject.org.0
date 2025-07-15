Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C140B054CC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043760.1413788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubay8-0003uE-BV; Tue, 15 Jul 2025 08:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043760.1413788; Tue, 15 Jul 2025 08:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubay8-0003sZ-8S; Tue, 15 Jul 2025 08:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1043760;
 Tue, 15 Jul 2025 08:24:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubay7-0003sA-KH
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:24:55 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ebfc12e-6155-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:24:54 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-73b32df62e7so666795a34.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:24:54 -0700 (PDT)
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
X-Inumbo-ID: 2ebfc12e-6155-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752567893; x=1753172693; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEiGZSw2k34TttdOI2hYn4vGUHfa9LkurLRFLOyDJB8=;
        b=HxweqTwkASF0DQGyFCCE8t/mKUOUFZaNw+4RfitARIIk1oTi3FIeNp4Ec/YeQwWo57
         UFUZURblcFI5kSnqjpTX2bouQAJLAKJ49X7uK9ysMdnMnuz72YKTh2m02lUY49G5vuih
         yhg2OuiMXQg8I1mMQ6pWDsuUP0HJvNeGWx0jeWHgD+To7pgf/14dkHzYHjKMiDzAkD5p
         MZyctpvF4qdtMqVn/jva1SvsccIp7BYCExnO9/jR1ES5v5pZpbhIT6526rzVY6mCl2tu
         eLirXQ4i+PG+DjR7M7Hg88ZGJYztBY2mt8L0ULnRRReDvIIPXXQGyu4t1jQRuOUKAlDd
         prnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567893; x=1753172693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEiGZSw2k34TttdOI2hYn4vGUHfa9LkurLRFLOyDJB8=;
        b=wFwjbslqrZfShq2FwD+1zFcY3MkinvZclVXG7hJLIymUrOLt8Bb/w9WFmlSnLioVSv
         T4HStAUPDgj1IcRcY1y79SfQOdUQVVjLA1z26PtZoGEWldN61/Il8/Z1vTbG8pYUEKce
         Ak8lqmrTdpizM/7FLGBC0hCVnLqE296Wymt2poa56iuhxTV+8KlNE7LfgGS5Gc+rMqcR
         A8vdhVPJhNOXpykRPlmqzMjtleyfVxj1Cgl1udZ3Ea6/GLDmi2HLzaf8VVwZ/lANVoSl
         BxCNeA/eJ872ShQbZZFT9uFJh09nMWEUBTHjHNNs033Df5xNJ7XcA4ZKysprJHOaPvat
         VYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVToupOMMkBf+8aKUsNaGwUnWRavGqYlMbpNgA8nMfdMnefAOFqWufBxlof2HuWLYYEg2VPPzqbaEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmJZavM9UTKM9RHLY4C/xj6wzftc5bAnEazRWwgajdDBRGYscx
	Qs9TsbniqlUiIM1X1xo2OT7I48L8F+CCR0Aa/IjIGVVGgW7LAJVRJpzDzTy+L0KyG/CBYpQBS6o
	zYoxebYo0QtHqFls2s0NRXWMoc/OnbS4=
X-Gm-Gg: ASbGncv4eC7uoWjka4SWKYgSkdYPOMDtnGx66+ioMH1sX/I2oDypz3GtLjQKX4Yjb/3
	y+Tj4+3TGai6wTLW6toxqYBB8ZLD3PrZ+uRJN6EhPvSflRl9x0jrLIyM2GXuHnxHHfLFlkbd6Pq
	6DlVtgId0qW0NOr0nZse/cw4bS2gsduxNdjX1N7oFp/lVDrv/ZinFVL9G+sjukNPe9aD4mf86o6
	2E4xraQ
X-Google-Smtp-Source: AGHT+IEXCSz9h6Df+/1QoHOlToL0NN8bv0AYcYWOl0tu99/yUmN2FAEOyViDmXYfDrwok0+e42DMuf5LsOrC/smP7F0=
X-Received: by 2002:a05:6808:244e:b0:41c:1727:8b85 with SMTP id
 5614622812f47-41c1c547088mr153347b6e.6.1752567892565; Tue, 15 Jul 2025
 01:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752531797.git.w1benny@gmail.com> <85729f0c-e924-4e8d-9f57-faaeee9465bb@suse.com>
 <CAKBKdXi+WCbaOw9rrPmor1Y8_Y68STU9jdvNy+7eJjA3qcp6aA@mail.gmail.com> <0e11fb74-444f-4288-99b4-9ccb29f1353b@suse.com>
In-Reply-To: <0e11fb74-444f-4288-99b4-9ccb29f1353b@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 15 Jul 2025 10:24:41 +0200
X-Gm-Features: Ac12FXxUw4n753RUwBYeBQlyLTb6hKhkdt6wdVBi2YJXNoyKN-C9Q1MtkLrYI9s
Message-ID: <CAKBKdXhNGsLUve1sZKN1_ubcf510ZP5demDpZeppcqzNtarDng@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] x86: Make MAX_ALTP2M configurable
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Christian Lindig <christian.lindig@citrix.com>, 
	David Scott <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 10:15=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> Hmm, sorry, two of them were indeed reverted. I simply didn't remember, a=
nd
> checked only for patches authored by you. Patch 1 wasn't reverted, though=
?

Huh, you're right, I missed that.

> And then, as to patch 2 (which was the problematic one): Why did you reta=
in
> Anthony's R-b? In the v7 discussion I see no indication of him to keep th=
e
> tag with the change in place. Which (generally) is taken to mean the pers=
on
> wants to take another look before possible re-offering the tag. With a bu=
g
> fixed, all R-b covering that area become invalid (unless explicitly
> indicated otherwise).

Okay, that makes sense. I'm sorry, I'm still getting familiar with the
contribution process...

I'll resubmit.

P.

