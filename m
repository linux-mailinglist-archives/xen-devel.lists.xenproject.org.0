Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C470B05417
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043709.1413720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubags-0005ep-Jm; Tue, 15 Jul 2025 08:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043709.1413720; Tue, 15 Jul 2025 08:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubags-0005cy-Gx; Tue, 15 Jul 2025 08:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1043709;
 Tue, 15 Jul 2025 08:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubagq-0005cs-MF
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:07:04 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b038b141-6152-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:07:02 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2cc9045bae9so585326fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:07:02 -0700 (PDT)
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
X-Inumbo-ID: b038b141-6152-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752566821; x=1753171621; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcJ30/WPMLCLtuKpNTqhvR0ltITbSf/vx99Dyi1Imoc=;
        b=VB7s/tG5oTy7u+sqM/koCVUzhqRBmmRXCP1HqB53n3q4zORwRjM7RmQ5SBiJnNXobz
         M5qHjkzvafpjAOFznCqXCOMazelnSj88SZLyRHnDV0zz1fIa7qYzd7vYbGVI0ZBeN0uN
         kaMO5H5UCIhXggJqEPmxW+FFkMvRPNKvqjssUXWjjJTr82lCb9azGKr2zGgTjzJf5Iwb
         pkqSXUG8xeLYhUOSjMsAtrNx6y3tWVA6wybZ9OvFqq7e6mkETBpXoITNxMZ0ROv5QUBx
         hLA6FiVrDLXU9jSIWn4fFtrO0OdgUYOsqKLu5k+Rj4ToKCk1M+6sNo8dufHb7qjXWBYZ
         tIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566821; x=1753171621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcJ30/WPMLCLtuKpNTqhvR0ltITbSf/vx99Dyi1Imoc=;
        b=vo4PMx8pcZVHqurl0pzPoq5JS/nkqmr81I02XX37Ti+rmLyUlvjlJcJmWo/LqroTSS
         eagVT+YtDeUo1WJCArmmzZogoUhZP0uAdmpBMzBJArG8o6LV0HTXs3Ab/WZ0WhuzGs8x
         EBAiN8hMD6H+6RQVZN210T4eOpc9UFox5uEe3wZUZZUW+sYmwc8AcXgVPPdYAlaJmd+5
         kg6zU9Ny/1IODEKcVX0uoXo2T7Dhd7GifSzKOJQG6sXcCHGSZdUDee9U/G5xlyW3+D4M
         E8HTUaoKT4KyH6e9DqwD8eWMC+9OvEW/015nX86iW6mFUjj/aM4QYxm9b+LjKikvyjk0
         E4zw==
X-Forwarded-Encrypted: i=1; AJvYcCXMgoiUoHxSv0ZIXQhHWsCX1JKFh9DcJQXh60ouDVc8Dp0alA+vHflIgzUkKE/ZL+nAP716Rr37Suk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3GnCQoj9pJM/PMmcYEDmLBqJ0MNPaikA3vycZ89/zehh3Rxl+
	ZmPr6+tOPdxqhw7YG09ryAwn1qs2kJaUXnLfX3THpBxhOPeC3GnF9ovDV0O9G7LpKDB8s7yFsKu
	xcZUouKPETWcmTjqIH2rGl2Nrc28qjkM=
X-Gm-Gg: ASbGncvvYH6kXnXv41ND6igyi6i05VoBEzTHS5lRr7FM3c+AhqhYVWzbqoqVwKi+4ju
	nzWAB5f386ElXYzYYBJ/wnlwSdUhFLVbXHDgWQmnM8uej3PdB6zAFnquV2spdZzfaEc5oOIrlO8
	b+TF9CYtpJiQdM3CYiVFvzeyQbpo06L1yv/9hNR2SxdnFzF4jbvDOIs2ZbNFP7l/ozCSpqJwMPH
	rnmji1F
X-Google-Smtp-Source: AGHT+IGJVXohva6ouAFsDkMpDlTxcPpwJ7c8FJYqjFWQ/q10x0fUa+1XXBwROsy0vr1eUw2dIhKLBSYOVVf+htdYlEw=
X-Received: by 2002:a05:6808:2385:b0:40a:53a2:84a2 with SMTP id
 5614622812f47-41c1b58c0famr156762b6e.6.1752566821168; Tue, 15 Jul 2025
 01:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752531797.git.w1benny@gmail.com> <85729f0c-e924-4e8d-9f57-faaeee9465bb@suse.com>
In-Reply-To: <85729f0c-e924-4e8d-9f57-faaeee9465bb@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 15 Jul 2025 10:06:50 +0200
X-Gm-Features: Ac12FXwhtDwyUo066aTH5A-Up1oQp_GnBIm3a9qosmINPDbFHya-_1o1h_T9oDk
Message-ID: <CAKBKdXi+WCbaOw9rrPmor1Y8_Y68STU9jdvNy+7eJjA3qcp6aA@mail.gmail.com>
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

On Tue, Jul 15, 2025 at 9:59=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.07.2025 00:48, Petr Bene=C5=A1 wrote:
> > Petr Bene=C5=A1 (7):
> >   xen: Refactor altp2m options into a structured format
> >   tools/xl: Add altp2m_count parameter
> >   docs/man: Add altp2m_count parameter to the xl.cfg manual
> >   xen: Make the maximum number of altp2m views configurable for x86
> >   tools/libxl: Activate the altp2m_count feature
> >   xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
> >     =3D=3D 0
> >   tools/ocaml: Add altp2m_count parameter
>
> Please can you post new versions as applicable to present staging? The fi=
rst
> three of these patches were committed a week ago.

Not sure I understand. They were reverted. What does it mean to "post
new versions"? I've rebased my branch to current staging before
submitting this patch series.

P.

