Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4B571A75
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 14:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365661.595940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFKQ-00088N-Hs; Tue, 12 Jul 2022 12:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365661.595940; Tue, 12 Jul 2022 12:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBFKQ-00086O-Dl; Tue, 12 Jul 2022 12:49:26 +0000
Received: by outflank-mailman (input) for mailman id 365661;
 Tue, 12 Jul 2022 12:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYr8=XR=citrix.com=prvs=1856d22e9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oBFKO-00085X-W3
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 12:49:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cbf7487-01e1-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 14:49:22 +0200 (CEST)
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
X-Inumbo-ID: 0cbf7487-01e1-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657630163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=97VMy++h5+CgzdPEaunLqaxYHyKe++R8HABn1HeQKXY=;
  b=APgNo77V6D3orD0/83Jblo2CaT2FzCWs5NQl9PZJ1cOt/MKDWl5VqIkp
   lBNPEjRfGVnvh//ADyEuELXrelimNMY9wRp8QR02vvYmpI+Yr2kJWBACJ
   IsdZBTwMpaVrV1EUlhqsLSanPlRLEFXOWfbjZQGO94LthZ3wvfyeBOzJ3
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76027588
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XeZG8qDWQauGJRVW/yHjw5YqxClBgxIJ4kV8jS/XYbTApDsghjZVz
 GYaCGmFOKvZZWOmL9t0Po2290kDu57QndFqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Fg2NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh+y
 M9GloyQdj4nP6SXveUPbARSEwhhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8QRayBO
 ppJAdZpRBKab01hFF47MqIvl+66pEn1Xh5nqE3A8MLb5ECMlVcsgdABKuH9eMGORMhTtlaVo
 CTB5WuRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3uFuqE2ewCoUEhJ+fVm0u/6ikWalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqai8eRigVw+baroA61TfOXOl+Gq6ckYigcd3v+
 AxmvBTSlp1K05NUivTjoAmf696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3ohZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvVpt3k/S+TY67Bqm8gj9yjn9ZLVXvwc2TTRTIgzCFfLYEy8nTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+x3SMVj7HMihpzz+iOL2TCfMFd8tbQrVBshkvfzsnekg2
 4sGXyd8404HALOWj+i+2dN7EG3m2lBmXc6r8pwKLbXrz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:f/+UF6hSX5FwgbWJGbspwTMQI3BQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.92,265,1650945600"; 
   d="scan'208";a="76027588"
Date: Tue, 12 Jul 2022 13:49:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/build: remove unneeded enumeration in clean-files
 of xen/include/Makefile
Message-ID: <Ys1ty8B+EjR9IwBq@perard.uk.xensource.com>
References: <20220712091007.13595-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220712091007.13595-1-jgross@suse.com>

On Tue, Jul 12, 2022 at 11:10:07AM +0200, Juergen Gross wrote:
> Enumerating a file from $(targets) in $(clean-files) isn't needed.
> 
> Remove hypercall-defs.h and headers*.chk from $(clean-files) in
> xen/include/Makefile.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - remove headers*.chk from clean-files, too (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

