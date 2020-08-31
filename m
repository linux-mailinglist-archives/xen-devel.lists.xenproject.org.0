Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A25257C38
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 17:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCldW-00052B-24; Mon, 31 Aug 2020 15:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWhU=CJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kCldU-00051y-2E
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 15:22:20 +0000
X-Inumbo-ID: 65c78666-5994-40e0-8a44-b034db121f4b
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65c78666-5994-40e0-8a44-b034db121f4b;
 Mon, 31 Aug 2020 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598887339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F8ZyoyWPK6N2FdpDmcHFDdIkhC3kihjRqos6ChwY3dI=;
 b=aqVvdrQNTAbgXCsmaaFizBsy9nZVhxoO/LXCizRJAcusrqBna3JcdxzK
 BHUUpA+Z592kfQBukp5BSkTlqjwiZbjJ0EwhPlzCs6ccjDgtRpH7bKV74
 rMN2tDv3hBIRYUKvFyW0PhewFN2w9cI1skSnnC5zzjYmf638Pigps6QO0 g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yvY5E6LBUMcOvWUguoBTSl+nIx8oQ/rRDbusaQmtptcwfrsFoXYJkMvpkiYk9xj77Ipj+wIXUZ
 394VpSrh5Rz/uXub+nhnwFfC6Cj86XRK4kft21qlGnDou8dOUIgGzta6savrhhCljgYsnPI9rX
 gapXcN3JfkuiPNGt2cH2KeummWT/s+0bC5E8Oe7dglenfjhktgCe3O+TDPQacChMEX+VvWE3N7
 N1fMdcFjIAmZXKReula2cRBnnAiJwSH/eFrhcquNIihGsmSyxzCvxJHomsaexxxhkhdaHEiYfl
 wuw=
X-SBRS: 2.7
X-MesageID: 25959238
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,376,1592884800"; d="scan'208";a="25959238"
Date: Mon, 31 Aug 2020 17:22:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 8/8] x86/msr: Drop compatibility #GP handling in
 guest_{rd,wr}msr()
Message-ID: <20200831152210.GG753@Air-de-Roger>
References: <20200820150835.27440-1-roger.pau@citrix.com>
 <20200820150835.27440-9-roger.pau@citrix.com>
 <ae91e4b4-e95d-bf55-d6a3-104a982ce785@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ae91e4b4-e95d-bf55-d6a3-104a982ce785@suse.com>
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

On Fri, Aug 28, 2020 at 10:55:29AM +0200, Jan Beulich wrote:
> On 20.08.2020 17:08, Roger Pau Monne wrote:
> > Now that the main PV/HVM MSR handlers raise #GP for all unknown MSRs, there is
> > no need to special case these MSRs any more.
> 
> I agree, yet I'd like to point out (based on past backporting of
> security fixes) that this change may end up being a good source
> of backporting mistakes, as 4.14 may need chunks added here which
> on master / staging have no place anymore.

Even if we leave this chunk out, patches for > 4.14 won't need to add
anything to make a MSR return a #GP, so it's likely that the chunk
will have to be added for backports anyway.

I really have no idea of how to help with backporting with such change
in place.

Thanks, Roger.

