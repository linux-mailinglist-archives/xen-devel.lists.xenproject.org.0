Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A98AC237
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 01:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709662.1108648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryh40-00021i-Qv; Sun, 21 Apr 2024 23:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709662.1108648; Sun, 21 Apr 2024 23:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryh40-0001zL-OG; Sun, 21 Apr 2024 23:57:40 +0000
Received: by outflank-mailman (input) for mailman id 709662;
 Sun, 21 Apr 2024 23:57:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/9Ol=L2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ryh3z-0001zF-Fa
 for xen-devel@lists.xenproject.org; Sun, 21 Apr 2024 23:57:39 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee41212b-003a-11ef-9e3a-7da7ca7a9ce9;
 Mon, 22 Apr 2024 01:57:37 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516d2600569so4798312e87.0
 for <xen-devel@lists.xenproject.org>; Sun, 21 Apr 2024 16:57:37 -0700 (PDT)
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
X-Inumbo-ID: ee41212b-003a-11ef-9e3a-7da7ca7a9ce9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713743857; x=1714348657; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXzbfWU/cv59hlsArAtixP8QdoqZrrFUOUzSvxpRvZc=;
        b=KnjYRph00KpaeHlrgcWBa6yR+ZimHtjRoDqgvf0xguUBSsEi9yRSiNWCQuvtJcgt6r
         SaxHpxkNa+KPqqhpfigm2UZhl4yfrNmbPXRky48iP1hwdJxuXjWWmYxa38/US2yheSaf
         +81i1w2nNbhvXPCp3MiXDF9tNoa0Tq931bNvmrYMuDubvFBtUSgYW/jhlJ6VEZiXTWN3
         VZXYIiRLWYbuvzfqDhiNQEcRbIC/3Pr/FOVHcgytYIHl0fqNN5e+QjEA/AXBf5aNQOZn
         raeWXaofy1/GKgjWE/UfJ3ORFmC0l/oFyXgF+6/ZFKpoif/L6F8ZBljMzAwf1ljsjzjd
         9mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713743857; x=1714348657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXzbfWU/cv59hlsArAtixP8QdoqZrrFUOUzSvxpRvZc=;
        b=bp/N6fbbjadYtBUneU1LDTcau+M9JWUfAJt0FYBlIFTUwhErReq28UJkYIa/IZNDru
         K9om/BfK0mnsoQ1cHsxBy+NXS/0PRuptrBiXA5WfarmTfIRz2qA3S+0BJloFcGdC+X7G
         Q98MCjmAKr6OmuCJ/4Xu0i0cPmaDxzrTNB0TWEtk5udrmrvUB4r+8snhhyNrbJ7Jv1SG
         +om2YZtNdVc4cdCmML3jH0dJ83s+8buq0yoCvNvp0uZfvbJDFz4JLFl4uz6HH7rWKA2F
         KvgPAR3JILnW+8vD7IH6xE+DE66AuaQSLS4j8J3tyA/+j5Jjje4fEpXELmgXZBxsRkOS
         ilzA==
X-Forwarded-Encrypted: i=1; AJvYcCXFCJmYgi/BJqh3c/x+5wQyxzH8YJhu0MGFuWLzNOv16e3/E7BFYw8xy8PIsssl8BWsX0yi6TJBs1wiPVO3cTKrVuzLEcfZqdQV91clUUQ=
X-Gm-Message-State: AOJu0YywmEzXfsto2BhzEPPdLzBqObq1fsZ/zZN6hAcFIy/rPz79JIpA
	yDoX3Rg3GVdC/kIjzarGcLfqSN98eRbcCLCFk9+vW9o6P3eMCsy6ErfXbTwxhnK3Z3ymXx5Cwy+
	bbytNwt5H9QownKKC1tagX8g8w0Q=
X-Google-Smtp-Source: AGHT+IGzPXEXFKo9eCpXdx+pp1GxTkh0dDHdAlbTT0vcN8u07BNk4pvX9s4+f4OPe8hmlkxIPMNUK89awtX0BqJ+mnA=
X-Received: by 2002:a19:f80b:0:b0:51a:b9f5:3416 with SMTP id
 a11-20020a19f80b000000b0051ab9f53416mr4883102lff.39.1713743856733; Sun, 21
 Apr 2024 16:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231011193444.81254-1-jandryuk@gmail.com> <CAKf6xpuJe6Cza6bow3QxDGf1viu0kish7Y8YRN8haXL1oEF3HA@mail.gmail.com>
 <CAKf6xpv2oDpPB3wWh=Fz_ahDVgmvw2MSj_q3RYqQ8NG6km5Tuw@mail.gmail.com> <ZgWxYvQH4A_Vh1i4@google.com>
In-Reply-To: <ZgWxYvQH4A_Vh1i4@google.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 21 Apr 2024 19:57:24 -0400
Message-ID: <CAKf6xpu+8Uh263NqKm1qFkYG9VzHH-p4UZ=x+Fm+-SHR7J5=wQ@mail.gmail.com>
Subject: Re: [PATCH v3] Input: xen-kbdfront - drop keys to shrink modalias
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Phillip Susi <phill@thesusis.net>, 
	stable@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	linux-input@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Thu, Mar 28, 2024 at 2:05=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jason,
>
> On Wed, Mar 20, 2024 at 01:42:27PM -0400, Jason Andryuk wrote:
> > Hi Dmitry,
> >
> > Do you have any feedback, or can you pick up this patch?  It solves a
> > real issue affecting udev, which crashes the Debian installer and
> > breaks the mouse for Gnome.
> >
> > Or would you be okay if this patch went in via the Xen tree?
>
> I'd rather not. Could you please ping me in 2 weeks on this. I promise
> we find a solution before the next release.

It's been ~3 weeks.  Any ideas?

If you think this patch should be pursued in this form, I'd like to
post a v4 that adds BTN_DPAD_{UP,DOWN,LEFT,RIGHT} on the off chance
someone wants to use a controller.  I dropped them initially since
they are not keyboard keys, but button presses are delivered through
the keyboard.  Hence, they should be included.

Thanks,
Jason

