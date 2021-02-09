Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E73157BA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83419.155216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZhC-0006gv-SL; Tue, 09 Feb 2021 20:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83419.155216; Tue, 09 Feb 2021 20:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZhC-0006gW-P2; Tue, 09 Feb 2021 20:33:14 +0000
Received: by outflank-mailman (input) for mailman id 83419;
 Tue, 09 Feb 2021 20:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l9ZhB-0006gR-Da
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:33:13 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a72d443-996c-426a-bc59-b7eaf68ecbbe;
 Tue, 09 Feb 2021 20:33:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z6so23595421wrq.10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 12:33:12 -0800 (PST)
Received: from CBGR90WXYV0 (host86-180-176-157.range86-180.btcentralplus.com.
 [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id k6sm41012436wro.27.2021.02.09.12.33.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:33:11 -0800 (PST)
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
X-Inumbo-ID: 4a72d443-996c-426a-bc59-b7eaf68ecbbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=3iyx9VVlDE6qQNYd7wWdV49vT9TLEOl7/nUPjTiL/N4=;
        b=mRJmOY4beMvTvvFz/TOXeNBJf9/AQ/t6RHOz8s5VjWEsg/0T4DiFAVic0JEYMMflXz
         mbDKAVTJ6xMA1rddrVPI4zgshuBYv+lZY9JiuaRWDoSS25gzhxTM+k/XjFTPEiTZvpKZ
         08/6AuydsuZpL54aW+E1q/FCSA2oZuaLlEJByf2Zg3JlGfNxiWq83c1Pbf4GkLOm/Ip+
         rI1L5czgKGwqgS1q0FCHLkpkbE9ZqRR6BxDN1D9FodxRzhOG9lE98ZsXsgPR7ZK+gQbl
         GbYAdpkGeaTKRnUa6pHK4U4t9kBjksewhDpMiIjA6xr4lEESLvDKJ+oiF7Jgq2e66d6I
         GLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=3iyx9VVlDE6qQNYd7wWdV49vT9TLEOl7/nUPjTiL/N4=;
        b=mRQ4cWMHUr1Ot2Gtx0Cl9JEvIwGJDFmAQyWfj5ZnQjKZ4BBNs9waKOWCroVzlYykuq
         XhaIDT18vDMWCwMyuqSvVgYZJT6ifKWUz533Z7YQvh96+y0byAB2G6zVMxc+a1texCYM
         8E0mxv/xPg4pYHw8W1EmvdHVczj8lGdYoiB6x5m35B1psKp7DUhbXpL053SzWlKHEiAu
         KKXCiZ70ukQCUxNbBGGsse7gf5x+sVXD043FE1MS8pppsn2tG7q46TRUDCYOas0UNV2H
         cEpk8tNYtE8BNhSqgvI+2RTncdm6GSl1s6siGv6o6L7dVnmV41pGbdCqrMlIOqcO/Do2
         CktA==
X-Gm-Message-State: AOAM532ZFJM+4Sgpu6s45NATT7fuCKMwYPUYkV8JZQdKcbSZTbo/ZE35
	UnqUpTXzP3srOHMzu7vN6/g=
X-Google-Smtp-Source: ABdhPJzTiSpA46gDk0XLNGFrO6od8nzFaQzNXeSPtgmJPcbmQ+QTVE1IFRNwfTBSCfWpsiKkzFaJcQ==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr8414113wrz.89.1612902791971;
        Tue, 09 Feb 2021 12:33:11 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>,
	"'Julien Grall'" <jgrall@amazon.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
References: <20210209152816.15792-1-julien@xen.org> <20210209152816.15792-5-julien@xen.org>
In-Reply-To: <20210209152816.15792-5-julien@xen.org>
Subject: RE: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU page-tables
Date: Tue, 9 Feb 2021 20:33:10 -0000
Message-ID: <04f801d6ff22$c8acd830$5a068890$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJkA3sfHUQVO5jg8t87X8qwyW0VowJUSDRyqSOYttA=
Content-Language: en-gb

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 09 February 2021 15:28
> To: xen-devel@lists.xenproject.org
> Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall <jgrall@amazon.com>; Jan Beulich
> <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
> Subject: [for-4.15][PATCH v2 4/5] xen/iommu: x86: Don't leak the IOMMU page-tables
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> The new IOMMU page-tables allocator will release the pages when
> relinquish the domain resources. However, this is not sufficient when
> the domain is dying because nothing prevents page-table to be allocated.
> 
> iommu_alloc_pgtable() is now checking if the domain is dying before
> adding the page in the list. We are relying on &hd->arch.pgtables.lock
> to synchronize d->is_dying.
> 
> Take the opportunity to check in arch_iommu_domain_destroy() that all
> that page tables have been freed.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>


