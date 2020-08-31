Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9E257B09
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 16:03:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCkPE-0005nY-I2; Mon, 31 Aug 2020 14:03:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWhU=CJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kCkPD-0005nS-1O
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 14:03:31 +0000
X-Inumbo-ID: da85a571-c3b3-4b59-bebf-56fc79b5cf16
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da85a571-c3b3-4b59-bebf-56fc79b5cf16;
 Mon, 31 Aug 2020 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598882609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GGL92zDsDEBhtlB47Ibhw7cKKk/53Gqr7ILVI0vXwvI=;
 b=O0GqE7wqLDmw7cZHKeoiP70osFSyacRMBMyL7IckWoj41GEtIrdNmQle
 wduFjj1fvNQwtiefz745TFUnThje0wGyS43+6snQPLrW4Mwjo7xf4gc6i
 R+IS8Xiu6BamMiP0cObbS9Mu1a9na+NfzY6FZy+aCnESL9Ke4M3XuU8ze M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GFec5iw6713daWfdoo4Qwl4IdLL9VEKDRi0FByZwy7xolz/eUdHErx+0zEnDJFSILh7krWySbb
 iXXV/CjscY9kJS89SAXxsmuGOVHTVFGQxIPNgIgrpA+gGF8SRvky0EuB77SFJMFnAIvVlT/ush
 t0dzCZjXW5jPYKrdqmxfQKG2GV2aQVv2wb25aIcZPpjv0OIlk00EGTlA0w96WEOKCmkpfA635J
 W8xd9c56+RYJ30/BLR10aU01rag92QpVdItFyb6VlEEfB2ee/nXQohAIETbK+rC7V/1I+OmKtN
 jC4=
X-SBRS: 2.7
X-MesageID: 25640968
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,375,1592884800"; d="scan'208";a="25640968"
Date: Mon, 31 Aug 2020 16:03:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Subject: Re: Ping: [PATCH v3 5/8] evtchn: add compat struct checking for
 newer sub-ops
Message-ID: <20200831140304.GB753@Air-de-Roger>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
 <99e52b76-de0f-13ac-f37a-6e14cd4b566f@suse.com>
 <3599eaa2-66b2-9039-829b-2409844d194d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3599eaa2-66b2-9039-829b-2409844d194d@suse.com>
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

On Mon, Aug 31, 2020 at 09:44:10AM +0200, Jan Beulich wrote:
> On 23.07.2020 17:50, Jan Beulich wrote:
> > Various additions to the interface did not get mirrored into the compat
> > handling machinery. Luckily all additions were done in ways not making
> > any form of translation necessary.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > v3: New.
> 
> Anyone?

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

