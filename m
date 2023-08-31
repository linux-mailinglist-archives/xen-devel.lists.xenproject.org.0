Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D766C78E8FB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:02:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593532.926524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdZF-0007Wq-1f; Thu, 31 Aug 2023 09:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593532.926524; Thu, 31 Aug 2023 09:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbdZE-0007VA-V8; Thu, 31 Aug 2023 09:02:20 +0000
Received: by outflank-mailman (input) for mailman id 593532;
 Thu, 31 Aug 2023 09:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYAZ=EQ=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1qbdZD-0007V4-1J
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:02:19 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15fd8ac4-47dd-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 11:02:18 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so3728608a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 02:02:18 -0700 (PDT)
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
X-Inumbo-ID: 15fd8ac4-47dd-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693472537; x=1694077337; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Atyf6it5YtTHtQpEthOf92yCe1kN0bIRTc86uhn4tmQ=;
        b=lkFTMbuDss7tl8z+sObIdIkd3I7ev6r2py9kJKSniM8pIqo7rXn0tbJ/8/P/cWXdqZ
         fKHX9Q6e4kJp+YKZAMehUHHcrDvjvmEjYtn2BLeM/A2YJPcPCszewaxiOYRpe8l1iUDT
         ipnrs/OOjdK/Gzi1AeuoXQg6ccf/zgoEMe4uREn2s1RjvimdZ3Y5Ctkfl20oj2lbS4aa
         u7aSy12KV/1bzZgwMVVOuuih0VBrmnp9wohsk5K9UykqI5A28QoMDMxMuK0A6o3E7hvq
         uwdqI1vW3xFyEy+Nz5mmSJcW7gon0ZmZ/izb3WAxhH9WxMJsGXMiMND2fj+Zufa7kzwr
         NRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693472537; x=1694077337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Atyf6it5YtTHtQpEthOf92yCe1kN0bIRTc86uhn4tmQ=;
        b=N3Jlr6ynrofCKRw2anHikS7JJDVOfUYIVk3MCqABKGrPDecj1pF1A84EJGNaJvwgQu
         BKVbxt7wien1fb4MFJgV3sRKw3j5oQ2Apu86ruLSzkLHxXtXr9lK2/cvBW0qYU1jlZ4s
         OlgiPMvPP3NYxSo5WDc1WC3aYN5zW4+PzzGnnUkKqz24jnZQzy7Sa8JC3f6n+r9cfthl
         Ht7pWf9AqyszU+jCnYA9OZ0UIWzYcrDgEpI0lotLN1+H6fDrwL0OdCRZl/CX7dwr0LRZ
         rXli4NaoX6hvX/KyV3tIl5KZbXplrY7E/icVva4fpIDIC4C0VfTLOwgENQidh3XJK/fF
         VzrA==
X-Gm-Message-State: AOJu0YzmdEncmrvcZ7p/Qnvbi8+tuUkZ7psPTbxjMYSkhxISIYXthN9b
	Rz3Sei+HfSKT5t0PeTjGj1D+cM8MS3bGwi7hQveVag==
X-Google-Smtp-Source: AGHT+IHH1trT8CB6FUUesTFvCdiHDmP2HufMXaFwZaE7USD+5Yv3A6Eqg7vtSm4Ex/4bcUEQO9Z9HXrKqi70Hc8SW/s=
X-Received: by 2002:a17:906:7311:b0:9a5:b66a:436d with SMTP id
 di17-20020a170906731100b009a5b66a436dmr2517451ejc.14.1693472537161; Thu, 31
 Aug 2023 02:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <87y1hspiyh.fsf@linaro.org> <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2023 10:02:06 +0100
Message-ID: <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
Subject: Re: QEMU features useful for Xen development?
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Vikram Garhwal <vikram.garhwal@amd.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
> As Xen is gaining R52 and R82 support, it would be great to be able to
> use QEMU for development and testing there as well, but I don't think
> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
> need EL2 support in the GIC/timer for R52/R82 as well.

We do actually have a Cortex-R52 model which at least in theory
should include EL2 support, though as usual with newer QEMU
stuff it quite likely has lurking bugs; I'm not sure how much
testing it's had. Also there is currently no board model which
will work with the Cortex-R52 so it's a bit tricky to use in practice.
(What sort of board model would Xen want to use it with?)

The Cortex-R82 would be more work, because (unlike the R52) it's
AArch64, and we don't have Armv8-R AArch64 support yet, only the AArch32.

I haven't looked at whether GIC on R-profile requires any changes
from the A-profile GIC; on A-profile obviously we emulate the
virtualization support already.

> On Cortex-As, in addition to a PCI root complex and an arbitrary PCI
> device, SMMUv3 emulation (both stages) and GICv3 ITS are needed to be
> able to test PCI Passthrough. However, if I recall correctly SMMUv3
> emulation in QEMU might not be complete enough to enable us to use it.

Yeah, at the moment the SMMU emulation supports stage 1 and stage 2,
but not both at the same time. This is good enough for PCI passthrough
with a Linux guest using KVM to pass a device through to a nested
Linux guest.

thanks
-- PMM

