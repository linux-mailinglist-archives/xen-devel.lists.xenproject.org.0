Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A201A2670
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 17:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMD2O-0003Pb-59; Wed, 08 Apr 2020 15:54:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoLl=5Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMD2M-0003PW-O2
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 15:54:46 +0000
X-Inumbo-ID: 445d1488-79b1-11ea-8206-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 445d1488-79b1-11ea-8206-12813bfff9fa;
 Wed, 08 Apr 2020 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ej4PkrTTsoieQ+0RiCS9IzBRl/38bJi27hslu8hkVbE=; b=CFx3QKJ9qUlRVbOWNj+zGkG8XZ
 4qlF7R3qakwEJAhnpEshakjXdpdyIq0JkJsXloLePATOup/Qy3w/y7V52nDzpIoxB7dhU/bgrPQ8q
 VseLPX0J0KZkVTvBLqObcyl6XLHtsdbZnzJAl/bALtLvUD7wBNJwpZdfwyIldhKuWcvk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMD2D-0007pI-0D; Wed, 08 Apr 2020 15:54:37 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMD2C-0006kz-P8; Wed, 08 Apr 2020 15:54:36 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <80eb22d5-a78e-3f47-5b82-4244369931a3@xen.org>
Date: Wed, 8 Apr 2020 16:54:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Peng Fan <peng.fan@nxp.com>, maz@kernel.org, George.Dunlap@citrix.com,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 03/04/2020 20:41, Stefano Stabellini wrote:
> On Thu, 2 Apr 2020, Julien Grall wrote:
> As you know I cannot reproduce the crash myself, I asked Peng and Wei
> for help in that. I cannot be certain Jeff's patch makes a difference,
> but looking at the code, if you open
> xen/arch/arm/vgic-v3.c:__vgic_v3_distr_common_mmio_read you can see that
> the range mistake is still there:
> 
> 
>      /* Read the active status of an IRQ via GICD/GICR is not supported */
>      case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
>      case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>          goto read_as_zero;
> 
> 
> So a GICD_ISACTIVER of any register but the first should end up hitting
> the default case:
> 
>      default:
>          printk(XENLOG_G_ERR
>                 "%pv: %s: unhandled read r%d offset %#08x\n",
>                 v, name, dabt.reg, reg);
>          return 0;
>      }
> 
> Which returns 0 (IO_ABORT).
> 
> Would you be happy to have the range fixed to be:
> 
>      case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
> 
> instead?

I don't particularly like it, but it is not going to make any difference 
for Linux < 5.4. So I am not opposed to it.

However, I am a bit worry the vGIC is still going to be a pile of hack.
So I think we should continue the discussion about making it better. 
This includes how to implement I{C, S}ACTIVER properly and what sort of 
use-cases we want to support.

Cheers,

-- 
Julien Grall

