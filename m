Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A037EAFD
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 00:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126434.238016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgx0U-0005H1-5c; Wed, 12 May 2021 22:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126434.238016; Wed, 12 May 2021 22:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgx0U-0005F8-2I; Wed, 12 May 2021 22:07:06 +0000
Received: by outflank-mailman (input) for mailman id 126434;
 Wed, 12 May 2021 22:07:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgx0R-0005F2-SL
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 22:07:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6267f5b-bd3a-4848-b317-64ab73a25fd7;
 Wed, 12 May 2021 22:07:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C87C613AA;
 Wed, 12 May 2021 22:07:02 +0000 (UTC)
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
X-Inumbo-ID: c6267f5b-bd3a-4848-b317-64ab73a25fd7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620857222;
	bh=hANkI4E4tNm24CJOT0/c7D0tOgMRUGt021MU/plpymE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=exiaxCv9qX58Cxft4/eqVcnAfA8WMg/sv43qX1+9o892F2kQuJt4w2NoOXrYmwPIa
	 jMkHHE7YvYny92pYoNXITjs03OJ5SHx8WEVHtxP7exeDkN9/aVPwugENJUKLj08j/+
	 WsfCJmbU8Be4tFAJqTQwnnuAA7vHIFsfNS2zDPSkj74F7FdYtHoDC4v0IoRKGNzrvS
	 G00yNWD+ztnhyNjVy1A/YHzIe7s2ey681xU4NblfIKfr70+Q7Tt6TlLEMgOSlVRJgc
	 V/kg0ooZZAMUSUsadkT6umE6quRLAkpOEt0RudsinWz8+mr/TbY125anudW+yqjaup
	 gkBvunzWoTUXw==
Date: Wed, 12 May 2021 15:07:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 09/15] xen/arm32: mm: Re-implement setup_xenheap_mappings()
 using map_pages_to_xen()
In-Reply-To: <20210425201318.15447-10-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105121506300.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-10-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1423833101-1620857222=:5018"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1423833101-1620857222=:5018
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() call by map_pages_to_xen() call.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> 
>     TODOs:
>         - add support for contiguous mapping
> ---
>  xen/arch/arm/mm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 5c17cafff847..19ecf73542ce 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -806,7 +806,12 @@ void mmu_init_secondary_cpu(void)
>  void __init setup_xenheap_mappings(unsigned long base_mfn,
>                                     unsigned long nr_mfns)
>  {
> -    create_mappings(xen_second, XENHEAP_VIRT_START, base_mfn, nr_mfns, MB(32));
> +    int rc;
> +
> +    rc = map_pages_to_xen(XENHEAP_VIRT_START, base_mfn, nr_mfns,
> +                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to setup the xenheap mappings.\n");
>  
>      /* Record where the xenheap is, for translation routines. */
>      xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;

I get the following build error:

mm.c: In function ‘setup_xenheap_mappings’:
mm.c:811:47: error: incompatible type for argument 2 of ‘map_pages_to_xen’
     rc = map_pages_to_xen(XENHEAP_VIRT_START, base_mfn, nr_mfns,
                                               ^~~~~~~~
In file included from mm.c:24:0:
/local/repos/xen-upstream/xen/include/xen/mm.h:89:5: note: expected ‘mfn_t {aka struct <anonymous>}’ but argument is of type ‘long unsigned int’
 int map_pages_to_xen(
     ^~~~~~~~~~~~~~~~

I think base_mfn needs to be converted to mfn_t
--8323329-1423833101-1620857222=:5018--

