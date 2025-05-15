Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3648FAB93DD
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 04:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986028.1371799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkN6-00022X-8g; Fri, 16 May 2025 02:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986028.1371799; Fri, 16 May 2025 02:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFkN6-00020Z-62; Fri, 16 May 2025 02:00:24 +0000
Received: by outflank-mailman (input) for mailman id 986028;
 Thu, 15 May 2025 23:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bU70=X7=a-greve.de=andreas.greve@srs-se1.protection.inumbo.net>)
 id 1uFhbn-0004tS-0I
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 23:03:23 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca6c2fcd-31e0-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 01:03:19 +0200 (CEST)
Received: from dmzmail.linux.bogus by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
 with ESMTPSA id 6293ac14FN3IBrs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Fri, 16 May 2025 01:03:18 +0200 (CEST)
Received: from [192.168.5.100] (p5081988a.dip0.t-ipconnect.de [80.129.152.138])
 (authenticated bits=0)
 by dmzmail.linux.bogus (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTPSA id
 54FN38kG191780
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
 Fri, 16 May 2025 01:03:16 +0200
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
X-Inumbo-ID: ca6c2fcd-31e0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747350198; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gnqLKZjo2+SI0J0JvgVGZmS2e/6SYoOPVlF/UAa4tV++feygAUrI6XL5XSMxcr5rze
    iUZ0RvLoZGVTd9zrh2kZGhCQLMAKexaSOIb2xis1bel+/9RORUjFT6UQYYvuK7jnH5z0
    KYMwwVtvIqnO8ydRtPRb+2ztU4wxTMKa3ZDE/Cs2v/Uo8aI+aCm4G56pY7NAQ8KPwb87
    Aht+eVenV5lqOuJR1jF6CMvQiW/DytybsCi3ICv4TUqOVonJkkgw70u0yopzV6h1f3au
    RyAsSLqbIoVuB9wOqGexsRugab9cTFnMZg85z/3YVafycaecMPSgpPwt5Ze6LPhu63QJ
    dP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1747350198;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Subject:From:Reply-To:Date:Message-ID:Cc:Date:From:Subject:
    Sender;
    bh=0FXnIEHjYxqW8hyrXxxMV/ZdkaLrnI8X5H5zMmAGqPU=;
    b=h2Ansqa+IKAczNyDnMh6ivC2ZqZj6NA6bCD1zl3jH6J1WtcRfaAgQCWCV8L/tmQytj
    eFaGB9QBgJec34c0g+BrbkpKmRJQN4z3gpStl21waycyLuqabpxVxmg2gFjC672gxMIk
    rMk4OWc76QbhUKSRDkXj0YTDzd1rC257YEnbgENhyp+fwvjaRH9jFeLOVo6qzPv9nNbo
    JPpkRtpj7qFWk63KLEnskUNxA98LKMRRSf7F9MpYjypzB4blLmUNApXtwkJEl9JV58HR
    10hCe5ONxnoXaiRmcXlMuaA9LOLoyycPswZAEUD5vaSTG9m/lf32mnfCuhyNdyHv6JgM
    mBxw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1747350198;
    s=strato-dkim-0002; d=a-greve.de;
    h=Cc:To:Subject:From:Reply-To:Date:Message-ID:Cc:Date:From:Subject:
    Sender;
    bh=0FXnIEHjYxqW8hyrXxxMV/ZdkaLrnI8X5H5zMmAGqPU=;
    b=ro0/zogdUaDWT/EE7/UhWaYIIrmC4iQcBoUkq/3ccRsBPkgLxIBWZlVmORgUb5q5JZ
    YqysZRGc4CL376U3lu3DTLy2rcrHQJleYKK0Flb/dgTm5ve0nxREP6JkBSTIqExmDAC8
    cYFkrft9dlcGseFRSB2IniL1IXrC8anaos4MYVsyrUsHNBWfTofU7JbjC+9UAYSG8aOO
    o1Lm2EA8ODRi76TQ96bGzRtTnFZ1EmYONCigMUULRr44vNbV8q3pKCp50UuZlz2IWDbD
    SMZRyTmLtlENFb+Srdje90ltUtRBQVaqwjXcBCmpkqoLOuUJm8jozaZvavGzsoPluZDF
    JGbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1747350198;
    s=strato-dkim-0003; d=a-greve.de;
    h=Cc:To:Subject:From:Reply-To:Date:Message-ID:Cc:Date:From:Subject:
    Sender;
    bh=0FXnIEHjYxqW8hyrXxxMV/ZdkaLrnI8X5H5zMmAGqPU=;
    b=Jejqc1SXphtQ8h9gzCM31bQ+0qNtrH7AzXFD9msjT01VYoHzlbLiFsS7joJPlqJppT
    NZEjo0o3mK+rRvz5pgCA==
X-RZG-AUTH: ":I3kQck+hdfi/FoX876SYvGxtQu+BXCDuSQ9UENFBFhpuMtcK2yjIjEY8XWHyellWhOLE"
Content-Type: multipart/alternative;
 boundary="------------J0QUdqluwGoGMIdUgmpyUTtv"
Message-ID: <f74668db-52fd-4575-8372-7bfdf10d62ac@a-greve.de>
Date: Fri, 16 May 2025 01:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: andreas.greve@a-greve.de
Content-Language: en-US
From: Andreas Greve <andreas.greve@a-greve.de>
Subject: BUG kernel 6.12.19 defautl_swiotlb_limit() returns wrong value for
 CONFIG_SWIOTLB_DYNAMIC=y effects atm only under XEN dom0
To: xen-devel@lists.xenproject.org
Cc: andreas.greve@a-greve.de
Content-Transfer-Encoding: 8bit

This is a multi-part message in MIME format.
--------------J0QUdqluwGoGMIdUgmpyUTtv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello to all,

please excuse my bad English and I hope this is the right List.

In Xen 4.20 kernel 6.12.19  Xen with CONFIG_SWIOTLB_DYNAMIC enabled I 
could not load the xhci driver for  my ASMEDIA ASM1042 usb3 controller 
in dom0.

it always failes with -EOI (-5) in dma_set_mask (struct device *dev, u64 
mask) from kernel/dma/mapping.c when it is called with mask = 
DMA_BIT_MASK(32). dma_set_mask is called by xhci_gen_setup(struct 
usb_hcd *hcd, xhci_get_quirks_t get_quirks) from drivers/usb/host/xhci.c

The reason is that the function dma_supported(dev, mask) from mapping.c 
calling ops->dma_supported(dev, mask) which is 
xen_swiotlb_dma_supported(struct device *hwdev, u64 mask) in 
drivers/xen/swiotlb-xen.c failed.

The function xen_swiotlb_dma_supported fails at return 
xen_phys_to_dma(hwdev, default_swiotlb_limit()) <= mask ; because
xen_phys_to_dma(hwdev, default_swiotlb_limit()) returns 
INVALID_P2M_ENTRY which is greater then mask (DMA_BIT_MASK(32)).

The reason is that the function default_swiottlb_limit() defined in 
./kernel/dma/swiotlb.c as

/**
  * default_swiotlb_limit() - get the address limit of the default SWIOTLB
  *
  * Get the highest physical address used by the default software IO TLB 
pool.
  */
phys_addr_t default_swiotlb_limit(void)
{
#ifdef CONFIG_SWIOTLB_DYNAMIC
     return io_tlb_default_mem.phys_limit;
#else
     return io_tlb_default_mem.defpool.end - 1;
#endif
}

returns in case of CONFIG_SWIOTLB_DYNAMIC=y io_tlb_default_mem.phys_limit.

io_tlb_default_mem.phys_limit points to the end (0x83effffff) of the 
highest Xen usable memory region which is on my system 83effffff

BIOS-provided physical RAM map:
[....]
Xen: [mem 0x0000000100001000-0x000000083effffff] usable
[....]

In the boot phase this address is always mapped in p2m to 
INVALID_P2M_ENTRY. I have never seen that it is mapped to a valid 
machine address.

When  CONFIG_SWIOTLB_DYNAMIC  is not set the function 
default_swiotlb_limit() returns io_tlb_default_mem.defpool.end - 1 which 
maps to a value less than DAM_BIT_MASK(32).

In a non -Xen environment, the error for my system does not occur 
because the ASM1042 is there handled via an IOMMU path. IMO the problem 
described above also exists there.

Also my radeon (Radeon HD 4550 RV710) driver compiled in  coming from  
radeon_device_init  over dma_set_mask fails with -EOI (-5) .

  I see 2 possible solutions:

Atm the function default_swiotlb_limit() is only used at one place in 
swiotlb-xen.c (fgrep over  kernel source today master branch)

1) if I take the function comment

* Get the highest physical address used by the default software IO TLB pool.

of default_swiotlb_limit() literally I would replace return 
io_tlb_default_mem.phys_limit; with return 
io_tlb_default_mem.defpool.end - 1;

or writing a new function default_swiotlb_current_limit() with that content.

2) I would have to iterate over the list io_tlb_default_mem.pools to 
find the highest mapped address or writing a new function 
default_swiotlb_current_limit() with that content.

I would prefer 1) I because less work, less errors susceptible and more 
efficient. Since I do not have the necessary overview and there could be 
side effects, I need your help with the decision.

Thanks in advance

Andreas

--------------J0QUdqluwGoGMIdUgmpyUTtv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello to all,</p>
    <p><span class="t_text">please excuse my bad English and I hope this
        is the right List.</span></p>
    <p>In Xen 4.20 kernel 6.12.19  Xen with CONFIG_SWIOTLB_DYNAMIC
      enabled I could not load the xhci driver for  my ASMEDIA ASM1042
      usb3 controller in dom0.</p>
    <p>it always failes with -EOI (-5) in dma_set_mask (struct device
      *dev, u64 mask) from kernel/dma/mapping.c when it is called with
      mask = DMA_BIT_MASK(32). dma_set_mask is called by
      xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
      from drivers/usb/host/xhci.c</p>
    <p>The reason is that the function dma_supported(dev, mask) from mapping.c
      calling ops-&gt;dma_supported(dev, mask) which is
      xen_swiotlb_dma_supported(struct device *hwdev, u64 mask) in
      drivers/xen/swiotlb-xen.c failed.<br>
    </p>
    <p>The function xen_swiotlb_dma_supported fails at return
      xen_phys_to_dma(hwdev, default_swiotlb_limit()) &lt;= mask ; 
      because<br>
      xen_phys_to_dma(hwdev, default_swiotlb_limit()) returns
      INVALID_P2M_ENTRY which is greater then mask (DMA_BIT_MASK(32)).</p>
    <p>The reason is that the function default_swiottlb_limit() defined
      in ./kernel/dma/swiotlb.c as<br>
    </p>
    <p>/**<br>
       * default_swiotlb_limit() - get the address limit of the default
      SWIOTLB<br>
       *<br>
       * Get the highest physical address used by the default software
      IO TLB pool.<br>
       */<br>
      phys_addr_t default_swiotlb_limit(void)<br>
      {<br>
      #ifdef CONFIG_SWIOTLB_DYNAMIC<br>
          return io_tlb_default_mem.phys_limit;<br>
      #else<br>
          return io_tlb_default_mem.defpool.end - 1;<br>
      #endif<br>
      }<br>
    </p>
    <p>returns in case of CONFIG_SWIOTLB_DYNAMIC=y  
      io_tlb_default_mem.phys_limit.</p>
    <p>io_tlb_default_mem.phys_limit points to the end (0x83effffff) of
      the highest Xen usable memory region which is on my system
      83effffff</p>
    <p>BIOS-provided physical RAM map:<br>
      [....]<br>
      Xen: [mem 0x0000000100001000-0x000000083effffff] usable <br>
      [....]<br>
      <br>
      In the boot phase this address is always mapped in p2m to 
      INVALID_P2M_ENTRY. I have never seen that it is mapped to a valid
      machine address.<br>
      <br>
      When  CONFIG_SWIOTLB_DYNAMIC  is not set the function
      default_swiotlb_limit() returns io_tlb_default_mem.defpool.end - 1
      which maps to a value less than DAM_BIT_MASK(32).</p>
    <p>In a non -Xen environment, the error for my system does not occur
      because the ASM1042 is there handled via an IOMMU path. <span
        class="t_text">IMO the problem described above also exists
        there.</span> </p>
    <p>Also my radeon (Radeon HD 4550 RV710) driver compiled in  coming
      from  radeon_device_init  over dma_set_mask fails with -EOI (-5) .</p>
    <p> I see 2 possible solutions:</p>
    <p>Atm the function default_swiotlb_limit() is only used at one
      place in swiotlb-xen.c (fgrep over  kernel source today master
      branch)<br>
    </p>
    <p>1) if I take the function comment </p>
    <p>* Get the highest physical address used by the default software
      IO TLB pool.</p>
    <p>of default_swiotlb_limit() literally I would replace return
      io_tlb_default_mem.phys_limit; with return
      io_tlb_default_mem.defpool.end - 1;</p>
    <p>or writing a new function default_swiotlb_current_limit() with
      that content.<br>
    </p>
    <p>2) I would have to iterate over the list io_tlb_default_mem.pools
      to find the highest mapped address or writing a new function
      default_swiotlb_current_limit() with that content.</p>
    <p>I would prefer 1) I because less work, less errors susceptible
      and more efficient. <span class="t_text">Since I do not have the
        necessary overview and there could be side effects, I need your
        help with the decision.</span></p>
    <p><span class="t_text">Thanks in advance <br>
      </span></p>
    <p><span class="t_text">Andreas<br>
      </span> </p>
  </body>
</html>

--------------J0QUdqluwGoGMIdUgmpyUTtv--

