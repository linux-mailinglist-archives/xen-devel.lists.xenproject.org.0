Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04E27C29A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.19.84 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kND8u-0004on-M5; Tue, 29 Sep 2020 10:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19.84; Tue, 29 Sep 2020 10:45:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kND8u-0004oS-IW; Tue, 29 Sep 2020 10:45:56 +0000
Received: by outflank-mailman (input) for mailman id 19;
 Tue, 29 Sep 2020 10:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kND8t-0004oN-G7
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:45:55 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1073a7a-68dd-481f-b09f-afbc12c3eed8;
 Tue, 29 Sep 2020 10:45:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kND8t-0004oN-G7
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:45:55 +0000
X-Inumbo-ID: d1073a7a-68dd-481f-b09f-afbc12c3eed8
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d1073a7a-68dd-481f-b09f-afbc12c3eed8;
	Tue, 29 Sep 2020 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601376355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xqYMuUZMbfL80zcjVAVFuMfFOcXLgr1jlSDNznPi0M0=;
  b=I3SjIhPLrd/DR+PMhwneL1eXqqDUfbamKiqgRTM/nV7ixsjcf4B6ukFK
   PE2GoGhtMK9IHkWw0IC4M0yLqIEQleF5aqgAjUwIwU1O9xsPmX6H2paXH
   hamRBNNNfdlJlcdCo7EKlyB3tc6XWJP6qNNRhz5wI2q2UOrCaTSUipIGW
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zgMwgsSkk0u8iIM2o3QBfnQWkm3DiTp3c3z2XKZ/WNGiSd7mQZc2ApK1JsDlHiWm+zkvTOmvfy
 /UTyyQ8R3Iqo0DVslIPEYnKmQP6+01AIBjKIND8MieqKRbyc4HkJXXFwfqq500RVqy7eiFduK0
 e4Jod04Y7ZWU+7ZBv7c8+GYKxxG/Np1BNxMLa2GWrgY1MxJcZa3QUHRwr3nUMpIDlR325ULzar
 wYNbtaBDGMni9GfqwfKvSrZ3EDvGwwoFJG766IWoP2zfdeamQcZDL/jFdta1bv4xrLwnYKqbRq
 utg=
X-SBRS: None
X-MesageID: 27848310
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,318,1596513600"; 
   d="scan'208";a="27848310"
Date: Tue, 29 Sep 2020 12:45:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/5] efi/boot.c: add file.need_to_free
Message-ID: <20200929104545.GR19254@Air-de-Roger>
References: <20200921115113.1278655-1-hudson@trmm.net>
 <20200921115113.1278655-3-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200921115113.1278655-3-hudson@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Mon, Sep 21, 2020 at 07:51:10AM -0400, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/common/efi/boot.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 157fe0e8c5..c2ce0c7294 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -102,6 +102,7 @@ union string {
>  
>  struct file {
>      UINTN size;
> +    bool need_to_free;
>      union {
>          EFI_PHYSICAL_ADDRESS addr;
>          char *str;
> @@ -280,13 +281,13 @@ void __init noreturn blexit(const CHAR16 *str)
>      if ( !efi_bs )
>          efi_arch_halt();
>  
> -    if ( cfg.addr )
> +    if ( cfg.need_to_free )

If you drop the addr check here...

>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -    if ( kernel.addr )
> +    if ( kernel.need_to_free )
>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> -    if ( ramdisk.addr )
> +    if ( ramdisk.need_to_free )
>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> -    if ( xsm.addr )
> +    if ( xsm.need_to_free )
>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
>  
>      efi_arch_blexit();
> @@ -581,6 +582,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      }
>      else
>      {
> +        file->need_to_free = true;

... I think you need to clear need_to_free if AllocatePages fails?

Thanks, Roger.

