Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E4227FDDB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:55:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1189.3972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwEp-0000ft-Bh; Thu, 01 Oct 2020 10:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189.3972; Thu, 01 Oct 2020 10:55:03 +0000
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
	id 1kNwEp-0000fP-86; Thu, 01 Oct 2020 10:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1189;
 Thu, 01 Oct 2020 10:55:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNwEo-0000fG-Jh
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:55:02 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3224e030-c294-42e1-9b8c-c9e573b2e348;
 Thu, 01 Oct 2020 10:55:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNwEo-0000fG-Jh
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:55:02 +0000
X-Inumbo-ID: 3224e030-c294-42e1-9b8c-c9e573b2e348
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3224e030-c294-42e1-9b8c-c9e573b2e348;
	Thu, 01 Oct 2020 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601549701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c8WJl4FCPhwG3wElqcuyPsTZPYQsAKsKXAsqf6rKdYs=;
  b=NAvhKYCaPjsza2Ev4zuVDqvNLtx1N+E+E5koNybfXDKxbd3k2D5a19wc
   Mr3KQ0TfzfRQtXrc6DQSZatTtQWPfP1udVP1x4qucON74+Kdz8Cu1QuqZ
   LgW+NGy5M5NVqxdlOHIgj40HFz1lfVzMiQexHtOzMoQ+cK2CLETSwimMi
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QgiMuZgrebGWDPm9zs87Pe4SM90UdhXPtn0f6GTAohN3O2jqqJsg57tUn4yv5O2i7ypZSbpOIi
 dE3Yj6Q8NGni7jFtHJGDRPF5n5fmDcgBdMojQAipzxcg2X8AuntWWhyGwDyFxZ5j7cMxoyi3di
 rZjGQPBGeMoOQKXiCuFcoR2rmDfLfc7KjTPzympfDxBlle1a39xEDq+xKMfsFknxweFESRHP1P
 x4yPtGbyUuaR7e2+sZ8LdcgseDTNFVvA67fYMaGteI7P60d3rjMcmQ5MXMhpUjGfYvinca8lqq
 nuM=
X-SBRS: None
X-MesageID: 28328134
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28328134"
Date: Thu, 1 Oct 2020 12:54:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/8] xen/xsm: Drop xsm_hvm_param_nested()
Message-ID: <20201001105453.GD19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-7-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:46PM +0100, Andrew Cooper wrote:
> The sole caller has been removed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

