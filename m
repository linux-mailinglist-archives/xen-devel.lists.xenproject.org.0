Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E510022205C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 12:15:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw0v4-00058I-Ni; Thu, 16 Jul 2020 10:15:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw0v3-000585-9l
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:15:13 +0000
X-Inumbo-ID: 3b09fa2f-c74d-11ea-949a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b09fa2f-c74d-11ea-949a-12813bfff9fa;
 Thu, 16 Jul 2020 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594894512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZGgRMcmFpKiMJJeKQrq1cmjNWWRGADY93PC47sKyqTI=;
 b=FDH398T1/GtckM2eKCV8JIhqnnvbhbQuaIkDcuAIh27HkB7UkFyzUm4/
 PKx7piE5PfcIbf80LPXwfc2hXGJirDBVvwjw5IbNCe5I7nodEvbWlYB+i
 8RtFxfy7+uMupd1kh2UiwGUuy0k0aGGihjjRaWEnjtP0ixwp5KQ/fnlyo c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GUxQoiJCzufxyegeXCzlN1GvGCASndEcgyd/ORhWartFeTVvML8GVzidefhxX9chu5uiE4Lm2Q
 r51mQ6RdA1VEOc765xIZa8sVHIlEPgCcN4JYyB7O0OAKh5m5mqo/PIeZw+1tpddqSdBjuLcmCn
 1IndVtk+4HX+/i4+buWG6HBUyAmCA+PW2hTKDS+AZJ0QRJAM3w0meLU3OLaL83gpo0Xe+UO8AI
 kyr0xr70UXXUKF2FzhN6loNu6okZEYnzCCaAkZ6bO2IvPLA2VfeCV4YI89kQcaCgX6HWDQYXo+
 RoQ=
X-SBRS: 2.7
X-MesageID: 22707710
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,358,1589256000"; d="scan'208";a="22707710"
Date: Thu, 16 Jul 2020 12:15:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] VT-d: use clear_page() in alloc_pgtable_maddr()
Message-ID: <20200716101504.GL7191@Air-de-Roger>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
 <14f8b940-252f-9837-8958-5e76e1c3f06f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14f8b940-252f-9837-8958-5e76e1c3f06f@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:04:15PM +0200, Jan Beulich wrote:
> For full pages this is (meant to be) more efficient. Also change the
> type and reduce the scope of the involved local variable.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

