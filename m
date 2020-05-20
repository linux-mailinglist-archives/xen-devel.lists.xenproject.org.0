Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649171DC338
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:51:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYUq-0001GY-VK; Wed, 20 May 2020 23:51:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eu2h=7C=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jbYUp-0001GT-Me
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:51:35 +0000
X-Inumbo-ID: d6a41972-9af4-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6a41972-9af4-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 23:51:35 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i68so4139729qtb.5
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 16:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DOijWyKqJLxNwQeBpPWMP+0S3cV6uReedydSlpIjzL4=;
 b=VKLJf4RMzZ8GKwYeh9OqRDk2QVWEm43naydQATItag3YW/jJ5eONuUaMTKh0s95LEh
 8rgDtmyH+0qrLmnklWxl1XWFSu7uIlM30DG0fONhO/30xcMrA6IMw8Zp6a7iaB3GIqn2
 S7IELd0Jg+esKrNB0DzDvAW/KK7ppEp87NWuSKApP6O63Xls3m8QUJAMgaygYnYm93JH
 sKzRJByGxKC1qNzWU2XCfC5b2NoVQARZfqn0YAbJsqUIM8KzV+mGq5Cgw0NRP8JV1Gnv
 Pe07AyDl+Q9k1ZW888U5f6HrlwhBFRIzybMwFGkFQVHj4NGMi0CcWVFYiQP29KvhkdNb
 S3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DOijWyKqJLxNwQeBpPWMP+0S3cV6uReedydSlpIjzL4=;
 b=LzKbqUPAs55ygMoNAnnQ5ap6VUDZH2MZ6M08K3ZRNlGtVViJLdfygrTJyHl2lXvKlw
 3OWt1PMDW+0j1molGsaE3Y7J1xVDzDBX2Ny+rNHn/atoX1UNuqv2EVS1u0QIbLTyTFCc
 7Kmg1Vy+mom0eWBFZyWXFtcCQ4+WaMsgBzwWDunzxsi3F89AwoOzC/fWS5m2cg2b5Slr
 kWjcZO8xe6wEx8XXL2ym6Ugr7OyGwJc4e5p5s+7TKsiQeeCMEactLafPj0eKJFW9TxM0
 HwWbaHptAU2sLg3bls5N+mXpVHxXBjwPRufIyZshiG71+39B0paasyRLTMEMs8lJ3ZDx
 IUVA==
X-Gm-Message-State: AOAM533tXHCVDSZfFeOj/rHTnOiu7rQnP7vVfbtsJK6fc9RhZicjiI+O
 IaW89c51vYrjJj5Ggv2zEcM3SBj0/U5Sgnw3s7SMuQ==
X-Google-Smtp-Source: ABdhPJxt2EESLU8nhk5tsHgnFk3RvF6RDw6Vldmiq55JHPOjOD9uPQTlMBvIBmWRF0NacS8L88rfoIbWTF1pRYQwj0s=
X-Received: by 2002:ac8:670b:: with SMTP id e11mr8166734qtp.365.1590018694922; 
 Wed, 20 May 2020 16:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 20 May 2020 16:51:23 -0700
Message-ID: <CAMmSBy9VBxjSCRcfyiZ-RY8eyYOooeNfCqrvirhWzfpSbAQyuw@mail.gmail.com>
Subject: Re: [PATCH 00/10] fix swiotlb-xen for RPi4
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Juergen Gross <jgross@suse.com>, tamas@tklengyel.com,
 Konrad Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 4:45 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Hi all,
>
> This series is a collection of fixes to get Linux running on the RPi4 as
> dom0.
>
> Conceptually there are only two significant changes:
>
> - make sure not to call virt_to_page on vmalloc virt addresses (patch
>   #1)
> - use phys_to_dma and dma_to_phys to translate phys to/from dma
>   addresses (all other patches)
>
> In particular in regards to the second part, the RPi4 is the first
> board where Xen can run that has the property that dma addresses are
> different from physical addresses, and swiotlb-xen was written with the
> assumption that phys addr == dma addr.
>
> This series adds the phys_to_dma and dma_to_phys calls to make it work.

Great to see this! Stefano, any chance you can put it in a branch some place
so I can test the final version?

Thanks,
Roman.

