Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BACB482A5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 04:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114464.1461375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvRkz-0006bJ-Ue; Mon, 08 Sep 2025 02:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114464.1461375; Mon, 08 Sep 2025 02:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvRkz-0006Z9-Rp; Mon, 08 Sep 2025 02:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1114464;
 Mon, 08 Sep 2025 02:37:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvRkz-0006Z3-AQ
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 02:37:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvRkx-00D1dL-35;
 Mon, 08 Sep 2025 02:37:24 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvRkx-0032oH-2v;
 Mon, 08 Sep 2025 02:37:24 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=1JnmaM64m5deykk9pXOMOarxzpQksjh+tlOOJDuej+A=; b=
	EFR88S09qaqP1ZjhStKrRpiDKEvkDUtFlcUuAERDio6RIluIT/VHNYxGWLwW/31Icdz3+q/BiKJ3f
	Bnz07Xwb/hOJwPOozGmytfjyuZf/jVwlgUjPluREjT276Ih0n9dv+ScpQhxcdkW5wJ5jDblsDRfid
	T+G3sL7A8ODqgwxR8=;
From: dmukhin@xen.org
Date: Sun, 7 Sep 2025 19:37:23 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v6 06/15] emul/ns16x50: implement IER/IIR registers
Message-ID: <aL5BY+bjr5G9rECM@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-7-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2509051828050.1405870@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2509051828050.1405870@ubuntu-linux-20-04-desktop>

On Fri, Sep 05, 2025 at 06:42:13PM -0700, Stefano Stabellini wrote:
> On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
[..]
> > +static void ns16x50_irq_assert(const struct vuart_ns16x50 *vdev)
> > +{
> > +    struct domain *d = vdev->owner;
> > +    const struct vuart_info *info = vdev->info;
> > +    int vector;
> > +
> > +    if ( has_vpic(d) )
> > +        vector = hvm_isa_irq_assert(d, info->irq, vioapic_get_vector);
> > +    else
> > +        ASSERT_UNREACHABLE();
> 
> This seems dangerous as there are guests without vpic

Agreed; will update.

