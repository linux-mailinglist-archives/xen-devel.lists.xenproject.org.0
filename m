Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CA59809B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 11:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389392.626266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObcp-0007tf-Iu; Thu, 18 Aug 2022 09:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389392.626266; Thu, 18 Aug 2022 09:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObcp-0007qE-FV; Thu, 18 Aug 2022 09:15:39 +0000
Received: by outflank-mailman (input) for mailman id 389392;
 Thu, 18 Aug 2022 09:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bNE=YW=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oObcn-0007q8-Ux
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 09:15:37 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5165c99f-1ed6-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 11:15:36 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id y141so981945pfb.7
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 02:15:36 -0700 (PDT)
Received: from leoy-yangtze.lan (173.242.127.92.16clouds.com. [173.242.127.92])
 by smtp.gmail.com with ESMTPSA id
 q31-20020a635c1f000000b00421841943dfsm873330pgb.12.2022.08.18.02.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 02:15:34 -0700 (PDT)
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
X-Inumbo-ID: 5165c99f-1ed6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=GVou49FDj6vD1P3Fi05uvLeNrotFy4YJ5rOUt4aaVf0=;
        b=u/BIEJHurcBq8SUCgn0Vwdppuf3/MEQPMBKS2o4rKwnhhqB2ak1wB4cehxieEl7Vui
         BmOMIuGH6wOi58hco2HhzUg1XRyTIKh+nrOwQsTkyQBheGUwwbNrf1Lu2xVeC6NNMI3H
         IVnI7Rq2IwgWUa0MMP4FAGOzK9S5DpGLlVr8oqwU9xOuHmHeE+YQCAQPN+lXmCMlgUwm
         SS1xe6YBrmKsfEYlnxUKNCcJZI7G75HfRhOnRo0RVRXE0/21V0XsDt/mG8Plknm79fkX
         JQ6lhgDmVaMrPo6vFiguOg2jUwfKKCuSsbEFyTVj9IOF354YFdNnbjM83ob+hSK41d+9
         NkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=GVou49FDj6vD1P3Fi05uvLeNrotFy4YJ5rOUt4aaVf0=;
        b=LptzVF5J/lsVfXkRr3rqMvZh6L+HTw1MblV7pM0BDU/y4NRM4ZiSgqy6H7vqIqf5X3
         DxPRHIj24UlDiIuxrNyJbepvMwXkrlwnS0UTQzN2LLLzvFJs35QNaORni5oDmP91dxh/
         VSiaKuTrrL+uGM9eIlNbCk2GHhAsZOn8IteBIUrRvA/9MLXhDiKWSpDZBzh6mXX83jZC
         A/71w/+dzWIuG6wCA5nKNUy+oEHdQzodMf9g0iSV+pH4rz5aKR04YeppbeFSOZpoP3jj
         TnhK91QXesVL2cWl9MZ6xmNydCrJKMQ8GzztjNo2z7hvaIAeo0rJw8VTQicVq6o2N25o
         qz5w==
X-Gm-Message-State: ACgBeo1+H6u1UtHlDYuiSu5bOY1Ja2j6CHIRzdwuV7TATlohZdPWPr/1
	e8TUQuaFfs3LnyQLkgDRFSeH/Q==
X-Google-Smtp-Source: AA6agR7YR8VeNsEUMotK1pyTRd3Rt25iZTobBQ1cfWbaG1+VDjEP5eW+woXrdXcsCBTY12Or5QB9IQ==
X-Received: by 2002:a05:6a00:8cb:b0:52c:6962:2782 with SMTP id s11-20020a056a0008cb00b0052c69622782mr2103153pfu.81.1660814134944;
        Thu, 18 Aug 2022 02:15:34 -0700 (PDT)
Date: Thu, 18 Aug 2022 17:15:30 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Marc Zyngier <maz@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>

Hi Ard,

On Wed, Aug 17, 2022 at 03:49:32PM +0200, Ard Biesheuvel wrote:

[...]

> > This header holds ACPI spec defined data structures. This one looks
> > to be a Linux one, and hence shouldn't be defined here. You use it
> > in a single CU only, so I see no reason to define it there.
> >
> > Furthermore - what if Linux decided to change their structure? Or
> > is there a guarantee that they won't?
> 
> No, there is not. The memreserve table is an internal interface
> between the EFI stub loader and the Linux kernel proper.
> 
> As I have argued many times before, booting the arm64 kernel in
> EFI/ACPI mode without going through the EFI stub violates the ACPI
> spec, and relies on interfaces that were not intended for public
> consumption.

Let me ask a question but sorry it might be off topic.

In the Linux kernel function:

  static int gic_reserve_range(phys_addr_t addr, unsigned long size)
  {
          if (efi_enabled(EFI_CONFIG_TABLES))
                  return efi_mem_reserve_persistent(addr, size);
  
          return 0;
  }

We can see it will reserve persistent memory region for GIC pending
pages, so my question is if a platform is booting with DT binding
rather than ACPI table, how the primary kernel can reserve the pages
and pass the info to the secondary kernel?

Seems it's broken for kdump/kexec if kernel boots with using DT?

Thanks,
Leo

