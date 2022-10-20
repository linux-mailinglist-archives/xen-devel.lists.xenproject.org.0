Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D2606170
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:21:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426777.675450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVUP-0003Lr-GL; Thu, 20 Oct 2022 13:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426777.675450; Thu, 20 Oct 2022 13:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVUP-0003Ix-Cy; Thu, 20 Oct 2022 13:21:37 +0000
Received: by outflank-mailman (input) for mailman id 426777;
 Thu, 20 Oct 2022 13:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iaqk=2V=citrix.com=prvs=285ecbe66=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1olVUO-0003Ip-C8
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:21:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d1b9f73-507a-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 15:21:34 +0200 (CEST)
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
X-Inumbo-ID: 1d1b9f73-507a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666272094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m8Z/x3pSZNAayr0xIBnBZnORN5AFqYVFRDW6DYQ/zYY=;
  b=dN/LW9WQdOfIV3yOTFSQlvWREWogE8cUJgVLZ1IGOiWlAuN52Gzt6M7E
   lzqEiuUn/5tvp1+fykGGYpyaySrerbyiCiUNe+ZPCbVglrMtykI4A1z/O
   ClTmEVLB2ctqOj+hVjAHbOdJt1C4Rx83EKmWUDmRRenjZXapu8pXtTM1j
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82266334
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IQziNqLipZ8SPZODFE+RrpUlxSXFcZb7ZxGr2PjKsXjdYENS12NSy
 zAbW2CCPPuCMTb9e413Oo+z9k0Cv5bdm981HAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4mtA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FaoV+sF+J0Ncz
 80dLTEfYiqDv7mYwIvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3FYICPJILRHpk9ckCwl
 Fv9oHj2QUsmDNmY+CKptSz827LIgnauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobRsn1
 niAufH7Pw1qtbyHRUidzuy6rQrnbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr2/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nXyURho81XRtlFAspp1xWF2DZS82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYiX0NPYnP97vUJlwpUQFKTgCfqmOBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZznEgWnDqLLbiilkjP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQkkQOAbOhPnWKmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQgnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:dkyGYaw5se5hVAIdXhmWKrPwKr1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPHjP+VEssRAb6LW90ca7LE80maQY3WBVB8bFYOCEghrLEGgB1+vfKlTbckWUnNK1l5
 0QEJSWYOeAdGSS5vya3ODXKbkd/OU=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="82266334"
Date: Thu, 20 Oct 2022 14:21:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 2/6] test/vpci: fix vPCI test harness to provide
 pci_get_pdev()
Message-ID: <Y1FLUsSUJv799QsO@perard.uk.xensource.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020094649.28667-3-roger.pau@citrix.com>

On Thu, Oct 20, 2022 at 11:46:45AM +0200, Roger Pau Monne wrote:
> Instead of pci_get_pdev_by_domain(), which is no longer present in the
> hypervisor.
> 
> While there add parentheses around the define value.
> 
> Fixes: a37f9ea7a6 ('PCI: fold pci_get_pdev{,_by_domain}()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

