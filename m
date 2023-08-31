Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8378EB0D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593774.926857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfEY-0006MC-CP; Thu, 31 Aug 2023 10:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593774.926857; Thu, 31 Aug 2023 10:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfEY-0006Jl-9B; Thu, 31 Aug 2023 10:49:06 +0000
Received: by outflank-mailman (input) for mailman id 593774;
 Thu, 31 Aug 2023 10:49:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bdNS=EQ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qbfEX-0006Jf-6C
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:49:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 003f9b8a-47ec-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 12:49:03 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so6197255e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 03:49:03 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x18-20020adfec12000000b0031989784d96sm1794666wrn.76.2023.08.31.03.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 03:49:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 52C661FFBB;
 Thu, 31 Aug 2023 11:49:02 +0100 (BST)
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
X-Inumbo-ID: 003f9b8a-47ec-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693478943; x=1694083743; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9szszzBUdR5ToYe4lkxKsot+1tiEkxd0HyQR8K/eWs=;
        b=AGwjosFVXJ0vh6NgG9eOVeVlJrVciWxEl+G3NDYdDmGISoOh8yUmRYKD9yhFRFfj0L
         DcWxokpEoqnbciKHxamrR/CUaBjaaSC3VyBbXO8rJhL3Jq/QMtXoAYVtNshP/KbIkr9k
         VF4RHBcMzOtqK238c9/xbETpMhKUezyt6KdLKRLDy1ByPu48MvnGMv3X0PFM93t+ENTV
         /hKQ2pIrcYofWrtt9OudDUARg4v5KzOVqW8qlY3l+KUrjoD4ecC/ok1KNqn4IXv47C4Q
         DmUC7kUSjOWR7riqzhhck629Wrrmn7+jpaCs4xf8nXSZZZNoUF2GPYABXnxRnMupUhUq
         BIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693478943; x=1694083743;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9szszzBUdR5ToYe4lkxKsot+1tiEkxd0HyQR8K/eWs=;
        b=Qf8kRecUnY+LzdFlorMQFr/x7dTH9TfAr9+5cuXpAPHKLaPLVPCIrJVw5MVcHRmXyk
         TEGIFVQkDiq24es95Qz+wXaBj6usVG5SvhSny7vIYcb40RqKbaVYfJu1qY/tIe0ZAShM
         U2HoizqqOGR9MeJXCzcKVxLFMtEpLg2c5spYLIdrcrob7tKDg8eadXy1jxlL5uJId0u/
         TBU0eiN325lUYZEuNtYCYzUwVGsGOtR4b5anvrTrmouWpItqZBiB9Y8xQt1sFEsTckex
         OOYsvByomXa1WKZIsTOPFzo8rNS6VUdGYir9I7YhMoWLhKzS18kESDUfimL8/Z35rDe5
         O9eA==
X-Gm-Message-State: AOJu0Yx9vxFqa943nFW9AEgOhQFzD9Iq0S7VvjLB+RSJgag2eUXKAs4S
	vEHvg9dzcOGAr8LK0ppHhZp3/g==
X-Google-Smtp-Source: AGHT+IHteP7lU0wzH74Sjeqf1haATrXeUDt/BoBTIdUwgYDt8oDcbbtbbncX6VNh/kKjGjww7sZEtQ==
X-Received: by 2002:a05:600c:224d:b0:3fd:30f7:2be1 with SMTP id a13-20020a05600c224d00b003fd30f72be1mr3569804wmm.39.1693478943151;
        Thu, 31 Aug 2023 03:49:03 -0700 (PDT)
References: <87y1hspiyh.fsf@linaro.org>
 <alpine.DEB.2.22.394.2308301745530.6458@ubuntu-linux-20-04-desktop>
 <CAFEAcA8Ziov9vA9dW+4vzFE=KkSUqfMNNMZOtvQhqCXyjRytzQ@mail.gmail.com>
 <87cyz3pmgz.fsf@linaro.org>
 <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
User-agent: mu4e 1.11.16; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Stewart Hildebrand
 <stewart.hildebrand@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Sergiy Kibrik
 <Sergiy_Kibrik@epam.com>, QEMU Developers <qemu-devel@nongnu.org>, Vikram
 Garhwal <vikram.garhwal@amd.com>, Stefano Stabellini
 <stefano.stabellini@amd.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: QEMU features useful for Xen development?
Date: Thu, 31 Aug 2023 11:27:08 +0100
In-reply-to: <CAFEAcA-m8G1kfTw52kOGPEvQwWPph0NWc0URVY1aQ2WwVeB_OQ@mail.gmail.com>
Message-ID: <878r9rpjvl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 31 Aug 2023 at 10:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 31 Aug 2023 at 01:57, Stefano Stabellini <sstabellini@kernel.o=
rg> wrote:
>> >> As Xen is gaining R52 and R82 support, it would be great to be able to
>> >> use QEMU for development and testing there as well, but I don't think
>> >> QEMU can emulate EL2 properly for the Cortex-R architecture. We would
>> >> need EL2 support in the GIC/timer for R52/R82 as well.
>> >
>> > We do actually have a Cortex-R52 model which at least in theory
>> > should include EL2 support, though as usual with newer QEMU
>> > stuff it quite likely has lurking bugs; I'm not sure how much
>> > testing it's had. Also there is currently no board model which
>> > will work with the Cortex-R52 so it's a bit tricky to use in practice.
>> > (What sort of board model would Xen want to use it with?)
>>
>> We already model a bunch of the mps2/mps3 images so I'm assuming adding
>> the mps3-an536 would be a fairly simple step to do (mps2tz.c is mostly
>> tweaking config values). The question is would it be a useful target for
>> Xen?
>
> All our MPS2/MPS3 boards are M-profile. That means we have the
> device models for all the interesting devices on the board, but
> it would be simpler to write the an536 board model separately.
> (In particular, the M-profile boards are wrappers around an
> "ARMSSE" sort-of-like-an-SoC component; there's no equivalent
> for the Cortex-R52.)
>
>>   https://developer.arm.com/documentation/dai0536/latest/

It's not super clear from the design notes but it does mention the
SSE-200 sub-system as the basis for peripherals. Specifically the blocks
are:

  Arm Cortex-R52 Processor
  Arm CoreSight SoC-400 (n/a for QEMU)
  Cortex-M System Design Kit
  PL022 Serial Port
  NIC-400 Network interconnect

But if writing it from scratch is simpler so be it. The real question is
what new hardware would we need to model to be able to bring something
up that is useful to Xen?

>> > The Cortex-R82 would be more work, because (unlike the R52) it's
>> > AArch64, and we don't have Armv8-R AArch64 support yet, only the AArch=
32.
>> >
>> > I haven't looked at whether GIC on R-profile requires any changes
>> > from the A-profile GIC; on A-profile obviously we emulate the
>> > virtualization support already.
>> >

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

