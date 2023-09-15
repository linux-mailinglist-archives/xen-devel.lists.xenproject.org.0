Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D57A202C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 15:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603153.940055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9CS-0005Dd-Iu; Fri, 15 Sep 2023 13:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603153.940055; Fri, 15 Sep 2023 13:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9CS-0005B7-Fp; Fri, 15 Sep 2023 13:49:36 +0000
Received: by outflank-mailman (input) for mailman id 603153;
 Fri, 15 Sep 2023 13:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpI5=E7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qh9CR-0005B1-0J
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 13:49:35 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b32e3b39-53ce-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 15:49:33 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-502934c88b7so3665773e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 06:49:33 -0700 (PDT)
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
X-Inumbo-ID: b32e3b39-53ce-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694785772; x=1695390572; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2AaeuNQY49wECmrZnl49Ab7iexGpd1eBfz3XX3sCyk=;
        b=OsJ6DIDjoM6y3VAIUcXmmcwaCcbTpOSC1UelWQhGfsCjfVgfrHdt5IrwZFFVs5Txd/
         Oi+Rx6KcL2efgIf1uAURQM0K6/3v3OGIazKMuCMT4W+32gbLSI0LL5/VMhO04SfiEfd+
         50S+kQjQu+fLibacBzxTrsTO4GC0Nrent9Mcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694785772; x=1695390572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2AaeuNQY49wECmrZnl49Ab7iexGpd1eBfz3XX3sCyk=;
        b=kjFqhguNFolryrJ3uJcpHYbAsA61cyKtSqY1IAM0n5aq0tfTe4PJBQPzh4R02iu1bj
         m9dEgrF+szyQBf3LT22MUdGgYMH1DFFK2QiLFUXecGH85QPv6hbYR9zW+XcQM21DvGzG
         SGJVhSkE+15u79fsG3oy2KT+iHL17Xw+fjpD9Zbmoi6BAtxbiPe1FbPSxJTS0Qe1x2BD
         O5bZnhTtSmoerlPlnl1VZDOFt4bBXTYH94NN5o3Gaz8DztKuxe+X3jhjcyQxxRpBi2QE
         lcSQoD6I/SMVgkA4nY7oXZUHuYCB0pOyV36Kxxdi0NkLiTQGkXSqQZNDxSS8x7xLp3jn
         7JKA==
X-Gm-Message-State: AOJu0YyvPh/7PUZgTXjYOzhwreZHinnd7mucA8WN+J9MLJqMDBut1il0
	WLRZmR1CFNhxnGj9n6FXAEn89c0iqVGCBd9+bHdH/w==
X-Google-Smtp-Source: AGHT+IFvwPWKMXvMNbDxTYP91esCPeCs2Tq5+bjJJn+lH0r9lP3hUSbyljuZUeOCtK14Chgm6BtU1YtJF9O29UCZ1E8=
X-Received: by 2002:a2e:854e:0:b0:2bc:d5ad:2758 with SMTP id
 u14-20020a2e854e000000b002bcd5ad2758mr1622669ljj.5.1694785772507; Fri, 15 Sep
 2023 06:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230818134441.45586-1-julien@xen.org> <20230818134441.45586-2-julien@xen.org>
 <bb92bc36-db32-322b-569c-a176f08a95a0@suse.com> <7f896d46-e25a-40f0-bb74-9a471207aa94@xen.org>
In-Reply-To: <7f896d46-e25a-40f0-bb74-9a471207aa94@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 15 Sep 2023 14:49:21 +0100
Message-ID: <CA+zSX=ZoHtiSk0Uxkkd7CPTu_xhCQKqaScN+ZduWbsYiVD4EQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 2:18=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:

> I don't mind too much about using - over _ but it is never clear why you
> strongly push for it (and whether the others agrees). Is this documented
> somewhere? If not, can you do it so everyone can apply it consistently?
> (At least I would not remember to ask for it because I am happy with the =
_).

FWIW I prefer `-` over `_`; I'd Ack a patch that documented it
somewhere (if it's not documented already).

 -George

