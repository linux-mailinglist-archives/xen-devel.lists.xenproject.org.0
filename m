Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38492719D1A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 15:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542500.846430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4i90-00039F-GB; Thu, 01 Jun 2023 13:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542500.846430; Thu, 01 Jun 2023 13:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4i90-00036x-Cx; Thu, 01 Jun 2023 13:15:10 +0000
Received: by outflank-mailman (input) for mailman id 542500;
 Thu, 01 Jun 2023 13:15:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1bfG=BV=citrix.com=prvs=5094e906a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q4i8y-00036r-EY
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 13:15:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ec8df0-007e-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 15:15:05 +0200 (CEST)
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
X-Inumbo-ID: 51ec8df0-007e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685625304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtaZnpVwq0U+IbF3XhGM6LM9pm6zZpA7PnmByZxaeSU=;
  b=VOs3IfX+LXmScYspJXyz09HwUzE9GEB0w4dbl7If+WO7l11zu5kZ75Fh
   1qnrI5C1Cu66zvl4WTInpAjou0fCEM3uegukfV5dJAMGkTVfXHIWh51TI
   PSs0/y1GWLyC4MHFV7Rlr4EWGr8IKTNRqp41C0f2pcTq6kjLXZSTJNGF+
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109978862
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0xUl0q12zNpIeE6P2/bD5TNxkn2cJEfYwER7XKvMYLTBsI5bpzVUm
 mEZD2/QOa6DY2agKYwlPt+/9kIF68LQnYJgHQZkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmPKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUXpE9
 /kUKxkxRRWEt9q48O6fafBHv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0EzxnI9
 jycl4j/Kj44JPK86mSsyGOprevLjTr1aIEoFZTto5aGh3XMnzdOWXX6T2CTo/O0l0q/UNJ3M
 FEP92wlqq1a3FOvZsnwWVu/unHslhwBX9tdFcUq5QfLzbDbiy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bphDAVNF4C4auk8b4Xzr3x
 liipTAznbwJgeYX1q+w+hbMhDfEm3TSZldrvEONBDvjt14nItf/PORE9GQ3894QN4ybS1WCl
 UQvns+u1O4+UbWujQe0FbBl8K6S296JNzjVgFhKFpYn9iiw93PLQb288A2SN28ybJ9aJGaBj
 Fv7/FoIucQNZCfCgbpfOdrZNig88UT3+T0JvNjwZ8EGXJV+fRTvEMpGNR/JhDCFfKTBfMgC1
 XannSSEVCdy5UdPlmDeqwIhPVgDmEgDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZvXlkgAALCmOnSHmWL2EbzsBSJhbXwRg5UGHtNv3yI8QD1xYxMv6e5Jl3NZc1R9yb6To
 yDVtr5ww1vjn3zXQThmmVg6AI4Dqa1X9CphVQR1ZAbA5pTWSdr3hEvpX8dtLOZPGS0K5aIcc
 sTpjO3bWawRGmSWpm1BBXQ/xaQ7HCmWacu1F3LNSFACk1RIHWQlJveMktPTyRQz
IronPort-HdrOrdr: A9a23:w8QuqqhFCp7aOyftLgOEFn+LFnBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-Talos-CUID: 9a23:pmKi+G2q8GAwSAlx5hCNxbxfStsvcHjRz17sCEq/OV5neOGxaka7wfYx
X-Talos-MUID: 9a23:IQG+6QSaPbr5t444RXTDpiFMF+Q2yp6/DWsJlYUftfmHDy1ZbmI=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="109978862"
Date: Thu, 1 Jun 2023 14:14:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] MAINTAINERS: remove xenstore related files from LIBS
Message-ID: <b2fb0dd5-6b72-4901-a0d7-5a4e639c1029@perard>
References: <20230522160008.27779-1-jgross@suse.com>
 <c4d68b28-94ff-9edf-02df-58537d109372@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c4d68b28-94ff-9edf-02df-58537d109372@suse.com>

On Thu, Jun 01, 2023 at 12:57:56PM +0200, Jan Beulich wrote:
> On 22.05.2023 18:00, Juergen Gross wrote:
> > There is no need to have the Xenstore headers listed in the LIBS
> > section now that they have been added to the XENSTORE section.
> > 
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Anthony, Wei,
> 
> since this is taking away things from an area you're the maintainers for,
> I think it would best be acked by you.

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

