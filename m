Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F1B482E5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 05:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114503.1461406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvSh6-0006i3-Iz; Mon, 08 Sep 2025 03:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114503.1461406; Mon, 08 Sep 2025 03:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvSh6-0006ga-GN; Mon, 08 Sep 2025 03:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1114503;
 Mon, 08 Sep 2025 03:37:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvSh4-0006gU-Mt
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 03:37:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvSh3-00D3lx-0s;
 Mon, 08 Sep 2025 03:37:25 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvSh2-0035zp-30;
 Mon, 08 Sep 2025 03:37:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=e59sqOczWYhxASSpbuj8sGhJWnsSzTU2AAPRal8vFYA=; b=IkiijazLAHxujJJxOXE5mKE6HR
	SOPCETJbcXWViqQ4T/bVJjYxwklJN+6rV5oxCWwNJTgtewX1HgA5dCd/VfjwkVa0epw4C3hSIVOGp
	ZQozgP9iEVWLoXSuAatFMVn4BK+nc/8tvBn60Dpv/dt3DdzO0YNqGpmyVgM76itxwp+0=;
From: dmukhin@xen.org
Date: Sun, 7 Sep 2025 20:37:24 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 05/15] emul/ns16x50: implement SCR register
Message-ID: <aL5PdLqikrwOnP0s@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-6-dmukhin@ford.com>
 <CAGeoDV_YrSrKTYj5LitZQzdcO9-QBCqVmnqE63hGAendiqNxpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV_YrSrKTYj5LitZQzdcO9-QBCqVmnqE63hGAendiqNxpw@mail.gmail.com>

On Sun, Sep 07, 2025 at 12:24:24AM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> On Sat, Sep 6, 2025 at 2:27 AM <dmukhin@xen.org> wrote:
> >
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Add SCR register emulation to the I/O port handler.
> > Firmware (e.g. OVMF) may use SCR during the guest OS boot.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v5:
> > - moved earlier in the series to simplify I/O handler population in
> >   the follow on patches
> > - Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-11-dmukhin@ford.com/
> > ---
> >  xen/common/emul/vuart/ns16x50.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> > index 7f479a5be4a2..51ec85e57627 100644
> > --- a/xen/common/emul/vuart/ns16x50.c
> > +++ b/xen/common/emul/vuart/ns16x50.c
> > @@ -103,6 +103,20 @@ static int ns16x50_io_write8(
> >
> >      if ( ns16x50_dlab_get(vdev) && (reg == UART_DLL || reg == UART_DLM) )
> >          regs[NS16X50_REGS_NUM + reg] = val;
> > +    else
> > +    {
> > +        switch ( reg )
> > +        {
> > +        /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
> > +        case UART_SCR:
> > +            regs[UART_SCR] = val;
> > +            break;
> > +
> > +        default:
> > +            rc = -EINVAL;
> 
> In the previous commit, when ns16x50_dlab_get() was zero and UART_DLL
> or UART_DLM was accessed, the function returned 0. With this commit,
> the behavior changes: now an -EINVAL error is returned for both DLL
> and DLM when ns16x50_dlab_get() is zero.
> 
> Should this be fixed in the previous commit, or is this change
> intentional in this one? Note that for 16-bit accesses you already
> return an error when ns16x50_dlab_get() is zero, so the behavior is
> inconsistent for 8-bit accesses to DLL/DLM.

I agree, it makes sense to move the switch() block with default register
handling to the previous DLL/DLM commit; will update.

Thanks!

