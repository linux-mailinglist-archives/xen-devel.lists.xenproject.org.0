Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DCF1E7E0E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:10:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeely-0007Cf-PK; Fri, 29 May 2020 13:10:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tJvr=7L=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeelx-000790-6u
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:10:05 +0000
X-Inumbo-ID: b5243d1d-a1ad-11ea-a8b4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5243d1d-a1ad-11ea-a8b4-12813bfff9fa;
 Fri, 29 May 2020 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=DHAOINmpm6nq8+NpyX885jUqaREsot82c5E8XAtKKj4=; b=cgQQCoONN/2apq1i8rh9YnrxFh
 IrxlgptKpPSEg7pTWsaEwlMLf9TMAYa/IPbNSGJeJThBunJATpUBSobLJjYBApe6h63AH4xCHpomO
 CSGA8sKBnhM/hHM8jGoxRzwzDo5CfsaE/M3yllE2OdqEmG8kKMkS/D/Qnq5JriV2xRqk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeels-0004s6-1K; Fri, 29 May 2020 13:10:00 +0000
Received: from [212.230.157.105] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeelr-0006II-Bj; Fri, 29 May 2020 13:09:59 +0000
Date: Fri, 29 May 2020 15:09:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Message-ID: <20200529130936.GM1195@Air-de-Roger>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
 <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
 <dcfbca54-4773-9f43-1826-f5137a41bd9f@suse.com>
 <43781f37-184d-3ac8-8997-0a9be1de05ce@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43781f37-184d-3ac8-8997-0a9be1de05ce@xen.org>
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
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 11:59:40AM +0100, Julien Grall wrote:
> Hi Jan,
> 
> On 29/05/2020 08:35, Jan Beulich wrote:
> > On 28.05.2020 20:54, Julien Grall wrote:
> > > On 28/05/2020 16:25, Bertrand Marquis wrote:
> > > > At the moment on Arm, a Linux guest running with KTPI enabled will
> > > > cause the following error when a context switch happens in user mode:
> > > > (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> > > > 
> > > > This patch is modifying runstate handling to map the area given by the
> > > > guest inside Xen during the hypercall.
> > > > This is removing the guest virtual to physical conversion during context
> > > > switches which removes the bug
> > > 
> > > It would be good to spell out that a virtual address is not stable. So
> > > relying on it is wrong.
> > 
> > Guests at present are permitted to change the mapping underneath the
> > virtual address provided (this may not be the best idea, but the
> > interface is like it is).
> 
> Well yes, it could be point to data used by the userpsace. So you could
> corrupt a program. It is not very great.

Yes, that's also my worry with the current hypercall. The current
interface is IMO broken for autotranslated guests, at least in the way
it's currently used by OSes.

Roger.

