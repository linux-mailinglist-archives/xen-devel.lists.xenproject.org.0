Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C48715E89
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 14:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541136.843553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3y9e-0004BN-P3; Tue, 30 May 2023 12:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541136.843553; Tue, 30 May 2023 12:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3y9e-00048x-L8; Tue, 30 May 2023 12:08:46 +0000
Received: by outflank-mailman (input) for mailman id 541136;
 Tue, 30 May 2023 12:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Duec=BT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q3y9c-00048r-QR
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 12:08:44 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b89ae734-fee2-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 14:08:43 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c218so3762905a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 05:08:43 -0700 (PDT)
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
X-Inumbo-ID: b89ae734-fee2-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685448523; x=1688040523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9gGh5adh4R3lzm9nLcS4ofe3OQvKVrPA4gwvKJA/JE=;
        b=lxZnXVzZLqHtk9VH+64kFp0NfAU76fyK99wuVQMi2Z4EO/c5oTJ80RD2us9eBiU98Q
         6BQaBXjpylecpvLXGHOgYbLIcEhH/FMzVtJxuuttsfOJCPD6XQVxD8kqqhdcx3n7H3O7
         B4jfOJbYwyYWUi5YnbBKu1SMxdTtTx4SjnxretTy+Mh9yhtwrvBcnzvop3+NO2fKqfoJ
         Pm7/5yU6KeaoYWF9C0ixLXsef64ZUa/6sdiIHkPHhEtxjefuSpLD8jf9Dn2TfHMqjcmZ
         TccsKsJl5nIq/pCVsfrEEHiX3eO68kpJCbbgO9BnmB85ezTOAu3YC2gZdOst2pi9s86g
         eDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685448523; x=1688040523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9gGh5adh4R3lzm9nLcS4ofe3OQvKVrPA4gwvKJA/JE=;
        b=kSUPI7+QmpqdzCkqjsBqNLkA3RXiLShLe1wSMzBhOVv+1kmrzU74yhL1KcH2alfWc+
         nYTXgjle235fX7UJId+yzsSKC+zCCcjU4XMrhenolENYYZqf1Q5hxe0qgkV80vPfeHtT
         Fo32gNXfTolkwiNyDBwcRE7LnyEQ2IJHcdwpqPbhezWqu0xKp13NN2yoAxlIBJLiuLhd
         OYRPVzCFPm2WP+VM77n2amT8OXskOJOCGzVA8qqlGFOf4r8f4KgwhoN4Cmv+mCOV8Kyy
         fymOf1SvdDWkjV/N+2OLkJDHe4cYvhcZRVr2hw/udLJ7C0V6U9eLFTphs6tqdoZlngFf
         zS6A==
X-Gm-Message-State: AC+VfDyyaVnYMOpJ3Cmfz39hicUPxD7+COutnIL2x9RazlB1rn5k9t5X
	vryGL0vIZPcAT9rUtJJGSmoxmDPC72Wn414E+ojXJKvj
X-Google-Smtp-Source: ACHHUZ4s4vKtexGPTzJW2BecxoS2Gt+4oiYM7q7UOREg8Pkh8B7g0sQoDoqNWIv8kmRK43oiBy1PoCLm434KKPcNx3M=
X-Received: by 2002:a17:907:6291:b0:96f:32ae:a7e1 with SMTP id
 nd17-20020a170907629100b0096f32aea7e1mr2308613ejc.63.1685448522559; Tue, 30
 May 2023 05:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230530114815.18362-1-jgross@suse.com>
In-Reply-To: <20230530114815.18362-1-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 30 May 2023 08:08:30 -0400
Message-ID: <CAKf6xptn2USt_USj+_KUq9BZHEY5HQGbkmF-n407nDot7P4K-g@mail.gmail.com>
Subject: Re: [PATCH] xen/include/public: fix 9pfs xenstore path description
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 7:48=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> In xen/include/public/io/9pfs.h the name of the Xenstore backend node
> "security-model" should be "security_model", as this is how the Xen
> tools are creating it and qemu is reading it.
>
> Fixes: ad58142e73a9 ("xen/public: move xenstore related doc into 9pfs.h")
> Fixes: cf1d2d22fdfd ("docs/misc: Xen transport for 9pfs")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Regards,
Jason

