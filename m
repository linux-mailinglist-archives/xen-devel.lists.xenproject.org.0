Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86067BF6EB4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147277.1479611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCpT-0001yq-Ma; Tue, 21 Oct 2025 13:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147277.1479611; Tue, 21 Oct 2025 13:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCpT-0001wk-K5; Tue, 21 Oct 2025 13:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1147277;
 Tue, 21 Oct 2025 13:55:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBCpS-0001wH-Br
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:55:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBCpP-00CjuQ-0f;
 Tue, 21 Oct 2025 13:55:07 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBCpP-005stU-0I;
 Tue, 21 Oct 2025 13:55:07 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=soAqTR95YKtmT/yWQ+zKpozInVkIEeOQhkWi/RjtcA0=; b=g/y2XQFpxz1k0HpbR3+1JHwlWa
	xl1cHz6qOAZR2nxQYlSXho4bM4ROdfRgg5Jfslhxmh0K/St4qVTmzeex1NVYp0RB4btFtKPKGSGRj
	ihqItw8GcRKxXfvSpgOTtjzYrnOEo79q4UIvG7NSZTWcUXtds5pbM8j1xj5POATtrMDQ=;
Date: Tue, 21 Oct 2025 15:55:05 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] hw/xen: pass PCI domain to xc_physdev_map_pirq_msi()
Message-ID: <aPeQuREzCMBa8VXo@l14>
References: <20251017155136.16540-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017155136.16540-1-roger.pau@citrix.com>

On Fri, Oct 17, 2025 at 05:51:36PM +0200, Roger Pau Monne wrote:
> It's currently impossible for passthrough devices on segment different than
> 0 to work correctly, as the PCI domain is not provided to
> xc_physdev_map_pirq_msi(), and hence it's unconditionally assumed that all
> devices are on segment 0.
> 
> Adjust the call to xc_physdev_map_pirq_msi() to pass the PCI domain in the
> high 16bits of the bus parameter.  On versions of Xen where this is not
> supported the passed segment will be ignored and assume to be 0, no worse
> than the current state.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

