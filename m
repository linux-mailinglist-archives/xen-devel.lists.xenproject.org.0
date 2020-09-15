Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705726A3CB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 13:03:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI8jZ-0004L6-2M; Tue, 15 Sep 2020 11:02:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF/R=CY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kI8jX-0004Ka-2j
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 11:02:47 +0000
X-Inumbo-ID: d45cb013-3289-40db-b683-6823b22b0853
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d45cb013-3289-40db-b683-6823b22b0853;
 Tue, 15 Sep 2020 11:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600167765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jd+bZriEcwaMOxixhmLWa9/tT5TIxBSEVT1ah/+Ld2w=;
 b=W7mftJjMrlvfQuxOcRE3RAOkUciJnhVBGof5We2vtL7FKN5eFj+DQj+w
 DJItR82pa1ZsKt2X3AhCv4/0qrG5nAr7zFwFIIXQ6VRMG7q4P7vbmenzY
 EfCCPBoB0ApnTtKuV5vnvUrvA3DlvEVKZJLqmiuWAyegBUHC3SgfjmQ25 I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: se2nB1KNEgkA2saXlVTVciS5aFWI9gki3+Qfxz2OLBzQa2cRfbfbIsNIzgx0uW+j0wushMnicD
 ofvvOgYdy9rC1YTlS7F0t/LLJf5hFdPlvysjm20hgX/V/JlvTNOXB4yqI3fF1uWJc4/2z8yvrD
 iCMItLAZUeQAEy3qLATiw9Yq1QueR2PxQ6yXthFwBQySUc4WqHzCMsRbzz/B8FVJDZEWFxQQ/+
 qEoJZSZzKFU+D7doHNWhv8RKTwj8nRwAhAH4pRbAzsHf6kAn/Bap4numJ28K+JRtOh41PxnKnE
 ugg=
X-SBRS: 2.7
X-MesageID: 26688624
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,429,1592884800"; d="scan'208";a="26688624"
Date: Tue, 15 Sep 2020 13:02:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 3/3] x86/shim: don't permit HVM and PV_SHIM_EXCLUSIVE at
 the same time
Message-ID: <20200915110233.GK753@Air-de-Roger>
References: <5d86a23c-5dea-8697-9ba1-900d35b99695@suse.com>
 <d6661f16-0cd2-1eed-0128-c89f1aca240d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <d6661f16-0cd2-1eed-0128-c89f1aca240d@suse.com>
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

On Mon, Sep 14, 2020 at 02:39:33PM +0200, Jan Beulich wrote:
> This combination doesn't really make sense (and there likely are more).
> The alternative here would be some presumably intrusive #ifdef-ary to
> get this combination to actually build again.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm not sure I see a way to cater for Andrew requests while allowing
PV_SHIM_EXCLUSIVE to gate options in order to be able to remove
code.

Maybe PV_SHIM_EXCLUSIVE should be moved to the top level Kconfig
screen on x86 and behave like a list, so that you select a 'Normal'
hypervisor build or a 'PV shim exclusive' build, and that could
completely change the contents of the menus?

If that doesn't seem suitable I think the proposed patch is a good
option unless someone has a better approach.

Thanks, Roger.

