Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3827C39B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 13:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.29.133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNDTT-000700-BT; Tue, 29 Sep 2020 11:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29.133; Tue, 29 Sep 2020 11:07:11 +0000
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
	id 1kNDTT-0006zb-7u; Tue, 29 Sep 2020 11:07:11 +0000
Received: by outflank-mailman (input) for mailman id 29;
 Tue, 29 Sep 2020 11:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNDTS-0006zW-Aa
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:07:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e04ddb2-0776-47d6-a975-4f9a288c44c0;
 Tue, 29 Sep 2020 11:07:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5FnP=DG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNDTS-0006zW-Aa
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 11:07:10 +0000
X-Inumbo-ID: 7e04ddb2-0776-47d6-a975-4f9a288c44c0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7e04ddb2-0776-47d6-a975-4f9a288c44c0;
	Tue, 29 Sep 2020 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601377628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w77H9d6qvSQFLZKPeI5VuiAxSPdRd6Y75nJL6seS+aI=;
  b=ZhtQOia8OcUNGZfszZDKJINjCgX6oMssBebAmKJAVkaYAlE9C3/C3d7a
   5rHdPqga3niLwQxHhcb6Dq3co6BbU0nNzYSND+/ICyLFPOg38NSDEsIEE
   UXOwXQ+oQNTSECbhH+vaPqZr9XWzunIe6BMa0n84PsHcd8KTtbSufAppX
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eSdUnZIV3Xs0ym8BIxviFRvvVwmhcSsGG1GYxJYGyTjcOWXix59fvs0WvF1uMyAkAtbkdolluT
 8nk8DBfzx3NnB1YX/Ym3lmjDL4rcikLUqZO8+QsKzRhpNm7fzmm8oEUQzhhDlC7r87OuWGC9uE
 jucTc4iVYI3MMq2QEKrbIJuu4sjdebHeSE4oxqar34xh8tGvQta3FpfnhBankbiodgpc5PYOdi
 8oLpta0wh61FS6sibRQ0VuSC8jvzNqNo9Y1VutWSVX4m36hBmhuv8/SBaz4N1Bx2Zk3f3CxjTu
 HY8=
X-SBRS: None
X-MesageID: 28849224
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,318,1596513600"; 
   d="scan'208";a="28849224"
Date: Tue, 29 Sep 2020 13:06:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Trammell Hudson <hudson@trmm.net>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/5] efi/boot.c: add file.need_to_free
Message-ID: <20200929110657.GS19254@Air-de-Roger>
References: <20200921115113.1278655-1-hudson@trmm.net>
 <20200921115113.1278655-3-hudson@trmm.net>
 <20200929104545.GR19254@Air-de-Roger>
 <db4fd689-4f91-8a1e-8f50-8e16af042516@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db4fd689-4f91-8a1e-8f50-8e16af042516@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Tue, Sep 29, 2020 at 01:00:06PM +0200, Jan Beulich wrote:
> On 29.09.2020 12:45, Roger Pau Monné wrote:
> > On Mon, Sep 21, 2020 at 07:51:10AM -0400, Trammell Hudson wrote:
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -102,6 +102,7 @@ union string {
> >>  
> >>  struct file {
> >>      UINTN size;
> >> +    bool need_to_free;
> >>      union {
> >>          EFI_PHYSICAL_ADDRESS addr;
> >>          char *str;
> >> @@ -280,13 +281,13 @@ void __init noreturn blexit(const CHAR16 *str)
> >>      if ( !efi_bs )
> >>          efi_arch_halt();
> >>  
> >> -    if ( cfg.addr )
> >> +    if ( cfg.need_to_free )
> > 
> > If you drop the addr check here...
> > 
> >>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> >> -    if ( kernel.addr )
> >> +    if ( kernel.need_to_free )
> >>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> >> -    if ( ramdisk.addr )
> >> +    if ( ramdisk.need_to_free )
> >>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> >> -    if ( xsm.addr )
> >> +    if ( xsm.need_to_free )
> >>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
> >>  
> >>      efi_arch_blexit();
> >> @@ -581,6 +582,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
> >>      }
> >>      else
> >>      {
> >> +        file->need_to_free = true;
> > 
> > ... I think you need to clear need_to_free if AllocatePages fails?
> 
> But this has been moved to the success path, or am I overlooking
> anything?

Oh yes, sorry, somehow I looked at the wrong context. Please ignore my
comment.

Roger.

