Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075ECCC0EC
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 14:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189620.1510348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEFd-0001J4-5r; Thu, 18 Dec 2025 13:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189620.1510348; Thu, 18 Dec 2025 13:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEFd-0001GB-2v; Thu, 18 Dec 2025 13:41:05 +0000
Received: by outflank-mailman (input) for mailman id 1189620;
 Thu, 18 Dec 2025 13:41:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vWEFb-0001G4-QG
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 13:41:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vWEFb-00FzwZ-0R;
 Thu, 18 Dec 2025 13:41:03 +0000
Received: from [2a01:cb15:80df:da00:905c:b08:ead3:d4cf] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vWEFb-000yon-0M;
 Thu, 18 Dec 2025 13:41:03 +0000
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
	bh=UZcmQmbqlTxqqpYrOiuw1JYWA+2Tc+SJFDYxInq5FPc=; b=Be6++uqaa4hfs7UVvpaax6bYIr
	uXCrnI/7Qcpn2a40Ra7sHw7FQ+CX6Eoy2+i4KBRbxYxnInvfdhwxU6tSi7PCleQ2UtQpvC4oTGTab
	9lHZwMOGy8hIEa2kFHOg1LBcKb2vsME1IkZOswnBvuK1S1Y6EiPbuVTa3jDUWAqVA+XU=;
Date: Thu, 18 Dec 2025 14:41:01 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] tools/fuzz: use vpath uniformly for access to hypervisor
 library code
Message-ID: <aUQEbVRCXxzXJxJk@l14>
References: <0cdf924a-2e9b-4997-a01d-6d8b2f711104@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cdf924a-2e9b-4997-a01d-6d8b2f711104@suse.com>

On Tue, Dec 16, 2025 at 04:34:31PM +0100, Jan Beulich wrote:
> It's not quite clear why for libelf and the emulator we use symlink-ing,
> while elsewhere we use vpath. Do so for these two as well, thus also
> eliminating the need for custom -iquote options and custom cleaning.

It was an attempt to rework the "tools/" makefiles to be non-recursive,
via the use of subdirmk. `vpath` wouldn't have worked in that
configuration as stated in the commit introducing the symlink.
But I never managed to finish this conversion.

Cheers,

-- 
Anthony PERARD

