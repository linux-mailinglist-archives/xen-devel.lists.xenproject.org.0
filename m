Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B8474A86
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 19:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247011.426033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxCHO-0002Lt-IO; Tue, 14 Dec 2021 18:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247011.426033; Tue, 14 Dec 2021 18:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxCHO-0002Is-Ek; Tue, 14 Dec 2021 18:11:58 +0000
Received: by outflank-mailman (input) for mailman id 247011;
 Tue, 14 Dec 2021 18:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q7Ra=Q7=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mxCHN-0002Ik-3H
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 18:11:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c3c3525-5d09-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 19:11:47 +0100 (CET)
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
X-Inumbo-ID: 4c3c3525-5d09-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639505514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5OyLA5AStZ/0Y3oavESWTpPnQwHRYRXtQ7aTP9l0ESM=;
  b=ImW2O357AB+l03vuCdOrVDGQUaTYgOjDC1Zy70jxj9upPJe+5xCZJuWm
   6LB71X3cFQEeqfj+K1zppz6ZrCEZ3KrNz7IAn8jqm662yqWEiCe0eF4OL
   IUkGZ9LZED7IFh7iDfHNZloSuMhI7CuwAzNc2I+CxTfnN/AtLwmK24JIX
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oQ35Ox3syJsHmoPHGSuqyDw5LT8lMslOK84a4A/CusoGFqnkMeR+Cyj5dpjo4jCVVCcp9Eh9AA
 nNZvGgCxAh5pQvhpHwtOzKINZR13lr+l4IVz2P1GtHWE+gtvrw3BKrmVavsTFcSklk5JHCQVvl
 5HA+S145jFcM8ZFJqzZewFVHsY1nQNvzVlsLcPIEeRNC4oJpRnDCFJNzO9Wna3lzk1Tpee7eHB
 wyP7dJv3hQOgrQQTs6LFZgsHH9htc7ScYTLnksgNbIj2Avm2YKl9ET9x18vskeFusy5/bYX/gG
 vgq2WNMlhp2BpRieclieSG1m
X-SBRS: 5.1
X-MesageID: 62082656
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4FRij63dJ6rX0IjBNvbD5RB2kn2cJEfYwER7XKvMYLTBsI5bpzIEn
 WpKC2HQbKuKYGTyfN0lYY6w80NT6J7UzNI2SgVppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn970Es5wrJh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhz91Rm
 M5U7oeLSSQLAJfBtdpCdhBYOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3JgeR6iDO
 aL1bxIoNE7kWB1qPWwsEYgvmvaH30jVazNX/Qf9Sa0fvDGIkV0ZPKLWGNjaYNuRXu1Og12V4
 GnB+gzRHRUyJNGZjz2f/RqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbUsz5MQMMLCNY6yyOz8Kf53Vm8D2gtG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DETFtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBvGsnfBo3bZdUEdMMX
 KM1kVkOjHO0FCH1BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3FmrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl9YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:6jNq3agjmbc+5Y0AhA6/l4kFIHBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="62082656"
Date: Tue, 14 Dec 2021 18:11:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH] tools/libxl: Don't read STORE/CONSOLE_PFN from Xen
Message-ID: <YbjeYEJDHkG3K9aT@perard>
References: <20211209170752.20576-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211209170752.20576-1-andrew.cooper3@citrix.com>

On Thu, Dec 09, 2021 at 05:07:52PM +0000, Andrew Cooper wrote:
> The values are already available in dom->{console,xenstore}_pfn, just like on
> the PV side of things.  No need to ask Xen.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

