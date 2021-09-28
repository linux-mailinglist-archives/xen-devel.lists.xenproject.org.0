Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F42041B2EB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 17:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198096.351417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVF0D-0005OM-En; Tue, 28 Sep 2021 15:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198096.351417; Tue, 28 Sep 2021 15:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVF0D-0005MW-Ay; Tue, 28 Sep 2021 15:26:41 +0000
Received: by outflank-mailman (input) for mailman id 198096;
 Tue, 28 Sep 2021 15:26:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVF0C-0005MO-2Z
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:26:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVF0B-0002EU-WA
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:26:39 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mVF0B-00063G-V3
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 15:26:39 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mVF08-000462-Db; Tue, 28 Sep 2021 16:26:36 +0100
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
	bh=zJxTKZel3/62yNh9z5yeO+0UsJntiRh8Zl0HuGTLCkE=; b=1/MKSoCXm5Y1as+lrlqLhuEEEl
	6fxcVQtbk3GFTsc3Jojl1P20nSl2rl1ct0qqtkcmTFzRwtBAXFGD+5lZIJZ7+0Ffhn9xhOUduzt7D
	cREQlsvN4mgrsqvZhJdSnkBQKJvW3rVczpRrqyjIdFBcOunmvfJaeTO2cm2E72TXMjQ8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24915.13356.139165.259646@mariner.uk.xensource.com>
Date: Tue, 28 Sep 2021 16:26:36 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
In-Reply-To: <0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
References: <20210928091517.9761-1-jgross@suse.com>
	<20210928091517.9761-3-jgross@suse.com>
	<24915.1121.8356.288414@mariner.uk.xensource.com>
	<0bd81ff3-a7ac-4000-4c0c-d7127b1c1985@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v5 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> Hmm, maybe I should just use:
> 
> prlimit --nofile=$XENSTORED_MAX_OPEN_FDS \
>     $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS

I guess that would probably work (although it involves another
exec) but I don't understand what's wrong with ulimit, which is a
shell builtin.

I think this script has to run only on Linux and all reasonable Linux
/bin/sh have `ulimit`.  (I have checked dash and bash.)

So I think just

  ulimit -n $XENSTORED_MAX_OPEN_FDS

  $XENSTORED --pid-file @XEN_RUN_DIR@/xenstored.pid $XENSTORED_ARGS

will DTRT.  You could also do this

  ulimit -n $XENSTORED_MAX_OPEN_FDS || true

which will arrange that if, somehow, this fails, the system is likely
to continue to mostly-work despite the error.  Whether that would be
desirable is a matter of taste I think.

(I have RTFM again, and setting -H and -S separately is not needed;
omitting -H or -S means to set both.)

Ian.

