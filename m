Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E012772E90
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 21:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578906.906648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5kX-0000Oe-0i; Mon, 07 Aug 2023 19:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578906.906648; Mon, 07 Aug 2023 19:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5kW-0000M2-UB; Mon, 07 Aug 2023 19:18:40 +0000
Received: by outflank-mailman (input) for mailman id 578906;
 Mon, 07 Aug 2023 19:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5kV-0000Lw-PB
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 19:18:39 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35d67885-3557-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 21:18:37 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so5766070a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 12:18:37 -0700 (PDT)
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
X-Inumbo-ID: 35d67885-3557-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691435917; x=1692040717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnVVq0gFmpSLJc7Ra4hKzgPMN6I3sQVjfRFG+ziAaNQ=;
        b=DQLUER5+ML7/Yo2Em24FN3v9IrFyVp9+kNy+QKr3hfyBbFCATqwg2jiQSC44U8Rwbp
         ohZdcGuPwgfhdIkJaqfhrDmkld31NXLQUqk5qVB6rl7IDKF+YmLmSP9bD5k8Jy8IXnda
         yRs28Sj2jFziSyuzf7LoKNoMBH7aJLAbH5eNRXGmB9EyC8Bm1GgwXzllomajYw4E6v6O
         9iKln5hHxHu2XHMPsQRuFQEiQHDSjeU/rUPS+CKa33w5ks+zvlIfafz0hN1E8Rmx0vXL
         huehtudTV8TsAQt2iYlHpVhbyGlNSFgqtmZMlYpEpdezSK3gP/bkO86KmkK87QiO7mZl
         xnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691435917; x=1692040717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnVVq0gFmpSLJc7Ra4hKzgPMN6I3sQVjfRFG+ziAaNQ=;
        b=HkZ+4mNLrD2lCJXsO8hbsEKf//pqQMOMewc90ElkNYUAn9pBvYYun7zZD5fXJcTrV9
         zpRdIJ3OjzuJIVpC/RIIOr94gPVLCG/BkyUk/6SdunMGF0PRWwfKTBqOaRNTgL8e31Rr
         dMGwMJW24kl2vSTPi9GQc1gqAAGSSakgMFvg/cJIkqGL53DzpcJkXQOSL94EOY60x34J
         4jvJ/uJ7egLhCxh6HBEkJIxTcjlTk0iUxiCxnB1YJDZlpyNJjhbp1Hs/9qX3QlMbFk3f
         TnNoY5UR8tKTADT6kJzYgTLOYsyws+jGSe3XIe94dRxsKyQb46aPSr96+P/TgnT7+MNW
         54lQ==
X-Gm-Message-State: AOJu0YxPNfg2tNo+hqvZuU2wX/86RQKtK5qWqP7dC4cpNp4FZrXFgO07
	PwvJN3zihtbQLnXdEkwenMtwOpBpvJ0pjnZ0KOg=
X-Google-Smtp-Source: AGHT+IG+m4XVxDF/Rm2u1rgJr/aS2zRCOZc7kHVJfbVidAgv8rP7YyRISpzYUtQC0FpCnYYhZlYTRHPd/fQ/HHcIjhk=
X-Received: by 2002:aa7:d807:0:b0:523:9c4:67ba with SMTP id
 v7-20020aa7d807000000b0052309c467bamr8027044edq.6.1691435917089; Mon, 07 Aug
 2023 12:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230807140620.47221-1-anthony.perard@citrix.com>
In-Reply-To: <20230807140620.47221-1-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 7 Aug 2023 15:18:25 -0400
Message-ID: <CAKf6xpveoJLrk-hU9Z3qHRgaaTFdMcD8MU6m61h+f0WAssu2Rg@mail.gmail.com>
Subject: Re: [XEN PATCH] libxl: Use XEN_LIB_DIR to store bootloader from pygrub
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 10:07=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> In osstest, the jobs using pygrub on arm64 on the branch linux-linus
> started to fails with:
>     [Errno 28] No space left on device
>     Error writing temporary copy of ramdisk
>
> This is because /var/run is small when dom0 has only 512MB to work
> with, /var/run is only 40MB. The size of both kernel and ramdisk on
> this jobs is now about 42MB, so not enough space in /var/run.
>
> So, to avoid writing a big binairy in ramfs, we will use /var/lib

binary

> instead, like we already do when saving the device model state on
> migration.
>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

