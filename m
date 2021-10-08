Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0142732D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 23:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204889.360082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYxh9-0001Wy-I4; Fri, 08 Oct 2021 21:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204889.360082; Fri, 08 Oct 2021 21:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYxh9-0001UD-Eh; Fri, 08 Oct 2021 21:46:23 +0000
Received: by outflank-mailman (input) for mailman id 204889;
 Fri, 08 Oct 2021 21:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79mX=O4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYxh8-0001U7-7q
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 21:46:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba2c7331-fc69-4a0f-82cb-31e9bdb17cf1;
 Fri, 08 Oct 2021 21:46:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 507B260FE3;
 Fri,  8 Oct 2021 21:46:20 +0000 (UTC)
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
X-Inumbo-ID: ba2c7331-fc69-4a0f-82cb-31e9bdb17cf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633729580;
	bh=GdXDD10ZUr070vfQaw5xvKCe/blUKcPOEf3h8T0oBuo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eOCq8letN40zgYkImhSytRrgqcsyHkYv9bgjWahmQ1Ph6E+mqRATbcts06OfLo/z/
	 5iIOTDZkMOpI1LfHoBirlCtqWdfFyEHdAZ1cyFjYJWIF0YFIW3/imq8epOvKn78dnH
	 /6vC5fCphvNX/Sb+MBVbXudaJaqdHsu8F7OJbtalFim9YwtEkhzdwnwSIBtB0X6wec
	 B6HZl4Zz0y3VBytZ8se/J7XoqtNhcxHVsv0CgVVl/zdbjHCnRgUp2AdClMhzdY48Aj
	 SZ+I7uHq9ncd9hragPPSgxYbeHv0vKufQYhQLFlJr2kjeMe5NEvx3Le8Aa80gcvizi
	 dC0MyaSYffQdQ==
Date: Fri, 8 Oct 2021 14:46:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Rahul Singh <rahul.singh@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andre Przywara <Andre.Przywara@arm.com>, 
    Christian Lindig <christian.lindig@citrix.com>, 
    David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci
 flag
In-Reply-To: <CAJ=z9a2kYdYB9fSXX8NhLk90px03z8+D-YE5AQKW9uABx9kvrQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2110081433110.25528@sstabellini-ThinkPad-T480s>
References: <cover.1633540842.git.rahul.singh@arm.com> <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com> <548fa153-b2e3-7f91-c7c9-a569e13b5809@citrix.com> <CAJ=z9a2kYdYB9fSXX8NhLk90px03z8+D-YE5AQKW9uABx9kvrQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2142132412-1633729349=:25528"
Content-ID: <alpine.DEB.2.21.2110081443090.25528@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2142132412-1633729349=:25528
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110081443091.25528@sstabellini-ThinkPad-T480s>

On Fri, 8 Oct 2021, Julien Grall wrote:
> Hi Andrew,
> 
> On Fri, 8 Oct 2021, 20:07 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:
>       On 06/10/2021 18:40, Rahul Singh wrote:
>       > Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
>       > Reject the use of this new flag for x86 as VPCI is not supported for
>       > DOMU guests for x86.
>       >
>       > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>       > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>       > Acked-by: Christian Lindig <christian.lindig@citrix.com>
> 
>       I'm afraid this logic is broken.
> 
>       There's no matching feature to indicate to the toolstack whether
>       XEN_DOMCTL_CDF_vpci will be accepted or not.  The usual way of doing
>       this is with a physinfo_cap field.
> 
> 
> I am slightly puzzled by this. I am assuming you are referring to XENVER_get_features which AFAICT is a stable interface. So why should we
> use it to describe the presence of an unstable interface?
> 
> 
>       This flag needs using in Patch 10 to reject attempts to create a VM with
>       devices when passthrough support is unavailable.
> 
> 
> May I ask why we can't rely on the hypervisor to reject the flag when suitable?
> 
> 
>       Ian, for the 4.16 release, this series either needs completing with the
>       additional flag implemented, or this patch needs reverting to avoid us
>       shipping a broken interface.
> 
> 
> I fail to see how the interface would be broken... Would you mind to describe a bit more what could go wrong with this interface?


After chatting with Andrew on IRC, this is my understanding.

Today if pci=[] is specified in the VM config file then
XEN_DOMCTL_CDF_vpci is added. If Xen doesn't support it, Xen returns
an error but libxl/xl won't be able to tell exactly why it fails. So xl
will end up printing a generic VM creation failure. Andrew would like to
see something like the following in libxl:

if ( PCI_devices && !cap.vcpi )
    error("Sorry - PCI not supported")

So that the user gets a clear informative error back rather than a
generic VM creation failure. Also, this is a requirement for the stable
hypercall interface.


I think that's fine and we can implement this request easily by adding
XEN_SYSCTL_PHYSCAP_vpci. Rahul or Bertrand, are you guys happy with
doing that? Otherwise I could take it on.


As a side note, given that PCI passthrough support is actually not yet
complete on ARM, we could even just do the following in xl/libxl:

if ( PCI_devices )
    error("Sorry - PCI not supported")

or temporarily remove XEN_DOMCTL_CDF_vpci until PCI passthrough gets
finalized.
--8323329-2142132412-1633729349=:25528--

