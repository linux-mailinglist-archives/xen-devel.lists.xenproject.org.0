Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69618076D5
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 18:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649376.1013830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAvwl-0000b1-VN; Wed, 06 Dec 2023 17:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649376.1013830; Wed, 06 Dec 2023 17:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAvwl-0000Yp-SW; Wed, 06 Dec 2023 17:44:31 +0000
Received: by outflank-mailman (input) for mailman id 649376;
 Wed, 06 Dec 2023 17:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y/u8=HR=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1rAvwl-0000Yj-4O
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 17:44:31 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b843d95-945f-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 18:44:30 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9f84533beso247461fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 09:44:30 -0800 (PST)
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
X-Inumbo-ID: 1b843d95-945f-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701884669; x=1702489469; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzdI3l6ueIWfHhKzhetzt4dIGbHsNIreVeZgEKRdWD0=;
        b=MFlo8p7oj3snBvFhThJJNBSqJ73wb+CxuPAEhgCAkhAOdXm+duFHXPFTcTP5464mj7
         ZQNzKSyFskzjbprdNj+n5GxouKw5VPxFhcJftPhg0PrXKPMcbULlXNsGKPLM7nEkwcz+
         8davw8dMwAlYrwHlMCL6xz1ya5a8ghJzg6FNNTP/n+6Noc4yWumqNhQC2sxh1FvSYScb
         vJx3T9xFyg8iDlHlLaPVaWYBI88BHxKBpN6E98gLKwgbUdDN5X6NR93NDdLZVsgjzoaG
         DitSA7vraUC4oQwbNm1FH0ZllEYvTegcRwzivIYaHRj31VzXOoIisc69EU8IPOi8HrnD
         G6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701884669; x=1702489469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzdI3l6ueIWfHhKzhetzt4dIGbHsNIreVeZgEKRdWD0=;
        b=XxRNhE2hPtpRi2IpJTtRm6/huzTvvkB39gM+/Eaqno+Gr5pLk4b6KRZfIxYTfm9wAv
         t/TIYYiKaxeBfuENU9k/pu7pbxdY/aRtsdjxAbfpsCt3BrQN5/me1vYkwJM8MzOWd2oX
         JQKwkD97bTYqzErOXsVfzxghyFwbVGQBC2e1ymuU6LrfKJKREojsnjHVATyqEHAkSkoF
         jMoH01Z0WyN/C2xxcL/sNl4tonxT0BGPXAxu/dM9uIh7ar+qTmGYJLATzFwNzQFpsedL
         Ady3cU+nbKPLaMFFad9VORIJrePl3QhpePzTwnoWnzC5n0ZgJwa9Ovctf8jiYRZ47kvd
         dUTw==
X-Gm-Message-State: AOJu0YxX8xXFHc7mvsJIjHXuI6u7podpXSPoEHq7r7jfxtdHYHUvU0E6
	DlkbOd8eAN3LejX/d/RdDfdbZQddQACv4BfajN5kv2P7
X-Google-Smtp-Source: AGHT+IFStkqEx6L0rrw14ulljUXl6Rx1vZTlK4vuFYQueRsfc/j6Oned/ej1/b3MhUOpTG9WBa4RZOIjIasshESLn/Y=
X-Received: by 2002:a05:651c:b28:b0:2ca:2412:4df8 with SMTP id
 b40-20020a05651c0b2800b002ca24124df8mr853443ljr.84.1701884669171; Wed, 06 Dec
 2023 09:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20231110160804.29021-1-jgross@suse.com> <20231110160804.29021-16-jgross@suse.com>
 <CAKf6xpty3ENpuPgTf7=Gk1Q-Ekn+FjOx=-ySMQF6v3kx7zntrw@mail.gmail.com>
In-Reply-To: <CAKf6xpty3ENpuPgTf7=Gk1Q-Ekn+FjOx=-ySMQF6v3kx7zntrw@mail.gmail.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 6 Dec 2023 12:44:18 -0500
Message-ID: <CAEBZRSdyoCH2CFP14imC9We+sTiGn8f-DWecQ1t+ftd0+=0xwg@mail.gmail.com>
Subject: Re: [PATCH v2 15/29] tools/libs/light: add backend type for 9pfs PV devices
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 9:36=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com> w=
rote:
> FYI, these IDL changes will require golang binding regeneration.
> (Maybe we shouldn't have generated code checked in...)

The generated code needs to be checked in for it to work as a go module.

-Nick

