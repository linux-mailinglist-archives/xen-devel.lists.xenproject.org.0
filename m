Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A9196DC0
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 15:50:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIYIP-00040p-5P; Sun, 29 Mar 2020 13:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jlgP=5O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIYIN-00040j-Ae
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 13:48:11 +0000
X-Inumbo-ID: edaefc7c-71c3-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edaefc7c-71c3-11ea-a6c1-bc764e2007e4;
 Sun, 29 Mar 2020 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=m1bcCwdKmlFYgDQ3tPtffzYzRQyRLoHt47xgDRxIpA0=; b=YUSWvkb+fRE457VwYehASH/G90
 w6zen5BwWS+24mbyGwtbRib9EATSI3bA4HFUg5tdAKg2uRiU27zHLH0XCy67jiowqxil2hyLjGF0t
 vTsuMrk5zuyaCIMNlylBjIhRuLhLhHiiuQE1RZRpT2EETZzTNtgBSy+TGEl8EyPC1sGs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIYIJ-0003mY-SX; Sun, 29 Mar 2020 13:48:07 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIYIJ-0001n6-Jt; Sun, 29 Mar 2020 13:48:07 +0000
Date: Sun, 29 Mar 2020 14:48:04 +0100
From: Wei Liu <wl@xen.org>
To: Julien Grall <julien@xen.org>
Message-ID: <20200329134804.6butjlnonib54ren@debian>
References: <20200329072242.GA1394@simran-Inspiron-5558>
 <6f04a17f-610e-1370-7aed-446f46472bc2@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f04a17f-610e-1370-7aed-446f46472bc2@xen.org>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] xen/x86: Use min macro instead of ternary
 operator
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Simran Singhal <singhalsimran0@gmail.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Mar 29, 2020 at 12:08:39PM +0100, Julien Grall wrote:
> Hi,
> 
> On 29/03/2020 08:22, Simran Singhal wrote:
> > Replace ternary operator with macro min as it is shorter and
> > thus increases code readability. Macro min return the minimum of the
> > two compared values.
> 
> While I understand the ternary operator is doing exactly the same as a
> min(), I read the current code as "If there is an error then return the
> error code, otherwise return 0".
> 
> This is quite different from the meaning of "min" which is "I want the
> minimum of the two values". Therefore I am not convinced using min() is the
> right thing to do.

I agree with Julien's assessment.

Wei.

