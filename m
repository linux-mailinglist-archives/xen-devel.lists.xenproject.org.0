Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A6243FE5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 22:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6Jxy-0004mn-Ur; Thu, 13 Aug 2020 20:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jG6=BX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6Jxx-0004mi-Dy
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 20:36:49 +0000
X-Inumbo-ID: e8d37833-d563-4427-a894-74dd260e3167
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8d37833-d563-4427-a894-74dd260e3167;
 Thu, 13 Aug 2020 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=qSKL5d2XGwq1pTxcuQvML6O1tY1bV3mpGZLt+f9jOAM=; b=x8tNI5t1XSYiH4CRFrn+07lvW5
 MbswdplhKmSCGLcv1OLnisOheNAEeq7QiT29unvHgDHrbDVIB4WdAMIAmkZ7zYxBlO2/sQr34iz6G
 mePgG3GdTv42/O8PkNaDlGtnC1A+G3/PSiSeJr1E3CNaLx2HLAFoI7x1vb9BIzEbCHtc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6Jxn-0002oV-9T; Thu, 13 Aug 2020 20:36:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6Jxm-0004Ez-On; Thu, 13 Aug 2020 20:36:39 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <02f6a5cf-46c3-c216-ad52-707e3409f156@gmail.com>
 <88b80010-2c56-c038-800a-3abd44f46ca5@xen.org>
 <b5497b00-2ee9-e6d8-ea4d-583a14b54522@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <35c657d0-a0a9-0188-5f0c-9bd7047bca02@xen.org>
Date: Thu, 13 Aug 2020 21:36:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b5497b00-2ee9-e6d8-ea4d-583a14b54522@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 13/08/2020 19:41, Oleksandr wrote:
> Rebooting domain 2
> root@generic-armv8-xt-dom0:~# (XEN) Xen BUG at 
> ...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683
> (XEN) ----[ Xen-4.14.0  arm64  debug=y   Not tainted ]----
> (XEN) CPU:    3
> (XEN) PC:     0000000000246f28 ioreq.c#hvm_free_ioreq_mfn+0x68/0x6c
> (XEN) LR:     0000000000246ef0
> (XEN) SP:     0000800725eafd80
> (XEN) CPSR:   60000249 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 0000000000000001  X1: 403fffffffffffff  X2: 000000000000001f
> (XEN)      X3: 0000000080000000  X4: 0000000000000000  X5: 0000000000400000
> (XEN)      X6: 0000800725eafe24  X7: 0000ffffd1ef3e08  X8: 0000000000000020
> (XEN)      X9: 0000000000000000 X10: 00e800008ecebf53 X11: 0400000000000000
> (XEN)     X12: ffff7e00013b3ac0 X13: 0000000000000002 X14: 0000000000000001
> (XEN)     X15: 0000000000000001 X16: 0000000000000029 X17: 0000ffff9badb3d0
> (XEN)     X18: 000000000000010f X19: 0000000810e60e38 X20: 0000800725e68ec0
> (XEN)     X21: 0000000000000000 X22: 00008004dc0404a0 X23: 000000005a000ea1
> (XEN)     X24: ffff8000460ec280 X25: 0000000000000124 X26: 000000000000001d
> (XEN)     X27: ffff000008ad1000 X28: ffff800052e65100  FP: ffff0000223dbd20
> (XEN)
> (XEN)   VTCR_EL2: 80023558
> (XEN)  VTTBR_EL2: 0002000765f04000
> (XEN)
> (XEN)  SCTLR_EL2: 30cd183d
> (XEN)    HCR_EL2: 000000008078663f
> (XEN)  TTBR0_EL2: 00000000781c5000
> (XEN)
> (XEN)    ESR_EL2: f2000001
> (XEN)  HPFAR_EL2: 0000000000030010
> (XEN)    FAR_EL2: ffff000008005f00
> (XEN)
> (XEN) Xen stack trace from sp=0000800725eafd80:
> (XEN)    0000800725e68ec0 0000000000247078 00008004dc040000 
> 00000000002477c8
> (XEN)    ffffffffffffffea 0000000000000001 ffff8000460ec500 
> 0000000000000002
> (XEN)    000000000024645c 00000000002462dc 0000800725eafeb0 
> 0000800725eafeb0
> (XEN)    0000800725eaff30 0000000060000145 000000000027882c 
> 0000800725eafeb0
> (XEN)    0000800725eafeb0 01ff00000935de80 00008004dc040000 
> 0000000000000006
> (XEN)    ffff800000000000 0000000000000002 000000005a000ea1 
> 000000019bc60002
> (XEN)    0000ffffd1ef3e08 0000000000000020 0000000000000004 
> 000000000027c7d8
> (XEN)    000000005a000ea1 0000800725eafeb0 000000005a000ea1 
> 0000000000279f98
> (XEN)    0000000000000000 ffff8000460ec200 0000800725eaffb8 
> 0000000000262c58
> (XEN)    0000000000262c4c 07e0000160000249 0000000000000002 
> 0000000000000001
> (XEN)    ffff8000460ec500 ffff8000460ec508 ffff8000460ec208 
> ffff800052e65100
> (XEN)    000000005060b478 0000ffffd20f3000 ffff7e00013c77e0 
> 0000000000000000
> (XEN)    00e800008ecebf53 0400000000000000 ffff7e00013b3ac0 
> 0000000000000002
> (XEN)    0000000000000001 0000000000000001 0000000000000029 
> 0000ffff9badb3d0
> (XEN)    000000000000010f ffff8000460ec210 ffff8000460ec200 
> ffff8000460ec210
> (XEN)    0000000000000001 ffff8000460ec500 ffff8000460ec280 
> 0000000000000124
> (XEN)    000000000000001d ffff000008ad1000 ffff800052e65100 
> ffff0000223dbd20
> (XEN)    ffff000008537004 ffffffffffffffff ffff0000080c17e4 
> 5a000ea160000145
> (XEN)    0000000060000000 0000000000000000 0000000000000000 
> ffff800052e65100
> (XEN)    ffff0000223dbd20 0000ffff9badb3dc 0000000000000000 
> 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<0000000000246f28>] ioreq.c#hvm_free_ioreq_mfn+0x68/0x6c (PC)
> (XEN)    [<0000000000246ef0>] ioreq.c#hvm_free_ioreq_mfn+0x30/0x6c (LR)
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 3:
> (XEN) Xen BUG at ...tAUTOINC+bb71237a55-r0/git/xen/include/xen/mm.h:683
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) PSCI cpu off failed for CPU0 err=-3
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> 
> 
> Either I did something wrong (most likely) or there is an issue with 
> page ref-counting in the IOREQ code. I am still trying to understand 
> what is going on.

At a first glance, the implement of set_foreign_p2m_entry() looks fine 
to me.

> Some notes on that:
> 1. I checked that put_page() was called for these pages in 
> p2m_put_l3_page() when destroying domain. This happened before 
> hvm_free_ioreq_mfn() execution.
> 2. There was no BUG detected if I passed "p2m_ram_rw" instead of 
> "p2m_map_foreign_rw" in guest_physmap_add_entry(), but the DomU couldn't 
> be fully destroyed because of the reference taken.

This definitely looks like a page reference issue. Would it be possible 
to print where the page reference are dropped? A WARN() in put_page() 
would help.

To avoid a lot of message, I tend to use a global variable that store 
the page I want to watch.

Cheers,

-- 
Julien Grall

