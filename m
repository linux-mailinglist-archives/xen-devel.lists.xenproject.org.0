Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F0327BE11
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 09:33:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNA7t-00030H-MY; Tue, 29 Sep 2020 07:32:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNA7r-00030C-U2
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 07:32:39 +0000
X-Inumbo-ID: d283ee28-55db-4d30-882a-38decc093444
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d283ee28-55db-4d30-882a-38decc093444;
 Tue, 29 Sep 2020 07:32:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601364758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZBFq7BsdmwSOQJZhkX+TQ7PL/pZIx9aI52x0DHmqhI=;
 b=SvFNKU/INKKBXThsu6gqVM5GLfXCgqrkC0GK6NHuiw7t/8bn1yC8QdSbjYz7PgUe6RyAdo
 UemuCRNV+W66sToaLwhGJ4OC3w0Fp2IwhsLnpJvp5s2NNBFjPmYoeX3+Mk1ldDMKZTvrik
 +EY0qcMWc5qM4Q7dj6pt7iophAvAhxY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 340D8AC98;
 Tue, 29 Sep 2020 07:32:38 +0000 (UTC)
Subject: Re: [PATCH] x86/xen: only unlock when USE_SPLIT_PTE_PTLOCKS is true
To: Jason Yan <yanaijie@huawei.com>
References: <20200929064828.3606720-1-yanaijie@huawei.com>
Cc: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afcfc8b1-182d-df7d-7a02-e5e19876e76a@suse.com>
Date: Tue, 29 Sep 2020 09:32:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929064828.3606720-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.09.2020 08:48, Jason Yan wrote:
> When USE_SPLIT_PTE_PTLOCKS is false, xen_pte_lock() actually do nothing
> but returns NULL. So xen_pte_unlock() should not actually unlock.
> Otherwise a NULL pointer dereference will be triggered.
> 
> Fixes: 74260714c56d ("xen: lock pte pages while pinning/unpinning")

I neither see any breakage this commit introduces, nor any NULL
deref. Both calls to (or arrangements to call) xen_pte_unlock() are
guarded by a check of the pointer to be non-NULL. Therefore if
anything this is a cosmetic change, which the description should
express, and which should have no Fixes: tag. (I would guess the
intention back then was to avoid #ifdef-ary where possible, at the
expense of a little bit of dead code.)

Jan

