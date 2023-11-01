Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFACA7DE60B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 19:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626606.976994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyG5J-00038W-Ej; Wed, 01 Nov 2023 18:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626606.976994; Wed, 01 Nov 2023 18:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyG5J-00035m-C8; Wed, 01 Nov 2023 18:36:57 +0000
Received: by outflank-mailman (input) for mailman id 626606;
 Wed, 01 Nov 2023 18:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyG5I-00035c-9d
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 18:36:56 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12fdb47-78e5-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 19:36:54 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-540fb78363bso154219a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 11:36:54 -0700 (PDT)
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
X-Inumbo-ID: a12fdb47-78e5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698863814; x=1699468614; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnQ1Uat/eoRhOsQp63qB+6Ne4cXLGT+Er+2OYLyl6+Q=;
        b=QUZJyOBJbTh7QKDYOpb2K5qGz1OBkxYX3j16mTDvVDXW5mXLE4TZxfDcQI1TWsmjO2
         QzFiyJXgs7/tUt2LmI9i2tLUxMXmvFAWzfVxzs/k/VBrbwPr+MTK1owSHk9lppTkKtjo
         B8uufUZVBC9v7iuRsI916TAcuxPCNKlUbU0rF5nGmmKveHUimKL/DRChPabXiw79l/K8
         95jzzFfzPQW3KYmQKKObdqMzsB5y/h9HJR+fwFiBbaBvaioLvI1ii4d6Np2Ojn+NOz+5
         8HSb2+jTB8fKHCV6OWPYFApyA7Xfb/vZEXPRU67g2hKKiWvDcwUnHIXq4U51wx1c+fUG
         kHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698863814; x=1699468614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnQ1Uat/eoRhOsQp63qB+6Ne4cXLGT+Er+2OYLyl6+Q=;
        b=gqPssGQ8R26cdNs45xFUc7kQ665ElajhdTCMvpgir/ibY5ddfSGkUVTDZZNL1qZH09
         O5wweu+dKaPEB5Zji5IZdHDBh0Y4y4P3v0awGk7WgCVl3uKKjuzdpDA+D1uNnxzZZ1Ys
         xqghL2khR1ZWAcBh8aiICZk3ZiuNXylf/UgH6bkWxCnPtc8eL8zBWJwbuMOcmHQfhlgs
         mHzYvmjM+5WdUdB5bqrrwECiW/T+9fwaKzh16MXKhW1GQDagGiBRoS0o61GqQuDCw+b/
         GPD5+4XhLgmJXqegoVGBSeKp32szmokKwTTlIHgAkw1V/xadJJXrsmt8cH2TTR0CVjG1
         Hm+A==
X-Gm-Message-State: AOJu0YwB5vXrksnBdEaFhlZduDuwQZRyLhcdzwmOkxUihnzfLztzsuXI
	SpKPurS+Ptnzfp6YDv+cV6Rjv9f6Iqcxb7EJTD8=
X-Google-Smtp-Source: AGHT+IF2MXjhJO2qjjV+d9S9tO0ZH2YqyA+/RB+xxngZoK5kIqP9imhQH0oXys819ExjO/cwaq3pgqsBgG3Isvgsnkg=
X-Received: by 2002:a50:9358:0:b0:543:7812:63cd with SMTP id
 n24-20020a509358000000b00543781263cdmr4055199eda.17.1698863813548; Wed, 01
 Nov 2023 11:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-3-jgross@suse.com>
In-Reply-To: <20231101093325.30302-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Nov 2023 14:36:41 -0400
Message-ID: <CAKf6xpt6LwSB2QaCnW7MvKJWq5rkR6qoFEG4ZCKVqv3MKeMMuQ@mail.gmail.com>
Subject: Re: [PATCH 02/29] tools: add a new xen logging daemon
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 1, 2023 at 10:27=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add "xenlogd", a new logging daemon meant to support infrastructure
> domains (e.g. xenstore-stubdom) to write log files in dom0.

As I understand it, your new daemon is a generic 9pfs backend, which
you use for logging.  I think naming it something like xen9pfsd would
more accurately describe its functionality.

> For now only add the code needed for starting the daemon and
> registering it with Xenstore via a new "/tool/xenlog/state" node by
> writing the "running" state to it.

To support driver domain use cases, I think you want to use a relative
Xenstore path.  While this daemon is independent from libxl, it might
be easiest to use "libxl/xenlog/" ("libxl/xen9pfs/") to take advantage
of driver domains having a read-write "libxl/" directory.

> Signed-off-by: Juergen Gross <jgross@suse.com>

The code looks good to me.

Regards,
Jason

