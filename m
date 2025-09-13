Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCCB56269
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 19:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123448.1466462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxUO6-00071a-8f; Sat, 13 Sep 2025 17:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123448.1466462; Sat, 13 Sep 2025 17:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxUO6-0006zn-61; Sat, 13 Sep 2025 17:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1123448;
 Sat, 13 Sep 2025 17:50:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uxUO3-0006za-WF
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 17:50:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxUNy-00891Z-2x;
 Sat, 13 Sep 2025 17:50:06 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxUNy-007UEv-1f;
 Sat, 13 Sep 2025 17:50:06 +0000
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
	:Subject:Cc:To:Date:From; bh=n/NIyzWScPTA4RnRtGlg/JdWBCz0ifZVz6h8bY1/sQU=; b=
	EqcQ7w61kvpf0wzorOrtKOPDVbCEDJFwwwe6unDE7aX4AYI+n0i1y5kA4HrTVHp0yQ7PP8Yah2nhC
	9zg5YpP57lUNTaqV9ZPEh/nIJtU8uO6Kn7EIDJNRgriuXz9lDQL4Wlhi3JaNn8vAVBIG5y5uCOvJ1
	OZysukGWN1WIoBt4Q=;
From: dmukhin@xen.org
Date: Sat, 13 Sep 2025 10:50:05 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 02/16] xen/8250-uart: update definitions
Message-ID: <aMWuzdtOSzLLwfMF@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-3-dmukhin@ford.com>
 <54211c3c-f911-41c3-b4bd-1e27fcc09f93@suse.com>
 <CAGeoDV_53E3M3JmoDUbOL+5W8orMEoYUVFqc8XHREec_vwEpkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGeoDV_53E3M3JmoDUbOL+5W8orMEoYUVFqc8XHREec_vwEpkg@mail.gmail.com>

On Wed, Sep 10, 2025 at 11:39:07AM +0300, Mykola Kvach wrote:
> > > +#define UART_IER_MASK \
> > > +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
> >
> > Here, aiui, ..._MASK covers all known bits. No #define-s for reserved
> > ones.
> 
> I think we can follow the Linux kernel style here [1]. For example:
> 
> #define UART_IER_ALL_INTR (UART_IER_MSI | \
>         UART_IER_RLSI | \
>         UART_IER_THRI | \
>         UART_IER_RDI)
> 
> This way we avoid using the *_MASK suffix, which could be confusing,
> and clearly indicate that these are all valid interrupt bits.

Agreed, will update.

