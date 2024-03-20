Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C11881537
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 17:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696029.1086553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmySj-0007c6-60; Wed, 20 Mar 2024 16:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696029.1086553; Wed, 20 Mar 2024 16:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmySj-0007ZI-2G; Wed, 20 Mar 2024 16:06:45 +0000
Received: by outflank-mailman (input) for mailman id 696029;
 Wed, 20 Mar 2024 16:06:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WskH=K2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rmySh-0007Kf-GU
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 16:06:43 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6be5c5f-e6d3-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 17:06:42 +0100 (CET)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-222ba2a19bdso28115fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 09:06:42 -0700 (PDT)
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
X-Inumbo-ID: d6be5c5f-e6d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710950800; x=1711555600; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8OE54LHPd9uGphrLuqSE2+byM70JXcNFjjUmbbYksU=;
        b=TlmZu08NX8Be5KP/hh8PkTczVkc/YAUvtzymN9I2HKjvlEBl9WR1A/b1hFbnvjLVWR
         YyYbdo3e9fBiEQLq1vEOnbBGsWvOAZck21Se+tp3J5dJF+ZPElPGmuPgpQ93BkL6Bpkc
         ABTsgqceomMXaaD43nL9mMK9Hzmx7dlZZ1PuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950800; x=1711555600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8OE54LHPd9uGphrLuqSE2+byM70JXcNFjjUmbbYksU=;
        b=dQWjy6uSyuR1ORunUSgbeAkj4Bi+MqYqQ/0Oc6PSXnUXXd57NVxUJ2Zv3cTBaSTS8s
         4gXyMDGD3tn7aR9wit6BlIaIJ18eypWSHNnegAq7opiBnVIgId3eaT40TjICSw5SoZxP
         vHbMyrT4FQHpWVtyhftwdCEon3CwnoL1UmT7/QLDusvjdx5Fib1tn3xBNkC1iwLPP4Kw
         wVE2+WwX7n9qpWtrSuj4FlnlhMQQpBL7zJex1ItxpK8/fZfw5Nk/qYEDWXTM58nyJN1o
         c9eKiqk3xFAswuEnLs4xrWjYGpmZh/bzLZJhv0fkmjH9HTnlIhYinTapNh/lhz31RRCu
         ixVw==
X-Gm-Message-State: AOJu0YyhaXgUmxjK3jX6j+/lBz5Q4A6A6OW+JMhaQTuMlQvIlAoIAEhZ
	CyBQFsaqDbQYPqOkvqQlMtz1Bm5+MppaeWnszcRJYpGQlhS9AWcMBi7v1tOmKDEKsPpQ/3twW9d
	LjhbwRuFGIm70bKSz0YOeS2y37KxzvM6MlDUAvCq0W3dLhC0kxso=
X-Google-Smtp-Source: AGHT+IEXeBtaUgfe7HNS9O/siWiVeNE/x5lb0KMvBssM8Vn//ZvUxP7i+evILmbnK0aagGLOUY/wRK4HlFM+j1ysq+k=
X-Received: by 2002:a05:6870:2494:b0:21e:df09:fbb6 with SMTP id
 s20-20020a056870249400b0021edf09fbb6mr19439828oaq.41.1710950799071; Wed, 20
 Mar 2024 09:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com> <20240318163552.3808695-8-andrew.cooper3@citrix.com>
In-Reply-To: <20240318163552.3808695-8-andrew.cooper3@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Mar 2024 16:06:28 +0000
Message-ID: <CA+zSX=ZFeSgBAOOuL83dN2h=OkPST8jMHSQ4xF1jc+aU_pGU+A@mail.gmail.com>
Subject: Re: [PATCH 7/7] xen/trace: Drop old trace API
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <George.Dunlap@eu.citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
	"consulting @ bugseng . com" <consulting@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 4:36=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> With all users updated to the new API, drop the old API.  This includes a=
ll of
> asm/hvm/trace.h, which allows us to drop some includes.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

