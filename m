Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6F1A56DAA
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:28:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905193.1313042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqaYT-0002iU-6w; Fri, 07 Mar 2025 16:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905193.1313042; Fri, 07 Mar 2025 16:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqaYT-0002gI-4F; Fri, 07 Mar 2025 16:28:09 +0000
Received: by outflank-mailman (input) for mailman id 905193;
 Fri, 07 Mar 2025 16:28:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tqaYR-0002gA-33
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:28:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tqaYL-0073eI-0u;
 Fri, 07 Mar 2025 16:28:01 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tqaYK-00Cnez-2N;
 Fri, 07 Mar 2025 16:28:00 +0000
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
	bh=yaoCgDwqPyoie72Nhfe+CmsilcG3+4JgnZmBZXTTZiQ=; b=eiXtWsOxKcduOtyeeVJGRo+Ou/
	EYOmMaDXtOCNb00An1PE4X6sIol0l8eepolAbmxtI+u30yfE7p1/iuLxRAUq4Y6VpsSF31BeAOEE6
	EdZs8/zfOkC7QO0tGEpo62woi03QSEn1SCLsAMAwK9yFYGQIWcupRcD7SbQZbD3XgOwQ=;
Date: Fri, 7 Mar 2025 17:27:56 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, sstabellini@kernel.org,
	paul@xen.org, olaf@aepfle.de, edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/1] xen: No need to flush the mapcache for grants
Message-ID: <Z8sejC7gUn5MPJSy@l14>
References: <20250206194915.3357743-1-edgar.iglesias@gmail.com>
 <20250206194915.3357743-2-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206194915.3357743-2-edgar.iglesias@gmail.com>

On Thu, Feb 06, 2025 at 08:49:15PM +0100, Edgar E. Iglesias wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> On IOREQ_TYPE_INVALIDATE we need to invalidate the mapcache for regular
> mappings. Since recently we started reusing the mapcache also to keep
> track of grants mappings. However, there is no need to remove grant
> mappings on IOREQ_TYPE_INVALIDATE requests, we shouldn't do that. So
> remove the function call.
> 
> Fixes: 9ecdd4bf08 (xen: mapcache: Add support for grant mappings)
> Cc: qemu-stable@nongnu.org
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

