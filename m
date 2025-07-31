Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D779B16F27
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 12:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065337.1430754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhQ9H-0002ex-Cz; Thu, 31 Jul 2025 10:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065337.1430754; Thu, 31 Jul 2025 10:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhQ9H-0002cm-AE; Thu, 31 Jul 2025 10:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1065337;
 Thu, 31 Jul 2025 10:04:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uhQ9G-0002cg-8E
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 10:04:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhQ9F-00AnVa-1z;
 Thu, 31 Jul 2025 10:04:29 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhQ9F-000KH7-0w;
 Thu, 31 Jul 2025 10:04:29 +0000
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
	bh=w9lRAKuy+zPC6Th4jO7Ljdr+5ejoOKDfjvl0hXTuP5E=; b=K0yq2A6eNbWW/n7a6PHaJrKFvi
	tFIRmxIb6/kmwZEA5CKkicM6g2AheAd/pdAqSddMpGKmQNd6V+nmwoqNbAc+8H8B0FCVKy9kzzhuz
	Zsdzl1LCUM1iWUMOcbR/NXwJS582PjrgU4Qfdj1waMkJuNwM6Nt4rLT+8KVVfk4E/j5E=;
Date: Thu, 31 Jul 2025 12:04:27 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 2/4] tools/xl: Allow compilation of 'xl resume'
 command on Arm
Message-ID: <aIs_q8wLimcsxOhe@l14>
References: <cover.1753778926.git.mykola_kvach@epam.com>
 <1394ced0f1268244bfe4875152874f3f8ee0378a.1753778926.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394ced0f1268244bfe4875152874f3f8ee0378a.1753778926.git.mykola_kvach@epam.com>

On Tue, Jul 29, 2025 at 11:52:12AM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The "xl resume" command was previously excluded from Arm builds because
> system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
> implemented. On x86, this command is used for resume.
> 
> This change enables compilation of `xl resume` on Arm regardless of the
> underlying implementation status, making the tool available for testing
> and future feature support. The relevant libxl infrastructure and handler
> functions are already present and usable.
> 
> Note: This does not imply full system suspend/resume support on Arm.
>       The `xl suspend` command still does not work on Arm platforms.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v7:
> - dropped renaming of LIBXL_HAVE_NO_SUSPEND_RESUME macro

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

