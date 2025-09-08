Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3EB488E9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115015.1461783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYRa-0002vF-9g; Mon, 08 Sep 2025 09:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115015.1461783; Mon, 08 Sep 2025 09:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYRa-0002tB-72; Mon, 08 Sep 2025 09:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1115015;
 Mon, 08 Sep 2025 09:45:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvYRZ-0002t2-9W
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:45:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvYRY-0000is-0j;
 Mon, 08 Sep 2025 09:45:48 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvYRY-0001He-0E;
 Mon, 08 Sep 2025 09:45:48 +0000
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
	bh=X9oAsv6G13ucz5Dw61cD/LKtcJhmND9b2ShsybDBP0Q=; b=r/1VMfemFGv+3dWdLI/HJFWSXW
	8YTgiHqCm8/c/mbxQ87ERHmsYI7YWJvRUDRE6Up1JiHn5CrDSpzSdF+aoDSlYa0zQ5LOq1xNyoJt1
	VYULqF0vAdKcW+rOdrbrWXU+u5Hof1miKSu7NePh0hX0YKkNo4hfaJIeCD5Me1TWvH/Q=;
From: dmukhin@xen.org
Date: Mon, 8 Sep 2025 02:45:46 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 01/15] emul/vuart: introduce framework for UART
 emulators
Message-ID: <aL6lymRB5LtxzDMT@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-2-dmukhin@ford.com>
 <CAGeoDV8xKHSobiLiWuzKtnxPXnRvFWf139BddeTUkuREEvrk2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV8xKHSobiLiWuzKtnxPXnRvFWf139BddeTUkuREEvrk2w@mail.gmail.com>

On Mon, Sep 08, 2025 at 11:29:03AM +0300, Mykola Kvach wrote:
> On Sat, Sep 6, 2025 at 2:27 AM <dmukhin@xen.org> wrote:
[..]
> > +++ b/xen/common/emul/vuart/Kconfig
> > @@ -0,0 +1,6 @@
> > +config VUART_FRAMEWORK
> > +       bool
> 
> If VUART_FRAMEWORK has no dependencies, it can be enabled on any
> architecture. For example, I tried enabling it on arm64 and the build
> fails:
> 
>   ./include/xen/vuart.h:26:8: error: redefinition of ‘struct vuart’
> 
> Should this config be restricted (e.g. "depends on X86") or the code
> adjusted to handle non-x86 architectures properly?

Yes, missed that; the code is for x86 only for now.
`struct vuart` on Arm corresponds to simple MMIO-based UART emulator for
hwdom's earlyprintk.

Arm part is pending:
  https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/

Most of the feedback resolved locally, but I need to wait for the other series to land

[..]
> > +static const struct vuart_emulator *
> > +vuart_match_by_compatible(const struct domain *d, const char *compat)
> > +{
> > +    const struct vuart_emulator *emulator;
> > +
> > +    for_each_emulator(emulator)
> > +        if ( emulator->compatible &&
> > +             !strncmp(compat, emulator->compatible,
> > +                      strlen(emulator->compatible)) )
> > +            return emulator;
> > +
> > +    return NULL;
> > +}
> > +
> > +const static struct vuart *
> > +vuart_find_by_console_permission(const struct domain *d)
> 
> During the first review of this patch I thought you planned to add a
> searching procedure into this and the next function in one of the later
> commits. However, looking at the series now, it seems these functions
> remain unchanged and don’t actually perform any searching.
> 
> Do you think the current names are accurate, or would it make sense to
> rename them to better reflect their purpose?

Arm has two vUART emulators enabled by default, so there will be at least two
vUARTs and some search in vuart.c.

I scoped x86 portion of the change into the current series, Arm is to follow,
since I have pending series to plumb vpl011 (i.e. SBSA) and hwdom vuart (i.e.
early dtuart) into that new framework. There will be some adjustments in
vuart.c

