Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BC3DB6C7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 12:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162446.297908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PNE-0004SF-L8; Fri, 30 Jul 2021 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162446.297908; Fri, 30 Jul 2021 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9PNE-0004QR-He; Fri, 30 Jul 2021 10:04:12 +0000
Received: by outflank-mailman (input) for mailman id 162446;
 Fri, 30 Jul 2021 10:04:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9PND-0004QL-HE
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 10:04:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9PND-0000kR-Ez
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 10:04:11 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m9PND-0004sr-Dz
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 10:04:11 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m9PN8-0005dH-Oq; Fri, 30 Jul 2021 11:04:06 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=65y4krd8WIipq4r8pUv36jBMqQSBR4mXWE9+V/XRPws=; b=b3Sb/Ca0En828BKXww0lbfdxGb
	LBoVpngAPptfi1oLo7Ir2uOuE7yKCgFxC3VU3M0XlN51w815XDPiyNzNzZeodbzGtHESocwEEkHNk
	U45hL5a7NpWG4Y+mmhfSP/pjRzjJvSVhdx2jG0Lwj8xdU5BjevR3nr1vfXm6XSd91L0U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24835.52886.559668.533509@mariner.uk.xensource.com>
Date: Fri, 30 Jul 2021 11:04:06 +0100
To: Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xenstored: Fix off-by-one in dump_state_nodes() [and 3 more messages]
In-Reply-To: <20210729093420.14092-1-julien@xen.org>,
	<10373f47-fa1a-59c0-7ec3-a1a86c9754ce@suse.com>,
	<20210729110602.24815-1-julien@xen.org>,
	<86b0ac1c-8a93-f08c-b227-ed000c3167f6@suse.com>
References: <20210729110602.24815-1-julien@xen.org>
	<86b0ac1c-8a93-f08c-b227-ed000c3167f6@suse.com>
	<20210729093420.14092-1-julien@xen.org>
	<10373f47-fa1a-59c0-7ec3-a1a86c9754ce@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH] tools/xenstored: Fix off-by-one in dump_state_nodes()"):
> The maximum path length supported by Xenstored protocol is
> XENSTORE_ABS_PATH_MAX (i.e 3072). This doesn't take into account the
> NUL at the end of the path.
...

Julien Grall writes ("[PATCH] tools/xenstored: Propagate correctly the error message from lu_start()"):
> lu_start() will only set errno when it returns NULL. For all the
> other cases, the value is unknown.

Thanks, and to Juergen for the reviews.  Pushed.

Ian.

