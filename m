Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7BD4C2ED6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278369.475586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFd3-0005ga-NA; Thu, 24 Feb 2022 15:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278369.475586; Thu, 24 Feb 2022 15:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFd3-0005dO-Je; Thu, 24 Feb 2022 15:02:01 +0000
Received: by outflank-mailman (input) for mailman id 278369;
 Thu, 24 Feb 2022 15:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duXj=TH=citrix.com=prvs=047162a35=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNFd2-0005dI-3g
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:02:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b56c2f9a-9582-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 16:01:58 +0100 (CET)
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
X-Inumbo-ID: b56c2f9a-9582-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645714918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=21F2oz9/DK47nSrfizyO+gjgcDYAtK4qeOHlEwA5G/E=;
  b=PAvIEHOH7Q99Ya+UD2n26pwD3oKW2F/9cJx0xF5Z8/xYHhooV315p1Ff
   yUgV/cyvk4A/oU9IDADzdDkQDR5SVRs3+7CGpF+fyj1iQCia1OTqor57F
   X7RRp9DuhAQ+ri66gFj/wtM2rSSvcdQwocrGGn8lRKDy+/Mw2k/UxaMfS
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64912939
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5VPE1K+fJgfYizZ4apgsDrUDl36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 DQbC2/XPfqPNGv2Ltt3OYXjoBtSvMfdn9NmGwNrq3s8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw24LlW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ2PeBkNYaeLod8UYUFUTXBVF4pN6KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZZIMGA+N0WojxtnfW45UYA6svyS3SfFSQRIlHLWqI4N/D2GpOB2+Oe0a4eEEjCQfu1XkVyfv
 Xnu5HniD1cRM9n34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQN0ZhdESGjZt7
 2SArYvlW21EmpqeWW3Io994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3mpQivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyq2sbhm4XKlznXlrAAx8FeBvajt3Nr02wMHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX2MPErOd7rUJtylsAM8OgJsNiOMLKihbArKWe6ENxGPxbMjwgBbmB2+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWngvuqWTA503/i9K2PSfNIZ9caQfmRr1pvcus/VSOm
 /4CZpTi9vmqeLCnCsUh2dVIdg5iwLlSLc2elvG7gcbZfFI9QTl5U6W5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm2BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:I81Pk6q1I8JRWKciXjr6a4waV5oteYIsimQD101hICG8cqSj+f
 xGuM5rsSMc7wxhP03I+OrwXZVoLkmwyXcY2+Us1PKZLW/bUQiTXeNfBOnZowEIcheWnoU26U
 4jSdkcNDSZNykCsS+Q2miF+rgbr+W6zA==
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64912939"
Date: Thu, 24 Feb 2022 15:01:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v3] tools/libxl: don't allow IOMMU usage with PoD
Message-ID: <YhedyyraKbiMo/Zp@perard.uk.xensource.com>
References: <20220217140923.22485-1-roger.pau@citrix.com>
 <e59dc35d-013d-1db6-a61e-c2e4504952b1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e59dc35d-013d-1db6-a61e-c2e4504952b1@suse.com>

On Fri, Feb 18, 2022 at 09:06:35AM +0100, Jan Beulich wrote:
> On 17.02.2022 15:09, Roger Pau Monne wrote:
> > Prevent libxl from creating guests that attempts to use PoD together
> > with an IOMMU, even if no devices are actually assigned.
> > 
> > While the hypervisor could support using PoD together with an IOMMU as
> > long as no devices are assigned, such usage seems doubtful. There's no
> > guarantee the guest has PoD no longer be active, and thus a later
> > assignment of a PCI device to such domain could fail.
> > 
> > Preventing the usage of PoD together with an IOMMU at guest creation
> > avoids having to add checks for active PoD entries in the device
> > assignment paths.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> I'm inclined to queue this for the stable trees. Thoughts?

Yes, I think that sound good.

Thanks,

-- 
Anthony PERARD

