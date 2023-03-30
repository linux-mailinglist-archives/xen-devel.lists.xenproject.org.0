Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D076D05DE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 15:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516723.801316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrxs-0006Rv-E0; Thu, 30 Mar 2023 13:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516723.801316; Thu, 30 Mar 2023 13:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phrxs-0006PY-BK; Thu, 30 Mar 2023 13:05:16 +0000
Received: by outflank-mailman (input) for mailman id 516723;
 Thu, 30 Mar 2023 13:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tzUU=7W=citrix.com=prvs=446aa7e4f=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1phrxq-0006OR-5s
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 13:05:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80c2c9de-cefb-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 15:05:12 +0200 (CEST)
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
X-Inumbo-ID: 80c2c9de-cefb-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680181512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adxcuJkdzQDMNqJ6me0RVhVLacrk4QCIJ2X+K9Tdhq8=;
  b=dHl9uvbiJGOmrQefFyIiK8Dpqc0BqqdVdLTFKcPaybWlbs4dJtVXQ+jF
   Zd+vDHAWfBjwHICy03ysc2bOC0CheG5tXRfVpWPZy68rNo2NGmgIBhXW/
   nmS8tDsAKlj9/x/dgQ52YtVSZKAyCQobhZzJIV+eilOnq6SybqhonwS1I
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103042006
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:1OiPjq1hsBrCh86AovbD5c12kn2cJEfYwER7XKvMYLTBsI5bpzVVy
 mUcCmmFPPqDYTHyctF/a9zl8kkDsMTWxtZgSVFtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHE5V8
 +YHM2o3clO7ucWqyqK+VcBxiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0OxhrC/
 jqYl4j/KjtHCs6W+SXGznGXnLHmpBjKWqgTDqLto5aGh3XMnzdOWXX6T2CTuvm0jFKzSvpQL
 kUV/mwlqq1a3FWmS8S4UxCmrXqsuBkaVNxNVeog52mlz6PO6AudQGEcQDNFYtU7sec5QDUr0
 hmCmNaBLSRlt7uHSHSc3q2ZoTO7JW4eKmpqTSMbSBQt6tzqsoY1yBnICMtgeIa1ltroAirxx
 RiQoSE1m7IIy8kR2M2T9E3djjatq57hRxMv6wGMBCSj4x8RTIOpeoWy5V/z7f9KL4GCUh+Hs
 WRss9CX8eQmHZyL0iuXT40lDLyvovqILjDYqVpuBIU6sSSg/Wa5eoJd6y04I11mWu4BYiPBe
 kLfuQpNopRUOROCdrRraoi8D8Ary6nIFtn/UP3QKN1UbfBZbg6M/Ch0aQiQ0mbhnVI3lqcXP
 ZadeNyrS3EABsxP1Dq3Q+IR+bsqwCkkwiXUX5+T5x692rqDb32HYb4CNB2FaeVRxKqcrR/c6
 dp3K8qAwBIZW+r7ChQ76qZKcwpMdyJiQ8mr9YoOLLXrzhda9H8JFtDKx6k+YNZfg+dtqMDU9
 GG4RWZFxw+q7ZHYEjlmekyPeZu2A8ku/CJrYXB8Vbq78yN9ONjytc/zY7NyJOB6r7I7kJaYW
 tFfI6297uJzpiMrEtj3Rb30t8RceRuinmpi1AL1MWFkL/aMq+Ekk+IInzcDFwFUVEJbTeNk/
 9WdOvrzGPLvvThKAsfMc+6IxFisp3Ubk+8adxKWcoEKIRmyr9Y6dXKZYhoLzyckc02rKtyyi
 W6r7eow/7GR8+fZDvGS7Ux7k2tZO7QnRRcLd4Uqxb23KTPb7gKe/GO0a87RJWq1fDqtqM2fi
 RB9k6mU3AsvwAwb7OKR0t9DkcoD2jcYj+UAkFw8QS6TMArD53EJCiDu4PSjf5Zlntdx0TZak
 GrWkjWGEd1l4P/YLWM=
IronPort-HdrOrdr: A9a23:FSnW4aMx2+eR7cBcTh2jsMiBIKoaSvp037BL7TELdfUxSKelfq
 +V8sjzuSWYtN9TYgBFpTn4Asi9qCrnlaKdgrNhX4tKPjOWwFdARbsKheHfKlvbakjDH4Vmup
 uIHZITNDS+NykcsS9W2njfL/8whPO82OSDg+PGyndkSgtnL5tn8xxyBm+gYy5LrU19dOMEKK
 Y=
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103042006"
Date: Thu, 30 Mar 2023 14:05:00 +0100
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
Subject: Re: [PATCH v3 5/6] hw/isa/piix3: Resolve redundant k->config_write
 assignments
Message-ID: <f9953cc3-de45-4a22-98c6-e734ca1ef536@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-6-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-6-shentey@gmail.com>

On Sun, Mar 12, 2023 at 01:02:20PM +0100, Bernhard Beschow wrote:
> The previous patch unified handling of piix3_write_config() accross the
> PIIX3 device models which allows for assigning k->config_write once in the
> base class.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

