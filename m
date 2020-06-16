Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D661FC246
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 01:28:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlKzo-0003LI-QI; Tue, 16 Jun 2020 23:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jlKzm-0003LD-W8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 23:27:59 +0000
X-Inumbo-ID: 0334a2f6-b029-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0334a2f6-b029-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 23:27:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 654442078D;
 Tue, 16 Jun 2020 23:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592350077;
 bh=keyhVpc8dVr2vcXxFMMrlOclLA7NkXX0gWNtYmIEn/M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=sDZiseqCPS96EjDjWsp2G+hSdqpLETKG7Wx2kXFeKugC1sJNF9I2FPvsRzgJtSeTD
 6wcbD2VMkbbFXi2rlOaI4odC17MBKi/1RHNHwAQK1PmyOshf71u1+0bRgRUIYdknU8
 lVl4zOtrKWw7T2Zo/N1R8OOvpXuM/qu5xhq+XQzI=
Date: Tue, 16 Jun 2020 16:27:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen/arm: Mitigate straight-line speculation for SMC
 call
In-Reply-To: <7b21fb8d-915c-7d87-1777-b0ed0febddd2@citrix.com>
Message-ID: <alpine.DEB.2.21.2006161626560.24982@sstabellini-ThinkPad-T480s>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-3-julien@xen.org>
 <alpine.DEB.2.21.2006161425480.24982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a0Wo2Vz=q-ApY-16p4xBnDckUhe73z9v4W4av7FmwMjKQ@mail.gmail.com>
 <7b21fb8d-915c-7d87-1777-b0ed0febddd2@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-206843476-1592350077=:24982"
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
 Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Xen.org security team" <security@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-206843476-1592350077=:24982
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 Jun 2020, Andrew Cooper wrote:
> On 16/06/2020 22:57, Julien Grall wrote:
> > On Tue, 16 Jun 2020 at 22:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >> On Tue, 16 Jun 2020, Julien Grall wrote:
> >>> From: Julien Grall <jgrall@amazon.com>
> >>>
> >>> SMC call will update some of registers (typically only x0) depending on
> >>   ^a SMC call
> 
> An SMC call.
> 
> >>
> >>> the arguments provided.
> >>>
> >>> Some CPUs can speculate past a SMC instruction and potentially perform
> >>> speculative access to emrmoy using the pre-call values before executing
> >>                         ^ memory
> >>
> >>> the SMC.
> >>>
> >>> There is no known gadget available after the SMC call today. However
> >>> some of the registers may contain values from the guest and are expected
> >>> to be updated by the SMC call.
> >>>
> >>> In order to harden the code, it would be better to prevent straight-line
> >>> speculation from an SMC. Architecturally executing the speculation
> >>                    ^ a? any?
> > "any" might be better.
> 
> "an SMC" is correct, but "any" is also fine.
> 
> 'a' vs 'an' is based on the sound of the following.  S in "S-M-C" as an
> abbreviation starts with an 'e' vowel sound, unlike 's' in secure, so
> the correct grammar is "an SMC" and "a secure monitor call".

LOL! English sometimes... damn.

Anyway, many thanks for the correction :-)

--8323329-206843476-1592350077=:24982--

