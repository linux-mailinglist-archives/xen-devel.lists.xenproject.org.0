Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E735B32EE66
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 16:20:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93841.177252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICFf-0004pw-FO; Fri, 05 Mar 2021 15:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93841.177252; Fri, 05 Mar 2021 15:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICFf-0004pX-CP; Fri, 05 Mar 2021 15:20:27 +0000
Received: by outflank-mailman (input) for mailman id 93841;
 Fri, 05 Mar 2021 15:20:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lICFd-0004pS-R7
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:20:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lICFd-0000SP-P3
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:20:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lICFd-0002aF-Nl
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:20:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lICFU-0000Ki-FQ; Fri, 05 Mar 2021 15:20:16 +0000
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
	bh=YSi7ULddfUnPkUYhWh0A73+YlLdfr413xo1+z2q1PpE=; b=6tOF8AhH9pzQ33A2lamkA/ewEN
	ulngiZjQYakxER6mRFt4IoSie7Yph5u5lVbhtTnag6dyNi86s5twd2L/4zVqydMKB0jnY7vfYQRNu
	BEYdZwhbdpZvjJFt9Fz+navtUQnWb3xD7ifk6wBZKzaoGcsLp7jajV4iVCNAj/13K/wc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24642.19504.207757.633803@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 15:20:16 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from
 public API
In-Reply-To: <bdbe6c35-450a-479e-2675-259a6bbe218b@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
	<20210305124949.6719-3-andrew.cooper3@citrix.com>
	<9b4acfc5-6d96-7922-7fde-5d0d543f8201@suse.com>
	<68a69e57-66b5-6f59-39f4-40649112fe40@citrix.com>
	<6b9fa11e-353e-8e10-8bec-f5c7930aae94@suse.com>
	<0e0fe64c-0834-a3e9-e85c-c17d8a510941@suse.com>
	<bdbe6c35-450a-479e-2675-259a6bbe218b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
> The use in the dom0 kernel wasn't kept secret in the slightest.  It was
> discussed on at the time, and at dev summits.

No-one is accusing anyone of keeping anything secret.

> But upstream tends to only remember/care about the bits which pertain
> directly to upstream,

I would prefer to say that upstream only tends to remember things
which are WRITTEN DOWN.

Ian.

