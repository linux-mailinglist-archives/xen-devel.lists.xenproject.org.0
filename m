Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C735E634244
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 18:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447272.703310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxWpl-0000aZ-HJ; Tue, 22 Nov 2022 17:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447272.703310; Tue, 22 Nov 2022 17:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxWpl-0000X7-EP; Tue, 22 Nov 2022 17:13:21 +0000
Received: by outflank-mailman (input) for mailman id 447272;
 Tue, 22 Nov 2022 17:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L5a2=3W=citrix.com=prvs=31825ceb6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oxWpk-0000X1-A6
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 17:13:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2f120a9-6a88-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 18:13:17 +0100 (CET)
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
X-Inumbo-ID: f2f120a9-6a88-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669137197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dibonJrbFJPYYbZVRju2tWu8dUxlVlZEda3MzHEgIJM=;
  b=f6FdS+OZaWcb6i8OOBrLaGA9R0RFwe+zJBYixnzJwKJNoDMQ02s+NRQ3
   fLoQaRkJZDhWYfaf2LE3BM+xBTaQJe9k6+GJ55vz2dTieIC+hxY915CmI
   aUYsAcD4t5AizKrcmdSlJtYt/JUFhHxmNt56yL1TsUenFTRqAZqTCrq9T
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84931259
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qbc5bqCCtCEOFRVW/wjjw5YqxClBgxIJ4kV8jS/XYbTApDxw0jEPx
 mYeXGiFa/eCMzb9KI8gPIi29EgCv8CEyoUwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC5ARiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2cxJLmMTx
 9EiFhtRMCvTps6w7LDqRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFJo3RHJ8Izy50o
 ErtpzT1IxcDNeCt9gra12+8qtXrwHPkDdd6+LqQqacx3Qz7KnYoIAUfSF+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neMlsnsDCZis5WUT2yc7baeqT6uOSkTInQGbCVCRgwAi/H6rYQuyx7CUNtnOKiyiNLzBHf32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzib9YE2nszFUXrCOO9KTuXn369pCfYnMGzFto
 0M4d9iiAPEmVM/TxXTdG7xcTdlF9N7ebmSC3AcH840Jsm30piX9Jd04DCRWfh8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjntZLlXvENlGPxL44owUuBFEfGFWE
 c7znTyQJXgbE7976zG9Wv0Q17Qmrghnmz2CHc2mkUv9j+TBDJJwdVviGALeBt3VEYve+FmFm
 zqhH5biJ+pjvB3WPXCMrN97waEiJnknH5Hmw/G7hcbaSjeL2QgJVZfs/F/WU9Y4w/QOz76Sp
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldcwXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:UcGP06F7kQBvQJ9fpLqE08eALOsnbusQ8zAXPiFKOH5om6mj/P
 xG88536faKskdpZJhNo7y90dC7MBThHMdOkO8s1NSZLWrbUQmTTb2KhLGKq1fd8kvFmdK1vp
 0BT0ERMrPN5SwQt7ef3OHLeOxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="84931259"
Date: Tue, 22 Nov 2022 17:12:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] hw/xen/xen_pt: Call default handler only if no
 custom one is set
Message-ID: <Y30DG96s9Ky1AUN0@perard.uk.xensource.com>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>

On Mon, Nov 14, 2022 at 08:20:10PM +0100, Marek Marczykowski-Górecki wrote:
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 0ec7e52183..269bd26109 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -255,6 +255,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
>      uint32_t find_addr = addr;
>      XenPTRegInfo *reg = NULL;
>      bool wp_flag = false;
> +    uint32_t emul_mask = 0, write_val;
>  
>      if (xen_pt_pci_config_access_check(d, addr, len)) {
>          return;
> @@ -310,7 +311,6 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
>      }
>  
>      memory_region_transaction_begin();
> -    pci_default_write_config(d, addr, val, len);
>  
>      /* adjust the read and write value to appropriate CFC-CFF window */
>      read_val <<= (addr & 3) << 3;
> @@ -370,6 +370,8 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
>                  return;
>              }
>  
> +            emul_mask |= ( (1 << (reg->size * 8) ) - 1 ) << ((find_addr & 3) * 8);
> +
>              /* calculate next address to find */
>              emul_len -= reg->size;
>              if (emul_len > 0) {
> @@ -396,6 +398,24 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
>      /* need to shift back before passing them to xen_host_pci_set_block. */
>      val >>= (addr & 3) << 3;
>  
> +    /* store emulated registers that didn't have specific hooks */
> +    write_val = val;
> +    for (index = 0; emul_mask; index += emul_len) {

`index` isn't used, was it meant to be use for something?

> +        emul_len = 0;
> +        while (emul_mask & 0xff) {
> +            emul_len++;

This seems to count the number of byte that have a hook
(xen_pt_find_reg() found a `reg_entry`).
This loop should count instead the number of bytes for which no
`reg_entry` have been found, right? Shouldn't the loop count when a byte
in emul_mask is unset?

> +            emul_mask >>= 8;
> +        }
> +        if (emul_len) {
> +            uint32_t mask = ((1 << (emul_len * 8)) - 1);
> +            pci_default_write_config(d, addr, write_val & mask, emul_len);

`addr` isn't updated in the loop, aren't we going to write bytes to the
wrong place? If for example "emul_mask == 0x00ff00ff" ?

> +            write_val >>= emul_len * 8;
> +        } else {
> +            emul_mask >>= 8;
> +            write_val >>= 8;
> +        }
> +    }

Thanks,

-- 
Anthony PERARD

