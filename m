Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65137638805
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 11:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448151.705058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyWP6-0002al-Ar; Fri, 25 Nov 2022 10:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448151.705058; Fri, 25 Nov 2022 10:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyWP6-0002Yy-89; Fri, 25 Nov 2022 10:57:56 +0000
Received: by outflank-mailman (input) for mailman id 448151;
 Fri, 25 Nov 2022 10:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cj5J=3Z=citrix.com=prvs=321487ca2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oyWP4-0002Ys-E2
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 10:57:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00ba1499-6cb0-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 11:57:52 +0100 (CET)
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
X-Inumbo-ID: 00ba1499-6cb0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669373872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tm7rW6PWgwOdjKrjqgISOYUHk5pJ+R4i341Ww3r9px0=;
  b=GHHOwpPzEH+urVT1uj9YZX7n67+2Ka3+P8TJmA8u4WnDJuFfmfJQi1iO
   foIKUNCN0ZV+UiNRSwV/sy8nkUnX3zK7yTDjmHdZiK1Izo+/ChE4HvjK6
   /X0MG8cCarisWvCx9vXE0FrtgvS/H+PuKsnyKradlC6RD7ZT495Jnpox0
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85559696
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TePx36NPn9WIIGfvrR2ul8FynXyQoLVcMsEvi/4bfWQNrUon12YCz
 jYYWGuBOP6KYWShe9p0bYq2/UNS6sSAmIBhHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0somW0Jpy
 NoKEjMAUC7dgsjt7YvgbuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9KoHXGJQLzxjwS
 mTu5TjcJUsjaMKkxyuVylan1uzehwjZR9dHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwAOHx7fQ4g2ZLnMZVTMHY9sj3OcWSDowx
 xm2ltXmLTV1tfueTnf1y1uPhWrsY25PdzZEPHJaC1teizX+nG0tpj6eFPVELYintN74Jw+ux
 hrRgRFlo7pG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezO
 Cc/WisLvve/2UdGiocpC79d8+xwkcDd+S3ND5g5rrNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FL5f3VCpKVPU6lWDeqwIhPVgDn3BW+I8ubcqjk0TPPUS2OhZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8QWmKZNRW03wY8TXMmq9ZIJK7XZf2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:rQ6/q6Oisk3I4sBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.96,193,1665460800"; 
   d="scan'208";a="85559696"
Date: Fri, 25 Nov 2022 10:57:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Henry Wang <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework
 COPYING for installed Xen public header
Message-ID: <Y4CfpRN2KzeNOuiq@perard.uk.xensource.com>
References: <20221124164254.33476-1-anthony.perard@citrix.com>
 <c84ff394-cb16-937a-c2dc-d535d3887f4b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c84ff394-cb16-937a-c2dc-d535d3887f4b@suse.com>

On Fri, Nov 25, 2022 at 10:28:52AM +0100, Jan Beulich wrote:
> On 24.11.2022 17:42, Anthony PERARD wrote:
> > Use actual include directory used to install the public header in
> > COPYING file.
> > 
> > Also, move the input file out of "tools/include/xen/" because that
> > directory is removed on `make clean`.
> > 
> > We can't used ./configure because $includedir contain another
> > variable, so the change is done in Makefile.
> > 
> > Fixes: 4ea75e9a9058 ("Rework COPYING installed in /usr/include/xen/, due to several licences")
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> (with a question, perhaps just for my own education, at the end)

> > +	sed -e 's#@includedir@#$(includedir)/xen#g' xen.COPYING.in > xen/COPYING
> 
> Any particular reason for using -e here?

No, I just often use it, even when unnecessary.

Thanks,

-- 
Anthony PERARD

