Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EB36B288B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 16:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508312.782880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paI2y-0003Xz-B3; Thu, 09 Mar 2023 15:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508312.782880; Thu, 09 Mar 2023 15:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paI2y-0003VO-8S; Thu, 09 Mar 2023 15:19:12 +0000
Received: by outflank-mailman (input) for mailman id 508312;
 Thu, 09 Mar 2023 15:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zPhu=7B=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1paI2w-0003Uz-Cp
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 15:19:10 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc8ed79f-be8d-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 16:19:09 +0100 (CET)
Received: by mail-pg1-x52e.google.com with SMTP id p6so1287394pga.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 07:19:08 -0800 (PST)
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
X-Inumbo-ID: bc8ed79f-be8d-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678375147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7pSJNq+7rFRI+hlQefhFmSeoL2+yXr7UUl/B9jEng0Y=;
        b=ibQ8nq1rAdCyNm5//Kl7KvkQ6mtOoCWB4UjkEqKfZn1Cd+WowXEtaRgeNA+f0EtZSN
         58d5YZZAaQr0UDjMFtGHYy1J8/3rJ33ZhIwJfXH9SFfUQdj9Rx8LcxnqLOrEiDKLKGRj
         mztB6hOakU0d2JWIZjmjjthhQoGCThzfawEG3HhriV0zUUbL3OnOEOtwafxN1E5xbCGp
         bDV1288zJoO3K/lBVT13Tw4zDNXITtzDcErIhXpzyQjdBTOAbox4cLczn9hSt+hhJo2j
         eG0iTDAqPne60gOuEOzXw04BUEDKgQO4Csw2EPNiahucGydtGzS4+7H0Fxmi7pcaYMGF
         4Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pSJNq+7rFRI+hlQefhFmSeoL2+yXr7UUl/B9jEng0Y=;
        b=jWQC9jHgQF3fi4oQkk1V+WCHDWFOBIHFBs+9RBjVxmSEmxs+kB2SUBhhqdHMgmoJ5k
         m1F3svYLgMmFr2ZBO27DeGT73v6VGG1zZf/FmPHwoUXE+dwSf2Uw13k+0Gtuy2enE5Sv
         RB/4Zdb1GEywDukv6m7fbybeloEgfNqndydd9CySHxCIMqUfGPheWuBgBB8W3PH1xjRd
         hnhPXjOZXts9gMPfJIpzRetavAOcnuzqpjArQLeovhRa2Kspih0uTRpDYjclZFjxbVDc
         qu0FV8PZdOUxLHHUGHmeBFtJ1jkwXUt+8Xd0wH92stovb0jPsThveBWa5FPbIEfKcsjP
         tY8w==
X-Gm-Message-State: AO0yUKV/5MmH5FDWQDQ9v3ppT5ad2/kGHDKedsYFPsBcrVTKH158fy0s
	B21/LooTUx8CKwc46aAM2W6g2fedS1zte7jyQ90x2w==
X-Google-Smtp-Source: AK7set/YdBxJd9ZU9Hf9nqYnYY61zXJ6jzvtW7pVLd1MtiesYN3RKW8+ZfcRTdbrpSQpoN9TTiO8O8+RdCUWbtokNp0=
X-Received: by 2002:a63:f350:0:b0:503:72c5:dd77 with SMTP id
 t16-20020a63f350000000b0050372c5dd77mr8030634pgj.6.1678375147620; Thu, 09 Mar
 2023 07:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-1-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 15:18:56 +0000
Message-ID: <CAFEAcA8bOzZQowyYEzga8xK1mYaDsCSqHAFgt0qHFRnxfECgDA@mail.gmail.com>
Subject: Re: [PULL 00/27] Enable PV backends with Xen/KVM emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Mar 2023 at 18:27, David Woodhouse <dwmw2@infradead.org> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   git://git.infradead.org/users/dwmw2/qemu.git refs/tags/xenfv-2
>
> for you to fetch changes up to 154eac37190c4d80d29b09c226abd899e397530f:
>
>   docs: Update Xen-on-KVM documentation for PV disk support (2023-03-07 17:04:30 +0000)
>
>
> Tested-by: Paul Durrant <paul@xen.org>
> ... on real Xen (master branch, 4.18) with a Debian guest.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

