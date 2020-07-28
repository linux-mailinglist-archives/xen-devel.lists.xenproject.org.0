Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AB230764
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 12:14:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0McK-0007OJ-0Q; Tue, 28 Jul 2020 10:13:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaET=BH=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1k0McI-0007OD-2d
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 10:13:50 +0000
X-Inumbo-ID: 07944953-d0bb-11ea-8b26-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07944953-d0bb-11ea-8b26-bc764e2007e4;
 Tue, 28 Jul 2020 10:13:49 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id y22so16949000oie.8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 03:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dIGitEZzrPfalnnDRusGe28l2o0rf72O/DvG7N9N97E=;
 b=b0fbrVc8hmErEmlFhfL5lTeN9t7A3Y/NNz9ll10zrA+Rqr6Rm33Pceg/B5+x4mmt+Y
 EHGT2F4txMqMn5Sf4UTpq5A8nt+UJzjmVOCu/z27+epYaa4ProLwm0ttSKIaoJs+DyFT
 kbBZaFP9pyzsVLI3NPiAiLTCcqYJLlo/x+kQN/FH3/+MecdNkLz/QaRHqm59CAmkkUw7
 Fo047mxpm3vj+qaoPjxhWJAImYZE7NgWvBMvxu9MGwD4gzoA4He7ZYSPm00pw72HgX4j
 S/IxVEn9Fb+dRcB5NKxPulhl/XnafW/kclyefM+2AjouvvckBIyGc1R5Ns8RovWh6du0
 hyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dIGitEZzrPfalnnDRusGe28l2o0rf72O/DvG7N9N97E=;
 b=E4+jIZ2KMBnql5MwQS+U4JE/Re2r4B7c23NDMDzxz3OOQuVX85hAR5UcBZqi+kyUc1
 OQSrJ+MP1FoxV3XLGAJ/IfTrfKrKLX9QKrYQg7tZBB7KIv0NyS+1ZybX1k7xPQWFz8HY
 Qz9yQnXT13feosNhcB5+d3TT7On1hHpCCEoimKNJcuTUq/umuo0lC6wIoB0eRWWexU9y
 WmXjVKfupOPUQBeZD0rgjBTqZEcRlNxk+I1brIu88p61uXhwHz2dVXEVRrjT4USYqlAo
 6btRUIV0vcMG/QvcTnAMK3B6dFZtlnnjrkOvEraboWThA4xPxhGXAi2RIIc5yupBaFkA
 N0zw==
X-Gm-Message-State: AOAM5323rjuf+tfzdS3f2mCt1dPpZU6P0mNJLCdVvucrStO9WAO/1Cv2
 5Lt1TdvBVc7XD0tW/O+biu9vTsxYSfOETHzBrjBblw==
X-Google-Smtp-Source: ABdhPJzFJC22rWeZ4x/tjI2G7ahXjg4PWDt64qOjlCb0r7cf4shJQj8p9wDx5Yd4f0r/+JUpZ9r5PzneOkT/HQbrL8w=
X-Received: by 2002:aca:4a96:: with SMTP id x144mr2814958oia.163.1595931229010; 
 Tue, 28 Jul 2020 03:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200728091828.21702-1-paul@xen.org>
 <CAFEAcA_wKTFWk9Uk5HMabqfa6QkkTAdzBotmnrA_EH1BR4XjYg@mail.gmail.com>
 <32ad0742-bff2-1fbc-2f7a-d078980eb171@redhat.com>
 <CAFEAcA84fH3aGpbrJoA6S3qJ-FjD3NZMoj0G7jqvRneH_pS6=A@mail.gmail.com>
 <a09853d3-5c27-893f-54ed-63dc461bfacb@redhat.com>
 <ee8374bd-1257-1d29-6800-3902426b1a0b@redhat.com>
In-Reply-To: <ee8374bd-1257-1d29-6800-3902426b1a0b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2020 11:13:38 +0100
Message-ID: <CAFEAcA9zp48p64mPxR4_NyLDdYxjtEkKE_xQz_4D+Uau7HTE3A@mail.gmail.com>
Subject: Re: [PATCH] configure: define CONFIG_XEN when Xen is enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paul Durrant <pdurrant@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 28 Jul 2020 at 11:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Apparently kvm_enabled() checks CONFIG_KVM_IS_POSSIBLE instead
> of CONFIG_KVM, I suppose to bypass this limitation (from osdep.h):
>
>  21 #ifdef NEED_CPU_H
>  22 # ifdef CONFIG_KVM
>  24 #  define CONFIG_KVM_IS_POSSIBLE
>  25 # endif
>  26 #else
>  27 # define CONFIG_KVM_IS_POSSIBLE
>  28 #endif
>  29
>  30 #ifdef CONFIG_KVM_IS_POSSIBLE
>     ...

Interesting. We don't have CONFIG_WHPX_IS_POSSIBLE,
CONFIG_HVF_IS_POSSIBLE, etc -- also bugs, or do we avoid
them by happening not to check whpx_enabled(), hvf_enabled(),
etc in obj-common-compiled source files?

thanks
-- PMM

