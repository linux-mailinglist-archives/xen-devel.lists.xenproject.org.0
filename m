Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D7EC9459
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn5M-0001gV-Fs; Wed, 02 Oct 2019 22:27:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn5K-0001g4-Vu
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 22:27:03 +0000
X-Inumbo-ID: c1809d3c-e563-11e9-971d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c1809d3c-e563-11e9-971d-12813bfff9fa;
 Wed, 02 Oct 2019 22:27:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F1F12133F;
 Wed,  2 Oct 2019 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055222;
 bh=nIye4fkhfu48F5u4MCIDKtPtXJpOYs+JAmhCcePXZ9s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=E0iMGMlz+A6GXZNHDOfZVK7AugPGugAPcKkcwB4X328mM1LqpBgc/xaxX0MCD+XLC
 xGmOYzcsE+GaY3sMSV2tEXbQnEhW15iw79bIXwCHluIOreq+19GUrs/rZd7mZ031vC
 UE2JwLp5jHzWQ0BescY5FAXImpY/O1lNA+mVgSeE=
Date: Wed, 2 Oct 2019 15:27:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <66e897d7-d46f-1191-1ff4-492eff872efe@arm.com>
Message-ID: <alpine.DEB.2.21.1910021504280.2691@sstabellini-ThinkPad-T480s>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-4-julien.grall@arm.com>
 <85006b86-5a6b-5f36-cf02-a2a2a08fcbf6@citrix.com>
 <66e897d7-d46f-1191-1ff4-492eff872efe@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-220250326-1570052710=:2691"
Content-ID: <alpine.DEB.2.21.1910021504250.2691@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH for-4.13 3/6] xen/arm: cpuerrata: Match
 register size with value size in check_workaround_*
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Artem_Mygaiev@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-220250326-1570052710=:2691
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1910021504251.2691@sstabellini-ThinkPad-T480s>

On Wed, 2 Oct 2019, Julien Grall wrote:
> Hi Andrew,
> 
> On 10/2/19 7:42 PM, Andrew Cooper wrote:
> > On 02/10/2019 19:00, Julien Grall wrote:
> > > Clang is pickier than GCC for the register size in asm statement. It
> > > expects the register size to match the value size.
> > > 
> > > The asm statement expects a 32-bit (resp. 64-bit) value on Arm32
> > > (resp. Arm64) whereas the value is a boolean (Clang consider to be
> > > 32-bit).
> > > 
> > > It would be possible to impose 32-bit register for both architecture
> > > but this require the code to use __OP32. However, it does not really
> > > improve the assembly generated. Instead, replace switch the variable
> > > to use register_t.
> > > 
> > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > 
> > > ---
> > >      Changes in v2:
> > >          - Use !! per Stefano's request
> > 
> > You are aware that unlikley(), deliberately, has an embedded !! ?
> 
> I forgot it, sorry about that :/. Stefano are you happy if I revert to v1?

I forgot about that too. Yes, that's fine and add my acked-by.


> > 
> > include/xen/compiler.h:11:#define unlikely(x)   __builtin_expect(!!(x),0)
> > 
> > ~Andrew
--8323329-220250326-1570052710=:2691
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-220250326-1570052710=:2691--

