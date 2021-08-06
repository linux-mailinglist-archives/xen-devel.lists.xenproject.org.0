Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694E3E2005
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 02:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164620.300931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBnke-00080U-6S; Fri, 06 Aug 2021 00:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164620.300931; Fri, 06 Aug 2021 00:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBnke-0007ye-2O; Fri, 06 Aug 2021 00:30:16 +0000
Received: by outflank-mailman (input) for mailman id 164620;
 Fri, 06 Aug 2021 00:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EHPq=M5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mBnkc-0007yY-Jc
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 00:30:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ac6aef4-ea1c-4f25-aaef-95eed8a1010c;
 Fri, 06 Aug 2021 00:30:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48E9F61078;
 Fri,  6 Aug 2021 00:30:12 +0000 (UTC)
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
X-Inumbo-ID: 1ac6aef4-ea1c-4f25-aaef-95eed8a1010c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628209812;
	bh=qPrWEsd6Hd430IXZcgKU1JUdKEsmTkemjmcXOGTPFOs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gf+TfalJwGWXt+MLAWy8YAg/nQbNr+lZHO6BY3Fh6/ZyBa9LKzfBrBZWqp8mZBQXf
	 FVEo2AxyoVUnC9Lt1fIvnYIrUJ/aaN5jVCS7oIC5H31Hk98Uwwk5unWsD5c3M8saay
	 wkQPvVVY9QtApZIAw86SjZX5/ZZUpozMmnH/4AO0X0/Vr5E65Z+fnW1RVUNxbfdI1O
	 CAeMBONmtQYGOAwUi6tpzFCIMRpWQlmAGBtyxsWADofASatyNy9eDG3VtiY8a7ZIoT
	 KJ3llJFZt+8sjvk2m4zOLw7F73iYBeOAEjOvdB0O/SlrG9bjKMM1OJV8C5y110x3vO
	 kfisn/QjFm3mQ==
Date: Thu, 5 Aug 2021 17:30:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Oleksandr <olekstysh@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
In-Reply-To: <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
Message-ID: <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com> <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com> <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org> <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com> <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com> <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s> <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com> <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1657779066-1628209334=:18743"
Content-ID: <alpine.DEB.2.21.2108051722290.18743@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1657779066-1628209334=:18743
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2108051722291.18743@sstabellini-ThinkPad-T480s>

On Wed, 4 Aug 2021, Julien Grall wrote:
> > +#define GUEST_SAFE_RANGE_BASE   xen_mk_ullong(0xDE00000000) /* 128GB */
> > +#define GUEST_SAFE_RANGE_SIZE   xen_mk_ullong(0x0200000000)
> > 
> > While the possible new DT bindings has not been agreed yet, I re-used
> > existing "reg" property under the hypervisor node to pass safe range as a
> > second region,
> > https://elixir.bootlin.com/linux/v5.14-rc4/source/Documentation/devicetree/bindings/arm/xen.txt#L10: 
> 
> So a single region works for a guest today, but for dom0 we will need multiple
> regions because it is may be difficult to find enough contiguous space for a
> single region.
> 
> That said, as dom0 is mapped 1:1 (including some guest mapping), there is also
> the question where to allocate the safe region. For grant table, we so far
> re-use the Xen address space because it is assumed it will space will always
> be bigger than the grant table.
> 
> I am not sure yet where we could allocate the safe regions. Stefano, do you
> have any ideas?

The safest choice would be the address range corresponding to memory
(/memory) not already allocated to Dom0.

For instance from my last boot logs:
(XEN) Allocating 1:1 mappings totalling 1600MB for dom0:
(XEN) BANK[0] 0x00000010000000-0x00000070000000 (1536MB)
(XEN) BANK[1] 0x00000078000000-0x0000007c000000 (64MB)

All the other ranges could be given as unallocated space:

- 0x0 - 0x10000000
- 0x70000000 - 0x78000000
- 0x8_0000_0000 - 0x8_8000_0000



The second best choice would be an hole: an address range not used by
anybody else (no reg property) and also not even mappable by a bus (not
covered by a ranges property). This is not the best choice because there
can cases where physical resources appear afterwards.
--8323329-1657779066-1628209334=:18743--

