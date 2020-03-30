Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AAB19815F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 18:38:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIxNe-0000d5-9U; Mon, 30 Mar 2020 16:35:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8l10=5P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jIxNc-0000d0-Ft
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 16:35:16 +0000
X-Inumbo-ID: 6f6ddb4e-72a4-11ea-b9e8-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f6ddb4e-72a4-11ea-b9e8-12813bfff9fa;
 Mon, 30 Mar 2020 16:35:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45A6020578;
 Mon, 30 Mar 2020 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585586115;
 bh=LXXXvSmZ3tlihJJx2PDGWFu8dGE5oCrKU3iW2CJJLzQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=U2ZNWcH9c/51YzqlEzGc5z+lQInPxJ/TnPV3pcpiRTX3JvUhvbH6hlypE0iqPuM+O
 QKX+5O5OcaZCs/S8om8lJBLRmGyfPnHeJWLVqL9xqZsxLCdrOr1FFW7q8E4+Zyy5gx
 rhrBxTQYDkwFIWOEN5pSLefNHGv1QkVmSkl3h95M=
Date: Mon, 30 Mar 2020 09:35:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
Message-ID: <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER
 reads
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 28 Mar 2020, Julien Grall wrote:
> qHi Stefano,
> 
> On 27/03/2020 02:34, Stefano Stabellini wrote:
> > This is a simple implementation of GICD_ICACTIVER / GICD_ISACTIVER
> > reads. It doesn't take into account the latest state of interrupts on
> > other vCPUs. Only the current vCPU is up-to-date. A full solution is
> > not possible because it would require synchronization among all vCPUs,
> > which would be very expensive in terms or latency.
> 
> Your sentence suggests you have number showing that correctly emulating the
> registers would be too slow. Mind sharing them?

No, I don't have any numbers. Would you prefer a different wording or a
better explanation? I also realized there is a typo in there (or/of).

