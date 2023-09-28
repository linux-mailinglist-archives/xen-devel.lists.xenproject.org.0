Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052857B27BD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 23:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610043.949268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlyuB-0000F0-Q5; Thu, 28 Sep 2023 21:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610043.949268; Thu, 28 Sep 2023 21:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlyuB-0000Ce-N2; Thu, 28 Sep 2023 21:50:43 +0000
Received: by outflank-mailman (input) for mailman id 610043;
 Thu, 28 Sep 2023 21:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlyu9-0000CY-T0
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 21:50:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 107499b5-5e49-11ee-878b-cb3800f73035;
 Thu, 28 Sep 2023 23:50:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 58420B81DC7;
 Thu, 28 Sep 2023 21:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DAEC433C8;
 Thu, 28 Sep 2023 21:50:37 +0000 (UTC)
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
X-Inumbo-ID: 107499b5-5e49-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695937838;
	bh=KYNUa5ryU0RL0VJ175+q3fCUjAGzW34k7+kEkZSv/m8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pac2YD7kwhmZKRLAvnTbcbxfm4j6pUCdNwi4UgUk+xbF0alVHMhWsVmYb4+wowDzq
	 yTiMhxOjGwE+Z+7/amHFntDGjYFo5/GW1fJ7f29NIBs8oHxd/B8RWs1Ei7z+cAIq0o
	 zidCBsq0ZZagQH7Zyh0ZbmV/pJuwwebT+t4LzJguiGHnuL7QpO73avqSBAldVRQk0P
	 C39H6vKq8tB9ixEe2V96vMnbzE+p1KuFwMTjjUpo5786I9Pf8FaMxXOK7EJe/QGVBA
	 mIhcRh9o3/cuj9fboPa8A/BL9DdlnlBC6QNX9uETnDprjjz4thkWMJEwD+PKbNqKML
	 ipiYU0jsWjwug==
Date: Thu, 28 Sep 2023 14:50:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleg Nikitenko <oleshiiwood@gmail.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com
Subject: Re: changing Dom0 data during smc call inside of xen during cache
 coloring
In-Reply-To: <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2309281447180.1996340@ubuntu-linux-20-04-desktop>
References: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com> <dba88398-3aef-4541-a8e8-8fd075c0d40e@xen.org> <CA+SAi2tHLVDj+q8KMD7OuhHoj0sSZ-39qs3Z94WGmL2OA3TM_g@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2062875528-1695937640=:1996340"
Content-ID: <alpine.DEB.2.22.394.2309281447310.1996340@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2062875528-1695937640=:1996340
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309281447311.1996340@ubuntu-linux-20-04-desktop>

On Thu, 28 Sep 2023, Oleg Nikitenko wrote:
> Hello Julien,
> 
> I am still fighting with xen Cache Coloring with aes.
> When I sent a request to hardware aes after xen with CC started I got the mistake in CSU.
> When I dumped structure contents on both sides I got the different data.
> Xilinx related contact wrote to me.
> 
> When cache coloring is enabled, Dom0 is not 1:1 mapped (guest physical addresses in Dom0 != physical addresses). If the Xilinx drivers in
> Linux (xcsudma.c) issue EEMI calls with a guest physical address (for instance the address of a memory buffer allocated by Linux), then
> this address is no longer a physical address and would need to be translated. EEMI calls always get forwarded to Xen first, then Xen issues
> a corresponding EEMI call to the firmware (see xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi). But Xen is probably passing the EEMI
> calls parameters unmodified. Then PMU tries to read the address but since this is not a physical address, it fails. Basically we need to
> add code to Xen xen/arch/arm/platforms/xilinx-eemi.c:xilinx_eemi to translate any guest physical addresses passed as EEMI calls arguments
> into physical addresses before making the EEMI call to firmware.
> 
> This is an example patch, which is translating the parameter on register x2 for the EEMI call 0xC200002F. I haven't checked the EEMI
> protocol for this call but this just an example to show you how to translate parameters.
> 
> diff --git a/xen/arch/arm/platforms/xilinx-eemi.c b/xen/arch/arm/platforms/xilinx-eemi.c index 500c86dc69..bff1b71196 100644 ---
> a/xen/arch/arm/platforms/xilinx-eemi.c +++ b/xen/arch/arm/platforms/xilinx-eemi.c @@ -409,6 +409,30 @@ bool xilinx_eemi(struct
> cpu_user_regs *regs, const uint32_t fid, } goto forward_to_fw;
> 
>  *  case 0xC200002F:
>  *  {
>  *  uint64_t example_possible_address_param = get_user_reg(regs, 2);
>  *  uint64_t translated_address = mfn_to_maddr(gfn_to_mfn(current->domain,
>  *  gaddr_to_gfn(example_possible_address_param)));
>  *  translated_address += example_possible_address_param & ~PAGE_MASK; +
>  *  arm_smccc_1_1_smc(get_user_reg(regs, 0),
>  *  get_user_reg(regs, 1),
>  *  translated_address,
>  *  get_user_reg(regs, 3),
>  *  get_user_reg(regs, 4),
>  *  get_user_reg(regs, 5),
>  *  get_user_reg(regs, 6),
>  *  get_user_reg(regs, 7),
>  *  &res); +
>  *  set_user_reg(regs, 0, res.a0);
>  *  set_user_reg(regs, 1, res.a1);
>  *  set_user_reg(regs, 2, res.a2);
>  *  set_user_reg(regs, 3, res.a3);
>  *  return true;
>  *  }
> 
> + default: if ( is_hardware_domain(current->domain) ) goto forward_to_fw;
> 
> The aes request structure contains physical addresses of the source and destination.
> These addresses are obtained via two calls dma_alloc_coherent.
> The address of this structure is kept at x2 register.

OK I see the question is about the Xilinx Xen tree. In the logs below we
have:

> (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -> 11432000                                                        log from xen
 
So it looks Linux passed 0 as address in x2, which cannot be right?



> I applied the suggested scheme in xen for xilinx_eemi(...) function.
> 
> case 0xC200002F:
> {
> uint64_t paramaddr = get_user_reg(regs, 2);

It would seem that this is not read correctly? It should not be zero.


> uint64_t phyaddr = mfn_to_maddr(gfn_to_mfn(current->domain, gaddr_to_gfn(paramaddr)));
> phyaddr += (paramaddr & ~PAGE_MASK);
> gprintk(XENLOG_DEBUG, "Forwarding AES operation: %u r2 %lx -> %lx\n", fid, paramaddr, phyaddr);
> set_user_reg(regs, 2, phyaddr);
> }
> goto forward_to_fw;
> 
> As a result I got the same issue as earlier.
> 
> [   17.350086]
> zynq_aes_gcm                                                                                                                        user
> log
> 
> [   17.350202] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @                                                       kernel log from Dom0
> [   17.353015] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
> [   17.358515] zynqmp_aes [0] ffffffc00910d000 2806000 firmware:zynqmp-firmware:zynqmp-aes
> [   17.366546] @ dma_alloc firmware:zynqmp-firmware:zynqmp-aes @
> [   17.372347] @@@ firmware:zynqmp-firmware:zynqmp-aes 0 @@@
> [   17.377775] zynqmp_aes [1] ffffffc009115000 42a14000 keytype 1
> [   17.383660] zynqmp_aes [2] dump request align 1 ++
> [   17.388501] 00 60 80 02 00 00 00 00
> [   17.392032] 50 60 80 02 00 00 00 00
> [   17.395583] 00 00 00 00 00 00 00 00
> [   17.399117] 00 60 80 02 00 00 00 00
> [   17.402664] 40 00 00 00 00 00 00 00
> [   17.406226] 00 00 00 00 00 00 00 00
> [   17.409755] 01 00 00 00 00 00 00 00
> [   17.413311] zynqmp_aes [3] dump request --
> 
> (XEN) d0v1 Forwarding AES operation: 3254779951 r2 0 -> 11432000                                                        log from xen

Here


> @ 000042A14000
> @                                                                                                                                      csu
> log from aes
> 04 E4 00 6F 05 E4 00 6F
> 06 E4 00 6F 07 E4 00 6F
> 10 E4 00 6F 11 E4 00 6F
> 12 E4 00 6F 13 E4 00 6F
> 14 E4 00 6F 15 E4 00 6F
> 16 E4 00 6F 17 E4 00 6F
> 18 E4 00 6F 19 E4 00 6F
> 
> ERROR:   pm_aes_engine ### args 6 ret 0 addr 0 42a14000 ###                                                                ATF log
> 
> So the address of the structure was not changed.
> This is the question. 
> How can I map this address to xen and change physical addresses there ?
--8323329-2062875528-1695937640=:1996340--

