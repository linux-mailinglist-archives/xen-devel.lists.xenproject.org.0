Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4D5AE66AF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023702.1399740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3qE-0004bL-Ow; Tue, 24 Jun 2025 13:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023702.1399740; Tue, 24 Jun 2025 13:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3qE-0004ZK-Lq; Tue, 24 Jun 2025 13:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1023702;
 Tue, 24 Jun 2025 13:37:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uU3qD-0004ZE-6q
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:37:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uU3qC-000Krh-1g;
 Tue, 24 Jun 2025 13:37:36 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uU3qC-00H5np-0i;
 Tue, 24 Jun 2025 13:37:36 +0000
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
	bh=u0CZyf0YGFc8E3hpfxNE9Am/YLC1bZu/7k6uh5EdQMg=; b=D6BJGTDjiDCbz32IZQaH3jqIpJ
	PYAAh5cWNBt4VXkt43hLZyI2Nwv2q4h8wrKeQWQsmZSWUDJbFjVNc0zlNedAgQE8+jHFCcp/zhIqF
	XPn8zhcr58ewfj8vA36n8E0UukPwD6TWt+UmM+v9HrEG7Ot2UUihv/rX8lfD34SoZYyg=;
Date: Tue, 24 Jun 2025 15:37:34 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 6/8] test/pdx: add PDX compression unit tests
Message-ID: <aFqqHtRPmbndhcnK@l14>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-7-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620111130.29057-7-roger.pau@citrix.com>

On Fri, Jun 20, 2025 at 01:11:28PM +0200, Roger Pau Monne wrote:
> +.PHONY: run
> +run: $(TARGETS)
> +ifeq ($(CC),$(HOSTCC))
> +	for test in $? ; do \
> +		./$$test ;  \
> +	done

You need to add `set -e` or the exit value from the tested binary might
be ignored. This `run` target only failed if the last test binary return
a failure.

> +else
> +	$(warning HOSTCC != CC, will not run test)
> +endif
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.c pdx.h

Is this "pdx.c" left over from version? It doesn't seems to be generated
by this makefile.

> +
> +pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
> +	sed -E -e '/^#[[:space:]]?include/d' <$< >$@

Why allow only zero or one space characters between '#' and
"include"? Why not used '*' instead of '?' ?


Thanks,

-- 
Anthony PERARD

