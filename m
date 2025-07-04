Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B983FAF9BE5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 23:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033783.1407087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnkd-00079H-2w; Fri, 04 Jul 2025 21:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033783.1407087; Fri, 04 Jul 2025 21:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnkc-00076d-VV; Fri, 04 Jul 2025 21:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1033783;
 Fri, 04 Jul 2025 21:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mgym=ZR=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uXnkb-00076X-RF
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 21:15:17 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa991767-591b-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 23:15:15 +0200 (CEST)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2f3b9afe4a0so236541fac.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 14:15:15 -0700 (PDT)
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
X-Inumbo-ID: fa991767-591b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751663714; x=1752268514; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHnUu5X/JaSku9YYucLv+RkTf5rnRUliWv+jSSEYoRE=;
        b=ijD1NrAmCuZxFUkfNC1L8BoA5azT35R5yW1xUfO2TrF5gfeKKD1xdxkDylBDO3CvTe
         nII3s7DN2G+lK1guK6L3+lXNf+AZ3SDoHJiGb0RgziKHod7o5fGO5qWfYT4RA86rR3MY
         BClZnvxn+aqEChngQ4V+HWkuGxz9yupD/oX0MbYMd8jGqlWeQaO9BZYrJYg5LcBnZ+3g
         BbZu4R/iKy2R5WTiY7tTDYeJhcGfltucKOGog2vxtQXK/N0K1HSUXUN5PBvGKP0Q6I4e
         yseDFqq7Fh5MFcX0OJecnyrq80qEwxn6fR/GbMu5cDdXfKHXjNoiB9vUbR/9U9ep6dBm
         moVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751663714; x=1752268514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHnUu5X/JaSku9YYucLv+RkTf5rnRUliWv+jSSEYoRE=;
        b=RhYegrYrCFf1fRl3VOFTJV8lXYx3r745wiMavok+5RL7/7ybnaq1HWXONp1kST3ZvD
         dl620eXPlNo+P6h2bZZkaZDqLnH1v2XOFfcOwATvPaI/iXha5okilKJShRbHo0op2AnQ
         Q+g+nVtW6C+jwTf5gnXd5iciysl+fxH9mUKJSCBNwlmczeTx/ebs/uITTtjJpekIDxbD
         00yR9dq1c/cRynHt1T5TdEJpCz+HnmwjReHO4g8dVQemAFvSjX+j1UuAoPsb60PvtTxp
         wAIqofl++j0F/VPZIROC/jPHv1PUxRmlC5KpaHUkKJV1kuEXbGje++TmOhX0JfLa9GCy
         99cw==
X-Forwarded-Encrypted: i=1; AJvYcCUuve7WdqRjbEevRQ4+nq1M1cPeWdc9fwGCProoctL4Vzfbb5yq34AdaqcYvq8sPJaKtH7bOquxM7Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLqHx2Fcyh/6LazUDf4v9e+wWWCCcC/3CHAg+a/sRmm8eQ6uuS
	cRsRa805EanALQRiwZWD9RVimu7vblHfrfE5cvA/iHgrwSd899ZOBmx+jQciHBqh1L5ywKftdxS
	vjW9YuoT6wAerKTC87hCfnTpQyTGYJr4=
X-Gm-Gg: ASbGncufT5hEF1qpnqH9GTjo/sl6BjP2ZbyxKmFPalIrBOtr1/PuVn5ngBiQqS2ojhd
	4CUJUL4XUKtuifB72e0PiMuxQE5Ir1JnyEXh6+l66mTPKjKxv6Uxsjbog39RdzcmUMXpYwXcsgb
	C69cX5CbxdfcwHAcStlh15n24n0CtIv4KdEnQjkg2C8nwI
X-Google-Smtp-Source: AGHT+IG7YDo2kMsK0ino3McQHuErqEWoSpxJ+Ed+GqZHDSKmIOQoZDVnZDqqT2RB0sh/Qo2GRtcCmx8Vf4/cewaMxk4=
X-Received: by 2002:a05:6808:1703:b0:406:682b:881b with SMTP id
 5614622812f47-40d05b70cddmr839019b6e.8.1751663714392; Fri, 04 Jul 2025
 14:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751412735.git.w1benny@gmail.com> <694f7bc0-5846-49ae-946f-bfab47d2bd5a@suse.com>
In-Reply-To: <694f7bc0-5846-49ae-946f-bfab47d2bd5a@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Fri, 4 Jul 2025 23:15:03 +0200
X-Gm-Features: Ac12FXzZn5NtpUuvLtmPwUvc0kyR6qe7rbGLcqixBJZ5m7TOEsdo0RRm0dw51Hg
Message-ID: <CAKBKdXjcDJhXMmdtJZiAbTwC6sRJfS-eOnO4NJf8x4ZRgqvbEQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 8:47=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.07.2025 01:45, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > Resubmitting patch from Anton Belousov and addressing review comments
> > from Jan: https://old-list-archives.xen.org/archives/html/xen-devel/202=
2-01/msg00725.html
>
> In which case shouldn't this submission have a version number, explicitly
> larger than 1?

Fair. I wasn't sure, since I'm the one who's posting the patch now.
What version number should I use next? Should I go with 2 or use
something else?

P.

