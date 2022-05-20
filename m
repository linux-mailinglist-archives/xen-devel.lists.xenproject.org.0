Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49B52ED79
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334223.558222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2zT-0001vz-DR; Fri, 20 May 2022 13:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334223.558222; Fri, 20 May 2022 13:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2zT-0001tP-9u; Fri, 20 May 2022 13:48:27 +0000
Received: by outflank-mailman (input) for mailman id 334223;
 Fri, 20 May 2022 13:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIPw=V4=citrix.com=prvs=132b3d1f7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ns2zR-0001tD-CU
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:48:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83c24d25-d843-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:48:24 +0200 (CEST)
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
X-Inumbo-ID: 83c24d25-d843-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653054504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/vb/EolaX43fnGmzZp+0qeqrGpz2/YSy+BS4fIoskTo=;
  b=hEUkz6oJ6GY9/ekOSereD6Nzkpz6XSXzkcr7FHzIvjWrhws9ZSKHfGHe
   LdS8frBN3+ga1wK9V702s8PbPNHB+YX8SqHCucOM1CvdnwPVGXNSk4F4F
   EnMcULAaEXrcrO11NkaQAffPhWMWZFUiT6hrZwDbuBU/HhYvaUklr5ywO
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71163897
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZR35XK6Z6eB6cE91geIPswxRtFrHchMFZxGqfqrLsTDasY5as4F+v
 jcYDTqDa63cYmugfN4gbo3joRtTv5eBzdFmTFM4rCxnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjW1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSJZiQKGvSVgNhDCShgGnBSGI5937XIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VAMGQ0PEWfC/FJEmYnFIs8w8CuvEvEYiN9gljK+JQK/WeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYDUbVVa+4um0jGa7BsoZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUDxyKu7vON+zrHXFk8R29tTf8dk8U5EGlCO
 kCyoz/5OdB+mOTLFCnFr+/K8Wza1Ts9djFbO3JdJecRy5y6+dxo0EqSJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+aTNT8D2BQwQKHhcus1rqxQFibp
 2QjkMOD9u0IBpzlvHXTHb9dTeH5ua/ebme0bbtT834JrmvFxpJeVdoIvGEWyLlBb67ohgMFk
 GeM4FgMtfe/zVOhbLNtYpLZNijZ5fGIKDgRbdiNNoAmSsEoLGevpXgyDWbNjzGFuBV9yskXZ
 MbEGftA+F5HUMxP1iStfe4B3NcDn2ZmrY8lbcuglErPPHv3TCP9dIrpx3PVNbBlvP3e8VqJm
 zudXuPToyhivCTFSnG/2eYuwZoidxDX2bieRxRrS9O+
IronPort-HdrOrdr: A9a23:r06Dta/f4ZA9xu8ApJNuk+DaI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jztCWE7Ar5N0tNpTntAsa9qDbnhPhICOoqTNKftWvdyQiVxehZhOOIqVDd8m/Fh4xgPM
 9bAtFD4bbLbWSS4/yV3DWF
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71163897"
Date: Fri, 20 May 2022 14:48:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] tools/xl: Use sparse init for dom_info, remove
 duplicate vars
Message-ID: <YoecEPofeL97eFEP@perard.uk.xensource.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
 <a444edf57dbb1ea45ce4af471bf2c5f9b362bbde.1651285313.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a444edf57dbb1ea45ce4af471bf2c5f9b362bbde.1651285313.git.ehem+xen@m5p.com>

On Fri, Apr 29, 2022 at 03:45:25PM -0700, Elliott Mitchell wrote:
> Rather than having shadow variables for every element of dom_info, it is
> better to properly initialize dom_info at the start.  This also removes
> the misleading memset() in the middle of main_create().
> 
> Remove the dryrun element of domain_create as that has been displaced
> by the global "dryrun_only" variable.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks for the clean up.

-- 
Anthony PERARD

