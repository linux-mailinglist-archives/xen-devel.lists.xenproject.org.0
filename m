Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACE1E805E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeg7W-0008Tp-JI; Fri, 29 May 2020 14:36:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeg7U-0008Tk-Ui
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:36:24 +0000
X-Inumbo-ID: c5987e72-a1b9-11ea-a8ca-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5987e72-a1b9-11ea-a8ca-12813bfff9fa;
 Fri, 29 May 2020 14:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ASbQW/l111czFXENkL/tSDDP7R2aHdoRCkb4iDylmps=; b=1l5yRhLyWTpqwFK+pRrC2rJk3s
 0fYCYLxNGY6Jx1eeXDx1jS4l5HVMsVk1VVxB2lfC1yvGpQubGVLYvu4GEjrxVbgDdhv8cESbGMZaM
 XXB6Gg/ZBTE3hNlcwFfWeQSD3oBvKqgdLv4cN5h3Q6clbx791g6G9LLKAoOeYoqcQm5E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeg7S-0006p9-Vi; Fri, 29 May 2020 14:36:22 +0000
Received: from [212.230.157.105] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeg7S-0003l0-GD; Fri, 29 May 2020 14:36:22 +0000
Date: Fri, 29 May 2020 16:36:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Message-ID: <20200529143613.GP1195@Air-de-Roger>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
 <B5889544-3EB5-41ED-8428-8BCA05269371@arm.com>
 <20200529132020.GN1195@Air-de-Roger>
 <e7a757b4-b285-7089-91ea-d4248443aaf1@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7a757b4-b285-7089-91ea-d4248443aaf1@xen.org>
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
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 02:37:24PM +0100, Julien Grall wrote:
> Hi,
> 
> On 29/05/2020 14:26, Roger Pau Monné wrote:
> > TBH I would just remove the error message on Arm from the current
> > hypercall, I don't think it's useful.
> The message is part of the helpers get_page_from_gva() which is also used by
> copy_{to, from}_guest. While it may not be useful in the context of the
> runstate, it was introduced because there was some other weird bug happening
> before KPTI even existed (see [1]). I haven't yet managed to find the bottom
> line of the issue.
> 
> So I would still very much like to keep the message in place. Although we
> could reduce the number of cases where this is hapenning based on the fault.

Ack, I someone hove wrongly assumed the message was explicitly about
the runstate area, not a generic one in the helpers.

Roger.

