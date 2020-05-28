Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E81E6625
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKUx-0003Re-5W; Thu, 28 May 2020 15:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=reLY=7K=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jeKUv-0003RZ-Fg
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:31:09 +0000
X-Inumbo-ID: 40829f36-a0f8-11ea-9dbe-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40829f36-a0f8-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 15:31:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o9so2227631ljj.6
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28hEgZsH1Lw6BO+XOV0Mxi/G5PLUb05cF7tcDh+gdMQ=;
 b=Gv254GGIGrYLpmtX563mzU8bbJmC28oHVumkPrqhoRXbFZp+LGIeJYn53VC3N9jmHT
 Fgt3lrmZKyHytF1rQZvDjF/vYG61X7upEZ//+AiSw0dzhOHixAyDL35rFj4AWX5Okjfn
 Ay7p4Z/uPbR9sIUzzgPI4JsbeXDZZtQ8C/9C4yOIHLrlP3fdmsU2Pghk57GzmULEAABG
 pWvt5UBTT0uENeVYQ/QFS1hU6upjNSwYh2l4THgC8WXfn9N2L/YrFzJPveW68/JzkVao
 6/a5KAb2v8HehVkRpWgVkzObSNvg3q/Pvd/SYuipMsI224SnZ8u6TMxPJTjywnu3gCOv
 Uk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28hEgZsH1Lw6BO+XOV0Mxi/G5PLUb05cF7tcDh+gdMQ=;
 b=e/kz04MS0SENaYWABtagfM4IVp19ZlQTykARi/nqeGtEgY7dzQJKsAcRJKuj2j/cd6
 16WVHlXum5jj6SBOWITByVmTEPLe+oMnIhQBUeGEUuLLxQAzTBZ5KViZw77JtUcFLv4i
 n8chwXLjYVQtR/KmLyzK69cvnl2DNrnp/Y0Jj4VmU9yNVS9YpdKntb9nhWW3FQneX5XS
 xIdgaS4Oiv1wvge31S/YuhCoO1KJ38A23u062Y8+yMSqMJ8g1j1dxCV/DXaSVgsyc84L
 sdizOUzCfN8UQqoomCLEL6ZG6Vy16pC3fRiCQDLj9H/tF2OhGYTYr0xlfMJpVu6XJLsO
 83mA==
X-Gm-Message-State: AOAM531Gc0B9eXMV4DdkDrcRYLnFOhSvNOmQlP+L386prC/cdD6ix/eK
 o4aHIH9Z2Fa4fHCS0D6J52rm6sQ7g4qoY422kCGQl5Kd
X-Google-Smtp-Source: ABdhPJyFVh/4KE8vjq+OWjYqKGRundu++XbvDVyXKJxSHLw/dtIluV+e8+VX3fJJVeO2URHCfAFX/5TVMuAmMBsjDzg=
X-Received: by 2002:a2e:7f04:: with SMTP id a4mr1911659ljd.114.1590679867716; 
 Thu, 28 May 2020 08:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-2-ian.jackson@eu.citrix.com>
In-Reply-To: <20200519190230.29519-2-ian.jackson@eu.citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 28 May 2020 11:30:56 -0400
Message-ID: <CAKf6xpt-0MRhFnQz2VBfdYEgE8GtPCj=mK+t-aQ88uTsJtL_sw@mail.gmail.com>
Subject: Re: [OSSTEST PATCH 01/38] ts-logs-capture: Cope if xl shutdown leaves
 domain running for a bit
To: Ian Jackson <ian.jackson@eu.citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 3:03 PM Ian Jackson <ian.jackson@eu.citrix.com> wrote:
>
> This seems mostly to affect buster but it could in principle affect
> earlier releases too I think.
>
> In principle it would be nice to fix this bug, and to have a proper
> test for it, but a reliable test is hard and an unreliable one is not
> useful.  So I guess we are going to have this workaround
> indefinitely...

`xl shutdown -w` waits for either domain shutdown or destruction in
wait_for_domain_deaths()
https://github.com/xen-project/xen/blob/master/tools/xl/xl_vmcontrol.c#L183

My understanding is shutdown happens first when the guest stops and
destruction happens afterward when all the resources are cleaned up.
So your race is that the domain shutdown, but it still shows up in `xl
list` since it hasn't been destroyed.

OpenXT has a hack to only wait for destruction
https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/files/xl-shutdown-wait-for-domain-death.patch.
I didn't write it, and the explanation isn't specific, but I think the
purpose is to all resources are released before the OpenXT toolstack
proceeds with (blktap) cleanup.

Maybe a new `xl shutdown` flag to wait for domain destruction would be
worthwhile?

Regards,
Jason

