Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEB9044EF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 21:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738726.1145579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7I2-0006bl-3l; Tue, 11 Jun 2024 19:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738726.1145579; Tue, 11 Jun 2024 19:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH7I2-0006Zy-0V; Tue, 11 Jun 2024 19:36:18 +0000
Received: by outflank-mailman (input) for mailman id 738726;
 Tue, 11 Jun 2024 19:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+2X=NN=linux-foundation.org=akpm@srs-se1.protection.inumbo.net>)
 id 1sH7Hz-0006Zi-P7
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 19:36:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcbde3f3-2829-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 21:36:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5D446117E;
 Tue, 11 Jun 2024 19:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5183C2BD10;
 Tue, 11 Jun 2024 19:36:11 +0000 (UTC)
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
X-Inumbo-ID: dcbde3f3-2829-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718134572;
	bh=GdA6KT5UlfpnGhC3psTeDTcc9QB/a0N+IRhJ64cOBEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JB948CVYmQmTc/5A4rHdUtUx98VRAUbQLgcPx7ZLb7Ixz24iZxaAzJDVfs+JRO5YW
	 CCPvVl85B+g0dyiNojTR+kxGEPc9ZgbqQD2ZBp34OLwozipdz5vU+CNeaE3NaT5REm
	 svy2ZcgGUGTCQSvDFEiwKvklcemFxCLjWAbltRSA=
Date: Tue, 11 Jun 2024 12:36:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, kasan-dev@googlegroups.com, Mike Rapoport
 <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v1 2/3] mm/memory_hotplug: initialize memmap of
 !ZONE_DEVICE with PageOffline() instead of PageReserved()
Message-Id: <20240611123611.36d0633c65ec8171152fe803@linux-foundation.org>
In-Reply-To: <824c319a-530e-4153-80f5-20e2c463fa81@redhat.com>
References: <20240607090939.89524-1-david@redhat.com>
	<20240607090939.89524-3-david@redhat.com>
	<824c319a-530e-4153-80f5-20e2c463fa81@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Jun 2024 11:42:56 +0200 David Hildenbrand <david@redhat.com> wrote:

> > We'll leave the ZONE_DEVICE case alone for now.
> > 
> 
> @Andrew, can we add here:
> 
> "Note that self-hosted vmemmap pages will no longer be marked as 
> reserved. This matches ordinary vmemmap pages allocated from the buddy 
> during memory hotplug. Now, really only vmemmap pages allocated from 
> memblock during early boot will be marked reserved. Existing 
> PageReserved() checks seem to be handling all relevant cases correctly 
> even after this change."

Done, thanks.

