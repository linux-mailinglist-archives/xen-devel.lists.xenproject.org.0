Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D040627FCC3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 12:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1162.3832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNvOx-0003Wg-6d; Thu, 01 Oct 2020 10:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162.3832; Thu, 01 Oct 2020 10:01:27 +0000
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
	id 1kNvOx-0003WL-3X; Thu, 01 Oct 2020 10:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1162;
 Thu, 01 Oct 2020 10:01:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNvOw-0003WG-0V
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:01:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46f04faa-c426-4b63-8754-f1e68a2ec947;
 Thu, 01 Oct 2020 10:01:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNvOw-0003WG-0V
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:01:26 +0000
X-Inumbo-ID: 46f04faa-c426-4b63-8754-f1e68a2ec947
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 46f04faa-c426-4b63-8754-f1e68a2ec947;
	Thu, 01 Oct 2020 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601546485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZYocmHT58hop1hnQW2D1AUwv9Zu75PWwT27jkJ3ptsc=;
  b=PIyIXrrnIKhcUIrNaiWW0fx0jhl9EbFGEpxx10NRnTVRLt729mJLhEvR
   bE+6n8IrX5BLcNkIGRkwU3OIpZphubd3OWnMVrXpJkJeI6TQgfLqCEPh4
   8EiC4obIZW925FbMJ4r+6zMZEkhnjxTF3hZ/HICnKrmlKx790wIw0Wx5J
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QwHfmwhnvOFgDSO8W0D017sZa0xJ1izLrZuPcb17SwPQy3fkozHKKoxTnIydLUqj/WbEAuy1P3
 IpjUTDDTtURA7LizvDmrYRAbSa+Zj754Y/gFTSOokGStL8ZWsgk+DgaaaqwvHCFciMtso72OgW
 N/hk/mDYoOjuwhhJT6fiZKx90QOsUAusTpQznUxa4BwzVS7Bvhc4fHwyXIC4Yx4OSt6fQ4aEAk
 3UsQdBRS7pwEod3lrXaD19QfUcC3jg/t+/XFiozFv5HyLI7a/HZ9tlOwkr9JOU3pzTsJzDrmTO
 5Hc=
X-SBRS: None
X-MesageID: 29065832
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="29065832"
Date: Thu, 1 Oct 2020 12:01:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, Edwin
 =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
Message-ID: <20201001100101.GA19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:43PM +0100, Andrew Cooper wrote:
> Like other major areas of functionality, nested virt (or not) needs to be
> known at domain creation time for sensible CPUID handling, and wants to be
> known this early for sensible infrastructure handling in Xen.
> 
> Introduce XEN_DOMCTL_CDF_nested_virt and modify libxl to set it appropriately
> when creating domains.  There is no need to adjust the ARM logic to reject the
> use of this new flag.
> 
> No functional change yet.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

