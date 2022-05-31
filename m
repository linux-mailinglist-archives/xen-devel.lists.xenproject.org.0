Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564845391F5
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 15:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339614.564492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw29W-0002rw-4R; Tue, 31 May 2022 13:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339614.564492; Tue, 31 May 2022 13:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw29V-0002qM-VR; Tue, 31 May 2022 13:43:17 +0000
Received: by outflank-mailman (input) for mailman id 339614;
 Tue, 31 May 2022 13:43:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/bi/=WH=citrix.com=prvs=1435b4b80=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nw29U-0002ov-JD
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 13:43:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dd0d9a2-e0e7-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 15:43:15 +0200 (CEST)
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
X-Inumbo-ID: 9dd0d9a2-e0e7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654004594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lwJFOnLotaUEvEayBxsHt8xZHdydzYclJGPE8piF508=;
  b=c8j/J4nk8cFDbXKjJSPiwe4ztran9JDSW35M8j7cPVObDLh7kLmN/zhq
   +gEyEtSV7s8qKvXJ0wFOC5dOitlAw/uFw3DSjcF358ScQ6VvlA4pssTU8
   l1sivnZWwzhgVpUaR0nWO9V2wP2slq2Q1nSLp4ZnESImN/Uf5XAvTPC8P
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72519238
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EGfTBq9JwVVsejvbQnJ1DrUD9H6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WoXWmjUbKrcZmegfdAkaN7jpkIH75OBmNJlTgo/+SE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IPgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnby2SRwIIIPjovkcczNHPB1MF797wIaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JBEMGs1N0SojxtnIU0uU8s4xsWUhUKjcXp8rliMrpcS/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYO8aY0iGt6W+3i6nEmiaTcJ4bEbSjsPpnhlKCy2g7CRsKWF/9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobRws1
 kSogf3GPyFukJeKZk6v3KWplQrnbED5MlQ+iT84oRotuoe++99q00+RHr6PA4bu0ISrRGiYL
 ySi6XFn2u5N1ZNjO7CTpwivvt66mnTeoufZDC3zV3nt0A52bZXNi2eAuQmCtqYowGp0ozC8U
 Jk4dyu2trlm4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmwldRw0bJhaIme4C
 KM2he+2zMYIVEZGkIctO97hYyjU5fSI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B1+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO5wrghjlDy7eHwO50n+uVZoTCXNGelt3ZrnRr1R0Z5oVy2Mq
 4sFapLRkUgDOAA8CwGOmbMuwZkxBSBTLfjLRwZ/LIZv/iIO9LkdNsLs
IronPort-HdrOrdr: A9a23:pQyRfaFy1Ke9AWAfpLqF5pLXdLJyesId70hD6qkoc20tTiSZ//
 rOoB1p726NtN9xYgB/pTnuAtjkfZqxz/FICMwqTNGftWrdyTqVxeNZnO/fKlTbckWUnIMw6U
 4jSdkYNDSaNzhHZLPBkWuF+qEbsbq6Gc6T69s2hE0dNj2CI5sQlTuQ9mygYwZLrPYtP+twKH
 JjjPA37gZIME5nE/hSfRE+LqL+jsyOm5T8bREcARk7rAGIkDOz8bb/VwOVxxEETlp0sMMfGE
 X+4n7ED5+YwoSGI97nph7uxoUTnMGkxspIBcSKhMRQIjLwihywbIAkX7GZpjg6rOym9V5vyb
 D30mEdFtU272mUcnC+oBPr1QWl2DEy62X6wVvdhXf4u8T2SD8zFsIEj4NEdRnS7VYmobhHod
 V29nPcs4ASAQLLnSz76dSNXxZ2llCsqX5niuIXh2w3a/psVJZB6YgEuE9FGpYJGyz3rIo9Fv
 N1Ec3a7PFKNVuHcnHQpABUsZGRd2V2Gg3DTlkJu8ST3TQTlmt+1VEEyMsWmWpF/I4hSoND+/
 /PPs1T5f1zpoZ/V9M9OA92KfHHSlAkb3n3QSGvyRWOLtBJB5q7w6SHroncxIqRCd41JVsJ6e
 T8uCAxjx92R6vDM7zw4HQQyGGwfIyUZ0WS9ildj6IJ/oHUVf7xNzGfRBQgiM2l5/UFBMrDXe
 2vUagmXMMKdwbVaMF0Ny6SYegVFZFfPfdl4urSFT+105n2wsOBjJ2GTB5gSYCdSAoMSyfjBn
 MYUHzpKN9d613DYA6jvDHBH27oclbyuY19C7Lb+e978vlRCrFx
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="72519238"
Date: Tue, 31 May 2022 14:43:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] tools/libs/ctrl: rename and export do_memory_op as
 xc_memory_op
Message-ID: <YpYbaOuFTsD1khDw@perard.uk.xensource.com>
References: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>

On Thu, May 19, 2022 at 01:16:35PM -0400, Tamas K Lengyel wrote:
> Make the do_memory_op function accessible to tools linking with libxc.
> Similar functions are already available for both domctl and sysctl. As part
> of this patch we also change the input 'cmd' to be unsigned int to accurately
> reflect what the hypervisor expects.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Is exposing do_memory_op necessary? This kind of looks like a revert of
35e135f116 ("libxc: make xc_memory_op library private"). Anyway, if
there isn't a better alternative: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

