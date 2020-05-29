Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1461E785F
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 10:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeaQV-0004YA-8I; Fri, 29 May 2020 08:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeaQT-0004Y5-DW
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 08:31:37 +0000
X-Inumbo-ID: cf85b5a4-a186-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf85b5a4-a186-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vZOraFRi6ebW9XR1eiOz56rc1fu0447TUnDn/r88w0o=; b=tj5OnQuyLzx2BNwRr0g0R7Hb9u
 /1VDZaiEQ1meYA/dRnaBhw7hAqH/+RANumF4l1F1R+PEWyGNpceBEuZl6D5gqxcLZxWYASKMClauS
 7UdjweEQeKSApHI3FdYLfmCZIo4rZ/ptXqRwtOctjoC0TC4Ux6dqljOl0AqVBaK4KZJ8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeaQS-0006qZ-5f; Fri, 29 May 2020 08:31:36 +0000
Received: from [212.230.157.105] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeaQR-0004kQ-Qv; Fri, 29 May 2020 08:31:36 +0000
Date: Fri, 29 May 2020 10:31:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 3/3] clang: don't define nocall
Message-ID: <20200529083122.GJ1195@Air-de-Roger>
References: <20200528144023.10814-1-roger.pau@citrix.com>
 <20200528144023.10814-4-roger.pau@citrix.com>
 <8aa8d35f-2928-2096-a47c-26659c5a43a2@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8aa8d35f-2928-2096-a47c-26659c5a43a2@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 08:25:44AM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 28/05/2020 15:40, Roger Pau Monne wrote:
> > Clang doesn't support attribute error, and the possible equivalents
> > like diagnose_if don't seem to work well in this case as they trigger
> > when when the function is not called (just by being used by the
> > APPEND_CALL macro).
> 
> OOI, could you share the diagnose_if change you tried?

I've sent a reduced version to the llvm-dev mailing list, because I
think the documentation should be fixed for diagnose_if. The email
with the example is at:

http://lists.llvm.org/pipermail/llvm-dev/2020-May/141908.html

FWIW, using the deprecated attribute will also trigger the same
error/warning even when not calling the function from C.

> > 
> > Define nocall to a noop on clang until a proper solution can be found.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks!

