Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A81A20DB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 14:01:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM9Nu-0007dR-TW; Wed, 08 Apr 2020 12:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM9Nt-0007dM-Or
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 12:00:45 +0000
X-Inumbo-ID: 93b09256-7990-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93b09256-7990-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 12:00:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49E93AE12;
 Wed,  8 Apr 2020 12:00:43 +0000 (UTC)
Subject: Re: [XEN PATCH v4 07/18] build: Introduce documentation for xen
 Makefiles
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a5f89d5-de77-c548-972f-231061419e51@suse.com>
Date: Wed, 8 Apr 2020 14:00:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-8-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:30, Anthony PERARD wrote:
> This start explainning the variables that can be used in the many
> Makefiles in xen/.
> 
> Most of the document copies and modifies text from Linux v5.4 document
> linux.git/Documentation/kbuild/makefiles.rst. Modification are mostly
> to avoid mentioning kbuild. Thus I've added the SPDX tag which was
> only in index.rst in linux.git.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one question:

> +Compilation flags
> +-----------------
> +
> +    CFLAGS-y and AFLAGS-y
> +	These two flags apply only to the makefile in which they
> +	are assigned. They are used for all the normal cc, as and ld
> +	invocations happening during a recursive build.
> +
> +	$(CFLAGS-y) is necessary because the top Makefile owns the
> +	variable $(XEN_CFLAGS) and uses it for compilation flags for the
> +	entire tree. And the variable $(CFLAGS) is modified by Config.mk
> +	which evaluated in every subdirs.
> +
> +	CFLAGS-y specifies options for compiling with $(CC).
> +	AFLAGS-y specifies assembler options.

Is it perhaps worth mentioning that c_flags and a_flags should
not be fiddled with by individual Makefile-s?

Jan

