Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F85958F1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 12:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388216.624823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNu8A-00023I-VA; Tue, 16 Aug 2022 10:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388216.624823; Tue, 16 Aug 2022 10:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNu8A-00020a-SS; Tue, 16 Aug 2022 10:49:06 +0000
Received: by outflank-mailman (input) for mailman id 388216;
 Tue, 16 Aug 2022 10:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=REbT=YU=citrix.com=prvs=22068c4b7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oNu88-00020U-Rq
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 10:49:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09d1f0d1-1d51-11ed-bd2e-47488cf2e6aa;
 Tue, 16 Aug 2022 12:49:03 +0200 (CEST)
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
X-Inumbo-ID: 09d1f0d1-1d51-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660646942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TjB1PxZiL12zfl5sx55zm7atN/V8tsDleakfcumd35w=;
  b=g1UHWB5lyWZlvo04cD4etEdjV96mp8uaxasXzpr+4vOWbGoTthO52d1Q
   EIZLmrqWC2O93Es7dSy/8Ya+FI9EYE7bDIPl5YO8fe4cSCcQCIDTR31qi
   /01rmpC1iryMkunK05Q2xcmXCU9/bdJHkdP5K31UH7LKCM1ik0DMlrvgD
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78626504
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t/UmG6MnzgpjGNXvrR1vl8FynXyQoLVcMsEvi/4bfWQNrUok02EGx
 2tKUTiAafaJMDT3e950Ptu09BxUsJHSyYQwSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/vd8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPJx9VkT00VBbFA89luJ0tt8
 P5IKGEkO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyzeDklYvjeCxWDbTUp+tRZoSoWqyn
 Tj973TeIhgmNua/xRPQpxpAgceQxHimCer+DoaQ9ONugVCV7nweDlsRT1TTifO0kFKkUtRTb
 Ukd4DMzrLMa/VauCNL6WnWQnnmAuRINXstKJMcz4gqN16n87h6QAy4PSTspQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adjNf4BDXxy
 DCitzUlivMYistj/7q2/BbMgz+qjpHTS0g+4QC/Y46+xlonPsj/PdXusAWFq6YbRGqEcrWfl
 F0Au8Ld4MM2McmEqzWrasYIHuGptt/QZVUwnmVT84kdGyWFoiD9Jd4Lum0veS+FIe5fJ2a3P
 Ra7VRd5ocYKYSD0NfIfj5eZUZxC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZUyU/0PIMKeHbt17FPS7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXML5hsfPU/l2Lq
 I0PXydv9/m4eLyWX8Uq2dRLcQBiwYYTX/gaVPC7hsbce1E7SQnN+tfawK87epwNopm5Ytzgp
 yjlMmcFmQWXuJEyAV/VApyVQO+wAM0XQLNSFXBEAGtELFB4O9vysvlOJspnFVTlncQ6pcNJo
 zA+U53oKpxypv7voFzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:4Zr2TK+GI5K+B53rI0Fuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.93,240,1654574400"; 
   d="scan'208";a="78626504"
Date: Tue, 16 Aug 2022 11:48:56 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] build: Fix x86 out-of-tree build without EFI
Message-ID: <Yvt2GDIz7z5qMWE7@perard.uk.xensource.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220816103043.32662-1-anthony.perard@citrix.com>

This patch probably need a slight better subject, as the issue is only
with out-of-tree build. So new subject:
    build: Fix x86 out-of-tree build without EFI

-- 
Anthony PERARD

