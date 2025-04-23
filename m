Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011ACA98DF9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 16:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964868.1355561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bRe-0000vY-Tw; Wed, 23 Apr 2025 14:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964868.1355561; Wed, 23 Apr 2025 14:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7bRe-0000tV-Qj; Wed, 23 Apr 2025 14:51:26 +0000
Received: by outflank-mailman (input) for mailman id 964868;
 Wed, 23 Apr 2025 14:51:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u7bRd-0000tP-KI
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 14:51:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7bRd-00H7uE-0j;
 Wed, 23 Apr 2025 14:51:25 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u7bRc-00EJqh-32;
 Wed, 23 Apr 2025 14:51:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=ZMUdDQeYf0Mz/yAiP1UoRcaMoDSSQYKu6rtE9bZNjuc=; b=4oelYfjtXfFUGL07zS/XMZJM4I
	IteRILWLh/UVzSG3bcknhbwWmKKrTK3NEwyzryTOK247Fk7/9ayFLuXsgSD2b6/dnXFh9nldAvGUj
	UDcMT/LfeIbd0dgRwjclH6MFThZO89WTUc+mGJ3jTUWch1WhCF/PbbDlKEvNwhg9RcZA=;
Date: Wed, 23 Apr 2025 16:51:23 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] tools/libxl: Skip invalid IRQs
Message-ID: <aAj-a3wwNWCjKPdl@l14>
References: <20250418210550.542456-1-jason.andryuk@amd.com>
 <20250418210550.542456-2-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418210550.542456-2-jason.andryuk@amd.com>

On Fri, Apr 18, 2025 at 05:05:49PM -0400, Jason Andryuk wrote:
> A PCI device's irq field is an 8-bit number.  A value of 0xff indicates
> that the device IRQ is not connected.  Additionally, the Linux ACPI code
> can convert these 0xff values to IRQ_NOTCONNECTED(0x80000000) because
> "0x80000000 is guaranteed to be outside the available range of
> interrupts and easy to distinguish from other possible incorrect
> values."  When the hypercall to assign that IRQ fails, device
> passthrough as a whole fails.
> 
> Add checking for a valid IRQ and skip the IRQ handling for PCI devices
> outside that range.  This allows for passthrough of devices without
> legacy IRQs.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

