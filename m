Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9480173E
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 00:03:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645792.1008149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9CXM-0006Dh-B1; Fri, 01 Dec 2023 23:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645792.1008149; Fri, 01 Dec 2023 23:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9CXM-0006AZ-75; Fri, 01 Dec 2023 23:03:08 +0000
Received: by outflank-mailman (input) for mailman id 645792;
 Fri, 01 Dec 2023 23:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=utmH=HM=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1r9CXK-0006AE-W7
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 23:03:07 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c94cab90-909d-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 00:03:05 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9b88cf626so36588921fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 15:03:05 -0800 (PST)
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
X-Inumbo-ID: c94cab90-909d-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701471785; x=1702076585; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABBrnleNU0W8SIEzwXZDZhKtg63XV9Hs8/osuuo8yAQ=;
        b=j5gIIimidL6ZHeRPU5Ok/71bOy5GSZCc1l34mGpcKGbZ+0diUtMFrtUKNzyX/FPPxq
         VgltdaktZjsVSMcCrD+hdA2EVjH0J92cSO3Pq8odMX/BRgxKGGqcW8wSKq5p3A/WkUzd
         sxnkOGQXvIT90QSrJzgE+5KJFWITjSvbWh1YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701471785; x=1702076585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABBrnleNU0W8SIEzwXZDZhKtg63XV9Hs8/osuuo8yAQ=;
        b=fX1DM3YXbjMpenrLETl/DQXj926HOGvFpvu2AMjmK9dXc+oDb3f3pDcAPXzK2YjisZ
         FXNqM9GEarCXshnb/nKLhD2Cqav2nI+DG7F8ZwiWuT0J/oTM4oAi+PJpupPdEIlO6Oie
         RdRvp2feLWDiVY9ymNYRMmt8QUQQtFYmRmG4JajHSj0AQKd7NZoAbh2LgQSgIFI96qbL
         XIx0F7s7UAflE2bs6M5oAYZBe3+M+4MPMTEh8eVsZ0n4LAuqeBbA5ZpLRzPSOf5ooyLv
         UCqRJTwf2yl5MYUiptx37BLMqz5Pbn7YBeXtBEK70skirJIri/ov1C7veBW8SfQEGdFn
         Kc1A==
X-Gm-Message-State: AOJu0Yxamj8WVenz+eScGyhFJLd7OOxUfsLYOYFlA7fgINzlU7IltRc0
	lG0D6PogUCh9cm71IdeWqu9y9BT4fIBQRGNDMl/Bzw==
X-Google-Smtp-Source: AGHT+IHhy1h6bv9dRdkMZwlgwTBFJTqNJf7zTlBe6IB+9HmNsPlUTfBJKUfe5A30J8iZqgn/pV8P+IR9ORgTh7wytTY=
X-Received: by 2002:a2e:9b14:0:b0:2c9:cd86:c2c7 with SMTP id
 u20-20020a2e9b14000000b002c9cd86c2c7mr1175106lji.36.1701471785230; Fri, 01
 Dec 2023 15:03:05 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com> <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 1 Dec 2023 23:02:54 +0000
Message-ID: <CA+zSX=aZf1UQt2eE0byMgwL+3EfW3B6CJkUHuFBVGA7Na=9gqA@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 9:44=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
> By the informal
> voting, we have 3 against "broken" and 2 in favor (not 1 as George wrote
> as Andrew's vote counts too).

Just to clarify: The opinions on that thread (if you include all
versions of the series) were:

Andy, Daniel for keeping "broken
Julien, Jan, Stefano, George: for changing "broken"

That's the "2 (+) / 4 split" I referred to (The "(+)" being the people
who agreed with Andy in private).  Regarding voting, I was only
counting the maintainers of the code in question; it coming under THE
REST, that would include everyone except Daniel; hence 1 - 4.  Not at
all that Daniel's opinion doesn't matter, but that from a governance
perspective, it's the maintainers (and then the committers) who get
votes in the case of a formal escalation.

 -George

