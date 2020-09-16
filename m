Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E542F26C18B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 12:16:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIUTa-00037G-I6; Wed, 16 Sep 2020 10:15:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIUTZ-00036d-OH
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 10:15:45 +0000
X-Inumbo-ID: 6c047847-f5e0-4247-b906-834daa4fa09f
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c047847-f5e0-4247-b906-834daa4fa09f;
 Wed, 16 Sep 2020 10:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600251344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6Dd97ERfrqNS38sEZtk9PVeUIARAoj9FAEz85fIHVWc=;
 b=UGB16rEzX+jhBsKSdmYg4KfFgSI0/bOyhzciAx2qlLL9PYaMiz4dQGvT
 we/B+gR6ly8QFujqGGeMDZKs+JQd02pkzSdSd/Mdcody0+jyyZEdUSgSB
 5vy4wSD03BeBqq27zj9sMtnlyCOUX7apybe0fDlF0HgI1a8WsaXpLOJ4p 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: S0OWKcDxB7qWP49DBY3vuiHO2C7H3u8uVdxBlZkpHI2fg2oMyGMgoa55bX0BMwfimjqy+SEHmk
 +YZ0NOJ89SINttwn4C46eUhkKbZRnsiktJovKtkSYc5xyAaJCML1VgJ4FlqcfENbdYaSvZPylY
 7nh4Ep7DVf4wgOeTTAmrrqD0rJBqMkK44inmCwhDo0yt7+QmOQz1C4FzjPKx/jenm05OBUB62C
 5vbGZQwELD+ahs+zYq5pCz+PFypeycUdLtbhOtqTg/wrLRnQz1hYPqSSgz+/M2Q1VRBJnpIXtp
 Y84=
X-SBRS: 2.7
X-MesageID: 26788203
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,432,1592884800"; d="scan'208";a="26788203"
Date: Wed, 16 Sep 2020 12:15:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <20200916101020.GU753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net>
 <20200916073209.GR753@Air-de-Roger>
 <vJMfvKtNZyMgJ7EsE4gKz79cATC-4xxU3hrAkz1PlvmArEQJ_jcXR61uiCggcKjISspFs2h4CrL1M9uLGM1kI25UmudG9YueJY1af6VPDmY=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vJMfvKtNZyMgJ7EsE4gKz79cATC-4xxU3hrAkz1PlvmArEQJ_jcXR61uiCggcKjISspFs2h4CrL1M9uLGM1kI25UmudG9YueJY1af6VPDmY=@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 16, 2020 at 08:37:44AM +0000, Trammell Hudson wrote:
> On Wednesday, September 16, 2020 3:32 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > On Mon, Sep 14, 2020 at 07:50:12AM -0400, Trammell Hudson wrote:
> > > -   s2w(&name_string);
> >
> > Don't you need to check that s2w succeed, so that name_string.w is not
> > a random pointer from stack garbage?
> 
> Maybe? I don't see anywhere else in the code that s2w() is
> ever checked for a NULL return.

I see some callers pass the return of s2w() straight into read_file
which will check that's not NULL before proceeding, or else call
PrintErrMesg which won't return.

> Perhaps a better fix would
> be to modify the function to panic if it is unable
> to allocate.

Just doing what read_file does and use PrintErrMesg seems fine to me.

Roger.

