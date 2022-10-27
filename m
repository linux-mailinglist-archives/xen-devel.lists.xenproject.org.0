Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64360F2A7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 10:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430933.683240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyR3-00014N-Dj; Thu, 27 Oct 2022 08:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430933.683240; Thu, 27 Oct 2022 08:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onyR3-000122-AZ; Thu, 27 Oct 2022 08:40:21 +0000
Received: by outflank-mailman (input) for mailman id 430933;
 Thu, 27 Oct 2022 08:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uk3A=24=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1onyR1-00011w-PR
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 08:40:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc5b42be-55d2-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 10:40:18 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id bs21so974143wrb.4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Oct 2022 01:40:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6188000000b0022e035a4e93sm577041wru.87.2022.10.27.01.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:40:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14A9E1FFB7;
 Thu, 27 Oct 2022 09:40:17 +0100 (BST)
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
X-Inumbo-ID: fc5b42be-55d2-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R72+Byta0ggcrMJ6pBTu9gVKHwUiTbM3bM47Lj1VcUQ=;
        b=HJlW3B32rhTSgzGTIOUVtz3GcIr3wQ2iIN+gBHqCt37IeWfGIH/zx6qei95qNQ9BLm
         eiMZBODbD1UuQh+xkhOJEAxbdPJQMcDMhd3ZUHEnCRCXPaIEjTqUo/EmfeoBiHF+D7Qw
         Fjs5wnHRrmccTQj969nhrxFP6OdzV6GlAuZ/8oN+1eysfp0hZcDydVlyx3InFhvURDCx
         g85iXDodk2UXc7jpZSqgHOpqxxr++Vd0lF8ewq9/RPPr4j5Vu/9Ss6zFYY9AURbRsIkP
         0BFT3Pms9aWDVXXXe1FGVPoKrTt9RdSMCgLRG6LS4Ph91RTHMCf9loKxmYIROzgVhH0M
         l++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R72+Byta0ggcrMJ6pBTu9gVKHwUiTbM3bM47Lj1VcUQ=;
        b=H8+4OGrtEQqNJByWhxDjAsWMr7K+fq3EsW+Y6knxLxcaIzHzDr85ZBDrAi8BUYbBYY
         DH63C7e5YDbFU3896PReahh+klU2+j+KbjLHn8CW+n/1QE0VTCjgeAfJg+H82z0S9n7E
         J8h6u25QqH35q5iYjs0upqMBJ43rvN8Jfjq2oinHCdc0QzAaeTPMD0scrnFwc2z5yk5d
         34I0VA+GqEgUpY3MwxQ1CFwBlnm8kmBofPNx1Ma1t+O/Yh99MciM0QsTAlJBLsWYyyaw
         nhXoKOgs8mT1raLxU5I0h4eD1MEHpLfxY4nZyKG/JGw+oD/HIoAFMvHfO8UyYQAhEpvF
         snUA==
X-Gm-Message-State: ACrzQf1JQRBi39CNkt2R1q8QyQDugAZF3PVB8zoQF+GY5RienTFz2E1L
	nxzJ29x5xgzRtds79JE+cBZaQA==
X-Google-Smtp-Source: AMsMyM6HkxGVNKU3Muav/IfO9FnY3SnVzozajd22rOaY8YCyg60SONqAX76DzqXaqnJTZPQ29Yxfuw==
X-Received: by 2002:a5d:6185:0:b0:236:776f:2bed with SMTP id j5-20020a5d6185000000b00236776f2bedmr11491996wru.535.1666860018100;
        Thu, 27 Oct 2022 01:40:18 -0700 (PDT)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, stefano.stabellini@amd.com,
 Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:37:43 +0100
In-reply-to: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Message-ID: <87k04l3bim.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi,
>
> There seem to be some missing patches on xen-devel (including the
> cover letter). Is that expected?
>
> On 15/10/2022 06:07, Vikram Garhwal wrote:
>> Add a new machine xenpv which creates a IOREQ server to register/connect=
 with
>> Xen Hypervisor.
>
> I don't like the name 'xenpv' because it doesn't convey the fact that
> some of the HW may be emulated rather than para-virtualized. In fact
> one may only want to use for emulating devices.
>
> Potential name would be 'xen-arm' or re-using 'virt' but with
> 'accel=3Dxen' to select a Xen layout.

I don't think you can re-use the machine name and select by accelerator
because the virt machine does quite a lot of other stuff this model
doesn't support. However I've been calling this concept "xen-virt" or
maybe the explicit "xen-virtio" because that is what it is targeting.

--=20
Alex Benn=C3=A9e

