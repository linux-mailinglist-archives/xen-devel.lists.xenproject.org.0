Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7813D41DF14
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200114.354519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVywx-0004V8-2h; Thu, 30 Sep 2021 16:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200114.354519; Thu, 30 Sep 2021 16:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyww-0004TL-Vt; Thu, 30 Sep 2021 16:30:22 +0000
Received: by outflank-mailman (input) for mailman id 200114;
 Thu, 30 Sep 2021 16:30:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o/Z=OU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVywv-0004TF-7v
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:30:21 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3c186ac-220b-11ec-bd5c-12813bfff9fa;
 Thu, 30 Sep 2021 16:30:20 +0000 (UTC)
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
X-Inumbo-ID: b3c186ac-220b-11ec-bd5c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633019420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KEZxX95J3dB7sfFKTORKgeH8btgqGBbEZFfrMGcday4=;
  b=Ay+w3SfF8vqSL482ATTNm+FUoVV++vLtClme+as8yKRsZYi4qy8j+wib
   XrWKkNxi7JWt0z8CyITWEvxJB6oAL3NGj/tUPY2LehDdmOp1ypbC0KJO8
   j3foG8JbkNQ2xkUd/8z20AUrwcxxeJwN8z5lOgZXmZDx8yGAIAgph+6Or
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aP2tL6hpJ3EfStr6v1Zz5pEEPzZikmRkF3xCpfzbHLqphqDiHBIZhYm5m46hBDza6BUfVQgpUs
 wANzvZT55yXtIZwILprL2GUBmESFf+Tp1BG30Xg8Nj78rUoG9+FjIDaDNmFmuqiAKl/AXdhuUA
 tCMWIv/b8orpnYXUq7YjL9mimw40mubxgRiNkDbBLKweOymgDHDReB3VEUkM1Z5r0tIY+TDZTF
 /6NvxRgnG19ell/iuT2j1utJ9uIA+KyVP4T8gi7BRTR/zoeYWEgusDoukAuAMrwT/YjaArSk4W
 7+fXgt/Xj+PPY/jfPLS83d+p
X-SBRS: 5.1
X-MesageID: 54029962
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QuN3Ua5wIf3SIyipYkjjAAxRtOTAchMFZxGqfqrLsTDasY5as4F+v
 jMaCDqCb/2KZTb3LYgnbYS+pBlV7J7QzdE3TVBsqX0yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2dYw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 Mlrvoy+dCcSMbT1gdRMCkBKHSA5FPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTQa6EN
 ptHM1KDajzOQwRlKFlMEqk9v9z5vFXjdwMD9k2a8P9fD2/7k1UqjemF3MDuUteDX8lSk26Tr
 3jK+Gm/CRYfXPSWzyaF9XS9wPfChyrhVKodEbS58rhhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixInQiRS5PVfwdu9YPXAx7j
 wabkdKuLGk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1EyWEYc6eEKhppilQWivn
 2DiQD0W3e17sCId60msEbkraRqCoYLVBio8+wnaRG6s6g4RiGWNPNfzsQmzARqtNu+kori9U
 Josx5X2AAMmV8jleMmxrAMlR+rBCxGtamC0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEIZir2Nf4nP9zgVKzGKJQM8/y+DZg4ifIUP/BMmPKvpnkyNSZ8IUi3+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQNLbPcflo6RjtxYxITqJt4E7FYc21uvr+g1
 hmAtoVwkzITXFXLdleHbG5NcrTqUcotpH43J3V0b12px2IiccCk66JGL8k7erwu9epCy/9oT
 qZaJ5XcU6oXEjmXqS4AaZTdrZB5cEj5jwy5ICf4MiM0eIRtRlKV94a8LBfv7iQHEgG+qdA6/
 ++7zgreTJdaH1ZiAc/aZeiB1VS0uXRByut+U1GReotYeVn28ZgsICv016dlL8YJIBTF5z2by
 wfJXktI+biT+9c4qYCbi7qFooGlF/pFMnBbR2SLv6yrMST6/3a4xdMSWui/Yj2ABnj//7+vZ
 LsJwqikYuEHhltDr6F1D61vkfAl/9LqqrJXklZkEXHMYwj5A79sOCDbj8xGt6kLzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4KRnOlj+6Q924KGDABdbMBS7gSBAKKd4bdE+y
 uA7tc9KswGyh3LG6DpdYvy4I4hUEkE9bg==
IronPort-HdrOrdr: A9a23:7FGXJq7UCRqEIlzOBgPXwM7XdLJyesId70hD6qhwISY6TiW9rb
 HLoB19726StN9xYgBEpTnuAsS9qB/nmaKdpLNhW4tKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFeaTN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54029962"
Date: Thu, 30 Sep 2021 17:29:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 1/2] automation: switch GitLab x86 smoke test to use
 PV 64bit binary
Message-ID: <YVXmArrCuK8oYrHr@perard>
References: <20210930161720.825098-1-anthony.perard@citrix.com>
 <20210930161720.825098-2-anthony.perard@citrix.com>
 <a01d951f-1078-2048-7f86-ed834bdcf76b@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a01d951f-1078-2048-7f86-ed834bdcf76b@citrix.com>

On Thu, Sep 30, 2021 at 05:20:31PM +0100, Andrew Cooper wrote:
> On 30/09/2021 17:17, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@gmail.com>
> >
> > Xen is now built without CONFIG_PV32 by default and thus test jobs
> > "qemu-smoke-x86-64-gcc" and "qemu-smoke-x86-64-clang" fails because
> > they are using XTF's "test-pv32pae-example" which is an hello word
> > 32bit PV guest.
> >
> > As we are looking for whether Xen boot or not with a quick smoke test,
> > we will use "test-pv64-example" instead, which is a hello word 64bit
> > PV guest.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> > ---
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> >  automation/scripts/qemu-smoke-x86-64.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
> > index 09152e3e9ca1..4b176c508dec 100755
> > --- a/automation/scripts/qemu-smoke-x86-64.sh
> > +++ b/automation/scripts/qemu-smoke-x86-64.sh
> > @@ -16,7 +16,7 @@ cd xtf && make -j$(nproc) && cd -
> >  
> >  case $variant in
> >      pvh) k=test-hvm32pae-example extra="dom0-iommu=none dom0=pvh" ;;
> 
> TBH, I'd be tempted to change to hvm64 here too for consistency.  I can
> fix on commit if you're happy.

Sound good to me, I haven't tested it, but I guess it should work.

Thanks,

-- 
Anthony PERARD

