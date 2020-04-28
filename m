Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600F1BB960
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 10:59:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTM4e-0006Rc-Me; Tue, 28 Apr 2020 08:58:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OLmA=6M=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jTM4c-0006RX-S0
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 08:58:38 +0000
X-Inumbo-ID: 730d78fe-892e-11ea-ae69-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 730d78fe-892e-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 08:58:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g19so31329899otk.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2hpbDrVJDciMglrrU6QNbB6BSWSRP9sNw8h+DZwl/E=;
 b=EDLQaW9E3CXg8He4UmN+mR0fEW7PkVCjsogjpBqyWB2YHXKapUzAqLVnU7d2Qr1vAt
 ljhC6vEWo4GcdS2pKiRUyJRmhXk7m9zGQ3C15wRycRhjNFTwmSi0bnJnhFSZKHVNxtKG
 EAMFrmSiAQkxGOjWqIlzA3Yu7v82FM9lhKKu4EszxgsQtM+kG8dLouG9omH0EKjBOv5m
 fSuA8ARjSnuClyTLewRIms/YsPHpwEpos2XkBYZFM4j5v1gjObMC7cQGsAzVATsFLM6E
 nr5A0jn5r8ZO63XZPhxrZtPZYCufHrqMDV+7Qc7agQIq0B0ySdpebP1Va8M0/t7vvpog
 7ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2hpbDrVJDciMglrrU6QNbB6BSWSRP9sNw8h+DZwl/E=;
 b=UnlVBH8klmogWir7Y5DFVjRv8wJKe3VdV3ZleaEDnK1MqaJJKmztwPz/hy3oEqsB7h
 HoE5XkdoYOlaOGhZV3BAOryweOx+efM48vNjRmcZxQu1h+DgOsaWf4BFNftDo1LAv+NB
 PtF9ndenhrBW7AZETaxCVSvz94p3+QPn3BCBYoSn3pW5wfdLAD9J2lpARR88Ft00WFR8
 vWT1a9ufWJlGDeU6eeNaTW4IsRmKQG0epb8eC65sSxxzpq1vprVFkKkIILaN6Ds+zqbV
 DmlESw0Yuy5N/RdphnUlySqgn1zwT7x2mVW/2h4qe17Cy8kqmC27BLUQI2ZV3aUfY5Cb
 FS1Q==
X-Gm-Message-State: AGi0PuYj61xJ9Q3Ltf17UfBqARhMgh6ukubJ5uO6B7y6TCYDLQGt1eC3
 U1Ke4zKa8yuT9HLcZDiQqX24rxFqswfc/kM0piRZUw==
X-Google-Smtp-Source: APiQypIrD3QflSxSxLsW4iAYUu9Iyq5O44bhWnqv0s1vyoi6VmbguW78rAQZAx4jY7BePqINbh4ZmrXF2AJEaNtw3Rs=
X-Received: by 2002:aca:897:: with SMTP id 145mr209020oii.48.1588064317665;
 Tue, 28 Apr 2020 01:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200428062847.7764-1-gorbak25@gmail.com>
 <20200428062847.7764-2-gorbak25@gmail.com>
In-Reply-To: <20200428062847.7764-2-gorbak25@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2020 09:58:26 +0100
Message-ID: <CAFEAcA-Ze1phEVK7DoFEtHY_qzyDd1tnakYRqwURD0YWMEGvEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix undefined behaviour
To: Grzegorz Uriasz <gorbak25@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, QEMU Developers <qemu-devel@nongnu.org>,
 j.nowak26@student.uw.edu.pl, Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 28 Apr 2020 at 08:50, Grzegorz Uriasz <gorbak25@gmail.com> wrote:
>
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
>  hw/xen/xen_pt_load_rom.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

The subject doesn't match the patch contents and there is
no long-form part of the commit message explaining why...

thanks
-- PMM

