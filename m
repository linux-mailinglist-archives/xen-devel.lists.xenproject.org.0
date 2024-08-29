Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E359636E9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 02:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785327.1194768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjT8t-00035j-Gy; Thu, 29 Aug 2024 00:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785327.1194768; Thu, 29 Aug 2024 00:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjT8t-00033E-Dk; Thu, 29 Aug 2024 00:36:03 +0000
Received: by outflank-mailman (input) for mailman id 785327;
 Thu, 29 Aug 2024 00:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sjT8r-000338-Pe
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 00:36:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e584b9-659e-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 02:36:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4CB78CE19B6;
 Thu, 29 Aug 2024 00:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D933C4CEC2;
 Thu, 29 Aug 2024 00:35:54 +0000 (UTC)
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
X-Inumbo-ID: a8e584b9-659e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724891755;
	bh=VvoZj2CvTAW+P0JXl3bo0fxrLliV7G0ffaBZf1do2Qg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=in2AyjUb2puPxheNbmzKEUJuVK0mLr/3vZJ+h2JfUcE7mg40lbMCFsEVspcsW5Gom
	 5A7RAXUC3uPXIhm+0TQV+DvipVsqFg0azeB/KtOnZuNyT1gmd0tUG7yUWdp235rE6B
	 yKho+536mI9xAQsxdzJf7OkxZGuRnj3cszYix5WAXlye6tuTITrFt2Z7O6xe1iunRF
	 uhTCQuCdOY3W9JSwXjDwaOlAcULhvu9DVH1ijKtv0VOFLZj20iOOg9howLDdx6sPDc
	 jBvoFoMnWwyYYajNEfctrn9PQtiGBvmSdgxJ4modyKtW8N0UZ7NIQVaEOktgsHX1n0
	 DkSox4kp39i5g==
Date: Wed, 28 Aug 2024 17:35:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v5 7/8] x86/mm: add defensive return
In-Reply-To: <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2408281735020.53815@ubuntu-linux-20-04-desktop>
References: <cover.1722239813.git.federico.serafini@bugseng.com> <24501d2e7f5d82d8e5a483a80b35e04ce765a7cf.1722239813.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2407291512280.4857@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jul 2024, Stefano Stabellini wrote:
> On Mon, 29 Jul 2024, Federico Serafini wrote:
> > Add defensive return statement at the end of an unreachable
> > default case. Other than improve safety, this meets the requirements
> > to deviate a violation of MISRA C Rule 16.3: "An unconditional `break'
> > statement shall terminate every switch-clause".
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> > ---
> > No changes from v3 and v4, further feedback on this thread would be appreciated:
> > https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00474.html

Looking at the older threads, I looks like Jan suggested EACCES, I also
think it is marginally better. My R-b stands also for EACCES. Jan, I
think you should go ahead and fix on commit


> > ---
> >  xen/arch/x86/mm.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 95795567f2..8973e76dff 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -917,6 +917,7 @@ get_page_from_l1e(
> >                  return 0;
> >              default:
> >                  ASSERT_UNREACHABLE();
> > +                return -EPERM;
> >              }
> >          }
> >          else if ( l1f & _PAGE_RW )
> > -- 
> > 2.34.1
> > 
> > 
> 

