Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E8231F97
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 15:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0mTy-0001nU-Vv; Wed, 29 Jul 2020 13:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgl/=BI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0mTx-0001nP-JO
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 13:50:57 +0000
X-Inumbo-ID: 86482592-d1a2-11ea-a9e0-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86482592-d1a2-11ea-a9e0-12813bfff9fa;
 Wed, 29 Jul 2020 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596030655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+qc1DfEjoiXNVWZ2IG+kEXKZSJ0lzCe82RtpTGv5Hwc=;
 b=FlY5+I4GKBEpfLKwEbT86OMqWkzxXa97n0/SI/gzpUsrHasdaU9O9O1O
 /qhxZ5udADRsm5dN/lISyqF5sg3l3Dvo5pFsUitTRxS8BjtnqJj2N5/M6
 H8nXMX2JE+JH7JIlvn6zXrHONwck59LNkvEK/KFdCFaKGwiPjAQQRponA E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Acl+VR3AtgtHSSwAQ3sQGZ/3906aHJ6E9Gt6P6wdChGqnhHnH6ILG/3X37zIshulMeA3Aj5XGK
 /F9qDUSI4QyFjgtoqFtI4EdZ/fjqR0w8XUPNH1ciYeJh3scHmrWbK3DFOnc24V4lquCv5f3rNB
 keiO2Sxn81x2ddoIK8Dp3Z56tOCwoE7Gxwl3h20ZaWybIlopFepgNDfv/QZIq/3pPZPWjlkzVF
 ltgc+zCumF+9Tz1VUdQvLxyGuACVQQgHHdHlI+gewqwsZgi0dqx2XBgqfeW/gCvMdKKhrnN5PG
 Et8=
X-SBRS: 2.7
X-MesageID: 23772965
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,410,1589256000"; d="scan'208";a="23772965"
Date: Wed, 29 Jul 2020 15:50:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/spinlock: move debug helpers inside the locked regions
Message-ID: <20200729135045.GD7191@Air-de-Roger>
References: <20200729111330.64549-1-roger.pau@citrix.com>
 <16dd0f04-598b-8b84-8a25-6b89af9214d7@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <16dd0f04-598b-8b84-8a25-6b89af9214d7@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 29, 2020 at 02:37:44PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 29/07/2020 12:13, Roger Pau Monne wrote:
> > Debug helpers such as lock profiling or the invariant pCPU assertions
> > must strictly be performed inside the exclusive locked region, or else
> > races might happen.
> > 
> > Note the issue was not strictly introduced by the pointed commit in
> > the Fixes tag, since lock stats where already incremented before the
> > barrier, but that commit made it more apparent as manipulating the cpu
> > field could happen outside of the locked regions and thus trigger the
> > BUG_ON.
> 
> From the wording, it is not entirely clear which BUG_ON() you are referring
> to. I am guessing, it is the one in rel_lock(). Am I correct?

Yes, that's right. Expanding to:

"...  and thus trigger the BUG_ON in rel_lock()." would be better.

> Otherwise, the change looks good to me.

Thanks.

