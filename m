Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC486287A09
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 18:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4529.11848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQYtV-0000hD-NY; Thu, 08 Oct 2020 16:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4529.11848; Thu, 08 Oct 2020 16:35:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQYtV-0000go-Jf; Thu, 08 Oct 2020 16:35:53 +0000
Received: by outflank-mailman (input) for mailman id 4529;
 Thu, 08 Oct 2020 16:35:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQYtU-0000gj-5L
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 16:35:52 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f77dbc1e-b12c-464e-95a1-364385fe5387;
 Thu, 08 Oct 2020 16:35:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uUpI=DP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQYtU-0000gj-5L
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 16:35:52 +0000
X-Inumbo-ID: f77dbc1e-b12c-464e-95a1-364385fe5387
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f77dbc1e-b12c-464e-95a1-364385fe5387;
	Thu, 08 Oct 2020 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602174951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1rsD1tf3DdaaL5KXzOKC2r5GJlph1c1FYx7mIzcvdx8=;
  b=GY4DV2cZKuuzIWpaS5rH3B22XPk8d9qZ3hZ2Ncp0heDBzAvSCu9B2Rv+
   gt19sS8wHWKZlj/khOwRPPkxmKjAd31T5I313f5lq5tRMFMAiELyEftw5
   iiySglSIuHiYnHR+PbPMgEVmXamTHoFxf3RxEW4yj7flx++xvF2JdOnco
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zWNqFa0adWT5dBcnQf/+qONM/SOOdHUGj4VmpNszqiw++T/lsC+sCgxepJt9ox+lJBvGc2l54a
 oSZ/llmsSjp7k50wX34zNq3t/ShfdM13cR/KnB7e4naXY8EI9M2ZGAhWWjSf0KExKYeKuuhhif
 JykAhqGC218ftv8GksTG/c4I1bwZA3efq9u90h4Cy9wKVM9b720Osl/u5csa/jh5mxhvbHwmZF
 QT5yIP0+r1ODJv0vZD5qEitXm3BFUSuiizQogs1KmLjC7zTVoV2JsP2PEqRWY39FQVeb7jKTlg
 39g=
X-SBRS: None
X-MesageID: 29627191
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,351,1596513600"; 
   d="scan'208";a="29627191"
Date: Thu, 8 Oct 2020 18:35:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 6/6] x86: limit amount of INT3 in IND_THUNK_*
Message-ID: <20201008163541.GN19254@Air-de-Roger>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <4d66eb4d-4044-8b48-d7cc-354a236e6b26@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d66eb4d-4044-8b48-d7cc-354a236e6b26@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Mon, Sep 28, 2020 at 02:32:24PM +0200, Jan Beulich wrote:
> There's no point having every replacement variant to also specify the
> INT3 - just have it once in the base macro. When patching, NOPs will get
> inserted, which are fine to speculate through (until reaching the INT3).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> I also wonder whether the LFENCE in IND_THUNK_RETPOLINE couldn't be
> replaced by INT3 as well. Of course the effect will be marginal, as the
> size of the thunk will still be 16 bytes when including tail padding
> resulting from alignment.

I think Andrew is the best one to have an opinion on this.

Thanks, Roger.

