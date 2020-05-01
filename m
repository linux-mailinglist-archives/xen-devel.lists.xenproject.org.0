Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B288E1C12AB
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 15:13:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUVSV-0000pT-OC; Fri, 01 May 2020 13:12:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUVSU-0000pN-Dj
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 13:12:02 +0000
X-Inumbo-ID: 58340404-8bad-11ea-9887-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58340404-8bad-11ea-9887-bc764e2007e4;
 Fri, 01 May 2020 13:12:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g13so11471095wrb.8
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 06:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8djvSfIVuW/VL/354hClW0MbL2pbkL5s0sSCO0T6GYc=;
 b=MqGqXop5oj/pV1ASxcMu9Dc7bYGO6aRrRbgjjRkWgOZpSxee5XBCA5Jq0yQYgMwdK2
 VWDqKNxrEsb2zYEhi5iFcD+eEMgvxpci9rJ80QJ4d0n7DxkX4Wtqp90/S9iwOvUR1fk3
 qs7DIdfNzRYa5HxYUGvFJLFCHs1Yym6hGnuyyz8jge+Qjl5i8lI5VuvvWSvhQySAbSId
 Zuzks2p6QtKxR3Cf7lO9PnOqVppY/olzWiUaZmimEmBnn7wGoWIPmUmtMqN73Tegk8hd
 B7dxepJKYajSXyAplyi5iFR0XvqYrsqF2rsLf28NWbp3p4K0wHh1AGlgA4iqCLY0KCJw
 ujHQ==
X-Gm-Message-State: AGi0PuaqyK7WWaU0zBfUxn7jLeEUf2SCAH7gLIYYDoTfr9YrKlnoFrqN
 4HoA3oJiS0RIv4fJ6oeyOWU=
X-Google-Smtp-Source: APiQypIBZcA1otiDxaAWN4u+D1Gz827BaSrDQFlDNc0lMqgLfZTygUHuzT5m0t4Ud1I1oRoYaELLkg==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr4317019wrw.139.1588338721041; 
 Fri, 01 May 2020 06:12:01 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 92sm4563957wrm.71.2020.05.01.06.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 06:12:00 -0700 (PDT)
Date: Fri, 1 May 2020 13:11:58 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Subject: Re: [PATCH 11/16] x86: add a boot option to enable and disable the
 direct map
Message-ID: <20200501131158.utexymcn3lnt65qp@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
 <20200501121132.kzhu7u2vmpoeju2x@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <2235f884b65c9f20cf55637f91ddab6924f53ca1.camel@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2235f884b65c9f20cf55637f91ddab6924f53ca1.camel@xen.org>
User-Agent: NeoMutt/20180716
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 01, 2020 at 01:59:24PM +0100, Hongyan Xia wrote:
> On Fri, 2020-05-01 at 12:11 +0000, Wei Liu wrote:
> > On Thu, Apr 30, 2020 at 09:44:20PM +0100, Hongyan Xia wrote:
> > > From: Hongyan Xia <hongyxia@amazon.com>
> > > 
> > > Also add a helper function to retrieve it. Change
> > > arch_mfn_in_direct_map
> > > to check this option before returning.
> > > 
> > > This is added as a boot command line option, not a Kconfig. We do
> > > not
> > > produce different builds for EC2 so this is not introduced as a
> > > compile-time configuration.
> > 
> > Having a Kconfig will probably allow the compiler to eliminate dead
> > code.
> > 
> > This is not asking you to do the work, someone can come along and
> > adjust 
> > arch_has_directmap easily.
> 
> My original code added this as a CONFIG option, but I converted it into
> a boot-time switch, so I can just dig out history and convert it back.
> I wonder if we should get more opinions on this to make a decision.

Form my perspective, you as a contributor has done the work to scratch
your own itch, hence I said "not asking you to do the work". I don't
want to turn every comment into a formal ask and eventually lead to
feature creep.

> 
> I would love Xen to have static key support though so that a boot-time
> switch costs no run-time performance.
> 

Yes that would be great.

Wei.

> Hongyan
> 

