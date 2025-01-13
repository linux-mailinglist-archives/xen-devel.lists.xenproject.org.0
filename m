Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F0AA0BB4B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 16:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870626.1281772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXM6B-0005kg-1A; Mon, 13 Jan 2025 15:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870626.1281772; Mon, 13 Jan 2025 15:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXM6A-0005if-Ut; Mon, 13 Jan 2025 15:11:26 +0000
Received: by outflank-mailman (input) for mailman id 870626;
 Mon, 13 Jan 2025 15:11:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dy7G=UF=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1tXM69-0005iO-K1
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 15:11:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a630cfa8-d1c0-11ef-99a4-01e77a169b0f;
 Mon, 13 Jan 2025 16:11:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4AC65C5582;
 Mon, 13 Jan 2025 15:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B86C4CED6;
 Mon, 13 Jan 2025 15:11:20 +0000 (UTC)
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
X-Inumbo-ID: a630cfa8-d1c0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736781081;
	bh=N6GNEhMlM/EdKo1uVEpkZEePe/ExshF2obnY4wmPz1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHxgeKpcFZwVtcznd92IQZSVdXQ8zlto0BNw4l/sLVZQNSpZyn1E4TLHG3gGCgL1U
	 N1opb9t+mJLNiG/9W1MkQfowvgkHgxu1Ea+L3iYE68ftFXREMbR2YMwZMWzjMdssnU
	 OOOKGfxwi7RUrWUE4cmhMVOrAfUhJMYzxX7W3hieXoPbbPjlo9CgGAY2dsObjswOpo
	 K/dbm8rpwrflXZO/pDzc6/x5j75DHX2lodXrtLX2mVYxklDZWghYSrwwD8JRLAtLJ6
	 BXRJjgs9C99zzJ1HWogc0nw0scidOo+Jtk5yGxwJEfb29SIJyk5sGLkWtvnhaixEIq
	 OuXm8c2Zm7gAw==
Date: Mon, 13 Jan 2025 08:11:19 -0700
From: Keith Busch <kbusch@kernel.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?iso-8859-1?Q?Wilczy=B4nski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
Message-ID: <Z4UtF737b3QFGnY0@kbusch-mbp>
References: <20250110140152.27624-3-roger.pau@citrix.com>
 <20250110222525.GA318386@bhelgaas>
 <Z4TlDhBNn8TMipdB@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4TlDhBNn8TMipdB@macbook.local>

On Mon, Jan 13, 2025 at 11:03:58AM +0100, Roger Pau Monné wrote:
> 
> Hm, OK, but isn't the limit 80 columns according to the kernel coding
> style (Documentation/process/coding-style.rst)?

That's the coding style. The commit message style is described in a
different doc:

  https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format

