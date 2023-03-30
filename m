Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C81106D05DA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 15:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516721.801306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrxS-00061U-5v; Thu, 30 Mar 2023 13:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516721.801306; Thu, 30 Mar 2023 13:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrxS-0005zn-34; Thu, 30 Mar 2023 13:04:50 +0000
Received: by outflank-mailman (input) for mailman id 516721;
 Thu, 30 Mar 2023 13:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzUU=7W=citrix.com=prvs=446aa7e4f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1phrxP-0005v1-VP
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 13:04:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 704215d2-cefb-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 15:04:45 +0200 (CEST)
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
X-Inumbo-ID: 704215d2-cefb-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680181485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xkpy/kjsmo/X9OUmHcSUliZn05A/VqHXLoRZnj02lSc=;
  b=MQTH4PSiCj/zrnZJ4rU9ZmCfu0iR74NgZB8a3UFHl6edWTvAev/OB8zr
   5rgUWrJDZOSO0g20NY+XFAq/RcBihrC6295nFShajqTIni7NQNNE9vOrj
   O141XR9Q/fsmDCTeeXjKY46Kfn87kZmAB7gAGZpgnTETE0rSUlNAHkYdf
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102479599
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KHAbLqnuFNHxv5OmGTZYucbo5gyYIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWmzVaKrcMDGhL95xad7joB4HsJCHmNdgSgBpqnw1FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5weGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dYfFG4tRRWGu863nvWpR/FnmZkAI8a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 D6ZrjmoU3n2MvSmigvaqU+VodbznD3rYttKFLKi8dN11Qj7Kms7V0RNCArTTeOColW+VtRDJ
 l089S8nrKx0/0uuJvHkUhil5XKJoBMYc9xXFeI89UeK0KW8ywOQHGMJSnhIcNIrsMU/WDkC2
 VqAntevDjtq2JWNQ3Wb5LaSrBuoNCQVJHNEbigBJSMJ/Nz8iIg2hwDISJBoF+iojbXdGSn33
 iuRrS4WnbgahtIMzOO851+vqzuxvJXNTwMzzgzKRG+htVk/YoO5D6Sl5UXS9/pHBIaQRFqGp
 2RCncWChMgWBIyJvDyARqMKBr7Bz+aINnjQjEBiG7El9i+x4DizcIZI+jZ8KUx1dMEedlfBZ
 VTPkRlc6J9aID2haqofS5mqF80gwKzkFNLkfvPZdNxDZt52bgDv1Dtvbk6ZxWyrkEUqnawlI
 pCdWcKtC38ADuJg1jXeb/8d0Lsuygg6xGXaX5e9yA6ouZKUfnWVVLwGInOHaeR/56SByC3c6
 9tFPtGG4wleWub5JCLQ9OYuwUsidCZhQ8qs8ooOK7DFe1A9cI08NxPP6ZkmR9JFtKFQqsvJo
 DavV1dT1wfcinKSfG1mdUtfhKPTsYdX9CxkbH18bQr0ixDPcq70sv5BKsJfka0PsbU6kKUqF
 6Rtl9CoWKwnd9jRx9gKgXARRqRGfQ/juw+BNjHNjNMXL885HFyhFjMJk2LSGMgy4smf75FWT
 0WIjF+zfHb6b10K4DzqQPyu1UitmnMWhfh/WUDFSvEKJhW0qdE2dXOv3qFpSy3pFfkl7mHCv
 +pxKUlwmAUwi9VtrImhaV6s9O9F7NeS7mIFRjKGvN5axAHR/3a5wJ8obdtkiQv1DTuukI37P
 LU98h0JGKFf9Lq8m9YmQukDIGNXz4eHmoK2OSw+RiuTNwnwUuw+SpREtOEW3pBwKnZikVPec
 iqyFhNyZeTh1B/NeLLJGDcYUw==
IronPort-HdrOrdr: A9a23:YdVeBa0CNvNo9YmPXLN7lwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="102479599"
Date: Thu, 30 Mar 2023 14:04:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
	<aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
	<paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
	<mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
	<brchuckz@aol.com>
Subject: Re: [PATCH v3 4/6] hw/isa/piix3: Avoid Xen-specific variant of
 piix3_write_config()
Message-ID: <3bd7846b-2782-4857-b298-817fd683044e@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-5-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-5-shentey@gmail.com>

On Sun, Mar 12, 2023 at 01:02:19PM +0100, Bernhard Beschow wrote:
> Subscribe to pci_bus_fire_intx_routing_notifier() instead which allows for
> having a common piix3_write_config() for the PIIX3 device models.
> 
> While at it, move the subscription into machine code to facilitate resolving
> TYPE_PIIX3_XEN_DEVICE.
> 
> In a possible future followup, pci_bus_fire_intx_routing_notifier() could
> be adjusted in such a way that subscribing to it doesn't require
> knowledge of the device firing it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

