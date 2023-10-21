Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0507D1E47
	for <lists+xen-devel@lfdr.de>; Sat, 21 Oct 2023 18:34:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620534.966035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quEuL-0002XD-HB; Sat, 21 Oct 2023 16:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620534.966035; Sat, 21 Oct 2023 16:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quEuL-0002VA-Dd; Sat, 21 Oct 2023 16:33:01 +0000
Received: by outflank-mailman (input) for mailman id 620534;
 Sat, 21 Oct 2023 16:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vO28=GD=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1quEuJ-0002V4-U8
 for xen-devel@lists.xenproject.org; Sat, 21 Oct 2023 16:33:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cda19e1-702f-11ee-98d5-6d05b1d4d9a1;
 Sat, 21 Oct 2023 18:32:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 781FFCE13E0;
 Sat, 21 Oct 2023 16:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261F3C433C8;
 Sat, 21 Oct 2023 16:32:50 +0000 (UTC)
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
X-Inumbo-ID: 7cda19e1-702f-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697905971;
	bh=J0YExM0i9UyGR28fuSNSuiNULcDD5AwOsLxt/rxGPN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PdJE3qT4Sz+2st1qtPL0++FJpfbjfyZ1T9tVqqaXeIN0f0JAM94vs+LtZUvZcsFYQ
	 i2sA8e6eG4g1IMJIFyEOUDUboczRLoUL+oig1nGVB0pQ/8YK4J/umno0Dwj5r5mCBl
	 3nRqMnHJ18/H25w0WNfnrc01BDLIxlofdfkqGK8k=
Date: Sat, 21 Oct 2023 18:32:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] hvc/xen: fix event channel handling for secondary
 consoles
Message-ID: <2023102129-humongous-grant-4576@gregkh>
References: <20231020161529.355083-1-dwmw2@infradead.org>
 <20231020161529.355083-2-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020161529.355083-2-dwmw2@infradead.org>

On Fri, Oct 20, 2023 at 05:15:27PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xencons_connect_backend() function allocates a local interdomain
> event channel with xenbus_alloc_evtchn(), then calls
> bind_interdomain_evtchn_to_irq_lateeoi() to bind to that port# on the
> *remote* domain.
> 
> That doesn't work very well:
> 
> (qemu) device_add xen-console,id=con1,chardev=pty0
> [   44.323872] xenconsole console-1: 2 xenbus_dev_probe on device/console/1
> [   44.323995] xenconsole: probe of console-1 failed with error -2
> 
> Fix it to use bind_evtchn_to_irq_lateeoi(), which does the right thing
> by just binding that *local* event channel to an irq. The backend will
> do the interdomain binding.
> 
> This didn't affect the primary console because the setup for that is
> special — the toolstack allocates the guest event channel and the guest
> discovers it with HVMOP_get_param.
> 
> Fixes: fe415186b4 ("xen/console: harden hvc_xen against event channel storms")

Nit, our tools complain that the sha1 isn't big enough, "fe415186b43d"
I'll go fix it up...


